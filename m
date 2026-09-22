Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B576C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHoCPwg3yKGYoepxE62TQiEAKgIIh9UVY9jZRidEOuw=; b=kcyIXLfGOmtW16iZfGLfyr3bGz
	I03g86cuX4KrR8sZ8+2yzTQ2zT5Wj/PK4Dzqfi4aN3v0IaTH6hva6N6c6eqLjKhJA+3W1C9H7r82P
	lsQF3oqHceU6PNvg3OuABKV82Cy4ztgs5IH15YKGtvo28DRFz3C56J/wleAeigGhgQRNkURSx/U/V
	42NkGzl7kIhWs/8p16CZn6a1oteFd53pRSgt1iuejdHjoIsL1trkMdMaLwPVrpFhtXCKGQqs66xuj
	g1ufOgtd646+fS+nCkB7vaG5ocKsjB2Ve4BagBb75VqKha65XYeAp/2yDevxnoxO2MBkPUzqneqpW
	Zg6g0AlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92U0-00000005qiQ-3zdk;
	Tue, 22 Sep 2026 15:32:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92Tt-00000005qeI-4AB2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:32:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjdNu898359
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SHoCPwg3yKGYoepxE62TQiEAKgIIh9UVY9jZRidEOuw=; b=RXCpsOKbcS1DLbaX
	DQTUgqXgUfSI/qXQtTiE0v6RCizspHNo90j1R5AfqDAhkGQmrnXqWSntnUibKOS3
	m6p6/SON5c6VVRd8oMxt5BNYZNLUTXoLX0UuQp+YmrAumGTElBLCc5dUNGCnSO1H
	78TQTLhE2lm+CDDB8DxAPsmxOQ8dHeKm7pKppPj7qmRWZbrBN9GpSRO9y+VzhV9L
	Iz19Sd6XfB8+w5scYUXXSXEQdQ41emEe+TlGlutdypIwAJ+5+ZprhLYmGL4nePZV
	b+dltydYmwBVdP98NpU9j0X91EyxEXbP+62YWjMUIK/0wieJfml4B5VDxSjRdtBg
	P9cQcw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybkgkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:32:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db3734d06dso73106405ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 08:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790091148; x=1790695948; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SHoCPwg3yKGYoepxE62TQiEAKgIIh9UVY9jZRidEOuw=;
        b=a8rR1BTQmgNkp8l0qr3co0ympzRzjUczqaoO6R79FEHFlBH5rmdmZUl7R1457R31EV
         cWtFKxiCegXgnvyuhy9gzOUOlj5noBrafIdIB08gUFMIQJXaM8ykAIMfXcC1QQrMBj1e
         eZw4Z5Td/BcFDxlI7ix9R2l+NPMxhIHYXTPJ4VXwJpcwIH4GTmR44pd8l71o7rew0JMp
         TOvJmTtuNvATsfQmflO9VYlQWxoZsVi1F4H7CNSsZ/eL439vyOQWLeLPgyApW7CRUn75
         tWNNyf4CNvuHUg4vaaQP4WmtkVQ9J2vtRuzv927r7yqt029PEYKQEuxWetNwqf0HI3ML
         oB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091148; x=1790695948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SHoCPwg3yKGYoepxE62TQiEAKgIIh9UVY9jZRidEOuw=;
        b=XLlNYYOG6UFFF2X5C0JDQDbQFpSQ83A1ZYeJza+oMXE44idLm9QSryr1l5vbHnq+mA
         WdTQS72kFkeoM3kr82l214lOOAnOR85XtVNZd2d4l7mbeuVWtpBQUBAYR0wU7hqsjqEu
         F7n4vXoWWgiHNKc6ukV91tmbznpouEND/UP0cD8L/1Uk2cWO9i6XJQDK0PPp9/zVrb8/
         vdUnFIyVDCZJOiiOzXab8gkZVL+LjE7yMixcBO8C5xRdjwFSVOD48yGUyc6ftkP6maMp
         /zWkjH7bED+Ut7Tz6eOZZeNGiQSrFXmwOGHHkxjRKseWD7GOY/65z2Ic9AsjpOVfE1sA
         BgTQ==
X-Forwarded-Encrypted: i=1; AKwUvByh+hFgrZ0jRpLJvhyQgaMhg/sowClCVB6glcUUQ8FFHa13joQ6VXZF0gC4ZcUo70DFokDNoCP5hP1aA75Xxp7N@lists.infradead.org
X-Gm-Message-State: AFuF++kjH+97LRu/uqdK3Ms0YAYEPpFPhnHn9i08kVjbprZsxW5UdMBS
	kLai3T6jdpfW5HDR3HUv4VeoOVTLmYhyXj9t5gRZuCXgFJj2hmR2fbgPjSKKe/ZEIm9h0RdbkkB
	k8P3XM9BVsc/tPmR7X1USNp+2Fti4guGjIljYmskH0YR7in9higT6y1+TcXdq7DWW5Q/jgVAZu3
	cfbA==
X-Gm-Gg: AYBFou0pGEuI4hV7BIkIMjQjp8OWjgdA1C3uknDxWl0YnaTfq47IkYYEqmxivQrf9b5
	6+p96Re8AH0ZHgScCXgF86PB4hqYIMpSUX7LdMU0zhzcnvsd2C+L+3VOaFK8jTVCTLRrDb5jAxt
	rilugT9M8w0Nksmm/NUO08+8NdMAOWD9FuG1rhOLL4bLiwR4ue9g2El4O1BS1jNNoben33CrJUQ
	jqrpgPLP4xua8vuxMJR8lseTgo940VxPddXWpSxcwDbOSHSWXDEMSgS+P3DpzIJpjhF4UK/R7Ec
	DnWrE96Oa7QVYN6OtvqncPiA1o8NXON85Qdm4zxog3VutDT3mRaA5eyGvKaCTOWvakM1GLXTY95
	kj9XaS278iixlaagqBbTHKGdgriRp5ChuUQg=
X-Received: by 2002:a17:903:230b:b0:2dd:c100:b2cf with SMTP id d9443c01a7336-2df60b7e85emr18775285ad.58.1790091147635;
        Tue, 22 Sep 2026 08:32:27 -0700 (PDT)
X-Received: by 2002:a17:903:230b:b0:2dd:c100:b2cf with SMTP id d9443c01a7336-2df60b7e85emr18774875ad.58.1790091147100;
        Tue, 22 Sep 2026 08:32:27 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d047c40sm12334945ad.50.2026.09.22.08.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:32:26 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 21:02:00 +0530
Subject: [PATCH v3 2/2] regulator: rpi-panel-v2: Add vcc-supply support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-rpi_reg-v3-2-9214321c4070@oss.qualcomm.com>
References: <20260922-rpi_reg-v3-0-9214321c4070@oss.qualcomm.com>
In-Reply-To: <20260922-rpi_reg-v3-0-9214321c4070@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790091133; l=1681;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=QWiYTLoT7AkiN37vBI/AE7LlJlRi/CqB8G17hwaEjjU=;
 b=oQQWORenSVY+VYcyM+kJov0+Ffqr2lgTDDLrH9fI2K9UIJo07yqAwPyOpFgNw1oORFzYPjuPa
 JvGHfCS+ClJDQhFfizHLxJlmJo+wDZuKHJTi9TEw5xsD0AHaZuU6raB
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab29f8c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RYO69U5GnIJllgjd4B4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: AVNGqOfPFiBzs0iEzXi5deuL5VDQRPFH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIyNiBTYWx0ZWRfXxiZoeQwDtBqI
 SgD4Tlwa9SiHX7t06kDlQfYps+c+gMRSHJJ5fx2pIwjZsbeAKBlSU5QE5Mof60AeJJU9T5Dp+jO
 zthYR02/OeVWX/hiLVQ7ntGj0p+9BZbJytn075U46kqOryPJMwyeP6bgRWVdAKN+Ft7vYFPy3Pp
 1jHoZuQJvk/Uzc2Yxz2jQ9dEsVgdBTV/Eiy9bsEYlTxZrvex0ddjuJlZks3FBrY2tRjo6VYokcx
 ZBURkiSKp9zCYLE/Wp/AnJ9ev9LOjUVFutP7jQBHV+KXEXIff0cbFHWjo+2PLXFXSOtSXRprWAa
 pCkwsRx0SQfkjsHabkXFfzCnDLeKZRaDVdy0lY+TmKBF1dujqSWyhjnNO7n0pf9QY3oCWADbr3I
 VBXfBAn3401h5KaqT8ZMbBYeiLNgWFIZkCZUCkXpELNdD2L9f9Q9xvBEdLi8mu6maWkxWKdHlhN
 3QhJ/d5Wu5ZAJOVX9eg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIyNiBTYWx0ZWRfX3CqRnsz47yWZ
 Y/6GKyue9poc8dA+pEnoQ+Dw7JXrm7urXqagPEPdZDb7zngdYCCSKAWJn5MDIaFR/OBLuUGRqnQ
 nKhb5eqPi2ogz5jJf6Rc9hbg7Yham8Q=
X-Proofpoint-GUID: AVNGqOfPFiBzs0iEzXi5deuL5VDQRPFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_083230_154897_ACC489FB 
X-CRM114-Status: GOOD (  19.22  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Raspberry Pi 7" touchscreen panel V2 MCU is powered from an external
power rail which has to be enabled before any I2C register access is
attempted. Use devm_regulator_get() to obtain the vcc supply and enable
it at the start of probe.

devm_regulator_get() returns a dummy regulator when the supply is not
described in the device tree, so device trees without a vcc-supply
property keep working as before.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 drivers/regulator/rpi-panel-v2-regulator.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulator/rpi-panel-v2-regulator.c
index 30b78aa75ee3..e54d675962e7 100644
--- a/drivers/regulator/rpi-panel-v2-regulator.c
+++ b/drivers/regulator/rpi-panel-v2-regulator.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/pwm.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 /* I2C registers of the microcontroller. */
 #define REG_ID		0x01
@@ -66,10 +67,21 @@ static int rpi_panel_v2_i2c_probe(struct i2c_client *i2c)
 		.parent		= &i2c->dev,
 		.reg_set_base	= REG_POWERON,
 	};
+	struct regulator *vcc;
 	struct regmap *regmap;
 	struct pwm_chip *pc;
 	int ret;
 
+	vcc = devm_regulator_get(&i2c->dev, "vcc");
+	if (IS_ERR(vcc))
+		return dev_err_probe(&i2c->dev, PTR_ERR(vcc),
+				     "Failed to get vcc supply\n");
+
+	ret = regulator_enable(vcc);
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret,
+				     "Failed to enable vcc supply\n");
+
 	pc = devm_pwmchip_alloc(&i2c->dev, 1, 0);
 	if (IS_ERR(pc))
 		return PTR_ERR(pc);

-- 
2.34.1



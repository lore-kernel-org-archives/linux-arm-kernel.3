Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7513FE98E0B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tkjt1CvCdql7jbfT8ajkPQtzV1KFX8BJmrR45NSdjo=; b=JBcrBjaxgVU+OwJxqHcVrF85hY
	aD6+xx4WXng1tpQHJm0tRHLt/W9ga9ya+3xumv/3NsJHWPkkZGSy63tmzhPjfHg038ygACtlOpGb+
	cVcYk4KcQlVHHjTFdyp1ic6vS0G36Uw22H02ACY2LfNwuh6+sHRCocP+Y84jnO6LneDmqsOV4KJG/
	aPCwaYByU7ksOESPatA1vPOc2s13DODYFPSww0Dvr/sK5ChbN9d/djKhg1NYS+4RqCsBy2OfLTR8k
	8mdL7VVgRX7qrEyWsCBPIZqyjTEcXXpwE07oj4+whSBpK9lS1NcyFmfAX5pLZNQ4cICXihKpHoeXj
	MQtDJKng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtT-0000000HU4x-26AC;
	Mon, 23 Feb 2026 09:06:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtK-0000000HU2A-2sQv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:06:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N5wiXw4101150
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4tkjt1CvCdql7jbfT8ajkPQtzV1KFX8BJmrR45NSdjo=; b=Eadl/oy99ixX+Irw
	Mw6rBWyk6+0xGz1YjnhR1h83EMiNdZIX61oSYTTgbqwlWVvuydiXAN2nwiyYQj0e
	fGncTBKLgHakQ+3yxzp0lnw0Kqv2Sa3vY0+vv5zMo7MjSEhNctdPK4fYF5K0I3km
	j9MrnaeP6avPVBMTR4etuiHed98B0OPmXnwztGhhJ8i8cbFuwrOLU/kLvmTG6y/3
	warZ/T4W15BP2Ig2kh42+Y3ld5eeeU1Wks65Sui/dN2tN0SkSX+44Hung92tgogd
	C9TdcjmUHhhebL4kjsFIyXDrMo+SfoeFDQQ9YtwQC5Rbj+Fgjg0gsVChKxYbbqGI
	5gCSNw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wbc2p7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-503342386c7so547201941cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837569; x=1772442369; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tkjt1CvCdql7jbfT8ajkPQtzV1KFX8BJmrR45NSdjo=;
        b=iW6ZYCfmN3+sVLrVE3sC42/uh27ulOZkpjdk8ClYGf9mr0WAkPgrj6SEEUrfc9ruPt
         gDfstwwbkeyOKOON8siBfNmPqJnUdoRWrsM+yJlaZPYzWb0LSa1XkEWf2NS9WTfsjPF3
         gYpgdEsDqdCxIxAZmokBh+Hr1/2tP30fpOHTwFDYrwwK3mrG1V6gCA4nbFcX7X7tB5Yo
         lkhxI5udjKTReWjmSssibGEaXVqvbzYj94DiFFELD/cPR/YtESc1W21I8vOTHANdEWhP
         BP88bIYgngiMBxx3AuP4jMR9kH9ig1ZSmD/sOHchx6c2jgppbqfyxRJjyYm6MfKJjwDb
         FGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837569; x=1772442369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4tkjt1CvCdql7jbfT8ajkPQtzV1KFX8BJmrR45NSdjo=;
        b=n8uWlVQr0mQ3mD45+xFb/iULVFhN1zhztoxc8h3rW8K8pYm1JWrIvOrd/jQEw6oW+Y
         7eGjS+dPTGSlp0XYuhWQVsVVwbd/foq4rvcNgpuL6DMRXv8uJPiUWoy+ilp466wyfDNv
         xvIzxKJ5rrdu5lzAH/b0gcx+B0k4sOngY4u+H/518fSWrL9UlHm7ssaLwdv/DjCiYF2m
         /ACg29axXy2jvyDp/qswzoJNfpc7NfOcf7Wmt6G9YudN+Ocq1cEb3UpScgTEuNfmaAiA
         ykZon0/aQKbzuYjWMxI/2ZCTPVzDjq1jCSYgkivyhlOtLxVzmOyf1Y1EXdHUCuCStA0j
         mZFw==
X-Forwarded-Encrypted: i=1; AJvYcCVTPLIQ3QJVvtnteLT0LU5xNGdczfPWp9bKfJI33vQ5kzstqAEjvDzO211xI/WDBYl3MbxGqzBAf01v1ljSPYAv@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp38yQGychgrd1idgTT1kmN09aX71NV13sO9e/0ARNe7IaSuuE
	6aAw5LZByk/zpKyFHJ5ep6btLXVR2slWzyxoRGxD1O3kNlRMqf0b4km5bOsGc6V9TG9iJ21DJHj
	O9bXkEdePxhOKeY8+TmzHBdkyfOt8iJESRSkXlit7TRUWeevJEEHF/DkjktSUA7I3uIH8pd87nE
	hjEA==
X-Gm-Gg: AZuq6aKxyk9owcRHme+mQWN1QQQbJPL3feihI9Dh3CfuPQUEk/Z87NKhH5FCPthQfwT
	Jho8U1ssSxxtqOta6WhHzYTBsGTraHRQPQRJFLQoRyBWf69HQUqxrpkkB+K6N3bIt1orwNYPq9Q
	FtaqHmv5L33mIpr3k7Jg9DlDTnFilu+LlISDVzco4DBHbEmxNT5tM8zS55SQ3YPjFGy//yOTdtS
	NBWUa5p1VwaoSdb2BSZ/KajIz0RcDSPcO5EB/+AewzTR0sqRSjEKdv04gV4Cvwask6YJMpf8Gz4
	lGDgzweJdZ/QiuNaA8ZukvwrXCk1bqvLUHuHkNqkjFD26kb08d7VWo9j9AtdV8IWm558m2cISaR
	3udOY59EJty7sWdZM0+xRJ78v8X/alb674g1FqC3ZLMMMJBH24kqq
X-Received: by 2002:a05:620a:2986:b0:8c5:310d:3b2d with SMTP id af79cd13be357-8cb8ca03e68mr1071110085a.33.1771837569221;
        Mon, 23 Feb 2026 01:06:09 -0800 (PST)
X-Received: by 2002:a05:620a:2986:b0:8c5:310d:3b2d with SMTP id af79cd13be357-8cb8ca03e68mr1071106585a.33.1771837568736;
        Mon, 23 Feb 2026 01:06:08 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:08 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:48 +0100
Subject: [PATCH v2 02/12] i2c: qcom-geni: set device parent and of_node
 through the adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-2-d78db0a6fcf7@oss.qualcomm.com>
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=q14XiC/EF5mMq9yShl9lco+1y+s7ckLltoYVG3d8oSg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBhxLArCtmmlE4gRC6CeGEzvDnbPvKlM97OaT
 prp2vCjynqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYcQAKCRAFnS7L/zaE
 wynfD/9nERsf8qMwPeM4IonodXdRsy+F64xQK/uJ8mfcnvZ7ZSWSuU3pDRsjoQDv4nAjW8Z9/Me
 SHXKyhu7lahHo5a/SFSde4mbEa/ZxhLn7prdnZv4fcEfiMiOMd8iLOHm/J6KiothsVFfhV5khGi
 7JeEH1JlSiyQsO1W+QsQ/cvXeyYjWUxQg42KyPDMfqn8Zu97Vm+ytckEQNKQnjQ8B8Yf+tf0jnQ
 LqrucTueZ3rYk2i+SRB8fFmC+cSQxO3gfUJCPowDsROzIKHlG6ANnCNw31IBb0KfvzYnqsCm7oX
 id0Plrm1YjxV3inA76Dl4Swu14UqUX8C78Xm41wBD6JVYkfzuewMmNLzCtbW5wj84Y+461lTBns
 ERoDa4DNFoDRhrZlsnivGFpW+deCli/KIqn193yageDShkXqk1E6O8/wMYKMRq/h/JjHml2c6Y8
 mxi3Jty4CDeG2zPkd4Kxs2P7cNUBe07XoM1i9b/X2z38tI7nklLkL/ciyoYbCdJb1fJoT1+z25P
 PUXMf0/Rp4RbJZLzyEwM+2dHiUJLfu7qbFPhUDHiZTjXK0CjZ0ol19qi9OSS8NapU90EqB1KQyG
 StFY/1gRv1rOXL81boZNNJNWLYXe84MuRjktMGzdPXegmAFX5gU0VDPtI6a8CWXOxLHMdHfIUaA
 zBF6WRa/X+6Bv/w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: ZQ0rtS_-bXyqD9nQylpagnLMkQ0XYONy
X-Authority-Analysis: v=2.4 cv=UZlciaSN c=1 sm=1 tr=0 ts=699c1882 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=GyXxqrRC-9zytgsE6zAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ZQ0rtS_-bXyqD9nQylpagnLMkQ0XYONy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX3HWZKWtTHskG
 0dxfE7nJr69I3Tnlk7gPiO55Y/8nehQB+8NI3POp3jY8IkukozBXcUAdSiArEyWl/jago/PAgxm
 WyqJr599cWXsDXr1hA2MH6OrEIS6Z/PF4MjBCgcoTb5w1SquCiwWK9kx/p7k35fA2pOfOLfC0Va
 BpqePSzAJlZpHYmSo8qepmH2u8tFDWdo7yhoJIUxoLjvZjjdoarfeKZnzn0IL8ph0QImPpTITjF
 pjB9HmMIvFfBVelOtoHn+OXiwszW8fgnP8AFirpiM7/pw5HS6rfJCtL4kq90BBDg/UQSngPcKD0
 wGq0zVQtsJAb2FyOLdLYKMMAZTy4e13eb+V1r/ihepMHqNw87+tc/J0+4f9WCKAK98HeZs2YnV6
 +AOWZfr/BjYiKkhT2com/DWGibLPgPlxNcgXlBQFCrAYq6J+PjAG+0qZibZNumYUskduSbVVuD1
 Z4OYH76oaH0Tb9C91zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010610_721344_809AA9CA 
X-CRM114-Status: GOOD (  16.12  )
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

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a4acb78fafb669f49e71f739764b9779617f0cb5..d930d198518718aa107819cfebadb9e32a1da377 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1039,8 +1039,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 				     "Request_irq failed: %d\n", gi2c->irq);
 
 	i2c_set_adapdata(&gi2c->adap, gi2c);
-	gi2c->adap.dev.parent = dev;
-	gi2c->adap.dev.of_node = dev->of_node;
+	gi2c->adap.parent = dev;
+	gi2c->adap.of_node = dev->of_node;
 	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
 	ret = geni_icc_get(&gi2c->se, desc ? desc->icc_ddr : "qup-memory");

-- 
2.47.3



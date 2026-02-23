Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C75BE98E0B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3PO5AtSucKAso++k1EL0+rR2+HTJk9Mvc5WVuDOn4oE=; b=gwMj55ee47VbTLQmvYRsPVywcd
	rzIU7QXBAqlcXWDqtFphMmlw2ADo24yz8GmsbTZ3ecLCwn0+BNZPhxToO6M0k4rpIaSS4JEJ0t9cR
	9GvRFWmdOAu7icxsjAL6qJq7XaHfRuDJA/s4KK1kdqejQFFppzrdHhv+jUc9VxfaImzBvYLrHb36X
	1+4XqS5FOY/zURY2KF1EHe8uY9xDGEhg6xqoxz2Aet/eJzeuY2c21ch0Ma2TGpkU9u/0pZxiVZ9xJ
	Wsk+/pXFx1PMPhbDr3ICXdUI5pEMUTF8TLRuLvCRhPfyz8fy+knWlRnsfO/hxUMYoRzm97kw3X6pU
	d+osrb/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtL-0000000HU2p-3HHG;
	Mon, 23 Feb 2026 09:06:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtI-0000000HU1I-3u0U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:06:10 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N82OZ5891811
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3PO5AtSucKAso++k1EL0+rR2+HTJk9Mvc5WVuDOn4oE=; b=ahskkLVjml4qs9Rs
	abCFDBueRJNKtfpxcsZThuGyOucLq3meLgxH0ube6aVttmNU36suWaOf44Bv2nQQ
	1pfOdalqzdw3RfKy++ZA/7fzftLPvTlNshwRP2387r+aukqiXBCG9y6hee3cY+nN
	Sk1V7J6kgBT9xOjGEIrrtzUqQHo/rGA9QeAUArWMdsojv2ZNB59Iy0HOMSf8qeDF
	Iskx/NWnpwlizui7cHAx9aLM9oogcOA6rth7ibovhjsGOQObyv6Z1msX7oSOjdiB
	U5tTLVDtTA3ostC7ZtJ5jyp75duyFqgqkPVr8iwxurCyrQEUqe59XxHCPXDqcrXG
	MgPrHQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wbc2nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-894709fbae5so519229186d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837567; x=1772442367; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3PO5AtSucKAso++k1EL0+rR2+HTJk9Mvc5WVuDOn4oE=;
        b=C3fF6NyPQktqS9fSikDVOo3lwUgkWI7hS6LI8MaPLOARkbF/KNaAJEMN0KRCvHTuyr
         X8z5GT3WvqTNUEGTt2kzZWbWZzicb1iU8buyUIhVGxdK3u2OG7+RFRLDTmeZ67a3af9j
         4nC+51PaVbO/4VNhJ6Efi2xdYo/zWAo57Ml/It84LnQjUynZ8fZbE25Wm8ToO/jI9ceu
         iSNlGTRko76j0R5C2Yi1hk9+NiCFoU/k64l/WfT9VRtRR66PwFyXRPEPmoxQVgUGmZvT
         DQmKedpAHCUuae+DxQ7uwK/YtkkwPoNB1JJ8Eesg0AQzkZmWNrziqmsdVwzroTAyE0BX
         VG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837567; x=1772442367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3PO5AtSucKAso++k1EL0+rR2+HTJk9Mvc5WVuDOn4oE=;
        b=mdXUOmq/KGF9FNb0ENfQpVE4YGxZMUC3S2GaNE+1HfZahdnHXFSMCrLRRTB314b/3H
         B1BCz1d7mvnAsNXqLkLacQ1AYTxDLD9NJsUKL6a830PQaLGVAUlI5wvWwWLNqFfaC0hp
         jYVOTuQQfz+nj6Jmp7WUb738FuPv+GJ8Q/0IlSEE6y6EVk+CfSQfEwvIIJx8oUaMigpC
         p+Wy5T66eZb96rSiswlUwug/QGuMFIPeh4XYCW0ClAzQ0WVGQli+e/Xd7gWP8IYiojCP
         Gt1hbwIZlzDEH/XYy8bDEFTKxuzJDfs07CwsoRPeeuncdxs1Cmy2R4FLr4vUB3E2ndEu
         Te+g==
X-Forwarded-Encrypted: i=1; AJvYcCUCzL2xuKEimf2eLDXMRmTuOi9Za2jxSN9KqAoQ/fnYL/JeztexKemx2/8N+Rx5oZnLpX/WkShikCDKovExlmfA@lists.infradead.org
X-Gm-Message-State: AOJu0YzmAEdNj0pEOT1/aNzJ3KdntYDx0pVAknj9v2sWEbFumV4WNZVp
	N1j6gYav5ljiVQ/y5IgnG6UFGyzkm5tJjR0hbSaktZgc1mJbUz8QjUZLWP6Pg6DXTckH1lICP/x
	10B48jzyL/JkT0O+g3HXELT0mjpsC9PgwOGHg+wZFuWdL9kfs3ZJ7rzAEaW9pV0xdZeQtts2xgk
	fkPA==
X-Gm-Gg: AZuq6aImUUO1Lnjqaua5sks40b9Owg/YQ8atDqDwL/q20ZD5Lx9g67O+mrtcUWHhZJa
	7xm1wrXwNtYVMa7BZh00CY2wntQAnb7ZcupvCZDA2/2x3OS6aVZ2ylW73Om5mbPWkmlq2xyN4BI
	nh7laNKqFMGQLt+4n8mpzTSCOMX/+Oq5IHEVzA2m5QBs6g0wMAUFKUHu5Kniw4BCebXSsaQORps
	wo42GD3te4IJZHrKn4i8kbD2DAr6Wl2fp8LYYshBNJ7tSLCD98SsBQAxH9iw2TMViVdKLCkAI5X
	EZeSzYp9YucphTvHjU0ikw9EK9iFFR5SWwz/iUktoyf59rj+xu3GDLGuXzTZoRohouDr4ObMJ/t
	LRznhXpI/55VDLCxQkFGCZ7zw+JifYCtETVtIHOEwKsFjsCws0rXz
X-Received: by 2002:a05:620a:199b:b0:8c6:b14e:6569 with SMTP id af79cd13be357-8cb8ca94d09mr1041099185a.79.1771837567282;
        Mon, 23 Feb 2026 01:06:07 -0800 (PST)
X-Received: by 2002:a05:620a:199b:b0:8c6:b14e:6569 with SMTP id af79cd13be357-8cb8ca94d09mr1041095585a.79.1771837566841;
        Mon, 23 Feb 2026 01:06:06 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:47 +0100
Subject: [PATCH v2 01/12] i2c: allow setting the parent device and OF node
 through the adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-1-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=w5QiyKZ/sytBbiuy/pPV3fyHy9AlIC8Mm/XcZ8uxqD4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBhwPaKoFJzyHUF6OMpnWGL6DX+ETQlRO5Y8c
 Ld6Qx2JUB6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYcAAKCRAFnS7L/zaE
 w/suD/4iFUyy0Dy49wTZDnpa2IU80l3NwdwALBtTFaokDwHgcweeaZLnFS+uMukTPoA6AdldIU6
 Xh4ZwjycC2TaenfGxYlTYVfa5ORU+p7HYVK0s6JQgqEhaXYdLLoxW2wC0VPADhBaNTKDgKjjyhu
 rmn5Has0Jd2hjrBY+aV96wRmo4/gieVqjUGAa1ClHeWOCy99MMh39cnk0y+MwKbQe24DIH0T/dq
 zQ3TSL8mqDXnKtnas9OqHTj0FEyC6uyiytZ+Zr4aezeellH2itHJzzI8Jy2y0BfRSkivHURH0xi
 VWmPtgxSeZs/nGjgUfAglbxQ7shfCBLe4jvM3sB+pwQIkucLvoYAmIsezdq4UrtRjy2Dq4iKvjz
 fCSlFthKTFiU/egqBN3hYrjM8ZxVkeT8PyTIf9ar4sQHLWHskPP2L+SGJjK6aEuVMorXFC3KMx/
 UxFIVf25usT/B/LO2Nj2evp9DYvPdMiOBLKKSP3O7zHjrYATLcdyDWew4Ps4033GbN7hK62/tgz
 3Q3aQrO1e/Vj2dQNHSETTjc0RefDW0cNSPbQbKoEpBbad4m1l6PsaVvZTw8px5OViT/l5ZKU6Ui
 J1+wlOaLdLrFzwfvmmWzxVt15PQWip1vRosoqASWqdOzpUvj2zAjxnzF7hszS1+6h31ZgPaMma8
 Iyx96xyVHty1QFw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: CQP6zd_C6HzYHrtay334b6Qc2_DjaNcq
X-Authority-Analysis: v=2.4 cv=UZlciaSN c=1 sm=1 tr=0 ts=699c1880 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=GqsknrqNkdw30Ab-NAsA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: CQP6zd_C6HzYHrtay334b6Qc2_DjaNcq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX0paiJX6y7Ljg
 nv/0Ff5oICoKlR6p4iCtVB3Bo6tp0mAw0mMGy3Nkzq1F0Ps62DGW/rBD2t6gzGKmI6Feupeszuc
 hyx/uV7unM/DcHG6r/bnCeJ1LaZfhTW6yiFTCmmHHSV55RLBXrM/CyDoPZWH+XzvekxCRc2/479
 Vbd0ANgeuAHdmh1hRjWnmVtM/DadwmOIvrQ1H6SsSQgWyzNHOwSEiORXC3QaAHDPu4J+JLwn34q
 LvCIqKyPat/SKeE4xlSgTfwuei3CmyuDEdNmXBZhkhmOPkU2B10ZfHCIjwy35mtBXtsOT3/uFBK
 C9b5K0vTYkSL5OSlovn6G0+sgjPL0Hev0UJKi5gvPkeJkttwO8T/SOl1xVMOoTQzmAodMuNdUut
 1ehXo1Q8SZFRxWIcZvfw+mjHMItlNsTxccAkwC5+xFZBvyyPuXaxXuqd+1fSFgDjnGaRtPIMuPs
 fyjwduQfNrKBXbMr5CA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010609_034269_A96395FE 
X-CRM114-Status: GOOD (  16.06  )
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

In order to stop i2c bus drivers from dereferencing the struct device
embedded in struct i2c_adapter, let's allow configuring the parent
device and OF-node of the adapter directly through dedicated fields.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/i2c-core-base.c | 5 +++++
 include/linux/i2c.h         | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 9c46147e3506d15d53b9b7d6b592709de56e41b9..dd8cec9b04c64b8340d20e018ab5ba28f1f7f5c9 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1561,6 +1561,11 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	adap->dev.type = &i2c_adapter_type;
 	device_initialize(&adap->dev);
 
+	if (!adap->dev.parent)
+		adap->dev.parent = adap->parent;
+	if (!adap->dev.of_node)
+		adap->dev.of_node = adap->of_node;
+
 	/*
 	 * This adapter can be used as a parent immediately after device_add(),
 	 * setup runtime-pm (especially ignore-children) before hand.
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c85ee1665395c07345faafd8e2fca..72677f29aff161530bc3c497d1e07144a44eb9e4 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -761,6 +761,10 @@ struct i2c_adapter {
 	struct irq_domain *host_notify_domain;
 	struct regulator *bus_regulator;
 
+	/* Device configuration. */
+	struct device *parent;
+	struct device_node *of_node;
+
 	struct dentry *debugfs;
 
 	/* 7bit address space */

-- 
2.47.3



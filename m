Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A70BC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 05:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Ml4Zr8T8w/TDmVLa78Ik/qhJKpgMAmTtlHs201KjIE=; b=vn1otVxYhNgxUuD3rRALMpGt97
	Sg3RIyrLccW0yvCgreWn+GpbkT3hn8RGQkdD77t7iPhxc0HHMD748akQvyeu3HmpXr1ucwi1B49KC
	Y72bUsJHmLIOwe0Xg6LVZ2g6xTexW4G7rIcVAHeYeV2Li9GpQGB0K8GWlxvfkNl4JsbZDrsxhNRkn
	fs0GMOMw7KbaGwRMnkl3JsBnHuzOCLWC6oWU1U4o9TMg1dJqwYX8G+PhBx4QjWUFPxq14wTou5DU0
	OrUsdMhHSDDqxZa9yA3B/Rh7QFF7sdDIvHDAb9wghVglCYR4JYVcGaGcJwnvhIQTx8ScRfa/ae+vp
	H+KWuQ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SBj-00000005y0R-0ZTP;
	Mon, 07 Sep 2026 05:46:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SBh-00000005xyT-0cuu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 05:46:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873kqaD2219150
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 05:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Ml4Zr8T8w/TDmVLa78Ik/qhJKpgMAmTtlHs201KjIE=; b=NPlBoK8h0mynd9mq
	4YJSOleCwCJWEr5/+aLxhPSrsmSVoJQarbKlm9mzaeDTHLcW9AjehO/v05J+KNiJ
	cpV8zc1WcR7FIOmw4SqRZpLURWvYDhoBeL6ftfyL20P3UhQP56u0MnnfHgjjyluG
	lpsMkgVUOd4Iw6XPuwRYDLpS/k6F3payT9bAq+JylmIvU4wCEBsS2hiGmvtiZEvk
	NF0eBoTm25YibJeN4kjITrO39+81p4HTuZItooxfW2LbI3iNgwdVLctMho0NsGte
	/B9fvxf8O64eiKMZiDm0r5GaBwjOtu5hvMpQtvMio+NPT2XapdZWTKy9uRkwEcOF
	Ckzd8g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggcca50hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:46:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39533bb224cso4449632a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 22:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788759996; x=1789364796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Ml4Zr8T8w/TDmVLa78Ik/qhJKpgMAmTtlHs201KjIE=;
        b=U9Q3ulgwJcETSrxhy2kjafv0vZE8Xv8J0FbNDWX/pekgRvq7Mwon4ZpLyymTEl9rTw
         rLExpBwpG5488BoVLHwiPgdDZbeGCUZ2QAsa1LlKSR0/f/1FSeUHlLKAUoVYF+iiL1Gi
         xTT6PB7omJzX1RUlc1mT5A7rkaWFvedJtMWX/CrjVfGEwzGy485Fy2fVzVo0giR0fC87
         esoPKxNUt3VbjyLv4i2u6B4AlrIemuuNS1jswCZ9GYf7rGq4yLvLPzJD8/zV/eayyXGv
         fIfi39+89ZgFKkeq/+LstBUunu3iVEPX3cad4iilPqngGOA4kTMGK5IW22cQodCTzeMt
         NO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759996; x=1789364796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ml4Zr8T8w/TDmVLa78Ik/qhJKpgMAmTtlHs201KjIE=;
        b=mIxgbFikt7D56WkSGq6SoyrkjK6I0Pk1ouVETj2JbrFfERft/vYD7p8hRKMYtFhzcs
         Z6pyf+P7W2dq3gA9/YBJOrJxrc9I4AfL+Q4keWEH1rCUpKiI5NOU30orI6z73NpTAdsg
         OITDM31/hn9ev7hFYFoM7XRUF5npI4+yg03Wtv0yxj5IMb4wVhHclMtv79tpv8HBl0fw
         WCHoLruF4E7TMvtpUQJhXI2uZDKpdDjjLwnkJ6b3/9KTGhe+r2vss1OjPlxljGP06DcV
         OjnMB1Xt5fbWz0fFrcWeCa7Gu72DQdHMvJASqNPbw/OjvFpa0FDEPWbw6ezYk24aHALK
         NZ2g==
X-Forwarded-Encrypted: i=1; AKwUvBzgzFhhGOzrW5vgdGuclXwIKzxOlq70JnUriwalzKdWoJAy2eVuRjx/xNRCQ5hBgRzyR3+OVKLGefnaWdvgtUF3@lists.infradead.org
X-Gm-Message-State: AFuF++lGE1UKfq3e2XXrhnmyP+F24Q+mbd7e3s7nKB4Xq6q+l3xCd6MP
	Pc3iijveDFG65MvaWTDUk63fHvEfeN8F9H/VPUceTZ2fmMXwpbsujFfdWgOLjpzdoqGss8f6Axz
	AEwAgdSQvH8MH5pEt3YSfF5wpwz2uzH3+bGR11kEVoragIFJF1jn1edAVkE08IkvD0tNNV17gE1
	3bBA==
X-Gm-Gg: AYBFou1tIKKICp/dp4EaiCAFEz+XvmIVPul3k+ApWymAHEWMfsDta+LyagZZv8pwRqR
	3jUmtJauhZ2ZbMGqF9yvI/oeWiH5ybImuxTjWEMgSGBF+0X8WLiv1v+GKsGJm7LVT8VPoK0jm+5
	oRc8t1vnoJ4XCTurg8dGdPkC7IfDgaMHPuAbDyNBtkIyx3n85RDEsR2opW1azK7QvDrFGMLbZAp
	cW9YMwYYVRmyD2gIszcIDmd5QbyBhM01ZrB2fW1ubeRT5LH8GqALSF2vTCI6K6XCQThHexxM7k2
	qPOTe5C7lz5xdJi4gzGqAlwK8GOjIGGSR2Gziu4fsdnZhB1PJIxH1gVoLFrAY8Hd5NcorZWMXqC
	RmmmsF0JugcIMNyUxk1XTr3whW0Uo1L2KLwXI
X-Received: by 2002:a17:90b:3b8d:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39b2624f10amr30855612a91.22.1788759995945;
        Sun, 06 Sep 2026 22:46:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8d:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39b2624f10amr30855586a91.22.1788759995515;
        Sun, 06 Sep 2026 22:46:35 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm24022589eec.22.2026.09.06.22.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:46:35 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 11:16:08 +0530
Subject: [PATCH v2 2/2] regulator: rpi-panel-v2: Add required vcc-supply
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788759980; l=1489;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=rL0frKHxgnmCItVj9IJ67HgoHPnZ3HbF9GZQ+/YiYjw=;
 b=VQFs6XoU58lnpmyWscfaTZVmMbtHPpwPPRNycQpO7D3W2XAg8qJ6UqWM1apJfX7GzZjDZSxjW
 XaHkw5kMk5sBNt22mxtR3UZnIOUM09SuTnpjRYEjsegYfJn6NF1NxMm
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-GUID: PdyvxooBJAumLYft66POLGc6-8n54QiU
X-Authority-Analysis: v=2.4 cv=EJo2FVZC c=1 sm=1 tr=0 ts=6a9e4fbc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fDsZdG4RzIHTu_4XfosA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: PdyvxooBJAumLYft66POLGc6-8n54QiU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2MCBTYWx0ZWRfX8wchdU/DZcPd
 cROA2vLVX17yGeJCFaS/XgQXjsFa+FAp1WgQrq9oWh+rnOKIIH1MfVdRso4qCTDelAQo0wI6xax
 Wx4el6eYoMivv5QkcD39LcK/SJofv/SIZVgltEQr0FnBiSLlJ2mej/3xbcSMoaqsluW7ukd8+69
 lFURmGdFBf3l6kebSotoxQKJn/cEKmlYtIfvbk/lqBNpxc94RMhD7FqgCEkmxummHzFcdm+f7YT
 v8h4NjfO3TF6ni2IYtKj66C3w9Hn/W0o9THIBLgSBm2dowQYG1ImMDE2fbMMGnYzOMfxr/Se1wR
 1ZNjB7/753syAh/8NB6VOYFJeeFw6k2kUnEy3xOxinMQ/E6up/A2qhtBuQoV63a7TnTm2duUJkH
 PIKGFMbJY6veuhROJeKkSYIw4PTjLH4tGVKihIodZGI/Mo+hxQfSdSa4HKDLD4qwg0tQqEQvs9r
 1DxQoAC9mddazgQSmcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2MCBTYWx0ZWRfX/pf5jo4VqZYF
 o0pQ9qZT1+qFzg5Ycdmph+EGVSbuR0VW3NaGC9MjDRsT8N1/vTZzCqTUr3S44qaZUVoRIL8RT3p
 1b5WBtsph+5wX8834jz8XeU5yFe3YKI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_224637_205885_4A913023 
X-CRM114-Status: GOOD (  16.63  )
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

The Raspberry Pi 7" touchscreen panel V2 MCU requires an external power
rail to be enabled before any I2C register access is attempted. Use
devm_regulator_get() to obtain the vcc supply and enable it at the
start of probe.

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



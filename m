Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4F9C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 14:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CcA21w3/sZIwoJ8o6e+c2vyopqAU1eR1GmGZyGN0FB8=; b=F2UnI67Jiek5M5qCL59KZ0imyX
	rBzC9z1MQmIG+e9Y5hCzh3LTNDLJ6YN+LECmeIy1iNrp7NKqL864gLZNsVmn0T3u+YaAs6lyIpmBy
	IUDdZviXshQsADxE1fjCmm7Ran5u6hvaoTwGXCFjrEHVC+83lfbElWbbvXJKKWZxV9essrCmmEacI
	2aFRdg6bMy8eJBV/p0EH8ylBYKh5YnGq16XKZs3/dySVrJc8WDLe6Z1H6R98z1jFV/qlFaOidT1ih
	ysdDNd3noEoPbFHE/RegkA2bH4LaVR0BtsLih60vZ6W/cme+aeQhDhhpI7UB7XhJDHfhLL5Y5EEiI
	ysu33TSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqWuE-0000000FhTv-2lFS;
	Sun, 02 Aug 2026 14:11:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqWuB-0000000FhSr-3k3t
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 14:11:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6b971666624
	for <linux-arm-kernel@lists.infradead.org>; Sun, 2 Aug 2026 14:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CcA21w3/sZIwoJ8o6e+c2v
	yopqAU1eR1GmGZyGN0FB8=; b=pA9c8GFqUZd3LtzbaTmeHPbX9uiJiQD8gh8Op+
	UEgsMmrOyr9n5RC5OQFnjfx9yQ1CGviK13rU5cLiZMgMLuGaOPG4EyI9UagwSL0q
	f4xamCYxJaUVOPmCEGRU38vIXT4Zopv1/iWPpeP8M6Kx86PakXAyxl4eJlC67c7C
	H3isRpuaKtwyw+yyDTdewcIjiVDW/wuJANCjKnUZL/H3Elcq1XyZ9wgXF7hxPcae
	yZyp5tM2QhLBWEoSRfvijurXwvh6Yq99rfsjEa0acLjiU0e/op7vgDY0kIHa68nR
	6/kYp+KvF9PyYcS9X41lRcoTC09UdzVMjXEu2AbDGxgU/VlA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs911axcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 14:11:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso2605327a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 07:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785679866; x=1786284666; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CcA21w3/sZIwoJ8o6e+c2vyopqAU1eR1GmGZyGN0FB8=;
        b=Q49VTczYdY/qHN/707XxLJr164w26ppNbKHtfY3i55Z9s4vTZaHQpeQFaqVr0vqR6k
         OuvXlcM197UzQSnvIMpYwzR42EhsLX7Y6HEqapHGCUjyS6rL3mQDMVxyFv5VBXdX1EUT
         wqDqZK32QjwkWFNPHK0JJX6H9OtC8R7nqTJi2xWLV2aNibvn1Z7lDcfOsND8ny+LdxTS
         DowqeyKXxaO9gS2Bc2+BCFeQKfHTy38utDmwaeWnlIuHjiB2nw6vlpUIb9RROT/pngS2
         b4MEBqCKBaV2gWU/vJ1l2r2bYabbx4CzwfuIJfB1jF1ylzfUrng5v3VGfWjM/+u7Eb6u
         IIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785679866; x=1786284666;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CcA21w3/sZIwoJ8o6e+c2vyopqAU1eR1GmGZyGN0FB8=;
        b=MdffTXIZMAOVW5jQ0oDm8CYwsiM8OygONXTJQZ2+P3Jz8sJCtmlD0H8dNHBo/lkW26
         vYbYtFRLqcSRSzNDSTf2r4vH6V53JFwENVI6Cq6s5GtYk5kUwx467x4poFDJSBuE26iu
         WZ6HlKMR6KTsgpNBmQGfP4oldiyBEi8mAv99VE6uGLikuuogD94eSKVGIR9Rg0Vmo4uY
         i1jJ2qpKQd+ahaHBzNAjiTJgSonZGpx1/ErUEdKKHqIbAobtGRSt00cM8RkIUt6BKrrj
         4xue8zxfMtPOmiJZuM8Rjoki/i4uu0MZGN4XAwRI8V40QP0vcHxUs73YhaxkIU+j5ML0
         2pww==
X-Forwarded-Encrypted: i=1; AHgh+Rp/Kn0v4HM6s5lD/ELmTIa6mFgCmU2yROE7Y/6b7CfakOkDX8E0VNxJWFpSLr+Upaw8NOQfMxFEKy5kLlPh3qwI@lists.infradead.org
X-Gm-Message-State: AOJu0YwyM15AEJZaJ3ziyhgRfjoZULW8GHShOHumHV+0ykK2DR9p+s7g
	e1kwTuo0uIQIyN1DNBOMUFC1a/BJDLzmAPZJneRuApc7reo8Z4W5ZPVE7ZYHG9RrAwkjCYPjl8J
	Wumu+/Vv0VZBnG8/FP86egOi94i4ONFntl6NMcCq+TJcS3pa5L8IzG0XmP+z9qi1mOPgfexfX9D
	bjVg==
X-Gm-Gg: AR+sD11t2VWIr4FxjXe36tmFUYE7OAtJY2G9tt9NoqMzQTxAKXv52Ho18RZuupOXOSd
	TA9w0uEkIW1xerPjOOFgV5+nlbvhXxA/dRWjr6ItWMcEeVcW39oItQ2mP6bWzh1ShghO5L5dmoh
	k06ixobGg4O5mO0JHBWz9Wp4BoWfCXqdg9BbRzkURcrfppB5c/gFGIvviBx99iiMHoCWLqVMEqw
	2N0vghfezZtRX3p1sOqzOz/txitsqH1cCsXXFmaJL6NHwO+1CWvm8NgBrdjXfLzAwqMK9VWQdA3
	cPd3ZXlYdM+nS390t4JwXwgfRa2uhZiKeJPR9AWJlPHbp7qOqJZxTpnGp4OmtkuA2acgx/KhfHX
	mfzIo0zXuAmweXD+ZfaN3a/d1JxGa
X-Received: by 2002:a17:90b:5627:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-38fbc58d37fmr5602083a91.38.1785679866360;
        Sun, 02 Aug 2026 07:11:06 -0700 (PDT)
X-Received: by 2002:a17:90b:5627:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-38fbc58d37fmr5602036a91.38.1785679865853;
        Sun, 02 Aug 2026 07:11:05 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18d9c6sm28626151eec.30.2026.08.02.07.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 07:11:05 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 19:40:35 +0530
Subject: [PATCH] gpio: Use IRQ trigger mask helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-b4b4-irq-trigger-mask-gpio-v1-1-948973636c84@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANpPb2oC/yXMwQqDMAwA0F+RnBeonRTZr4wdTI01ytQlbgzEf
 7dux3d5GxirsMGt2ED5IybzlFFeCoh9MyVGabPBOx9c7TxSRRWKvnBVSYkVn42NmBaZsYzXLgS
 KrQ8EOViUO/n+8vvjb3vTwHE9R9j3AxlJmw9+AAAA
X-Change-ID: 20260802-b4b4-irq-trigger-mask-gpio-1c3f66bcd26b
To: Keerthy <j-keerthy@ti.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
        linux-omap@vger.kernel.org, linux-unisoc@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785679857; l=10843;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=kmNNPLpqsde0L4mq3OnecKZCCNZLcryG1pWcz1C+eAk=;
 b=nQReNWb+UmnkXw/zketYQXUdCtGRweCEgZnr9tCDL9XvXxXXhw2bFFqE+AU8ZSuBCe1mtSqzE
 g9APKKoxQXzA17eSkRGAjhB9BUwLChbdS/SkdcENB32PTxTIQtPKrIf
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDEyNSBTYWx0ZWRfXzY6935yDyxe1
 pGtW4qKFK2owK65D2MAf+3sCXnTcEgNMiuXpa45rOsUXXiun92RSbcXGBRO1nYdqo7czTEOhkXH
 iXi0CSFixUo618SIM12oWOf9B3WKHL0=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a6f4ffb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=UPyg-B154qBqbsG8PrAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 09YNO1ZymSY0RPDFjAtkTaq7AlpdxOQo
X-Proofpoint-ORIG-GUID: 09YNO1ZymSY0RPDFjAtkTaq7AlpdxOQo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDEyNSBTYWx0ZWRfX0Tx/Mn7XvzzL
 +lj/xiW5EIhf5Hl8T5/VtBpxxD77RqyZOuNmVpit40dix9n+y85yQDH7+/F9hPE4QOr3axbd7lr
 4sGG8ibWAkLR3CmlshwhBEe4rAsSIjV7WfGPBuPNTPH53fE1Qk4KnLrqML6/ldDfcWQdQtXCVU6
 HYF3VGGshxw+ZUcy/iotxbRNGPSCzK4Pbuuckqc5sbh4APQ/I5/8x/9lbMjWBFE50l2m5Z6WD5x
 Ni/ISYUQiy2Fx8QzkqNFB2x7DAEwJTmDN2sbuFJIOLZSasq+EIfhjfrB+o68jIANnV7XECpv7VJ
 uRV/BgsfvmVAtd/XbpNLlxrZruDLttYsCUSQZowIvVyvIMjpL9qShbXxQG1YF0HAbcdAXw8PebH
 gpbUb5S6+mWexedzyTU/46YkwwyqUcXRl0las7PG1Nun4rz8v3/S6ZUsVURaU8I7v8Zu4qk9/lY
 k/YrgaSbCC0PaLJ2LQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608020125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_071107_968365_5E733451 
X-CRM114-Status: GOOD (  19.33  )
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

Use IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH instead of open-coded
trigger type combinations in irqchip callbacks.

No functional change intended.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/gpio/gpio-davinci.c    | 8 ++++----
 drivers/gpio/gpio-mt7621.c     | 2 +-
 drivers/gpio/gpio-mvebu.c      | 4 ++--
 drivers/gpio/gpio-mxs.c        | 4 ++--
 drivers/gpio/gpio-omap.c       | 9 ++++-----
 drivers/gpio/gpio-pl061.c      | 5 ++---
 drivers/gpio/gpio-pxa.c        | 2 +-
 drivers/gpio/gpio-rda.c        | 4 ++--
 drivers/gpio/gpio-sa1100.c     | 2 +-
 drivers/gpio/gpio-sodaville.c  | 2 +-
 drivers/gpio/gpio-stmpe.c      | 2 +-
 drivers/gpio/gpio-tegra.c      | 4 ++--
 drivers/gpio/gpio-timberdale.c | 2 +-
 13 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 270cd7c88812..cccbaea1dec2 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -285,9 +285,9 @@ static void gpio_irq_unmask(struct irq_data *d)
 
 	gpiochip_enable_irq(&chips->chip, hwirq);
 
-	status &= IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING;
+	status &= IRQ_TYPE_EDGE_BOTH;
 	if (!status)
-		status = IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING;
+		status = IRQ_TYPE_EDGE_BOTH;
 
 	if (status & IRQ_TYPE_EDGE_FALLING)
 		writel_relaxed(mask, &g->set_falling);
@@ -297,7 +297,7 @@ static void gpio_irq_unmask(struct irq_data *d)
 
 static int gpio_irq_type(struct irq_data *d, unsigned trigger)
 {
-	if (trigger & ~(IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	if (trigger & ~IRQ_TYPE_EDGE_BOTH)
 		return -EINVAL;
 
 	return 0;
@@ -400,7 +400,7 @@ static int gpio_irq_type_unbanked(struct irq_data *data, unsigned trigger)
 
 	mask = __gpio_mask(i);
 
-	if (trigger & ~(IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	if (trigger & ~IRQ_TYPE_EDGE_BOTH)
 		return -EINVAL;
 
 	writel_relaxed(mask, (trigger & IRQ_TYPE_EDGE_FALLING)
diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 87086c322f08..a86f6b1060fc 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -194,7 +194,7 @@ mt7621_gpio_irq_type(struct irq_data *d, unsigned int type)
 		     rg->hlevel | rg->llevel) & mask)
 			return 0;
 
-		type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
+		type = IRQ_TYPE_EDGE_BOTH;
 	}
 
 	rg->rising &= ~mask;
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 8d3acadb0d68..93b8a08b04b9 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1296,7 +1296,7 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	gc = irq_get_domain_generic_chip(mvchip->domain, 0);
 	gc->private = mvchip;
 	ct = &gc->chip_types[0];
-	ct->type = IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW;
+	ct->type = IRQ_TYPE_LEVEL_MASK;
 	ct->chip.irq_mask = mvebu_gpio_level_irq_mask;
 	ct->chip.irq_unmask = mvebu_gpio_level_irq_unmask;
 	ct->chip.irq_set_type = mvebu_gpio_irq_set_type;
@@ -1305,7 +1305,7 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	ct->chip.name = mvchip->chip.label;
 
 	ct = &gc->chip_types[1];
-	ct->type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
+	ct->type = IRQ_TYPE_EDGE_BOTH;
 	ct->chip.irq_ack = mvebu_gpio_irq_ack;
 	ct->chip.irq_mask = mvebu_gpio_edge_irq_mask;
 	ct->chip.irq_unmask = mvebu_gpio_edge_irq_unmask;
diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 5635694bf9f4..900315aba85a 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -198,7 +198,7 @@ static int mxs_gpio_init_gc(struct mxs_gpio_port *port, int irq_base)
 	gc->private = port;
 
 	ct = &gc->chip_types[0];
-	ct->type = IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW;
+	ct->type = IRQ_TYPE_LEVEL_MASK;
 	ct->chip.irq_ack = irq_gc_ack_set_bit;
 	ct->chip.irq_mask = irq_gc_mask_disable_reg;
 	ct->chip.irq_unmask = irq_gc_unmask_enable_reg;
@@ -210,7 +210,7 @@ static int mxs_gpio_init_gc(struct mxs_gpio_port *port, int irq_base)
 	ct->regs.disable = PINCTRL_PIN2IRQ(port) + MXS_CLR;
 
 	ct = &gc->chip_types[1];
-	ct->type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
+	ct->type = IRQ_TYPE_EDGE_BOTH;
 	ct->chip.irq_ack = irq_gc_ack_set_bit;
 	ct->chip.irq_mask = irq_gc_mask_disable_reg;
 	ct->chip.irq_unmask = irq_gc_unmask_enable_reg;
diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index e39723b5901b..005420baecf4 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -432,8 +432,7 @@ static int omap_gpio_irq_type(struct irq_data *d, unsigned type)
 	if (type & ~IRQ_TYPE_SENSE_MASK)
 		return -EINVAL;
 
-	if (!bank->regs->leveldetect0 &&
-		(type & (IRQ_TYPE_LEVEL_LOW|IRQ_TYPE_LEVEL_HIGH)))
+	if (!bank->regs->leveldetect0 && (type & IRQ_TYPE_LEVEL_MASK))
 		return -EINVAL;
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
@@ -450,9 +449,9 @@ static int omap_gpio_irq_type(struct irq_data *d, unsigned type)
 	}
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
 
-	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
+	if (type & IRQ_TYPE_LEVEL_MASK)
 		irq_set_handler_locked(d, handle_level_irq);
-	else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	else if (type & IRQ_TYPE_EDGE_BOTH)
 		/*
 		 * Edge IRQs are already cleared/acked in irq_handler and
 		 * not need to be masked, as result handle_edge_irq()
@@ -702,7 +701,7 @@ static void omap_gpio_unmask_irq(struct irq_data *d)
 	 * after enabing the interrupt to clear the wakeup status.
 	 */
 	if (bank->regs->leveldetect0 && bank->regs->wkup_en &&
-	    trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
+	    trigger & IRQ_TYPE_LEVEL_MASK)
 		omap_clear_gpio_irqstatus(bank, offset);
 
 	if (trigger)
diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 919cf86fd590..fcd44e34f65e 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -132,8 +132,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	if (offset < 0 || offset >= PL061_GPIO_NR)
 		return -EINVAL;
 
-	if ((trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) &&
-	    (trigger & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING)))
+	if ((trigger & IRQ_TYPE_LEVEL_MASK) && (trigger & IRQ_TYPE_EDGE_BOTH))
 	{
 		dev_err(gc->parent,
 			"trying to configure line %d for both level and edge "
@@ -149,7 +148,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	gpiois = readb(pl061->base + GPIOIS);
 	gpioibe = readb(pl061->base + GPIOIBE);
 
-	if (trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
+	if (trigger & IRQ_TYPE_LEVEL_MASK) {
 		bool polarity = trigger & IRQ_TYPE_LEVEL_HIGH;
 
 		/* Disable edge detection */
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 5d61053e0596..2b5da973f51f 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -406,7 +406,7 @@ static int pxa_gpio_irq_type(struct irq_data *d, unsigned int type)
 		if (__gpio_is_occupied(pchip, gpio))
 			return 0;
 
-		type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
+		type = IRQ_TYPE_EDGE_BOTH;
 	}
 
 	gpdr = readl_relaxed(c->regbase + GPDR_OFFSET);
diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
index 7bbc6f0ce4c8..f6c05fdbe63f 100644
--- a/drivers/gpio/gpio-rda.c
+++ b/drivers/gpio/gpio-rda.c
@@ -169,9 +169,9 @@ static int rda_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
 	if (ret)
 		return ret;
 
-	if (flow_type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
+	if (flow_type & IRQ_TYPE_LEVEL_MASK)
 		irq_set_handler_locked(data, handle_level_irq);
-	else if (flow_type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	else if (flow_type & IRQ_TYPE_EDGE_BOTH)
 		irq_set_handler_locked(data, handle_edge_irq);
 
 	return 0;
diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index ffa73dd3b982..e4f3bf949b87 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -139,7 +139,7 @@ static int sa1100_gpio_type(struct irq_data *d, unsigned int type)
 	if (type == IRQ_TYPE_PROBE) {
 		if ((sgc->irqrising | sgc->irqfalling) & mask)
 			return 0;
-		type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
+		type = IRQ_TYPE_EDGE_BOTH;
 	}
 
 	if (type & IRQ_TYPE_EDGE_RISING)
diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index 37c133837729..e2a784df275c 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -158,7 +158,7 @@ static int sdv_register_irqsupport(struct sdv_gpio_chip_data *sd,
 
 	sd->gc->private = sd;
 	ct = sd->gc->chip_types;
-	ct->type = IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW;
+	ct->type = IRQ_TYPE_LEVEL_MASK;
 	ct->regs.eoi = GPSTR;
 	ct->regs.mask = GPIO_INT;
 	ct->chip.irq_mask = irq_gc_mask_clr_bit;
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 6faf30347a36..ccdf13a741b7 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -149,7 +149,7 @@ static int stmpe_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	int regoffset = offset / 8;
 	int mask = BIT(offset % 8);
 
-	if (type & IRQ_TYPE_LEVEL_LOW || type & IRQ_TYPE_LEVEL_HIGH)
+	if (type & IRQ_TYPE_LEVEL_MASK)
 		return -EINVAL;
 
 	/* STMPE801 and STMPE 1600 don't have RE and FE registers */
diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index fa6c8ee92093..ccda3a56d599 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -342,9 +342,9 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		return ret;
 	}
 
-	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
+	if (type & IRQ_TYPE_LEVEL_MASK)
 		irq_set_handler_locked(d, handle_level_irq);
-	else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	else if (type & IRQ_TYPE_EDGE_BOTH)
 		irq_set_handler_locked(d, handle_edge_irq);
 
 	if (d->parent_data)
diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index ec378a4220a7..727fa1b5ad3b 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -148,7 +148,7 @@ static int timbgpio_irq_type(struct irq_data *d, unsigned trigger)
 	if (ver > 2)
 		bflr = ioread32(tgpio->membase + TGPIO_BFLR);
 
-	if (trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
+	if (trigger & IRQ_TYPE_LEVEL_MASK) {
 		bflr &= ~(1 << offset);
 		flr &= ~(1 << offset);
 		if (trigger & IRQ_TYPE_LEVEL_HIGH)

---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260802-b4b4-irq-trigger-mask-gpio-1c3f66bcd26b

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5C6C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 14:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IUBrw7txsJyrtbO2uks4gbXgkSo0IF8NQtTXkzJyWQc=; b=lVZ+fPWfm8s/eNJ/HWRSlCnfam
	qZS8eOLLb4Kygj2Ib7JDArowoMPrcHUiHwSx70bCkT8LbAMTKfCjJylpG21khp+L0Viy3GmiBhgok
	GIA6D/fyaMRdRPG/JFLqIapX130mxg71IEAEz3SJt+qLFUFpyB/fLm+u7EHY3Kmu3V0Cs1oqQee6D
	ni/Y0BVMzTLudYpBcdd2G3pRASZZJwEzNfjDVNCQ+Up2owgv6RcpCM62SmypZYZbc99tDqH9jrH5G
	jtaUpyBK74SprfmGvDqRWBfh5ZIM6lyjuBzeXOcYhcbft8MWyuEOJkXWA/8Oj7NamuHlUkIl3szqf
	IkxlDtaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqWpJ-0000000FhEq-1IFg;
	Sun, 02 Aug 2026 14:06:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqWpG-0000000FhDR-2H1d
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 14:06:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6dlN2009806
	for <linux-arm-kernel@lists.infradead.org>; Sun, 2 Aug 2026 14:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IUBrw7txsJyrtbO2uks4gb
	XgkSo0IF8NQtTXkzJyWQc=; b=YKVtLapQxcdEBSB6WppKRo5LugMC7Yg56KlN0m
	et8x9EJVV63bsrTS6MhujKgjwtbj40Uc+p9c7V9R4yPxaVgIGS3fDghv5xtBsU9P
	xNUY58kIJwahtmetyXBo5M8u+NJn1kTyMr5/M/z6I4xRMfYQuyY8uyX/NAuz5C1U
	en2w5P3lDYbIBbOPh7i2wpmz7s6lD+xNMWW2eKFGFiZ3/jwgDRgxQ9sHKGCZL1dS
	Hzrs/fm22rhDw+E/Ha2WzICFPko5IJYvQ7mbyYFDrdPQpbMEopoLRW0tG+wMNWCN
	bqRrw9t78SEajFGLVe+ZOw2cf1GI+U04UqylDaiO//v0o8sA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8qptx94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 14:06:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so2991818a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 07:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785679560; x=1786284360; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IUBrw7txsJyrtbO2uks4gbXgkSo0IF8NQtTXkzJyWQc=;
        b=cUcmqrtPPned1wbfl4O/ECBL9KtaaYV0UDj4fWPI+BZUoqejEqXkAX9kL9OAE7APRN
         BdS6cxggR1UF/qj3t11GqndEQ2mMtsy4SdSVw/1t3Do2rnpg0dQLU4Sly5prfDC49T26
         cydOMIA6QOmw4k91G34UtBdzXBA6qmW3ZUujczDxygjDnsvxKrG8kQ/uZsJPASwaymdA
         KXVph2rRZpmQtOevWvPQIW27cDNGBvBRQworXkgOnbp7XlrZ0uxkNH+1Nd6NpwZOLGfR
         2j4LUDTGEk48prPb7fs5/Bv+XfYH2Lu0kpt7+ZcYyRvlACsDRIf6xTTTSyDxonombZwy
         KICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785679560; x=1786284360;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IUBrw7txsJyrtbO2uks4gbXgkSo0IF8NQtTXkzJyWQc=;
        b=Vw1gEY14EzISLFNzaeoyUxInKRaZATIoKv3sZV9mJ2jPQGtiu+lZMzrW4hICgylGby
         yTuZPgSLOtvVbaiAYv5Tt+uVUKwWc+dtVojvtaKXCMi630rNR2ccsCPyLLUhmfXvh028
         unlric/gPc6P++SJyss+v/hfSX8IIAvxI73cP07qOhd0LowS+q5xVoRCRZuazqKcr4Qw
         IR+m5/6cNeI+Du7MAoffkPdCXbb7x07txDwvfnBLfQHv/KVZJSJkkSyXBvWjvAnyf6lH
         GToN+O/lvHMhz6H3orr7iWZZ72CC2Jcud1UN5FD1HUf3TdA+t88lYsFnv1ZMp9ji1AAb
         OrpQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFveZPEndDOHYj+1J4cSrC7fVNYQQ+hM9tt6eTq89mCeQ4cxk2WWeCcaOV23JS9p+4SfGrSIlG/dTUYE/r+abf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5cioulp+k/PveBBvA5Fia0Cvzl1NELzLfLpcZAwSVSpGqKAvf
	jkQ1KCXR3SV0e7yJQUxitNPcFHEo9Ch2UBJv7iJUQBsUrBCxb3/gv8gVL3m7BwaxruLgQTReT6T
	WbHnaiobu5Iwe4A7sSCjEGdUJUcLncQsvfq0+jMH3OKsdHUBTO4lZg5yn5+0XgAiSJwqbEwN3TN
	RxuQ==
X-Gm-Gg: AR+sD10Af/+Ut6SdJV9A68lUO5/lzAwDoXkdl/4z7tbB0AlqxJDCDwMRv+O8Di445q9
	CsyCW4jd4NyFI6eHm1yz/0DzaB1x4ndvS0c/1xZswMet9kUYDnEaj1dNnWsdquhq9Vs0tCGYilb
	iYklpsJFzSgX3OaNfXFzVEzszRCb2hoKuAxbnEw5n2w1lvQXUo89Fuu+vhCgbPplcOUkVzaMkLF
	pWydsN5G5fI7Nffy4kIhBcron4kLA9cA42HBhzeeXHsOzh2SKNgdVqgFc4mZmXh9Z1/09TtcH+a
	2JV1hZ64urM+yAL6HLKlvzAPeG5Uv7zlZPei+JbAqYM7UHr3eNFxfrMn2FnbdZ+ZmLig0itQY69
	lAiyYtD8m5kNgULCo8WMgDBg3WgJf
X-Received: by 2002:a17:90b:57ed:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-38fbc9f3ebemr4727135a91.4.1785679560489;
        Sun, 02 Aug 2026 07:06:00 -0700 (PDT)
X-Received: by 2002:a17:90b:57ed:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-38fbc9f3ebemr4727101a91.4.1785679559963;
        Sun, 02 Aug 2026 07:05:59 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4cb51asm34484816c88.9.2026.08.02.07.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 07:05:59 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 19:35:43 +0530
Subject: [PATCH] pinctrl: Use IRQ trigger mask helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALZOb2oC/yXMOw7CMAwA0KtUnrGUpgEVroIYamOC+YTWCQip6
 t0JML7lzZDFVDLsmhlMXpr1kSraVQN8HlIU1GM1eOc3rnceKVBAtQmLaYxieB/yFUdNXOyG3Xr
 LoWcKbUdQj9HkpO/fvz/8nZ90ES7fFJblAxVw+3aBAAAA
X-Change-ID: 20260802-b4b4-irq-trigger-mask-pinctrl-359c48cb413b
To: Linus Walleij <linusw@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
        linux-arm-msm@vger.kernel.org, soc@lists.linux.dev,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785679551; l=6841;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=NBDioksG5pOpKo0k7xIWjDfLaLsiWZzCb//BdAiMZP4=;
 b=c21evJbK163GncmcfCcbMaR7yLK/XPxyAIAtf7iEWai9uXE/ByvKLgPIYH43r4tLlQgGRBNDB
 1flMBKgF77UCMyTh6ruqr+wSpTq0lACBWDakgwRVSnCqIKrHE0AmMJv
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDEyNSBTYWx0ZWRfXwQQ4cVhFYJWf
 23qknxZCerRrPfeIHNasqcDUXEFE+B4eurrvGAL1u+lEc9LN2xSju6AV8JxaxEMk9dANwSuZ0GI
 dmWUua0HjqiP9OFLPgd/qmEZlEhsCpjx37NR0Rrnwi10qUgwRUN77y6r+hqrYrx4e0Hw2XFsIGg
 bhgT2Z2ohJIcTUviZCGht3Bffr0bGGb2WDc7QAnkpu7+rBwTfV3saqLyzjBw6Hd0L1xv/6FfnEQ
 Ub6xkL6eOuPpEv7+Tcq7tNv95CgVtDMz76hMxnf29xtEHL89ZWWW2zfLmu+PKe7Ekc5Mjuse6Ay
 hXYBNxAFSTEWDIf1NHV8GLHObJ65WIEJBfdrqX43Qucz7i8WhEN3NGASgF0lk36FE5sm0nuqoUL
 RoiSKlgdMRl0cMXDe50c2w8ojlM2wsOSP1BS7lRO/oH4zU/prTliGqByAhFZMnCFdxVl1Tia8VE
 5H+lhrFjD3NpqPQOF4A==
X-Proofpoint-GUID: S71KPqHQWpYADZ8lu0gTSBM74p-LFEhU
X-Authority-Analysis: v=2.4 cv=MpViLWae c=1 sm=1 tr=0 ts=6a6f4ec9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=aROEccOD733urgNQ4cUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: S71KPqHQWpYADZ8lu0gTSBM74p-LFEhU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDEyNSBTYWx0ZWRfXwz0pYEh5kfcx
 AeHPUEA2qolyA22T+oSpXKByfUyP9lMGtYCWpUrYggbkjJjpquERfoZgUoFY74Iibm17PESpmj1
 bAYKTLv6P5d1cqb60Y52MIFmqR7cPbg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_070602_578978_11C32BAA 
X-CRM114-Status: GOOD (  18.02  )
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
 drivers/pinctrl/actions/pinctrl-owl.c     | 2 +-
 drivers/pinctrl/airoha/pinctrl-airoha.c   | 2 +-
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c    | 4 ++--
 drivers/pinctrl/mediatek/mtk-eint.c       | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 5 ++---
 drivers/pinctrl/pinctrl-ocelot.c          | 2 +-
 drivers/pinctrl/pinctrl-sx150x.c          | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c        | 4 ++--
 drivers/pinctrl/spear/pinctrl-plgpio.c    | 2 +-
 9 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
index 1f0ef4727ba7..9f5637756bd3 100644
--- a/drivers/pinctrl/actions/pinctrl-owl.c
+++ b/drivers/pinctrl/actions/pinctrl-owl.c
@@ -824,7 +824,7 @@ static int owl_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct owl_pinctrl *pctrl = gpiochip_get_data(gc);
 
-	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
+	if (type & IRQ_TYPE_LEVEL_MASK)
 		irq_set_handler_locked(data, handle_level_irq);
 	else
 		irq_set_handler_locked(data, handle_edge_irq);
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index abfb018f207e..90372827639d 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2435,7 +2435,7 @@ static int airoha_irq_type(struct irq_data *data, unsigned int type)
 		if (gpiochip->irq_type[data->hwirq])
 			return 0;
 
-		type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
+		type = IRQ_TYPE_EDGE_BOTH;
 	}
 	gpiochip->irq_type[data->hwirq] = type & IRQ_TYPE_SENSE_MASK;
 
diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index 1fbb101386a3..83fcc80d5967 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -159,7 +159,7 @@ static void nsp_gpio_irq_ack(struct irq_data *d)
 	u32 trigger_type;
 
 	trigger_type = irq_get_trigger_type(d->irq);
-	if (trigger_type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	if (trigger_type & IRQ_TYPE_EDGE_BOTH)
 		writel(val, chip->base + NSP_GPIO_EVENT);
 }
 
@@ -177,7 +177,7 @@ static void nsp_gpio_irq_set_mask(struct irq_data *d, bool unmask)
 	u32 trigger_type;
 
 	trigger_type = irq_get_trigger_type(d->irq);
-	if (trigger_type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	if (trigger_type & IRQ_TYPE_EDGE_BOTH)
 		nsp_set_bit(chip, REG, NSP_GPIO_EVENT_INT_MASK, gpio, unmask);
 	else
 		nsp_set_bit(chip, REG, NSP_GPIO_INT_MASK, gpio, unmask);
diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 8b022545a3e9..827231dc0d24 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -216,7 +216,7 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
 		writel(mask, reg);
 	}
 
-	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING)) {
+	if (type & IRQ_TYPE_EDGE_BOTH) {
 		reg = mtk_eint_get_offset(eint, d->hwirq, eint->regs->sens_clr);
 		writel(mask, reg);
 	} else {
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 0df749cbcba8..e051ff141d6c 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -259,11 +259,10 @@ static int npcmgpio_set_irq_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	if (type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
+	if (type & IRQ_TYPE_LEVEL_MASK) {
 		npcm_gpio_clr(&bank->chip, bank->base + NPCM7XX_GP_N_EVTYP, gpio);
 		irq_set_handler_locked(d, handle_level_irq);
-	} else if (type & (IRQ_TYPE_EDGE_BOTH | IRQ_TYPE_EDGE_RISING
-			   | IRQ_TYPE_EDGE_FALLING)) {
+	} else if (type & IRQ_TYPE_EDGE_BOTH) {
 		npcm_gpio_set(&bank->chip, bank->base + NPCM7XX_GP_N_EVTYP, gpio);
 		irq_set_handler_locked(d, handle_edge_irq);
 	}
diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 0fe0527863b8..58d3cde9f964 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -2317,7 +2317,7 @@ static const struct irq_chip ocelot_irqchip = {
 
 static int ocelot_irq_set_type(struct irq_data *data, unsigned int type)
 {
-	if (type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
+	if (type & IRQ_TYPE_LEVEL_MASK)
 		irq_set_chip_handler_name_locked(data, &ocelot_level_irqchip,
 						 handle_level_irq, NULL);
 	if (type & IRQ_TYPE_EDGE_BOTH)
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 89fdfa96843f..2dd1f220bff1 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -525,7 +525,7 @@ static int sx150x_irq_set_type(struct irq_data *d, unsigned int flow_type)
 	struct sx150x_pinctrl *pctl = gpiochip_get_data(gc);
 	unsigned int n, val = 0;
 
-	if (flow_type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
+	if (flow_type & IRQ_TYPE_LEVEL_MASK)
 		return -EINVAL;
 
 	n = irqd_to_hwirq(d);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 641113831a7b..27f06bbc113c 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1191,9 +1191,9 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
-	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
+	if (type & IRQ_TYPE_LEVEL_MASK)
 		irq_set_handler_locked(d, handle_level_irq);
-	else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	else if (type & IRQ_TYPE_EDGE_BOTH)
 		irq_set_handler_locked(d, handle_edge_irq);
 
 	return 0;
diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index 1ec22010a3f9..5fcbea32089d 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -339,7 +339,7 @@ static int plgpio_irq_set_type(struct irq_data *d, unsigned trigger)
 	if (plgpio->regs.eit == -1)
 		supported_type = IRQ_TYPE_LEVEL_HIGH;
 	else
-		supported_type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
+		supported_type = IRQ_TYPE_EDGE_BOTH;
 
 	if (!(trigger & supported_type))
 		return -EINVAL;

---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260802-b4b4-irq-trigger-mask-pinctrl-359c48cb413b

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>



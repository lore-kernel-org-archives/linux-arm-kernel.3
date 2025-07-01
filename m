Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B74FC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 22:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aCH6UWaWdMtSV5w3YLUgKyRDkxeGFe8bXumroDH0Y/Y=; b=4sNjU+3J9sxn/EBnx4VEwFOXj8
	PjZjYRo0hwzSaR8f/oqkX1m309Vw/P0V0g1TqdZ0pTWdIQVpJlbli/kg/vFQItZbnArG2qoXmRaNa
	ePTeyT6o0jD4sqS5IGRxN/atpSisRtmtCJSk0/DpYnUlEbem8lqyOuSV6QGL/R5HAls6rLAUmGVMD
	9z9XbdC/qwXgJiIS0bwx7cGGwqtw88YwGVKF/aO1rAY05ZpcxZI/geU7J6qilOuktOUnNOFxDuaQ5
	4DUoxgXXhCL2DI3MS6XgWqroAok3xW+/RlswLoaMO3WIayC9ntM14DENWkFQJSrLdU76RlKkoWu09
	RtFXKnlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWj6Y-00000006juj-2hkW;
	Tue, 01 Jul 2025 22:05:30 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWj4D-00000006jmL-1OSE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 22:03:06 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so94973666b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 15:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751407384; x=1752012184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aCH6UWaWdMtSV5w3YLUgKyRDkxeGFe8bXumroDH0Y/Y=;
        b=eWu1o6ijNlVH3x5l6fsvSb1prgRdn63fV4e6kq+bnxPJQHWty5nbh89qJom5saPylG
         k/gXTHCe+1V38Bii00r3P/wXtgEQbPXK41e4BNLOjTxNkkoVI56qqBn5JGJBnXSebIBT
         NXETAb5r2hkKEpiVwPFFinyJj62mboARjdh0rXB52JryP/+J2iAjzBSSZrFM46oC4IIt
         632UC7JXz5tFc67qiyTqqhGP/Ud/vxTytGTu9lzUELBaKrtSAMK/38rVR7x0+nwYSfS5
         6beiBOlFBRJbWttGEzZp6ob1DaF/GqSYQZm++as6APUes4+tMcXO9KLQCjIcy6C8PXpq
         wJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751407384; x=1752012184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCH6UWaWdMtSV5w3YLUgKyRDkxeGFe8bXumroDH0Y/Y=;
        b=nUDElF17BVPS+fA2f9t8JWT/DTXoh+5zjGsGA28vyY1VsxdnCOXuEpo2z9fqClCFzi
         X+b72cDADIMAbrKPpbhKyw448J1jMMu9XBkeuZPWtxGwZ+32rMCc9VvJ60hp/6bPxpD3
         4BGgJMzTqpUYWw4zGVtuVlOBJNBBWssTYiKdHfZnPy9Y3naNeQzOY+ezwwl06GiOz4Mq
         bGXCaRyO5dGFcvqDi5kbTJBzxPUPD78u4Q8VUhFVFmI7L9r0Vu6B+nepmlaW8065dQz6
         5ChBPjAgpNGm90AH8lqcJkxx7Bfkw5R7plTCpSxI74SJeRcfloz/gk52xENx7eCyiGop
         S4pg==
X-Forwarded-Encrypted: i=1; AJvYcCXUCiGJiWN36UPwAGAn5dxMGCGvUOWGIusb6iuJCPBoU2FMJhj3Pl0j0824KG21OhPIkC5YqA0JpF8elLOmAQ70@lists.infradead.org
X-Gm-Message-State: AOJu0YwFj7Oppv4U/o0okQ40brCy6PSjwve/snbapmzKrhjDOLE8SRVm
	lMZFAp3U+p7Ke5jqs48Lxd/5ssuwsaVJJ77BJKHVwiYUYVqrC33ZX9bP
X-Gm-Gg: ASbGncul08tWcPtcOkd4FTJtGUZvqpEiaV1RWsHWvRAeRVpfpG3u/S5jae874bwmvFL
	aeP3ftT48bcCRDvdQhgks8F11SL3yTXP7JndeNINWfnNCjzG6D35O8XTd6l1X0dSdVFA58L+CUi
	5oYhUypgrpB2Hy/jts6w4uHh2cdZfQ/i2DhJ5NHeOs/jL/80M7nj/DqsMOWCptG7WNS/R4bG27E
	2f4rqa8kDkLf8rnRd2bI1u6am6JEX7u0/fcz1J/uZrM6viTlgygpfWbAZBoVl6uTClukpodTFmR
	ENSYq9n32cBcZLdrZClZnB/UwRZHtvpPvkLXWPr8fvtLeG3Zfu2+yGhEakqWBQGhr0GS5HYixJ7
	uyt9+reLM5qNR8Avs29tApl3LVoCbphQmUw==
X-Google-Smtp-Source: AGHT+IGb0hSrbnoMf338DLIN4x8Shdh32qqzM9p3b8N6w2kChFiXV5nx4bbPUXJPHmioNc/LM3NIog==
X-Received: by 2002:a17:907:9448:b0:ae3:6dc7:1ac3 with SMTP id a640c23a62f3a-ae3c399eaf1mr20986466b.15.1751407383224;
        Tue, 01 Jul 2025 15:03:03 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a16asm959756266b.72.2025.07.01.15.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 15:03:02 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-pwm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pwm: imx-tpm: reset counter if CMOD is 0
Date: Tue,  1 Jul 2025 18:01:47 -0400
Message-Id: <20250701220147.1007786-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_150305_395831_623CD57B 
X-CRM114-Status: GOOD (  14.07  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

As per the i.MX93 TRM, section 67.3.2.1 "MOD register update", the value
of the TPM counter does NOT get updated when writing MOD.MOD unless
SC.CMOD != 0. Therefore, with the current code, assuming the following
sequence:

	1) pwm_disable()
	2) pwm_apply_might_sleep() /* period is changed here */
	3) pwm_enable()

and assuming only one channel is active, if CNT.COUNT is higher than the
MOD.MOD value written during the pwm_apply_might_sleep() call then, when
re-enabling the PWM during pwm_enable(), the counter will end up resetting
after UINT32_MAX - CNT.COUNT + MOD.MOD cycles instead of MOD.MOD cycles as
normally expected.

Fix this problem by forcing a reset of the TPM counter before MOD.MOD is
written.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/pwm/pwm-imx-tpm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c
index 7ee7b65b9b90..30f271826aed 100644
--- a/drivers/pwm/pwm-imx-tpm.c
+++ b/drivers/pwm/pwm-imx-tpm.c
@@ -204,6 +204,19 @@ static int pwm_imx_tpm_apply_hw(struct pwm_chip *chip,
 		val |= FIELD_PREP(PWM_IMX_TPM_SC_PS, p->prescale);
 		writel(val, tpm->base + PWM_IMX_TPM_SC);
 
+		/*
+		 * VERY IMPORTANT: if CMOD is set to 0 then writing
+		 * MOD will NOT reset the value of the TPM counter.
+		 *
+		 * Therefore, if CNT.COUNT > MOD.MOD, the counter will reset
+		 * after UINT32_MAX - CNT.COUNT + MOD.MOD cycles, which is
+		 * incorrect.
+		 *
+		 * To avoid this, we need to force a reset of the
+		 * counter before writing the new MOD value.
+		 */
+		if (!cmod)
+			writel(0x0, tpm->base + PWM_IMX_TPM_CNT);
 		/*
 		 * set period count:
 		 * if the PWM is disabled (CMOD[1:0] = 2b00), then MOD register
-- 
2.34.1



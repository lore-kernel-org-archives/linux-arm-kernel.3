Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4783C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 19:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ph9MOB90x8/rsIoED4kDLbacmQxfQ83Asvuv4fsdn60=; b=zk+t9xsZzY3JS8IgPNxFHKF/IY
	km6pFOm2YoN4gH74Y5JneQBz9EePCCJAxd0Si0KU5pm5hmSbY6B5iY3bCQVLN3sWd6ENKp7pXpuPN
	l2pRRJR2l3ClcYmaZWBiuFmCiYw5c6e6w6Qm4RC7z6QxUe1u6gMfKNxJuWm4IimmqsnSNQorMxrEm
	HjGC9jJtZB5QN9u8G0sKu6On3BeocAWbZ+HioL4vAUlMOdubYM2UMy4/Rq0hB61NU5zhuNaRhNKjR
	fYgdaqahsoTkRLhfA2hbM4N8Jc7itXEKGL2p6Z0gfW3PBDx0SoGLE4ArpvzxTrws5Cs47t6Yag6Cc
	QhVvxkOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRJc-00000003mUD-33hM;
	Mon, 27 Jul 2026 19:48:44 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRJa-00000003mTs-1IVI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 19:48:43 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38f620399a0so504819a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 12:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785181721; x=1785786521; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ph9MOB90x8/rsIoED4kDLbacmQxfQ83Asvuv4fsdn60=;
        b=E0DJbsBD1LGkKYyCs2qIkMiNKaKy+l3AvVkbrAQjCFRiqTlMP2UeNbONXHupQAKzXV
         ePyK1mYp+igOUL01tJppV4An9dCq9UkpqWOgtcXh3p3gm8bQOirLjrMAgRIkD0nuSmRV
         h+d1B8pRsbeYFoF95szwTF6BVlYCwEa302KVtMRHghuH1SsGeWxdAobpC1dQi1Uusz52
         PbYFlGZKqHP3XNIGPWbaAhtGUNKDSLUGEwhsMsBZ1vSiw3G8TFb/eThfpSlduLnP/lSf
         jDG713DkJwcB6MyeY9MRTkApGBWkn+4m22duV4nrThAHsvrNjrv0H2FP7aY/jjbiVypZ
         5mcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785181721; x=1785786521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ph9MOB90x8/rsIoED4kDLbacmQxfQ83Asvuv4fsdn60=;
        b=VpMalUCJhxhHiJMtDcsyOAtY4v4JUvwBcRV/XjMa5w1LHu6Vx7rQs6Ii7LnIV8J80q
         2NT7X0bqWStoSpRcWQZOibAh9QzlhufNSm3cURVSPBS08PiQyVPT1R/+2ZkmXhKIXX6Q
         hh2hLMqnTu+nL4VC1K/Sq+xLVxVveXEqgGjpWwP5KRCfnhMIGYJf+tzzprS7AkT4428h
         QjJwQMq8z4tkH8PjJ2zp++R0gCYLEp2vkETXoAZ1QU3iCgf3a0utvfzW3Ld36fJchVye
         y9ePz2N2KLylWSvsG5T1+Gl4rLWojSzQtCbOaVg67+kATmay60s5XGPWXUtX50r37O/x
         RQQQ==
X-Forwarded-Encrypted: i=1; AHgh+RptN/mErWHd9WA0OXd6lXRUqrdw22ePqZzCJQvnp0PfKJQ9cBox4BWt7wAS1oF5e98GHjCk5mYLBvfohzgYbRMV@lists.infradead.org
X-Gm-Message-State: AOJu0YzeXTwl8SC6Vhli+K3Bc/ENxMyxFhmTTbqYiroQetYghEyuVEk8
	IbhHDHGhMc8QXGxWUx6phketCp0uf5Nlsk/vlJmif22Z8bSswMBOAgzEs/iSwN26
X-Gm-Gg: AR+sD11sebr2nIGMkFlei9UqKXgvAaNmo3IlYLJKBW7byWZKHTfcwhGA8/r7rwSgZ/W
	wfOrVm9TdBPbutxUOmc0OuXUM5tDq2unU854iWE3C7GzJqkHJZrj9/XQios8CiCY501arWEBdho
	THUE8P2UfcMifvG9ydHtHLTFkoCAhjmZKMpzDNlG/2iYLEXU9SIkhPUBpnRPl/a4ybx348AjiVy
	HiVfIkod2F+vOhz4Q32+FfFBAYw6rBj2PlW0N8xjBpEb0sPEx91usLl5WesHR0XLu98yH/SXXBk
	vzFdsibhy0TgHlgJU60iRwbkKWjjDqmoFT4rRNQQqbMCINhpa8Ebx60dylV9nluPHWjazpKufMp
	BwY9BDhwux8gbIGQh2w1JC7PxsQ/sdr7ft+Q9viFNQRPs+xvKeIneNz1oBatLL3i8vmSe1yXuKL
	o01u6sL+4ipkUrY+QKPys2G1YraZFBZs16TMVGjbD7sAiIN8McbZsASX9jRHlPIKAZNslQHwgDg
	QrYMFB8vKaesnLfW70ALEcqecF4ucnIos+jI2/9W1/4tQBiIi4/VURUOCnHYK6tzcmaOAFX1vtd
	mhzI6r1H38UdJlsvpmB2JnuzuMdzzanaVEP+OA==
X-Received: by 2002:a17:90b:1c8e:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-38f6480d1demr780368a91.7.1785181721391;
        Mon, 27 Jul 2026 12:48:41 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642bfc71sm270847a91.11.2026.07.27.12.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:48:39 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:PIN CONTROLLER - SAMSUNG),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] pinctrl: samsung: exynos: replace irq_of_parse_and_map with modern APIs
Date: Mon, 27 Jul 2026 12:48:35 -0700
Message-ID: <20260727194836.11689-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_124842_373878_CA8C32AE 
X-CRM114-Status: GOOD (  12.37  )
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

Replace irq_of_parse_and_map() with fwnode_irq_get() for per-pin IRQ
lookup and of_irq_get() for the muxed EINT IRQ. The fwnode-based API
works with both OF and ACPI fwnodes and follows modern conventions.

For the muxed EINT path, change the error handling to propagate the
error code rather than silently returning 0.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 81fe0b08a9af..5bef230f5bed 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -824,8 +824,8 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 			return -ENOMEM;
 
 		for (idx = 0; idx < bank->nr_pins; ++idx) {
-			irq = irq_of_parse_and_map(to_of_node(bank->fwnode), idx);
-			if (!irq) {
+			irq = fwnode_irq_get(bank->fwnode, idx);
+			if (irq < 0) {
 				dev_err(dev, "irq number for eint-%s-%d not found\n",
 							bank->name, idx);
 				continue;
@@ -841,11 +841,9 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 	if (!muxed_banks)
 		return 0;
 
-	irq = irq_of_parse_and_map(wkup_np, 0);
-	if (!irq) {
-		dev_err(dev, "irq number for muxed EINTs not found\n");
-		return 0;
-	}
+	irq = of_irq_get(wkup_np, 0);
+	if (irq < 0)
+		return irq;
 
 	muxed_data = devm_kzalloc(dev, sizeof(*muxed_data)
 		+ muxed_banks*sizeof(struct samsung_pin_bank *), GFP_KERNEL);
-- 
2.55.0



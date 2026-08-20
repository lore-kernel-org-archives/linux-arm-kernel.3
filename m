Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A81C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 21:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S5ocIiFd6KFZwrrDp1pILTG65RoVNAY9CNuzSL/XjFc=; b=ojUQuhd2XNKJ1x1+VtRmBJWnop
	w6U4gSmrb3uRXpoEL9H9tilBHSCcnwj9vS9KZ/pcpgJmRlHN2pDhXJ9tLxif2na98hrZOZ3ffD4G+
	U3gGOtlDlswsCif5MmBJLQksjrYE00/OqypovTn5/dJRpBjxc6sSG34N3xhwRjA6lOtZa7Qjikr2i
	cEdki4r5MEntmS1z34wriVr9SGxiRZUco8G93v1rzsZa3D4lJEFTGFEqyTL4X55tbJty9PUbrisNI
	GcgjwBCbwvfi5AY2gXFqJkgXdHEnXO5+qTnzBSISx7ATpb70ZNxGkrHh7bvlVN62MrPYwwl6ZkCX4
	JksA7vbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAbj-0000000CFgo-0uWK;
	Thu, 20 Aug 2026 21:47:31 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAbg-0000000CFgS-0vBj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 21:47:29 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6a1a546a6bbso751365a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 14:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787262446; x=1787867246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S5ocIiFd6KFZwrrDp1pILTG65RoVNAY9CNuzSL/XjFc=;
        b=UvUur9H3fLXSqHDPlryTAIpi/1/7TRYlBgFC82lXFEr8R04Ss+q/4OQEWreMf76pzM
         JDv1hHmTIl4Hboed3WvzV/HWlKC3gvVNbZyz0xHXWoVmZ7DmU0Qyt6Dl2JV19d3tjEcG
         3YtzZpAuXj/e2VhgkH0THZkkEYgLyPYkt26Px7afbivaG7sHIqonXEOpy1kQn46Dw8xk
         5ypqYGUVpkCnSttpayzWWfc9VrGssYMgNthT3YKvm8rwqD0PhSoPuJfNPVvKkCLbg2dW
         U2tnJl48AMwm4fdO+787QzYbKANYjYCOlO/KhEa1elhjSi3Ax6MNYjr56/ROVZ7RJr86
         zOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262446; x=1787867246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5ocIiFd6KFZwrrDp1pILTG65RoVNAY9CNuzSL/XjFc=;
        b=Pu6eEr1iOQnvNNg5AiIAYh75RkBl/beSNew86M1JuOVISzhhhsgvsYB6NuHrboNIqh
         duSxon3bs0dou3iJmmGpVVkhmlGF+bYg2AEWqpcUng0s+zCqFoOpOJUKAP/nL+ivYvC1
         OW+JeLCOEB530SCnM7U7o4kcZIZevjn+kAQgBoG5MntRHhlM7qLhlvSyRRT/x1jbPeCE
         O7BwXf9vIy0ERCAAQja73UmpS8UnqGNnwmYpnrQEy+mLmfYty963FZe+NOmBvrauV3Vb
         gzmSPCOGlq91T1pKJ28SI4e6oUyb5LArEwPVYONeg2LfCqtYjntVE5/vlub9JWc+N/bJ
         5GBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+vk8ZdR2bzdGCDLuNqS+excdFP9N8G8CremXeO34p9dIv0oyD/9VuRn5d2rWS3xdy1FduEF37kyumwRjpFyor@lists.infradead.org
X-Gm-Message-State: AFuF++loVPjovZ+baKCi4I8D4RsUwUR/NOyjYE0C0O9zHcWGQTpIIXzt
	tyWDJr8n0f9ZFC7W3QBGs3L5vJv7R0A07+XM+0gcXcb3rOn3sKLzdSJx
X-Gm-Gg: AR+sD10p7j8n1Kc/Xf10uEhuPZE1tAhJvaQAnBPZril3qM/Dat6YgmtowBl7TDzsHeo
	BfVxGFf6uXvzJKPIO9SsatE22RMRIf2j0PpStpvwCTXJXUlv+YF1LpHA6IfG3H97FMAKdUjBb58
	nNSCfMW1vD9UvK3LKqhIf927UDhJ5f6CmFpu66jEGq0W7neVdxFe4jUxDkzZ2bVVC5Cye5zsH6n
	ejb7DSS6z3xU7Y+45SUIIvw31OAQsK8g2GXVhCuwwcllcS2FpC0hO1Cm6qrFeo9XP2OJ3ue7iWV
	qAPWJeYnxP62VqX5pzb/wJTvOKzpu5QR7PMUhMWrvhmdGf7sYPXmqZleGbhea4fl7tpD9U5MMCS
	BdMy30t5NgZ7DG5LniC7/8+xxl8Yy83tFOBYCUmHW5qzxZoX3iMxnu2VKmqSF1txLNj/LIRS/IU
	FuT9YeydMkBjWuk+DH0+XBqF24jmbzF8rx5l4B9eBIznPV22+BsBN79By5yvK7LARvrxfaXMxeM
	QtLOC0SL93wGD6gFOG2GJoI28fcQlSfciovcwlP7Qjh8YM3LkUoG5B0NA==
X-Received: by 2002:a05:6402:24c8:b0:6a3:f4fe:9d5f with SMTP id 4fb4d7f45d1cf-6a42f1a34e6mr1355647a12.11.1787262445589;
        Thu, 20 Aug 2026 14:47:25 -0700 (PDT)
Received: from GOLDENAXE.office-radnicka.localarea.network (c82-214-103-74.loc.akton.net. [82.214.103.74])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm3288724a12.14.2026.08.20.14.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:47:25 -0700 (PDT)
From: Bruno Banelli <bbanelli@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Ben Peled <bpeled@marvell.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bruno Banelli <bbanelli@gmail.com>
Subject: [PATCH] clk: mvebu: ap806: fix legacy binding failing to probe
Date: Thu, 20 Aug 2026 23:47:21 +0200
Message-ID: <20260820214721.11879-1-bbanelli@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_144728_286425_595B3C0D 
X-CRM114-Status: GOOD (  17.88  )
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

Commit be69e55df9af ("clk: mvebu: ap806: Prepare the introduction of
AP807 clock support") factored the probe path into
ap806_syscon_common_probe() and added a test that picks the Sample at
Reset decoding table from the device node's compatible string:

	if (of_device_is_compatible(pdev->dev.of_node,
				    "marvell,ap806-clock")) {
		ret = ap806_get_sar_clocks(freq_mode, &cpuclk_freq, &dclk_freq);
	} else if (of_device_is_compatible(pdev->dev.of_node,
					   "marvell,ap807-clock")) {
		ret = ap807_get_sar_clocks(freq_mode, &cpuclk_freq, &dclk_freq);
	} else {
		dev_err(dev, "compatible not supported\n");
		return -EINVAL;
	}

That is correct for the current binding, where the clock node carries
"marvell,ap806-clock" or "marvell,ap807-clock".  It is however also
reached from ap806_syscon_legacy_probe(), whose device node carries
"marvell,ap806-system-controller" and "syscon" - neither of the two
compatibles being tested for.  The legacy path therefore prints its
three deprecation warnings and then fails unconditionally:

  marvell-ap806-system-controller f06f4000.system-controller:
    [Firmware Warn]: Using legacy device tree binding
    [Firmware Warn]: Update your device tree:
    [Firmware Warn]: This binding won't be supported in future kernel
    compatible not supported
    probe with driver marvell-ap806-system-controller failed, error -22

The AP806 system controller is the provider of the AP clocks, so no
clock is registered at all and every consumer defers indefinitely.  On
an Armada 8040 that includes the console UART:

  platform f0512000.serial: deferred probe pending: platform:
    supplier f06f4000.system-controller not ready

which turns the failure into an apparent silent hang once userspace
starts, rather than a visible probe error.

Before v5.4, ap806_syscon_common_probe() had no compatible test and went
straight from reading Sample at Reset to decoding freq_mode, so the
legacy binding did work.  The commit introducing the test described
itself as "No functional changes", ap806_syscon_legacy_of_match[] still
advertises the legacy compatible, and the warnings above state only that
the binding is deprecated.  The breakage therefore looks unintentional.

Accept the legacy compatible in the AP806 branch so that the legacy
binding works again as it did before v5.4, keeping the deprecation
warnings intact.

Fixes: be69e55df9af ("clk: mvebu: ap806: Prepare the introduction of AP807 clock support")
Signed-off-by: Bruno Banelli <bbanelli@gmail.com>
---
 drivers/clk/mvebu/ap806-system-controller.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Found while booting mainline Linux with U-Boot's control FDT on a
SolidRun MACCHIATObin (Armada 8040). U-Boot's arch/arm/dts/armada-ap80x.dtsi
still uses the legacy binding, so any board booting Linux via U-Boot's EFI
handover with the firmware-supplied FDT hits this.

diff --git a/drivers/clk/mvebu/ap806-system-controller.c b/drivers/clk/mvebu/ap806-system-controller.c
index 948bd1e71aea..332e7c21ea07 100644
--- a/drivers/clk/mvebu/ap806-system-controller.c
+++ b/drivers/clk/mvebu/ap806-system-controller.c
@@ -152,7 +152,9 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 	freq_mode = reg & AP806_SAR_CLKFREQ_MODE_MASK;
 
 	if (of_device_is_compatible(pdev->dev.of_node,
-				    "marvell,ap806-clock")) {
+				    "marvell,ap806-clock") ||
+	    of_device_is_compatible(pdev->dev.of_node,
+				    "marvell,ap806-system-controller")) {
 		ret = ap806_get_sar_clocks(freq_mode, &cpuclk_freq, &dclk_freq);
 	} else if (of_device_is_compatible(pdev->dev.of_node,
 					   "marvell,ap807-clock")) {
-- 
2.43.0


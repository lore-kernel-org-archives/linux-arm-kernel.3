Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C585CC4452F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 03:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pAe9oJKs9rYe/I0ehLfgHAp50htWUaPZa7ALyKO6fgY=; b=FlKKNZHsL4SjBujCFmn41JG0OJ
	SSZ/+yQYlZjq2b9kSLaxs2wBcl2xkIr+tofAYSDVVU/S3G84cArHirRRJFlpHecv4L11AW5vUOnRO
	zVKDJUr4k2lKK+Kbo8aXznqt7XfPCDYubnpFyd2zjSujoh9Y1O7Z+DtIYgO/0mJDJGlQAV8G7Ps+j
	pLBEvleHWnk+EQnjzFubxQwammIAuo5pD4y1EvSnbbSv8+DUm1Y+K8vRcDnSc0T/8hAqWhrpDstJD
	mc0Ui8d49Oi2e12TD4PrXhzE1kTwAh21G2wERxIYUN5++ahxm+xDgiQ14YI4nZgkVcps3TtQ8qYcs
	SDH1FYgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0jA-00000008I6s-2f3R;
	Tue, 21 Jul 2026 03:01:04 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0j8-00000008I5u-1Sus
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 03:01:03 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c9d1fc053e0so6443988a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 20:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784602861; x=1785207661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pAe9oJKs9rYe/I0ehLfgHAp50htWUaPZa7ALyKO6fgY=;
        b=AlJcxJIZSrdJtWhSH6HhSOUsv257iBtIg/0NpwFlylGidIGvWqOFTuIWIZz5wGUjKj
         CSLbVxtV/lfUZI6oxrlTP5J9XvHJE+TZbwfjx2Ltc02sc/I/BY2XCRuKo5mdFeEin55Y
         KxfgaiEPS1JyCq6xMFYbd4ai268S6qAKrDrtGd9kQk0h3yn8MQ/qGyUnLSvf1BODEmKq
         lrbJifgq2sPJ0Hs0Xaeft6wr4KnVAT9VYqdBH/XW/9zJj1BjynDezgkEiNleBLLTlX9d
         Cxvmfh015wco0CmsTV0rIdDzMI4adQFUuvzPfZ3PlBMVP2CD1uXnLIbT8VLhjoWyKKjt
         /DlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784602861; x=1785207661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAe9oJKs9rYe/I0ehLfgHAp50htWUaPZa7ALyKO6fgY=;
        b=bapzQA/2roIDZFHsjCLPoOau4f6idIDaoEWeIEkykwB8+bsz1X6sIPF335F/0XKTHe
         0J9LeLH38FiJXq+yTRCy/bZK3BdHIAs0X/FSVsdWhpuCeXTvJxXhETN+Ab67q8MJGg7m
         /TT+yrYMHp0W8Lfe3yRRU8VqX5BlvGF7HUtzR1WwKPOpSmPitpSPblU9QCiH3ZN8d0V8
         brivKpAqkHv3/B5MWs0uZdUIgVa7GGYlReZiZaIilLQTCk4ppZMUvC4XFy61+BkEy4S6
         Qdlhm7tV5k51/dwo/P5azXc8YPyerPVr9sM/jFgqNK9DEi1CStzXg8EyuZoczdrzQvNG
         vX6A==
X-Forwarded-Encrypted: i=1; AHgh+RreCiR1DGKxFW7puIocFy0GysbZqzI0LSJjOnIyqAhw32n1tEvhyTXO/A9vTVUibWDFxidko061VwOSvGWqinBj@lists.infradead.org
X-Gm-Message-State: AOJu0YxskrJl7o52ciSr9vHgDUmXFQwfH6fFirByktERH7Mk11ctVv1B
	KrA2iU2tTFd0ai4GNrYNrOrhggDJd7IOaINDbBdHE5lSnH3Dyb3I8x5M
X-Gm-Gg: AfdE7cnvOnxRDlsBxA7BlqXWLjjuRxfSY5B3DouwZNs2a3LBmiVK4+T93OLmezPyHMG
	hHN65t4gycE8a1Gf/wIjXGMmSuvmLrEZvx0pEhjk4rfH1u6mvPKDRU1+vZS9U2KPjwsvW6KhVu8
	XZszK+z5FUS1jH+4W77ssMWjGHgKz0EJGZ346rh41mfPjRtkILOWvj2XDIpV2wNqjWj5TEZLnMT
	phRk07BafxFQAgDIHzu1aViMmvjyfJATLUjDNcR8mGqHyMpIWl7LhIuk2k9bIxRdpe9dVK5a8t5
	mzc6dgKNDVUBY3Dp9HGMrVjgPn1F+wW6aA2klKcGPDbut3fFcSrwGfCvSBBnNoIwRKzkqNwqaOA
	NlNrmwo73//Z3umuNnuJpmr4VPuWZ98DY1isLtZaeWOoYOE2BUGsVn0txYUDGnAZpKfsKcqJk9H
	NnQEwvqqyfiNquzmgMGJWpCUymlsc5m/kPTIk0ukn1KZ2AB7U3Ng==
X-Received: by 2002:a05:6a20:918f:b0:3bf:6c08:2847 with SMTP id adf61e73a8af0-3c3ad973f7fmr18112690637.54.1784602856639;
        Mon, 20 Jul 2026 20:00:56 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:a24:2dbd:5df3:bcf7:deda])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb8a4sm44786669eec.14.2026.07.20.20.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 20:00:55 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH] arm64: dts: rockchip: Enable USB device mode on rk3399-roc-pc-plus
Date: Tue, 21 Jul 2026 00:00:43 -0300
Message-ID: <20260721030043.84691-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_200102_384422_C3A7339F 
X-CRM114-Status: GOOD (  14.59  )
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

From: Fabio Estevam <festevam@nabladev.com>

The USB3 OTG controller on the rk3399-roc-pc-plus is forced to host
mode. As a result, it does not register a UDC and USB gadget drivers
fail with:

UDC core: g_mass_storage: couldn't find an available UDC

Describe the controller as a USB role switch and select peripheral as
the default role. This makes DWC3 register a UDC when no external role
provider has selected a host role, while retaining OTG operation and
both the USB2 and USB3 PHYs inherited from the SoC dtsi.

Tested by binding g_mass_storage and exposing the onboard eMMC to a
Linux host.

Fixes: 6d9a7bd6a13c ("arm64: dts: rockchip: add support for Firefly ROC-RK3399-PC-PLUS")
Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
index 7e8039b19be7..c733429fd5d9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
@@ -270,7 +270,9 @@ bluetooth {
 };
 
 &usbdrd_dwc3_0 {
-	dr_mode = "host";
+	dr_mode = "otg";
+	role-switch-default-mode = "peripheral";
+	usb-role-switch;
 	status = "okay";
 };
 
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64693C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lj2u/Zjo691deIvNQnGk0TPSNETy/c4N8X1lSk8Bcfw=; b=DUXLnER5TA/T5Aso6zgUTRNuMV
	lsHuvOQA8AKcEv2ZN/vLJznym+AgFT/p8pgvVIdNRJk3qKfssoeqEsOjEX4Ewch+AUaMSw6c4tmgG
	ofulB5oHbVka+Ju5MmSLewVwsB9+4YgKXCXS+cJUZT1P4ajdTluriwxfWtee5aAkdzNX6wptRjvTg
	lFI5e4qXNBAoz4hVsHPNXkayoYyB9D81DZv9+8VlaNxY+ueK7r2Fz8xtH6cGj2kgF1tu3i/PCfB9z
	BhFwZu5LlgyaaWnkmcMsScl+/waeuhp52tFmbQSOZZGx8b2Se9H+ysdw1MYhj5pxChoHvRUdl8Tbt
	RwiBVjlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EbM-0000000BHwT-3Gfd;
	Wed, 09 Sep 2026 09:28:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EbI-0000000BHrk-16d2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 09:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Lj2u/Zjo691deIvNQnGk0TPSNETy/c4N8X1lSk8Bcfw=; b=FfItZYz5xAiiXSFLOOwIqi2+mo
	75m86XooYVfiVhxItI9aiP45/hKpWVwRvrrVjKZEpw6YuwZFfCvx0WWmtNLgsAR5rYqr7VkKWxhd+
	W+7PUABcbMdVNnGoXFkC+rAtWvKCBcLL1T5utTsAeXLvmto3skromhAGcsK2GASwYFAa0spHitCdF
	ZZl5a0cBZWSMzEJuEIcj4ZugseFhvp1oW1BmrA6zbwHETHc8Ju6SsELf3hla/45aRG5erAzr2vucr
	50Q2qtGuWy1Sx1x0Z5e1p1S8aNURUFASWPAgWgs24gtUJwBbvdwvNjcTMUtEKBSD9sZ0+GtPvs8kZ
	VivVL1Qg==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4EbF-00000000zmw-28ky
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 09:28:15 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-853e2610bb4so4034878b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 02:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788946091; x=1789550891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lj2u/Zjo691deIvNQnGk0TPSNETy/c4N8X1lSk8Bcfw=;
        b=OPulyNQ/N25pHgufnlssHVJKancPA2RgtqSMTUNJigQ2clOAOCfkMbGH5KY5m5/byM
         zPOVxLMtqGTPJiRu4OxoQ5zt6k2RqvcWrHhv1u8R8+VsXJicD87+p8tyKRUV6wGdhJZp
         pZ0JRadmfpDQGScV8JsoJzHL6OovAvcS3j2ySsRAjBOXuS3v8DXQlQrGZkKYKwtBSJIM
         GFlyDdl4OL4ViVgVfhdLFo+VsY+PLjooO1tApkPzDCLzxicBgkKYXjolePKUyDS9i/5P
         yV2DcHm1OXkxpn3/5PEn1PnJu9fZkMhrYhLGB84g3ddfS7Bd0tLhijp9uQHZEiQTA8it
         NnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946091; x=1789550891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lj2u/Zjo691deIvNQnGk0TPSNETy/c4N8X1lSk8Bcfw=;
        b=Icdl0QNE3V2qAPJdS8y6/xV5sjHEcVdAdP4KSYILF17WZ1v2msBIV7HJL/tgzI+c71
         zbZoQgET5Nt8hrgXwgUjaUzBjIyTcLfpz3IPnZsCzYaPNSNeVl4/udJXWOkStR2+BO7n
         2irM54xTI4JV2XzW4nWterL6r9uQMSKSsgsMJk8C+/E4wH5sTvEdPeQ+9hHWGhWGRoms
         7eczydxzrutXQuXlD81WiDsTBU7awx2XXo8J5sv0HkZlzNrGjUUeAmjS8aX/kn3+rfm4
         O6o1ewrZNpopcs2pyLVEQXreRDmXPRdjLUQ75bQ7mgmY5yEc2C9IEiXLYGTeRY3Xebb0
         pkLw==
X-Forwarded-Encrypted: i=1; AKwUvBxYmhLzSJn/gL1zf1CdIW5td+vc9BvRL/26YlDtL73QiLBXIZtzoWqnxYQul7aIuVWMzwyOClwubumU9/Nwm1CH@lists.infradead.org
X-Gm-Message-State: AFuF++ngWuoko9SuLqRURMG2PnxsUsFSvLfzWXepLAMRtYF4HVbv4B/e
	/L6rn8PiCK8LrKBA8FAkP8VLiz0CSMikf9HQecqGSzEhFN9FLuwm2Spj
X-Gm-Gg: AYBFou2zDvWWOcHvY9BG0aAPeGUIlglhrfDu5I4GKnydiHb6MUnvg94NkjQ0QS3Jl9d
	uipDL2G92QP3ZJfh8bfkwyJ0+7HpEvTVo6mUf/McRgm12rbE2/2nMNVqJyjTn8eQsS6NRjesRlL
	Qx8wHALoUS7IbFjX9KOLpAjQSbPQBmGRP9fp3l89gX0deAotgn7Zy0ppx0TqX1eMjD0SfAx7T92
	R2pu5l31GH2KuTSdYvE+Rzl4hXh7xa11QNeMkaHSfTVd8NNmhsSrLH2uRG6D2hTgCDUCL8sf8Yk
	Sn00G5qgcB3cf15QPTANyMVEtdwipJrENAx7w2fbSu907UOjZLgN0/xMz0ihsCAiktDp2ptEqvN
	QIUIPSUJJtcBzToV8CQ/NTSTrfjlbpBj1KpyVMsuyM6JDe3mJpUu56saGCP7ZXv1rrAJcsveiM7
	flMaDGtXfQH6oyrbLYz5NwJgSjABKCITjMidVxIataXofd1RANp/kSJmZ4xyQbSpBvNKvkC5sqy
	jt6vDNOXv2U
X-Received: by 2002:a05:6a00:2d0d:b0:857:73c3:4468 with SMTP id d2e1a72fcca58-85ffeadd911mr33200033b3a.23.1788946091221;
        Wed, 09 Sep 2026 02:28:11 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-868e3aaab85sm484904b3a.22.2026.09.09.02.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:28:10 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Wed,  9 Sep 2026 17:27:28 +0800
Message-ID: <20260909092728.1859-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260909092728.1859-1-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_102813_636756_BF2C980E 
X-CRM114-Status: GOOD (  13.88  )
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

poweroff on this board drops the rails and immediately brings them back
up, so it reboots instead of staying off and U-Boot reports a power-on
reset.

Firefly's BSP drives GPIO1_D0 and GPIO1_B5 low during shutdown, before
writing the RK808's shutdown bit. Mainline does not describe GPIO1_D0 at
all, and describes GPIO1_B5 as the backlight enable GPIO - the vendor's
own backlight node has no enable GPIO. Nothing therefore releases either
line at power-off, and while the backlight owns GPIO1_B5 it can hold it
asserted, which is enough to make the board come back up on its own.

Describe both lines in the PMIC node and drop the backlight enable-gpios,
with the settle time the vendor uses.

Fixes: 171582e00db1 ("arm64: dts: rockchip: add support for firefly-rk3399 board")
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa..75b75fe 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -27,7 +27,6 @@ chosen {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		enable-gpios = <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>;
 		pwms = <&pwm0 0 25000 0>;
 		brightness-levels = <
 			  0   1   2   3   4   5   6   7
@@ -327,6 +326,9 @@ rk808: pmic@1b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_int_l>;
 		system-power-controller;
+		power-hold-gpios = <&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>,
+				   <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>;
+		power-hold-delay-ms = <200>;
 		wakeup-source;
 
 		vcc1-supply = <&vcc_sys>;
-- 
2.55.0.windows.3



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B795C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0l2hO7jjnBbgc4FxNyXYuaniEG5v8NsDWwg8qmCQlzE=; b=qIgVdPQ0ZatCxx1rVUCX+wl1Ww
	UXpHHTj2jqK25byDizqQdG43E4mUtGRsPMGrz1NU3c8NmIFjZ8ttENJG9Y2g4yTAhKBQUXQ2jM7CV
	l0gUiwk9mqo10PSoYefOcu3j4xf4IF7LmD7a8cV+k4xws79iAnptAamk0tMXl9OP8gL/IQoDwHm0/
	U2uOq+qp9I2zw4weROzP9KLC58c8iarJXjuf4rREggh861CxGHhLRZ2uV9zaChwnwWA6rVyGY15Cm
	L4A3Jax/3qrzB8SIiRCJMpCpiCUJYjt7V2cCfP2ti8sCLpManeDWKzHKqiFJ0xRcZRs5TCUCBrhQ7
	kTDUjXEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFM-000000021KF-46fu;
	Wed, 01 Jul 2026 12:40:56 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFI-000000021Hz-250p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 12:40:55 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-472493849a3so749688f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 05:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909651; x=1783514451; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0l2hO7jjnBbgc4FxNyXYuaniEG5v8NsDWwg8qmCQlzE=;
        b=DFDNUbXuvTMZ4ASBMbnvRCuj4tHz4wWeqS6OpD3C9mLdTRBp4iEWdIgpzeRTztdAwN
         UFfWp6QdEJz9Qk98siSIY1LbpWtGQ4CA5TPe3yyJIH7pGbDagchdwe6ZdpzaWPxcviOv
         8tGlLyBpgFsNki5Lyr6xGrda4pm1rYq9z2Oy8rfr4uNEiUHzLipZFQjGYJoitAl05g8h
         W8etu4svGFkaIOcMka1k8UiEUprZPrW7NyNdTIYWsIbWVEXCwjPNXVyRB1Oap4fIg0kY
         HNyUXpLGgp8p66+gSYCQ2Aq8DQeRQc//Sb/58be7RpJoYcygwi5Pc2dj8KD1mcL35zbV
         ahSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909651; x=1783514451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0l2hO7jjnBbgc4FxNyXYuaniEG5v8NsDWwg8qmCQlzE=;
        b=moMI8Q+9pTTp7rfXrGRZqVfTVmDzXcaRXpP+rJmpDRYJ2z62McOAkS/08HhIZ8NH9s
         uCCMwlCuvX0/TFXgAOSCmxzXTlVG09U5fHC4n1Bfwpo1+QEIzXjKENIENVP7o+6zIkDX
         bZtPundGwoFSTGpeMlb/MOGK8QSbMIR7OpUz2ULHsiOe3EFvdGGE+GNBk8JR5pAOWVO0
         QgUDKyoMGtykjhNAU5NICufYAW6sO6OOWDXpBDMxBNP5AxZ9sBBwwsjAkG5BTeIm6iSm
         xFV/KbjSkGJCugRQK8vcIn0P7lkD47XuJojQwT+duz2Wq5EvLC+NfUpiCmV2G6LdBCna
         2WVA==
X-Forwarded-Encrypted: i=1; AFNElJ+5UHc47/9HLG4JOV+4fCad69dV57Lq9qbjwXb7DZThq2Pec+XhQ0kiNgpuwM60oGaNUHxEO8jZN1zMlL0jhI7d@lists.infradead.org
X-Gm-Message-State: AOJu0YwbD3iXws3IiF6TLq2OJ/4KJAFwaesMu6ErAVub18SDLOjHMutu
	JxpVzvJkO5XyPVIvEtwYMPYYqj4lhBtJNc0VU26kKPOShUMSPU54Vc26xtBSF37U3VY=
X-Gm-Gg: AfdE7cmXZdAteNr/tRNgrMykKXgrvhEKRq2PJVcdjoilGOYXx9xsWde5umwMzM/r2dd
	ShQjbY2JvEEdR3d1IjqH9r3ySgRRbCkDHklfoBetH+7fFk3HFuZapvMNHAL9GQFNsBDEt0zbYqv
	6t+I0pezLiqUqdJCzAtzA3TLaBENkjBmZ+0SjjXENYHIwtSTFWmfllV3bYGyxeOJVNM9BuZFcVq
	1/XmF9VXqnRbqoBL5xvsL6rJhW4GpleqJzbhPChtK5t5+UA/mpimmzyUkMzOZAlVR1IVpp8opgF
	FJJi7s0GGQxuvR/yeHdCGRkdoHqqrRV4ncO8mIAHz7MDFxCkcfPAZpHkybO62tzE76a1/SQ1Ifz
	tQFWDmOYUszNk7c6jcl0BngIXXZ8ibxD9v5tXPflGJcne1TE11UEUHecHvz0W1Ah6LN1vKB64d5
	k0LHcoN4dgIw==
X-Received: by 2002:a05:600d:15a:10b0:492:6f6f:fa42 with SMTP id 5b1f17b1804b1-493c3dfc883mr5371895e9.37.1782909650717;
        Wed, 01 Jul 2026 05:40:50 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4bfd47sm101422335e9.2.2026.07.01.05.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:50 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:15 +0200
Subject: [PATCH v7 03/11] arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory
 region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-3-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490; i=msp@baylibre.com;
 h=from:subject:message-id; bh=UdYuVybQFPSsAf2RKB3eRhJbIK1t6vhvF1XRjODHB+U=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXru7duROEp2t5R1p8Wr4nxuTpxLDWRlPmwv/Rh6R6U
 pvefprfUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABN5ZMbwz9Jn6QGWbx4yFV8u
 Zu1pcPYVEXuiHLA5UO+fZfU6jn8REQz/jGskusKMXsTVVzwOm14a3nSXzSK79/avqprbT5feF09
 nBQA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_054054_168403_F8756FAD 
X-CRM114-Status: GOOD (  11.61  )
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

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62A defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 364 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B5B000

which results in an end at 0x9e600000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e600000 - 0x9c900000 = 0x1d00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 77c29ebe76d8 ("arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 821a9705bb7d42091d4ad0e68d8769b49c115bcd..08c73cae26c73993a613372110bfd5611c403846 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -61,7 +61,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d00000>;
 			no-map;
 		};
 

-- 
2.53.0



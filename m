Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407A6C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wwPPgxwwtMFbcc3jo+UD0CgBCi1BHmLT6dmTjrAcmuE=; b=UGLMwRDdEHWWtT6ww6MwgseeXP
	njXTvcdcn1ptzOmqRTZ51kYllN3yLBvUQNTn4f0RC2Yg4sMJ2kSbQ1I50AayKpqkHkcyw0juKSzLf
	jwGGdgHXJjdZprG0Qcy65hH84Ae4oxMluw1J4b+V66gpPLNmWjlQHET5SUTbubYXx2kI1HTu+4Yxe
	gza65atGY5/RKe3NdcJh6QrgBjYt30m5Lvjt1T9U1W3tji/eQ2eAkkhorrykmctMEXJPzSCDlCZg6
	1TFhATiL6iDkEUqmUjUkjoN4e8pvxkHLGtBXVffbjBbsmMCz8My4e1avQdEACRynLWWhBIOJ22slb
	idI4H+0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Uk9-0000000Dv2g-2BMI;
	Fri, 18 Sep 2026 09:18:53 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Uk0-0000000Dv0V-3qIh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:18:46 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso7099265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723123; x=1790327923; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwPPgxwwtMFbcc3jo+UD0CgBCi1BHmLT6dmTjrAcmuE=;
        b=NoO6gKPtgicox1zMQBXjQif94Jdl7Yq6F2di2h/0t0svZ8TwCkDhYP9RG5pwzic4j+
         l+qQmYr6lI1x7r421tgeVnQRho38AlIMpYqfgAgbbMo3mcjjXQ448MJ7ghqy7xjcjQew
         cN0ns4NOsXdJiKIv7WUCrAYIAXoEbfBu/mmGJU31MGygZMnZxZ28SOLslHjgZXB4lgpO
         9tuPpDiDE+XQDLwv7Z7BnvJjv9nLnCXCJx+Ce5UMOjTTi0b6fMJv1u/NMn9vjpKwwThs
         tyR5Kr901r4+kkAvxw5A48vZ35Snc3ywdAmK7jAmcG4qxPAJveUY0ORH1QR3bW4tIp6l
         h7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723123; x=1790327923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwPPgxwwtMFbcc3jo+UD0CgBCi1BHmLT6dmTjrAcmuE=;
        b=tswoWV7r8o2SPqmmbq2wox4KnTJ1pYSYxsnoSC+guvk6FDgq6Xeg8JtbkbilCJdnVy
         CdZrAawenvMHinhWYD2xWisBp3eRZRs6n2N4Osl4q+VuuyoIG+p05jYuUaKnzK96MTdU
         LEe2REnBQolDS3vlxoU4Uw698eg9d2kvlOJkuXLSNjJRsZBzwjQOLl8tURpuIyVJYKhX
         D2Nyh55VzJ9bPkM64cytMELTpye79igGTlOELKez/mRzD7KoRG3+IrzDTK9WXOmNsz4S
         rY52ufd64rC8kcIb/5sTOsFSADP/Z9gpUOChkZiiJSXIx5akwBWEnFy4W+0BSAdH3uUg
         k+sA==
X-Forwarded-Encrypted: i=1; AKwUvBwpiNDmJ+2KIzA10zbhzN4Ekgij7JUGMcwrYhIdNG/6RZSU7aYFoap22QndY0yqymnsDF1InHGIlS/LRcWkCGEH@lists.infradead.org
X-Gm-Message-State: AFuF++nMmOkBuOlt0JrdmYtLS7bWjVuWHEBLF7A4xJm95lNQrdst6b/0
	s0JDkkIdjsn2S5xTfh5mMqHlWdOu8T0mC7V8UcAqDFMPfensIkT48jQOx/9tsKBaB7Y=
X-Gm-Gg: AYBFou1n67VXaFvpud3KtHsjrEryDrX4BfMLFKzGD18i2pf6aYDUVeg8ewrcrqfSqeP
	vP19aHkBLWSJsM0Y9u0AiqmTXN21s1cAoZ0hEx2/xuK1enscz4iB4ElwIacYkKyIb7tq7A6x+Dk
	+/9xYnQ7wESotrESf4RMSDvV1mYW+G6W8PSG9Xkxun92Z/iyDDD5x7ng8PxC08FnNQAF78e1BSS
	QWR4HoG6E9SHDfobxu1Mal/57vf3/EWcK5XPtnbYQIuv9naUhuLJIEm7lkjInOdJLXLkN3sa52i
	vFjx8pX99tMv172Fx1Be2nFJF7/e7YbHMuWKd2udEzLAHzeQEIygmIz5nXbI6setjVbmHZvDJ/c
	ZVZfKRdSn8lhnIQkTDdCpRjxya7DgXyeRon5yMXWT08JpUI6zpEePv/EkexvNMUEvoS5H3lVcKg
	dajiek6koqinBfbfjIdJHeO5/5tkYvWopMoeVJs9DlDTrt21zz07zkk431IzvNJZGY1sw=
X-Received: by 2002:a05:600c:4ecf:b0:49f:bd3c:bc27 with SMTP id 5b1f17b1804b1-49fc574f074mr21996665e9.34.1789723122119;
        Fri, 18 Sep 2026 02:18:42 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd216028sm140092905e9.7.2026.09.18.02.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:18:41 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:45 +0200
Subject: [PATCH v9 1/9] arm64: dts: ti: k3-am62a-phycore-som: Fix wkup R5F
 memory region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-1-40972ef1f663@baylibre.com>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
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
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786; i=msp@baylibre.com;
 h=from:subject:message-id; bh=505eaWDuf/g7YFaLEG89kbctE1WjzBDcDrij4CHCfmI=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jIefHdeePXM2h1BbkvYUNb/OxfyrQh7veHfY0V3Cs
 9Rva1tZRykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAEwks4vhD+dB569HvCuOPjYN
 tAtjeOJoZHdZv8uGVaH86nJLppwpFQz/q8vZF+9dqSUzlfnV9Z0yy76VT8rYUb1bZO0vfrmLAU/
 +sgEA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_021844_992366_14AC5A4E 
X-CRM114-Status: GOOD (  11.65  )
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

AM62A additionally has a second DM firmware for edgeai whose highest
section end address reaches 0x9e700000, so the region should end there:

    0x9e700000 - 0x9c900000 = 0x1e00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 8dd0ac27fcd1 ("arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors")
Acked-by: Andrew Davis <afd@ti.com>
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index de4048a3564b..53c096da68b5 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1e00000>;
 			no-map;
 		};
 

-- 
2.55.0



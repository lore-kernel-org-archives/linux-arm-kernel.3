Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D35C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjAsvAsIopDSNBZub+7Mzfif4bOB6ySUi0hXqRqFMrk=; b=Vp93BR08aMErl8jEpXYu2/i/if
	6wXF5ME2JA7tOUL/9BsQcoVPh+31yEzMzezG8ysB+tJsSb9FcvxHBW+S84De6jIoR9nC++40pbdiD
	YjxPPBQCXVcECSlQe4C2JbYLHaiy89fhLQan9Obyk3Vp+5Xx2+inUB2C136kHETNcKedOX7zsn63L
	5Hej46FZMT7CkeCr6Q7DxzxijBNehhDIAmK/OYdhXMbXKw0KSvqXBxiG82s2cCYWIFTECcaEk6sxx
	Bp1DLKuMP5vXe2qUou90XGJz/y8Y6gXlWUpK5mtJTsyfY4rIDLCm05qOuidmYSVzpp4U6xlVrHV53
	z/lI6S3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kK-0000000HKAm-1f6S;
	Thu, 03 Sep 2026 12:40:48 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kG-0000000HK5t-0ZL7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:40:45 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4843e9c5960so2268604f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 05:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439242; x=1789044042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjAsvAsIopDSNBZub+7Mzfif4bOB6ySUi0hXqRqFMrk=;
        b=ZL+ZzkalHrsLyJKffYROOWElZ+tEcOuvM0L91qhBLpiBjFeTBLpOiUpcf5OoHddXHE
         8xSAXQCqYMd1mkk712txSe74SGuCbvBij6/LSnY2RL7tU+/fwYPJ9cY9AU83TEpgPdSV
         RmytGPBj0i8V9Df/tL5WWNe0WOwnS2Uc9AqDIHTvRwrmBtKRKyK2LscFGG3c/WUu2/Bs
         tCVZQGIHUQEt0jO3Vftr+1+vv1rj3LP++wcGSR8HBN6HlljD1cusmAAIC9rMAC2qH3Jo
         26/ggjy1pFBdAXPgFoKEpExl/eEhv7NwITbVWMHsgGaS2nN1KlbG0R/dtMXAt2XcArAJ
         j1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439242; x=1789044042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjAsvAsIopDSNBZub+7Mzfif4bOB6ySUi0hXqRqFMrk=;
        b=qXeyWNU1ScUUWV7rPdriy7PNSvJbGY4kG+uk9LNlCfGvOvZYKikI2smPdVqDUIKXx9
         2dBt+Ib6p6q6YAFKMhmw0X7q707eRZRp5RSjsSjxuC6stZX7c5IfI6MvLx0LuKqFVcya
         Yz3Omr7qG8qmd7rshBH6rE6+8iLOd6A31M7LmYtmBKZd6E/fnpiDuL3fhiWke5amiLi1
         rw9J/8ibLbK1X8/VqldYwxY8BLGGZHtxk1F5/DLTkKb4O7CJP+Cez9KnCDP2D65nOVHE
         ZcFjCFwuyTpiRusvts8RTzuicTVuTI+d3I/AP3Ax+ex3Tlw1w2aDK3E4rUY49+ytOeak
         j+ug==
X-Forwarded-Encrypted: i=1; AKwUvBzSvvlJiMF1QN3VamhlBXWirJg18+64koBTzZqJCJjLvNErfdNI1CymNhROL2w1LMBb0ryNWydfECuFt8slrk+a@lists.infradead.org
X-Gm-Message-State: AFuF++nHlQ/6c98ebRUAiawlylYu95AVOwoJJB/8zz+oaxHg7/ppF/om
	KaUw44NZgFZlRcETsj0/mrTZA5Jo7haDlX17Ec7N98D1U8BcAyqI2pAj/lpAVA+1E18=
X-Gm-Gg: AYBFou3N/pYOr5NCI12UeKIQLbvXALnCSup0Cwd2NqpoDF3mq/2c655xH7qGfuyWJRl
	+LEU1nDehF0Db5AY8tgDzBEYYIi8335Y1M5Q70HrMDHLipi8x8ROJbNcQon7FyyfZIbf+uD2MAS
	P9QPRrIRT04ZGtRKX3HlG8rgGPP0DilDZQYI8A6FBqxrFtNLv/l8p9kKnA4Hf32iGwHwK3x4d9C
	lc59asw+8ljcT4wGoe3EZ41xy5nrFDz8VYdOB2u5CQfh1dMzU6Iq9OJZzb/ENVAiqIEvHovvpEl
	sf4fEusjFN6i7vX9egOrDvDKKK/gN2qAIlFrzW4Nj4XljVn1sfyiWnTDvFXBWb9Qzd1joWmqEIB
	TjLhylZh8ab+SvE5yav+1sAU26p+o4fRE3ThPr6v0GqlqcLIb2psVmJRt+yxlTu9khW6k4Z/knd
	uot0kHzSVr52FfBtq56RXrMCGwooGfpR1pFGmjEEgmVFotOKI2N3t0i0IBGg==
X-Received: by 2002:a05:6000:2c0a:b0:482:de48:c445 with SMTP id ffacd0b85a97d-48488f07dc5mr19505275f8f.11.1788439242322;
        Thu, 03 Sep 2026 05:40:42 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed2e9fsm13847089f8f.20.2026.09.03.05.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:41 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:26 +0200
Subject: [PATCH v8 5/9] arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory
 region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-5-74c650dfdea6@baylibre.com>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=msp@baylibre.com;
 h=from:subject:message-id; bh=MzLoYwkeZwxcJvYp9xUeN2jYUVgOx/RH2raq9hcPIQ8=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWXNnyy58wzOx8QufXPfrYMnz8S9Pd/zelbPiir+Ww
 rM57oe1O0pZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAics8ZGZ4Eve7sexM1mfX2
 mibeSZvvttsoqpiz2Db0Zs+OWMNkOo/hn7rl4ZnStcuOXL+/7Dj7xKUTzT9cLvXv6r//t8dpwRv
 BSn4A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_054044_209098_422321A2 
X-CRM114-Status: GOOD (  11.60  )
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
AM62P defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000

which results in an end at 0x9e608000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e608000 - 0x9c900000 = 0x1d08000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: b05a6c145001 ("arm64: dts: ti: k3-am62p5-sk: Enable IPC with remote processors")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index b770ed82be9d..b8af9ec81b0c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -57,7 +57,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1d08000>;
 			no-map;
 		};
 

-- 
2.55.0



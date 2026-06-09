Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB006CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 19:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLMhKaFbIcEcm6K9KA6SmjkstYc3dFol4GbDZ9pO91s=; b=iBtNJH/cMUZuvDXlxig8aPxLEr
	RgP3xbxeNsVb85BFTwNZK8npyKb1iqpwNsV3OQGdMRjwlq6z62aStvKqLhaP239RnnCK3kJjwR6VG
	wHFg8p9r/jOsK9uTZ7lBBQ6CaoUs4vQfxmmVrabjlBWDgWljdHY8q5vIV0k/x3nmcDC33+nj+6Ea1
	Q8n4jIHXyZf9n1hGBJHG+MFXlzzlWMZdwT1E/ZYLYeUe6VdkjRGhbdSa4QDkIm7QcLY0GJWYf1jfF
	59zh9WMS6lIx+S/uaFzKr2SY/HDpsDOpa5342jP/S5TLTNQkiOceZqSJTzYzQsA25mAPYj8I8AC3P
	Oo1CrgTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1eB-00000006ENL-2LZs;
	Tue, 09 Jun 2026 18:57:59 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1e4-00000006EIw-3Qtz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:57:54 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-45fe59255beso3109171f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 11:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031471; x=1781636271; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZLMhKaFbIcEcm6K9KA6SmjkstYc3dFol4GbDZ9pO91s=;
        b=Xg5mIhIpVQrHI5ZmIL2c/w/8IkBpW/7/ja/6MQtw1VSt+Yh/ubOd5j8JeGHW+DRiUA
         nPLoKm+uU38o/UHnHKCD2o0K8KSeX7/7dTSIpaRMJdwTEUTBV2YLriFhK+IgmstAK4sQ
         7YC7fUXBcwc5gtCVEH1iDON41K8bnrbgnG87wc+BJmvBSCnkDLIeDdeMeNQ8UrszYqVo
         OKITTGf+0ITjHqK7hzGsSeFg0llTY5SY/OEA4uJLyZu3VBTAqxU36JxUol7GaI6afm7L
         L6+nVLsgYs/nUxxsGY25v+lBvCRlWJjbw/nkptPj8uamE8oniG8w7xy0p0/ypr8PS8bO
         7jGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031471; x=1781636271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZLMhKaFbIcEcm6K9KA6SmjkstYc3dFol4GbDZ9pO91s=;
        b=HIUGBk/BrjeTZXKpqIT5cT5Elf7iwxxs+2pX6VeZMsJVTL69gFgPmw9qeNbYg7E7gb
         S3EN7P33EU2h1dKEKoRuSDlhdc+Gy21MMe3Fo0OjdCUwm5EmXyBkG12bT/b/WafeOl3U
         IuD0V5oyQZLOdde1BReJ+ADfaNXn0a0x1i+QXNO6/RKGLnuEwq1wDMi2qOJViqE00SsI
         eSJLVhAZ9Bbg1Z8/kxSq0rJ12sL2MkMKzCDE4DTa5KqcrxUpb/i9BQyAQXJRX+k9ggqC
         9ebOqWyozQlTXAo7drXSf1ftMeE0qvTdqfxtYqqN2ojIzPzW/z2v0P04pq+q7zW0VFR/
         aJ+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8MuaZgxsmto2ShO/kkKk/jTEzMY+cz2SOS6RZnfW1UKCqIifa4Ani1rDo8a8GxNWNYwErK9hpWviMVNPX6KS6G@lists.infradead.org
X-Gm-Message-State: AOJu0YwxkAj/CHUbY2aaYQfnFzdANx2ucKFo/YkESaURnTxHGGB2GK7o
	8FA0KbvKoYY0IqpfR5rRi0a1p0qvMb/DBwdvrHLsZOATP6qDxs3mZauB11FILB4Pu40=
X-Gm-Gg: Acq92OFsYovAa1Nsxm2/7d9cw/p8Q545SY//6yGA3C7O3TK6PM1WyrmnUwKbZBb8xb0
	fiAV2Cr+JnNijJCMB3YQ2rMTzpk8VRLp5ltCoTBFMZ5s5kT4wCHlaVfgLxi69PDgGRO23+CAHLe
	0vZ+1cUDTSMqSDadN6L3QXcJLEIo8xra/4Gq01KQn6hI4TdF5RcbafpTsm85WfJU174i1ULp93L
	STRMV6vSMS6VGv0BWqtr4cqA8tFuqJptPSO1s6ZiPp7frfOXoTIfXIj9C6qkThbpM0HVmUxG2q1
	wdaAssiumhAaLfLM/dphRkPW/qSepr2H8obZVg2TmrFd9w+cw8Vcl6HmzdYBC+kJ75ZLPMt0NBc
	IGuzOk9nR27F6QMZPBM0hC4yVqZfnlV97q1LcECHTIxGW6+eZTsb0UtbqWLngtsmVKGX47rHedY
	aa4HBj07dbXvXfT3uryEz6cl/a31kAsllQjsFZw7x0Yw==
X-Received: by 2002:a05:6000:bc9:b0:45e:9417:556f with SMTP id ffacd0b85a97d-460306413bemr23436818f8f.39.1781031470876;
        Tue, 09 Jun 2026 11:57:50 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm64579981f8f.20.2026.06.09.11.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:50 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:16 +0200
Subject: [PATCH v6 04/11] arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F
 memory region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-4-16afba97fbe0@baylibre.com>
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
In-Reply-To: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1499; i=msp@baylibre.com;
 h=from:subject:message-id; bh=PgsaEoQtBnkk8LYO0JIjLGE5WMkDKUfvgkVifb7kbTo=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNxDetYY9E/+Qpmaae+nImR91ahWfDzsWLrl977qx0Z
 39p5qJNHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjAR70MM/4NyuXxOTHtyflrG
 jdrzjjeTPduXHVkZtK7j2UbO8tp1u2wYGc5l2OtcPPPO9NrEiHXLRTaYb9YK3/i4bvWSxo+LL1Z
 9W80LAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_115752_914525_DF5CA040 
X-CRM114-Status: GOOD (  11.02  )
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
Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 7ee894d59113aa727d41b7ecd6b2bc7e12760823..8a5ff5c457579c7b1be7157d235fd4b4e5c6af11 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -170,7 +170,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01e00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 	};

-- 
2.53.0



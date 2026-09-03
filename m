Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88661C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2v0qNgBoH1TXRaPo8shpK7bVX+93ymH+IULfi7N/1i8=; b=VROjqIwJ2gbF4o1iqgngbr0p6G
	JD2R+4TkvkRcgLAxCv52DMK3OLm5MKtNrNVhTfoEbeiEKQZkqHghTs/WUKa8EckOW0PcVx08ICDsE
	5zuj11y+xsLSPaSte02XuzI099lImShmvblAx7n1aZOcJCKjNcMNhmOpJgNpxlwlxAHEVvG8lt5mV
	hUyj8SVjblIv0yVaIk9nPivG/FHvdc/e1qI8G4RRNXBS2XHe8p4HLIDZEqqQio/avJTNfyQee9RNS
	TG6Duy4u8tPQfByWGhIyQZWbIxM52dfREo9HR/nO5FqV+1sGgK05DMtEuZk0G/4K5L3h9jIAhzCgf
	Jl8mpRdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kK-0000000HKBH-2M86;
	Thu, 03 Sep 2026 12:40:48 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kH-0000000HK7M-0i02
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:40:46 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1509790f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 05:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439243; x=1789044043; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2v0qNgBoH1TXRaPo8shpK7bVX+93ymH+IULfi7N/1i8=;
        b=USHAShhR5zao2hVWbqT59YMX1NuNfRx1Sk0w8SmVOSsDwXXmVi0HIr+rQqqt2gYX1r
         zcdV8LhtmYt1FxVJypmcGBUVKGDC55hgKcAKip4NHAWtYtplVpJyz96JgZo//XRUi2um
         6PW2tuPvrNgP22b5n1arUUN3/D+k2qM6hOpsvBIkPcjF9tI0gFZrTSFaeDxmdFQtXR4n
         WSTYfcvAUYBCIHxm3qB01SgD3cpWKqw10rX0xhetXdZS0mJi5jjz86hTly0b18MZlSAu
         /h4vUmH21JBl88KpfH5fGXzOC6sc+1bK/J9730PFvLZ607yjpMgPzBwiRad/tt0GA6+w
         mq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439243; x=1789044043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2v0qNgBoH1TXRaPo8shpK7bVX+93ymH+IULfi7N/1i8=;
        b=OYV/amQj2DIjFwWOzX74bXvX45Z6yEmCKoa5+TbhmdWrDVvmJidg5jXaUPV1rSUJgb
         84zy5UCL/bRVaMsomNiSzUsgR8V37ZQpBSufIt+7/W1zcHBv8u3tNknrxIk1v+vaI/J7
         fWAwnyjlgUCZoyk2MIygLzYdX8eJskEoCqIUYNwHHocBJl7O64TfVNX8J2W9+tSSv7Lt
         VlCkHXeP57/l2tGZAT8B6Qo2uCZ1LBOzRocHPmLHDp6I2MLpdZD1NeJdXn6xVG+ocAoB
         eUYt9kKBk/E/Wsn6b4l96d8/Yox8n6ZLVJnrXHwG84XDo6jaGyZKie+DRA4mSmvRYStR
         kQqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIO1PhfrhXlWoIDstHqYEuGD3WTWxd1lvi7eE6HUl4qmoBJLi40eD2O1mauTJ07xh9PDz9t9EpyNRqR6Ln7ouW@lists.infradead.org
X-Gm-Message-State: AFuF++kSJoEfsgpdwydYhI2VDgiro4Dnk++5OX0uRKODWrhwEiYdghV/
	k/hOZ7+mfQnVu/Q4UKmqhCpL74wPnprl85/rRQ+NXaSMZH37BH9hj49Z8WZ5pQ77XZ4=
X-Gm-Gg: AYBFou2OCS2GPYZWXpwjoE2s99glJ78R14Unc0NXnZ4DOzMKM9M2+BNBXa6i7Qd2f+T
	9GSa/nPl+HrVMIp9Qunf4Qhe3AGjPNUYgTb44/IX+3mASB/ocOJ4x9mSj8J8ioXI6YU3Tuur/k0
	uGOlrSsf+ZsYssh0pgsaAM+bi/Tkx5UvP3kHLkIqb1zO5EcwnGGaYdooIW4D95of1kz+Fj323AS
	s/rvLHrnIzOAJGytQl58hNwPEWedfP7k1xx42OBzpt3iGhARjHh45TrFooXXIsszHPwy6Rj/t9Q
	nL72AcGUi4MNvfqEoDWvSlT8Sh0CB460i/CiGVZaK5VdcV8aS11W55kiLw1GKqlkc2mG8hk/NY7
	YhsTA7hqM51IHSJh+WvVnOqCoBkG4Gb1e4PgKLYt/MDMx2YvbsXClfcL55QtVClksV6RJmzqR8z
	l9FYXikrijxMKCWZU5fGM5SsLjvUpuf9ozNLtAAZ3RQholoqXkBLDm4kZJHQ==
X-Received: by 2002:a05:6000:41d8:b0:484:3621:6341 with SMTP id ffacd0b85a97d-484913b97fbmr25937634f8f.15.1788439243626;
        Thu, 03 Sep 2026 05:40:43 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7fddbsm12989384f8f.11.2026.09.03.05.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:43 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:27 +0200
Subject: [PATCH v8 6/9] arm64: dts: ti: var-som-am62p: Fix wkup R5F memory
 region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-6-74c650dfdea6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=msp@baylibre.com;
 h=from:subject:message-id; bh=ZwJXMA+1QA5TucBLp3r/RzMpy1IYlsUW+V3ZnaKwxIY=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWYvKTfdd5hBzeW4ieFW+qNR3z9lQ5qnZXP17jQyd5
 tzz33yjo5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACYSU87wz/jCsTNnDzlIzmWQ
 UX7RohDwqKEkcu5ygxm3Nyx7aP8z4wDD/0Lt3VXK/InqnK/+Sy6e/ffjY/vz0WZP1qg8u5DtGfX
 TkwEA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_054045_251805_771A59F1 
X-CRM114-Status: GOOD (  11.94  )
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

The wkup_r5fss0_core0_memory_region was reserved with
0x01e00000 but the MCU SDK linker for the wkup R5F firmware on
AM62P defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000

which results in an end at 0x9e608000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e608000 - 0x9c900000 = 0x1d08000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 571562e76458 ("arm64: dts: ti: Add support for Variscite VAR-SOM-AM62P")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index 8a8dec80cb30..3d1a2c5bc464 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -71,7 +71,7 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01e00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 

-- 
2.55.0



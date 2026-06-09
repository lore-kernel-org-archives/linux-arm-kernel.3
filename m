Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37D1CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lExvIVm/qhAmBiXb4s7Ug/WTGW/jVwYWmx7ZmSxI+IU=; b=WQCbzWtOZcR4i6Nr5dkTi0/RVm
	NxJh3ASipTxYYfkZTN5Sx9ATtWkY03+baWsuhXbpNNs7tNvodT6fuTmKb0LVAm5ChXkvyWsUTRlOI
	jO4WIaORfdYmCS2egyefMXDzL1Rpuq1HN4wuDMES6suo4vB3BkzFa6cxFGILooP5h8TDzlJJKKvWR
	OTH7QD80JxYsCL/iIKn8I7qATP0cRc2V8iYj9qGfT1H/Ziqls12erWM9qOYy9vTaJe41SbsB2o2qV
	4cu+JuhFoxwJXZVwch4e7wDFYBk4qdXXYKEo9bE67fu3uTsAx5uvrldzSfCSvAmLhRomhhUgDi8um
	e/df+PGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1e5-00000006EJq-3z0f;
	Tue, 09 Jun 2026 18:57:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1e0-00000006EI2-37Di
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:57:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so22217225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 11:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031467; x=1781636267; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lExvIVm/qhAmBiXb4s7Ug/WTGW/jVwYWmx7ZmSxI+IU=;
        b=pM9/wMluWYJTRF4xx68BKK9Cneoe7ikJlGIaNPk5SerGWCQYw3uGSiqG1d4nRKtoWo
         irPnKJv2UFu3eDse3a0V+xzUVGEJfbqz1BTymdJ9dTTsPKaAimVbn2GojqNLskIclJM0
         ljZ+X7XSWRcQT8fmJAcl8u9S+GUMf2HoW3XHCNvt4M2SsZHi+C79Zwra3Suno4nSka0j
         H6JvEnZ/ke0ZMGcFORna9fnfJKIreALXpEwATVQ5rGYCbhhDUyjcYwjg2JYP0bIv01be
         D3ct//scNAvrHJbN+Ovu8+PLt9gcUqIeQk00bgC5zK0W6Hxwa8CPNEyqHGr0CA8FFgNN
         duDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031467; x=1781636267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lExvIVm/qhAmBiXb4s7Ug/WTGW/jVwYWmx7ZmSxI+IU=;
        b=LcAE3xm7k2I1QYI8rZuYWXoL7Dr6hFkr93nE5XRWTaNE7yV3H934W8sxppP7ipoNRV
         qbP9JNc7ARSBd+tOxMi9OoXWumuxTC8PFWjefsfCRahiQzRIqyY0sUScIlDP/LBkqzSO
         SX0bHDEHY7gTtQtjAe72QBzvZsWGBGpIdz6TBiM81n7MgkLq1TmguM4lcEpzSvDRrAUq
         aR42PL/kuPhMPmj70G5CmAvVV+2z5XZNoD8Sr8ksTzXkra75ys/xH8vQvokV57s58yaI
         5VIIqIZo4PUJe1ygCH5C6Ilyt/Ig/nDOEk6BLkjV8Y3BMAepTm7l+dFA04zNeZGzB3lP
         gEzg==
X-Forwarded-Encrypted: i=1; AFNElJ/aP5UZuLfVq5a7qktm1nMmuPkQKDyFXJ1HP30XjYnNEgipHMX/lgKtPmkjq9wOHiHuV0FrQFyLN3chrfghv7r0@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1zCmtNbmuL0otUE0iylzIVjmJ5WodO0/MF+mgJuJPmKYZB6hV
	wStK+GXbTnDjEV8fg0RjrqWGrVE+fX/ZlI/WZfaUzUBKRO5/ELvfhltBtWIXnoxF6vM=
X-Gm-Gg: Acq92OHt1UMrJmS8mJLqXQOgzlIBcWk2QwFgT9ejW7t94EyhGGTS6qcHCg36JO4MYjm
	VXVHJjThNsBqcGRmKSHdgcb+uNoY8pLE0/sI3fMKlLS3KfgZ2RYlqFj447dM5coQCbFfdwgvJIb
	gzNr8t2569Kz0deTAOwKjxCYcDrhWjZOOVMHd4W2k0RozLHBm99w+9eVlORcoqY1LjMAQuK7BUm
	q9H7oFQd4OSdRW8F5/wRSy+3cLBhi2tn0T92ucJ61QXBEpY7CSdDfe3quNxQVwlAaxO+TQTJLom
	2mrBr1r+tcZB4u0Vov3a5YAeuQUxfaXdmtmv2CBEiDdcMQfZGp7mJs+0JhIexepqEhIUagfcoSC
	dmEkBk7rSTc9oAf0z5DiAV8/JQxltu6i9nxkGdy9wyjo2P2PZ1CQLz0a83LgjjWWrLVODjoxvFK
	fVP8m6gMUR+BB2FBv9n2uuLfRQPLWt7+goYtguLLE2qw==
X-Received: by 2002:a05:600c:620f:b0:490:b2c9:e284 with SMTP id 5b1f17b1804b1-490c2612c43mr336277975e9.30.1781031466795;
        Tue, 09 Jun 2026 11:57:46 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm69575716f8f.23.2026.06.09.11.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:46 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:13 +0200
Subject: [PATCH v6 01/11] arm64: dts: ti: k3-am62a-phycore-som: Fix wkup
 R5F memory region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-1-16afba97fbe0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530; i=msp@baylibre.com;
 h=from:subject:message-id; bh=xJhx36MS26Ugt3HIC/X2CbJ51kDEkatoPsKwiaxCXCQ=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNxOu85+VVddJlzQuOn4l65CN2dn/N/5y0sGM1WROZ+
 0xvtyp2lLIwiHExyIopsnQmhqb9l995LHnRss0wc1iZQIYwcHEKwEQOSzAy7JnOUWdWPfGF6sqb
 kQzT/Rc+fGCoOb90vVP42f0Pvzdtr2f4Hy3XlL59582spl2LPsxxylnlxh+vHKVXaKBz4fwN52M
 xzAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_115748_841944_26E4AFC7 
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
AM62A defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 364 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B5B000

which results in an end at 0x9e600000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e600000 - 0x9c900000 = 0x1d00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 8dd0ac27fcd1 ("arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index de4048a3564bcac9558f88c94381f07db30d4f99..e13da7c95a30459e7649f284689039b89a95f651 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d00000>;
 			no-map;
 		};
 

-- 
2.53.0



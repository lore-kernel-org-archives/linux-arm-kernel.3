Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63937C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kf3srD7fS2u+LExYvQV3AaH8PE0aJrD98efi0HfByYg=; b=NNU6UNQ7LMadl5kyIgODGuUEfh
	7FVVvCEY9CcV+VqmxsxaWuzqUAeSWXD9SmZ5kToFj6o+dcXOsfDtHIV0aqYOKh0knQnydxe3ThlvJ
	gKRAdAzfwNnJ3A2Uh1PRtYAGH5nnspYjdBIWejphaExv0g+9c/OIZLJnpGKDf9WVvjSU2nF+ggKFW
	efX2V0FsaZ26oHMfO+lBFgVb6QNUkoh9R9ROR0xNYVnj81wFzemmPdqr8VyXpIeDgjgWhckeXaaTd
	TKdPQpeT6WRhxTm+yuZYbkmkxWTQg5io4CMNGoh4X+ev52zGrN+5+WXQcgmh1XZBQvh+DaiVPUlUe
	o3VA7xgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kF-0000000HK5y-0Gct;
	Thu, 03 Sep 2026 12:40:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kC-0000000HK3q-12pO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:40:41 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso16643885e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 05:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439238; x=1789044038; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kf3srD7fS2u+LExYvQV3AaH8PE0aJrD98efi0HfByYg=;
        b=n9f3bC1PRuNQzHCXrRRtUz7FUKYwsgqZFsJTZNGEUVOM6GUfKXG2c+MFDOeMHwGXjX
         QzQR4bs5mKSP7mCIH3+Isiy2iZW4Z2kECd6GJDORJ1+2YDXX8bWllXgYTaxOTK5urn0J
         dIdJxz6F0B4d/Gmdz8EcDWOBQVqclMA7TvKqGbaCjoMhHeSIA+sq7z7WDJJu3PBX/8uD
         65g4u0FLD8vVqU3KkxCqNxtnkPoJiadyVz5eflQvi570giy9Hhs7CM01SkVdvFqpGmMF
         cNG6ujtcY5iEq7zlpVH+14lPMBqU2ruMzkkHlL1mJmyJPcQU/xFBhwNj8Fr+W4Q8ir3g
         IgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439238; x=1789044038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kf3srD7fS2u+LExYvQV3AaH8PE0aJrD98efi0HfByYg=;
        b=CxIm9/Vwr3aLBaAC+K3Jl7dOCfkuqZHBYTQlI+yXBpE/LLWUtmUpS3T17RytLklJ/F
         pOt9LuqOmSwXXyUC3iA2Q3/BNpZQcsELVsTuvr7O1NYHW/O31TaW1PHsVkvDTjXt2dPK
         QaH5mVdTkcasdQEHJFE57UC0pkv0YSyLji2CwVpIzCeuxPl2IglyopEZDm65l3UBhA7s
         1vYmeelfcP2W7HNKZeOnXicKSAMZuBC78toRLd2l5uInWcF/sguRercTncK0sjTsEIfn
         FOjz70+bdenlFsp40QT2EyHYKJtJxpX4f18NwhfjiRuWzYEEvb9yr3sr9FSpDRRGiHcZ
         6vcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpdOdcxI6jt3nm+j2bl7HlZyZjihDvl0cy0cJcvdZ2tkmh9AXfL2F8s6BHCcuXeQm4GPQFFctFfBO/165/3NQ2@lists.infradead.org
X-Gm-Message-State: AFuF++kjZO9mqRiVib7+lQbqvrb+FB/I2aymkjLPD2a2PfS5YWuHcVny
	bqUqTsPL4G1gw60vwDhgX9oM4eQeR7KqDfD7s3XG4W2h95EUFcUMgSzyik8jbwXNftQ=
X-Gm-Gg: AYBFou3KCp05Z0/8XM9dXLX7fDJsMOjkx3txbAL8emRV/TDirR2OcEvNHFDBADZzSzg
	FVO/q2H5X2jHFFRydWZOi5iPMqJxoBDxfYox44M5OLNViSkTc66qfbhoZIjAy6mD+K9KJL7qhNL
	gVudvfjPz3SfUd/37dYVo4wPhD64FoDmFdqSMeBZ3S6rRiTBRXCrcXqZimhLhsK0SdqjSKNUEva
	y7UufGbLVaf4qDQAPqOK5ocvDybesKbq0qA5aRQUCmZ1Iw9AwtJGZxxNm8oOUsNw3j3c6nFvrwE
	4cHsyiofPt9RR3MX/UJ53Hvzym0IQU7C17GqS5ENEPyMQwpGbVjRrIUmvcznfOBJeldggGL/0EH
	K0j+cUTITxGXbp+a+ztdAZrAWqq1aIAbxzy29inSRiDw+r/09M0Q5pQrZv9oIAA3EHAeUJamzYH
	rlNM7FBZEN702w5MyLWNNtyuBrdFiils11/ZbhgcO4b5as2MxAH1kVxM2bPg==
X-Received: by 2002:a05:600c:3e0a:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49ce5810b5dmr269244445e9.3.1788439238198;
        Thu, 03 Sep 2026 05:40:38 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023d6sm67325465e9.8.2026.09.03.05.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:37 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:23 +0200
Subject: [PATCH v8 2/9] arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F memory
 region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-2-74c650dfdea6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Fwl8ObuLky5qFvdgJbDIgRGjpmOwOd7ZlgsEnJiZjoE=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWX13m38JvXyxaOLpF8sv9T1mFyhlVLg7f8/H89XW9
 6ac09Wa2VHKwiDGxSArpsjSmRia9l9+57HkRcs2w8xhZQIZwsDFKQATib3AyLB3b/u3p7cOyDzI
 PHJdzf+pusOLH1fXNLbt/3nzTpPn8yv+DP/UK7O5j8ed923TiFWVste9n/qrbPPpCy+V90SFFGq
 33GEAAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_054040_306969_E8A58389 
X-CRM114-Status: GOOD (  12.29  )
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
Fixes: 1544bca2f188 ("arm64: dts: ti: Add support for AM62D2-EVM")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index f5ceb6a1b5de..a8c794d07343 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1e00000>;
 			no-map;
 			bootph-pre-ram;
 		};

-- 
2.55.0



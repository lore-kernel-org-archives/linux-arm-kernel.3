Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3816FC982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1A7PS1QVqkJqgZkHTjE3VxuBN5PJKQohl6XZ/YElsz4=; b=h4BxkSBnAUaqCvwhBlO21jhdqV
	k1yuVeran/0CvEgjW9Kb6Lk6+zFrRGZXzqqCNC1yIqvQBmG/Kh0pfxV+/Y7iwlFVLmZok2qt6pbb5
	9F1DZ6lKvyf6Pn2U+8d0ILNw802++AqcQfqZFbckcBazkYIx39IPtFGMifxWZW7h/t87Y72GmPmZC
	nFW7MvFkde7Aj/e6JU7s8srWrIcMHb2VwSKUn0VT8Cv1t8DnYy3UL1VnY/+UGjvrxpb+wQ5YRg9YM
	4ZE6ZJn1LB4PWvhbxUW1rKeSuj70mlP4OFiEwOK7WRQBv1X9SdzteiOfBnvnOojXU3e+yktxedwUo
	RPwgna5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UkK-0000000Dv9S-2yQk;
	Fri, 18 Sep 2026 09:19:04 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UkI-0000000Dv7U-2yRB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:19:03 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso3995255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723141; x=1790327941; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1A7PS1QVqkJqgZkHTjE3VxuBN5PJKQohl6XZ/YElsz4=;
        b=EkQqXuY1IQNrj8nyBFGXjStirQjEwIl8L528BAHwgfnaeyM9AckPlaoUgCz50xX7K3
         jGTjXK43sUR5AM3THEYgD97/Tnrn2y+ibjqBXOP7m7oUA8snWot32MKBVQSF+ap1JXf/
         4f/38kI7kjIRHeHVceZgV0fhcqvbRoawMSa6mn7YwLRNL/0MI5T7b6fGujYX0pg4lqrB
         yT8WdRMbjIH7RrKnskHsYt3WGiJHAqMViAF7FSKGR4ozmRfebP5igW74eRVwUA+TilpI
         N9vuLb9c75e+nRKaHZHZgijNATeUrT4GrRsOtULu54U55JiP4RqTWlACvQqxgfBEX2Yy
         cLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723141; x=1790327941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1A7PS1QVqkJqgZkHTjE3VxuBN5PJKQohl6XZ/YElsz4=;
        b=jW1RSL97mGd16aRqFbaaf/b8DpwMirRJmsIaiTepFjwTSciSntuPKNWeHpITaL3IF5
         0mKmPGtkkYmxR0RUH8+y5p4hNGI1gi6MdXZal0SL0MdV19tZA91rVJ4J+cvHI19LA2jK
         rIfEsOwqdQ7YN+bfy2F83qr3hX8EiBAkFQofSmC7v7FL2bdGEQDJ5V9/fx9LLvIy7WvK
         9018VbUmFYNVCjHy9nIn/xY5Y66Oht3vUaybi6auyfVvquUwtXhP6d87t+19uCA8H+AR
         BKOL3rpIi7ZmKIpYMDtSFgkVUe+NZFKtv6faFQ19hpY9+ao2aUExEAPrI0Jty4KYVP2g
         5J3A==
X-Forwarded-Encrypted: i=1; AKwUvBxN+viZ4f0+2xbpaRUmic0whKSFPo+m1av3sIC99zGRq0zag8qMlzqq/KwHHksvnkeYAeah2Dv2Sfk4QEcJJnyT@lists.infradead.org
X-Gm-Message-State: AFuF++mH0fwmSYK8xbFL+lRav0M0g7t9HtYXhdxs+KF8Ls/uqm/4yYeE
	ekc+fn0gfR7H/zCJDjtSnTid5xrjnH0pLiae4/O8SjLy7n7RSo7NmrLKj7ZgxfCd0Ts=
X-Gm-Gg: AYBFou0yKV74uZebqI+EmHgIRjfRLlzpOjmoq32Gfynzw8B6T6yVwS2zfUtUnexc00w
	pcFLlq+bJV9UdbQZgoX0bNbL0JKhdKHyE4dYhYE/c2RdujYB08EROWQkq1ODxBy9fSgqaJa8jXp
	d1nVk3An9BKkgfG1Abdrs3Ii+h7YmDIrL0wImFlNA7ZtUQn56/lISv6uusZAcJV9bXLXACxPFpr
	FFAaG4K/rvISJeL/hA56364ZgHY3FHr+MstMzfzDx5jI6QCgRkjisuVKQC2YAYjLLuqF8nGTeCA
	LnpWt738dK/BCqB5D2yWFM7HAkULm52Tyjnko0fyxUI63lltF82ylrR/0qWfTPmtXD9TLbYz4g7
	Lo0Nbz3QaykZo+ePjkLN0L74V/bVPXRK5wLIjIB5ubg71ZxP0Vw83z5Y0mvd2vRXfApJXNQip23
	VHeCM2cTfHEVRXfGHgjWCotw8Tv461EsHyl8gluywRvwCmUdcEo3Ytq09TJ7GdxC0UHPw=
X-Received: by 2002:a05:600c:5251:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49fc5736898mr19681525e9.23.1789723141196;
        Fri, 18 Sep 2026 02:19:01 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc481c738sm25502155e9.1.2026.09.18.02.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:00 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:46 +0200
Subject: [PATCH v9 2/9] arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F memory
 region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-2-40972ef1f663@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711; i=msp@baylibre.com;
 h=from:subject:message-id; bh=JLFkTSGjzUIWuYTsCyKMnF+JWvzM56a45FnykYK086Q=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jCeOn7obHnw1gNGifKrQxqei1jUut4QKDn02OHdju
 2fjVY1HHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCR9RcY/vAqT7E8mCMnqOon
 6pknWNIaVq5RoGoYoRy1TKp0ZYlZOsN/f1m1A2FaU87eWTuFS8S8T/Z3Zpcwi+qRFfE2cwv6k36
 yAAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_021902_774796_B4FCE829 
X-CRM114-Status: GOOD (  11.97  )
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
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
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



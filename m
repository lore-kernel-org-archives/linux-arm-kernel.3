Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68519C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjFZmudxAh+ySTUFXLrbiWaAvGo3ICyw/TH1dxTohxw=; b=fv3NvFhxGb1Qtc8zBXyejkwYEx
	Lx8u5N2kDknyv+lzp+YVWKHbPTCU83GZgkSB/dck062qZOvNvabmx9qlujcordYq3wqhr0Q2Tj+9F
	7xLqU1WWDWLSr/Dvwtzh6yFbj2YILDfdVJ7Y1di5mJl4HWdxllMquMFlRs6K3YIzWbGFCKX644ulz
	9DwsqqewMCtspGmDkfuLYZD58i0+k8HLIATi+CnPFf3NhrLcqIuAJUvQUa/KIX+PCiMQA0b7ThE1N
	/MQvMrggjnGA3xLfiL5LgK+owwSoOxv8H9DWi6bIUkB8fbubgldAjUb1fH1Wm6SFva8eXGydHgWk8
	Pk3mbN/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kK-0000000HKAV-1AKx;
	Thu, 03 Sep 2026 12:40:48 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kE-0000000HK5K-2wng
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:40:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso34307535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 05:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439241; x=1789044041; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjFZmudxAh+ySTUFXLrbiWaAvGo3ICyw/TH1dxTohxw=;
        b=TmD4cBztuxTXZebhukM6RTrtnTBwNeumJZjzx/D/qS+98npm/AP+Tbfjn28nnw1/0F
         MH/fpm7kk5MS1AkGUYfxHGNB3xcitYtZNibSF1iRhF7ilm1Dh5xtNlhczhbyf5VP1CQl
         3caaJRk5QEWYgiIKaU9zkFjksL57J/oKG1NguJkGfdSqkFX68kDdsWz4eq80O6bIIFeq
         YYoqSk84+VD2XMzxeJ12xwCpDhY23VUcJIJoEG41VvRe9oPJTD3HanRZ5NdDPYttUK/t
         PET3Vr83E/yLUo9o4OrmOz59CjW7HWy6iVkvyGl7SNmeYu+UnGC278TYIfMvUJ1znd0k
         fcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439241; x=1789044041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjFZmudxAh+ySTUFXLrbiWaAvGo3ICyw/TH1dxTohxw=;
        b=sEsKx0yDiZd4HZbihN0QYfRuPR8ciKjwiAc5Bw8hZKLIwtlk6GVENQalg/14reHKQA
         TAO2eWumH/MlgB6zeAtm1EGw87v3gLtdMNdbx6e00tq1g6aiqJnMPaPWeNvk7Bly3Ewd
         5CO3tcptQ/wEWKpVCK0YpY0+PXxbZ6ysw0+yPiIJxgLxujwCgY4N22sC/NysYuG/eTd5
         SFaRbW9eEE5rStdy1xeDh4HOGukKQajTJhwzguSomyhRtpjbN+uVOIpmVL2SenSiltXd
         a97xVQH0kbgOh9GHKZ2pRH4KWnON/Yz/avxgXWMDioxGRgDp1K3LyPlQguc31tYcDhp4
         pVTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzf77POqLhXaj9FVhF4DpU6kWf0NsQTuiP4T2iHNhmRNALkxaC0q+b7Kd9UPBpmWh26+1komKsm4a6IoTAnTyXE@lists.infradead.org
X-Gm-Message-State: AFuF++ngxqAxD2yh42MNSF5nJzvlUl5rtt8e71lEP/J3BJo3rhngdobS
	Tm8H16oRY+LKBeI02HHdxotIAVz4wFSyx3Qor5zyPB71a3HgA9lpv1JnxX9fv5r7Yyw=
X-Gm-Gg: AYBFou2m86dnLfc8DxR21cfI8SPPSEypwxHzf306q0rGK7c1jIL3thoerp9Ww06uFsa
	cjxmSUVeOjE1h3vU0txVn+2zf3thw+atDBoPpIWmgictkohJEp3rcbcN3qevS/RQ3LDcyvk4B90
	N/3X1o+P0khuRYdsMmzaNUlBCfMXIILkUxSzGOWPfQLudCahTsWWVjcvM9MAKHQ//D552evl/By
	QN8zJ4KhjkBIU4vL8VMf2GNHT/EbBGATGU24t6+TI1CbDoP9gtI1z4CabVGBYsatfzxhxYcKVOl
	iglOuq/7NfB+B+THN/XOpn6CCy35HkyfZ3kf+al1s30PFDYnINX1a/x7huPsmTfnnQMp4ccBMoh
	UNc+QBR7NfiTymIJkslR6QggaMj42FhHK6e1p/3bYR6SLK/wCSTWLIqj9CLLor6jrN6smUpegjV
	Hz1L4qxq1T9N9nN5dDZ/+a6xcHzXMGqXcGD2hvJ2nNWMehw4DtkWtPl9+RpgXHRYb6SHBj
X-Received: by 2002:a05:600c:34c2:b0:499:7219:122f with SMTP id 5b1f17b1804b1-49ce581f2d9mr233935795e9.4.1788439240973;
        Thu, 03 Sep 2026 05:40:40 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4761dd1sm88257445e9.0.2026.09.03.05.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:40 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:25 +0200
Subject: [PATCH v8 4/9] arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F
 memory region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-4-74c650dfdea6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439; i=msp@baylibre.com;
 h=from:subject:message-id; bh=QsWsNZTIkr67WF9AjDgtYRNQrYQN536HF4RLuL9T4IA=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWdNFzSayXi4SfJp8vNTrucnBI8nzJm1uVQ5mMvL0n
 bAhQ/BBRykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAEwkbxrDP6Wo3EkqE9Vqzuzc
 6Nd13e8hM9Omr7aTb8sznCxPLjBnEWf4p8lTm1r9T/Pw+iMtLbryr67bFlnNd3iqMX/HgYvSHel
 HGQE=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_054042_771098_96441635 
X-CRM114-Status: GOOD (  11.52  )
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
Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 7ee894d59113..8a5ff5c45757 100644
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
2.55.0



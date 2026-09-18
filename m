Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89FFC982DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2bOba9nuIvb4gyC2eO+18NXFEOc4D/uZAI0djSNku8=; b=macHniGzl0AN2ykNEL3zG6+Xln
	rgswU9I4y2Y11UeXnF8zPRJsK/lSdj8wQcwaMW5IgvmXYyot2QoAeVuywaVg1ngz59kzqLi8zRm16
	iUj8zZH2dQtJA+ojeaUkI5pkJotm5qalUvWht+1NoquPwLy6C4wUpbN4rAaSAomz4TN5tGunuxaUy
	JVslrQwsdL5ueRuX+6XctBnZcHsvq8ke2eyJiD+TXzGIs8F/F/sJXskikfZGjEUiZvj6ClTHpiIYU
	8Zp6PnUfPYJMnb7O+k3QrHFkgxiadmIuXyT+g+ReRdJiezZ5SJ+TT4QKYOxneGrWVA8AhlgpyD2br
	Z2GvWMqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UkP-0000000DvCu-3kf1;
	Fri, 18 Sep 2026 09:19:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UkO-0000000DvBU-1rqM
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 09:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/2bOba9nuIvb4gyC2eO+18NXFEOc4D/uZAI0djSNku8=; b=YUTpE0TsBFNBM7f0t4A6VqyLTW
	F+7RBHVIy/ouKY+g23i7YHmDi1VOsl9tcODenN+1ZjVN5s0izntXzmY3J+mKy60/BLgSrVRyPseZ/
	Y8IGZzslpb1LSDIv1ceW8Co1eWGzb+tteRCiyHTCjI0pPzpU4CBw6MTxhPwci6kIzgWxJYsWY4UpL
	Sc/+ovjEe9xVr0eUznVOazYx32FU2P9HnrrFmHhnR7VMZiTECDz9s09sWyQ50tlqJjGJWbLMtct9/
	78a0nzHKzBezfwiSyd/MHTs+gZHnziKvFw1S55ZN+Wwb2OqoejRWzTEP41tBATfKHvwchSs2EkFi5
	tDsqhD8g==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7UkK-00000009qZ8-3l3T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:19:07 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f633ecdeso439827f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723143; x=1790327943; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2bOba9nuIvb4gyC2eO+18NXFEOc4D/uZAI0djSNku8=;
        b=O6Vl9RcX6tL5n1wBG6YYFgWa100/qpfnVFSzrDDDzalC0JbqBrMxFT/XrZ7/TKKmYW
         WPA/I8NWmss1Io7VEpv6bofhjZPAqOK5jRtxO74yqNRyB5eV478VMEntFLXpzMSTZ9Xk
         O0dq44TEnP7qn/wUHu7zVRD3M4kngHL0Eyvn/BQRmy9vOihxASiPDcfiKtCpz8eki1Qc
         StIeN+JPwdfECaABr/yoLEKztbxzMBk4AmjO5P6wH5tUEb86G4+ubaZIvW84Pqzzm/ay
         u/eYMk2x8soKiNvzxgHXlLFkW2Zhe/Yu7nnIa7od/Plk//mB1geVtIUk5N/Xc4S/q2K3
         OIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723143; x=1790327943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2bOba9nuIvb4gyC2eO+18NXFEOc4D/uZAI0djSNku8=;
        b=wQonTQkdyAa2LZS12FRy+2jgDYoj27cbkXMyO08saCRdIZn0LyfRXGY4QldY6Rx4VU
         Sb5QClY/jS/AYUcDXuvIwxTXkvBCwzB0d6gavEEEsAROWGU8jY46YNAzOY33IkHw6L/8
         6UpbwF2lnUwPSSnF+I8Z2Y4h1vIUPupsR9p2Rmhg9artpDFbvZQBrqG6QoMK6u2rCBNP
         U/0+8LRGS3MphRwPbYAxkwPto3C49J9/nIr3U/8zeHmWU+ZjdDWY2SM8Y3H4iEPCZm/s
         H1myXJbtQiYa4vEiqtC1g+6nwDieo1UMAv7eXcPYql7fEzSietwFuMzgh7Ssd9q3wnDZ
         rpYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMzteDb+JsSm9Bczvxv5xFE3IA6URgz6ulISOx4J5RFz39xZAd0E/tMPc//Bi9oGlR8LJyi/1hLTTKCOK89WyP@lists.infradead.org
X-Gm-Message-State: AFuF++lo77Av4+i98LVtNDBkgafRKX7MGo269qF4ydXz+p7nZ8Aer/H8
	VSxIciOo2Ld6AVpn9flCgHwmvynAbxU2Lia0V5HyHFVLtD0Q37GiwAio2w87P7bEqig=
X-Gm-Gg: AYBFou0WvOOsH8uboRqBTsjot8d8lh7uTMh958WJ2XD+BAXCLyfBPr6x9EOpVqfCcF4
	ukNPz6SZLHFelnqo+4uKT6qRZvrJR3tTx8MtBYS0PQLZBHM6z7D0zIhL3eRSFZlkBqLzqNA4jFH
	fF75nrvfGHgUyWmwAuNR/MNfU1dL/452ewGMoEfVBWTu+L+uf7MBReoy83GZUqfkJgU38l8PmEw
	JeGxd5LohnFyRJCtzOOwn9xiWko/Gk67nIvwfaLF0yJTZ7wiBPZgsIppQTzsDkJuX+BCqLNb92V
	FC38rIxHXXHR3ZJdnFrZb/exjszySfZqcZ/6uteJy1J2U+3+UaQYvHuf2p6G+uHfVik9M/Zdacq
	NyOt2qWd78QH7PMpQQZoHNxLneEEQHqshG9CzyIvof1biOF05DiZAfY+osXonQ3ith+8KWSkYD4
	QPDY1dbjkZA5VJq6UZO7yKPTwluue9jtv9DM8ao+lK+tQdzTkuNCQY1s6OzbRSPJahONVaziuz5
	hAknQ==
X-Received: by 2002:a05:6000:41cd:b0:487:62d:37d1 with SMTP id ffacd0b85a97d-4871e2664b7mr2229141f8f.29.1789723142835;
        Fri, 18 Sep 2026 02:19:02 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487200737d6sm2803599f8f.24.2026.09.18.02.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:02 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:47 +0200
Subject: [PATCH v9 3/9] arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory
 region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-3-40972ef1f663@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Bsy+D3QFn9R/hEGe07cbw74wD1PaG/3jyKHfoc+/Dhk=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jGde7z50ZbrNtpLSXMfzj92kE7sTYy6czFqz5F0Q9
 /ayiNrejlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZhIdxrDX4mVN+9HCl4p37CT
 1cdwS5rU+s87Ff+FpVeF/RbY/yytr4vhf+rj/+992Q45/wq+sjk440BG4z0D17dT+J7u9kyc4v5
 LmAkA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_101905_133000_093AF95F 
X-CRM114-Status: GOOD (  11.70  )
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
Fixes: 77c29ebe76d8 ("arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors")
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index d3b3675e7a8f..6e5419de8e35 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -61,7 +61,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1e00000>;
 			no-map;
 		};
 

-- 
2.55.0



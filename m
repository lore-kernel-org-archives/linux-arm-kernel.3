Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3DDC43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUd8aZYMR6nCW/a4VGgxXJpZ9DjCATYCWh/HUQX1mu8=; b=IBMqzfrmaHJbKTeKNAVQxGx9fY
	g/L+aSWfHP/oFRW9hUJrDbEadww63+Yh0sIiOEEV3jpYdUkSONGN/UqriGU+AuVuMWWfR1tJU/nAR
	YiC5FGoCGRlYFuPbVJ0mp4+C+xvW9g7zwlfh3SIlLbJWv5xDmKNUsnQhMCnHy09T4a/ebURx3Mmb4
	FtbVTJIzhldBHZVZj0gXrvSCOvGDcSjzixKkZGok1RWznpxk1LBoFMsYtlwdUyV2aClhQQ0FfPyVg
	KZdR6OIsqR9Bl2rophNIjbCYTt03rTX6LcVRbeH8jNswXoZJqHP9tEKIQ22sGqoxlesyAH7rpM1tC
	RAfm+jyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFP-000000021Mb-0idn;
	Wed, 01 Jul 2026 12:40:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFN-000000021Jr-1aKr
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vUd8aZYMR6nCW/a4VGgxXJpZ9DjCATYCWh/HUQX1mu8=; b=Oqxq7irfw6Yc5Zq4IxSNRehdbs
	uFiRuBjSm4ieHanKOktEt2TFrxTvF7RjttttC+I2kZZzM+1wkHwIiXl2hsG0oYCiRNLd55OyrE7Go
	x7zNrKu1uErzpbS2nwRABCRFWxs+n7fp/fP4SvFQerU3ylQzMyEz5oRhFQn25073ld+AYMie8JifF
	0bKvZm/ruKJiWVoCC6zlf7dRBkq1HFOhpQ+LGF7K5jq7MghXusq+bciZdXhv1kmxZFE1j2wDGKS5f
	bzUBxKBO1Lqz010zSJMCY/sUvgS4CbI7+OgBrWIhuoc9nyzLs/Kg/cxB1Km2NFb7ceSKhu6fVcQQm
	p5vR1sAg==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weuFK-00000002lbx-0V6Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 12:40:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493b779003fso3019325e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 05:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909652; x=1783514452; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vUd8aZYMR6nCW/a4VGgxXJpZ9DjCATYCWh/HUQX1mu8=;
        b=aIR08VtqsoNT2IdfzbMYNhZ1iewgEwUfgRdb4+/061qi33CpuJaB7Wz+uNQNrqnmh6
         8lLMjW8TmjAFbgnjgQTC6X/tmKPB+5EQIvjhU5srmbM5N2pAQHJW7To84LCJkFy3U1cr
         bOBgaKeYd0DwbwlmPn3n2LzUMuf2up26MA0vBrHzwlGEA/Js6MQifsTauPyOP+KNPBuW
         5MwXgC1gKplrQ81Vimu6K+RQ7QrLTvCqXy7UVoz8gKgN5Y9I0Erf4c4XgeajWPL/4V9H
         D6NYQC227X3CVceahal/lcRZ8usRRqO5dXwESkM/k4jLxJfkneA1l5XVmqxAZ+OLSGqs
         p+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909652; x=1783514452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vUd8aZYMR6nCW/a4VGgxXJpZ9DjCATYCWh/HUQX1mu8=;
        b=LSCqEBzQQUvD89FNqq0tNUEoKI/UbEliyoid8jsVOZY3zn10G5F+cLbA3r1CdDLzIr
         hyMGr0FwjHCZM8tfmD1l3anlwN74CKtAqFcMaxwPOU/RqM+o4rgNOEo5yeh1aQyVMleV
         CH0hIuyNWGvdQa1UyANVlZVxUB/zVEQt5uDk7Iyx2FYbOA0JWVOJL6JsvAn463JH2aDH
         4eOAQTBmcGMJLv5SNZhrOCfCz3k52/pVmuqCW7hXvnUUh9FsBTLLOeqPyP18Yoiz3OSY
         IUEJlVHLmT/rP62rXiPwxzISIwoiMnoNdh6xG3fO1FgVPMoix2aWDdU1OSooovTnvfzA
         UvSw==
X-Forwarded-Encrypted: i=1; AFNElJ9FDKbXxJaOtJvUcmeDhnx8mQrfldbiMz17WSZid8PRZWEbMEWv7hU8rRzzQLdRXxs5zLAagcYRHmFR8yFtn5i7@lists.infradead.org
X-Gm-Message-State: AOJu0YwYSXcJId/UD9oe2kYr3AX3fi22TKqyw3pLk68jE1U8u8gno2TH
	cKhEoOv47wIzWQ2juCEJd0hLYiyrqEZal2OEf7ALGgEUg9qUyaACST10Da27Q3Dymjk=
X-Gm-Gg: AfdE7clYce6CWWRSMvDKo3/CkdB/TlOQJ70bIwtXRrRVGSyuHKdYt4NZoR1s0JdDPYC
	bddK/K+B2yfM1v7lVLSAkaUEsKzzdVe/K5mfBhxYhhBf8Cy0ffdTTTbh5OogU06h/ZPbgnqD6nm
	xyHia+qRSOGHR2PcCEG/UXa7mqLV4JAYF9zAejicJZw/bAVKH6aQg+lOQuosMlwuI7J9EW7dhBQ
	OVOwtKQiSKIboVT6cYtxiL017Brs5PLtzpbUDJwXcYLl2MiWBdkgmwEVr3YufMtMOKjW54hXEzT
	FDQuObLFBumriTZXRi4IUqzOa9UTrEAomIYiVRFdaiktvJBqdTpG2ns6Q1D0MK3t6Kj32VCB6ww
	Cfu+kif98eNRdtii64KZ3dmtLZL5XAdElVi4KtfKI9Opm54R0wiofXHZPgPfnayJSwrRSbhKRCB
	AUhmTixz2OVg==
X-Received: by 2002:a05:600c:8217:b0:493:bc88:ddcf with SMTP id 5b1f17b1804b1-493c2b7d9a3mr23202485e9.23.1782909652226;
        Wed, 01 Jul 2026 05:40:52 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be810c02sm80288265e9.11.2026.07.01.05.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:51 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:16 +0200
Subject: [PATCH v7 04/11] arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F
 memory region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-4-e9db8b16821a@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495; i=msp@baylibre.com;
 h=from:subject:message-id; bh=/H8+FLcymjurbPJq5XVqqAaQz7MleqM2bK1XAD+GdZM=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXrsmaO8KOHNtu/6Oz3l9j+5fWI7q2rOo2byw4Y/+7b
 enPbVPvKGVhEONikBVTZOlMDE37L7/zWPKiZZth5rAygQxh4OIUgInoRDD8jz9kzMYkF3uKd+Zi
 4Y28O69bhSbumfZw4yru0KIHd+ReZzMy3NnoZu0Q9mJBwXoTR46CmMP9La3a+XXeDElHnfa3BLi
 yAgA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_134054_417855_F970482B 
X-CRM114-Status: GOOD (  11.48  )
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



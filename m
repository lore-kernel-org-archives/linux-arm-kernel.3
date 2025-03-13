Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F253C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 17:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVvf10Ck2ho127r39h3riZTqgWY3zjYMF5s83hBhWK4=; b=M+ZnJyx0TrznoDw5wSYsYitpQe
	317tyni920waNmAVKsAs8i6u7uKiv9nE4mKpYibG4CV7n/5wjt0cO4vM9Tb3yYKJrZXPNpn2ea88u
	r1stcIolvx+VwTNcGcydfn46X4jQllHoF+6YsCjuqTFcFtQ/0Z28LDBkITNJB8rsIrrImzmCGJYET
	s8tk8flkOJLtAXhHILfztEnrSM4zTItDM127YyCSZZeNKTe+y8YEq6r+HKBgFzVUUepFRpWSXKgi5
	WGwy778n0gXrr+SqMgkpubIfa79h0ctYr6gUg37AdE8kTAbxEPez0NC0fP7u2PwUcEuggnptDfp8q
	whut5Bug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm9Y-0000000BydV-3HDX;
	Thu, 13 Mar 2025 17:15:28 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tslo8-0000000BtGD-23x1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 16:53:21 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-219f8263ae0so23367615ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 09:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741884799; x=1742489599; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RVvf10Ck2ho127r39h3riZTqgWY3zjYMF5s83hBhWK4=;
        b=lk4YkumH0SQ6/EZH1z+VfqMp/Y/a+zRdAY21PjfgiS/O05U7PaVYV6FH29VfpIut8O
         OnAoMl3NIcZpxUzFFSZUIoAvZKQdCw/HdYEI0z+iqZ8qSTGZ5gT2aGSBLnXu5NgzBCIC
         qa/o1cV38rngf+/ALDi3D/43t9n2tsPuF7CwB3iTNcahmvuZnQ7RvYQ8odSVvr/xOprF
         vqv3vuzd342HwJDntTaNXBTdgy+0YHkxxYmHQf1cn3/d277EyEWD+/ZCZJoUxgZBoUL3
         L3/XVWQSqp+eDBy/vMAuK0s7PNq+ZsVcFtGKzyAwA+qiLghqDea1Ub6ncKJkqU/3wDmH
         Ihjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741884799; x=1742489599;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RVvf10Ck2ho127r39h3riZTqgWY3zjYMF5s83hBhWK4=;
        b=feoWgCVwSmSAmHUJlmRV1nmc5DW3B0Elkkuyre9cw2YVS/DnHs+YecSUUJfJEYBE/d
         v92Onz021wWepXezLobx04jF94VWYUwcdrgliQ8//ml6HaAAGkc13hzc0spEfBkufX3R
         yDhZDqW7fnMT5PV2r2Emb91AoU7Xcv5+GrwaCPhYcsE1A1BuOxUyqKrYLEJT32X5OGy3
         GCLwTC8g1T0ypU4Iry5qe2QUm9vmWVvDxcRhBI0SnObSR9fkpR3Qj0iyS/XQyvbA+OQy
         X1f43aJRpSSvD/Ccdk1Wdj/RPpBscgTq2HlQU4UWvcs23Vc0454brzPJXgl2dy8sXtqi
         0qGA==
X-Forwarded-Encrypted: i=1; AJvYcCXV7SrM88pLYIb27tVSyos/FlyDTjGBbgPNqGnen9MVwogYE1QL7gz7pbBYNt9dFrccbqYnOErhdpkcWoIJ08mO@lists.infradead.org
X-Gm-Message-State: AOJu0YymmZIgn/1LlyGXT+TVZv5Vz7ziHkHmanGfKCCU8K7N0bwq4ohw
	mxenTlKe+kyfgMWRPckLX95D33OFsR6K9gggScCNyYdOB5n298ph2o+rWyuuTw==
X-Gm-Gg: ASbGnct+coLxZ8oiKmL2mka+M4N1Gexl5nkKh/wVWuXJ5wXGsgSZJ1QRKoEEeVUHcHd
	syQVlZhSWMmzmQJ8Zsh0ACeseElIQs6Bh2tpLO0DI59eKCaM3Mpq7UN+wf/UNRthr4E0QkWO+A5
	x0IbJvQojlxPwDBnrUHw1hxnSEvg3qkq5JfKIlkFQfP+QVNyNF4JCMP8Irw4VjD4929CckdQBGK
	6oBKRiIdvm9YvTCSNZX0Mz0/FZMic6auw6KjHic0eB00nqffxMuBExrRVDDLVGGIAeHB0YRXL+U
	vLY9FzIbfuhkExgLbJZC4/4r+/OD6ToaaBeH1HS9ZGI1AdaXlSOgCA==
X-Google-Smtp-Source: AGHT+IFfcfuSPGO2mr5Ih54HzoCrJnTgSB49gCqwRuzftDvua6QaTJh101E/NjM3KLYPx8ydFXU52A==
X-Received: by 2002:a05:6a21:3a93:b0:1f5:7b6f:f8e8 with SMTP id adf61e73a8af0-1f58cad4b2amr19998674637.6.1741884799320;
        Thu, 13 Mar 2025 09:53:19 -0700 (PDT)
Received: from thinkpad ([120.60.60.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737115511dasm1605770b3a.60.2025.03.13.09.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 09:53:18 -0700 (PDT)
Date: Thu, 13 Mar 2025 22:23:11 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH PATCH RFC NOT TESTED 1/2] ARM: dts: ti: dra7: Correct
 ranges for PCIe and parent bus nodes
Message-ID: <20250313165311.2fj7aus3pcsg4m2c@thinkpad>
References: <20250305-dra-v1-0-8dc6d9a0e1c0@nxp.com>
 <20250305-dra-v1-1-8dc6d9a0e1c0@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250305-dra-v1-1-8dc6d9a0e1c0@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_095320_539775_DBCA7E5F 
X-CRM114-Status: GOOD (  19.96  )
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

On Wed, Mar 05, 2025 at 11:20:22AM -0500, Frank Li wrote:

If you want a specific patch to be tested, you can add [PATCH RFT] tag.C

> According to code in drivers/pci/controller/dwc/pci-dra7xx.c
> 
> dra7xx_pcie_cpu_addr_fixup()
> {
> 	return cpu_addr & DRA7XX_CPU_TO_BUS_ADDR;  //0x0FFFFFFF
> }
> 
> PCI parent bus trim high 4 bits address to 0. Correct ranges in
> target-module@51000000 to algin hardware behavior, which translate PCIe
> outbound address 0..0x0fff_ffff to 0x2000_0000..0x2fff_ffff.
> 
> Set 'config' and 'addr_space' reg values to 0.
> Change parent bus address of downstream I/O and non-prefetchable memory to
> 0.
> 
> Ensure no functional impact on the final address translation result.
> 
> Prepare for the removal of the driver’s cpu_addr_fixup().
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm/boot/dts/ti/omap/dra7.dtsi | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/dra7.dtsi b/arch/arm/boot/dts/ti/omap/dra7.dtsi
> index b709703f6c0d4..9213fdd25330b 100644
> --- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
> @@ -196,7 +196,7 @@ axi0: target-module@51000000 {
>  			#size-cells = <1>;
>  			#address-cells = <1>;
>  			ranges = <0x51000000 0x51000000 0x3000>,
> -				 <0x20000000 0x20000000 0x10000000>;
> +				 <0x00000000 0x20000000 0x10000000>;

I'm not able to interpret this properly. So this essentially means that the
parent address 0x20000000 is mapped to child address 0x00000000. And the child
address is same for other controller as well.

Also, the cpu_addr_fixup() is doing the same by masking out the upper 4 bits. I
tried looking into the DRA7 TRM, but it says (ECAM_Param_Base_Addr +
0x20000000) where ECAM_Param_Base_Addr = 0x0000_0000 to 0x0FFF_F000.

I couldn't relate TRM with the cpu_addr_fixup() callback. Can someone from TI
shed light on this?

- Mani

-- 
மணிவண்ணன் சதாசிவம்


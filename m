Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4502C982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQ30eKDuAFR8JF1rGjUCcWlt9fc9x6ssQ8iWuG4SZKs=; b=wqYoIPutLgnKhZsiUp2MuFD0Az
	0oLslkq1dJE6a8jYpwJDEc8TIhEgySbP4D2A0ccB7ZBAcfrwtOIJVCmxIQsCnAUegvuIwvLuvu2fo
	GI1SFRqdPuYdzKk2mpkQgLsgA2V7Lkgj5jmd9Jh6+V+msPasmhNQyLm0Nut1IlNfH9dqLLCt+ay4Q
	sJY/y+v/h8swETBsMZ7eIW3IO/N2oNiuEI/EQzZQTJ019E3INqXEn+rd8nMsjtt8dh6ojY781VlyB
	BK/BjBasMcA1fO2OZ5InPb8wwhiPJ9m5rHxiHV0rwA8YLIgSQ9oXj9/5orW//kxo2zr0vw5xUWqbo
	NlvdDIOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7X4n-0000000EI6Z-07Jt;
	Fri, 18 Sep 2026 11:48:21 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7X4k-0000000EI60-2zIr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:48:19 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843378fb37so309542f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 04:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789732097; x=1790336897; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yQ30eKDuAFR8JF1rGjUCcWlt9fc9x6ssQ8iWuG4SZKs=;
        b=Acw0X8NJXpTnBHer3GLVNxt0lRniaEyGt8/QJP00qYcP//6GwYythb1bhJsZCGwtpN
         kRyksa44L+Vk2KkFfgzgLZ3dvW1czdJHEzqlv9O/cDfZ+3kCUVYQFFasiDbS4jNdj/Vi
         A6RdNpzw2wxc8Mod055QQ2eiRN+PtVStUeAxyneSXIN4mHDuJdYkk9sUUoLibbo816Zw
         bJojIt36UbjKQK6FM/ykPj/ywhrUHKP/PsZUbsVn+wY5eeNlhexPyd7OgTdjkXTKhwi5
         CdyfP+xDcWdUzOeTze3GBx6bK0X8D8fYSf94rIMgsb3FaPHAJXiA5usUVjhNHkQGvGl8
         Gszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789732097; x=1790336897;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQ30eKDuAFR8JF1rGjUCcWlt9fc9x6ssQ8iWuG4SZKs=;
        b=NvDP0MbG31377ML4m3xOTe/9bTT6yU9/GPLNxm9u8WmIFOj6r8peLLdp7GIvfS02+Q
         rvT+JRIN1+DZCJpp284gr0y4+vPJbbti4/dKskov/b/9CF5fiFWsrfEWBc9lROJ6iFkk
         qqwWzPu4w1+dMN0wCMAEeq07x1XWsjsFqwRxRTE2Q/CIJTbWt2ODFNK0OgNFLzRO63Tt
         uCHvDNk0GTGuL3fazUjgXWAwHJ+vrlwtygOWAx57WILH5kOQw6NuA+visasa5s5Wmva/
         4sLa04YavMc53F4vDDNEwn4+v1p5WBaaDHsB1Katf9qvEz9z3TGXQPXO4xgmqAdRrtpZ
         dheg==
X-Forwarded-Encrypted: i=1; AKwUvBwCbQD3YUWsOQiRrDIQQiPQZvlaYUUupDt7fVN6aZG+z7n/yuL7fBQGw7IrxuiXpTSow4A14xFp5/ewxY8+nV9O@lists.infradead.org
X-Gm-Message-State: AFuF++kK6csQmhzazPGd4eoXm7qrSIcNFHNMuGK/naCtW92bSBALwDI5
	gp6lbDFDpj++qVe0xYNBM2xsSCT25bP9AZquug5JkiRz1nca6qM29fYN
X-Gm-Gg: AYBFou07CnDSy4f1XSZGm9UVHfeqMQ6qZ9WspOyDibQRkhGtn7gPizO8tXQ06oeH6La
	BalRvzwpM44MIYwv+Uc3CrdaoRLXp3AuvbtZL79h0H1gaLIqmNvYnmxBlj2foCU+Nzwh2OWAnrF
	ZYYFyxP8qxZznPjWWls1nG105Nbvi6WAXvVPnyoF8ytr9YfhowgSysWsXNwJVfRaErdry02ug9R
	xfh8B6zqVBMK07JfpnSLQeyB1JQO0OwhjZwlzdQ3Ngb+FPl95k1tdVy2G9kqC89chINn6Kr+s6T
	mYOT441+3IaKb/4/lmXwFPP9BFwNOPbu5cjmedAfQuxovY/9Do9uklGWI7LZodEIvYRnkWDcMCa
	PGMtNXAqJ15iCpBMkgmhmvLujCBODeRYxTOOgSt+j463G6QsRgKvTfpf6bZhhw4dMFzwG9hjIqB
	9uRINaw5XBAJuZCXijV88RnW8V2ZPtIiOk2xuCcORDnx14SEui17nJJdfvw1Uc8NfMNtnaJBRQF
	nsEexx2cgcoE7H2yz6uApxsb4FX//2VrEzePFj+dbmQbxiWznw9tcSrEmcKFnQwoaxVVW/uGhLm
	JOuX0pmc/P8rVTYP6AprYVLbwi0X
X-Received: by 2002:a05:6000:25fd:b0:486:e8ee:11f3 with SMTP id ffacd0b85a97d-4871e269388mr3223709f8f.31.1789732096740;
        Fri, 18 Sep 2026 04:48:16 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff57926sm3338121f8f.14.2026.09.18.04.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:48:16 -0700 (PDT)
Date: Fri, 18 Sep 2026 13:48:12 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Judith Mendez <jm@ti.com>,
	Daniel Schultz <d.schultz@phytec.de>, Andrew Davis <afd@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Devarsh Thakkar <devarsht@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Vishal Mahaveer <vishalm@ti.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Hari Nagalla <hnagalla@ti.com>
Subject: Re: [PATCH v9 9/9] arm64: dts: ti: Add wkup R5F nodes to pre-ram
 bootphase
Message-ID: <aq0k_NyB05KTBs9f@Lord-Beerus.station>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
 <20260918-topic-am62a-ioddr-dt-v6-19-v9-9-40972ef1f663@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-9-40972ef1f663@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_044818_787315_739CCCC9 
X-CRM114-Status: GOOD (  21.75  )
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

On Fri, Sep 18, 2026 at 11:17:53AM +0200, Markus Schneider-Pargmann (TI) wrote:
> For IO+DDR the wkup_r5fss0_core0 and the
> wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
> setup is done. These are used to read the lpm metadata region in
> which data is stored to resume. This needs to be done before RAM is
> in use to avoid overwriting data.
> 
> Add the bootph-pre-ram flag to the wkup_r5fss0_core0 node in both
> ipc-firmware dtsi files and to the lpm metadata region nodes of the
> AM62A and AM62P boards.
> 
> The board level bootph-pre-ram flag of k3-am62d2-evm.dts becomes
> redundant with the dtsi-wide flag and is dropped.
> 
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi     | 1 +
>  arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi | 1 +
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts              | 1 +
>  arch/arm64/boot/dts/ti/k3-am62d2-evm.dts             | 4 ----
>  arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 1 +
>  arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi          | 1 +
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts              | 1 +
>  arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi        | 1 +
>  8 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> index 7fa19ced1a23..12be777a35ca 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> @@ -80,6 +80,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
>  		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
>  			compatible = "shared-dma-pool";
>  			reg = <0x00 0x9ca08000 0x00 0x1000>;
> +			bootph-pre-ram;
>  			no-map;
>  		};
>  
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> index 94c1d60d8d7a..7beca54e75ee 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> @@ -63,6 +63,7 @@ &wkup_r5fss0 {
>  };
>  
>  &wkup_r5fss0_core0 {
> +	bootph-pre-ram;
>  	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
>  	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>  			<&wkup_r5fss0_core0_ipc_region>,
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index 871ec227def9..fe75f6b6b50b 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -74,6 +74,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
>  		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
>  			compatible = "shared-dma-pool";
>  			reg = <0x00 0x9ca08000 0x00 0x1000>;
> +			bootph-pre-ram;
>  			no-map;
>  		};
>  
> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> index 7cba3ff99e6a..f87d6d515e2b 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> @@ -800,10 +800,6 @@ partition@3fc0000 {
>  	};
>  };
>  
> -&wkup_r5fss0_core0 {
> -	bootph-pre-ram;
> -};
> -
>  &mcu_r5fss0_core0 {
>  	firmware-name = "am62d-mcu-r5f0_0-fw";
>  };
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> index 84dfbfd1986c..277d7e268cfe 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> @@ -42,6 +42,7 @@ &wkup_r5fss0 {
>  };
>  
>  &wkup_r5fss0_core0 {
> +	bootph-pre-ram;
>  	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
>  	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>  			<&wkup_r5fss0_core0_ipc_region>,
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> index 45ab9d947b3a..62a518dbbdbe 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> @@ -183,6 +183,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
>  		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
>  			compatible = "shared-dma-pool";
>  			reg = <0x00 0x9ca08000 0x00 0x1000>;
> +			bootph-pre-ram;
>  			no-map;
>  		};
>  
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> index bb027c65eddd..39af098e4db2 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> @@ -70,6 +70,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
>  		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
>  			compatible = "shared-dma-pool";
>  			reg = <0x00 0x9ca08000 0x00 0x1000>;
> +			bootph-pre-ram;
>  			no-map;
>  		};
>  
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> index 31f670fdd91d..2eefbd8d47a4 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> @@ -84,6 +84,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: r5f-memory@9ca00000 {
>  		wkup_r5fss0_core0_lpm_metadata_region: r5f-memory@9ca08000 {
>  			compatible = "shared-dma-pool";
>  			reg = <0x00 0x9ca08000 0x00 0x1000>;
> +			bootph-pre-ram;
>  			no-map;
>  		};
>  
> 
> -- 
> 2.55.0
> 

Reviewed-by: Stefano Radaelli <stefano.r@variscite.com>

Best Regards,
Stefano


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F381AC982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1yOhNj+ElbGyi6lRuftaQi3PCdfbzJzEZ9LGMpAJGw=; b=nTPs1vR7ry3EZn/sXrsQVZBY7c
	WIQ9AUqtN/oGm7txfbH/okoZ7UqJKjO6iFgWuHOly5oYdu3xUcWYQLwR1TrBvf06GkRYEvZKsI75G
	e0Gfz6a8axqXf9y6rJC5FOBAuf2gVh+Dzb4NoFUKGPNZ3IjhLBx4xzWJHIX5lWDvbvXWTM4EQ1cXt
	+sqwgIHxThRfn5SzZbVS0Aw9sI1j0pp1i1xnmgaqmxksUgPGlTZpWQaj9rybu7/+anmjcdp9800jg
	pnJGF/t+bYsHOjxQpIyB/DT7S/XUVoVaKxYZSb+2ijqkhV4O8DA9npKwPuChUY0wOav+HwRs5ClVz
	4W5U341Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7X4B-0000000EHyO-3e7G;
	Fri, 18 Sep 2026 11:47:43 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7X48-0000000EHxU-30xa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:47:42 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350faaso358200f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 04:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789732059; x=1790336859; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C1yOhNj+ElbGyi6lRuftaQi3PCdfbzJzEZ9LGMpAJGw=;
        b=hOuJlKWnLI35EBWyap0pwyuDoZMRLwUyD5rOlD75JV99B+qzMVaRp6MoJFpr+5Aay6
         v0/DEiPEwiHKNc0hVbZ2uMb+JWyhUsi/YGLetL9qToSek2aQyteyEZkNIUl72QokKH8H
         A7cy4aDdHhnxyWiH6kIK0Hr0yI6GE131+mqgzUdNVtgvzrBbJ2sQv1Rgdzig19jvdUK9
         u0bxC9ycwnMs9mrJMx+bx+dcPnXd4qtcz/FLOyg5M2EdRMABZeewx+OmEsfStNxOxTRJ
         Mqbk1Emk8Vwz5Gh9FbTyeH33OYLxRYUj+W+n/qVYeHxgvrY4TPDhxRcdL9lVsnBTjZYH
         JIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789732059; x=1790336859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C1yOhNj+ElbGyi6lRuftaQi3PCdfbzJzEZ9LGMpAJGw=;
        b=l0xcstPRNlV9bQnD3lcAWdq8Hcy//IhecdXQ4s534P2BVE1PfdbuYb3sRIB1PVwSGI
         sj/ZgnaY7ZrmEipniXaDRKwAgzUgpUZ+jGn1PKt9Hscs7DWCo5pV4dgbI3k0Ysb+n46y
         WudOBbkukvXZOrujo0gigSeQSZ9IRoTNdZyNwJPKTC857J6mJzmjMHlfrSeDspIkXgN8
         KDDtX8Yy9paRR6ntGmZdYKFlWvoNLYznH1dm/UpahL3ZKEtZDKvQ+NLI3ArHWJkFEim0
         7CycUuvs5EXSPnqyD2w4OaR5cWUio5inKCfOfrqiEyIYjsKyQwqxEd1VHdavKO54bSmv
         6dfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzmrzWMIHq5vRkZqG5lq29qanNc5crOn6kMxMXbljJakBYQ5YoejRtejJ7auuUziTvzd62pO/877XJc2DdkQv8@lists.infradead.org
X-Gm-Message-State: AFuF++n4os0qmnMcWfIko3Yiax8r7zvsrvC3e0VreJAuXyS8nhzpJFSM
	NFY2p+vBnclwDpg8POnVr8uPqO6C3rTi3juLUltkTo4UZKoQvg1sXbhp
X-Gm-Gg: AYBFou3ytVOheKoN4LhFf0cHyvG6qFHQ5MquOqJJaYMe1dhA3q1KH+hVq86ktmoaFvL
	BMFsNlbiTu/r8WUlg1AZ/KwLFIQ3z3PRdwrIGt6Th203j7dawjnmFqqiuJLkHduFwlI8e5hlGVL
	IWTcOgLkK/gE5uEi6i6q5GTSVHHN8IgfHy1Qlgd/fYakPaD9ko69e5+QDKWIQPwMNFjMS21sciC
	Um8yjzoTSuXArDSwjJCJbS0RPZovInuFVquwC0bzJ+VLy5tpXdsIV8qG0ivXnEvwYp0wAfPEDPP
	5+QOGS+TVXnRrgN0JWVLV/4gtPYWYCoaKPdW2mvdqfbLqugI7kEhmG2A4hrQNLeqxCHzrH+oHCl
	Y9KMehsElZpRJ4OUQD++01yhEiSIVrNSZ6EIWSIRW1ujPbG/C6GVF57NDO6GmT1wJxFtXiZuCS/
	BIAOC1IydUZQQIUObsCMu4O/4YhyyeBryypL7EhTirYA3uUb6vYdlqm0OyK94l214gaHreQsR0V
	BdTXfjlc63s9ZgiOP8A3tPN6M4nRSF9vzpZSqOKJnZF/rbLuGmyIpjIid3TNN9OpH/7Pv/wpEWu
	z3jTFVIrHtnZquPomVsiwVtqsb0q
X-Received: by 2002:a05:6000:4b05:b0:487:981:4df7 with SMTP id ffacd0b85a97d-4871e227b08mr2783305f8f.25.1789732058399;
        Fri, 18 Sep 2026 04:47:38 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3a8easm3594854f8f.9.2026.09.18.04.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:47:37 -0700 (PDT)
Date: Fri, 18 Sep 2026 13:47:35 +0200
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
Subject: Re: [PATCH v9 8/9] arm64: dts: ti: k3-am62p: Split r5f memory region
Message-ID: <aq0k110MlZs4-Frx@Lord-Beerus.station>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
 <20260918-topic-am62a-ioddr-dt-v6-19-v9-8-40972ef1f663@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-8-40972ef1f663@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_044740_818849_5C646CC8 
X-CRM114-Status: GOOD (  19.11  )
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

On Fri, Sep 18, 2026 at 11:17:52AM +0200, Markus Schneider-Pargmann (TI) wrote:
> Split the firmware memory region in more specific parts so it is better
> described where to find which information. Specifically the LPM metadata
> region is important as bootloader software like U-Boot has to know where
> that data is to be able to read that data.
> 
> Reviewed-by: Bryan Brattlof <bb@ti.com>
> Reviewed-by: Kendall Willis <k-willis@ti.com>
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 10 ++++++--
>  arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        | 28 ++++++++++++++++++++--
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 28 ++++++++++++++++++++--
>  arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi      | 28 ++++++++++++++++++++--
>  4 files changed, 86 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> index 5d7f701420e2..84dfbfd1986c 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> @@ -44,8 +44,14 @@ &wkup_r5fss0 {
>  &wkup_r5fss0_core0 {
>  	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
>  	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
> -			<&wkup_r5fss0_core0_memory_region>;
> -	memory-region-names = "dma", "firmware";
> +			<&wkup_r5fss0_core0_ipc_region>,
> +			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
> +			<&wkup_r5fss0_core0_lpm_metadata_region>,
> +			<&wkup_r5fss0_core0_lpm_rest_region>,
> +			<&wkup_r5fss0_core0_dm_region>;
> +	memory-region-names = "dma", "ipc", "lpm-stub",
> +			      "lpm-metadata", "lpm-context",
> +			      "dm-firmware";
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> index 8a5ff5c45757..45ab9d947b3a 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> @@ -168,9 +168,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
>  			no-map;
>  		};
>  
> -		wkup_r5fss0_core0_memory_region: memory@9c900000 {
> +		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
>  			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c900000 0x00 0x01d08000>;
> +			reg = <0x00 0x9c900000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca00000 0x00 0x8000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca08000 0x00 0x1000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca09000 0x00 0x97000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9caa0000 0x00 0x1b68000>;
>  			no-map;
>  		};
>  	};
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> index b8af9ec81b0c..bb027c65eddd 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> @@ -55,9 +55,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
>  			no-map;
>  		};
>  
> -		wkup_r5fss0_core0_memory_region: memory@9c900000 {
> +		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
>  			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c900000 0x00 0x1d08000>;
> +			reg = <0x00 0x9c900000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca00000 0x00 0x8000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca08000 0x00 0x1000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca09000 0x00 0x97000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9caa0000 0x00 0x1b68000>;
>  			no-map;
>  		};
>  
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> index 3d1a2c5bc464..31f670fdd91d 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> @@ -69,9 +69,33 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
>  			no-map;
>  		};
>  
> -		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
> +		wkup_r5fss0_core0_ipc_region: r5f-memory@9c900000 {
>  			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c900000 0x00 0x01d08000>;
> +			reg = <0x00 0x9c900000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_fs_stub_region: r5f-memory@9ca00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca00000 0x00 0x8000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_metadata_region: r5f-memory@9ca08000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca08000 0x00 0x1000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_rest_region: r5f-memory@9ca09000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca09000 0x00 0x97000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dm_region: r5f-memory@9caa0000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9caa0000 0x00 0x1b68000>;
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


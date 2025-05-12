Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19428C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkN0dlLALC2UeplpaazKbGrH2/hD5LNonlphlZCYZk4=; b=gFefDDKHfcJS6Rc/YGF93pBGQv
	HwUwXocwMQScZR1mtmUH6nnNtRM0SY2N8rk2W2IWbcobNRmjNw4PfWy+7wP+/KhOULVofVOdSsnPJ
	q9f+P5RC0XvS0i+1Y5QFGg/p+jGoBwcLKNvUmDb4MHGRZRe9/Fz/gurZV88WEKLS3RXphXbEgXOQ8
	JidC0FOKeLeUF7WgLgqz0+P1OUFl/rlT0JmdBQqD8FD863Y5YVglONizVBj8YnTTM2hSUOtmzHqVt
	eTXOzluWwjFIPczwV4wphTUJ0YPY3q1gPQ++k2LZFEFcsNxCrdviBwFlk7JZdPV19hOeK82mO7d82
	9yKdhvhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWhY-0000000AAiP-3sDp;
	Mon, 12 May 2025 17:12:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVtw-0000000A0x4-03fL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 16:21:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 842AA14BF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 09:20:58 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 47BDC3F63F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 09:21:09 -0700 (PDT)
Date: Mon, 12 May 2025 17:21:03 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: fvp: Add system timer for broadcast
 during CPU idle
Message-ID: <aCIf71dwiloB-Mrm@e110455-lin.cambridge.arm.com>
References: <20250509154640.836093-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250509154640.836093-1-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_092112_094208_8221B192 
X-CRM114-Status: GOOD (  18.15  )
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

On Fri, May 09, 2025 at 04:46:38PM +0100, Sudeep Holla wrote:
> Introduce a system-level timer node in the FVP device tree to act as
> a broadcast timer when CPUs are in context losing idle states where
> the local timer stops on entering such low power states.
> 
> This change complements recent CPU idle state additions.
> 
> Tested-by: Leo Yan <leo.yan@arm.com>
> Message-Id: <20250508103225.354925-2-sudeep.holla@arm.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

For the whole series:

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  arch/arm64/boot/dts/arm/fvp-base-revc.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> v1->v2:
> 	- Dropped clock-frequency property
> 	- Fixed #size-cell to 1 as expected by the schema
> 	- Also update the ranges property and the frame reg property
> 
> diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
> index 9e10d7a6b5a2..50b5993a2460 100644
> --- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
> +++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
> @@ -217,6 +217,19 @@ timer {
>  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>  	};
>  
> +	timer@2a810000 {
> +		compatible = "arm,armv7-timer-mem";
> +		reg = <0x0 0x2a810000 0x0 0x10000>;
> +		ranges = <0 0x0 0x2a820000 0x20000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		frame@2a830000 {
> +			frame-number = <1>;
> +			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +			reg = <0x10000 0x10000>;
> +		};
> +	};
> +
>  	pmu {
>  		compatible = "arm,armv8-pmuv3";
>  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> -- 
> 2.34.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯


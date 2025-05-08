Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFF4C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 13:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxDWqBnnq0+wHkU2v17JhuppezL34H0LyiK0moxJ7DE=; b=AXRzvocTHnITuVJLdR4lCvPdDX
	z9YRF18sLBQviZgMKCrH027hDJM6XqPTdc6ZqYJKDRSs/eOQXaUjTwuDfPYmjfNkAHRUcuRryQgeo
	CkXppG4vqHxfCBih+cmwsyeKKImdQ4ydqwztOTcorPW0htfB68MCsLPoDCPf9Zz0nzihclc+Gt8C0
	aIY1915GcvnTBIVbPM29HmEp42MWW9TjFnmwU7lemSegSiZQBzAR2iTYAGCVd1OBx/O+wNZL9fQL3
	aRUjP35zK6E2dgUoO2CLdyKDnv6A4bGshQaDB77QskeutKFp93OtX039w5ypyYTAkYKrmsj5DbPg8
	gg+M0QGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1Hb-00000000kNL-0BkY;
	Thu, 08 May 2025 13:27:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1Fd-00000000kF0-0VqX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:25:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39F8D106F;
	Thu,  8 May 2025 06:25:11 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7E1C3F58B;
	Thu,  8 May 2025 06:25:20 -0700 (PDT)
Message-ID: <9183535a-2866-4fa5-9ed4-96695f0437ee@arm.com>
Date: Thu, 8 May 2025 14:25:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: fvp: Add CPU idle states for Rev C model
To: Sudeep Holla <sudeep.holla@arm.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Leo Yan <leo.yan@arm.com>
References: <20250508103225.354925-1-sudeep.holla@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250508103225.354925-1-sudeep.holla@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_062525_260053_D131DA33 
X-CRM114-Status: GOOD (  16.20  )
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

Hi,

On 5/8/25 11:32, Sudeep Holla wrote:
> Add CPU idle state definitions to the FVP Rev C device tree to enable
> support for CPU lower power modes. This allows the system to properly
> enter low power states during idle. It is disabled by default as it is
> know to impact performance on the models.
> 
> Note that the power_state parameter(arm,psci-suspend-param) doesn't use
> the Extended StateID format for compatibility reasons on FVP.
> 
> Tested on the FVP Rev C model with PSCI support enabled firmware.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>   arch/arm64/boot/dts/arm/fvp-base-revc.dts | 32 +++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
> index 9e10d7a6b5a2..ff4e6f4d8797 100644
> --- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
> +++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
> @@ -44,6 +44,30 @@ cpus {
>   		#address-cells = <2>;
>   		#size-cells = <0>;
>   
> +		idle-states {
> +			entry-method = "arm,psci";
> +
> +			CPU_SLEEP_0: cpu-sleep-0 {
> +				compatible = "arm,idle-state";
> +				local-timer-stop;
> +				arm,psci-suspend-param = <0x0010000>;
> +				entry-latency-us = <40>;
> +				exit-latency-us = <100>;
> +				min-residency-us = <150>;
> +				status = "disabled";
> +			};
> +
> +			CLUSTER_SLEEP_0: cluster-sleep-0 {
> +				compatible = "arm,idle-state";
> +				local-timer-stop;
> +				arm,psci-suspend-param = <0x1010000>;
> +				entry-latency-us = <500>;
> +				exit-latency-us = <1000>;
> +				min-residency-us = <2500>;
> +				status = "disabled";
> +			};
> +		};
Do we need a cpu-map so we know which cpus the cluster idle affects?
> +
>   		cpu0: cpu@0 {
>   			device_type = "cpu";
>   			compatible = "arm,armv8";
> @@ -56,6 +80,7 @@ cpu0: cpu@0 {
>   			d-cache-line-size = <64>;
>   			d-cache-sets = <256>;
>   			next-level-cache = <&C0_L2>;
> +			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>   		};
>   		cpu1: cpu@100 {
>   			device_type = "cpu";
> @@ -69,6 +94,7 @@ cpu1: cpu@100 {
>   			d-cache-line-size = <64>;
>   			d-cache-sets = <256>;
>   			next-level-cache = <&C0_L2>;
> +			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>   		};
>   		cpu2: cpu@200 {
>   			device_type = "cpu";
> @@ -82,6 +108,7 @@ cpu2: cpu@200 {
>   			d-cache-line-size = <64>;
>   			d-cache-sets = <256>;
>   			next-level-cache = <&C0_L2>;
> +			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>   		};
>   		cpu3: cpu@300 {
>   			device_type = "cpu";
> @@ -95,6 +122,7 @@ cpu3: cpu@300 {
>   			d-cache-line-size = <64>;
>   			d-cache-sets = <256>;
>   			next-level-cache = <&C0_L2>;
> +			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>   		};
>   		cpu4: cpu@10000 {
>   			device_type = "cpu";
> @@ -108,6 +136,7 @@ cpu4: cpu@10000 {
>   			d-cache-line-size = <64>;
>   			d-cache-sets = <256>;
>   			next-level-cache = <&C1_L2>;
> +			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>   		};
>   		cpu5: cpu@10100 {
>   			device_type = "cpu";
> @@ -121,6 +150,7 @@ cpu5: cpu@10100 {
>   			d-cache-line-size = <64>;
>   			d-cache-sets = <256>;
>   			next-level-cache = <&C1_L2>;
> +			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>   		};
>   		cpu6: cpu@10200 {
>   			device_type = "cpu";
> @@ -134,6 +164,7 @@ cpu6: cpu@10200 {
>   			d-cache-line-size = <64>;
>   			d-cache-sets = <256>;
>   			next-level-cache = <&C1_L2>;
> +			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>   		};
>   		cpu7: cpu@10300 {
>   			device_type = "cpu";
> @@ -147,6 +178,7 @@ cpu7: cpu@10300 {
>   			d-cache-line-size = <64>;
>   			d-cache-sets = <256>;
>   			next-level-cache = <&C1_L2>;
> +			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>   		};
>   		C0_L2: l2-cache0 {
>   			compatible = "cache";

-- 
Thanks,

Ben



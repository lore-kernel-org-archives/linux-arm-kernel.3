Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF95C1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoFTNLQMy5NZltQXz2ilhexg+6uiIr8F5z9Z7TgqryM=; b=onzauvgKHxU17DGftdVbJfkE+t
	7fd+STaQueBS+u/mR201VWYnvU97GGtwkfxGroELg9uGjHHo77QDCHkVV0qakCoVxAkt4n8BliaM2
	qAvDz3nc5A6QvLTmmIWBtfDNC3JziQEa3hEtHoL7NK66jkjjDozZErL1ElQsfw130puJw8+GmO2nd
	BA9ggzbUb3ssxgTeoU5dI+Ai5bv57xOq/4Ke71sxPjeBteU7OFmSyxQNfsQPPHEvygZvuESrxgyOk
	CaoaA7z5q8d7fKc3JYxeR5/ki9hNaXAHNI5q3xZk6YbWvbk8yXqwV4Vt2spO3Sv+AoTuLvhDKXRR2
	JkwByCPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjhC-00000008TqK-0yeR;
	Thu, 27 Feb 2025 19:37:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf67-00000007nEJ-3Tnw;
	Thu, 27 Feb 2025 14:42:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED50A2BCA;
	Thu, 27 Feb 2025 06:43:00 -0800 (PST)
Received: from [10.57.78.204] (unknown [10.57.78.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5E423F673;
	Thu, 27 Feb 2025 06:42:43 -0800 (PST)
Message-ID: <8fcb202f-d1b3-4989-9777-5bafd6fed59e@arm.com>
Date: Thu, 27 Feb 2025 14:42:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: rockchip: Extract TSADC conversion tables into a
 header file
To: Dragan Simic <dsimic@manjaro.org>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org,
 linux-rockchip@lists.infradead.org, rui.zhang@intel.com, heiko@sntech.de,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Kever Yang <kever.yang@rock-chips.com>,
 Diederik de Haas <didi.debian@cknow.org>, linux-pm@vger.kernel.org
References: <08d2fc6e1972f1f90c900542bf66945d6dc6db63.1740577122.git.dsimic@manjaro.org>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <08d2fc6e1972f1f90c900542bf66945d6dc6db63.1740577122.git.dsimic@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_064247_918616_A0F8185D 
X-CRM114-Status: GOOD (  15.24  )
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

Hi Dragan,

On 2/26/25 13:42, Dragan Simic wrote:
> Move the TSADC code-to-temperature mapping tables from the Rockchip thermal
> driver to a separate header file, to no longer have the somewhat cluttering
> mapping data as part of the driver itself. [1]
> 
> These mapping tables come verbatim from the SoC technical reference manuals
> (TRMs) and the downstream kernel code, [2] and may be updated at some point
> in the future, according to the manufacturer test results, [3] so extracting
> the tables into a separate header file not just improves the readability of
> the driver code, but introduces a clear separation.
> 
> Improve the wording of the moved comment block, sprinkle a few short comments
> over the newly introduced header file, and move the already existing single
> stray #include directive in the driver code to its beginning.
> 
> [1] https://lore.kernel.org/linux-rockchip/7f17cc55-a741-4bb8-9513-0580ca6fedd3@linaro.org/T/#u
> [2] https://raw.githubusercontent.com/rockchip-linux/kernel/f8b9431ee38ed561650be7092ab93f564598daa9/drivers/thermal/rockchip_thermal.c
> [3] https://lore.kernel.org/linux-rockchip/b4ab86b56177a234f3738c477693e858@manjaro.org/T/#u
> 

I think Daniel was more thinking something about saving the
memory in the kernel. I see how this patch can help the readability
of the driver code, but that doesn't help much to not occupy the kernel
data. The driver will be built with that memory and the distro would
run on some platform with particular chip. The other chips data won't
be needed.

Why not to have that information in the DT?
That would save the memory and be configurable for only needed platform.
Please have a look into the generic thermal ADC driver and related
DT entry, which is used e.g. here [1].
That table looks similar to your info.

Regards,
Lukasz


[1] 
https://elixir.bootlin.com/linux/v6.13.4/source/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi#L136


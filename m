Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F60CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2LslndYS37sl4b5GSkI0Sg/gLuqHVi110FMtZhTLq0=; b=VyEbfHryzynB7NkHKWrnxx2M6x
	grCKGqv5OJ8WOHwRfghCT+p55w88rrfELqhBB9yYQTupf1151XStCahVDr+/4ZVs7Zo1wDhPyuGS8
	/NRE1BFUa0JN+A7tPXtcHsrGr73gXOwwtZDwNvukqoHzXVVi560d3PLzpV2HmaD0ARSLDPe6a6lrj
	gtdmm7+G7Di19qf5pKsI3kmFsejUTPJoVMBIvmIIXaBeqbdVz6qQdUrukw1rFKECEgXosCbOR0+Zh
	XBFEN0ngFRSJYBgtXBC1CmhubG3zfiZ5o6uaM4Lr6dtFx8AjO+8OgLt4ECEK1ITp1bgtMt10euhSN
	51Pvgk6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGpA-00000009ETw-3ngz;
	Thu, 01 Oct 2026 13:27:48 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGp7-00000009ETV-0WI3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:27:46 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e79a408deso41247545e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 06:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790861262; x=1791466062; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2LslndYS37sl4b5GSkI0Sg/gLuqHVi110FMtZhTLq0=;
        b=w+cPoR3EeCNj5gUq8O8Qalthkd77Jz14sWkq5s6/zzHBYvmHiXaRtYQfKtsSvGlvHd
         WnTMcAm0j6wSWQq7sx/j0lBKCIacU5LN9AI+EVHJmFfGgtzyB+yHNA97oLTQ3CQPkERm
         PP8Tlys70gC/RX1YtkrR7RyNB9RK3ZzOWvpBNUJXvqD0LVystFSvYiWihhhpoEbi4gOS
         yxF4KBWbDepZnO5SD7dAHOTweoWCZgRuHqcT7Hj1Ve2hGYRJ71HSveUstcgpIOFlc49Z
         nb14d7hLqi7Zqa91MhirbHLpVM9VuPmXCGKLH6jH0cPI0A0ixBYaCoVc7hRyrIsomgbk
         xbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790861262; x=1791466062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2LslndYS37sl4b5GSkI0Sg/gLuqHVi110FMtZhTLq0=;
        b=MJ7RtGlVchrnGBhClPJU9dYtSkgy+WHMbSMtqRyWFjBF3KB9K77ANVGWdrHpj+aLG7
         P0eeJZsCeHpG4gc5Iu0cLUc/6a/k5POmCvJlKcHXI73WPMBR0QqlqODh+GIZ7GzD/q5r
         E5wbq8tA9iS28JTYRc5XBrH0rDwBhEqfbQRChYeHTR7sBOYU8r5vXpJhlVO4X0rIkQpP
         Ha2xUcENpc09KYyoICcS6hefJN2aqmxeiCwMtjPVrweB9m0vOVATJEDhx4PK9nkpEuy1
         gxfDtKycgdXKGuODG2BQYAGg7NZx3pjr8Anp+uDaGIfZQgPww26OuL8RxRGFZbhDSuqY
         FTew==
X-Forwarded-Encrypted: i=1; AKwUvBz5P7DIE4foHFMFZPO0nOlCDBDAlqPzG5BvF7kQF18KffES40Jta2GFP9fwaJinPfpD+W4N79peYz7jf+8qtbMs@lists.infradead.org
X-Gm-Message-State: AFuF++mAwLTDvKRWomHp6ktocHA49sRDbw+olVnXtpHTn6RzWnTsoIdw
	JQJrM5INADTwUzHlxRdjHTqwm2HartzUdHo6MGzQ5JJlC4LLBqx5kJdhzdPwUYiDR0k=
X-Gm-Gg: AYBFou00j6ob0/bHnel5atZ+ONMZRGdMt7Y6dXfH8xNl30eQigsGSwlKWLMu89QYaAT
	1GMmQU2YdSxvzYgiJ6CKkPTnFjfrz49jOJx5tHUUW9bycaqNK9egv013uQYIen1NWIt7vz30ngp
	S8RUGaS/CMbNQy9A/1GZ9i/3UxmK1syFuHmbejhd7A4A4G1nIMBBoZbevCP5vA/dujDMu+JkqE9
	/KcdtMkdMMLsz+4lrIKcoYxekt3PQ11aNsOI9sHdRzgNVvQXQWs7Sblo8agNwTuesL9iZRirnw4
	7wKrhpyXTACjGPiH3EBRxYqd2yBhGyfFhu9BGqaHhpTSbn9P4xIGI/0LotHzH4a9Cvv4yGsKkt0
	PDHf0Fd69EYUax+nN65fmSlivXT7T8QJ6WQAUoVSdEG4bsd2JB2n3jf0rWyoNtAnvcvKJ4y8Wdc
	R1cV3fZeo3EYI/+rJ3WWZO4be5wHuUvd3rVNrIvwz/uQP4ua/QHua2I3iDEu+x6zX/h5q8yu/gW
	1hQzdRW
X-Received: by 2002:a05:600c:4704:b0:49f:e427:e88f with SMTP id 5b1f17b1804b1-4a01b00f659mr74999905e9.21.1790861262268;
        Thu, 01 Oct 2026 06:27:42 -0700 (PDT)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff64asm5360563f8f.10.2026.10.01.06.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:27:41 -0700 (PDT)
Message-ID: <8e305a3a-c30d-4862-9da4-8c763b9f88a0@linaro.org>
Date: Thu, 1 Oct 2026 16:27:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Thomas Turner <tturner@lineageos.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Juan Yescas <jyescas@google.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
 <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
 <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org>
 <DLSMQGCHNINR.ZPYVN1SR0GM2@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DLSMQGCHNINR.ZPYVN1SR0GM2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_062745_227155_D1A2A972 
X-CRM114-Status: GOOD (  22.42  )
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



On 9/30/26 2:54 PM, Alexey Klimov wrote:
> Hi Tudor,
> 
> On Tue Sep 29, 2026 at 10:02 AM BST, Tudor Ambarus wrote:
>> Hi, Alexey,
>> On 9/29/26 6:10 AM, Alexey Klimov wrote:
>>> Add the ACPM firmware node with cpucl0 and cpucl1 clocks. ACPM firmware
>>> protocol provides interface for all client drivers to actually use
>>> features exposed by the APM co-processor.
>>>
>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>> index 8a4771899a8e..91c6cee8f483 100644
>>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>> @@ -11,6 +11,7 @@
>>>   */
>>>  
>>>  #include <dt-bindings/clock/exynos850.h>
>>> +#include <dt-bindings/clock/samsung,exynos850-acpm.h>
>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>>>  
>>> @@ -170,6 +171,18 @@ timer: timer {
>>>  		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>>>  	};
>>>  
>>> +	firmware {
>>> +		acpm_ipc: power-management {
>>> +			compatible = "samsung,exynos850-acpm-ipc";
>>> +			mboxes = <&ap2apm_mailbox>;
>>> +			shmem = <&apm_sram>;
>>> +			clocks = <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
>>> +				 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
>>
>> Why do you describe these clocks?
> 
>>> +			clock-names = "cpucl0", "cpucl1";
> 
> To link these clocks with ACPM clocks from this list:
> (file drivers/clk/samsung/clk-acpm.c)
> 
> static const struct acpm_clk_variant exynos850_acpm_clks[] = {
> 	ACPM_CLK("mif"),
> 	ACPM_CLK("int"),
> 	ACPM_CLK("cpucl0"),
> 	ACPM_CLK("cpucl1"),
> 	ACPM_CLK("g3d"),
> 	ACPM_CLK("aud"),
> 	ACPM_CLK("cam"),
> 	ACPM_CLK("disp"),
> 	ACPM_CLK("cp"),
> };
> 
> Eventually to have some sensible/working ->recalc_rate() for ACPM
> cpucl{0,1} clocks.
> 
> Which is needed, for instance, for cpufreq_dt because it registers with:
> 
> static struct cpufreq_driver dt_cpufreq_driver = {
>         .flags = CPUFREQ_NEED_INITIAL_FREQ_CHECK |
>                  CPUFREQ_IS_COOLING_DEV,
> 
> Don't know if it answers the question (if I understood it correctly)?
> 

Thanks, Alexey. I see now that clk-acpm.c uses pdata.fw_name on the
parent (acpm_ipc) DT node to link the ACPM clocks to the CMU PLLs for
->recalc_rate(). Could you please clarify a few things in the commit
message (and below):

1. Physically, CLK_FOUT_CPUCL{0,1}_PLL are not input clocks feeding the
   APM hardware, they are the PLLs that ACPM reconfigures behind the
   scenes. Meanwhile, acpm_clk_register() sets num_parents = 1 and
   pdata.fw_name = name for all 9 clocks in exynos850_acpm_clks[].
   Since the DT node only lists "cpucl0" and "cpucl1", won't the other
   7 ACPM clocks (mif, int, g3d, aud, cam, disp, cp) remain permanently
   orphaned in CCF with rate = 0?

2. Does bypass_acpm_exynos850_get_rate() actually return the updated rate
   after clk_set_rate()? When ACPM changes the PLL frequency via IPC,
   CCF is unaware that the parent clock (fout_cpucl0_pll) changed in
   hardware. Even with CLK_GET_RATE_NOCACHE on the ACPM clock,
   __clk_recalc_rates() only reads the cached core->parent->rate without
   calling ->recalc_rate() on the parent itself. Won't parent_rate remain
   stuck at the initial boot frequency?

3. In drivers/clk/samsung/clk-exynos850.c, cpucl0_cmu_info and
   cpucl1_cmu_info still set `.manual_plls = true`.
   Does that conflict with ACPM firmware managing the CPU PLLs?

Cheers,
ta


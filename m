Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570E8CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 09:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdmz0kzi6RE7y1cY3qYWO4AaRYuoMvcjv5q9neTvVwU=; b=WxjLPele4XfO6kELPk9l228AfQ
	/0nBcEoju5SWuQHaAWgMzbL+nCzdEfxW8Pgb7UIcSQh7pSxGqUoxsAMnZw7byP/DDa9w8KP7O9q0w
	PBvtSOgPegeGIZONUX97K+EdnPQ4ksA/1cKrfGXIjbFKR0FgBxY9tFo59PuZdEX6O4AQtZeMJnZBD
	f47+dkw9JgNy6G0CZ8V7XKx3p51WoOvKZPt6PZ3gyh5kcxajIfrYuQmvUJHfexTvk5wk31Rjnr7vF
	ajaXnPqh86XVGWl6Ntpf6BRJbE1tLKSJMYSsyFq3P+HoT6S1AgHDTVcAS5CebfRP9veGPSwTVwT/K
	N7QnLjPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRle-00000007KjX-4At8;
	Tue, 16 Sep 2025 09:14:30 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRlb-00000007Kj0-2gXr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 09:14:29 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05F5A19D6;
	Tue, 16 Sep 2025 11:13:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758013984;
	bh=MUmLjdC6+9Cut1Kj9JY2ktVSjt81KSam9K5LKJOK/E0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aXaU/CYWeRBnPkP/4g6a3Sil3cZLudjVzBDjLw8JvOLmxacLE1fTO1Wm/Oyzs9RjG
	 OI19kCqqlCw0nry0YU0V1Oh6b6JOvojVTP99SAWDmkOMl/z86lR+k9L3diOPayDUKR
	 ZcVbustUWB/Hh7josSloJCADciIuHAgg80NnfW0Y=
Message-ID: <cb0f50a9-9e63-40ea-973e-937086d38136@ideasonboard.com>
Date: Tue, 16 Sep 2025 12:14:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2] pmdomain: ti-sci: Set PD on/off state according to
 the HW state
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 vishalm@ti.com, sebin.francis@ti.com, d-gole@ti.com,
 Devarsh Thakkar <devarsht@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250908-tisci-pd-boot-state-v2-1-a1a4173cf859@ideasonboard.com>
 <CAPDyKFqj1Ed85z8Zwt5hioOGhiCxX95JZcHz98b6=zXm8tjR0A@mail.gmail.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <CAPDyKFqj1Ed85z8Zwt5hioOGhiCxX95JZcHz98b6=zXm8tjR0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_021427_855109_AF6F88E2 
X-CRM114-Status: GOOD (  22.94  )
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

On 11/09/2025 17:38, Ulf Hansson wrote:
> On Mon, 8 Sept 2025 at 10:35, Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>>
>> At the moment the driver sets the power state of all the PDs it creates
>> to off, regardless of the actual HW state. This has two drawbacks:
>>
>> 1) The kernel cannot disable unused PDs automatically for power saving,
>>    as it thinks they are off already
>>
>> 2) A more specific case (but perhaps applicable to other scenarios
>>    also): bootloader enabled splash-screen cannot be kept on the screen.
>>
>> The issue in 2) is that the driver framework automatically enables the
>> device's PD before calling probe() and disables it after the probe().
>> This means that when the display subsystem (DSS) driver probes, but e.g.
>> fails due to deferred probing, the DSS PD gets turned off and the driver
>> cannot do anything to affect that.
>>
>> Solving the 2) requires more changes to actually keep the PD on during
>> the boot, but a prerequisite for it is to have the correct power state
>> for the PD.
>>
>> The downside with this patch is that it takes time to call the 'is_on'
>> op, and we need to call it for each PD. In my tests with AM62 SK, using
>> defconfig, I see an increase from ~3.5ms to ~7ms. However, the added
>> feature is valuable, so in my opinion it's worth it.
>>
>> The performance could probably be improved with a new firmware API which
>> returns the power states of all the PDs.
>>
>> There's also a related HW issue at play here: if the DSS IP is enabled
>> and active, and its PD is turned off without first disabling the DSS
>> display outputs, the DSS IP will hang and causes the kernel to halt if
>> and when the DSS driver accesses the DSS registers the next time.
>>
>> With the current upstream kernel, with this patch applied, this means
>> that if the bootloader enables the display, and the DSS driver is
>> compiled as a module, the kernel will at some point disable unused PDs,
>> including the DSS PD. When the DSS module is later loaded, it will hang
>> the kernel.
>>
>> The same issue is already there, even without this patch, as the DSS
>> driver may hit deferred probing, which causes the PD to be turned off,
>> and leading to kernel halt when the DSS driver is probed again. This
>> issue has been made quite rare with some arrangements in the DSS
>> driver's probe, but it's still there.
>>
>> With recent change from Ulf (e.g. commit 13a4b7fb6260 ("pmdomain: core:
>> Leave powered-on genpds on until late_initcall_sync")), the sync state
>> mechanism comes to rescue. It will keep the power domains enabled, until
>> the drivers have probed, or the sync-state is triggered via some other
>> mechanism (e.g. manually by the boot scripts).
>>
>> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
>> Tested-by: Kevin Hilman <khilman@baylibre.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Makes perfect sense to me! Applied for next, thanks!

Thanks!

I just noticed that the patch was marked RFC. Just for the record, the
v1 was RFC, this wasn't.

 Tomi



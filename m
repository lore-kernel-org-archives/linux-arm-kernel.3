Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBA3C982C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0nXcphHwp9TgqLtFi5f+4anqumYzSct0K8NSa3zkQU=; b=0LaxrlZZeSVKNmTXLbRnX1ymsW
	uw18tm3/JRcrGY3j+4AkQEaAriw33WlPUt3g/F1yyviXH5zMBHS2/3kz0ffq/DMuNpkZMSGJ0zfys
	acz+Avr4ZmnI2tHsST6SNi9BUVFM6UWm5TlL7DRffdtFuebXg7eA3Yw35FToAf29UglpgxrWvj9T8
	IQ/qVL/YL9GcpF48D+Y/UmewwWGmqgZeGm/+nEce16YdyymzpPPZZ6IjIyL8t9fxqn3LO3xGXCDLC
	7vgOGeDHOF2e3L+Y2dJoHB97naGkhhc/OHTVoq1NgO1Ca7FK5lOBcZHhDp29fwWRv7O83wFQ6OU3l
	gztJ42bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rXp-00000009Zzd-2fOL;
	Wed, 16 Sep 2026 15:27:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rXn-00000009Zyc-2S3M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:27:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3335176A;
	Wed, 16 Sep 2026 08:27:24 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9531F3F86F;
	Wed, 16 Sep 2026 08:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789572448; bh=/8VW9Dvo83Z09jxBj+TCP4E44skMYFi0oXPi1csETxg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fHVRJNkUub0vnRQHEeeucLmufQDlnCzbbvwgUI6h2FazgMh/QXc40U/xAGdmOy6X4
	 A4JemSKBr9Zez8hCtP8GaEenU6az1OKPCAwAM7DWrMYbWaioxLmByccOQ6fVD40mwG
	 0VhWBm1lb6s/F5eDR2GFZnd38q34ntUbhYHUNpvo=
Message-ID: <aaafc5a8-e64a-4091-b615-257e48c34781@arm.com>
Date: Wed, 16 Sep 2026 16:27:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf/arm-cmn: Fix multi-filter encoding
To: Leo Yan <leo.yan@arm.com>
Cc: will@kernel.org, mark.rutland@arm.com, ilkka@os.amperecomputing.com,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <ec590cd4cc61b54d6ad3b306b69777ad7729c9d6.1789475062.git.robin.murphy@arm.com>
 <20260916093146.GG200420@e132581.arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260916093146.GG200420@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_082731_668996_727E276C 
X-CRM114-Status: GOOD (  18.18  )
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

On 16/09/2026 10:31 am, Leo Yan wrote:
> On Tue, Sep 15, 2026 at 01:24:22PM +0100, Robin Murphy wrote:
>> The current special-case for EVICT_STATE_SEL filtering effectively
>> assigns the "filter" and "filter2" controls in the opposite order from
>> how the CMN S3 r2 TRM states "Filtering is programmed in pmu_hbt_lbt_sel
>> and pmu_evict_state_sel". On reflection, not only does this seem
>> unnecessarily non-obvious to users, but it's also likely to be a problem
>> for scaling to a full multi-filter abstraction in future. There is a
>> logical order to filters based on their bitfield positions in the
>> pmu_event_sel register, which the TRM descriptions allude to, and the
>> cmn_filter_select enum already (almost) follows, so let's fix the UABI
>> to follow suit while it's still unreleased.
>>
>> Fixes: 09178f536bb9 ("perf/arm-cmn: Plumb in new filter types")
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> It's hard to say how useful my review is, but I went through the patch
> and also asked AI to explain the rationale. It makes sense to me:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> 
> Seems we could implement a generic way to navigate filters based on
> the hardware bitfield ordering, e.g. filter_next(sel) and
> filter_prev(sel). This can be deferred until we have more combined
> filters.

Yup, that's the direction this was always heading - in the (near-ish) 
future we definitely are going to have to support different events 
having overlapping combinations of multiple filters, and even more cases 
of one event having different filters per CMN model. Thus one option I 
realised I'd like to keep open, in case arrays get too clunky, is to 
encode cmn_filter_select values in a bitmap, wherein a mapping of bits 
to CMN_EVENT_FILTER*() fields could always be implied based on this 
consistent ordering.

Thanks,
Robin.


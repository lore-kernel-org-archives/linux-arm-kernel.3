Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2C4F428EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 20:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVDNzdmCcUlsrcDPwenbU6oXuaJkJzPJ3CKGZdPSExw=; b=pLBPdsCyGQZDyJesVDe/X7Du+H
	LMjEm72iKsf6amXvbAT3wFG8aTEHPgSEZDl5w8u1oXuRyh40TXF2GI1ENVI+P/9ck9tDOXegx+fj4
	Tt6GtCebtmy4495KrJYqDeyFVg/zxp8kLhOl5EYPgepze5pPG6qZoGn+XX3mRKGZpyjlGPZUqj5Va
	iRefDzbObqJaSGTojZ3y9CqG5JhHdZs5Vhjk3t8+royK5LcqsHS+uVrMpOFxIfJMe0iReBggpnoYL
	3V6f/v7Gc9GVEyJnN59otBLSDahrUFAU7r0uD5jKZE7lj7rO9xr7PiwsJppOpq3V2IlqCr2q/SjYb
	SxtXgbsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD75f-00000001b7g-11A1;
	Wed, 15 Apr 2026 20:44:14 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD75S-00000001b6A-1qyT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 20:44:01 +0000
Received: from [10.17.149.54] (unknown [131.107.1.246])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4E13420B7128;
	Wed, 15 Apr 2026 13:43:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4E13420B7128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776285829;
	bh=jVDNzdmCcUlsrcDPwenbU6oXuaJkJzPJ3CKGZdPSExw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aB9LsrWeWonZLUidOWbtG+WGecMNAQ0eEYn9NBQlFTgSPnPJnP9+gXG098if1T0Ll
	 frn/9fedhMNADi5Q1gSjQ9lzDqwn2CDBGr7Th+5iEJ+79wx5H5/eovbgmm+hckQVKq
	 kp2rqn8yySVuHYODVKqM3J8fz3AR/KHhBuXdQZVE=
Message-ID: <58294850-4ed4-4fb4-8f46-186063b76a2f@linux.microsoft.com>
Date: Wed, 15 Apr 2026 13:43:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mmc: host: sdhci-iproc: implement the .hw_reset
 callback
To: Scott Branden <scott.branden@broadcom.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, rjui@broadcom.com,
 sbranden@broadcom.com, linux-arm-kernel@lists.infradead.org,
 tgopinath@linux.microsoft.com, adrian.hunter@intel.com,
 linux-mmc@vger.kernel.org, kernel-list@raspberrypi.com
References: <20260327222150.2108111-1-meaganlloyd@linux.microsoft.com>
 <3305684d-8517-47dd-8852-2e34d40fc712@linux.microsoft.com>
 <702c52e4-b0b3-4e1e-a40d-29e136e46d7d@broadcom.com>
 <448010ef-278c-4711-a244-447a2b1a22c1@linux.microsoft.com>
 <CA+Jzhd+_CKn1X0YDsoh9-OFeCG9sc2Q0OFfphkRaXpEA647xyQ@mail.gmail.com>
Content-Language: en-US
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
In-Reply-To: <CA+Jzhd+_CKn1X0YDsoh9-OFeCG9sc2Q0OFfphkRaXpEA647xyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_134354_847071_2844B425 
X-CRM114-Status: GOOD (  16.30  )
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


On 4/15/2026 1:23 PM, Scott Branden wrote:
> Hi Meagan,
>
> On Wed, Apr 15, 2026 at 11:08 AM Meagan Lloyd <
> meaganlloyd@linux.microsoft.com> wrote:
>
>> On 4/13/2026 10:43 AM, Florian Fainelli wrote:
>>> On 4/13/26 10:38, Meagan Lloyd wrote:
>>>> On 3/27/2026 3:21 PM, Meagan Lloyd wrote:
>>>>> Implement the .hw_reset callback so that the eMMC can be reset as
>>>>> needed
>>>>> given cap-mmc-hw-reset is set in the devicetree and the
>>>>> functionality is
>>>>> enabled on the eMMC.
>>>>>
>>>>> Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
>>>>> ---
>>>>>
>>>>> SDHCI_POWER_CONTROL[4] (SD Host Controller Standard) has been
>>>>> repurposed
>>>>> on my Broadcomm processor to be eMMC hardware reset
>>>>> (SDIO*_eMMCSDXC_CTRL[12], HRESET).
>>>>>
>>>>> Can you confirm this repurposed bit is consistent across the Broadcomm
>>>>> iProc processors and thus the .hw_reset callback can be uniformly
>>>>> applied in this driver?
>>>> Hi Ray & Scott,
>>>>
>>>> I hope you're doing well. This bit looks to have been repurposed from
>>>> the SD Host Controller Standard's VDD2 Power Control to being used for
>>>> toggling the hardware reset signal to eMMCs. Can you verify that it
>>>> applies across the iProc processors so that I may finalize this patch?
>>> Which iProc process are you using? If you are not sure this applies
>>> broadly, can you at least make it specific to the SoC you are using?
>> Yes, if it comes to that I can. I think it's overkill to roll a new
>> compat string/associated structures over this small change, hence
>> checking with Broadcomm iProc maintainers on this thread.
>>
> Which iProc processor are you using?  You will have to check with
> RaspberryPI as I think they use this driver as well.
> If that family also supports it then you probably don't need a
> compatibility string.

The processor I am using is the BCM58732. Can you help direct me to
someone who could comment from the RaspberryPi side?



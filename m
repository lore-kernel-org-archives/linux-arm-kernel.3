Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414DDCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 07:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrMMsk9VBVt4yUp2jMiSJe8MPMPTFyVYedP9FgMnb7c=; b=D7BlDY5wDqkQQEPrTyzaVFhJUt
	Q5YiLzlBtfKNxOWzEFD4ibGeW85mmzfAfsaV2Qe5j5li4UIXrYhCE09US5V7O/6FMM+tEUth0/m1X
	bog0riecMXA0FlMxiJckZuQH/y0ZknoI1JDpxLu5ci0TxgaDkFCE1YegFIDWA6edVHXuSgkG5P484
	3FrYiFAVT0IhvmeLC8JmDIfT2kGhpg5VTt+/F2lM1jy8RaEEocu450fpyglRoJ+VHM7MzPHTyZbTS
	/STPm+UzjmNPXRPRNAeWHnKEBOVcqtGk6NnLwCnsfqaf/E24aBzbcWHSAIYINyWyOTxlSwABefwob
	MXkX4jqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA1b5-00000009eao-3U78;
	Sat, 18 Oct 2025 07:43:27 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA1b3-00000009eaT-0dL5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 07:43:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CE09BC09A07;
	Sat, 18 Oct 2025 07:43:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20D6B6069D;
	Sat, 18 Oct 2025 07:43:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3132102F2343;
	Sat, 18 Oct 2025 09:42:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760773399; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=BrMMsk9VBVt4yUp2jMiSJe8MPMPTFyVYedP9FgMnb7c=;
	b=Rf0OR0T+dhtzVXq5CsJLvyo9tJp01jc+xfMcYMVyaVUy1ovb41EuvzSdNJh3q8MwMYLLOg
	eRH6oNPSnc/lvTnpjLdcSYqrpAO+I/eulSqZ5TBSJosUm+bjArDm4Mqvfa9JsYFSNs+pOn
	WDZuotNyTSJV+ODF9R7bMIzK0NCJAN8xQvsL+DN3ZsDaTZebx0kpWuwIwqVy13ITQnjBvX
	P85z/GtqPJ3bw7jVNB0JKdHwWKerNHfBrN3AuduHhy4UocMx1H5pddfrOScVGCaEskhLmD
	WvLtSpoOdsIK3Zwz0lDnx+kDriDemgk08RCAQWo4AmjSlApxCsxWE0hzsoFuJw==
Message-ID: <d40cbc17-22fa-4829-8eb0-e9fd26fc54b1@bootlin.com>
Date: Sat, 18 Oct 2025 09:42:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: stmmac: Allow supporting coarse
 adjustment mode
To: Jakub Kicinski <kuba@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015102725.1297985-3-maxime.chevallier@bootlin.com>
 <20251017182358.42f76387@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251017182358.42f76387@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_004325_602333_51FA090B 
X-CRM114-Status: GOOD (  25.64  )
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

Hi Jakub,

On 18/10/2025 03:23, Jakub Kicinski wrote:
> On Wed, 15 Oct 2025 12:27:22 +0200 Maxime Chevallier wrote:
>> The DWMAC1000 supports 2 timestamping configurations to configure how
>> frequency adjustments are made to the ptp_clock, as well as the reported
>> timestamp values.
>>
>> There was a previous attempt at upstreaming support for configuring this
>> mode by Olivier Dautricourt and Julien Beraud a few years back [1]
>>
>> In a nutshell, the timestamping can be either set in fine mode or in
>> coarse mode.
>>
>> In fine mode, which is the default, we use the overflow of an accumulator to
>> trigger frequency adjustments, but by doing so we lose precision on the
>> timetamps that are produced by the timestamping unit. The main drawback
>> is that the sub-second increment value, used to generate timestamps, can't be
>> set to lower than (2 / ptp_clock_freq).
>>
>> The "fine" qualification comes from the frequent frequency adjustments we are
>> able to do, which is perfect for a PTP follower usecase.
>>
>> In Coarse mode, we don't do frequency adjustments based on an
>> accumulator overflow. We can therefore have very fine subsecond
>> increment values, allowing for better timestamping precision. However
>> this mode works best when the ptp clock frequency is adjusted based on
>> an external signal, such as a PPS input produced by a GPS clock. This
>> mode is therefore perfect for a Grand-master usecase.
>>
>> We therefore attempt to map these 2 modes with the newly introduced
>> hwtimestamp qualifiers (precise and approx).
>>
>> Precise mode is mapped to stmmac fine mode, and is the expected default,
>> suitable for all cases and perfect for follower mode
>>
>> Approx mode is mapped to coarse mode, suitable for Grand-master.
> 
> I failed to understand what this device does and what the problem is :(
> 
> What is your ptp_clock_freq? Isn't it around 50MHz typically? 
> So 2 / ptp_freq is 40nsec (?), not too bad?

That's not too bad indeed, but it makes a difference when acting as
Grand Master, especially in this case because you don't need to
perform clock adjustments (it's sync'd through PPS in), so we might
as well take this opportunity to improve the TS.

> 
> My recollection of the idea behind that timestamping providers
> was that you can configure different filters for different providers.
> IOW that you'd be able to say:
>  - [precise] Rx stamp PTP packets 
>  -  [approx] Rx stamp all packets
> not that you'd configure precision of one piece of HW..

So far it looks like only one provider is enabled at a given time, my
understanding was that the qualifier would be used in case there
are multiple timestampers on the data path, to select the better one
(e.g. a PHY that supports TS, a MAC that supports TS, we use the 
best out of the two).

However I agree with your comments, that's exactly the kind of feedback
I was looking for. This work has been tried several times now each
time with a different uAPI path, I'm OK to consider that this is out
of the scope of the hwprov feature.

> If the HW really needs it, just lob a devlink param at it?

I'm totally OK with that. I'm not well versed into devlink, working mostly with
embedded devices with simple-ish NICs, most of them don't use devlink. Let me
give it a try then :)

Thanks for taking a look at this,

Maxime




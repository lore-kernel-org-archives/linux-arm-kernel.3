Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB5DC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nU1ObuRQwA8Re5xFXg0xi/WeWsY79c6H06Wb562el+c=; b=mENPN5ikFa6MqDeYewWx3UKjPx
	yy4ZB5L8N5Zb3DuYLEbn8Rk/FWrL+bnRHSPdn15NDMX1D1Wx8L+qI9ye73Se/+biyMPihqWj9/eBC
	MvKoWR1t/AjgLkkvhqoSfRZUEaqB4KSZ+lVY94SFR7/rD7DYskDWhUZ5HZUUwGAd+ABxxQjybvBVH
	tdRlF87+DAgyI3krhr90yw2iG06Ly+xq8cY60/6gCV/KCAqziLvgV6hdD5EB1MsY53E63S/twI3VN
	fKfmiy3eQQ4Ub21PShZ3J9vBPVrRNvNeKmt+s5L76013AfpVLP1FiIJaxCnOuZSLQvTV08QGiH7rU
	2Lblt5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ODc-00000005Zuh-2x38;
	Tue, 15 Sep 2026 08:08:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ODa-00000005ZuC-0vlA;
	Tue, 15 Sep 2026 08:08:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789459719;
	bh=/8p1/KKgF7AZxygHlK7kYYuUeZFkVQJJgm7WNvarre0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ffqRXUHKzmjQxpo2VjQtOyqv6/ogfbfK6zjfcEghA/fd9iiPcjW5kwKqWGT5+0dH7
	 K+EK4R7ozILyaoaOWDNQ2Rbi1jhtynjwrKl+DJiVoEJbXlG2WpZqlbdhNUgw5OEskB
	 VjV7ZeRd2xVkybWSx2vC/6yO4oLqyWnskIXipUvITvz2h2vBeAsdNqqcXHdfcFme0N
	 rd9jBNjgpfyaUIbpR0LSFFkiSQ/knJoiOCgBRf4ZOCvZetSx8K4vFcwrtxP3vgq4nc
	 04Z5KTmOllRmdTRLaqvLktW1ZgmTxdM5d7zREvgJws8AFpE8XO9jnXw3F57sKZ24Yl
	 ePnNsiH8KwS3g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B6A4417E0A27;
	Tue, 15 Sep 2026 10:08:38 +0200 (CEST)
Message-ID: <936fda6d-8e9e-41f1-b988-b2a4dcb4004d@collabora.com>
Date: Tue, 15 Sep 2026 10:08:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable
 errors
To: Bui Duc Phuc <phucduc.bui@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cyril Chao <Cyril.Chao@mediatek.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Dan Carpenter <error27@gmail.com>, cassiogabrielcontato@gmail.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
 <20260914072842.24420-3-phucduc.bui@gmail.com>
 <07add31d-5622-40eb-9bcf-f7cb2396fee3@collabora.com>
 <aqf7B_E7_Gv5iK2A@sirena.co.uk>
 <8f1ea5c4-d85a-43eb-8b10-3f80f8343b27@collabora.com>
 <aqf-pqvBNQ21EQZx@sirena.co.uk>
 <CAABR9nEB16gANTVf-B+sud0+11XhjCjqiCRY3hP_rnaFstB0tw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAABR9nEB16gANTVf-B+sud0+11XhjCjqiCRY3hP_rnaFstB0tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_010842_452991_F012E2C6 
X-CRM114-Status: GOOD (  25.13  )
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

On 9/15/26 08:55, Bui Duc Phuc wrote:
> Hi Mark , Angelo
> 
> Thanks both for the review.
> 
>>
>>>>   Though practically speaking the error
>>>> handling ends up being the same as if they couldn't fail since if
>>>> something goes wrong it's generally catastrophic stuff like locking the
>>>> core up completely so the end result is the same.
>>
>>> That was also an implicit point (that should've been explicit from me): if anything
>>> goes horribly wrong here, it means that it already went horribly wrong "some
>>> function calls ago", and the platform likely already locked up as you suggested.
>>
>>> In any case, I'm not against doing error checking, it's just about not doing it
>>> when it's really useless (I'm sure you understand my reasons), and I believe this
>>> specific case is one of those.
>>
>>> That said, should you prefer having error checks in such places... it's not a
>>> performance path, so I don't really have strong opinions really.
>>
>> Yeah, I think it's fine and sensible to skip the error checks in cases
>> where we can't really do anything constructive about the error.
> 
> As far as I understand it, regmap_update_bits() doesn't go straight to MMIO.
> It first passes through the regmap core, which has checks independent of
> the underlying bus:
> 
> https://elixir.bootlin.com/linux/v7.3-rc2/source/drivers/base/regmap/regmap.c#L2834
> 
> ----------------------------------------------
> if (map->cache_only)
>          return -EBUSY;
> 
> if (!regmap_readable(map, reg))
>          return -EIO;
> ----------------------------------------------
> 
> So, in my understanding, checking ret here isn't just unnecessary
> defensive programming
> for an MMIO write, it guards an assumption about PM/cache ordering, namely that
> the regmap is already out of cache_only mode by the time this runs.

You have reasons, of course, but have a wider view and check the full picture:
apll{1,2}_enable() is called only by mtk_apll_event(), which is a DAPM supply.

That call can only happen if the device is not in suspended state, so can happen
only after a call to

	regcache_cache_only(afe->regmap, false);
	regcache_sync(afe->regmap);

is done in mt8189_afe_runtime_resume().

> If that assumption were ever violated by a bug elsewhere (


> a PM race,

That would have worst consequences, and your system won't be saved by this error
check because it would crash way before reaching that...

> wrong resume ordering,

If limited to ASoC, that would break most (if not all) sound drivers, as that'd
happen at the API level, and would get fixed immediately since that'd affect way
too many platforms and architectures.

> a register missing from readable_reg, etc.),

..and that would be a driver bug, which is not the case here: the error check
though would be useful during development where you definitely want to paranoidly
check for literally everything, even "useless" things... but this driver definitely
is not in development stage, is it? :-)

> this is where it would
> get caught and reported,

...but then you still wouldn't be able to do anything about it during runtime, as
there would be no way to handle this and fix it: the driver would still act in a
broken manner.

Cheers,
Angelo

> rather than the driver silently assuming the enable succeeded when it didn't.
> 
> Best regards,
> Phuc


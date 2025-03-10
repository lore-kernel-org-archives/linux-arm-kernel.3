Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B3DC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 07:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osEFHHA8j9TYONQ8F8JDSlqbUbM3s6nOsIv91QRD3Lc=; b=3bQYhugdfveszqWSlEx68hyLvt
	GhhFGSr4r2/bLnwHWeWBPK+faJ5KhUFd8jPHzKSYaq/Bi4qMgTUuLXBdlE1AAJyu9+rJSAw7HWVb4
	zda1nCnrMUPx89UTri52q/KVD3ABn24MpQWO630NAps1bem6icWZrWxDpTdjw0lg8POlk2Av8OViy
	caqe0i6kJiyb/+C7bdL84iYrQR4wqKic/9HWmaAGhCOoaRqZyRjKqPCeC4QHKu3hba3lp650doBb/
	DiRHTrb4c6S2TSPFHrTTkeo2rBN5EeNnEwcihwNodvuv48FLZvVQ/PqHdgoEQzuUA4bH7CgzAQwRK
	EmHMCovQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trXni-00000001mvM-446Y;
	Mon, 10 Mar 2025 07:43:50 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trXl3-00000001mWI-2Sjz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 07:41:07 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-548430564d9so4166673e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 00:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741592463; x=1742197263; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=osEFHHA8j9TYONQ8F8JDSlqbUbM3s6nOsIv91QRD3Lc=;
        b=HDVh1AqtsrptEz+0BDRuVPyHpiey90QnUG+LE/F8O5aJ+uAISeRAX6XBw6M9HaU4/N
         OILnQtRQzlNn0xZBTtdD3j16Vvah3ZZrIZHQDcF4xvhrqutRbfLkH+S079IK2MGPZkbk
         6jxOjCK7gqShN7HuqCt6MNHIS84C7z4raXdbu7Y2ds4YtLFxWa2EM4ekHKbld9/DNrBw
         yAs+QtFSJhCjPp1aCjoiWEeBhGdv+Lns9afPw4jaraGAfQsQAFNsVyxf9/e7defEje4y
         LMtZ+vBivakp4571j+5vChu4QAnFjT8PYY5HWcZbtzBxGKeRx3iw4fIJrnsK4Vx4h1YI
         /0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741592463; x=1742197263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=osEFHHA8j9TYONQ8F8JDSlqbUbM3s6nOsIv91QRD3Lc=;
        b=M2QuF2VgLxojyS3XKpV5Q5cp6ctF01Ba3KQwF/jeI4Y6hnGrr6Tu/nol4nijg2kWUw
         qRpqDcftkVadWyLQTV0qh3y4VNdXbzTHPdSHNSkYuvof1GUa7oqm7qrb8II7ZRLotbjx
         BBSAy/QoqHxWSjZkKOO3qg1bN/84DJst2dcxY6PkhKyFrNmNW4WG+NFHORervJNQFkGr
         z6so9GXZNXF/ShxqD6cITANxJ5ci8p74nbXEF5LhEow//666RawSOoTywiKW24R2GiEW
         LpofceSCbTns8Lp7RGLa1x7OJkcK66IY6j806PrRnzX1QobG6fW67uSglgCrPmjMftie
         7lhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKlCi8ChloZmkFoZ21U4b9M8dOBBi3+qr9QG+rv+dYN/xAoGC69F3wuSMKIjEM6Nc8CI18PzQQOZqiTLgQ1vtz@lists.infradead.org
X-Gm-Message-State: AOJu0Yxps5EQjNN23VzAerxvAqBr2OnyOyP20h6cpZYxCRhAITxA6TT7
	4w0FwsMEmbLVakHp7vunGliAwolzxK23i3vO7SqZe73UHASocLUp
X-Gm-Gg: ASbGncsOnGd99W6UX7MFZ2PZIUzmZHqllrhmg0irbcVimbASyqp5wGQ7NulzQLIrp08
	XfyB4Jnspko9fCyNuOAw0/ev8B3heGRFvnCsego8CuwN/+JqzvylcH1zlGMUwcmkacDLAL2JUf8
	pL1NGrnxNAMph7OwKskagfi4HtwjQCJwwUrz+li3YJMLkJzXF8mkPOH1U8QRd9GeTpbb0Bp4duy
	mxNNZkyFZPre3NZLzuTHloARj/cBiCG6kGbgWbvYJolchUmV33iWpOFR6uXJG6JHfFqJ5msIm0P
	RoyY34dSe4aDB0JrEmJKCRovtFpOOVhx1/4uHCStjhfyXpTSIaSLkZwJmtXflECXpXmGPON4dbb
	9WygYYokWyHVzMmWx43TsfQJPUg==
X-Google-Smtp-Source: AGHT+IH2xlfCjxUf0Jmc6edmxLihr/sOKf0PRYUS3gP/gGJ3W6JuFQR6v8x9TcODLg2RTjj4/+/a7A==
X-Received: by 2002:a05:6512:ba6:b0:549:8f15:db2f with SMTP id 2adb3069b0e04-54990e6771cmr4714399e87.31.1741592462737;
        Mon, 10 Mar 2025 00:41:02 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bd032sm1379150e87.142.2025.03.10.00.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 00:41:02 -0700 (PDT)
Message-ID: <4d5212b3-3801-408c-9a5d-c6111189793c@gmail.com>
Date: Mon, 10 Mar 2025 09:41:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] iio: adc: add helpers for parsing ADC nodes
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <cover.1740993491.git.mazziesaccount@gmail.com>
 <e71c63c2f61135f9a8c7884525aab2c48f1e84c2.1740993491.git.mazziesaccount@gmail.com>
 <CAMknhBGQaqFZJsPAoauZL4S5MYtN05EOQ-BO2vw5gH+Z2RLOhw@mail.gmail.com>
 <54a031d0-df47-4baa-a23a-1a79c0922542@gmail.com>
 <20250308162928.72bd1d1b@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250308162928.72bd1d1b@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_004105_807543_9468703E 
X-CRM114-Status: GOOD (  38.56  )
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

On 08/03/2025 18:29, Jonathan Cameron wrote:
> On Wed, 5 Mar 2025 12:54:33 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> Thanks for the review David.
>>
>> On 04/03/2025 11:25, David Lechner wrote:
>>> On Mon, Mar 3, 2025 at 12:32 PM Matti Vaittinen
>>> <mazziesaccount@gmail.com> wrote:
>>>>
>>>> There are ADC ICs which may have some of the AIN pins usable for other
>>>> functions. These ICs may have some of the AIN pins wired so that they
>>>> should not be used for ADC.
>>>>
>>>> (Preferred?) way for marking pins which can be used as ADC inputs is to
>>>> add corresponding channels@N nodes in the device tree as described in
>>>> the ADC binding yaml.
>>>>
>>>> Add couple of helper functions which can be used to retrieve the channel
>>>> information from the device node.
>>>>
>>>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>>>
>>>> ---
>>
>>>> + *
>>>> + * Return:     Number of found channels on succes. Negative value to indicate
>>>
>>> s/succes/success/
>>
>> Thanks!
>>
>>>> +int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
>>>> +                                         const struct iio_chan_spec *template,
>>>> +                                         int max_chan_id,
>>>> +                                         struct iio_chan_spec **cs)
>>>> +{
>>>> +       struct iio_chan_spec *chan_array, *chan;
>>>> +       int num_chan = 0, ret;
>>>> +
>>>> +       num_chan = iio_adc_device_num_channels(dev);
>>>> +       if (num_chan < 1)
>>>> +               return num_chan;
>>>> +
>>>> +       chan_array = devm_kcalloc(dev, num_chan, sizeof(*chan_array),
>>>> +                                 GFP_KERNEL);
>>>> +       if (!chan_array)
>>>> +               return -ENOMEM;
>>>> +
>>>> +       chan = &chan_array[0];
>>>> +
>>>> +       device_for_each_child_node_scoped(dev, child) {
>>>> +               u32 ch;
>>>> +
>>>> +               if (!fwnode_name_eq(child, "channel"))
>>>> +                       continue;
>>>> +
>>>> +               ret = fwnode_property_read_u32(child, "reg", &ch);
>>>> +               if (ret)
>>>> +                       return ret;
>>>> +
>>>> +               if (max_chan_id != -1 && ch > max_chan_id)
>>>> +                       return -ERANGE;
>>>> +
>>>
>>> Should we use return dev_err_probe() on these to help with debugging a bad dtb?
>>>    
>>
>> I am not fan of using dev_err_probe() in a 'library code'. This is
>> because we never know if there'll be some odd use-case where this is not
>> called from the probe.
>>
>> All in all, I'd leave adding most of the debugs to the callers -
>> especially because we do not expect to have bad device-trees after the
>> initial 'development stage' of a board. The board 'development stage'
>> should really reveal bugs which prevent the channels from being
>> registered - and after the DT is correct, these debug prints become
>> unnecessary (albeit minor) binary bloat.
>>
>>>> +               *chan = *template;
>>>> +               chan->channel = ch;
>>>> +               chan++;
>>>> +       }
>>>> +
>>>> +       *cs = chan_array;
>>>> +
>>>> +       return num_chan;
>>>> +}
>>>> +EXPORT_SYMBOL_NS_GPL(devm_iio_adc_device_alloc_chaninfo_se, "IIO_DRIVER");
>>>
>>> We can make this less verbose by setting #define
>>> DEFAULT_SYMBOL_NAMESPACE at the start of the file. Then we can just do
>>> EXPORT_SYMBOL_GPL() throughout the rest of the file.
>>
>> I am not sure what to think of this. I use the good old 'ctrl + ]' in my
>> editor when I need to check how a function was supposed to be used. That
>> jumps to the spot of code where the function is. I'd like to see the
>> namespace mentioned there in order to not accidentally miss the fact the
>> function belongs to one.
>>
>> OTOH, I do like simplifications. Yet, the added simplification might not
>> warrant the namespace not being visible in the function definition.
>>
>>> Also, I would prefer if the namespace matched config name (IIO_ADC_HELPER).
>>
>> I had some lengthy discussion about this with Andy and Jonathan during
>> earlier review versions. In short, I don't like the idea of very
>> fragmented namespaces in IIO, which will just complicate the drivers
>> without providing any obvious benefit.
>>
>> https://lore.kernel.org/all/20250222174842.57c091c5@jic23-huawei/
>>
>>>> +
>>>> +int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
>>>> +                                         const struct iio_chan_spec *template,
>>>> +                                         int max_chan_id,
>>>> +                                         struct iio_chan_spec **cs);
>>>> +
>>>
>>> There are some different opinions on this, but on the last patch I did
>>> introducing a new namespace, the consensus seems to be that putting
>>> the MODULE_IMPORT_NS() in the header file was convenient so that users
>>> of the API don't have to remember to both include the header and add
>>> the import macro.
>>>    
>>
>> I do like this suggestion, and I believe this would be the balance
>> between getting the benefit of hiding part of the symbols - while not
>> unnecessarily complicating the callers. I know some people are opposing
>> it though. My personal opinion is that having the MODULE_IMPORT_NS() in
>> a header would be neatly simplifying the calling code with very little
>> harm, especially here where including the header hardly has use-cases
>> outside the IIO ADC.
>>
>> Unfortunately, the "safety" seems to often be a synonym for just "making
>> it intentionally hard". As Finnish people say: "Kärsi, kärsi,
>> kirkkaamman kruunun saat". :)
>> (Roughly translated as "Suffer, suffer, you will get a brighter crown").
>>
>> Let's hear what Jonathan thinks of your suggestion.
> 
> For this particular case my intent was that all the IIO exports that
> are suitable for use in simple IIO drives will be in this namespace,
> we just haven't started that conversion yet.
> 
> As such, having it defined from a header for this helper isn't a good
> thing to do.

Hmm. I agree.

>  Generally I prefer to see in driver code what namespaces
> are involved but do understand the other viewpoint. In this case I
> definitely don't think it is appropriate unless we go for a specific namespace
> for just this helper.

I suppose having the MODULE_IMPORT_NS() in the header would actually 
make the more fine-grained namespaces (like IIO_ADC_HELPERS, IIO_GTS, 
...) much more usable. That'd relieved the drivers from explicitly 
listing multiple namespaces while nicely limiting the visibility.

If IIO was my territory, I might want to ask people to go with that 
approach - but I am quite happy being a freeloade.. errm, I mean, 
bystander ;)

Thanks!

Yours,
	-- Matti


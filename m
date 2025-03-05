Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A815C282E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Myb8iOfwo/K4CWy++bb3w2FblFyh4mmShUmyEU2xmU=; b=VDT5f6AuOsbat6IUydi4ajaxtj
	Zh0xqQhJSE5SyhWiMNfvYfHL8zRKRIGFAwOHU01JHlerOQT+A0PiTP52f1VOanrl7Il00F48ARsvj
	tKbi89vbmU+vgOx85rxstUQAE4Dg2TGnaU51KUd1w2q3h0YuSNi3rXbKfhEZ7QWpgAItrwA2HTPTg
	EiX2n5fB6t6e0zqbpWgeWgrqma79HElSPtaLfhetCHDr19vbgYv9+HOB+KixY3yzqSQfYbLslLwoz
	oWsrLFNc7OOxzShcHZqVc0MS7AzTX6xSipQxYBG7RpSrw0xnlUPQw8Pn+IoHlGcsz+8TtKSlWipEm
	IWQimpAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnFz-00000007umU-0u07;
	Wed, 05 Mar 2025 11:49:47 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmOe-00000007lJF-2BpR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 10:54:41 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54965898051so3303980e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 02:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741172078; x=1741776878; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Myb8iOfwo/K4CWy++bb3w2FblFyh4mmShUmyEU2xmU=;
        b=kqYDBeVYNbhxWHO18xDN7c0zZ+0WnAlohk9zlAy8+aC+eOTZCLNmfxhAV/MM5oxpPq
         eQ7SFzbygs9nX7lUUmtz8yWXpxP6AWeZ3GVxxxf+2T6bZi8g8Yo7P4vOtC61RO+1jr+T
         /iLQAex53nJjxfI6zQ1V9jaZ3MFAgR46pzeCCtbfq/KdgvocGG7Xo5rlBhKKiLrMVORv
         oGeIi1rzLzDgSuByw3coTa3O/VDyOBFrah7owPQXxoBv4nQPMaACDwVWHXYC9nWO7g4K
         xZRTgS0EPOGif8ecF/bbUe6H4EoS5LPoPTdsLc1/M2XurLk0jUY/iDyE93L6yBhSVXtr
         Gv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741172078; x=1741776878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Myb8iOfwo/K4CWy++bb3w2FblFyh4mmShUmyEU2xmU=;
        b=EQilHBgMdd6rsrY7wk4WPyu3/UElGhNXbNpk67zjXOTWVUKjrqFVDlxhwDcnZ9Vui6
         xe4NpNRxxjDWhbX6CkaigpUzPMauCTUfe/aKoovo2LKJY3ti8/+ymMkc6Z+NEVaxMQJO
         OasQRZ+6WUpvjlT4ilKd/UpVdlQe7cDUOITCaSx2SZsKag2ImFlGUAewKdARslbwHwmp
         15bSu4MOafcaBB95aO5s/SNkLGAHtv+ddFOA0hqmvv9tMcwJtUUeZfq3EHfZJJUocI0Z
         WHeLJkDXTYLpl26KOt8IRr1XyH44R3/NGoi8qA2cmwd4osGtebQy484VyR1bxo+1c554
         o/iw==
X-Forwarded-Encrypted: i=1; AJvYcCU99AsCS57wmRESx5xuObOtyHvNO3aXmKlZrGa1LbCUmVVt4kESn/VSfgN+2Sv1tu6u9U7o2hRrdKkHCzsIj/3P@lists.infradead.org
X-Gm-Message-State: AOJu0YwaNUL/UUuW4i7rASJGVy5miwrI9Lb1eagE5WhD4u6Olvvao/vS
	wo6v/6L10voweerLcidGBioom5wIrfkyMwVy3Bgu9+luu32B2r1L
X-Gm-Gg: ASbGnctLKsHf8bTLSfqhI8KcjpjeGBHOvnxcVTIJvVC7BPOCSLZP9OzkgMHBviADZG8
	xXQIE1k+Th+/SK7NmY2QNRWW5iBEWwBqF1EEqqrEJLxABuNcBnqBQ4M09ZHDeY10riIpmsFqHUq
	u6B+GM7KeVwOEu3KwofdyrQZYbc2746o2H4LG//Pm132NXdBt/8uPye+3L68zoWd861YsHD5HkY
	zOGmU0MJwi0xJu3D8QRRAPAXDZk7gjda2EoA5dhD1Et1ZHxuleHuV6K0rIXGdWDTZV/xvClwFhT
	y/+ukRtanoWDufc3BjS8/P9e0NUSpL7YJKwU7qwCHh1V/PQvFj9XyZs438fMPG3/d1BqIHVc3G4
	WbQECUM460cqUOoIMX/L16fz/aA==
X-Google-Smtp-Source: AGHT+IG7+dALkj4mnhqEtYuKNaMtYCVDDovKQLGo6i+y4ha0bmLUd9DW+/Gn+j0UXQCjVleXTiXGSQ==
X-Received: by 2002:a05:6512:2214:b0:545:746:f36a with SMTP id 2adb3069b0e04-5497d376350mr1006837e87.34.1741172077938;
        Wed, 05 Mar 2025 02:54:37 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494ca38eaesm1601129e87.124.2025.03.05.02.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 02:54:35 -0800 (PST)
Message-ID: <54a031d0-df47-4baa-a23a-1a79c0922542@gmail.com>
Date: Wed, 5 Mar 2025 12:54:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] iio: adc: add helpers for parsing ADC nodes
To: David Lechner <dlechner@baylibre.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
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
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAMknhBGQaqFZJsPAoauZL4S5MYtN05EOQ-BO2vw5gH+Z2RLOhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_025440_578564_33AD04D4 
X-CRM114-Status: GOOD (  34.88  )
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

Thanks for the review David.

On 04/03/2025 11:25, David Lechner wrote:
> On Mon, Mar 3, 2025 at 12:32 PM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
>>
>> There are ADC ICs which may have some of the AIN pins usable for other
>> functions. These ICs may have some of the AIN pins wired so that they
>> should not be used for ADC.
>>
>> (Preferred?) way for marking pins which can be used as ADC inputs is to
>> add corresponding channels@N nodes in the device tree as described in
>> the ADC binding yaml.
>>
>> Add couple of helper functions which can be used to retrieve the channel
>> information from the device node.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---

>> + *
>> + * Return:     Number of found channels on succes. Negative value to indicate
> 
> s/succes/success/

Thanks!

>> +int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
>> +                                         const struct iio_chan_spec *template,
>> +                                         int max_chan_id,
>> +                                         struct iio_chan_spec **cs)
>> +{
>> +       struct iio_chan_spec *chan_array, *chan;
>> +       int num_chan = 0, ret;
>> +
>> +       num_chan = iio_adc_device_num_channels(dev);
>> +       if (num_chan < 1)
>> +               return num_chan;
>> +
>> +       chan_array = devm_kcalloc(dev, num_chan, sizeof(*chan_array),
>> +                                 GFP_KERNEL);
>> +       if (!chan_array)
>> +               return -ENOMEM;
>> +
>> +       chan = &chan_array[0];
>> +
>> +       device_for_each_child_node_scoped(dev, child) {
>> +               u32 ch;
>> +
>> +               if (!fwnode_name_eq(child, "channel"))
>> +                       continue;
>> +
>> +               ret = fwnode_property_read_u32(child, "reg", &ch);
>> +               if (ret)
>> +                       return ret;
>> +
>> +               if (max_chan_id != -1 && ch > max_chan_id)
>> +                       return -ERANGE;
>> +
> 
> Should we use return dev_err_probe() on these to help with debugging a bad dtb?
> 

I am not fan of using dev_err_probe() in a 'library code'. This is 
because we never know if there'll be some odd use-case where this is not 
called from the probe.

All in all, I'd leave adding most of the debugs to the callers - 
especially because we do not expect to have bad device-trees after the 
initial 'development stage' of a board. The board 'development stage' 
should really reveal bugs which prevent the channels from being 
registered - and after the DT is correct, these debug prints become 
unnecessary (albeit minor) binary bloat.

>> +               *chan = *template;
>> +               chan->channel = ch;
>> +               chan++;
>> +       }
>> +
>> +       *cs = chan_array;
>> +
>> +       return num_chan;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(devm_iio_adc_device_alloc_chaninfo_se, "IIO_DRIVER");
> 
> We can make this less verbose by setting #define
> DEFAULT_SYMBOL_NAMESPACE at the start of the file. Then we can just do
> EXPORT_SYMBOL_GPL() throughout the rest of the file.

I am not sure what to think of this. I use the good old 'ctrl + ]' in my 
editor when I need to check how a function was supposed to be used. That 
jumps to the spot of code where the function is. I'd like to see the 
namespace mentioned there in order to not accidentally miss the fact the 
function belongs to one.

OTOH, I do like simplifications. Yet, the added simplification might not 
warrant the namespace not being visible in the function definition.

> Also, I would prefer if the namespace matched config name (IIO_ADC_HELPER).

I had some lengthy discussion about this with Andy and Jonathan during 
earlier review versions. In short, I don't like the idea of very 
fragmented namespaces in IIO, which will just complicate the drivers 
without providing any obvious benefit.

https://lore.kernel.org/all/20250222174842.57c091c5@jic23-huawei/

>> +
>> +int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
>> +                                         const struct iio_chan_spec *template,
>> +                                         int max_chan_id,
>> +                                         struct iio_chan_spec **cs);
>> +
> 
> There are some different opinions on this, but on the last patch I did
> introducing a new namespace, the consensus seems to be that putting
> the MODULE_IMPORT_NS() in the header file was convenient so that users
> of the API don't have to remember to both include the header and add
> the import macro.
> 

I do like this suggestion, and I believe this would be the balance 
between getting the benefit of hiding part of the symbols - while not 
unnecessarily complicating the callers. I know some people are opposing 
it though. My personal opinion is that having the MODULE_IMPORT_NS() in 
a header would be neatly simplifying the calling code with very little 
harm, especially here where including the header hardly has use-cases 
outside the IIO ADC.

Unfortunately, the "safety" seems to often be a synonym for just "making 
it intentionally hard". As Finnish people say: "Kärsi, kärsi, 
kirkkaamman kruunun saat". :)
(Roughly translated as "Suffer, suffer, you will get a brighter crown").

Let's hear what Jonathan thinks of your suggestion.

Thanks!
	-- Matti



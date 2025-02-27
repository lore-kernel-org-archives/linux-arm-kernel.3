Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A7AC1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFYNYStHehokVGFs8JvRJvS2RWuC59EczsVRJ3j5mJs=; b=ZsdvgYf5MHa39Fl3Zw5Ch/feb2
	Io60Ev3JV/hYqmaFzDkBrfhmukPAX9gm7IJ1nCDQZa7zAoSh52b4hWdJCECCCw0S5On1juLC91404
	y2FoKMD2HEivjM+/1q8p4ZTm6Jhg/CNOf614CILgk3WTlJ9C0Rjb+jI67PwqksU/zzwikzrjol7wP
	BEEcvRE088E1WY81sX3YgQXNr+xHipmavszxIJu/Fpaj7sysz5vREmsYQE5smRscRZ/X0tWfk1PZY
	ozjSQmpCuU4sxsHUMR2n7xuMHnLxXcdiJPN1qc9JoRhprvIoalG328swFzLhNatz73iT3frvGp/vK
	HwVFQimw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjhR-00000008UIj-2BmQ;
	Thu, 27 Feb 2025 19:37:37 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnfSY-00000007rLg-2kAs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:05:59 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-30a317e4c27so10580571fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 07:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740668756; x=1741273556; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sFYNYStHehokVGFs8JvRJvS2RWuC59EczsVRJ3j5mJs=;
        b=H/saqHTxFlysW9ER/T1VRbmvM6NGgFI38inNMu5Gl+eRtTDs4HtqPKOefANov47o8T
         mM+s9V0nO7/Ox9czE6KwtF30d3dZst/Opa1bZ9iBW161y40pGtzlf3S1HmiGMiwjArKZ
         HpJ2zuxv6vM+uBpWvc/yyLatE9Miz+rTbKl4VE4p/ODd9Xmq3HK5NPPLxxd/frZ/CwQM
         jnWYl9H72Bs0mjNYMWUTsUEpKML31y6dUlgA1JyR2NPO5ysEq2sb9YkY4yL0ihxJc+4L
         iRM8/Dvx23blcP7NXHbcXSfHyfSoRCi7cDQYentEiB4N44KedTcGzZunQFp7e3vzpZTH
         RDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740668756; x=1741273556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sFYNYStHehokVGFs8JvRJvS2RWuC59EczsVRJ3j5mJs=;
        b=opZg3x3OVA9duy2svHanxN+Aa8RlGUfxl1KmGGM09tky83VcpGkgxV94pg//o1ozop
         43x+LI79ZsamH15iCO3q7AcxTSACbmlbkXjZj+OVIwO7zoZgARilwsL1YWPUFSmUTckO
         P8psmGYT41G3UtPl6IJnUK9uhqyoiZIDquprBrbPTRllxqzrpyYBGNI3Lr5USQyi9S9e
         6YJRAkb12TKU58qVqsqSNAZtIGFyYThltgaZHPJRIFxExoZYMmf1rOXit1qMFlpXaHYi
         EFwQyof0kG8ME/JqUPTkQzIc+eFU1tO0zaSKIBkDj4sfgJ33Sgu1loAUpPknWDJzK79O
         jlyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE4UV6pXqjPblmP4MmMPIzJXMRGvAn6ud2/hcdAdkJAo2hVYcrfg6D0Cwjg1DfXYA7M0lA9mGRKlgliHZBw8Tv@lists.infradead.org
X-Gm-Message-State: AOJu0YwvOITIPKLv0mtGpJQz8oz5ghfK0YgtHXSYX+G+VV5PjfxyDmbN
	bNtrtobtxHJGVgiqR7y2K/a9TtZoaAss3bpOmXkCJVVwkLLGZCKg
X-Gm-Gg: ASbGnctCEi/2goEClY+j+lOcPj0Qy/EpxTuNYQGpeJ+mtFzrz6FjWnP3LFRLuZHYqzN
	7lUdp2vx22VgruPFy5tRQC9utCcwHfxsjlFzaf9Mmu4lqqR4lIjSEPkqKcwT2ZPVng/pvok5XPB
	Qxy/I4YqCvIgcOZe4HicrXSqbUabZTY538KtyXiebW0ekN9Rla/dgIGa2MXb9QauJdMY6tfwHwR
	0dy6dDNZAm0rBbUKh6Ve+/5LUsf4N0cpGYyTfoGRjbL0FqP0wMRUY0DSrJ70opzEBtUb8No5vwp
	SLVaQD1S+8Vwx8kMsLL0nCibJ39+NjQYA/8S5aVqZdcA999/v8mtLzQzWntV3Gb+3lk1XHXyX9Y
	PXtYMxjs=
X-Google-Smtp-Source: AGHT+IF3+FJMbqYsi707hLsELdOrDSp5KTIGs397vlzqq1TcBifloHPzl8dDPN/iBLJu+00pSGcwSw==
X-Received: by 2002:a2e:b617:0:b0:308:f827:f901 with SMTP id 38308e7fff4ca-30a80c41998mr58001921fa.21.1740668755929;
        Thu, 27 Feb 2025 07:05:55 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b867a7546sm1885721fa.5.2025.02.27.07.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 07:05:54 -0800 (PST)
Message-ID: <c9424f3e-1ff0-4c01-823a-19801cc3e7a7@gmail.com>
Date: Thu, 27 Feb 2025 17:05:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] property: Add
 device_get_child_node_count_named()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Scally <djrscally@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
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
References: <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
 <Z72QAOA9xXbP16K-@kuha.fi.intel.com> <Z72Zp8tpnvlFGdQ_@smile.fi.intel.com>
 <ad39b453-7e5b-49bd-a4fd-6a4988636130@gmail.com>
 <Z72d7TzZ21WITW3f@smile.fi.intel.com>
 <893a3c45-537e-47ad-afbd-1e5d3b9abe2c@gmail.com>
 <Z73M3Ua6u1FpgBEK@smile.fi.intel.com>
 <720f9c69-ca1f-45cb-9f6e-c8e4703c9aad@gmail.com>
 <Z78g_uiXumn4mvET@smile.fi.intel.com>
 <d7982b76-3da7-47ff-b2b2-f964610af1f7@gmail.com>
 <Z8B7h4_IWz43gFhO@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z8B7h4_IWz43gFhO@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_070558_701787_EF25EB1D 
X-CRM114-Status: GOOD (  29.62  )
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

On 27/02/2025 16:49, Andy Shevchenko wrote:
> On Thu, Feb 27, 2025 at 10:01:49AM +0200, Matti Vaittinen wrote:
>> On 26/02/2025 16:11, Andy Shevchenko wrote:
>>> On Wed, Feb 26, 2025 at 04:04:02PM +0200, Matti Vaittinen wrote:
>>>> On 25/02/2025 15:59, Andy Shevchenko wrote:
>>>>> On Tue, Feb 25, 2025 at 03:29:17PM +0200, Matti Vaittinen wrote:
>>>>>> On 25/02/2025 12:39, Andy Shevchenko wrote:
>>>>>>> On Tue, Feb 25, 2025 at 12:29:31PM +0200, Matti Vaittinen wrote:
>>>>>>>> On 25/02/2025 12:21, Andy Shevchenko wrote:
>>>>>>>>> On Tue, Feb 25, 2025 at 11:40:16AM +0200, Heikki Krogerus wrote:
> 
> ...
> 
>>>>>>>>>>
>>>>>>>>>> I did not check how many users are you proposing for this, but if
>>>>>>>>>> there's only one, then IMO this should not be a global function yet.
>>>>>>>>>> It just feels to special case to me. But let's see what the others
>>>>>>>>>> think.
>>>>>>>>>
>>>>>>>>> The problem is that if somebody hides it, we might potentially see
>>>>>>>>> a duplication in the future. So I _slightly_ prefer to publish and
>>>>>>>>> then drop that after a few cycles if no users appear.
>>>>>>>>
>>>>>>>> After taking a very quick grep I spotted one other existing place where we
>>>>>>>> might be able to do direct conversion to use this function.
>>>>>>>>
>>>>>>>> drivers/net/ethernet/freescale/gianfar.c
>>>>>>>>
>>>>>>>> That'd be 2 users.
>>>>>>>
>>>>>>> I haven't checked myself, I believe your judgement,
>>>>>>
>>>>>> I took a better look and you obviously shouldn't believe :) The gianfar used
>>>>>> of_node instead of the fwnode. So, it'd be a single caller at starters.
>>>>>
>>>>> ...which is the same as dev_of_node(), which means that you can use your
>>>>> function there.
>>>>
>>>> I'm unsure what you mean. The proposed function
>>>> device_get_child_node_count_named() takes device pointer. I don't see how
>>>> dev_of_node() helps converting node to device?
>>>
>>> dev_of_node() takes the device pointer and dev_fwnode() takes that as well,
>>> it means that there is no difference which one to use OF-centric or fwnode
>>
>> The proposed device_get_child_node_count_named() takes a device pointer. I
>> don't see how dev_of_node() helps if there is just of_node and no device
>> pointer available in the calling code.
> 
> ???
> 
> The loops are working on
> 
> 	struct device_node *np = pdev->dev.np;
> 
> which is the equivalent to
> 
> 	struct device_node *np = dev_of_node(&pdev->dev);
> 
> which takes device pointer.
> 
>> (Well, as I wrote below, I could
>> alter the gianfar code by dropping the gfar_of_group_count(), so that I have
>> the device pointer in caller). Anyways, I don't see how dev_of_node() should
>> help unless you're proposing I add a of_get_child_node_count_named() or
>> somesuch - which I don't think makes sense.
> 
> Are you forbidding yourself to change the function prototype to take a device
> pointer instead of device_node one? :-)
> 

This is our point of misunderstanding. As I wrote, and as you can see 
from the prototype, the function _is_ taking the device pointer. Hence I 
didn't understand how dev_of_node() should help us.

>>> API in this particular case. Just make sure that the function (and there
>>> is also a second loop AFAICS) takes struct device *dev instead of struct
>>> device_node *np as a parameter.
>>
>> I think I lost the track here :)
> 
> Make gfar_of_group_count() to take device pointer. As simple as that.

that'd just make the gfar_of_group_count() a wrapper of the 
of_get_child_node_count_named(). I prefer killing whole 
gfar_of_group_count().


Yours,
	-- Matti


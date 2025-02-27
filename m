Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988B8C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 08:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDtuSF+uNvwU/olXT0/1pp58GsxviGqVNXkV33zGjbs=; b=D2KSTGjSUO6RfPGzhu13daEFWZ
	jk8a06YTzpXtjyXCQq3SOfYxckQZ8fQWr9bx+z02mmn8a7nS1LXEG/X/hektC89A/zRPwgjd/Xyb1
	kcTKHaGtCJ2d1O8maSBCc45oLQ/HHPGMWr9449zxpplaBLGYWER5IzCSc3sajkuZAwW1zYiQVdp1Y
	BN9J0XdUySKYiH93g29TTVRMo5qwNtAWiCxcT5T3fE+TOo/hfo7iSCUS/yqVm9SIqueVfPnUfSHLD
	Kw/9CcgxYJ4yVAcUZnRgxVi39FuRJtaihhUA8kJu0QiDt2ti394AN+nBCYPEtRvWt+PkAl7YSKYmL
	3/8cCjrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYsE-00000006d9F-0KHw;
	Thu, 27 Feb 2025 08:04:02 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYqB-00000006chh-1KWi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 08:01:56 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54838cd334cso738594e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 00:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740643313; x=1741248113; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nDtuSF+uNvwU/olXT0/1pp58GsxviGqVNXkV33zGjbs=;
        b=jacAdO8m1FQtxtVn8cQn1HSKW+VfFY9VtMIVlkpXzsx9D//VtEh/G2imtrZma3Y/1+
         pQ7K9RjKd01JDY/uz2SIwuuMLg9VJh2yaLS7WnW4rTwMiVsRX3CnNxzHmFZxkeQGsy64
         CfWBIPHORqKveOVWaKra4KMmgeQ4VsrtimwTNlum4gO31aYfmamdpHIISxdjE8xPo1gm
         DS4g33emYxzFsYHXO+SI+QE/t235xL8t8k0qNFbUGSnVN4rE7FXt5V5VJb+ZpAFhpgoz
         AzY9GnxqG+U2GdL3M6kzHNgfjHJEOUocEFEic5HSrax9MjJ8Yx7BqO0wGyyeYAnMTrym
         WUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740643313; x=1741248113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nDtuSF+uNvwU/olXT0/1pp58GsxviGqVNXkV33zGjbs=;
        b=RiBamEzKipwlcQAJLjvA9vxfkY0zsCV4KQ3aA7B/pGco3/DZMcT0boFvWco1ZhV+yX
         cSkiw1eo7aDSGyUeKR2ElAWy7KnIwraQGLCNn1AEWibsjXh8vMdL0Qy+k+D/0VnivrU7
         vwUi2/EBMNZAYx7qqfq4mG8Ig0bbSbXUnUq4VVAWlIAdKEoLwBSDhTMOaZxJLlJlxu/F
         ShdLkbg6T5ocmCp7dQv4HJ2OrCyx/ety4Q7BcyshoxUZJtJIbvUBmySGib/vwQxb0jd3
         fejMN2OC/AvW2ZHcksIn8ZdqJT4bwtxEbWESipvkyhkSZccftMDRios3GBtrQ2l3LJmb
         +nOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI2A70rAC+X8qAVuwp2znpHNFpNJXi+DUohNS9RFADqMDeIdaFesADY3zGssIBABStbJhVrF8aL+NlQCBD/Ct+@lists.infradead.org
X-Gm-Message-State: AOJu0YwgIHkd3BWb/3pdzhjGXiHDyeYdOZakJQDnR9oPoEWk+civ+ica
	WzvmqmJ+Z1vqdpNjQYSmWvl6LzT9kg9J6umVQYyALnDXs9DNUOYw
X-Gm-Gg: ASbGncvsJOUfeRJ8CYs8L30InoEOkpAVE0yWvTZ+PxAsmenn2g5KfibOMWOJVHN9Mtd
	1Ql3BHFEazTPZzhGMFdWegst9FisGcphfn2KdBxxI8/cI8Wx6rZo2yt/CMYbepjW27U5w0dvaSe
	+yB0aa53IdIE4VztZdL9BcMcrT/6F28eec/G6KfL+eUCXX4lnQhSTpIOaidVqonRwE8pCJV+ayT
	Pk/gezFBuTfqpWdFh5SN20LbSG6MJnbK8WlpFBzr99f14GsZWhDp1jQu2QFdMhBOZUmZkIwySs8
	lHqQj8A9t7vYaDzToXeV9eMy1IPkVwR7gMi6/MH2XvYIAOhLPQVSwo3aKb7na+5CqWHzPlR1zZO
	gnf9dk38=
X-Google-Smtp-Source: AGHT+IFjVjmK2qHUacoPpo4OU31ZwGA6d9bKKSSD59w0ISV0sOUUwTnyPiZ3gMGZR/v96mmqDXra0A==
X-Received: by 2002:a19:8c09:0:b0:549:43f8:824 with SMTP id 2adb3069b0e04-54943f8098dmr558221e87.26.1740643313017;
        Thu, 27 Feb 2025 00:01:53 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443bebd5sm98564e87.209.2025.02.27.00.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 00:01:51 -0800 (PST)
Message-ID: <d7982b76-3da7-47ff-b2b2-f964610af1f7@gmail.com>
Date: Thu, 27 Feb 2025 10:01:49 +0200
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
References: <cover.1740421248.git.mazziesaccount@gmail.com>
 <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
 <Z72QAOA9xXbP16K-@kuha.fi.intel.com> <Z72Zp8tpnvlFGdQ_@smile.fi.intel.com>
 <ad39b453-7e5b-49bd-a4fd-6a4988636130@gmail.com>
 <Z72d7TzZ21WITW3f@smile.fi.intel.com>
 <893a3c45-537e-47ad-afbd-1e5d3b9abe2c@gmail.com>
 <Z73M3Ua6u1FpgBEK@smile.fi.intel.com>
 <720f9c69-ca1f-45cb-9f6e-c8e4703c9aad@gmail.com>
 <Z78g_uiXumn4mvET@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z78g_uiXumn4mvET@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_000155_361292_97C5318E 
X-CRM114-Status: GOOD (  30.94  )
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

On 26/02/2025 16:11, Andy Shevchenko wrote:
> On Wed, Feb 26, 2025 at 04:04:02PM +0200, Matti Vaittinen wrote:
>> On 25/02/2025 15:59, Andy Shevchenko wrote:
>>> On Tue, Feb 25, 2025 at 03:29:17PM +0200, Matti Vaittinen wrote:
>>>> On 25/02/2025 12:39, Andy Shevchenko wrote:
>>>>> On Tue, Feb 25, 2025 at 12:29:31PM +0200, Matti Vaittinen wrote:
>>>>>> On 25/02/2025 12:21, Andy Shevchenko wrote:
>>>>>>> On Tue, Feb 25, 2025 at 11:40:16AM +0200, Heikki Krogerus wrote:
> 
> ...
> 
>>>>>>>>
>>>>>>>> I did not check how many users are you proposing for this, but if
>>>>>>>> there's only one, then IMO this should not be a global function yet.
>>>>>>>> It just feels to special case to me. But let's see what the others
>>>>>>>> think.
>>>>>>>
>>>>>>> The problem is that if somebody hides it, we might potentially see
>>>>>>> a duplication in the future. So I _slightly_ prefer to publish and
>>>>>>> then drop that after a few cycles if no users appear.
>>>>>>
>>>>>> After taking a very quick grep I spotted one other existing place where we
>>>>>> might be able to do direct conversion to use this function.
>>>>>>
>>>>>> drivers/net/ethernet/freescale/gianfar.c
>>>>>>
>>>>>> That'd be 2 users.
>>>>>
>>>>> I haven't checked myself, I believe your judgement,
>>>>
>>>> I took a better look and you obviously shouldn't believe :) The gianfar used
>>>> of_node instead of the fwnode. So, it'd be a single caller at starters.
>>>
>>> ...which is the same as dev_of_node(), which means that you can use your
>>> function there.
>>
>> I'm unsure what you mean. The proposed function
>> device_get_child_node_count_named() takes device pointer. I don't see how
>> dev_of_node() helps converting node to device?
> 
> dev_of_node() takes the device pointer and dev_fwnode() takes that as well,
> it means that there is no difference which one to use OF-centric or fwnode

The proposed device_get_child_node_count_named() takes a device pointer. 
I don't see how dev_of_node() helps if there is just of_node and no 
device pointer available in the calling code. (Well, as I wrote below, I 
could alter the gianfar code by dropping the gfar_of_group_count(), so 
that I have the device pointer in caller). Anyways, I don't see how 
dev_of_node() should help unless you're proposing I add a 
of_get_child_node_count_named() or somesuch - which I don't think makes 
sense.

> API in this particular case. Just make sure that the function (and there
> is also a second loop AFAICS) takes struct device *dev instead of struct
> device_node *np as a parameter.

I think I lost the track here :)

>> I think I could actually kill the whole gfar_of_group_count() function and
>> replace it with a direct call to the device_get_child_node_count_named() -
>> but I am not at all convinced that'd be worth including the property.h to a
>> file which is currently using only of_* -stuff. Well, I suppose it can be
>> asked from netdev peeps but I am not convinced they see it as a great idea.
>>
>> If I misunderstood your meaning - please elaborate.
> 
> The driver is quite old

I remember having to modify this driver somewhere around 2010 or so. :) 
Time flies.

> and has a lot of room to improve. Briefly looking it
> may be almost fully converted to fwnode, but it's not your call (only if you
> wish). Nevertheless, using agnostic APIs if they reduce code base is fine.
> We have drivers that do OF and fwnode mixed approach (for various reasons,
> one of which is the new API that is absent in OF realm.

Well, we can propose this to netdev people but I wouldn't be surprized 
if they requested full of_node => fwnode rewrite instead of removing 
simple looking loop and bringing mixture of fwnode and of_node in driver.

Yours,
	-- Matti



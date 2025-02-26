Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFFDC021BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 14:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iklNm2KayquShiYIwOiveLvoWuecEHw4Y693C3rLQds=; b=QDXZZxBd5re/fBJH10N5bPhGMq
	UCQFIs9YKNjHCD9PQ5oVGZPsN4NDivFSjpNJE5y1yZH59wx5IbqpVR/SLdW9SXhx2YMkm4i0Sy0sO
	H13YLcND9RRjRYAwVBsz8lFbW2JZsNijvX+Q7MX5KtnTnilXXB1prYTCec5gyY4UJ8JJ6P6wvgfho
	ENqEv8Yi2zvUYndPFFpKz8a1KlM3Ku2hK4wYhRJtXtOhGwr5JF/ejHz/Mk1MK4chDvqpW49WQBI1o
	/Gvn0f7NmtxCO2SwTSUsaWxYigcqC/O0k/WHQpsURHccua5M38afYbgGtUXE45AgXNMdTnYXt0OEl
	WBWnfoKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnI4U-000000040pw-1JGf;
	Wed, 26 Feb 2025 14:07:34 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnI1A-000000040QR-2KW8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 14:04:09 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-547bcef2f96so7011367e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 06:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740578646; x=1741183446; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iklNm2KayquShiYIwOiveLvoWuecEHw4Y693C3rLQds=;
        b=MhHE6e+0JHq4tKck1JOVEzHZXHSxuNPiCSuee3WLSN8cnQjxOLaaT4h6dzFAiCDE4q
         TBvzaTkqc1ddkHsS6GSYZJslUUTvygP/Y4BZNg0Qc6NpKKAigcMj/jZNzYiUN1KYqMsO
         PX2WjdancowzD1yxrB0XSSElH1QQou1yLmbksEYhjpBy4/YMJOENuJTCGz68Qe8mh5M9
         l+5PygujWxKsvPkZgix0/xiIwVCfC2EXAS7hugOIhQnyGYkH5ZrH8nPLuFBbYtIibWZH
         qlDX+X2ID7YMSfOk8eenXy4Wi+9qzOrIcPghTASvzowoQvSf6seT1cL1B2tQ2I2FZLT1
         aCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740578646; x=1741183446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iklNm2KayquShiYIwOiveLvoWuecEHw4Y693C3rLQds=;
        b=wxhylm0A+HuWEjXAiw/nl2Y7z8oYa2YOF0lgfp0oOmUvpBN/CG9oh9UkbuVJj3PFiY
         hHzH3WSoKy17XMkh9zCdmJKJJ0tI2dRnbJYdzhyldQS62xTggbRpXv8CTb10PVUDcHQ0
         EXInJgAeVkKgmxJrN8U0Xy0xHO+DV1PvpWlTpsI/aTtk8BToTIGCKiR09sbrOEze5KJ8
         H5xfe56FOBu0Eveeyr0AbUOozO7stb9nAe5eXbP6/WijOrUz6nYpj88q4/bqUlTrSckz
         xpIVi1JEcUsM9PYbocXcahEdBBHkKvNyk7b62FboKzQ/16QwyN1Oi87KgMecnLzGXNCu
         rCrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIjSSrzqZn+Xbd+pk04QAnv2ifNm2VyFxjijOf/iMSLFXtdHw0r6nwxDoLSQIb8Jh7LgTsdbWUKW1PF0S43udy@lists.infradead.org
X-Gm-Message-State: AOJu0YyOuFwScijMMds4G5x4BSNhP1SJp3yAsegEIQC9UdDqdiyk6nky
	SE8nmKclIPZ3RNNHkAHRolj0/URtfyzl4O9d5VC6AFTNFp823qK0
X-Gm-Gg: ASbGncuJpEOFmrOPSgd4EP1hAS+zc3dICkalJlJJh6DQ8CDXZnAevcbhjZRLBf4VXZR
	IUS0o4s/pbJKBN0EUTrVjAeHaJMK4zmC7LYOxKYalolGI5D9CX3fNxiDx4JjT5D0epCOAbn0mYB
	EiovZvxJjvHQjyYD0jmOvPu6p4YwKB1IleEdA4UnagQN2+9C3lwGROKpQZUdKkzI613nKmP36DN
	v4Bd7NCQUHYFZjTDacFKqMNZI5qsk79NI1c/sZnVS79PnV1RA/dSWV7P7PDldj1dOghDYUnScUj
	QoisJY1DV7UyH/Q+aMYfNOONCSh1Gl3aZFTrJf/m7IeKlXBIIm7up1hdbKHuSug65OYSNsYHk8W
	/cjcwpLw=
X-Google-Smtp-Source: AGHT+IEpGk7dlruxQZybiX5fxanW29Ro9PxXVGS1JEbV3E8cZgaWlz6jdZJLrmU850dRn2ngJkTU1g==
X-Received: by 2002:a05:6512:39c7:b0:545:f4b:ed58 with SMTP id 2adb3069b0e04-54838ee8b18mr11567732e87.18.1740578645999;
        Wed, 26 Feb 2025 06:04:05 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b72bbsm462711e87.56.2025.02.26.06.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 06:04:04 -0800 (PST)
Message-ID: <720f9c69-ca1f-45cb-9f6e-c8e4703c9aad@gmail.com>
Date: Wed, 26 Feb 2025 16:04:02 +0200
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
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z73M3Ua6u1FpgBEK@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_060408_598338_E2FCFEBA 
X-CRM114-Status: GOOD (  19.97  )
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

On 25/02/2025 15:59, Andy Shevchenko wrote:
> On Tue, Feb 25, 2025 at 03:29:17PM +0200, Matti Vaittinen wrote:
>> On 25/02/2025 12:39, Andy Shevchenko wrote:
>>> On Tue, Feb 25, 2025 at 12:29:31PM +0200, Matti Vaittinen wrote:
>>>> On 25/02/2025 12:21, Andy Shevchenko wrote:
>>>>> On Tue, Feb 25, 2025 at 11:40:16AM +0200, Heikki Krogerus wrote:
> 
> ...
> 
>>>>>>
>>>>>> I did not check how many users are you proposing for this, but if
>>>>>> there's only one, then IMO this should not be a global function yet.
>>>>>> It just feels to special case to me. But let's see what the others
>>>>>> think.
>>>>>
>>>>> The problem is that if somebody hides it, we might potentially see
>>>>> a duplication in the future. So I _slightly_ prefer to publish and
>>>>> then drop that after a few cycles if no users appear.
>>>>
>>>> After taking a very quick grep I spotted one other existing place where we
>>>> might be able to do direct conversion to use this function.
>>>>
>>>> drivers/net/ethernet/freescale/gianfar.c
>>>>
>>>> That'd be 2 users.
>>>
>>> I haven't checked myself, I believe your judgement,
>>
>> I took a better look and you obviously shouldn't believe :) The gianfar used
>> of_node instead of the fwnode. So, it'd be a single caller at starters.
> 
> ...which is the same as dev_of_node(), which means that you can use your
> function there.

I'm unsure what you mean. The proposed function 
device_get_child_node_count_named() takes device pointer. I don't see 
how dev_of_node() helps converting node to device?

I think I could actually kill the whole gfar_of_group_count() function 
and replace it with a direct call to the 
device_get_child_node_count_named() - but I am not at all convinced 
that'd be worth including the property.h to a file which is currently 
using only of_* -stuff. Well, I suppose it can be asked from netdev 
peeps but I am not convinced they see it as a great idea.

If I misunderstood your meaning - please elaborate.

Yours,
	-- Matti


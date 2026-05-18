Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF50FCD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R76EEUUYziDn4rTNwghYF5TGd9QqSpO9um+ZkcmBhtY=; b=C/Ir4d7IkojUv2noSTDhny2qoG
	H4gI2Bmqo8yeKUcAWZeUWInXTR375AKFAbnPEUJNqcN7aA7Jf6hpvbtZSSwPX1StNxv3tUXT2J1Lw
	SC7m4LpQvO6HEp9HSIOTSM4SKd9MJ/uJ5iVV5ZmF2nx9PK7z/FTbTU+gGUglMK+SZOwwmlsjGsc9Z
	E5GwB7l1/rC9RjEIvqnuj4VrcMp0P0fUdv9ejhSlM/dEwJi3vCIiGRXRRRVq3kGu7ZSmQFZuYYq6k
	G9GgSnLuHO2o9t8E4FU2pLm/uAjqf4/j5CNu0noO2IA0Y5fxNtF6lCflBFiqUxxtfPlBuaONjdVUV
	GLB+DS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz3W-0000000G0V9-1OaU;
	Mon, 18 May 2026 14:34:54 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz3T-0000000G0Ud-2YVW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:34:53 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-69d2e3b45a1so524799eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779114890; x=1779719690; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R76EEUUYziDn4rTNwghYF5TGd9QqSpO9um+ZkcmBhtY=;
        b=U70vQ+KCx8vc7CV7T9uQxkpGcYd4nTtGO9wRr6p4XSF3fEui5Z5OZWn9pqyC+fNvyT
         6CMZRxVx3D7i+/1U41ffkYUSogOmmRpSIkvbJcBZ3MtcEfgePunL5OP7TKnq9R65eI9R
         uSjwD3TP4JFGrQdjZK9t+cgB8ToJlDKoeP9Cl8zLA4PJf38q1Etp6CFjIk1scJRAoews
         FfvwCQutrqOmGBWinErKrMuzX6ZyAiyhmqUsc7VR+9ntrByjqQEZ8s1Wc060IAbfULwk
         SNwnixenyIbSKHm/mM/u66389CoRr+TygE1Sa3DHKV5AHFekzg3p7RVa/RiFZckQS9TT
         1C+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114890; x=1779719690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R76EEUUYziDn4rTNwghYF5TGd9QqSpO9um+ZkcmBhtY=;
        b=WTGisa+MvXbmPNltqYXhmISrRgWKOkY0LrvkG9/+02+WRukmp3nxovIYIQjzsEifLW
         THzNuuT5m3hj22t7NFKO28bZzAfDV6a3aZCm89LiGH3XaSbra8PcC4fARuGYy3W6dsWP
         YShZkdB+i/9iCt+7Zo66PHNvv4sNi9VNDrWBSc73GvTiyCVdCOGnbMWARZ56spuiwA/W
         4aPzIMcBWHUwiBHnLRSVyOiH9xzwFSkRcgsBIRtt9Z1fJZlkXXRcr9Pl5u821l0SnHh4
         dU2nPFy0iXg1jHruCbwFQG5CvxK2WfXwsJ6q83PPiwUPyrQLhXf4g8qIx1e7m/JOnYqj
         cGXg==
X-Forwarded-Encrypted: i=1; AFNElJ8OzSrXUNfTYNZLXp+ncamwtJpeReiFvVHby9wdeK+N5YHH7fGYe+a42SD8OuIaaEXjeb7mBQ1D/+PTza/87WfJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzCuFYY5HIAIq7kOz63e9HDnGfsmDa9roL0Z86GzBB1U/0/fwPW
	6D+vU0akgc+G+u/Ir0nsIqzDpfY0tWuV26fC7JRQDYTjR7gIAND0EJQHUc8qz5bwJ3U=
X-Gm-Gg: Acq92OHL3nPbGVxPEG34/q1glJu40/IBr+GntFDW9g1eZEN6B2Irvvgx+hzH4kUjp1n
	G143MrP0ue3m+P/Ti+YOWci/32VYCYR8Q6pvUDzcuSNYgzDB91Oyp6KgpyeD0lyu2RwuSTXkab1
	Fic0OUqTjICUWEDdCSolMM2clx/DRhmau4NLOOIgnkJtoGZAu2kG/qgIkCHjcz1uBPTzzTWk8lC
	idnnvt6doPbWrxc9IP6IMvZ1k9ulFmrXGYmpjuK/ecXUdu6FrQf+N4JgA50+VWaB7XgSrfy97hG
	4gyhsQ+QXRE/IKmDBWS29DBga4PexiQeCHDIvcJ964lzJOwjvAMIo0dfArXkxPrp0yFiKllC6L5
	PUew/6x6DfI5yNqDBpmghu1whIYAs7Ce58aUQY4S/dm2igL78qZO4/vDEFRJwUhBDHG3QUMQzBH
	ud0jaMeY1elD0ZbzCg5CAoTqpaIYuN8XnkXpPzk1NMsfdKcBapfm0V8lF+Ygu2hu+rBP+W9UuX+
	Q==
X-Received: by 2002:a05:6820:1746:b0:688:2480:7fa8 with SMTP id 006d021491bc7-69c942dac4dmr10442247eaf.21.1779114890563;
        Mon, 18 May 2026 07:34:50 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3be6:1187:fed4:378b? ([2600:8803:e7e4:500:3be6:1187:fed4:378b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69d049384f6sm5675126eaf.14.2026.05.18.07.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 07:34:50 -0700 (PDT)
Message-ID: <41c0317d-2ce8-412c-818a-4a84201fce29@baylibre.com>
Date: Mon, 18 May 2026 09:34:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] iio: timestamp declaration cleanup
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
 <agq7PPw0qupI_8Dh@ashevche-desk.local> <agq8Q1wpzIw4XhNQ@ashevche-desk.local>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <agq8Q1wpzIw4XhNQ@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_073451_655087_8BE3B54A 
X-CRM114-Status: GOOD (  15.86  )
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

On 5/18/26 2:14 AM, Andy Shevchenko wrote:
> On Mon, May 18, 2026 at 10:09:48AM +0300, Andy Shevchenko wrote:
>> On Sun, May 17, 2026 at 01:17:17PM -0500, David Lechner wrote:
>>> While looking around the code, I noticed that there are a lot of places
>>> were we are manually filling all of the fields of an IIO timestamp.
>>>
>>> This is error-prone (as seen in the first patch) and more verbose than
>>> it needs to be.
>>>
>>> I went with the approach of using the existing IIO_CHAN_SOFT_TIMESTAMP()
>>> macro for doing a struct assignment. This does require a cast, which
>>
>> No, it's *not* a cast. It's a compound literal. And instead of doing this in
>> every driver, add it to the macro (in a separate patch). Oh, let me just cook
>> it for you (I added that to several cases in the past).
> 
> 20260518071349.469748-1-andriy.shevchenko@linux.intel.com

Nice, thanks. I agree this will be the cleanest solution.

> 
>>> makes it a bit more verbose, but we were already doing that in to
>>> drivers, so I went with it anyway.
>>
>>> If we want to consider alternatives, we could make a iio helper function
>>> or macro like the first and second patches did.
> 



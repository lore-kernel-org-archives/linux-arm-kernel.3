Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605C0C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 12:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phXyydY7gGfZlc5DxydLzP5lRJMditp6NpQC5fmMcrY=; b=hyTDRCTDdZu0o3fD6cYWZYA47d
	1HoiTrXTb169kuX/zI6BkSi/D+KDMvGPOR3JrYN/kg6YE7sVRlW9ts1RAo6yjDve4bs03wm52aoGr
	c8TAP9puAQ6t/0iIjQZ+LhULc/hhtKkDz6J3fY+FWwYH4Ux+FMW2Q6A1m7DONZJ8RuSdslw5duq7F
	uPk0/kWT00lO3dGXv1lK+obALFWYGxYp2SE5BRyq+VPyEcHl/RjUeg0fKebtfRQ9nuXD/7Rbrr/MW
	u2+MibOhrcNMl0ldAyYEabFBaLwiwYfNi+ydWzm/tlP5yoZ0qdOq80E3nU9x5X8TP5lmDPm0aJm0a
	F45Noing==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toirM-0000000G1At-1nvQ;
	Sun, 02 Mar 2025 12:55:56 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toipo-0000000G15t-2Zek
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 12:54:21 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-30bab0ad5a8so8248271fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 04:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740920058; x=1741524858; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phXyydY7gGfZlc5DxydLzP5lRJMditp6NpQC5fmMcrY=;
        b=Yi9l/FosJdW1z3Kks41oVvVCDBdTv2e1iiLS4Jjh3V/+jkxcG68qlPny1K6PbCjXkd
         n6lEFwzWpR6XRGu1ktL+e6YJJRch9N7Woldsne5rRJk73X3leZE5AsacTdvupmay3tkE
         6ex7Sf7cspFEWw/oJjOniqy8i/CZssddnM+L8GWt5G02Rp89+p7LuE1+eRYDC/WP/dNO
         geOzNpPGttNw3e0QoGR5kKmv/F+33qSRFanjzVukugTnZ44FEDCivq7iIAA7X17i61as
         iHGpkRgj110aTvm2QR9M45y0AhW1JfBs0dZ0JAM76FvG8ntkXLplVxT8F0hey31wytk/
         nQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740920058; x=1741524858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phXyydY7gGfZlc5DxydLzP5lRJMditp6NpQC5fmMcrY=;
        b=BuZE6w+iZAQBfoGILu+wrUR8YkUZM3EmtDtLyO55y+/Pj96eOgVPZ3BtaTJZ+8Mwo0
         xfyPiIx3gnlGkmdWjEyXuEytfMWbTT1athYiRHZULn40CCuDIH769nrekjyHCpTpNSwq
         6jqdxJYf9sgKQhW/KrKOcV4lRSyN831uVazfFDHPUva3qt0aVugY3/ntG7SkNyzloaiA
         /Ll3Wgvy7mdkrJPQ4BjjlZjeV8zyfhTE9naLpHzw5orAhedNudqllSqSSpQY1chO9kI1
         Lj+rede6y4HWfkKNhy3wZDp1+kUXKnw70jRJygLGFqJOTfMqbKrpPmQPqcE4V3oT0bZS
         /Q7A==
X-Forwarded-Encrypted: i=1; AJvYcCWzLk6eLMs7rXQP/QiA7aaryRL6g7J6Jy8tzL6dE1BJuRdQttaWhVdQWp5cXNdOML+0xiU/XXsGNeLbzFHNCfVb@lists.infradead.org
X-Gm-Message-State: AOJu0YzBRpIV4qBL02G0mnwtzjfGsyj9M6/Jkh/1wyzjnwaKRqtqxvTQ
	TY1cgqtaWSbFa3Em3APgTK94PdH5YIh3+cgRDFT/19ZCsXWB4l7y
X-Gm-Gg: ASbGnctxtsewoEuA5c/W8UfZPiqKGTgl9wbdhS2JszmFGgF5TAwpanG9pAAxZ/PId82
	FVIee45VA81ogt58RTtv2xtRCLLoW0hTfWL3k8EauXWRLfNEf6pPNz3vK2DCcLti7F+obEclQmQ
	qOocg4NdW+nGdy6Fy156WO0wSNmNRXIX1FAAb2/wnDXVgTe0t39xfG1A6ptalWhTY2zHt75PfzF
	hBOtqgvqqbqdEKgAhLZE1f0olOM2b1RaIhmdLNrO9Zv/vTWFXlNwpkY2KMLDaNnOaee8Nb9ER+L
	3BHlRsf02V8K60dXmrWgFNaYnJm1jq6nLLih1cCzUI2qeSgPKmwA/iCLcLdfyoOVU8Pmt1QkG2j
	nVMWo0iOQFSVt0irx0Q3v23Av0A==
X-Google-Smtp-Source: AGHT+IEJN/8WgRnH6T4J4ZG7JcpCuAO5jHwOEQHkq0uxIoxZ3O+QiARmgECict5SIiXPtktkXgM2tQ==
X-Received: by 2002:a05:651c:501:b0:30b:b28d:f0a6 with SMTP id 38308e7fff4ca-30bb28df3f5mr7934721fa.8.1740920058224;
        Sun, 02 Mar 2025 04:54:18 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bae88c37dsm2568041fa.37.2025.03.02.04.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 04:54:17 -0800 (PST)
Message-ID: <eaede287-658d-4c23-b217-5bc8053e64ed@gmail.com>
Date: Sun, 2 Mar 2025 14:54:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] iio: adc: add helpers for parsing ADC nodes
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
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
 <23f5ee3e3bf7179930d66c720d5c4c33cdbe8366.1740421248.git.mazziesaccount@gmail.com>
 <0de7b0ac-eca5-49ba-b1b3-f249655f3646@baylibre.com>
 <1b308a10-9622-47f9-b489-bd969fbdfc34@gmail.com>
 <6f6e6550-5246-476f-9168-5e24151ab165@baylibre.com>
 <9180ff11-888b-453d-9617-4b3a0fb38d91@gmail.com>
 <20250302032054.1fb8a011@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250302032054.1fb8a011@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_045420_659629_3B641F3C 
X-CRM114-Status: GOOD (  19.35  )
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

On 02/03/2025 05:20, Jonathan Cameron wrote:
> On Thu, 27 Feb 2025 09:46:06 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> On 26/02/2025 18:10, David Lechner wrote:
>>> On 2/26/25 12:28 AM, Matti Vaittinen wrote:

...

> So today the situation is we have all the options in tree and we aren't
> really in a position to drop any of them:

Sure. I am only really interested whether we want to prefer some 
approach for (majority of) new drivers. Furthermore, I believe there 
will always be corner cases and oddities which won't fit to the 'de 
facto' model. That doesn't mean we shouldn't help those which don't have 
such 'oddities' to work with some generic code.

> Hindsight is a wonderful thing.  I'm not sure on what policy we should have
> gone for, but now we are kind of stuck with this slightly messy situation.

Sorry if my comments came out as criticism. It was not intention, I just 
try to justify the helpers by trying to think what new drivers should 
prefer.

> Helper wise if it expands usefulness we may want a bool parameter to say
> if we skip the missing or not + make sure a max expected channel is provided
> (might already be - I didn't check!)

This far it only had (optional) maximum channel ID for sanity checking 
(useful for callers which use the ID to index an array). The bool 
parameter would also require a parameter specifying the number of 
expected channels. That'd make 3 parameters which may be used or unused.

I don't think I saw existing code which would have used these 
parameters. It might be cleaner to add new APIs when we get such 
use-cases. That should simplify the use for current cases.

Thank You for the long explanation of current system + the history :) I 
appreciate your guidance!

Yours,
	-- Matti


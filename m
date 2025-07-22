Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A38DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 05:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQqfu6KV2LEedciSC1FzGWW9xz4Dazd2sXJ7SsnkNfk=; b=WAKX8CeFWe1IpgXtZplmArMb2V
	AZTlYSYClWulps8AdOw21U0VtOhq5qrNVIO5lnGIMnNualXts1NYdY7U/TYNTm7iPExy/Vs5++zfL
	NS0K0K9Mpz6OkFevXQO+jEkuzLZUxYXIWzlS/5TjFTQlY9d12bSTwoLWgOn2lK3QuRBpagl6OI4+F
	v3k1HI+8X4kQoQA2xt5w5ywihadw9W6qql5KqiMgT/Shc+k1prWeq+/ZWJFHnByCEm93nF9H0v62U
	QRiXNJYB+EERHAHBXzlkfSOzAswh5SA3Ll9hRG0U2bMfrV6euKxoVWdKADLy9tw4aYokpYcRazN4U
	Lm6YV5gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue590-00000001Iqc-4Alo;
	Tue, 22 Jul 2025 05:02:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue551-00000001IOB-4155
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Jul 2025 04:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hQqfu6KV2LEedciSC1FzGWW9xz4Dazd2sXJ7SsnkNfk=; b=b+EIt3TGXSnvRiFUb+/ezzmgN4
	lwNYzZkbgvX+bPGs7hgfGFaxzqlg3Uyhjb/XchNxWVBrVujh11ujXRtwm1JAhMWxHF40O+AKMgiNZ
	ps7EkSmJQLnO7oRxH+E0S/fwaG6vWLj1Y8SvbNZirNEl7/Y7WFFhPas6KaJy7L9ZMXPRCb10QmdNd
	9qNElvQ7GqSQuT8haAKX8+l1JrH48UGAdSfjsKqkJWBWYrOtP5zn7QI0+dmW8N77t/gbRkBhtVRqZ
	Cv4pEBhcQm7n0rAaC38lIhp6JDugS+DCa2lqswKz2wkyDYVG97mBIstWj0iO5n5pWsz6ekHknelWQ
	fAwfsgjg==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue54y-0000000BCiU-0Xkv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 04:58:18 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso4995376a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 21:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753160293; x=1753765093; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hQqfu6KV2LEedciSC1FzGWW9xz4Dazd2sXJ7SsnkNfk=;
        b=NNpxCZyGKQBzlnzlxzKTX61tm1FTo7d2q0mtd0Jmig8CzcpXxyMb8XYTPCpesCcxJ9
         VTEYmQMAh0HKv+ednU0YPKRJ9WG45GURAxlb8fnLWf5UBdqsicTeYHnj4fUNPJpsDsF1
         dtkrLAEgP8hD12sCOVM5klU/WT3gzZe2KRZwVdsWqjabxTbhlGyUZSI4Ik+QOjHK/pge
         utVlBQhYEOnYArP5xCWb4s+ai4rTin47fVGcl12EjGC2A9IyoV8XE97Y8XNTU6QyQKrf
         LNxVhAhjnEu/RaDYXB9M20bH3pLSa1Pgwm45UwBFjryRXvvp5Yu/fUxRUjbHP5dzEzEN
         VOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753160293; x=1753765093;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQqfu6KV2LEedciSC1FzGWW9xz4Dazd2sXJ7SsnkNfk=;
        b=M35Z9iiOU+0ZXrjST6EM6T2MJIEg+imAVT0YQMPcsZ52pO5HlMVSvJmKypfsSXRFw7
         ayRwXWLszyw2JnKQrVnTtAn8aYtJW92hF/z6/7D1TjajSD9RinPfpCB1GccHL1llBU59
         WPabDfgjm3SSmrF7BwTlsabXgPGzHGVm/R6m4dNXUChJ2iqXytjyBsZgT1qxJG2JhVQ7
         01SC93Hz2+aKUP7PICt6HxA3Jqve1IQXWbC1iTL6gXUfKyzg7tovtC/i6tD/Nw8V1YMP
         l4Ai+jtg4qZ6llMNaHGY6dfIm7J/oWBfXPA9THYnz8FADOTCh+fycF3taBGW29ajQoNW
         CPlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlGAWAZek9Jn8PtYVVnAXqIgOwmR1FQ8VO4WmdTRVHxgtjKc1TTYGSwlPAk4lIar8jX9dcHkE8uFFpb+jPB17R@lists.infradead.org
X-Gm-Message-State: AOJu0YzJlhf6Hx7cSPgD+9/hhoD00tzyQAyX94hBrTpbSdoUuOd9Tk5x
	Xq13CJIFOdaCH23h1Wp2Dsi2QdchUP6aH2cuhtP1KsNu9VIk2v8w/8P7
X-Gm-Gg: ASbGnctb8V+Fj6XiYz2S281ys8QmiIQZqRNiad1t7cLrEraS4NXyHqhR1JTQQlgMp1N
	HSJAHFrKsNejzCslIFTR5eEtgbMUfKWirubEt2Y3k7Gi6zgS3YHqCy9E1hHxsCEa7LWvJNlNy0n
	N7+B0VaU2Y6juVuQGcTq/u/jKOagCX+9yOitOGIFJ5HU4Bm2beYEvrWjr0/bjX/PcZEisP6xDEY
	PRaq7drPj9au5pzO+NxCYZaHvkPFrqBfHX+QdSBEAe1mKiVwXusIlY9gMCs0SeFlxudnksxtM2G
	DrIYuiYD9M0WO7T2im/lJA9cQDu/PpTYg1K8bKIjQJkaVVgpmICZ7uCiMNS2HoSVwQm5qZz5rLX
	cszfFkKKYGjhduNgAcOFgcAksFyjlV9RvNswbQokDdkhRakGafRdY2DZ9EmaBqjirE0JzeMU=
X-Google-Smtp-Source: AGHT+IFONxPppaW3ozIBQzjr6I8fgJ+phfZt+V8YLrEQddIILmr1qCkBYP+C9eg364XGludvSH4+bw==
X-Received: by 2002:a17:90b:184d:b0:311:f684:d3cd with SMTP id 98e67ed59e1d1-31c9f3c6068mr34563581a91.12.1753160293400;
        Mon, 21 Jul 2025 21:58:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3f44970sm7172415a91.39.2025.07.21.21.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 21:58:12 -0700 (PDT)
Message-ID: <2e9c96c6-6dfb-4232-a9ab-a3e78b718fc2@roeck-us.net>
Date: Mon, 21 Jul 2025 21:58:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v1 0/3] spidev: introduce trivial abb sensor
 device
To: hs@denx.de, Krzysztof Kozlowski <krzk@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrei Lalaev <andrey.lalaev@gmail.com>,
 Chanh Nguyen <chanh@os.amperecomputing.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Grant Peltier <grantpeltier93@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>,
 Naresh Solanki <naresh.solanki@9elements.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250719063355.73111-1-hs@denx.de>
 <175311337130.327079.7374455187420344577.b4-ty@kernel.org>
 <d677ecd9-42d6-43fe-8fe1-a5afd4d270e2@kernel.org>
 <8a8106ea-83d3-e02a-9ae7-ea4a66e4c248@denx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <8a8106ea-83d3-e02a-9ae7-ea4a66e4c248@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_055816_391345_10A59925 
X-CRM114-Status: GOOD (  20.23  )
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

On 7/21/25 21:05, Heiko Schocher wrote:
> Hello Krzysztof,
> 
> On 21.07.25 18:24, Krzysztof Kozlowski wrote:
>> On 21/07/2025 17:56, Mark Brown wrote:
>>> On Sat, 19 Jul 2025 08:33:51 +0200, Heiko Schocher wrote:
>>>> This series introduces the changes needed for trivial spi
>>>> based sensors from ABB, currently operated from userspace.
>>>>
>>>> The last patch adds the spidevices to the DTS files, already
>>>> in mainline.
>>>>
>>>> make dtbs_check showed no errors/warnings for the dts files
>>>>
>>>> [...]
>>>
>>> Applied to
>>>
>>>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
>>>
>>> Thanks!
>>>
>>> [1/3] dt-bindings: trivial-devices: Document ABB sensors
>>>        commit: aad2f87cbcab56b322109d26d7b11842a09df91f
>>> [2/3] spi: spidev: Add an entry for the ABB spi sensors
>>>        commit: d60f7cab7c04944a79af16caa43c141e780a59c6
>>>
>>
>>
>> That's unexpected, Mark. Patches received two objections/comments and I
>> don't think discussion was resolved.
>>
>> ABB is huge company, probably making hundreds or more of sensors. The
>> patchset basically claims that all of them work with spidev. It does not
>> providing any model names or details, so it seems really incomplete to
>> call them trivial devices.
> 
> I do not know how many different sensors they have, nor if that department can
> speak for the whole company...
> 
> What I have as information is:
> https://lore.kernel.org/linux-spi/2477dc64-92a0-9dc9-d168-56646d0d796e@denx.de/
> 
> and I get no more information about them currently. May I should
> add some sort of trivial into compatible name? Something like
> 
> "abb,spi-trivial-sensor"
> or
> "abb,spidev-trivial-sensor"
> 
> which makes it clearer, that only ABB trivial sensor, controlled through spidev
> driver, is connected here?
> 

FWIW, I always thought that devicetree is not supposed to contain such generic
information. Is it even appropriate to list something like this in devicetree
in the first place ?

If so, what prevents anyone from submitting hundreds of
"<company>,spidev-trivial-<device-type>" entries, using the same line of argument ?

Guenter



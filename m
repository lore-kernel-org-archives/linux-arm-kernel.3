Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F03C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 19:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nj8WHZGsoOuauuYxbxbB7oKPr0MKW37ni43BF0NAcDg=; b=qeiklJGIqo4X/klhiY4SI7gfc3
	a35s0UGwLkZIccTFRpt03BGJnFEA/Bjn1ewasXlwMLlhmP3utroNldRwsHA81Qdy/XEzCuqYEoBRu
	LBjgDZG+wBYp09HzXGTguZGSbgSx/R8wkImrc/ZCyUJBuS4Tv8tCJW0CieIeHO2O7Y8P3saTMu7fp
	SC2wGV1lmg4Cg3d2NDvXlidA3fVbzm6qsduGsCh5EVaXKr7Q12uBMuBlCiMTtZNtbIvmdWEdk2cYM
	PckGmybPkibm0GetY1jOFUdSKuZpPr7p9HByQRVERCj4oQKQuH31SWk59rjOmeyrMmercurvGO7Dw
	sHzWMnig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIYw-00000008fJw-1Q1t;
	Wed, 12 Feb 2025 19:38:22 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIX4-00000008eyu-0yF2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 19:36:27 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ab7c07e8b9bso28236066b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 11:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739388982; x=1739993782; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nj8WHZGsoOuauuYxbxbB7oKPr0MKW37ni43BF0NAcDg=;
        b=f2sYVxnNni2y8J5CbYidD/1N22BwZqQFyPYV9ct9DYyk+SXzClsGCCcLquHMkJDtI7
         PyNCDwh9h3diZ0R30oWkAyoxptq8Gff+60GPfIXYUZXX/cfIbUCR9akgR5TNEPoCcvkQ
         bGBQSm5LfU5qEERfRQAowDWOlncd5qu3jWOx3F8JdjU/0SaN3aZC5PWGkW6XC1D2XXlO
         ov0B1Xx/Ru2oPBOrCafcaqEbHQ0/QkQYNC5dG45kuwg3vYfNvC4ABk5Uf3VDBDOs9avm
         vvC2r+Tzuwsl0knC3v6egq/7YXTokkw/ZhJZI1XUB/UYyDcb+HNcdFPFt0QEfnbbXAAz
         hJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739388982; x=1739993782;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nj8WHZGsoOuauuYxbxbB7oKPr0MKW37ni43BF0NAcDg=;
        b=uA5odhJ541sbp9kKojQ/7C57QbeWcF5VzL8dA0r5FHt4bSlUpP56rtW8J0lZOIC55r
         yDrrs24R75AFaLM04i7wvknPYKzA89tMambquytkqAg7Dfxq6vKnTCssefqSGJOJjPiL
         SWNHFC6wdA5Urq9SpXt7laliXT7DbcxWLu+xa9rOmzGrb97m0eyGrEFtVrXILjuSVd9+
         DVKNzxZh3m5ZbCQ/6u8r8CjWn3jhIE93HEf9EbY3W1qkbhQaTko+OM7lyHJSkrayHohD
         TOep0gNEasY9nmX19ekHi9CgPMNHZnCvXgUFA8KGaMmqzkj+q7AEPbaKspLTnu/+UlqJ
         vH0A==
X-Forwarded-Encrypted: i=1; AJvYcCW2ezaCZCnsmY4DI/CZ4znhKsJV2Uu7keaGqjP7TryQm+kmRyZVkHIH5js0WXe0HsDmJhlkO0rvK8FasaZY8yl9@lists.infradead.org
X-Gm-Message-State: AOJu0YzGyyzkNVP/1bXZjNL0B7I7EpU/BcRrO+9hMAX67MD92ZGFW1Np
	1AJsjUChwePjLEcD+pP+oBdbsFGk2gJfMHHKfMe+xg9qOzr4+YrT
X-Gm-Gg: ASbGncvj4QF7BN4424PkzqeIAzItUyhQHdTE436NDIYg7jFDp/bD73+e97SLQFk+ozr
	Vrj4okb1B4Xplc6UwfLL+dfYkell091hoHb2QBlx2FBzaYTU8TdlCkFU+ms7T8Cxg6UWC5h/GLK
	RAlv/ougzNTGkr4w7QK/u0uLF3IiJusvRTOIhW5YM6kA3Qu1HFsfzO0cRaOIMylsCMWdAa6KIDF
	bcPk1IGYmOiv6vEwGp3KAjBBL1trcp8vKZgRlwEJZGBiLQlBKrqdcUNDbLBaRhEzmb7jpz/aurY
	HaYhKhQZM/++8d7g4eRUByumKNP7q9A4K8TlgV2DehcK
X-Google-Smtp-Source: AGHT+IGL83Kis97/b459m6UtdYpnAuiWRMSSg5OjvrrLppYn0/cJ+CJ1qwhXz6yKmy+MT4z9GaeW5g==
X-Received: by 2002:a17:907:c1e:b0:ab7:9b86:598d with SMTP id a640c23a62f3a-ab7f33c1e0amr401910866b.17.1739388982053;
        Wed, 12 Feb 2025 11:36:22 -0800 (PST)
Received: from [192.168.1.130] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f49361sm1319997166b.33.2025.02.12.11.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 11:36:21 -0800 (PST)
Message-ID: <e45411df-1b8b-4f21-878d-d52e1112e62d@gmail.com>
Date: Wed, 12 Feb 2025 21:36:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] ASoC: dt-bindings: support imx95's CM7 core
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
References: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
 <20250211225808.3050-2-laurentiumihalcea111@gmail.com>
 <20250212093610.x4ixrackmn3u2xrf@pengutronix.de>
 <CAEnQRZBeQdnC+K92+Udb5awTmom10YHHNt7Ld-pYK4A1i8sr3Q@mail.gmail.com>
 <d66996eb-f49b-448b-9743-d19a3c3eba52@sirena.org.uk>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <d66996eb-f49b-448b-9743-d19a3c3eba52@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_113626_270945_7F7963BB 
X-CRM114-Status: GOOD (  18.10  )
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



On 2/12/2025 2:38 PM, Mark Brown wrote:
> On Wed, Feb 12, 2025 at 12:11:49PM +0200, Daniel Baluta wrote:
>> On Wed, Feb 12, 2025 at 11:38 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
>>> On 25-02-11, Laurentiu Mihalcea wrote:
>>>> +    const: fsl,imx95-cm7-sof
>>> Albeit Krzysztof already add his Reviewed-by, can I ask why we need to
>>> add the -sof suffix instead of -audio or so? SOF is a software project
>>> but you can clearly run different software on the audio-copro as well.
>> Sure you can run a different software project on the audio DSP but
>> you will need a way to distinguish between the different projects.
>> There might be different mailbox, memory configurations. So you will  need
>> to invent another suffix specific to the new project.
>> We can make  const: fsl,imx95-cm7-audio as the one used with SOF
>> and think about a different name later for when another project will
>> want to use the DSP.
> I think the point here was that the DT should stay the same even if the
> DSP firwmare changes, just as how changing the main OS shouldn't affect
> the DT.

It's rather unfortunate but based on the experience from the 8 series
(imx8qm, imx8qxp, imx8mp), the programming model can differ quite
a bit (e.g: remoteproc vs SOF) even if the core is the same (i.e: DSP core).

The different programming models also required different DT configurations
(e.g: dif. mboxes as Daniel mentioned, some extra properties (i.e: reg-names), etc...)

The "-sof" suffix was chosen here instead of the more generic "-audio" (or whatever else
alternative) because the DT configuration is specific to SOF's programming model. Other
audio applications running on the same core may have dif. configurations (e.g: use
DTCM/ITCM for memory instead of DDR, dif. mbox count, etc...). I suppose this kind of thing
is bound to happen to some degree since the DT node doesn't just describe the CM7 core
(but, rather, it also encompasses information on the memory, mboxes, etc. used)
but perhaps I'm wrong?



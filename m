Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330F9C83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 23:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96edAJ78aoq+ligp1pRPgUyMQ47YjBrb5R36hN7T77Y=; b=L5+Q2hNNTotXTwiNG3muy3CZZH
	fG+KRL97dNhKCWztRW1mH4MF7tVmIOc/LljuBg1AiQnQKKXQPCi4mlzOD/BYZLJPvfjJEOPVpK1vi
	/rDhowVpcriMS/nfKi0gboAah2zz2vrZbmgkrEtlxiWner/BbGnUJJdmqHdl7ZZyzLjWwIm63OrNQ
	hp0vnC7YDPrNghxL1dNrhZlOfqODHYDWag1WeTN6iiwlPDOn33UBCGZFrBRDOxo1MWMKQMYSDvq+C
	540oOCncJzOe+Yrm0XQ6jy2r8AcGqxG+tinQ0b8kcNhetoLIPoh7dRlUhdV1Qacm8Updv87RC2Fhw
	vQaufehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYvjB-00000003olj-3BmB;
	Mon, 07 Jul 2025 23:58:29 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYvaO-00000003o4D-0ohx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 23:49:25 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ae3c5f666bfso611052866b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 16:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751932163; x=1752536963; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=96edAJ78aoq+ligp1pRPgUyMQ47YjBrb5R36hN7T77Y=;
        b=fZ4PY0ZfYs+BqowNwaFwMcUbZ/8eEhXRCgvN5+y5sm/FSm9YHiVkr6o4xXoir8KLCz
         XlTl6EQA3SKZJzYmY/OdACY4Wo1jT/uhkhK85EBi+ykiwejadZtHmQTc/lkPb+Wh5dY3
         cmmqUL1TdJMU3/mj67Py4/Cy/6gCWW015k+rRCWSyyZIcqnHe9a95IlzvfCro27QWoRk
         V45FbHG/pevSX4FV5o0iYXtQE/OEx/gXSGzqww8zRoKqnKSejxgztPSFT+RgL/HEiW4A
         loYneFX3tUuCTzM6Do0rnMrT9zolIwBFPkTtNC3IPrknMrefRqEa/eV2qA1vFMvva2iJ
         pe3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751932163; x=1752536963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=96edAJ78aoq+ligp1pRPgUyMQ47YjBrb5R36hN7T77Y=;
        b=iPa8sU3r7NDj4glcJ2sWlL/Y3bnYbFzoq52ug8iRTsshplmFM+PRqt4wmbyrBx7WBu
         w9c0KzJgLN3WMBCZAdij9DdLLZ+bIDDlm6WzcoTR8MpMjpiNcJJ00Q7S/8Coou2koN4t
         +pxGQza3yxtCka7eq9XKSYaJbylygUN1ztbyHYnMjd4lZMLU5g+iT1nRaqXzKF28652a
         oCkdoOxpnA9PQQguh/meHqw4O8YnEThYyHCalJL9qZ9JuU4wvMu9pxzA2C7s0IJ+c4Du
         mmZ5dhHXGpSPhgShZBDTNjPFN0D2ucjBZwcUZeDCvulVwp07us7AqrubhPSk+5XqGXMv
         RfTg==
X-Forwarded-Encrypted: i=1; AJvYcCVo42yFQ79nrINRKcQWllwMDJnCHZqIgrwHo7QG0NN9bEHvrfEAKx2d22XM9ToIEjDuW+avxllMQ1WcJ+Saifk3@lists.infradead.org
X-Gm-Message-State: AOJu0YxI7jGs6XP3bpaC8WAMSEiS9G41IpZ73bOc+iim9HiiZePvi7tq
	rPhbLuVUGFCaN+HkaKTe02PElHX4QPzYFY6UmtLrflE+bZPTSOauwu+i
X-Gm-Gg: ASbGncseO0P/ZslLOJq1LB79dgiibSCvIywRXjJDofnxNDi9JhzpTeTGG8YMGZn1tOt
	qSEXl1V+6/54FzrV2JTduibBj+mHvh5crY0vuqPbqrkDwkrhFQVlCSllf3Y3wSfx/qzJedd2BQj
	xRqEWVlgR+HVtJzAKyuYqaLjSEcHNWKFHqpZa0LjE6yBdIVOiX6qGfeGd+XQ5hQzlhpSeqK685o
	a0s//Vh+XOa8NzS4K+PKlDIMdA0zeWyjeudZgYyMSa8YlK9MC2ful8yPuqHt2pAJNmGPRGmSy4F
	2CPNe8MRgkPGspCUr7bMsdif3GtAkacFTz2urk1RoCIOkN6A8bEMxgT6OolVHKn3PUsyaj23wV1
	MR97wu8lXfV/HYQ==
X-Google-Smtp-Source: AGHT+IEFkAXubR8nGNnpMMcgpN1NSWw4WX7eaJmPIaLLZ4fC713GtP5JLryHmUzd1bIBXHOSvqiWdQ==
X-Received: by 2002:a17:906:9f84:b0:ae0:b22a:29b4 with SMTP id a640c23a62f3a-ae6b069d5ebmr97623066b.39.1751932162362;
        Mon, 07 Jul 2025 16:49:22 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b02f68sm790697866b.117.2025.07.07.16.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 16:49:21 -0700 (PDT)
Message-ID: <2939a44f-a70e-41a9-9203-83a87c9a4be1@gmail.com>
Date: Tue, 8 Jul 2025 02:49:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk>
 <c3deef24-fed7-4405-9953-804bff118c11@gmail.com>
 <5029548.31r3eYUQgx@steina-w>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <5029548.31r3eYUQgx@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_164924_245111_9999C7F0 
X-CRM114-Status: GOOD (  24.50  )
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



On 7/7/2025 8:11 AM, Alexander Stein wrote:
> Hi,
>
> Am Mittwoch, 2. Juli 2025, 21:54:09 CEST schrieb Laurentiu Mihalcea:
>> On 7/2/2025 9:49 PM, Mark Brown wrote:
>>> On Tue, Jun 10, 2025 at 12:01:50PM -0400, Laurentiu Mihalcea wrote:
>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>
>>>> AIPS5 is actually AIPSTZ5 as it offers some security-related
>>>> configurations. Since these configurations need to be applied before
>>>> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
>>>> be their parent instead of keeping AIPS5 and adding a child node for
>>>> AIPSTZ5. Also, because of the security configurations, the address space
>>>> of the bus has to be changed to that of the configuration registers.
>>>>
>>>> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
>>>> missing 'power-domains' property. The domain needs to be powered on before
>>>> attempting to configure the security-related registers.
>>> I'm seeing failures to probe the audio devices on the i.MX8MP Verdin
>>> system in -next which seem to bisect down to this commit,  I'm seeing
>>> separate boot failures on the EVK so haven't been able to confirm the
>>> status there.  There's no obvious logging, the dt selftest shows:
>>>
>>> # not ok 141 /sound
>>> # not ok 142 /sound-hdmi
>>>
>>> Full log at:
>>>
>>>   https://lava.sirena.org.uk/scheduler/job/1530197#L5119
>> Hi Mark,
>>
>> Thanks for catching this!
>>
>> After browsing through the provided logs it would seem like no device under the
>> AIPSTZ bus gets probed. Right now, my guess is that the AIPSTZ driver is not being
>> compiled since CONFIG_IMX_AIPSTZ might be set to 'n'.
>>
>> Which defconfig is the CI using? Is it arch/arm64/configs/defconfig?
> I'm also seeing audio problems starting with this commit. In my case I get
> the following error:
> fsl-asoc-card sound: failed to find CPU DAI device
> fsl-asoc-card sound: probe with driver fsl-asoc-card failed with error -22
>
> DAI device is sai5 aka /soc@0/bus@30df0000/spba-bus@30c00000/sai@30c50000.
> It turns out that the module snd_soc_fsl_sai is not even autoloaded. Loading
> manually doesn't have any effect. So I assume starting from this commit
> the subnodes (at least sai5) are not even populated.
> Reverting this commit fixes my setup.
> I've set CONFIG_IMX_AIPSTZ to both  'y' or 'm' and doesn't change anything.

ACK. Would you mind giving [1] a try and letting me know if that fixes the issue for you?

[1]: https://lore.kernel.org/lkml/20250707234628.164151-2-laurentiumihalcea111@gmail.com/

Thanks!


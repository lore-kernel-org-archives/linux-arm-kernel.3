Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017F9CFD37A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 09:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fgh4ODFDnXgu6g2WTTqzK1hFnk5Jr1ZOv10EVLwZMBY=; b=GWQoBD8OsxmzjphRfWXFjLMpGx
	4jX/3gQIvQg0EbX4JGVwrtBNn1E+YXO+LspnCkRKl0BdTMgV7LaOMykxyX8vG8P4VpWLZcemUoAiQ
	7iio9726Vf6rd2H7lycn3FWLmK6jrRw3sJGifytX7Z/0d6dc9f7zMFkTkvwZwU7E5FKUCoIPmlEVz
	jS8ayQqx82Z+7IlK/hU2WSArZF6q1rDDpWU1Ogg2ESbmkHRkf1TQY+gGN/FYRP3sb1KL+Igz5YnwF
	6K1JCanKwWlDMzQpT2Vk8PG4mUPkE+iPh7v7hybtAY3xd0UdjFBEUkptfVa+KjbXjF9tfLlqbUbh5
	9jp1wW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNppj-0000000D4A0-1v6o;
	Tue, 25 Nov 2025 09:59:39 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNppg-0000000D49F-48Eb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 09:59:38 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b736ffc531fso754932666b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 01:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764064775; x=1764669575; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fgh4ODFDnXgu6g2WTTqzK1hFnk5Jr1ZOv10EVLwZMBY=;
        b=A7rBtLeTWWjMFSB5REBBkHsWhkeaitxXEwJ47LQprAYq5i64V4KG8G7WCJwWRpFrSc
         0i+L9Q8fqriIA3D+t2ycGe2lrBwz+0ZI8Qs5oMBtU7bA/6XCi5NH2KzLa/ReKysDxPOG
         JE/WqMz4X9gob/SS/llKLT5P7ff4SZtPHfRHB6378sZwclOcHcCfLuKMiG5CmMhzRakL
         gp4g/ssgrdRBjStx4ofAQqKWzSXSY6jS68KKLVZ4Zs5Q7lT0drvAUflhBpSEhoboZs7s
         sq9T7DZ3VpcTH5YWhxkemeGiRcdcM/3c0a4hJxvjQ/FdowMSn/dliN8djgUPr6NxcQJc
         qzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764064775; x=1764669575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fgh4ODFDnXgu6g2WTTqzK1hFnk5Jr1ZOv10EVLwZMBY=;
        b=avOWnzs/LeXgpb7fdtGVBo7GCh+M8hpPmLUf9jxTCiamBI/w3KeadsK3DSl9jnQymZ
         7ePB7Lzvy/iwebZzMcqRlZISHfVybGGwz952FHFyz379sXjViu3ZZmByErDUgcO/F0YG
         PbcCfllXz5bVORWsFvFkfpqSx6A3vfSpX5xeuKBBbYHykwMgcjDfr7suXIgJlGEyX3OT
         GMDgMlT7bzNcl84bCI/PCRiwdAezj1nFCA7lBFPqT8dphXK+cJNdEJODmOVYMw6YLd4c
         PbJI7wufQs/xb/g3NZsAyfFwJXVdraXJgBFeVYT92/6On50mu5kOyFp3Sfbj7cc0JADl
         VXuw==
X-Forwarded-Encrypted: i=1; AJvYcCV7Txs+PXNuK7SQxl6F6m7Ch8LJHPbTo974BdT7KvrNlEogjArOpKaf2fJAzcHrVpowshw8yHCaFbx8qXPLpdUe@lists.infradead.org
X-Gm-Message-State: AOJu0YzTx/MNE/ScPEjvBF6GARyAKiCgfDkFYoPaGrzROxP5dxZjsALs
	X6HGKcjq/SQSJJt45lQg+RChEj3aVT+8oQgwiZP1eJUg24vW63+tbvwk
X-Gm-Gg: ASbGnctUPPV1XKrutLWU7p6qlsjhUWiOn9+rEs3ITiouPJ4ZA8C9pvO2/OjCM2zq7Pu
	qeSph9O8Vj9Xlq4goacZkxxxW0G6Tc8sUoZVLnQcCWf2vm4PG+GHCQ5DNGPHn/4MhJ1RIOIQvdf
	adHznlCv1p+K1RPw+HgJC80whay+syBKZWQuh15GRS2uc7VVHLUrKkReO3sWdtdhWKm9tPzHwUq
	G8UGaMz3WljZ3eZPGr66uLLj+9Z4VzUZfEVh2eWgse18L4IVA/PaJefdJz1047+auO23LsLWTJi
	pA0ec+q2BiCqhnryAzi5g6XCeQiVx5Qup+cKYYgmyxTg7+TdBbMixItmBKdlTBN/YKTzDu2o2o1
	STQ+mCoGV1L7t0ABDh6KiFNWRp/+u10tUh1eb92e8Ms5wee+gne4iiVPhNCUO2JQVU0Yzw+unt3
	f/WDP0vqHv9QGAY9oUqVG00DYv79zi3Zxw/viCZwtah8U=
X-Google-Smtp-Source: AGHT+IESxJDwS/BJ1YU+rQ3vBeFJBP5tEOROc8lHgEyTp+47bod8zHWxWQ5jr9upDauFLWFNyK0Ddg==
X-Received: by 2002:a17:907:3daa:b0:b73:57eb:688 with SMTP id a640c23a62f3a-b767183c4b1mr1636055866b.53.1764064774524;
        Tue, 25 Nov 2025 01:59:34 -0800 (PST)
Received: from [10.25.216.228] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd51fbsm1498870766b.33.2025.11.25.01.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 01:59:34 -0800 (PST)
Message-ID: <4a022153-009c-44fd-8c4b-39819ae69390@gmail.com>
Date: Tue, 25 Nov 2025 01:59:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] reset: imx8mp-audiomix: Replace mask with bit
 index
To: Frank Li <Frank.li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
 <20251114133738.1762-3-laurentiumihalcea111@gmail.com>
 <aSCHjNqj3CV3ahX0@lizhi-Precision-Tower-5810>
 <6be8a682-6c72-45c8-be0e-880ab66045ff@gmail.com>
 <aSR8q5cE/XXbZuF0@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aSR8q5cE/XXbZuF0@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_015937_045860_1A2439F7 
X-CRM114-Status: GOOD (  15.72  )
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


On 11/24/2025 7:41 AM, Frank Li wrote:
> On Mon, Nov 24, 2025 at 01:28:32AM -0800, Laurentiu Mihalcea wrote:
>> On 11/21/2025 7:38 AM, Frank Li wrote:
>>> On Fri, Nov 14, 2025 at 05:37:34AM -0800, Laurentiu Mihalcea wrote:
>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>
>>>> Replace the reset map mask with the bit index to make it clear that all
>>>> reset lines are managed by exactly 1 bit.
>>> I don't think there are benefit because I met some periphal need a magic
>>> number to reset.
>>
>> Please provide more information. What SoC? Which peripherals? What block control?
>>
> I can't reminder exact one. I grep some code
>
> [IMX8MP_MEDIABLK_PD_LCDIF_1] = {
>                 .name = "mediablk-lcdif-1",
>                 .clk_names = (const char *[]){ "disp1", "apb", "axi", },
>                 .num_clks = 3,
>                 .gpc_name = "lcdif1",
>                 .rst_mask = BIT(4) | BIT(5) | BIT(23),
>                 .clk_mask = BIT(4) | BIT(5) | BIT(23),
>                 .path_names = (const char *[]){"lcdif-rd", "lcdif-wr"},
>                 .num_paths = 2,
>         },
>
> mask is more extenable and easily support more hardware in future. Change
> to bit number have not big benefit.


sure, I'm fine with the mask-based approach. The big idea here is to make this driver

usable in as many scenarios as possible.


Philipp, please let me know if you're okay with the proposal. Will also have to tweak

one of the subsequent patches since, so far, we've been operating under the assumption

that reset lines are 1 bit.



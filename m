Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8A3CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 02:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLV+YqotDLXxDawySKCdSBP/LHKYRIWzAMZ3fLidsa4=; b=N8avyinN4YpDXzFKIpluIUzAIM
	3RqXwT8YOK6Zu9xp/2Ycrhe5TCbFvlujw8jjnfDTgWbP0hBunZzSjXeBsz79cn2GNW7U/kOB22yBq
	D7EbfEfh0Jc/ahhG+6X4OKs3YsW39ZeSQgVJDqrqV/hTsVkk7HI2W6qFF5GLB69bpWNuJMIL80k+s
	sZt594D9iPCflCmkaGJQRM9tNmrRPbsqT73h7ynyFvh7h8NcbTJ08sPqxgnxhSsMKPbbup7O2XS5g
	bwpLJchzn0KqQPZbeN1oFdqyAaclnNL+g624UF0IwfnCuurYoEnc3N1rqLDjp/SdA1HlS//KQNh2X
	uVqg017A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC6ZX-00000007c9P-0nt3;
	Thu, 01 Oct 2026 02:30:59 +0000
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC6ZT-00000007c8y-3WeF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 02:30:57 +0000
Received: by mail-pz2-x0c.google.com with SMTP id 41be03b00d2f7-cc78d45f78fso3843812a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 19:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790821855; x=1791426655; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dLV+YqotDLXxDawySKCdSBP/LHKYRIWzAMZ3fLidsa4=;
        b=spZuwskjPLOZpzCPRI/AC9cD4t3qmiN1OnCw0kWvkzNQUwye1lLdteYfAXly7K8ZZb
         hMqb6Mmm+muMw8cffrlaII7vqlgbLeXZOh6kXLS2D35t1m1mVhExb65T4UxHqr3aHHwO
         jxm1E7279fgFoBZ5pu13JSB78u2fD3LzZTGbXFiaPn94QR5IYEl7t5uII2FXI6/Ka/gn
         mNRw+0mPO7bPkB2OAn1TTUJlDTBQk8ZgpzkycoV24VZ6CODqI8o2gzd3T/GPEZYgrRef
         Vit80qaXqTfFMADkTE9NH0aeIEcaCJbtIFqLJ3SSzb5aqqS0aZWABBQ3pzGsMj0b2O2X
         2Caw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821855; x=1791426655;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLV+YqotDLXxDawySKCdSBP/LHKYRIWzAMZ3fLidsa4=;
        b=xJA6fVapIpbm45Pcs1Cwrav6aOOBb+ppl/uv7DTFvVkl0lbtkrJzPZgvgf78lxNGTP
         vaqgjesnvMQFID5jWjIRHAAQAwnkBJ3Xve8ovhKMhPldWvjnUXMIGD+mp73Jo09tSksj
         X7kKtW9kIpZEHKBR28HpOQEyo6HSl0TbRAznIXokjCysW7TjTbVFe85mgw6uaA7werP1
         IzLuuoTHfAWPzHCpy221jllAegbZW5QLSQahxnqG67h+ycYA0scgSCXLz9AL01vBUjSZ
         NQXjaOKEhsujpGsqUijJZJPJH1OgBzoke174FkYAzil7ChfZdX55J54E+V3z+ZQz8ZKv
         IdNg==
X-Forwarded-Encrypted: i=1; AKwUvByZbFgL6pVcix5SuyP9JQWm8C4v7BP8RqCNpSS4ebN4Vg2UTYiIOkcx7vLdbdo1mD82cGbPDzRI59I+n2lOaCH3@lists.infradead.org
X-Gm-Message-State: AFuF++k2fQqATzlX1g4dS7RA8jdh3GLCMi433QWpJuCZkzS/zrXp5Kco
	c2nWHMVTe0wO6YaMrHrPhdvdWG5LWxVANHyDtnrkwl3L/Tj/oC4jzFnO
X-Gm-Gg: AYBFou2LAGfGZhsjDAlXw4HL+av0J+doEqRlrLYsNk8BC0w6Wb+aLppmmAuWgH36ALU
	ikT60NXhatHH1e7BQ2vhpSnUeaO8nsWJUoKpRWyiphmfU9XFfRD5Gaeku0tg2RMOW8LUG0Ahd/o
	yZApAqHl8Whq/bW+Gmvxsr2wDiI9yyn1Spc7RMbqi8BdDZGvrtNgjdDqh09kqi7nXDJXfqSB8uq
	v/u8HWX5qX0WPqrerM5UIPhbfW8VZAyhUaVsYh76uFdnx2G8jzZLK96/ljnMWskops/qt4hfUKV
	6b8GClmdpfW2JDOShj9tGnWD+NYCUceU+a1v4nnb1VjqUKY5aFT1zQIVKqT2H3SflEEatiIfokF
	4ykzg5mbZHY4coKPrHif3b7aVJA47WnV+pymT/o389YAolKvUMY4JwBUY3kvQpsbaigaKHC+BUX
	M2AzobmKOYdqLfvSJiBRxpoQDUHDAd1LZyeJ7tp7CwFXGGNqw1Lw==
X-Received: by 2002:a05:6a20:260a:b0:3cc:ebeb:3efe with SMTP id adf61e73a8af0-3de9e02b82emr2903360637.9.1790821854823;
        Wed, 30 Sep 2026 19:30:54 -0700 (PDT)
Received: from [192.168.101.188] ([2605:e440:15::152])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e539b583sm676858a12.2.2026.09.30.19.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 19:30:54 -0700 (PDT)
Message-ID: <36bac55b-c7e9-40e3-b376-fb8d163fcd40@gmail.com>
Date: Thu, 1 Oct 2026 10:30:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] dt-bindings: thermal: sun8i: Add A523 THS0/1
 controllers
To: Rob Herring <robh@kernel.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li
 <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 =?UTF-8?Q?Juan_Manuel_L=C3=B3pez_Carrillo?=
 <juanmanuellopezcarrillo@gmail.com>, Andre Przywara <andre.przywara@arm.com>
References: <20260913145527.18148-1-iuncuim@gmail.com>
 <20260913145527.18148-2-iuncuim@gmail.com>
 <20260924151758.GA75925-robh@kernel.org>
Content-Language: en-US
From: Mikhail Kalashnikov <iuncuim@gmail.com>
In-Reply-To: <20260924151758.GA75925-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_193055_881754_4289DBE5 
X-CRM114-Status: GOOD (  17.23  )
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

On 9/24/26 23:17, Rob Herring wrote:
> On Sun, Sep 13, 2026 at 10:55:23PM +0800, Mikhail Kalashnikov wrote:
>> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>>
>> Add dt-bindings description of the thermal sensors in the A523 processor.
>>
>> The calibration data for both thermal controllers (THS0, THS1) is split
>> across two nvmem cells at different offsets, requiring the two cells
>> to be read and merged. To maintain backward compatibility, the name of
>> the old cell remains "calibration" and the new cell is named
>> "calibration-second-part".
>>
>> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
>> ---
>>   .../thermal/allwinner,sun8i-a83t-ths.yaml     | 34 +++++++++++++++++--
>>   1 file changed, 31 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
>> index 3e61689f6..792081af5 100644
>> --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
>> +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
>> @@ -24,6 +24,8 @@ properties:
>>         - allwinner,sun50i-h5-ths
>>         - allwinner,sun50i-h6-ths
>>         - allwinner,sun50i-h616-ths
>> +      - allwinner,sun55i-a523-ths0
>> +      - allwinner,sun55i-a523-ths1
> 
> Why the 2 compatibles? What's the difference between them?
> 
> Surely this has been asked already, but nothing *in this patch* answers
> it.
English isn't my native language, and I don't quite understand what 
you're asking. It would be better if you just said, “I'd like the commit 
message (or somewhere else) explaining why two compatible string are 
required.”
Thank you.>
> Rob



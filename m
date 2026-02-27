Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79913FEFB7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 19:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pd2l+JTyDm5qt4ZPcX8V0lrEq9wdUKoWy5MeIE+NzpQ=; b=YvrhZa7plkjpDQMsYcR6NPWOyU
	FHgH5LrVY0jYkn/xV4nhj2Khd58qBPnFEgjPrNwKbRu3h8mNHg6nmY2wTSgfRC8ufMgI9xPFY9fL8
	R8pGRZxsEQ2fGbwh8417t6wSK1q/b7N9bkCn2nham8JyVvJEgp0iHVQvCO2t/K1kQZTNGEgpBQPrg
	ZfWFusYlvBHdzZmwcrst83WPWxDITVuPgwJid+/S6XYEOuZD4QXLk9+QDm8YpCbQKMMkd+Fj8qbLN
	PnxSKLSr23n7uItJQe0uznkww2ZFKQA4G+I7frTiql5RAmhH2++zThg97A4WpXli0KD6Ttwd5gJsS
	TNKJ8pMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3cH-000000091tg-3Lmc;
	Fri, 27 Feb 2026 19:35:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3cG-000000091tV-21xj;
	Fri, 27 Feb 2026 19:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Pd2l+JTyDm5qt4ZPcX8V0lrEq9wdUKoWy5MeIE+NzpQ=; b=cHRBAgM/KlAZr7BjsdGkHsIrMC
	T4htGQPLsNzcEvmdnClPDGIMmmBMvZUSwElQBTtLTJ9iONgGpswg91N5oP+tg0/USJXWHuFYa2Qq7
	d1JxkFr5GSkJ4GX2yuK+U+m9Zn4IVJAglyooWQb6ydZRzGJvJlXqSKpZm+xdAG+raxBXdEAX3k5XH
	PFRooQRAwHtQdNfX18g5Av05jVWf6HsadB4cS8CMMMwwuM6/qVuFeJw6Lp+GATPRlBXvd+o6dTa0Q
	qkiz0Rd11QuinS4DaIswbV8ir6Mvw4vaNdycyg+d1JMQKWoqO5Z9Xl6PEZeANFVepMCwaCr3NO+rj
	QgN/m2wQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3cD-0000000Dmim-1vl6;
	Fri, 27 Feb 2026 19:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772220903;
	bh=Sg54OHilyAiTowHFweIO6TJCUr6DyO95/X7Kg56nUng=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SNHJkD4qc1tUROyxSAmioCvtFHdr+ptpOsexJkTIm6QkjAfpJ2L15X1kLH+fGLs5g
	 7ndaE5+jAT+zJsOJOvlTe8YovpNQMVAzjC5J95Jhr+2oUXzydiKA4ejk2u39Y0039t
	 XUXJfi32zXzLQzrJpu+Sj1ekJg2493LqPBx+wLIl0LempNsx8HJMjMvCUA8UsAASJK
	 2X3k1aroMu5TApfnb+oh+lsqPgeNM3JKm5wjUk4rPn6SQJJf88gzRejBHyc/J8GkZ+
	 kV7mS0xFGj/ejS3CxAxVOBm8KeVwRTLkE9oEo78yTpAOQaj+xW7h4Mn6UNfMHg9pSe
	 Oh2jitFB7ccNg==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C39217E03E5;
	Fri, 27 Feb 2026 20:35:02 +0100 (CET)
Message-ID: <9cf5677d-8b90-4ccc-9b70-3e05a5a4a1c7@collabora.com>
Date: Fri, 27 Feb 2026 21:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
To: Conor Dooley <conor@kernel.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
 <20260226-salute-threaten-a3eabb232396@spud>
 <429f3c7aa22eccffedbf8db6aa91bee3dd13814a.camel@collabora.com>
 <20260226-snide-foil-a05e1aa156a8@spud>
 <3d28c699e47f606bad46bb6447785badace37793.camel@collabora.com>
 <20260227-atonable-glamorous-920cfd832bc1@spud>
 <86f4e4ee-cf49-4ebe-8cc6-0a9763ade36a@collabora.com>
 <20260227-wreckage-cozily-200175c6efce@spud>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260227-wreckage-cozily-200175c6efce@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_193509_697553_E4AD964A 
X-CRM114-Status: GOOD (  28.35  )
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

On 2/27/26 8:10 PM, Conor Dooley wrote:
> On Fri, Feb 27, 2026 at 07:49:33PM +0200, Cristian Ciocaltea wrote:
>> On 2/27/26 7:18 PM, Conor Dooley wrote:
>>> On Thu, Feb 26, 2026 at 04:56:30PM -0500, Nicolas Dufresne wrote:
>>>> Le jeudi 26 février 2026 à 20:59 +0000, Conor Dooley a écrit :
>>>>> On Thu, Feb 26, 2026 at 02:45:11PM -0500, Nicolas Dufresne wrote:
>>>>>> Le jeudi 26 février 2026 à 18:43 +0000, Conor Dooley a écrit :
>>>
>>>>>>> Deprecating the order also makes little sense to me, given that some of
>>>>>>> these devices only have one reg entry, which as far as I can tell from
>>>>>>> looking at the driver *is* the "function" region, so it can never be
>>>>>>> entirely deprecated.
>>>>>>
>>>>>> What I'd like to see, is a binding expression that behave like a set, not a
>>>>>> list, and leave the ordering open. As people keep repeating, there is nothing in
>>>>>> a binding that assist to define the right ordering (its not address or base
>>>>>> addres aware). That basically means, we can't as reviewer see that ordering is
>>>>>> going to imposing using a base address in the unit name (which is a convenience,
>>>>>> not a rule I suppose) that differ from the vendor documented base address.
>>>>>>
>>>>>> By explicitly removing the ordering in the binding, we create a strict rule that
>>>>>> driver should retrieve this by name, and never assume the ordering, which I
>>>>>> personally like.
>>>>>>
>>>>>> thoughts ?
>>>>>
>>>>> Yeah, you can do this, but to avoid potential breaks you have to do it
>>>>> from the start, not after the fact. Probably there's bindings that get
>>>>> acked every day that do do this. Even the retcon is okay to do when
>>>>> reg-names is mandated by the binding and the users use reg-names in my
>>>>> opinion.
>>>>
>>>> I think from the above analyses, since the usage only starts in rc1, we have
>>>> room for improving it knowing we aren't creating problem for anyone. Note that I
>>>> have no idea what the syntax is to "do this", and I doubt either Detlev or
>>>> Cristian have a clue.
>>>
>>> I think this is the only bit that really still needs a reply, this can
>>> be solved by adding reg-names as "required" to the existing conditional
>>> portion of the binding. There's probably hundreds of examples if one
>>> does a search for "then:\n.*required:" to use a basis for the change
>>> here. Probably should be an independent change, since it is needed even
>>> without the re-order given the bug I brought up.
>>
>> As mentioned in my previous reply, the actual problem is that the binding has
>> been already released, and I'm not sure we can change this without breaking the
>> ABI.
 
[...]

> So yes, while what I propose is an ABI break, the driver currently
> expects reg-names to be mandatory for the rk3588-vdec. Additionally, new
> required properties are only really a meaningful ABI break if the driver
> is changed to required them, since that would render old devicetrees
> non-functional. The driver in question already requires them, so that's
> pretty moot! 

I think that's precisely the information I was looking for, i.e. breaking ABI
in this case is fully justified since we cannot really fix the driver.  I mean 
we would have time to do this, since the rk3588 related changes landed in
v7.0-rc1, but it's not feasible to accommodate to the current state of the
binding, as you clearly pointed out.

> Hopefully I've made my point about reg-names being mandatory this time
> around?

Totally, thanks for your time and sorry for the confusion around the topic!

My only question now is how should we proceed with this particular change - I'd
handle it in a dedicated patch, preceding this one.

Regards,
Cristian



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60F9CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8+w8HPI4zoiabU0Ug8I34cyFocWr3b2BbhhREOJ+Ec=; b=sQRr6ks2NzDmeWVuWndo5Dcrf9
	nXAymMJEQu197Gu1hp1ies5oY5PY84gssBl8gfk1YqOsy4vcioHmYhOqutJKvPBYYWjW1r+ObJ8H8
	HreSW9pdgdtKL962ySrp85gIGo0Vg4LeiiuxQKFUUqkSocwh1P7w8yblEODdBX4cmCmVtZ2Ng8T9B
	vgfnAq8fdSUskAel75o2Vq2/zFckV3DABv2tSYxI5wxg3qCS+T/KIp3nMbU9mz18BF7am+YdT3ifW
	lui99QGXR8qN8VGr9uuYZSjShu9aHU4NgJGXwkBf5dLhKWVhCcXqAtahepuTIxT/D/uilxiTusr0q
	F23/0RpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwQp-00000006cFS-1Gcr;
	Thu, 23 Oct 2025 14:36:47 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwQn-00000006cBi-0TUq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 14:36:46 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cspWH4sfRz9tfn;
	Thu, 23 Oct 2025 16:36:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761230187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H8+w8HPI4zoiabU0Ug8I34cyFocWr3b2BbhhREOJ+Ec=;
	b=sgG7EPa4c0KBZXvOqwivUfWeEk9tggB5glnDp2Bsrqb/P4QG5I/GAFVe5jnmOFXbTOklTp
	9fha814764QqQW05MFfVnkGqysKq7dtvCHN1cAQHuZAUJhVLNqCccknxtUYVGLmjj3HLki
	BQ6sCXS4ZzuKHyb21FTbCRlaDnp2S3ZgVM2oBbHUsT8JNPP4pwIWfx7QK9N1HDlhTbFIXQ
	qQUaB06ZcmTobUqozaP1m07zlnUhQpCO+0cKKfE6QRHW23tTyGVua39o7zvmMd8sBXAaS4
	uK9D63V93a61R+4gjLb3wGU+dPVsMhxPPSt0vjGvMOJtJnr/0MjWb6nflVppKQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=JNWcDYPf;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <29333a24-be7a-44a4-8f12-d140ced554f0@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761230185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H8+w8HPI4zoiabU0Ug8I34cyFocWr3b2BbhhREOJ+Ec=;
	b=JNWcDYPfSZAxZvZlcMM0fMUIeAnnDE4udrywOD1s9W9Gey2544/Xj3SYVSZ40f7woH5ojp
	1WjgVdzl8qtJ/6GhnFVe3Ph69WQo07BHeGauDCKzlYKZZCtcmCx5wkgK0uJ1xY8x1sNxii
	Gc0a7bN9DX+Zf96inqlnyXGHhFoRKVnfneWMlXf0nSwXZkxSYJ1QuW+mgoxPyGAizxNSx6
	cWa7zMjwXa+tfuWj81MyiQaXeFWQO0ylM/2n3WLbX4faXSUsJH/XyBwMssXofupJGuMSZq
	0LW3utq8vcu6Tl0c8hLidLr1ebBWG6NstHvK1QcvvJd0TljKwEtZNDcItKrthg==
Date: Thu, 23 Oct 2025 16:36:22 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, arm-scmi@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <20251023-able-fervent-tortoise-e7a6df@sudeepholla>
 <066449c8-4bca-41f1-990e-53d7672e3c0a@mailbox.org> <aPo7-oQq6RskSZ96@pluto>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aPo7-oQq6RskSZ96@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: s34zg3rj85rky7fmwo8jweccp6u7rixr
X-MBO-RS-ID: 08ae88a671076ec0b5a
X-Rspamd-Queue-Id: 4cspWH4sfRz9tfn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_073645_291910_06217CB3 
X-CRM114-Status: GOOD (  26.62  )
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

On 10/23/25 4:30 PM, Cristian Marussi wrote:

Hello Cristian,

>>>> +  arm,poll-transport:
>>>> +    type: boolean
>>>> +    description:
>>>> +      An optional property which unconditionally forces polling in all transports.
>>>> +      This is mainly mean to work around uncooperative SCP, which does not generate
>>>> +      completion interrupts.
>>>> +
>>>
>>> Could you please clarify which platform and transport this change pertains to?
>>
>> Renesas X5H with older SCP firmware , accessible via mailbox.
>>
>>> Introducing a property that enforces unconditional polling across all
>>> platforms is not ideal - particularly if this is intended as a workaround
>>> for a platform- or firmware- specific issue. Such implementations often get
>>> replicated across platforms without addressing the root cause, leading to
>>> wider inconsistencies.
>>
>> The root cause is being addressed already, this is meant to keep the older
>> SCP version operable.
>>
> 
> If this is the case, at first I would have tempted to say why not use the SCMI
> Quirk framework (with needed changes/evolutions), BUT then I realized that being
> the Quirk to be applied on the transport there is no way to gather SCMI
> Vendor info and versions from the platform, so you would have to match on the
> compatible, which is essentially similar approach of having a new DT
> prop...just less flexible so I understand the need of your new-prop approach...

Yes, that.

> ...BUT...(maybe a weird idea)...what if we think about enabling:
> 
>   - one Quirk EARLY-ON based on the current potentially affected compatibles

The current compatible string is "arm,scmi" . You would need a custom 
compatible for this early quirk, and this makes it not generic again.

>     with such a quirk forcing polling ONLY for the BASE Protocol SCMI queries
>     so that the SCMI core can gather Vendor Info and versions in any case..
>     (this would need the Quirk frmwk to be evolved to support such
>      'early-quirks' based on compatibles only)
> 
>   - a second regular Quirk, filtered by the just retrieved Vendor INFO and FW
>     version to finally decide if the system needs force-polling to be really
>     enabled for all the following messages...
> 
> ... this was you dint even need to ship any new DT

Maybe this is a bit too complicated and not very generic ?

I also tried to do this using quirks at first, but I couldn't find a way 
which I would like, it was always convoluted and ugly code.

>>> It would be preferable to scope this behavior using the platform’s compatible
>>> string. This approach ensures the workaround is applied only to the affected
>>> platform and prevents it from being inadvertently enabled elsewhere, unless
>>> another platform intentionally uses the same compatible string (which seems
>>> unlikely).
>>
>> This is not platform-specific issue. SCMI provider which fails to generate
>> interrupts can appear on any platform, using either transport, that is why I
>> made the property generic.
>>
> 
> So the deployment scenario would be to update new machines with a fully
> working SCP FW with completion-IRQ while updating ONLY the DTBs with the
> new force-polling property in the older machines with the older
> poll-only SCP fw ? (to understand)

Yes, correct.

-- 
Best regards,
Marek Vasut


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C8AC5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8J8pUe73FcjpALZHtnA0DHlxGQaT0qvtBA/sqVN6KQ=; b=d++7RHVk8QRRseq5UOdcoAdohI
	vlNsGYDCvbyNZ7GXQnw9Wd5Fd0X70qkFSgqBrUWKkLJ0uGBM1B/qjvZj0u99h5tJQ+DKlszjfcnND
	QVXao7efjNLkcj7eCKaS0D41b4pXnbNS9TOTAJyGjCXA+3rA+2z/BwIEuHUILoWO4vsFFbKEct4Yp
	+/EeUCk4Krg5Ydr//+SdYgFTXWaUfKuoZAA/WPrIxlr+YqSWp4x252CrHGSHSADl57ExMwKXgf3xV
	i2CUMZUWtyqao2PT/u5BeIHRS0ulNzia/yJA+7GlOEiAvbK8Zeij9it8eKK9eAnYIB5so1xKXXZx0
	rVhDoH0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1BN-0000000BTPl-28Mj;
	Thu, 20 Aug 2026 11:43:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1BK-0000000BTPE-2MSa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 11:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787226217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E8J8pUe73FcjpALZHtnA0DHlxGQaT0qvtBA/sqVN6KQ=;
	b=DuHQIC7CW7nmvIRG3mkT+YavzhYZvWEGkDTt7pciT5Xkto3WRhwWORvXp+BNNTkm2mnTlY
	eI3lh+WowiY4x92ijdRER7bmi+traeRYZR+BFwG4fDxTlr8aPhRvj55+UcNZm8Mo+r8nB3
	Wajye7JTurcGYRpv/n8NqPpVXURuM6c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-Uc9o9OdIOG-whlnMJWli1A-1; Thu, 20 Aug 2026 07:43:36 -0400
X-MC-Unique: Uc9o9OdIOG-whlnMJWli1A-1
X-Mimecast-MFC-AGG-ID: Uc9o9OdIOG-whlnMJWli1A_1787226214
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48000d75326so1417257f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 04:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787226214; x=1787831014;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8J8pUe73FcjpALZHtnA0DHlxGQaT0qvtBA/sqVN6KQ=;
        b=gp+fn5pQCimc7AtHtzagN1e4zWPVWci0H4isZ21ZTKtCF3LBvhogHfDAG7Nhsk3oSP
         5hIYPjm2eQutd9/b9Zbl/zu7rf9+EDD7wV6JXK+w2WqspzFiYDZrpnVifJa7qCRvWird
         u16PxV7bd6B8x3yW6QOvzMEaqMcwwTtVkbTy3QOSj9udEoycaFmGRtEdg4u71a6tHc9U
         thUaP15JChc8AqMl/beFLlF4QnsEBixqLHuoB897wPgAVqi1D0osCQ9fUMsnCpfc1V6S
         M3P5qzo4JWT+10rx5JfcXRERbTZ+FJ5mnsS95v4ka6bIQAEtSI4tv3Wk2pExuYYHSeHr
         kuYQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNXwIWqDZtr65ncNSZ2iL0AQUStQ1ubtvKafu/QO6Goi4olvGNXEzA21I9uS0nM6BOHurBfMLWjRSVSjNU3OIc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3gN/oTM9q/NhA/QrnKhHD+bv4Y/VQA6n10OS9ocE25hozii+b
	MAwKzny5PSvXB1Ddi+VZTx+/gXiApF61YkqgjhwYCF5ehobjHryyKK2guDJ1Hu7IgH6hrxDM4tZ
	koi/0x5xQNUyHJ0WAM1qqp1pibiXhjofNjnUCEaQw85/a6V5vBTWOo1Z346AjN+oQ09S62RQa08
	+halK+3x7r
X-Gm-Gg: AR+sD10na2AO95KF7x6+OnpBTfLQBXRbI9dInYqdF39aFWxTmyQmqbshfgwZxVGZYoj
	H7akWrHNn7aauOG5ymFGHAtUbftSVoJw43UV+ggdoP7k35XHoYXxtDtjcPLHFQ/+AY5Sau2A5+6
	sQ2S1m/bkvycyrhHcLuP+Fy3SgObTlT/JPjVXlC7TsqV6NUdwkW+CJeXYIqcNVnq0JXteg3sD4V
	SRXHOT70qNDgHC3IRxt5xmssc98HZvDmJhhWB+1czusCSWnIi4hj7exmtyzmNykj9W0YglyHA3Y
	9hiHZG6WydO9aB5udc8sdDMW4iipLJ3FlTt6oHLFHQhZwPCknptwmjpBB8ifcAiWx5Ymo5J4pr3
	K0uYWy9tjACMfcyKV5q80drkyLEjVaCfwfWry4137FfM=
X-Received: by 2002:a05:600c:34d1:b0:499:49f3:77b1 with SMTP id 5b1f17b1804b1-499aa14a6a6mr209174105e9.3.1787226213639;
        Thu, 20 Aug 2026 04:43:33 -0700 (PDT)
X-Received: by 2002:a05:600c:34d1:b0:499:49f3:77b1 with SMTP id 5b1f17b1804b1-499aa14a6a6mr209173095e9.3.1787226213242;
        Thu, 20 Aug 2026 04:43:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1111b2sm186902385e9.5.2026.08.20.04.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 04:43:32 -0700 (PDT)
Message-ID: <2a65b85b-8aaf-4ee8-b797-732cb33fa139@redhat.com>
Date: Thu, 20 Aug 2026 13:43:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] KVM: arm64: vgic-its: Free the caches when GITS_BASER
 changes
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Oliver Upton <oupton@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
 Sascha Bischoff <sascha.bischoff@arm.com>,
 Sebastian Ene <sebastianene@google.com>, Fuad Tabba <tabba@google.com>,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260819102809.310708-1-fuad.tabba@linux.dev>
 <20260819102809.310708-2-fuad.tabba@linux.dev>
 <78d60d96-d0c7-4eaa-b425-ca4f75263b12@redhat.com>
 <871pbtoz7m.wl-maz@kernel.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <871pbtoz7m.wl-maz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7kSWUTsjUTIlKlCsBjwPmd3MkompRx_qRIg3-nmxKkk_1787226214
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_044338_680719_F4AEFA1E 
X-CRM114-Status: GOOD (  31.97  )
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



On 8/20/26 12:36 PM, Marc Zyngier wrote:
> Hi Eric,
> 
> On Thu, 20 Aug 2026 11:09:06 +0100,
> Eric Auger <eauger@redhat.com> wrote:
>>
>> Hi Fuad,
>>
>> On 8/19/26 12:28 PM, Fuad Tabba wrote:
>>> A guest that disables the ITS and re-points or shrinks GITS_BASER<n>
>>> with VALID still set keeps the devices and collections it mapped
>>> against the old table, as KVM frees them only when VALID is cleared.
>>> The table format is not architected, so a write with a different value
>>> is allowed to lose what it describes. Free the list whenever the
>> I don't really get "a write with a different value is allowed to lose
>> what it describes". A write at which place, in the collection table?
> 
> A write to the GITS_BASERn register describing the pointer to the
> collection table.
> 
> The additional clarification is that because the *content* of the
> table is IMPDEF, if you point the ITS to a different location or size
> in memory, then there is no guarantee that the caches (the KVM
> internal data structures) are up to date. In this case, the proposed
> course of action is to invalidate the caches and start afresh.

OK thanks, this definitively clarifies the above sentence.
> 
>>> stored value changes.
>>>
>>> Test for a change rather than a write: its_restore_enable() rewrites
>>> GITS_BASER<n> from its probe-time cache on resume, and KVM reports
>>> GITS_TYPER.HCC as 0, so nothing re-maps the boot CPU's collection
>>> afterwards.
>>>
>>> Fixes: 36d6961c2b481 ("KVM: arm/arm64: vgic-its: Free caches when GITS_BASER Valid bit is cleared")
>>> Suggested-by: Marc Zyngier <maz@kernel.org>
>>> Link: https://lore.kernel.org/all/87ecg9owwa.wl-maz@kernel.org/
>>> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
>>> ---
>>>  arch/arm64/kvm/vgic/vgic-its.c | 9 ++++++---
>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
>>> index f6538b1976f9b..3339d9977af27 100644
>>> --- a/arch/arm64/kvm/vgic/vgic-its.c
>>> +++ b/arch/arm64/kvm/vgic/vgic-its.c
>>> @@ -1649,7 +1649,7 @@ static void vgic_mmio_write_its_baser(struct kvm *kvm,
>>>  				      unsigned long val)
>>>  {
>>>  	const struct vgic_its_abi *abi = vgic_its_get_abi(its);
>>> -	u64 entry_size, table_type;
>>> +	u64 old, entry_size, table_type;
>>>  	u64 reg, *regptr, clearbits = 0;
>>>  
>>>  	/* When GITS_CTLR.Enable is 1, we ignore write accesses. */
>>> @@ -1672,7 +1672,9 @@ static void vgic_mmio_write_its_baser(struct kvm *kvm,
>>>  		return;
>>>  	}
>>>  
>>> -	reg = update_64bit_reg(*regptr, addr & 7, len, val);
>>> +	old = *regptr;
>>> +
>>> +	reg = update_64bit_reg(old, addr & 7, len, val);
>>>  	reg &= ~GITS_BASER_RO_MASK;
>>>  	reg &= ~clearbits;
>>>  
>>> @@ -1682,7 +1684,8 @@ static void vgic_mmio_write_its_baser(struct kvm *kvm,
>>>  
>>>  	*regptr = reg;
>>>  
>>> -	if (!(reg & GITS_BASER_VALID)) {
>>> +	/* The ITS driver rewrites an unchanged GITS_BASER<n> on resume. */
>>> +	if (reg != old) {
>>>  		/* Take the its_lock to prevent a race with a save/restore */
>>>  		mutex_lock(&its->its_lock);
>>>  		switch (table_type) {
>> One question: There is no vgic_its_invalidate_cache() in the function.
>> Is it OK?
> 
> Probably not. We should make sure that the translation cache is gone
> as well so that we retranslate and avoid signalling LPIs that have
> undergone such invalidation. Thanks for spotting this.
> 
>> Besides out of curiosity, why don't we go further and remove ite entries
>> that refer to removed collections in vgic_its_free_collection()?
> 
> The current policy is to keep the LPI alive as long as it is
> mapped. The only thing is that we can't signal it, obviously. But it
> would be legal to drop them altogether, only more work.
OK
> 
> An additional question is whether we should consider doing a reload of
> the collection table or not. I'm not keen on it, but I can also see
> how a guest could want to do this. Feels a bit over the top though.
Agreed.

Thanks

Eric
> 
> Thanks,
> 
> 	M.
> 



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9DEC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 09:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3OSbmtJaxuAXKm9wxovJJHMJ29/ztwYERcUJ/tlgLm4=; b=AD228VOvnIzR0Ggonuc8j0Q7No
	Z4Xr45rlhH0ARgA8GVVoQP1tq0gmJZ5CvnwkQoqVsZliv2l+88ZNR++BrLTuKXsgkfkFTT9qTdv2v
	iZA1KwlMaeKYlfyj6hndxT5qBTwk+3H9z1b1EYzh4FbL9T2lvFyQqY5olrKTSvwhwD6anB/rcK97D
	58NFyhPI3O52y/5NlNSPMe2r5hiNeGIn4ddi+ms7QmAfuQXUeOTX6wCeLAvmF3k19q99i5hzUBJs/
	dwB2xhjBgBxq8GOhWQcmbLeLbPEp/FGolgzcTC/58x2cLs6weUpOvyWPQsh+UqBCvJW97YVpJYYM7
	64Ar2+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtCZ-00000005kzi-3hkd;
	Mon, 17 Aug 2026 09:00:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtCW-00000005kzF-37yP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 09:00:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786957210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3OSbmtJaxuAXKm9wxovJJHMJ29/ztwYERcUJ/tlgLm4=;
	b=Zjql0Si5/4zEBtBrvAfgQxo2UgFEIj5KhVEMGV4jKGDni/NHXz6pAxeYyr0NG2Tnqk1X0o
	KdYtQiwGqgL9h2I7UzUK8PGxo6vKPEXCeG+0qKnkox7FJrSIDTmwIpLgFHZzVh5PgL03fc
	0b0QUw6B7LzKyskSRKAIAReL9CrrNdQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-U-zUxgqdOj-UZFbCwXW1Dw-1; Mon, 17 Aug 2026 05:00:08 -0400
X-MC-Unique: U-zUxgqdOj-UZFbCwXW1Dw-1
X-Mimecast-MFC-AGG-ID: U-zUxgqdOj-UZFbCwXW1Dw_1786957208
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4957287363bso18635785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 02:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957208; x=1787562008;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3OSbmtJaxuAXKm9wxovJJHMJ29/ztwYERcUJ/tlgLm4=;
        b=dJ289HKjkaz7iAHHi+rsbvKnBwebpefkpPlEqgZa6+zeVJgGvY2A/J46MUMvZ1n/Qg
         BWHo7b2GvCjVN0Iy/10vUICQYlJzOzUZe5KFwL6dyJGuFZ/805A2w9NlzJzaB4eptucP
         IFJseKShwnz8+cgfydPY++fqYbRqubOQWr6dFm3Y7l/QIcSUfFo5EXZVXILuObtU+syF
         T1fkxldT4uLZbPHQclilJGgG34ZZ16t5EsYO/6t21L1M1aQaVJgCE1g4gKXyQZPxe4pE
         E0TQ/LGjD2sjxTQZ5x2ucNvvbGiRN1x5Sh67hdD6CYxLctWt/cJp/qg5qh18QTYwuVXm
         Dk1g==
X-Forwarded-Encrypted: i=1; AHgh+Rr4/Vhl9MqZDhkQapmHGJQKrtXgLU+NyJDH4dR5H7YXyFsYKIhMXW/vApxzlnNXRQN1THlqDBuonp3NYZJeSUd0@lists.infradead.org
X-Gm-Message-State: AOJu0YyJwvR74uuEWbqlbdEOQ0XahVd0qjG/qdyLO0wkNqJkaq4lTGFf
	rmQWVVYy4fCFcJ5cCTmlHeY7rNQdzXuJZ9McGT/7WSfmfwAIramDnJ7J8ZywPHO1416//KVrtql
	42QR3t8hWGXb30tu488Znb+fJ3qq1QAdGV7dy3FGVpxikQ0EgttHO3luKIg9+yeGFTmgCLTZMrn
	Zs
X-Gm-Gg: AR+sD11q/WuSkZVj6KP2Y2J0m+GeY2a/gbjWsmRnF7O4X9aqJNNllLiiR4I9XBsUvFx
	HnZNLJGiXCWQb3IVt+hJPVz9O6ZmrB0p+CO5rC+y4Epnn4117+gnwUYPocW0bd+kdbVNYeG8Aj0
	QhaxINZKgHDffVgnTeW0A8X7JuYw1xOrr8IrKq1anj8qNP2cdF9UNhQvjxuVPxJGZHTCIZzzQla
	gvrzWx4ISI5GXsUnTCN9270V8jPNjU9HRzk7EBMqIkZKQcyJt3WbsDF10nr1hTgucuIoCXo+3pf
	bOt3brtcLrKPblesiMbYRBlq279ORupzxvSgs8UTn8+HLpQ6yJHHOM5405/X8mRFRwEIa2Ksoz9
	40YgCwAjRrxVzF7e6wJeLnrLD/+SCMmuZhG6rI2e70rA=
X-Received: by 2002:a05:600c:564a:b0:498:ff3:71ed with SMTP id 5b1f17b1804b1-49987993affmr279071005e9.17.1786957207591;
        Mon, 17 Aug 2026 02:00:07 -0700 (PDT)
X-Received: by 2002:a05:600c:564a:b0:498:ff3:71ed with SMTP id 5b1f17b1804b1-49987993affmr279069755e9.17.1786957206839;
        Mon, 17 Aug 2026 02:00:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a31572sm2267922f8f.5.2026.08.17.02.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 02:00:05 -0700 (PDT)
Message-ID: <cccb848c-a1d7-4c6e-bc79-ce699f92d09a@redhat.com>
Date: Mon, 17 Aug 2026 11:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] KVM: arm64: vgic-its: Don't dereference a NULL
 collection on ITT save
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
 Sascha Bischoff <sascha.bischoff@arm.com>,
 Sebastian Ene <sebastianene@google.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260807104102.2410744-1-fuad.tabba@linux.dev>
 <20260807104102.2410744-2-fuad.tabba@linux.dev>
 <0ce5e496-a067-48fd-80d2-94fe9981d505@redhat.com>
 <CA+EHjTzsCgBbaJQpv1ne-0Xo_3wdwv-R1RWMabdLxiMjMh4peA@mail.gmail.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <CA+EHjTzsCgBbaJQpv1ne-0Xo_3wdwv-R1RWMabdLxiMjMh4peA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PuT1QGrXhcibNMTamEo8cVjAI7wI2ZEQVb7ySGREd8k_1786957208
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_020012_898479_42F9C319 
X-CRM114-Status: GOOD (  30.65  )
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

Hi Fuad,

On 8/15/26 2:18 AM, Fuad Tabba wrote:
> Hi Eric,
> 
> On Fri, 14 Aug 2026 at 14:36, Eric Auger <eauger@redhat.com> wrote:
>>
>> Hi Fuad,
>>
>> On 8/7/26 12:40 PM, Fuad Tabba wrote:
>>> MAPC with V=0 drops ite->collection but leaves the ITE on the device's
>>> ITT list, and vgic_its_save_ite() dereferences it unconditionally. A
>>> guest that issues MAPD, MAPTI and then MAPC(V=0) therefore oopses the
>>> host when the VMM issues KVM_DEV_ARM_ITS_SAVE_TABLES to migrate it.
>> Thank you for fixing this bug!
>>> That sequence is UNPREDICTABLE per the architecture, but KVM already
>>> handles the resulting state in the translate, MOVI and DISCARD paths.
>> Maybe: "its_is_collection_mapped() already checks the collection is non
>> null in translate, movi and discard"
> 
> Agreed, that's more accurate. This went into kvmarm/next on the 8th
> [1], so it's the comment rather than the commit message I can still
> fix.
sorry I did not notice. That's not a big deal either.
> 
> ...
> 
>>> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
>>> index 36ab3e4929154..ed281fbf008b9 100644
>>> --- a/arch/arm64/kvm/vgic/vgic-its.c
>>> +++ b/arch/arm64/kvm/vgic/vgic-its.c
>>> @@ -2119,6 +2119,14 @@ static int vgic_its_save_ite(struct vgic_its *its, struct its_device *dev,
>>>       u32 next_offset;
>>>       u64 val;
>>>
>>> +     /*
>>> +      * MAPC with V=0 keeps the ITEs mapped but drops their collection,
>>> +      * and with it the ICID. Save a zeroed entry, which the restore path
>>> +      * reads back as invalid.
>> in
>>
>> https://lore.kernel.org/all/CA+EHjTymdanCKoQO3ATmUZ=7Ph2wv4ES8SfkSsTgmOYAYBWayQ@mail.gmail.com/
>>
>> you also mentionned this can also happen on clearing
>> GITS_BASER<coll>.Valid clear. So maybe don't specifically focus on MAPC
>> in in the comment.
> 
> Yes, and the BASER case is the one that justifies the check: MAPC(V=0)
> is UNPREDICTABLE, so it could be answered by dropping the ITEs, while
> clearing GITS_BASER<coll>.Valid on a disabled ITS cannot. The comment
> names only the case that doesn't. I'll send a patch on top to reword
> it.
OK
> 
>>
>>
>>> +      */
>>> +     if (!ite->collection)
>>> +             return vgic_its_write_entry_lock(its, gpa, 0ULL, ite);
>> I would rather squash 4/4 here to emphasize we are unlinking that entry
>> from the scan chain.
> 
> 1/4 has Cc: stable and 4/4 isn't a fix, so I kept them apart. 4/4
ok makes sense
> doesn't make the write unnecessary either: an orphaned ITE with no
> valid predecessor is read directly, regardless of the offsets.
indeed

> 
>> Besides I also wonder if we should directly remove those entries from
>> the &device->itt_head on MAPC and GITS_BASER<coll>.Valid reset.
> 
> For MAPC(V=0) I think it works, and it would stop the event slot being
> wedged: an orphaned ITE today can't be DISCARD-ed or remapped with
> MAPTI. But the ITT entry has to be zeroed with it, the way DISCARD
> does, or an earlier save's entry stays in the slot and restore fails
> find_collection() on the destination. Oliver suggested the same on v1
> [2].
> 
> That pairing is what makes me doubt the BASER reset. There we would be
> zeroing every ITE of every mapped device from the GITS_BASER write
> handler, which is an unbounded number of guest memory writes on a
> register access, and unlike MAPC(V=0) that write isn't UNPREDICTABLE
> to begin with.

Yes effectively this would imply to null the associated ITEs... On the
other end, overwriting GITS_BASER<n>  while V already set looks rather
far fetched but well ...

Thanks

Eric
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/178621413198.380376.1272590130654213471.b4-ty@kernel.org/
> [2] https://lore.kernel.org/all/anQQ3dcbk72N1g1a@kernel.org/
> 
>> Thanks
>>
>> Eric>   next_offset = compute_next_eventid_offset(&dev->itt_head, ite);
>>>       val = ((u64)next_offset << KVM_ITS_ITE_NEXT_SHIFT) |
>>>              ((u64)ite->irq->intid << KVM_ITS_ITE_PINTID_SHIFT) |
>>
> 



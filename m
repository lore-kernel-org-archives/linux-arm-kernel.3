Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35B4CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHCH0VCzsWU4m239VlHHtfDVtMJrBZLoOpM6kxyrkrM=; b=GxNcXJjvLeqO6bq6hi+3KthFxE
	PDiNd64W+o6axQ0YmCmZyRQy+fYvxYK7uL2HUnjA7TR0Zy1uFVWf2zYGgAoPl4zf8zhnXQz0OXDJa
	5yFxG5wsliRR2C7CpNVFLWEocB3SzSO+lFHQnBjCNf/Dy2SltVP2NsuEiAXpEMP5P6L0RJ1rl+zDu
	l4yZLE9UbO/Vgf47kaMZti2UChVGEkRrDbDXObY1Ympb5xDQnYDU+jtQ5TlHr0ZpuNCHBtBK04Lzh
	nmhjrOjoaR9xzr7PD28gOhtnblOzsKs7YyNuxsph+geT0bOuWmwbY0JUQWUsPqasrueHGyWpfPtW5
	4jxc2g9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxRm-0000000E6Os-2Rd1;
	Wed, 17 Sep 2025 19:04:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxRk-0000000E6Nk-0chx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758135843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aHCH0VCzsWU4m239VlHHtfDVtMJrBZLoOpM6kxyrkrM=;
	b=GHK1ajhjLGVWVadVIFhJZ7+5tQhrQczoRsozozfdC9m22cEJUrgB/fc9oPtMa0iqowg26+
	8RqkTueGPmowGqnu8iOp0T3SncDZEmP3rf79hQDQQ1kzo3gfXB5gn4cy6CDSzG5l2FvLLp
	hvvKkARcio4blrFTOj9UQtH/b7e9Wp8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-QcD0Qqw3NfSpWH99FJPnNA-1; Wed, 17 Sep 2025 15:04:00 -0400
X-MC-Unique: QcD0Qqw3NfSpWH99FJPnNA-1
X-Mimecast-MFC-AGG-ID: QcD0Qqw3NfSpWH99FJPnNA_1758135839
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3ecb79fe202so26968f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 12:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758135839; x=1758740639;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHCH0VCzsWU4m239VlHHtfDVtMJrBZLoOpM6kxyrkrM=;
        b=CQmkVtBsyCNliJNhgEA8bdYWJhNFEWco7I3CR2+UGHzLUeuSUAyW/cqpQAlpmbmdKy
         oGHUETTFDeEizDsNCIDGld3HPn1dCRo3DEo8dw+/Yia0dtxWUN+/y7kFUTdlcMVw7QC1
         RzsvBoX9FSt7HDvQPkKRLjoFvp9oNfs0iRUP+cYJ5Le8hru0jXhjClzs5BCnd/yQpq5j
         S0R0LacNDp7eL1VeCRCN2U4PNSt1yjO8ZFmhimq6kxETCg5qrc4fJxG8l4V6U7paWc+A
         C8NF9SFg8Vc23zcTBB5sABKu1NXdSnRVsxPbKDLJTafwL/EevlMdubgFvH0GIUnK1NP2
         q/IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaY99U3oRCMEAJC2pagR0nsoa1ea8pVuW57VKlk2/PzyXmZra8d3D4f5Gdb+P0DN2dcqY5+xfC1cyIUf9al6bm@lists.infradead.org
X-Gm-Message-State: AOJu0YzcIspR03RyWZN0/y6Cv5b27EbXqm3I7UbkQmHcmeq0I/Y8kZIb
	FnXtatmrfl0B0dsyH/Z9J2+3U95GiGsFpA7tQZSQjzaDezKK8T2WoDeZIZzhUniXzAmFFfBtgCF
	k3PX6hr8JVp8Il0jkZ4jk5peOSdTdJGxOAlMe2YyTEyDeS5tdY9zKeQo3935/u0latKS4tueeHw
	g6
X-Gm-Gg: ASbGncton5TUnBM8A2scsGQejVYid0MTjcettun6Ytdx8VejLwH0LPA0vAzWecIXarq
	CdSZWkJzuImqv3g2YJqa/IweTnvdSGHlNuakMZtYxXchzwAmAefTZN0Y+tf6wC0AYAlom7ArILo
	FA5A0H590o7iABKJdvW5/xeSLJJlVfRLFTE68WUapmOEC3wSKIAELHIbm2TZpcTWbpYgHKIlfJ3
	18khmpaXTY3Vg6cY66benhQcLp3STmVyjUpV0mFDvEhyy90noMdrhP/eERp/cyms+ufBXOZpjdB
	xx4bevoUm5QxZVIz+2cJYeq0meqAWLaZ0+A06dIx08N7YMEOeMS2LtMNdByEWe+nAVoDU19bybT
	YH4R01fB3dTCyTTUnwbFs1do3pwKc4gqPzVUA2IIZYgsLsWyphhKAPKvrxYbtNSyR
X-Received: by 2002:a05:6000:200c:b0:3ec:d789:b35e with SMTP id ffacd0b85a97d-3ecdf9f3e2bmr2220748f8f.8.1758135838655;
        Wed, 17 Sep 2025 12:03:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHH1jtQqXfA5qQMVLv888l0a3c36h370u+0P0yyGL+jfEOy01vR98KIIIx9Ov3RHgb7jlDtug==
X-Received: by 2002:a05:6000:200c:b0:3ec:d789:b35e with SMTP id ffacd0b85a97d-3ecdf9f3e2bmr2220727f8f.8.1758135838182;
        Wed, 17 Sep 2025 12:03:58 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:6d00:7b96:afc9:83d0:5bd? (p200300d82f276d007b96afc983d005bd.dip0.t-ipconnect.de. [2003:d8:2f27:6d00:7b96:afc9:83d0:5bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee073f3d68sm446010f8f.10.2025.09.17.12.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 12:03:56 -0700 (PDT)
Message-ID: <f8d3c2d4-8399-4169-8527-3c87922f2ef1@redhat.com>
Date: Wed, 17 Sep 2025 21:03:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
To: Thomas Gleixner <tglx@linutronix.de>,
 Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
 <87a52u9jyl.ffs@tglx> <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
 <2bd45749-e483-45ea-9c55-74c5ba15b012@redhat.com> <87v7lh891c.ffs@tglx>
 <95ff36c2-284a-46ba-984b-a3286402ebf8@redhat.com>
 <24d6a51d-f5f8-44d7-94cb-58b71ebf473a@linaro.org>
 <7f4aa4c6-7b77-422b-9f7a-d01530c54bff@redhat.com> <87segk9az5.ffs@tglx>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <87segk9az5.ffs@tglx>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6WCcbzbil74T0aJni6skMYGq8VC78a6b1vPPE_36hsM_1758135839
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_120404_257632_E4F95F50 
X-CRM114-Status: GOOD (  44.45  )
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

> 
>>> this would go to a separate section called .tagged_memory.
> 
> That'd be confusing vs. actual memory tags, no?

Yeah, I came to the conclusion just after an upstream call we just had 
about that topic (bi-weekly MM alignment session).

I'm open for any suggestions that make it more generic. My first 
instinct was "named memory regions".

>   
>> Maybe just "tagged_memory.h" or sth. like that? I'm bad at naming, so I
>> would let others make better suggestions.
> 
> inspect.h :)
> 
> I'm going to use 'inspect' as prefix for the thoughts below, but that's
> obviously subject to s/inspect/$BETTERNAME/g :)
> 
>>> Then anyone can walk through the section and collect the data.
>>>
>>> I am just coming up with ideas here.
>>> Could it be even part of mm.h instead of having a new header perhaps ?
>>> Then we won't need to include one more.
>>
>> I don't really have something against a new include, just not one that
>> sounded like a very specific subsystem, not something more generic.
> 
> Right. We really don't want to have five different mechanisms for five
> infrastructures which all allow to inspect kernel memory (life or
> dead) in one way or the other. The difference between them is mostly:
> 
>     - Which subset of the information they expose for inspection
> 
>     - The actual exposure mechanism: crash dump, firmware storage,
>       run-time snapshots in a filesystem, ....
> 
> Having one shared core infrastructure to expose data to those mechanisms
> makes everyones life simpler.
> 
> That obviously needs to collect the superset of data, but that's just a
> bit more memory consumed. That's arguably significantly smaller than
> supporting a zoo of mechanisms to register data for different
> infrastructures.
> 
> I'm quite sure that at least a substantial amount of the required
> information can be collected at compile time in special section
> tables. The rest can be collected in runtime tables, which have the same
> format as the compile time section tables to avoid separate parsers.
> 
> Let me just float some ideas here, how that might look like. It might be
> completely inpractical, but then it might be at least fodder for
> thoughts.

Thanks a bunch for writing all that down!

> 
> As this is specific for the compiled kernel version you can define an
> extensible struct format for the table.
> 
> struct inspect_entry {
> 	unsigned long	properties;
>          unsigned int	type;
>          unsigned int	id;
>          const char	name[$MAX_NAME_LEN];
> 	unsigned long	address;
>          unsigned long	length;
>          ....
> };
> 
> @type
>         refers either to a table with type information, which describes
>         the struct in some way or just generate a detached compile time
>         description.
> 
> @id
>         a unique id created at compile time or via registration at
>         runtime. Might not be required

We discussed that maybe one would want some kind of a "class" 
description. For example we might have to register one pgdat area per 
node. Giving each one a unique name might be impractical / unreasonable.

Still, someone would want to select / filter out all entries of the same 
"class".

Just a thought.

> 
> @name:
>         Name of the memory region. That might go into a separate table
>         which is referenced by @id, but that's up for debate.

Jup.

> 
> @address:
> @length:
>         obvious :)
> 
> ...
>          Whatever a particular consumer might require
> 
> @properties:
> 
>          A "bitfield", which allows to mark this entry as (in)valid for a
>          particular consumer.
> 
>          That obviously requires to modify these properties when the
>          requirements of a consumer change, new consumers arrive or new
>          producers are added, but I think it's easier to do that at the
>          producer side than maintaining filters on all consumer ends
>          forever.

Question would be if that is not up to a consumer to decide ("allowlist" 
/ filter) by class or id, stored elsewhere.

> 
> Though I might be wrong as usual. IOW this needs some thoughts. :)
> 
> The interesting engineering challenge with such a scheme is to come up
> with a annotation mechanism which is extensible.
> 
>       Runtime is trivial as it just needs to fill in the new field in the
>       datastructure and all other runtime users have that zero
>       initialized automatically, if you get the mechanism correct in the
>       first place. Think in templates :)
> 
>       Compile time is a bit more effort, but that should be solvable with
>       key/value pairs.
> 
>       Don't even waste a thought about creating the final tables and
>       sections in macro magic. All the annotation macros have to do is to
>       emit the pairs in a structured way into discardable sections.
> 
>       Those section are then converted in post processing into the actual
>       section table formats and added to the kernel image. Not a
>       spectacular new concept. The kernel build does this already today.
> 
>       Just keep the compile time annotation macro magic simple and
>       stupid. It can waste 10k per entry at compile time and then let
>       postprocessing worry about downsizing and consolidation. Nothing to
>       see here :)

Sounds interesting!

-- 
Cheers

David / dhildenb



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E04D65C7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 17:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmH64XmJ0F0IHGr/hDAMtzC5HIceqcOPcSCpGBeY+GU=; b=sMbPZMh+fMN3lAqN6R3qOUei5l
	Hsl6nIoo6NLtCxfcj6Sgm3ZgNDTVVRUMjj/ZtdROczJ+TAZtT6772j65jA2S8oV4ThUjQsMM6wFry
	CR0Hwqbe4E1MBWmMBkUOy4lX/qSnQW7AHFiOmcRofMjCFNYggb4wWBezItAfUnKXCwRlHS6t16Aqw
	RFGMJadbIqu+icBSg/IxLI3w0AArJyo781WMRm00edk26/ON03mggC1E3x+GvoCd/YXEJUCo4l/GL
	D8EKiBwBuV33eJw/NQTHB7DgoY37tFSq5BPdaJ4KoF6Xf7B+hFnXbq4W6EktbczsLWR+xpDsKPmPK
	GDhig+oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVvBV-00000007AmE-0El7;
	Wed, 17 Dec 2025 17:19:33 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVvBT-00000007Als-0QKC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 17:19:32 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-43102ac1da8so2054384f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 09:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765991968; x=1766596768; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fmH64XmJ0F0IHGr/hDAMtzC5HIceqcOPcSCpGBeY+GU=;
        b=TIiq6PcbZPQo/4bRDbqw6LwsFcWnl/l6nD/AGSy6nPJjVyWkp7TnsgYMUBdx9TUqP8
         YrxK0SDr9OMLP1bYHIm7+YChP38OuNfZV++Axddwp1WtL9vkd4jnSI6KDgxK6XADsEJb
         g3pAlQ7Qm9Nb24A8nWIQ6g/ZBjCCCUF6GZGXnAR6zGM02x0cca3jgPyZuCCZue1aY0WJ
         fSa8yM7oxMaeiBnQENUpQ/jUU+zrFw4RsDXnnL7lhuRTkkytoqtbDwSQG8FxXX/2zvtZ
         RTld4PMq75wW1Y8kgGWppTIcVoVd/plWhQ2CACElKQfX4d7jG8psLemrtoBcY4tvxsXa
         DFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765991968; x=1766596768;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fmH64XmJ0F0IHGr/hDAMtzC5HIceqcOPcSCpGBeY+GU=;
        b=UI1z8DH3KN97L0yVY/HI6i2k4lMlH8tOJO2xwDmZbrwxECWFJhFBJdnn6G905IXnCD
         BQW/mr64XnjhNFllf1fo/fzSVR4Lld5fCirT+C8aRnfp/6rmC8aff8n9QbpT1I0H4bCh
         D+hfODXB6ny5LtpR37zQHvKYkNlRXaIWu+C2S0yLMxi9zuE36XPbzljehTaK2/yd4e6/
         HVsOpzksGEVN5j9IaRYsTJLQasYMwvM9pfP9KA0gAxDHIV8WuO/Fk1kJkOPHNEfb0f8s
         9hGNgATvAqqEGrkxwjf2sh194PMv6IcCqYn0Z6xQnmZU/a7FAT/0Ff1MZH/+SOS16mU2
         tMdw==
X-Forwarded-Encrypted: i=1; AJvYcCU2QGp+Tjq2ouT9X4tVQftPJEMxc0WXTA/gjvm7Zo9vNbBgbU4bF7Kzr+eVizBc7Q7pURkIJHP9P+F1oAr/DpRp@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3IQht6fLQn0QCTG1LI/7WDDZZKBv1dFI4IR1j/rakkpaAV/Us
	+oJRdRas4TH1LbRVLzyUQbDHwyPwpWxPLp+fNqBTm2Gu04sHdUy+GN03EiFUegFi75bfoocUDiK
	RxsEoxzCPPKNahQ==
X-Google-Smtp-Source: AGHT+IHT10heBTKc0la75zjUcdcWeKQLxIjteE6wN3WG7RYWYRpvl3lG55/6zSe2LENPLJF5rOBhHUOFskHNYw==
X-Received: from wrbfo17.prod.google.com ([2002:a05:6000:2911:b0:430:fdbe:cc61])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2404:b0:431:864:d492 with SMTP id ffacd0b85a97d-4310864d73emr6566925f8f.36.1765991967910;
 Wed, 17 Dec 2025 09:19:27 -0800 (PST)
Date: Wed, 17 Dec 2025 17:19:27 +0000
In-Reply-To: <d5354d96-6f28-41d7-9f66-64c254d9477b@suse.cz>
Mime-Version: 1.0
References: <20251212161832.2067134-1-yeoreum.yun@arm.com> <916c17ba-22b1-456e-a184-cb3f60249af7@arm.com>
 <aUGOPd7gNRf1xHEc@e129823.arm.com> <100cc8da-b826-4fc2-a624-746bf6fb049d@arm.com>
 <aUKKZR0u22KOPfd7@e129823.arm.com> <d96ac977-222e-4e8d-9487-da1306198419@arm.com>
 <aUKnfU/3FREY13g1@e129823.arm.com> <d912480a-5229-4efe-9336-b31acded30f5@suse.cz>
 <DF0J58HOVLL4.2E16Q87D2UXRW@google.com> <d5354d96-6f28-41d7-9f66-64c254d9477b@suse.cz>
X-Mailer: aerc 0.21.0
Message-ID: <DF0NWLWKRKYI.3PLY78UGGG2PD@google.com>
Subject: Re: [PATCH 0/2] introduce pagetable_alloc_nolock()
From: Brendan Jackman <jackmanb@google.com>
To: Vlastimil Babka <vbabka@suse.cz>, Brendan Jackman <jackmanb@google.com>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Ryan Roberts <ryan.roberts@arm.com>
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, 
	<lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>, <rppt@kernel.org>, 
	<surenb@google.com>, <mhocko@suse.com>, <ast@kernel.org>, 
	<daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>, 
	<eddyz87@gmail.com>, <song@kernel.org>, <yonghong.song@linux.dev>, 
	<john.fastabend@gmail.com>, <kpsingh@kernel.org>, <sdf@fomichev.me>, 
	<haoluo@google.com>, <jolsa@kernel.org>, <hannes@cmpxchg.org>, 
	<ziy@nvidia.com>, <bigeasy@linutronix.de>, <clrkwllms@kernel.org>, 
	<rostedt@goodmis.org>, <catalin.marinas@arm.com>, <will@kernel.org>, 
	<kevin.brodsky@arm.com>, <dev.jain@arm.com>, <yang@os.amperecomputing.com>, 
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>, 
	<linux-rt-devel@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_091931_157005_3085C704 
X-CRM114-Status: GOOD (  15.53  )
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

>> From 4c6b4d4cb08aee9559d02a348b9ecf799142c96f Mon Sep 17 00:00:00 2001
>> From: Brendan Jackman <jackmanb@google.com>
>> Date: Wed, 17 Dec 2025 13:26:28 +0000
>> Subject: [PATCH] mm: clarify GFP_ATOMIC/GFP_NOWAIT doc-comment
>> 
>> The current description of contexts where it's invalid to make
>> GFP_ATOMIC and GFP_NOWAIT calls is rather vague.
>> 
>> Replace this with a direct description of the actual contexts of concern
>> and refer to the RT docs where this is explained more discursively.
>> 
>> While rejigging this prose, also move the documentation of GFP_NOWAIT to
>> the GFP_NOWAIT section.
>
> There doesn't seem to be any move?

This is referring to [0] and [1].

>> diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
>> index 3de43b12209ee..07a378542caf2 100644
>> --- a/include/linux/gfp_types.h
>> +++ b/include/linux/gfp_types.h
>> @@ -309,8 +309,10 @@ enum {
>>   *
>>   * %GFP_ATOMIC users can not sleep and need the allocation to succeed. A lower
>>   * watermark is applied to allow access to "atomic reserves".
>> - * The current implementation doesn't support NMI and few other strict
>> - * non-preemptive contexts (e.g. raw_spin_lock). The same applies to %GFP_NOWAIT.
[0]                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^
>> + * The current implementation doesn't support NMI, nor contexts that disable
>> + * preemption under PREEMPT_RT. This includes raw_spin_lock() and plain
>> + * preempt_disable() - see Documentation/core-api/real-time/differences.rst for
>> + * more info.
>
> Can we reference the "Memory allocation" section directly?

Yeah good point. I will send this as a standalone [PATCH] mail tomorrow.

>>   *
>>   * %GFP_KERNEL is typical for kernel-internal allocations. The caller requires
>>   * %ZONE_NORMAL or a lower zone for direct access but can direct reclaim.
>> @@ -321,6 +323,7 @@ enum {
>>   * %GFP_NOWAIT is for kernel allocations that should not stall for direct
>>   * reclaim, start physical IO or use any filesystem callback.  It is very
>>   * likely to fail to allocate memory, even for very small allocations.
>> + * The same restrictions on calling contexts apply as for %GFP_ATOMIC.
[1]     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EE6D0E6EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 14:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOE4pVZbQk3NRzTWk4bK9iK9S5Rl6Cg6Yr2VD/4CLLg=; b=R0oh49t1N1MdpcLGtxmAT7w6oe
	C+jcsOcnA6mHIVRYgtNxF6lklY8LaBBtX21RJGhqYVWRlGQP4TKe6TbNhuPbu7YVBDrJkRyZBuzC8
	i84Il8i0wB3Rx1p7B9Jck6VGvYhBSLClhn1kFyF4c6T0nSDsKWc6i/b6XdAfg39Z9v4Qz16B3fyor
	sPD8wcnWQZnXmBUdOMfnaRZK8UYqJzs4x6+lfkIWhZOrv0nLlLO1TRFbm75WzCrxj5HPSXF2GRkki
	WhOd/UsEBrGOiAq5d9jv6zoWdnubqJ3JQ+MDd9+5Bm49FhxoxrSTj+MW1puSdOThpCwn7k0T40tG6
	azUqjOVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtnt-0000000DPRT-0aew;
	Tue, 25 Nov 2025 14:14:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtno-0000000DPQU-30Nh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 14:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764080034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wOE4pVZbQk3NRzTWk4bK9iK9S5Rl6Cg6Yr2VD/4CLLg=;
	b=T6F+SxOU9jXJyHqGqUaTS7RxEffwLSxS7ORIHjYPeEzjchlFyIZ8oQ1Qsg/Dwp5T7KLCcV
	586Kgzn9kg+gPk2pUOq3DMzdX7PVCQ95Pnrl6y4XfTeoAv6/FzTrFcBbeuQrFiHn895bUt
	4+7qSNVSgxJGD7xu1tewTO6oG7B/q4g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-E3UUBB-kNx2i_PkhmH7txQ-1; Tue, 25 Nov 2025 09:13:52 -0500
X-MC-Unique: E3UUBB-kNx2i_PkhmH7txQ-1
X-Mimecast-MFC-AGG-ID: E3UUBB-kNx2i_PkhmH7txQ_1764080031
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4775f51ce36so52621405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 06:13:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764080031; x=1764684831;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOE4pVZbQk3NRzTWk4bK9iK9S5Rl6Cg6Yr2VD/4CLLg=;
        b=pSrgbaoGQO/xnkITWYjzNafxMj/nCa0koZVgqTtxEVwDYYsICPzT/l8dZxtUCvQbon
         rziwoSUmwYuMaioWugxGnFq7kPCbLgQSfTufQJzxQWYV2kwXOQ6f/HmeSdwGEK9Bt/lf
         2nuPckDxH0yvJyrNJ4woXliDt/LnnipGyrjsRH2fyrzYl541mt2D/835zRSOQhtcfg04
         /jo9ts3tZGtgQZaw2aOYzFPQBYFif6pDapjBXn8dvw2sSWTqSF53aRYHR9fU2X7rVNan
         51CjKjURisvWrsAZIsL9Mf+jEzV6zi7/JBDluf0ECLOtpkXOW+zHutf8fFK3KFSb0Umv
         qr7w==
X-Forwarded-Encrypted: i=1; AJvYcCUHd6nq+crXgsYJf1eGFhaotEycjJbu/s4FyIoUxltZ7j/eBSqI1yNHwa9wStsWjdSyNgnCqD/x0fJVEWZ51Vj4@lists.infradead.org
X-Gm-Message-State: AOJu0YyzneNrJBB/ioBAp/PMPNsNOvjIKezd+v3OJ58IWsANFKCBxlFy
	97Mkpf/F0u4ompDbwVJDDgCf+pgaVSw7IcJlktAT0qhdIa4AZR2LTnxX1Ad1yjC6x3/zr+xTD7P
	WZOA/+DqixO7ViuB72+QUo4LdWDtgSaVdx0DImIzMUY27GxgGlCt7fxe+a83CA23kpK0m8haBS/
	aS
X-Gm-Gg: ASbGncvV16MRnIpRIiohloKEpn9cFQId7TiSaQ+dkueR1l78ybA7BPPRU+lcbGAIIbR
	PdXntwXs6+wxcWBfgxj/SEfPlD00fKZWgKyDNl4C3NK9JwUFLw2OVAiLVt4+GJe0snYrlwAVNzO
	tgTamhcmWItnecp7MB+2t/akQxSX12xsE+MFGRlgWy+vh4TQc8baba88ksj7OXeMz5MUgL8VqO0
	tN05cOe87rR8enBBl7B6Au3niOBAwEBSxTH4YaPTLvITJB0y5y6kSLhXGlMIkmTieeNzNLNd5Em
	8o2sC/xgcKU6ZLMNmLgmRCUjFPczYzXrnxFvuj/Y8tz0CoryN9ySTRQ+gXSELHydFwZin+nrUUh
	4tsQO8ssJ1spe1K/5o5roVFbS/ogKa3rMV3x+Rv3nN1PTnhOWTmTKpvTI
X-Received: by 2002:a05:600c:3111:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-477c10deffamr169342245e9.12.1764080030986;
        Tue, 25 Nov 2025 06:13:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtA8JzDWqwpv+zLW5Ygo6VxUlFOBnDYO5W2Qk6szEUT54U+0BafPLKh5CrRqs4rY7IKqQsQw==
X-Received: by 2002:a05:600c:3111:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-477c10deffamr169341405e9.12.1764080030289;
        Tue, 25 Nov 2025 06:13:50 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf1e86b3sm306305045e9.6.2025.11.25.06.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 06:13:49 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, rcu@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 "David S. Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [RFC PATCH v7 30/31] x86/mm, mm/vmalloc: Defer kernel TLB flush
 IPIs under CONFIG_COALESCE_TLBI=y
In-Reply-To: <2837ea3e-c0b8-46b0-b8da-bf06906d124d@intel.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
 <20251114151428.1064524-10-vschneid@redhat.com>
 <bad9eaaa-561a-498a-90d1-fe3a3ab8ba37@intel.com>
 <xhsmh5xb3thh6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <2837ea3e-c0b8-46b0-b8da-bf06906d124d@intel.com>
Date: Tue, 25 Nov 2025 15:13:47 +0100
Message-ID: <xhsmh3462td2c.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GY-QytLC4azw4XCPdcf1P9ThCaIdrJa-rMx8aDCJBIQ_1764080031
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_061356_825547_6DB036C8 
X-CRM114-Status: GOOD (  28.69  )
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

On 21/11/25 09:50, Dave Hansen wrote:
> On 11/21/25 09:37, Valentin Schneider wrote:
>> On 19/11/25 10:31, Dave Hansen wrote:
>>> On 11/14/25 07:14, Valentin Schneider wrote:
>>>> +static bool flush_tlb_kernel_cond(int cpu, void *info)
>>>> +{
>>>> +	return housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE) ||
>>>> +	       per_cpu(kernel_cr3_loaded, cpu);
>>>> +}
>>>
>>> Is it OK that 'kernel_cr3_loaded' can be be stale? Since it's not part
>>> of the instruction that actually sets CR3, there's a window between when
>>> 'kernel_cr3_loaded' is set (or cleared) and CR3 is actually written.
>>>
>>> Is that OK?
>>>
>>> It seems like it could lead to both unnecessary IPIs being sent and for
>>> IPIs to be missed.
>>>
>>
>> So the pattern is
>>
>>   SWITCH_TO_KERNEL_CR3
>>   FLUSH
>>   KERNEL_CR3_LOADED := 1
>>
>>   KERNEL_CR3_LOADED := 0
>>   SWITCH_TO_USER_CR3
>>
>>
>> The 0 -> 1 transition has a window between the unconditional flush and the
>> write to 1 where a remote flush IPI may be omitted. Given that the write is
>> immediately following the unconditional flush, that would really be just
>> two flushes racing with each other,
>
> Let me fix that for you. When you wrote "a remote flush IPI may be
> omitted" you meant to write: "there's a bug." ;)
>

Something like that :-)

> In the end, KERNEL_CR3_LOADED==0 means, "you don't need to send this CPU
> flushing IPIs because it will flush the TLB itself before touching
> memory that needs a flush".
>
>    SWITCH_TO_KERNEL_CR3
>    FLUSH
>    // On kernel CR3, *AND* not getting IPIs
>    KERNEL_CR3_LOADED := 1
>
>> but I could punt the kernel_cr3_loaded
>> write above the unconditional flush.
>
> Yes, that would eliminate the window, as long as the memory ordering is
> right. You not only need to have the KERNEL_CR3_LOADED:=1 CPU set that
> variable, you need to ensure that it has seen the page table update.
>

I assumed the page table update would be a self-synchronizing operation,
but that betrays how little I know about x86; /me goes back to reading

>> The 1 -> 0 transition is less problematic, worst case a remote flush races
>> with the CPU returning to userspace and it'll get interrupted back to
>> kernelspace.
>
> It's also not just "returning to userspace". It could well be *in*
> userspace by the point the IPI shows up. It's not the end of the world,
> and the window isn't infinitely long. But there certainly is still a
> possibility of getting spurious interrupts for the precious NOHZ_FULL
> task while it's in userspace.

IME it's okay if the application is just starting as it needs to do some
initialization anyway (mlockall & friends), i.e. it's not executing actual
useful payload from the get go.

If it's resuming from an interference, well we'd be making things worse.

I'm thinking the worst case is if this becomes a repeating pattern, but
then that means even without those deferral hacks the isolated CPUs would
be bombarded by IPIs in the first place.



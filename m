Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B468D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 09:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXmkpglOgTRlWY6ZkKkXvIK9PamZymsXtf90xHcK+6o=; b=YYRsxXqXlCnDjnQeR8xBVSW1E7
	Ofg3rzavQRQ0MNk/F+NStC3rURAbo/P+Hhi8d5Fhm1kXafMqrEwDZWqkZ2cIW9U/xfpNdPPUqcwy2
	h80Y6Kg0pziz0HMS0MvFcSpDG1728nBKVeplcnJa/lQ3qr5Z8BgGZDFyOweW8NJhM3vfHVA4HNbyx
	cOJSMZmjndVNjd+ave8njd2pDjNf2qheSuKi5Gnamc67J3FsxjJd/QMmCJvYKsVRbGXxubrd21bNJ
	BnnkHTtJ6SRH4NuTj1VuS8wZsxlDVb4wGrovuY00IvR6n81DloDoUfQEgVGvt68P4tsmhIPQGtAr1
	61NFf3DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5Ii-00000003PH4-3rjy;
	Mon, 15 Dec 2025 09:55:32 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5If-00000003PGb-2dpn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 09:55:31 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-430fd96b2f5so511455f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 01:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765792527; x=1766397327; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eXmkpglOgTRlWY6ZkKkXvIK9PamZymsXtf90xHcK+6o=;
        b=OHbmmnot76353JJfVBO1tp9hcpviG4PyQseHQFK9EKP93IheQkV8uigBxQkxUu+3/3
         BetCp/gCk0vi9gExfBtEvzNeXXDDz2jaU8Xeth+zXQo4YhSsJb/B87aFwuBmjpf2vaPY
         rjEmZbwzmwlNmDkvafocTuLrcj62e2k2m4CbQXibHdYFXZcWImkjPBllLwD1HH58LwqA
         7NDObVaDAsAhEZXxI41e2Zr0EhEDcsrnHuG2AM/xBLAUzOEmJ9H84eOMr3fEeH8tLYce
         896tb9suK2YH6e/rjRm38KxDS1u7Ume1jpEfN1RB8nfwyEqIcVWGVDT0nTqd3+4tv4wA
         I+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765792527; x=1766397327;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eXmkpglOgTRlWY6ZkKkXvIK9PamZymsXtf90xHcK+6o=;
        b=VYdLRygKvPvUM99rlM/Cn98U3t8J0eP3u6/wf9JlRIGhbqUBIt07lghHP0LnSrR416
         XH36dHRa5pQ7lWOvkUw8ue/tAHCBQZNg09XhWnnR0XZ2AbZZzeZ41+XuDDM0trMUh3Kw
         PammWuDFpo6jt+7DjOGETZ2xwmRSI3A9RiOuNgWgaQsKST9OTKwkq79MOYbBowZ3V/rB
         PsYL63HPU6ONmvozvbMyQs0625+tpSoorGtHsVsmI7hXanvaIY6fAB6FfeqPOjoUe8Un
         B3o/gsE7SM74NbGAsRaEJnZ9zHcPfQ5sU8nk1cWBIqdVwg8mOWwlz745Lp4ztjw3eYDD
         j3zA==
X-Forwarded-Encrypted: i=1; AJvYcCXrvzwY/fNcnEoksuqyvslDvfZQyB81UavyIugeI2gR+bCmlzPrBl7/ZEUKGnPpHnjbNoi0watQn9bHigmnz9Qd@lists.infradead.org
X-Gm-Message-State: AOJu0YxPmf5/u5ffAg9rtMcB2rxcrC+YGVOLTFpquEqu9jaP4bO4oCJi
	r+ljs5CNdX/HqV0jc38VntQ/mJ1Y+nQvCbAh+x+PMkLojZ3gW6DdAkjAIGUY+/ctonyXh20HOnX
	/AU6fyx8bWUJfTw==
X-Google-Smtp-Source: AGHT+IGJNUQ3yCE5dAMJ9tGmUAnyfo5RpFowfQkzScccNTMlw3Eak2tuYu3AGem3xCXRYZD9qM+KN+pYSar9uQ==
X-Received: from wrp13.prod.google.com ([2002:a05:6000:41ed:b0:430:fcc8:d29e])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40df:b0:430:f68f:ee97 with SMTP id ffacd0b85a97d-430f68ff1b5mr5631418f8f.40.1765792526655;
 Mon, 15 Dec 2025 01:55:26 -0800 (PST)
Date: Mon, 15 Dec 2025 09:55:26 +0000
In-Reply-To: <aT/WOAr4osoJWaMS@e129823.arm.com>
Mime-Version: 1.0
References: <20251212161832.2067134-1-yeoreum.yun@arm.com> <20251212161832.2067134-3-yeoreum.yun@arm.com>
 <CA+i-1C2e7QNTy5u=HF7tLsLXLq4xYbMTCbNjWGAxHz4uwgR05g@mail.gmail.com>
 <aT5/y3cSGIzi2K+m@e129823.arm.com> <DEYOI8H2OESD.1H56D3H8HKILB@google.com> <aT/WOAr4osoJWaMS@e129823.arm.com>
X-Mailer: aerc 0.21.0
Message-ID: <DEYP7JSVTB9D.3EFN2KEHH3O79@google.com>
Subject: Re: [PATCH 2/2] arm64: mmu: use pagetable_alloc_nolock() while stop_machine()
From: Brendan Jackman <jackmanb@google.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>, Brendan Jackman <jackmanb@google.com>
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, 
	<lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>, <vbabka@suse.cz>, 
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>, <ast@kernel.org>, 
	<daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>, 
	<eddyz87@gmail.com>, <song@kernel.org>, <yonghong.song@linux.dev>, 
	<john.fastabend@gmail.com>, <kpsingh@kernel.org>, <sdf@fomichev.me>, 
	<haoluo@google.com>, <jolsa@kernel.org>, <hannes@cmpxchg.org>, 
	<ziy@nvidia.com>, <bigeasy@linutronix.de>, <clrkwllms@kernel.org>, 
	<rostedt@goodmis.org>, <catalin.marinas@arm.com>, <will@kernel.org>, 
	<ryan.roberts@arm.com>, <kevin.brodsky@arm.com>, <dev.jain@arm.com>, 
	<yang@os.amperecomputing.com>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>, 
	<linux-rt-devel@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_015530_546671_58ED99D5 
X-CRM114-Status: GOOD (  22.81  )
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

On Mon Dec 15, 2025 at 9:34 AM UTC, Yeoreum Yun wrote:
> Hi Brendan,
>> On Sun Dec 14, 2025 at 9:13 AM UTC, Yeoreum Yun wrote:
>> >> I don't have the context on what this code is doing so take this with
>> >> a grain of salt, but...
>> >>
>> >> The point of the _nolock alloc is to give the allocator an excuse to
>> >> fail. Panicking on that failure doesn't seem like a great idea to me?
>> >
>> > I thought first whether it changes to "static" memory area to handle
>> > this in PREEMPT_RT.
>> > But since this function is called while smp_cpus_done().
>> > So, I think it's fine since there wouldn't be a contention for
>> > memory allocation in this phase.
>>
>> Then shouldn't it use _nolock unconditionally?
>
> As you pointed out, I think it should be fine even in the !PREEMPT_RT case.
> However, in case I missed something or if my understanding is incorrect,
> I applied it only to the PREEMPT_RT case for now.

Hmm, I don't think "this code might be broken so let's cage it behind a
conditional" is a good strategy.

1. It bloats the codebase.

2. It's confusing to readers, now you have to try an understand why this
   conditional is here, which is a doomed effort. This could be
   mitigated with comments but, see point 1.

3. It expands the testing matrix. So now we have code that we aren't
   really sure is correct, AND it gets less test coverage.

Overall I am feeling a bit uncomfortable about this use of _nolock, but
I am also feeling pretty ignorant about PREEMPT_RT and also about this
arm64 code, so I am hesitant to suggest alternatives, I hope someone
else can offer some input here...


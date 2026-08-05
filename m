Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F6BC56201
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 11:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1aFJjHBLKOsulK9V02wzpUBZ/ZdGfqsLkqV9m5vRjA=; b=Tl97gGc4Rca44NyC4sofQNOCCY
	7fBV06ICjeuzxVPMsrsicCc6Sg6C5ydo775KkytJlMiBN2E3ea3Do0XfgyWg4IruEPfF0PHY38281
	eIk22vdxlTL/hl6HXb3orfINp813TORX4mxtDTr/SqOXXiFHI45imtu9kAFg9jkhNXCv2Mt7gFDVQ
	5pDHziTi8baXGCufjn8RPZvTVqT00eJUnXtFDgwo32cGD7u4Ga9ysyiE87MCv6ebtPISGK9rb1wFS
	4ew4lHHwqQhOgxFovIIe2uQ4oRdFSa+8qAyTMYnRJ3829LXdaeliiku616f/eG8MpkaNHjAoAHIE4
	myj+b8ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZWK-00000003nCj-2dix;
	Wed, 05 Aug 2026 11:10:48 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZWG-00000003nC3-2mcW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 11:10:46 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so535425f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 04:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785928242; x=1786533042; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l1aFJjHBLKOsulK9V02wzpUBZ/ZdGfqsLkqV9m5vRjA=;
        b=DGWTtutV92jh16HDNTSJjLYP8ILnRdUzMkYiTqKhffz/AU+Pbm4UhSWsH1l71VdJdy
         irGriHbcQodHuhNJDOGUwn7dEvaVLQJFuNTkWepQSuL0qzEUM3M8HxNqfYMjO4pc/1Xm
         VG0D1TxlOmarxZG296GQCDtPMHgwzflFV18Gv99mQUj65TfYmT9m2Sr04JW5pNInc2Gq
         a6ojLcgpUvq8+kh38jH9OVmj3FZ/ii4vRxnWt8LHXJOvqWa4IKMMCu6x6S1Ywl904cpR
         D8c1jhaY531XDciySL+i7O7mqK9cUiznW8i3+0muGfo7bPeAKte8Pc65zdxNwh7t5nt9
         OUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785928242; x=1786533042;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1aFJjHBLKOsulK9V02wzpUBZ/ZdGfqsLkqV9m5vRjA=;
        b=pJeKf56OPkSffdEk+POf5UTzks8aePSl2yWBmIEeLpDID8z8NhhblirGDUbov5OUi7
         f+sq+gxQar6JDdLeegM5xvUoIMt3F1meWCr/tmfhTfengZvwX9LGrhiIbslWw+MZkIFx
         UEJTR0aY4dPZqfa4/cSHGoBL0cAiQovHKRKFYk94hu3vopNYlNBIzDhCPhFOrXc/kFpG
         xUNHQwqTmCHxSIXtxlOwtJKTXVj1t5vkXkZwXXH6zzws0oRKxglY3f4KRrK5bhPzy801
         VYfkLkLuLoYnLBsVO1batCrlsIYAL7WaXrY9Yj8efVQxugWDbJ03/xXrZEdvAC3Vw8bi
         nXIw==
X-Forwarded-Encrypted: i=1; AHgh+RrqWzvE2bTVgkEkUaI202357tHyO+0CuHru7iadHqwjgXVwTKEm64GAxuZc/c6xaeneEz7RLdjehjdrGwMdvd6d@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbr/d2AG5VjabFzhQnuITKGwEiHEqD8EkYOe6XCFt/vuQExGyF
	8plj3pkCQaSvrNvrZ0HHYIeMTdoWT2/iiseiZIhuJR9uoYoAvDL3nrbP
X-Gm-Gg: AR+sD12Yadl6ulmrQ5NAFVEPXq8GOKjEq5/UQZenJkZj2HiXgkldACEZp3r2b3CvSZ6
	U+FnKYWPJwcA2Jdln+QL9e5lAjbsyF9eX1OFrCTfkKFzQzfRLxQ1G0dtfUNr5QrYovZFLyOOxRZ
	lzXEXSM94I+ekLG0Gku6u4lB2HnO6IcsOIOl2geKqWl5QQ3/TxLS/5lp/kKo3syarIOpee55h3s
	efrkXiBbImoP62hBkH09nczP9w4i1mSigdWDa0hgAaF8YrPrXnMPMTOp2EEsCMGuEaHSBAeZi9+
	S0lqkgb5CCgl1mNYQ6JCCqEEXudKAOdWu4Z5rNTIqRTFVEZr7DRGOnOyPxb5uO+2EgW5nGnRAHo
	lviT81bjqZRBaFu2X1qL1BUcY89FH+PjHcr/bJkg8rYhKeaXK1az1osvOOwer1UDEz2WPAk8pN1
	j1jNNHSoFqqs/R/cwbd2XBye/unxo2U60AbNzKZuDgTMkCCItPBpOWLg5mBQIPk57puVwtrSv4v
	WaOa8xWLfmSRJnu8GUGHcCR0g==
X-Received: by 2002:a05:6000:29ce:b0:47f:93be:dabd with SMTP id ffacd0b85a97d-47fec634beemr6891249f8f.28.1785928242185;
        Wed, 05 Aug 2026 04:10:42 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfdd383sm7437135f8f.8.2026.08.05.04.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 04:10:41 -0700 (PDT)
Date: Wed, 5 Aug 2026 12:10:39 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>, "Lorenzo Stoakes (ARM)"
 <ljs@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yang Shi
 <yang@os.amperecomputing.com>, Ryan Roberts <ryan.roberts@arm.com>,
 dennis@kernel.org, tj@kernel.org, urezki@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86
 (ARM64 for this series)
Message-ID: <20260805121039.471c7340@pumpkin>
In-Reply-To: <84b31836-1d10-4bec-a469-468b91fd4645@kernel.org>
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
	<0344c559-1959-4531-9265-d5a5180eb7cd@arm.com>
	<fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
	<amCPBrdltFSE_fEf@J2N7QTR9R3>
	<25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
	<4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org>
	<anHuLy52o5S9Nlwp@lucifer>
	<63ea8156-a109-b2a2-6d35-1c17ad7f1a9d@gentwo.org>
	<84b31836-1d10-4bec-a469-468b91fd4645@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_041044_723162_07AEE1A5 
X-CRM114-Status: GOOD (  17.38  )
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

On Tue, 4 Aug 2026 18:47:26 +0200
"David Hildenbrand (Arm)" <david@kernel.org> wrote:

> On 8/4/26 18:19, Christoph Lameter (Ampere) wrote:
> > On Tue, 4 Aug 2026, Lorenzo Stoakes (ARM) wrote:
> >   
> >> Since this work seems to be very much arm64-focused, perhaps it's therefore
> >> worth looking at an alterative solution that's specific to the arch, like the
> >> one suggested by Mark ([1])?
> >>
> >> [0]:https://lore.kernel.org/all/CAHk-=wire3dzhHx=KiL_f5Rj0=1u9ustsa33QoR-F9-v-NU9Ng@mail.gmail.com/
> >> [1]:https://lore.kernel.org/linux-arm-kernel/al_DpFJFcmVhxpvW@J2N7QTR9R3/  
> > 
> > Mark's solution does replace the preempt_enable/disable sections with a
> > rather hacky restart logic. It relies on a long preemable and postscript
> > to each per cpu operations.  
> 
> Okay, so 3 simple instructions of preemable is "long preemable"? In which universe?
> 
> But I am sure you did you homework and have data to back up your claims. Please
> share that data, because I am very curious.

The proposed sequence is:
>           // Prologue. Enable fixups for <off> and <addr>.
>  1        mrs	<tsk>, sp_el0
>  2        mov	<tmp>, #__VAL_PCPU_GPRS(<pcp>, <off>, <addr>)
>  3        strh	<tmp>, [<tsk>, #TSK_TI_PCPU_GPRS]
> 
>           // Generate cpu-specific address
>  4        mrs	<off>, TPIDR_ELx
>  5        add	<addr>, <pcp>, <off>
> 
>           // Perform access sequence
>  6        ldr	<val>, [<addr>]
> 
>           // Epilogue. Disable fixups
>  7        strh	wzr, [<tsk>, #TSK_TI_PCPU_GPRS]

Think about how that actually gets execute by a real cpu.
Instructions will be read from the I-cache in 'chunks' (maybe half a cache line).
They are then fed to multiple decoders that generate u-ops for the execution units.
The decoder is unlikely to be a bottleneck.
I've numbered the instructions:
First clock can run instructions 1, 2 and 4.
Assuming the mrs have no extra latency the second runs 3 and 5.
The third will then run 6 and 7.
The cpu then probably has to wait for the result of the ldr.

If the access is a write then there may be a stall waiting for the value
to be written to be available.

The only real effect of the extra instructions is likely to be code size.

	David



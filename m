Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E495D68BD5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 07:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tl4mkGbQLsnipS5FyUPdNmw6cyVPTQR2eYfkSIQkcNA=; b=wkGxQNUQ9/93G1
	TUKW5C+Hn7H/RErtpqxkDbhP1KRn1W80kghxAhOn9wNa3ysn25T3wySk/kgX73eSp+LKc4X328Ldv
	lsY7JgmEGNmS6+3aSngMP0ppj+GBweEbqkXdw/AqDULKGCevldRJk2lfYAoL0QoZZTWw7cF80Cibd
	hNzdGCviFUdywOjIV6Ik9CEc9Ax5D5nrpelGqXgsJSZZh8+xBvZOqg7aJehyoCzXGjVRHlSnHHk2l
	CmV5qXf2KNBG39hgdrDCoPy7elSQiLvbe+yed5NcVwSrdjsb4+ULj696KIMH6KoC9mFOQ3GemQLce
	4PcNV6vQVlwdqMqWgX/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXDli-0000000CD0L-1kLQ;
	Sun, 21 Dec 2025 07:22:18 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXDlg-0000000CCzx-1Y1Q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 07:22:17 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-88a288811a4so34894276d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Dec 2025 23:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766301735; x=1766906535; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tl4mkGbQLsnipS5FyUPdNmw6cyVPTQR2eYfkSIQkcNA=;
        b=jhr2NOO3rE8fPI8DJcwyg+gHmnL09HJ7yuJPodxqa4BVNdsN9pFEUK9VYATzTkNwxg
         QOGb/YvUHy56CNfb79xT9bN4OKRM9N9PUjIlcSMZrVkH86B+j9zYYZD5toZDDAVGM+yb
         1vwkZivN7LmrB60g44ESZtq9gAOZn/i3MB41TdwEZa5AA1gYCaJdPe6XYBFscqS9EWyJ
         OKeC8+w2jRyDyd4orfGQ90lkpN+aIZB+jWkHOOU6XBc7P07781QXsdVws6rH724TSD38
         tA45/MA5NFCwYB7anT6xDIND3we1L1bds8hgsNGtAZLfjZ98CXhkw+64uSQnF58mRogZ
         dISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766301735; x=1766906535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tl4mkGbQLsnipS5FyUPdNmw6cyVPTQR2eYfkSIQkcNA=;
        b=oVxUZfPj5ljy7PaXHF3D9gISuPFay7irXh/jGB8nH9wqTg9SAtyIsgphJlM7eUeNNd
         P/Kep2hycgLOywW6nGK6O+H3K6g+fx+kwq8SQIEQF4AuxoZHMpOSWASXlr2EhYpT0joK
         ItFnpWPjErk17Mh4plgIo5f0akRSYXF3sD+2YPMEItzRXgcNidzoXfKWKzwrU9/tMNdr
         VWtt3u1RpWemkCSZ2d6jAthvjTk5FYxWeEd034WBwmL+Xrvu838Az28elCr8FgveOuja
         dEf+mWmQj4Xs5/aGI6kJUuKHSN8ROEvtNLfBmlmmc6VlUxqZs33nNioCBegRRsQxc4LR
         XMIg==
X-Forwarded-Encrypted: i=1; AJvYcCWQtKwnIyKyoXPpfrizepj1VQoFYEXVEHlgpukpl4HSf3JTcodba4XP3V671kwfECOI/MHgJv8obGZ6Jkog8jP9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz31lAcdKP7yPmpnqgbx+Rp6w5VE5DeAJn6NHMiKUYGFI58Gd+u
	nILKcqxa1ZgbIThZ3kdzk1tUmkw+PiksRM46bIlZLzfzoH0G1lPkoE5i+U/vWgJBblBzf9k0vGF
	eos+vz+h1xJBRXUd1Jmgv25tp1pMIFOM=
X-Gm-Gg: AY/fxX4VJvokT60iZG5tzag5uRSatzHC9prPBwtLd9mkXDBxL7rZANCi/4pfYG+dNZV
	HtjvZiDweQKmmiOLmSRormOSq2vuyt1ialpCSDw5f3jeC4E2G7HtHRr39F/K6VC10dyCsEhBAuu
	SMGYqxoJIxTSI2p62ImyUhR1v7hE0YmXHZBOavkNknOkK+KCHKU4xLKZLQryYGu5EXwSb9w6kLV
	3Oc7OAgzKQidSJSB5Lw0J0SaTpQjGgQ2KxRoGWN2InlTcqlHDN3Htmw9CFcg+BLNicQSTPfw3Z4
	/8yr
X-Google-Smtp-Source: AGHT+IF5k8r/mShv/0migvR7/wlLppEjH9Dd7nKs+LQlOF6mkB6DvnezWl4bJLuuz9SFUgw2YrS3VPtDITiGCTNjb6w=
X-Received: by 2002:a05:6214:20c1:b0:882:5078:8da1 with SMTP id
 6a1803df08f44-88d8442fe3bmr128194326d6.64.1766301734461; Sat, 20 Dec 2025
 23:22:14 -0800 (PST)
MIME-Version: 1.0
References: <20251219053658.84978-1-21cnbao@gmail.com> <20251219053658.84978-2-21cnbao@gmail.com>
 <f43286ef-3dea-4637-a34e-b9b70d2741bf@arm.com>
In-Reply-To: <f43286ef-3dea-4637-a34e-b9b70d2741bf@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sun, 21 Dec 2025 15:22:03 +0800
X-Gm-Features: AQt7F2qjYoKebl5Qs_kCNYwvrfXsZT3gRENKM98Dct0ak1uw7wvLRqtXCYWtXmM
Message-ID: <CAGsJ_4wRcz7NFw2PiBCb54gmJwTt7=UG1fn2UEJ9_gR687Y4Uw@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: Provide dcache_by_myline_op_nosync helper
To: Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_232216_427835_C1FC5030 
X-CRM114-Status: GOOD (  15.11  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, surenb@google.com, iommu@lists.linux.dev, maz@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Dec 19, 2025 at 8:20=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2025-12-19 5:36 am, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > dcache_by_myline_op ensures completion of the data cache operations for=
 a
> > region, while dcache_by_myline_op_nosync only issues them without waiti=
ng.
> > This enables deferred synchronization so completion for multiple region=
s
> > can be handled together later.
>
> This is a super-low-level internal macro with only two users... Frankly I=
'd
> just do as below.
>
> Thanks,
> Robin.
>
> ----->8-----
>
> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/=
assembler.h
> index f0ca7196f6fa..26e983c331c5 100644
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -367,18 +367,17 @@ alternative_endif
>         .endm
>
>   /*
> - * Macro to perform a data cache maintenance for the interval
> - * [start, end) with dcache line size explicitly provided.
> + * Main loop for a data cache maintenance operation. Caller to provide t=
he
> + * dcache line size and take care of relevant synchronisation afterwards=
.
>    *
>    *    op:             operation passed to dc instruction
> - *     domain:         domain used in dsb instruction
>    *    start:          starting virtual address of the region
>    *    end:            end virtual address of the region
>    *    linesz:         dcache line size
>    *    fixup:          optional label to branch to on user fault
>    *    Corrupts:       start, end, tmp
>    */
> -       .macro dcache_by_myline_op op, domain, start, end, linesz, tmp, f=
ixup
> +       .macro raw_dcache_by_line_op op, start, end, linesz, tmp, fixup
>         sub     \tmp, \linesz, #1
>         bic     \start, \start, \tmp
>   .Ldcache_op\@:
> @@ -402,7 +401,6 @@ alternative_endif
>         add     \start, \start, \linesz
>         cmp     \start, \end
>         b.lo    .Ldcache_op\@
> -       dsb     \domain
>
>         _cond_uaccess_extable .Ldcache_op\@, \fixup
>         .endm
> @@ -420,7 +418,8 @@ alternative_endif
>    */
>         .macro dcache_by_line_op op, domain, start, end, tmp1, tmp2, fixu=
p
>         dcache_line_size \tmp1, \tmp2
> -       dcache_by_myline_op \op, \domain, \start, \end, \tmp1, \tmp2, \fi=
xup
> +       raw_dcache_by_line_op \op, \start, \end, \tmp1, \tmp2, \fixup
> +       dsb \domain
>         .endm
>
>   /*
> diff --git a/arch/arm64/kernel/relocate_kernel.S b/arch/arm64/kernel/relo=
cate_kernel.S
> index 413f899e4ac6..efdb6884058e 100644
> --- a/arch/arm64/kernel/relocate_kernel.S
> +++ b/arch/arm64/kernel/relocate_kernel.S
> @@ -64,7 +64,8 @@ SYM_CODE_START(arm64_relocate_new_kernel)
>         mov     x19, x13
>         copy_page x13, x12, x1, x2, x3, x4, x5, x6, x7, x8
>         add     x1, x19, #PAGE_SIZE
> -       dcache_by_myline_op civac, sy, x19, x1, x15, x20
> +       raw_dcache_by_line_op civac, x19, x1, x15, x20
> +       dsb     sy
>         b       .Lnext
>   .Ltest_indirection:
>         tbz     x16, IND_INDIRECTION_BIT, .Ltest_destination
>

Thanks, Robin.  Really much better!
dcache_by_line_op_nosync could be:

/*
 * Macro to perform a data cache maintenance for the interval
 * [start, end) without waiting for completion
 *
 *      op:             operation passed to dc instruction
 *      start:          starting virtual address of the region
 *      end:            end virtual address of the region
 *      fixup:          optional label to branch to on user fault
 *      Corrupts:       start, end, tmp1, tmp2
 */
        .macro dcache_by_line_op_nosync op, start, end, tmp1, tmp2, fixup
        dcache_line_size \tmp1, \tmp2
        raw_dcache_by_myline_op \op, \start, \end, \tmp1, \tmp2, \fixup
        .endm

Thanks
Barry


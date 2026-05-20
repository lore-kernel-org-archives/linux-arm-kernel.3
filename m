Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6C2CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 21:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmdK4vbjUWnyTBEm67qsNClqg8Ylwzn73Ycp8tLb8QQ=; b=UsNSowRowWBlZ6VIthqhnrQRNV
	0T03nQo6s1GRM3tLX9hh9dx94gGcspF/0t+0apt4ysSUBrKQ2Z6xcK6ZuQ4GTw1EPAA3I6bG79d9x
	nXJe9IZ2/ElWg0vvna5P5waiswyKBgfm6cxPZWr5K0yPAU0oTp9opbGc0SXoDWdglL1ONA1WEdOEe
	0Wa5SRfkhdgQvEPIihJZKKk4bXGznMaXfpHF9ZGC1K86OjgfEZ7OBruzkk+bbeVammF9rXN99u7Z8
	r71iOznQx6N/BaAlgJ9i66VXBDyYFu4qQ0AuPPEgl+uXDgdHnpVbEzM0Cw0pFaSlJ/DiSkiCS2Jn+
	C1qOFKVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoe7-00000005rk8-09yu;
	Wed, 20 May 2026 21:40:07 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoe4-00000005rip-1S8e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 21:40:06 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-67e9e343b22so8010537a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 14:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779313201; cv=none;
        d=google.com; s=arc-20240605;
        b=iZen1j7nNEfYs33vRP3u9cKJtWe7IvusBDkYBL5qgrwaj04HRujDrqZLu7jKD9oE5y
         z/baJLEfb5XUOVMnt7LULaVRV7gP2fF81zQnYcGZ4Oy1lG5J7YFtvKlGOiLURLWPmKNn
         R7F1jM/AmuOY1n7xYX+7OJph814Gcm5sd2sGEbYrUXL/KeoaCvxfEVaNs5pDg5I/vAwV
         IJdnvO6oj1EpWmYgvMNGKdCq4IJy0tnrNngVz7Z9ARXNdL0BB0uisaQhwwDu88RxGWvG
         DrLBzXBdPFxwWdTvp8viwNMyVhEwxSUpXvVqYTfXyKocyKvB3ApDUgg2ysw6oWUVro2u
         oX5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FmdK4vbjUWnyTBEm67qsNClqg8Ylwzn73Ycp8tLb8QQ=;
        fh=PA+dhh4vXZMIhQZ3XJl5crIrkB3jxuF108UmGA30RLk=;
        b=J1lfYs2x50DklYrPCxbvmHIAGCIVzs2m4APkMpyBFSIjaYNloTOwyXxguaHdAQfYAq
         mPKyavrvsyJpGF3i1re8N5KfPk/l+A4DB1OJiMOsk9IVmws3KLxorbQprbnALzSPgMI8
         T9WyLLNJqxFvzrDB6f2LmUeZD3cZUB3mZq0nMUiRvzw3B5dxYXfueNH9ZXYu2vT6xj4c
         cu5cyM0suWD4AwmYk11jbObmU95PCneXfDZoOBnK6973hZvHa9LlHqdvT0uKJ9zQkgoM
         a3WxuTc9sz+IcjuCotFokjk122UaxtpB7i3kcy63O4dcZN3TD8pBR1OfuFGDG5dPwPKk
         yZkA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779313201; x=1779918001; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmdK4vbjUWnyTBEm67qsNClqg8Ylwzn73Ycp8tLb8QQ=;
        b=aWIkNrKKsmFk2VE0PWMb8ID1E8oWEoVn4TsALnFd1Nr1BhnFUR6DFGe3QfDsHmMU6G
         8d/wZgLevrtHlbcFlwa+ZPyyLbOSm4U3J/ZXyftMWkF96vtjyyl99wlJZSNSeYqj+E3Y
         S1oWt1Tsi+D9RDDR2aEQ+su0tgM1YPY90qJ6FbbSu+Yyv1S0cOmEmLwcv8BnVoygeJYT
         o537o+6ZSin6INtxEOH7h/dPJifPXPCLB1jMTXvhfBq8xPwI0Dz01CHJCl3rsYG+hX1P
         bjNM4sLz6Vg9dZfvw1wLl4HSW3ncvmkoGqkcROJ7ku2Y1acC1iu9x+R5pEQ/leekhrxs
         qEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779313201; x=1779918001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FmdK4vbjUWnyTBEm67qsNClqg8Ylwzn73Ycp8tLb8QQ=;
        b=X47RPk70QiG0k7q8ZS7nCV2cmqUgp8HrHvT9vYwLuI26szevR/jB/Got+nRLf4vp3v
         74r8YBal7+pR6IsBOm3C9mTWULKIVkR6VmBbm0D8oIUnEqYIo6Ku+o192q18ebBSvL+q
         0lLTHf9A1g9n+g67XKLNhnAW1q+sWF2SwZZynrcPCNMqM1wEJKEW2wuXUnbkZhUZdpoO
         rhEy/tipXw4VFlM0YMv8L5OMxc7SUDgmyrzfNAnZg7hNT5+UPyZd6HNV5nWRF11Awiq6
         fUFilrX0VQLDIzGt9BpSqu2VxH7ERCMKoTqB3g3SpYJqEgMnzbqx40xzdia2QQCYWe+i
         gCVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8pXx9ZWQw7dI57lEGWFNwF5cpiPGeXlQRoAYeq5S4EMLWSDGaBTt8hpUCb8NI4w9E9kYtLAWWkMjy3syA3WnuP@lists.infradead.org
X-Gm-Message-State: AOJu0YwJFL2SSRGud5V6szk6lUiS8TucLaK8Ha/JkLefQQ70QLsBsPhd
	aeGLT7+lOkMF0sL2zCgeT1YCIM0vqlmmSYwWK0sey+stlQ2cmBd1cJpiCM1Xdz6EmcAXojuW0Wt
	yM7CHtZ7VroxsA3ZL0CP48xaUSHRb3rE=
X-Gm-Gg: Acq92OFsCbktWXG09S3VX8oEDJ0Rr8TJlRMsOdKLmIB1J36UayPOD8x0L2CtSzhmCz5
	nHzPebTupR8Hve8gOspm6winfz0kHv9f4Z0LarXjQ+CiklH9FLEmTWrd2TkDGFOHhPcw507P6yR
	qV03fDtrVmuXDU2ITm4KQ4jlkf0gOXE8wFv0Q9dQJYGx/9ryDlCS5h52QNnEAmPXJhTVfg+r3AS
	1/5FHkfHJo86bIjhXDBacCuDXZ58D/c1oUbbFR8eSVnyfnPWCG0NMclSyziPSu4fLY6D53anRjL
	f2GRtzl4GYzg1w==
X-Received: by 2002:a17:907:e14b:10b0:bd5:151d:2d31 with SMTP id
 a640c23a62f3a-bd51781106dmr1121316766b.13.1779313200765; Wed, 20 May 2026
 14:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer> <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <agxbq1TxJdniMQT3@lucifer> <e6d1017a-e4c5-493e-bfca-932c6d64eaac@kernel.org>
In-Reply-To: <e6d1017a-e4c5-493e-bfca-932c6d64eaac@kernel.org>
From: Yang Shi <shy828301@gmail.com>
Date: Wed, 20 May 2026 14:39:49 -0700
X-Gm-Features: AVHnY4IxXAq80R4nUJKOoKG85hi3I-EgpsftnPlc019PI3pxbjgBD4oSC5VrWsM
Message-ID: <CAHbLzkq3S7NDYe4LXjurKNQU+40-wtqrD_PT18YcyHbAcNxiRQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Barry Song <baohua@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_144004_406722_42435625 
X-CRM114-Status: GOOD (  33.37  )
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

On Wed, May 20, 2026 at 3:34=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 5/19/26 14:53, Lorenzo Stoakes wrote:
> > On Mon, May 18, 2026 at 12:56:59PM -0700, Suren Baghdasaryan wrote:
> >
> >>>
> >>> I think we either need to fix `fork()`, or keep the current
> >>> behavior of dropping the VMA lock before performing I/O.
> >>
> >> I see. So, this problem arises from the fact that we are changing the
> >> pagefaults requiring I/O operation to hold VMA lock...
> >> And you want to lock VMA on fork only if vma_is_anonymous(vma) ||
> >> is_cow_mapping(vma->vm_flags). So, we will be blocking page faults for
> >> anonymous and COW VMAs only while holding mmap_write_lock, preventing
> >> any VMA modification. On the surface, that looks ok to me but I might
> >> be missing some corner cases. If nobody sees any obvious issues, I
> >> think it's worth a try.
> >
> > Not sure if you noticed but I did raise concerns ;)
> >
> > I wonder if you've confused the fault path and fork here, as I think Ba=
rry has
> > been a little unclear on that.
> >
> > What's being suggested in this thread is to fundamentally change fork b=
ehaviour
> > so it's different from the entire history of the kernel (or - presumabl=
y - at
> > least recent history :)
> I don't want fork() to become different in that regard.
>
> There is already a slight difference with vs. without per-VMA locks, beca=
use
> there is a window in-between us taking the write mmap_lock and all the pe=
r-VMA
> locks. I raised that previously [1] and assumed that it is probably fine.
>
> I also raised in the past why I think we must not allow concurrent page f=
aults,
> at least as soon as anonymous memory is involved [2].

Thanks for sharing the context, it is quite helpful to understand the
race conditions. Because Lorenzo also raised the concern about page
fault race, I will reply to all the concerns regarding page fault race
together in this thread.

IIUC, there is already some sort of race with per vma lock. Before per
vma lock, mmap_lock did lock everything. So page fault happened either
before fork or after fork. But page fault can happen on other VMAs
which have not been lock'ed yet during fork with per vma lock. For
example, we have 3 VMAs, we lock the first VMA, but page fault still
can happen on the other 2 VMAs during fork if they already have
anon_vma. This is the status quo now, but it seems not harmful.

The bad race shared by David is caused by racing with copy page. So it
seems like it will be fine as long as we serialize copy page against
page fault if I don't miss anything. Since we decide whether to copy
page or not by checking vma->anon_vma, so it seems fine to not take
vma lock if vma->anon_vma is NULL. This will not introduce more race
either because setting up a new  anon_vma in page fault or madvise
requires taking mmap_lock according to the earlier discussions.

Thanks,
Yang

>
> ... and I raised that this is pretty much slower by design right now: "We=
ll, the
> design decision that CONFIG_PER_VMA_LOCK made for now to make page faults=
 fast
> and to make blocking any page faults from happening to  be slower ..." [3=
]
>
> [1] https://lore.kernel.org/all/970295ab-e85d-7af3-76e6-df53a5c52f8b@redh=
at.com/
> [2] https://lore.kernel.org/all/7e3f35cc-59b9-bf12-b8b1-4ed78223844a@redh=
at.com/
> [3] https://lore.kernel.org/all/2efa2c89-3765-721d-2c3c-00590054aa5b@redh=
at.com/
>
> --
> Cheers,
>
> David
>


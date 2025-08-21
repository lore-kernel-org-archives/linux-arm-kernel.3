Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0B4CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 03:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHa4LrampbSXQx1Wyi9Bh9OjrywcR0PvG9lus2xsnNw=; b=zeDTN0+xK0BBD8AEvTUc381zt3
	hAPosSx6Qf9NUuBBWE9fLv7nZSH7I60ZlClWn3MlFI5xC95FzW9Ga4wxGHwj/c9MnvhP7gkmpMgKr
	NDop3GwUWfqFF2iZtlPwIWWWjI0PAWNb+xK/H41wW4meyIUdcPsIsqqFtVcavg1PW4NXz5Rfl9IAo
	CM/azSFx2KISXHA1aXA6yHzp5SWDiVls9eoBWov99a84YQKx0BJmCxBrt+vanUhQMAJWS9OE3FUMk
	GL7sLKCKLY9b1glMdGHgOb3v5vbjlVpwa3VbU6H44jSzpjbe6Xbyvzi5SBA0yP+bSVNDB+x28vB06
	DWWi7Zyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIJ3-00000001MgS-1I8I;
	Fri, 22 Aug 2025 03:19:09 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upC5D-00000000Via-2Ah0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:40:28 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e931cddb0e2so1169476276.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1755808826; x=1756413626; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHa4LrampbSXQx1Wyi9Bh9OjrywcR0PvG9lus2xsnNw=;
        b=et6Dc3AT3qcojWDhWVJXNKzArikdvb97cRK980yXrycvqFdmU3JyxHYd2eEe1hREli
         /CAjqcodqACkN9p7w3bbvN/LYCDExgDMT++GxoxS5VCFXhDipMZ9BCOH50qnw6qa4AXy
         0X2JYypCo4mzAEWX7IshXvjumEbLEfDdZEJlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755808826; x=1756413626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHa4LrampbSXQx1Wyi9Bh9OjrywcR0PvG9lus2xsnNw=;
        b=BvRVjb28IcY5oufnmoCG/znHL4Ui1AHf8dB2tUjm644Rz9SIrEq1xRfyrEdANbpUGB
         gBgE3PLZuqglT7+jcs6/sejoqjsLilfPRlJZm5jAQTwYZIru0fD2tBtENRk77/Cn40eo
         zMgMUgdX+5qiYCcwzpiI58scZqRfTc3RbAC6JEj3Eiw4HB7dMRwilMEQTs6ajnv7gPQA
         1zSn7y6JyUyP3no/xtZJDphUHQqzfolozaAiZDlAyjgHBMo+PW2V8LUdHrooeArDzh0A
         ma1AR8pGVSr+DtjnQxBjiNprGpZMb+yTKmkc/SevS7u1qydicEfmzLgXSkdFQq9cAS6I
         +jJg==
X-Forwarded-Encrypted: i=1; AJvYcCWs/PtiFmWrh7v/YW4uMHr8qZRHy6+oAPgHcKgvOcbKCAiP4WcsX7KFNugb1t9Kaln7XFXEI+WOR/vGqz1tqC3P@lists.infradead.org
X-Gm-Message-State: AOJu0YwtLUQyy7xw8gH7EjVDDEF9169YL34T0ShG/ERLeoDwokSnAKqd
	OpZYuAV7Z/QncK8uVT/aqo5ybbDylxiC6gUj8Wlwbxj1JzJUCIw/NbLOiTo4KiVXLlMhroab4Lh
	C5aLSnZwLT6x4Hxde7uisW4U9RR/AvkjPIs5M1V0aqA==
X-Gm-Gg: ASbGnctneqV6tR/HFkq735H9AyB+2koY9Qjsl73d4JLPDz74rDquwHV6T4clVVrVD+o
	YhL5dS8xXb54aL6Wh2R8G85tLpJom17TP0o/LYDfiSTsAsk3kvhfE6SDP7G6QvtvEnpTtZZ1W89
	PFqeXY39Y/qBjHYd1nRi6fcEkn3k8zOSzogLSrBuekRrgPbuBb6Cp8hVhq767t+3wWUIKWE4pYy
	wr9h0S5U5ocosgM
X-Google-Smtp-Source: AGHT+IEDbX/Imr3oMuC/SvPpVgA4gK54+Q+BCEwHjysz7tgNECdpdXbU462KLrYXAP4tYmTYkQFLOtkp14xdKE7/w+U=
X-Received: by 2002:a05:6902:c12:b0:e93:457a:37b0 with SMTP id
 3f1490d57ef6-e951c33ee1bmr998901276.20.1755808826442; Thu, 21 Aug 2025
 13:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250821200701.1329277-1-david@redhat.com> <20250821200701.1329277-32-david@redhat.com>
 <CAHk-=wjGzyGPgqKDNXM6_2Puf7OJ+DQAXMg5NgtSASN8De1roQ@mail.gmail.com> <2926d7d9-b44e-40c0-b05d-8c42e99c511d@redhat.com>
In-Reply-To: <2926d7d9-b44e-40c0-b05d-8c42e99c511d@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Aug 2025 16:40:13 -0400
X-Gm-Features: Ac12FXw_AatpwCNNPCEiMwiwdQxQbayKDzVf5K7yc3iQ5tLY7APrv3zl2U8Z_SA
Message-ID: <CAADWXX_5AJxTsk5m_RvP58d=quRMqT4-XbnQQx=obBTKjHr1Og@mail.gmail.com>
Subject: Re: [PATCH RFC 31/35] crypto: remove nth_page() usage within SG entry
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Alexander Potapenko <glider@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Brendan Jackman <jackmanb@google.com>, 
	Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	iommu@lists.linux.dev, io-uring@vger.kernel.org, 
	Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>, 
	John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com, kvm@vger.kernel.org, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-arm-kernel@axis.com, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>, 
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, 
	x86@kernel.org, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_134027_561887_60CE69BC 
X-CRM114-Status: GOOD (  13.54  )
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

On Thu, Aug 21, 2025 at 4:29=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
> > Because doing a 64-bit shift on x86-32 is like three cycles. Doing a
> > 64-bit signed division by a simple constant is something like ten
> > strange instructions even if the end result is only 32-bit.
>
> I would have thought that the compiler is smart enough to optimize that?
> PAGE_SIZE is a constant.

Oh, the compiler optimizes things. But dividing a 64-bit signed value
with a constant is still quite complicated.

It doesn't generate a 'div' instruction, but it generates something like th=
is:

    movl %ebx, %edx
    sarl $31, %edx
    movl %edx, %eax
    xorl %edx, %edx
    andl $4095, %eax
    addl %ecx, %eax
    adcl %ebx, %edx

and that's certainly a lot faster than an actual 64-bit divide would be.

An unsigned divide - or a shift - results in just

    shrdl $12, %ecx, %eax

which is still not the fastest instruction (I think shrld gets split
into two uops), but it's certainly simpler and easier to read.

           Linus


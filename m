Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06C9CFD379
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 09:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZGxoQ7uPBKyg8xEtvM7C9Hd7crWd02epgAD4b/L7dQ=; b=TMp78iMSd57gDzrTGxXF4dczN/
	xW9GFy+SkxgGQmuFc0yU6tbVLHts9ahWGZ05e53G2LgehNjo02qYycMDTgIg3tk5IhylNESkkmzAU
	i0EK8CJ/K8U18GwGhhHJbPBwmGUwCfPOKtMtY+If33LGct0N90tsVZHVZ1nc4bKJ/WbUILOBMVd6k
	6+DL2yIjeCnsOaZrqg9ihk07ybVWXjoZ/FqH8MWAP9nuHzvZ2Mq1R7BV8DbAU53aYepUqzU4TXDpW
	02uRfW40anZjb3+P/cxlRXXWIPpiKCPzZUjsF2YiGksuzU0TDt8qCNlNQda7QisvAlIC224tCIEn6
	lnMlbqxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpNB-0000000D1um-36qQ;
	Tue, 25 Nov 2025 09:30:09 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpN8-0000000D1tv-2puY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 09:30:08 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8b28f983333so544789385a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 01:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764063005; x=1764667805; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZGxoQ7uPBKyg8xEtvM7C9Hd7crWd02epgAD4b/L7dQ=;
        b=RXobYihsp0SyBN4mKwN69INqhg9LL7uIU8GcR/D5HC7KYGhSk0cnunSsGPe4tERO0M
         osp8fUPG7vpo06/zaSZ3WFSatuM5rWE/T+iJ4kN3JZM+YkrwyRDR3F9qAaKmjtTKCKQm
         OFjjbvnpsek8mLddRoi8d6cODaJHz6yrhUUhjk2lipaClbo1hGq9Yi4zyl743hwdbomg
         YjIK1cwfZkO4GfNDSLXKvQC0xlkpJFWhO6pha+0W2va6t6ZofmNTjom9lLTObp35Jypd
         u45NkW/43ghByQztH0RWuIXY0L/cEGumpGnwlBoj6opCR7tSq8UQtz/Lr6MVdG4o1pel
         OsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764063005; x=1764667805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LZGxoQ7uPBKyg8xEtvM7C9Hd7crWd02epgAD4b/L7dQ=;
        b=p60KK/wYD7IE4VPWrd9fWE6GH4c4S0UVVfTjdyuig4b1bDqKT0S5uOCAnhTJXgKRNA
         lvjBXv2cn8BberZDWAgAtW9A6B5zdvE4DIzTTTio78tDv7yGfIP6WTzEIUZvx+UIWyJ4
         xzBY9c9pxqQ5BPTfXpsvdpEgA2nUP6Dlt04Voo3fpvxXHa52PpCBH1HdyIkMvxPKJVTc
         DNqF4y+IpWDvhclaLyppHsph0IQTbi/OWePHCQDHYoA5sYvw2fTo5+N5SbFyAEHlX2hi
         Jw0RBU7UPKXexVOGZne0a0cHtvwJ0iDAsGDAqwuJxYDDUa8+Qx4BghtT2qaezwwKORJ8
         GymQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjG9IITHthAxIgHg03+ENnN3sxsvlPpkcP7n6mmXdykqeM7n42uyJNWD1YFKcl8iasQZZWyn+bEn+h4quayzTF@lists.infradead.org
X-Gm-Message-State: AOJu0YyT8h+62aDLHyoJH3Y/1xNP3b3qmls+1Ci3ucIF01uOHL0qmrMx
	37vOnGIIPZEnqhsIcYwCcAAbrRdBprDhQBcXhBoju6GJjZyHe0ymdkZn3ovZRCBfKRehzvWekbr
	uW11BsUlMl07yANQGtzPwNIUqk3WymRI=
X-Gm-Gg: ASbGncs7TfvCzoBRx6HyCBK/IwE7U9iFNP4qgPvbYdlPUFYmyvg1hIu6VTlOIqWQSSh
	w+dWyLDF/AiR0+GTwZiXYI4K84usGfecNgIN7ECISlqL7h+lMK8taNFueQMy6GFPfyDVJ5BJnjs
	0R5jJ2WsFzRCuXL0FcQId73ey5Zd/dkTKpY5zQiH7CJPdtJKqIKxMEEt51BmeTAiI33VktPir6r
	GAQzRr8hPnhzoicRE0GmcNetinuucEmhlyrjipOMq9IHMsPu/K98WLs8WirHLeXThuvOw==
X-Google-Smtp-Source: AGHT+IFYfHtH8C5s1uvT6lQpi1zP9t+juS/waF1C0j2mYu7Lm8WN3kSueTRB3zxYadfI7XdeUjdoWuVsO5GiEEl5F4Q=
X-Received: by 2002:a05:620a:40c9:b0:8a9:ef98:6b34 with SMTP id
 af79cd13be357-8b4ebd9ec44mr276689885a.56.1764063004764; Tue, 25 Nov 2025
 01:30:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763976541.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <cover.1763976541.git.baolin.wang@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 25 Nov 2025 17:29:53 +0800
X-Gm-Features: AWmQ_bkYeHV6K5FqyKN_VGpZo_yET2QKTSBXEJ5BUvlynaIRq7f_ViUimOwdWNw
Message-ID: <CAGsJ_4wNiKfKpTPKUNim6-X=KiMxhp_9sPh+hkh8gB8AR2ue7g@mail.gmail.com>
Subject: Re: [PATCH 0/2] support batched checks of the references for large folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, 
	willy@infradead.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_013006_734710_323D3482 
X-CRM114-Status: GOOD (  15.97  )
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

Hi Baolin,

On Tue, Nov 25, 2025 at 8:57=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> Currently, folio_referenced_one() always checks the young flag for each P=
TE
> sequentially, which is inefficient for large folios. This inefficiency is
> especially noticeable when reclaiming clean file-backed large folios, whe=
re
> folio_referenced() is observed as a significant performance hotspot.
>
> Moreover, on Arm architecture, which supports contiguous PTEs, there is a=
lready
> an optimization to clear the young flags for PTEs within a contiguous ran=
ge.
> However, this is not sufficient. We can extend this to perform batched op=
erations
> for the entire large folio (which might exceed the contiguous range: CONT=
_PTE_SIZE).
>
> By supporting batched checking of the young flags and flushing TLB entrie=
s,
> I observed a 33% performance improvement in my file-backed folios reclaim=
 tests.

nice!

>
> BTW, I still noticed a hotspot in try_to_unmap() in my test. Hope Barry c=
an
> resend the optimization patch for try_to_unmap() [1].

Thanks for waking me up. Yes, it's still on my list=E2=80=94I've just had a=
 lot of
non-technical issues come up that seriously slowed my progress. Sorry for
the delay.

And I suppose we also need that for try_to_migrate().

>
> [1] https://lore.kernel.org/all/20250513084620.58231-1-21cnbao@gmail.com/
>
> Baolin Wang (2):
>   arm64: mm: support batch clearing of the young flag for large folios
>   mm: rmap: support batched checks of the references for large folios
>
>  arch/arm64/include/asm/pgtable.h | 23 ++++++++++++-----
>  arch/arm64/mm/contpte.c          | 44 ++++++++++++++++++++++----------
>  include/linux/mmu_notifier.h     |  9 ++++---
>  include/linux/pgtable.h          | 19 ++++++++++++++
>  mm/rmap.c                        | 22 ++++++++++++++--
>  5 files changed, 92 insertions(+), 25 deletions(-)
>

Thanks
Barry


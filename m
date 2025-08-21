Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C788CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 01:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aeG3+zXNcZH2d1Z1/su6zkQOg7Uc4j3Xw+oqie+iPw=; b=F1FYtgaV5aC5fJBI98mz6NpZfP
	b838D7mc/y923T+I1SawH5RFsbmMDzEFC3yjThe405gfMLHxLvMWgTZEY+fmHx72bBOGdhrXnYyTa
	fNt/evPEi2cK/DxvmogbU7Rv5pJtq2HB/XY9bzMGOVzPts15tdvRgCiLDTEVINv5ABTCwB3xSlDv3
	AnOy0YgupWTe3DT21W1U7PjNAuAVO3U/wZByiVMHUkNAs09hRi7+5hukCnCBKA/87storW56wfUUu
	uHvugj+ewZHJxmoJGQHJPDLMXhA/Xs+yQclaC/tq6OAViPKEP7TqC78XN8Kzo2AKTjN0o0lePa4xt
	zJOAKiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upGxK-00000001BBA-3UqL;
	Fri, 22 Aug 2025 01:52:38 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBvE-00000000Tcf-3tTn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:30:10 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4b297962b20so13587211cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1755808207; x=1756413007; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6aeG3+zXNcZH2d1Z1/su6zkQOg7Uc4j3Xw+oqie+iPw=;
        b=J+4dgcwfYvw3+mG0dIWZpi97h7t0j9IV0lcJj7B6elzAcKOEfRcrpk5P/SMhs+KTMB
         5zvakxhaOoRF13gNSwyZsLQ/RrmdoxHf5KfAsw5BPuIkJnlPMN07d9gODNQyiS8SsD7U
         xjQJeoj/UpvcN3QNVUUQG1lPAlwriPJJCCcrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755808207; x=1756413007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aeG3+zXNcZH2d1Z1/su6zkQOg7Uc4j3Xw+oqie+iPw=;
        b=Ict0hUbTdsadFnFMCwESJALP+kdeJl/OsjSopIF0msVtK2OiV6mdQH8T9kfSNXSrjq
         4BLyxZS/ZoWRGA9OLIh3TJQLV6gyGYOTcOqUxOkn9wn2A4YPw/c1AIQK2xXmbImL4PaO
         YNcxKamZGbCGHSf4k3U8FouFTBthLDoOzqOW+L0ZnbFSYdD7DyAASh9INd+bbO9TX1Ee
         4GJjAM0ed48kmkNh/TrNKTy+eoj793eFYkfS+cCB+ZyLAvPX1+gJqnZKBUwozMdX73kg
         +gSkxtTcB7CFC4YIe9vUcAiNPKXBTqCQAgz+VcXzcckUCNjydRJ3Qfzzahygu0tm+b8H
         TuUw==
X-Forwarded-Encrypted: i=1; AJvYcCX2USb6q7wqS1WvdkV+iSbpWqMbMtMllEB3ZjTd1YrL9pMeHu9I+18ltv0asWSRLq+yTBGiUQMxrX1YljMbLy0M@lists.infradead.org
X-Gm-Message-State: AOJu0YyMye6u0iG3a/RAxtIDk1ynQ8NJB9NBHUhbn3/g1oPdzWP9Wwf3
	ztB5AJZG1DWhBEDzN8WCLW33AonLjD4mnnmlMciIbemI1YPfNMiJNc1iXSSr5Q6WymDAScURgcA
	cl0f7atc=
X-Gm-Gg: ASbGncvqD8GowLJ9zaGSRDgAbwRQdnhQo5H138PMIFE4tNhqH08w9xcPF2TSN2q81f4
	uUY35gTILuiKxvJGIoZEcCr3cd1/pDsmq/lwO7IaW6AlCNecJH4u5ajvGzs+NSnb9KWvqNgeydY
	+JhnrOQyjfPVHiPEg1x6oBLWee+tdbTDRDP7m8ol9f9SvYmi/jV/oulA5lv/mXwGvpXdHQH+wTV
	6VTgRS8LaYozGkbqhOpNKqFmAr1hTiWJlEGPUsR1CioHhG2se2XOMdqRdv6/k/svpgPwKntD3lT
	Eg2TT3XKWazcgXOhIqvwVz/9Ild4fNfvmFbPkZCMPo02Y00ls2k59Qpz9BOIfSKUlBPpDpaCzXr
	ikKoOo4k997OSvg/w2BrP07i1B9Ffk3ptiBvlvHqH+xjW8ebW945aQutS8/8Zp0hg7Yu5ZPNh2L
	SV
X-Google-Smtp-Source: AGHT+IFPjP4QR9hXks9BUiEaQ8KDvDKO4fdAbIHKHMtIOLZ4vBsbWUPiRoAZCC1VboD3VX6osY8zog==
X-Received: by 2002:ac8:5810:0:b0:4b2:89c9:1552 with SMTP id d75a77b69052e-4b2aaa57116mr8835411cf.8.1755808207405;
        Thu, 21 Aug 2025 13:30:07 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11dc90dfdsm105924271cf.25.2025.08.21.13.30.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:30:07 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e8706a6863so172174585a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:30:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWk3DJK5DJrcArj/5u06alZyARGk7pviAIGvOnc0/0iZP0MaDq3IutzokLrQEGYTNuVRgui6edvuz7m9xOxJu3W@lists.infradead.org
X-Received: by 2002:a05:6122:1ad2:b0:53c:896e:2870 with SMTP id
 71dfb90a1353d-53c8a40b923mr212315e0c.12.1755807884664; Thu, 21 Aug 2025
 13:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250821200701.1329277-1-david@redhat.com> <20250821200701.1329277-32-david@redhat.com>
In-Reply-To: <20250821200701.1329277-32-david@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Aug 2025 16:24:23 -0400
X-Gmail-Original-Message-ID: <CAHk-=wjGzyGPgqKDNXM6_2Puf7OJ+DQAXMg5NgtSASN8De1roQ@mail.gmail.com>
X-Gm-Features: Ac12FXxaZhwn04a0gbwY6rjh9UGLxnRlGOG0Jy0WjRbVAG0UxLDqNy0Wydj0GQk
Message-ID: <CAHk-=wjGzyGPgqKDNXM6_2Puf7OJ+DQAXMg5NgtSASN8De1roQ@mail.gmail.com>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_133008_968417_DFBF27FA 
X-CRM114-Status: GOOD (  13.64  )
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

On Thu, 21 Aug 2025 at 16:08, David Hildenbrand <david@redhat.com> wrote:
>
> -       page = nth_page(page, offset >> PAGE_SHIFT);
> +       page += offset / PAGE_SIZE;

Please keep the " >> PAGE_SHIFT" form.

Is "offset" unsigned? Yes it is, But I had to look at the source code
to make sure, because it wasn't locally obvious from the patch. And
I'd rather we keep a pattern that is "safe", in that it doesn't
generate strange code if the value might be a 's64' (eg loff_t) on
32-bit architectures.

Because doing a 64-bit shift on x86-32 is like three cycles. Doing a
64-bit signed division by a simple constant is something like ten
strange instructions even if the end result is only 32-bit.

And again - not the case *here*, but just a general "let's keep to one
pattern", and the shift pattern is simply the better choice.

             Linus


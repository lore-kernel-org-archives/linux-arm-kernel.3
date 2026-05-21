Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE65CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 03:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnZgEvyl5JzulXJ71OevVX7wYBcNSF1YrTlDeDtAzPQ=; b=HUa81+Wv+IENEVDSecFbOKAW7I
	hVWsz0ktqbG8RW8aa1/vFimbEMFXRlFCApbxDlfblp9DWf24zWK+eicH14HabbJ2DtnfScAV8UsbC
	lK+mVeh9kDUxPnfslzn60DEbObStR2S3cJBKj8xvVz2GhihQ4yn+OrAhSgt2IKURWDefG7PrqnyxE
	Y/ig0bTYVe9sLXCPzcKjhMEsemnFFzHLAN4dUsaEYmY2dWHwilLajIO5SAzNalVKrgeTcB23IeHJi
	H8Gu5ziNiuztsIAFdcfSl2HWtnA7iFoa9RvompT4yZJvn/Onk7D251X3awi10lxoV06QFU9L8TIXZ
	mYZdx1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPtuX-00000006Wia-1VCX;
	Thu, 21 May 2026 03:17:25 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPtuU-00000006WhO-0mRO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 03:17:23 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-36a3dd2e66eso285803a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 20:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1779333441; x=1779938241; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnZgEvyl5JzulXJ71OevVX7wYBcNSF1YrTlDeDtAzPQ=;
        b=zxoH4uZHmLSeUSCcohYddMGDxKqzrFPkQFoWZS7tioeqprECtmPZlJC9vQ6zFcHZfc
         mQAuuJ5Kk8upTEWuBnave7vYp+8l3YhePvUTvF4YbOXsEXQXopL9BgyYwg7Wsa92RccD
         VxFbXYBpc4srTexTBzjtaztPyytzJUQOa7D7ZK02M5BWWR8qglzMYBMPgEYlwjMtAa6K
         XUyXZaSGRgEi5e0ondfbS+5UJELQutPSBCNpqUbEHy21lOljQw50ri6ENuVSqebn6jpH
         4FWXOP+Ll1fTeBQgZ50Hr/lxJOC8kMEtpBpi0MF/l8dWgFQXdal/XrK98r0098JI1pHf
         v2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779333441; x=1779938241;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WnZgEvyl5JzulXJ71OevVX7wYBcNSF1YrTlDeDtAzPQ=;
        b=fe6OsMyu1K/ugbvxCMbdrV0Ve5JDXa4B4MzOyNvKT/xULoKWyb0qmpH8Lky1mfWH0L
         L+9ZtiWTVOBEX4RIe4TKHNZkybqLI3OScENnbrPK5gYKcyyhYU6pNj7anFUSYDctrkXC
         qw0u8tLbW7rTNuOAFa0FljWMc9+7AcTKL2/RykTJ+FhQhJVBEe6nxZaTvIQHLhj3ZSla
         P8eGWLd2txvO4H4RgyRUF1IOOh21bAhIrw5QBOYJzVRdOMIKOSksFnat8pHQ45T3iDFj
         9rq/t3QzxeZBmleADW69qkntHVF1ry9sNVZIDpbp/mQC4dhJbuxestIY08udjk3nCVWM
         eicg==
X-Forwarded-Encrypted: i=1; AFNElJ9e8tkSZZqoxeBr58hGMXxPxZO2qabobXZ/d6GiOpvKqY2v+rZpG4QU19Bv+33R8i2tIbg2ARh3g9VsBqJsEjpM@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw3C6ENheHumnZhOH2HwAJdBYFMcZqCHIO1vBYBYDlFGDHoEXZ
	89rQqGWl+F079oWOjRS46H8rXX61Xz4uZbyI4fS0r1iikUdPJLUh/zGBeCnEcGtoxvo=
X-Gm-Gg: Acq92OG5baTWY+IbV7nT3xOwHGg8Im58SSibNiBD5SwIUuTJnE2MDfuAEcymBmxZH9v
	ZpSryP3El57UaLKCSFhhU5oQKhF9kN2IxDswlFcRijeL9nw0jur0IH8pOWIAMFPisynjxsdHSMH
	i+Hnp9D6jj82qWHfDiG436WDFS5gyB9k5RgkduKBt9fU1cH+mRCj5mBB0HaR0EAMi4Agom2QziV
	+XVLiYO801fb6dntKJYM9Zr9MB6D2T70I4b1UG0RUBkcozSs5M8TfiqRhZ39YB6jG3dT5+olv1c
	4AnaP4e7rAaazesZG7QvB5Jt3CmTV7GOyXPoacwUnO5jfp/SSaSO4vBi1P0c48AKbFn0Fob3sWB
	SUX0eHo6P2izxZtU61/paAqKFZe7mik0Lu7VkJydI0SjNje4gsWztEnQY7EJzcpHQUBC1JZK81q
	ta4JeegerfW2b/Vlgteqcvhl9N
X-Received: by 2002:a17:90b:1fc3:b0:366:16d1:6a26 with SMTP id 98e67ed59e1d1-36a45139004mr1096386a91.5.1779333441193;
        Wed, 20 May 2026 20:17:21 -0700 (PDT)
Received: from localhost ([2001:569:58a0:da00:a5c8:c4ce:f7c1:40c1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a4560779csm222458a91.1.2026.05.20.20.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 20:17:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 23:17:20 -0400
Message-Id: <DIO129TJQ1F9.20NON5EPGLHRO@etsalapatis.com>
To: "Tejun Heo" <tj@kernel.org>, "David Vernet" <void@manifault.com>,
 "Andrea Righi" <arighi@nvidia.com>, "Changwoo Min" <changwoo@igalia.com>,
 "Alexei Starovoitov" <ast@kernel.org>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
Cc: "Peter Zijlstra" <peterz@infradead.org>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Andrew Morton" <akpm@linux-foundation.org>, "David Hildenbrand"
 <david@kernel.org>, "Mike Rapoport" <rppt@kernel.org>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, <sched-ext@lists.linux.dev>, <bpf@vger.kernel.org>,
 <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/8] bpf: Add sleepable variant of bpf_arena_alloc_pages
 for kernel callers
From: "Emil Tsalapatis" <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260520235052.4180316-1-tj@kernel.org>
 <20260520235052.4180316-4-tj@kernel.org>
In-Reply-To: <20260520235052.4180316-4-tj@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_201722_229920_5F4B525D 
X-CRM114-Status: GOOD (  18.68  )
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

On Wed May 20, 2026 at 7:50 PM EDT, Tejun Heo wrote:
> The existing kernel-side export of bpf_arena_alloc_pages is _non_sleepabl=
e
> only - it's used by the verifier to inline the kfunc when the call site i=
s
> non-sleepable. There is no sleepable equivalent for kernel callers; the
> kfunc bpf_arena_alloc_pages itself is BPF-only.
>
> sched_ext needs sleepable kernel-side allocs for its arena pool init/grow
> paths. Add bpf_arena_alloc_pages_sleepable() mirroring the _non_sleepable
> wrapper but passing sleepable=3Dtrue to arena_alloc_pages().
>
> Signed-off-by: Tejun Heo <tj@kernel.org>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  include/linux/bpf.h |  8 ++++++++
>  kernel/bpf/arena.c  | 13 +++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 831996c411cf..64968ca6db51 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -679,6 +679,8 @@ int bpf_dynptr_from_file_sleepable(struct file *file,=
 u32 flags,
>  void *bpf_arena_alloc_pages_non_sleepable(void *p__map, void *addr__ign,=
 u32 page_cnt, int node_id,
>  					  u64 flags);
>  void bpf_arena_free_pages_non_sleepable(void *p__map, void *ptr__ign, u3=
2 page_cnt);
> +void *bpf_arena_alloc_pages_sleepable(void *p__map, void *addr__ign, u32=
 page_cnt, int node_id,
> +				      u64 flags);
>  #else
>  static inline void *bpf_arena_alloc_pages_non_sleepable(void *p__map, vo=
id *addr__ign, u32 page_cnt,
>  							int node_id, u64 flags)
> @@ -689,6 +691,12 @@ static inline void *bpf_arena_alloc_pages_non_sleepa=
ble(void *p__map, void *addr
>  static inline void bpf_arena_free_pages_non_sleepable(void *p__map, void=
 *ptr__ign, u32 page_cnt)
>  {
>  }
> +
> +static inline void *bpf_arena_alloc_pages_sleepable(void *p__map, void *=
addr__ign, u32 page_cnt,
> +						    int node_id, u64 flags)
> +{
> +	return NULL;
> +}
>  #endif
> =20
>  extern const struct bpf_map_ops bpf_map_offload_ops;
> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> index 1c0b87ecc817..a811cf6170fa 100644
> --- a/kernel/bpf/arena.c
> +++ b/kernel/bpf/arena.c
> @@ -934,6 +934,19 @@ void *bpf_arena_alloc_pages_non_sleepable(void *p__m=
ap, void *addr__ign, u32 pag
> =20
>  	return (void *)arena_alloc_pages(arena, (long)addr__ign, page_cnt, node=
_id, false);
>  }
> +
> +void *bpf_arena_alloc_pages_sleepable(void *p__map, void *addr__ign, u32=
 page_cnt,
> +				      int node_id, u64 flags)
> +{
> +	struct bpf_map *map =3D p__map;
> +	struct bpf_arena *arena =3D container_of(map, struct bpf_arena, map);
> +
> +	if (map->map_type !=3D BPF_MAP_TYPE_ARENA || flags || !page_cnt)
> +		return NULL;
> +
> +	return (void *)arena_alloc_pages(arena, (long)addr__ign, page_cnt, node=
_id, true);
> +}
> +
>  __bpf_kfunc void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 =
page_cnt)
>  {
>  	struct bpf_map *map =3D p__map;



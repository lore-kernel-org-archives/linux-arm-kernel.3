Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EDDCD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 23:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJpF8zNQx3fuLJ61e34VmvRInkcEmUUj8JXY5zhxM5M=; b=rj6vP3/2rz5ZYqFUXMX+wnCYd7
	dhU2pDOTwB4DRFaRd+dXUQVUt9qn/Q2l5bLWz5LoKFPRb3sHxdqIjl2gL80LIqUkyxSM0wa4CBLW0
	KTdtC2LWP7aRpsLkNEKjrRr8qoaPkTdOB6Ezk2ZfWmJC6ZZaJwVGLNflCjIuZ6CYfqEl8FHy2Xm2N
	UC/y4ntHDwLe6ojLEV7Y0/9v+B8NIzXsTZH9yfcOJx/Yg6eFnLST1oCb/2OjBXDHrrGEaedgXSGAB
	nlyQZY2KTz1FCTPvyZH1ZaRgMcrqUyxzKMPQQTGuPNzmuqIu6i5e3eDoOlWtn7xGWnL1YBaL6yAlE
	f9oxkIWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP7Lm-0000000HBV0-0nI8;
	Mon, 18 May 2026 23:26:18 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP7Lj-0000000HBUO-0CsT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 23:26:16 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-65e170f1ca5so2981467d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 16:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779146773; x=1779751573; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJpF8zNQx3fuLJ61e34VmvRInkcEmUUj8JXY5zhxM5M=;
        b=mRtIZm0Aa58SQATIo/uxpdlNajXlHBzkhOAneLGEtVY1vUYN6fY9CXz5Nli2Id5j6I
         72QjUmztOM9+4Q/9V9IDA0UFdkYYkRE0eqTWEMPt7Qmit94FZ7cm/nNFEDNrngTv8RXC
         5QDrh6QzSE9SPhy9yeoR952kloJPg1WgulW87TNeWS0WSoTaLKDTYZEdWEYDragblSps
         1JwcMHPFaSqh8HPpR+ngSfo8SnRDSHJkYnctiG3OVN2a6ltJjF/2Dlp6CgKyPS/7Oedf
         4ZSqvIDeY8ewwVq4N0XrzHmLhuQODW+hvVSUUIe552ck0YKITSDVrOOLiGn2hvwaThPQ
         /BGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779146773; x=1779751573;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eJpF8zNQx3fuLJ61e34VmvRInkcEmUUj8JXY5zhxM5M=;
        b=gb3U1mLYkrdN/wo+JNhAhoysIURSjPV6NgAFVN3sdZNqSkqZ0kPT7aFUTHr1wcJykv
         LhfTXk3KfRsyvtkn5VMDcD1cuvARGFYLDnPwJ5OIpzX1tSNA3hZvMiEGzxH7W5wrJ9j7
         7ktbtn6To9Ob24QRtjsO52fs5TroV2fkFfZ3Puua6DXAVmxL0E61ha3eqeQjFikU3hS/
         aMFGFbPp8kGTHHFr3EfEmt27mSJ7vjF4FrpY4D1JmvLayYg7wC5i3qKcpYYidY1vooLy
         7ewUW7Pj+Qv10ptKZ0Sfs6uXF2x9Ir950EChKf4Q/014+WqQrOjfxjqNFWGjOXJyI75r
         jkGg==
X-Forwarded-Encrypted: i=1; AFNElJ+GE+zge3YZhi/vp3v4ChXShbPlppxkzfUnfzJ4yEmRPqiKCKeZqHM3YG3JBSPw/IIDehbeRLD/LfWYBVrs6wx1@lists.infradead.org
X-Gm-Message-State: AOJu0YzSoveN/VhKb42MxG+GRhRfTYB88KZf4p2b3uBBi6nzVA/xTVTJ
	DKeAXczKnlycsrQo/v5X6oO+JaunyB7dDO5f1rD2f+CSId23wU3L0ZrA
X-Gm-Gg: Acq92OG1Vw8v/y6+LpIcTOPf+y6aGE00WEGCHV9mM70XBOW/unN4FKIctfPOivFcZkh
	F7yX23ZJW8PxmjePY707ovuGdTONN15h5/BIJRNorKg+VJaDhSE5d9p+r5HPDnrK58LzZPidl/X
	f9ykkjzSA2eZhpCuCmJz/pHq8fFkOClDHN8otfphUBzNDAiwjsbx8ESjDTS1oLblxiZm2jF1dnR
	Zd5GiROowyoJQtLw6CoWgR+cBo67DfR54YErTxKpOwAAsCWINgIsJDpBudKbedWp2gQ1auRwldq
	Lyrm52AFtsaOLepsAD4qRiMM5PGJQaVfx4W2gvxZ8NUhI0gSfNElb9OxUyWZk/QcwtI7kxTUVTy
	hyMKuJ9+FlRezAgPG7lRNHwHpPfjBGWFpkXf34eEt+scwZMPwZA+8Tioa2ciGy6cHIlydEvcJWO
	7hIJSNYZ/IU8ZZ0AdjWqiKXcYxJzwmWit8PBsF76EbpRToojDKpowxQHH9ondUlUcfkR6Y1xc1j
	Ewlfi5+lvvifoB2Yw==
X-Received: by 2002:a05:690e:14c9:b0:65e:438e:c025 with SMTP id 956f58d0204a3-65e438edademr10259078d50.19.1779146773245;
        Mon, 18 May 2026 16:26:13 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:52::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0db0aa51sm7022713d50.12.2026.05.18.16.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 16:26:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 16:26:11 -0700
Message-Id: <DIM6W7GRZK2N.14AH43S1XTFCG@gmail.com>
Cc: "David Vernet" <void@manifault.com>, "Andrea Righi" <arighi@nvidia.com>,
 "Changwoo Min" <changwoo@igalia.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Andrew Morton" <akpm@linux-foundation.org>, "David Hildenbrand"
 <david@kernel.org>, "Mike Rapoport" <rppt@kernel.org>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, <sched-ext@lists.linux.dev>, <bpf@vger.kernel.org>,
 <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/8] sched_ext: Sub-allocator over kernel-claimed BPF
 arena pages
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Tejun Heo" <tj@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>
X-Mailer: aerc
References: <20260517211232.1670594-1-tj@kernel.org>
 <20260517211232.1670594-8-tj@kernel.org>
 <20260518072042.GP3102624@noisy.programming.kicks-ass.net>
 <agtt2dEjS4Qg7a_P@slm.duckdns.org>
In-Reply-To: <agtt2dEjS4Qg7a_P@slm.duckdns.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_162615_096880_297EE6B7 
X-CRM114-Status: GOOD (  14.18  )
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

On Mon May 18, 2026 at 12:51 PM PDT, Tejun Heo wrote:
> Hello,
>
> On Mon, May 18, 2026 at 09:20:42AM +0200, Peter Zijlstra wrote:
> ...
>> Should this really be part of scx rather than be part of the bpf-arena
>> thing proper?
>
> It's just a layer on top of arena. If bpf folks are okay with it, I don't
> see why it can't be a common utility thing on the bpf side.

Well, this gen_pool based allocator of arena memory is a temporary hack.
It's ok for rare allocation like in this at scx init time, but not suitable
for active arena management. We don't need to expose it beyond scx.
Having said that the fast and generic allocator for arena is definitely nee=
ded.
This break through with scratch page and bpf_arena_handle_page_fault()
cannot be overstated. It is a huge improvement for kernel <-> bpf interacti=
on.
Not only kfuncs can now read arena without ugly __get_kernel_nofault(),
but we can reuse mm/slub.c to manage arena memory!
The key idea is simply this:
get_freepointer() {
  if (s->flags & SLAB_BPF_ARENA)
    return (void *)(s->arena_kern_vm_start | (u32)(unsigned long)ptr);
}
I'm sloping a prototype.


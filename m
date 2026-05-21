Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E411CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 07:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbyMl+Arkun9SbcO90HXYgu4HO67jHkSgeXx2LBS3m8=; b=PCt0oyEARgZ4wu7c65LDi6o7g1
	pCPsWzJpF/VVWIPFXT7pRFhsDEkkS/aPTBF0lppJaSXstJaqgNHlkivYY3cQ2/X6MaquwY1fd7a9o
	o9KPVwWkOXA75I3oxiuYrQx5MULgeJtjvzvRcHdn8LQYLk7xo1Zjd2PU7wN55o49QfIwV4xMdNjDq
	I+m/FVm+UydFpPuRC+nJv8De3zuz1uNOmdi4EiWI3Or5cNO9HqWxihUSSe2S21UrsCtlXRjycaZrV
	32fe3rjwPFakuwhn/Z3FW+y9vyREQTBXtbM1R81CJtI9m8ju562SrZksvrewBqQLGlq9upk3E3A8g
	fOtW4lkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxp5-00000006x9D-1fw7;
	Thu, 21 May 2026 07:28:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxp4-00000006x8v-29BL
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 21 May 2026 07:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vbyMl+Arkun9SbcO90HXYgu4HO67jHkSgeXx2LBS3m8=; b=NuYmaioJKno6vrD57wWAFGzu97
	Xpm7PhVYjLakc5/UmsHEMtvegZDmh5IuEbrd2aZWRGQ6zfv01YLNjzWtpbXGbmc2lw5uUh/KgEZfw
	jsWTz3KyJsaRVoL8fdb03VrEb2mDJNQqTZCa6rF5DgaOfjILiaLmq7FOSUOjMaTdud+k2uX5PWgwU
	9MYrVHHuihZI32a7nlDTmEGqFc2fZrVybmeTIZ3NBUXKNLeUqRtXUI97HSuDd7VciapoBadUrGKOO
	HTawXdDsylVaXmsw/+IIPYQ/63Vte5zuwFl1P1h1pdyBbnL9wk1K+ZZZq+XNLrUQHJ+7DRSQceILp
	CHV3rAtw==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxoy-000000015I7-0W0W;
	Thu, 21 May 2026 07:27:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BD703300446; Thu, 21 May 2026 09:27:54 +0200 (CEST)
Date: Thu, 21 May 2026 09:27:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tejun Heo <tj@kernel.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev,
	bpf@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] sched_ext: Sub-allocator over kernel-claimed BPF
 arena pages
Message-ID: <20260521072754.GF3126523@noisy.programming.kicks-ass.net>
References: <20260517211232.1670594-1-tj@kernel.org>
 <20260517211232.1670594-8-tj@kernel.org>
 <20260518072042.GP3102624@noisy.programming.kicks-ass.net>
 <agtt2dEjS4Qg7a_P@slm.duckdns.org>
 <DIM6W7GRZK2N.14AH43S1XTFCG@gmail.com>
 <eaeb316b7a45956ed5f335050e6e9538@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eaeb316b7a45956ed5f335050e6e9538@kernel.org>
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

On Wed, May 20, 2026 at 01:47:32PM -1000, Tejun Heo wrote:
> Hello,
> 
> On Mon, May 18, 2026 at 04:26:11PM -0700, Alexei Starovoitov wrote:
> > Well, this gen_pool based allocator of arena memory is a temporary hack.
> > It's ok for rare allocation like in this at scx init time, but not suitable
> > for active arena management. We don't need to expose it beyond scx.
> 
> I see. Peter, as Alexei is already prototyping a slab-based arena
> allocator, how about keeping the gen_pool layer scx-local for now? Once
> the proper allocator lands, scx can switch to it and the custom piece
> goes away.

OK.


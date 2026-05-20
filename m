Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4034CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 23:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqdUhxQRHfKc2fYQUeGieNHRoLL+vlXd4MzpyPnbOnc=; b=fRs+2D1a0+lrHH0W3EJWDv+kUe
	QdUsiAcmYUio0y9qH/jmXBS/ywdJrLAo6pt9YAXatuTaUQFQZ058y5gcH2fBR64nMLbpzoMni7h/4
	IKKcZCWTZ8ExOmLSD1Klt7Ada5WtE5bh9EOfwf+jA2HatbEXKO5aZ86jal/slniu7BcOicOwD0zu1
	tf/M38m+Kk3WsphbX2LKJWxoqQs8pJMDhu2SjGX3BlJ4y0nSSeW0bwQPT6kKvZqrf1IXDomSI1j0G
	dtKVDeqZ2O6161KHxxJ/Me4cvs9NYoz/4hb/uMu71jGEsnseG7QpPoRSttUbXLueAotLOV2UOPr0z
	JdtHqR+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqdU-00000006C00-3cRx;
	Wed, 20 May 2026 23:47:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqdR-00000006Bz5-3n4Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 23:47:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5059441773;
	Wed, 20 May 2026 23:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2081F00A39;
	Wed, 20 May 2026 23:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779320853;
	bh=VqdUhxQRHfKc2fYQUeGieNHRoLL+vlXd4MzpyPnbOnc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GCfZVT5iBwTSlw1drAnQSELAuPQwkctGKQNFw1NbcFq6SBdMsZGCLPhwT2W47gHks
	 cDXQGOfTuCpOFeWIDO5aHSNt+zM0B3R0wvRot5jCZ/VWwV1I/T2K/9dguvz+JcMQl0
	 pD2MNtdMF4ps/3nfkuzmYRGeAExG6A5+AAt3qYb27khyYGuWR3kNXstvWYD8PuOmlx
	 fE85ErDNWg1KohaQpt1/fKjNC/0QuK9kzppfpYd2lc2b8ifhganknb2H4Sw25SvlK4
	 x/5iCHiArTnGiXX97nQdiSJlkTYt1htEXl+YtLH8Ycnomv4wC7phNNQNTOLAl+IbQX
	 EqGjZ8xh7CPqQ==
Date: Wed, 20 May 2026 13:47:32 -1000
Message-ID: <eaeb316b7a45956ed5f335050e6e9538@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	sched-ext@lists.linux.dev,
	bpf@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] sched_ext: Sub-allocator over kernel-claimed BPF arena pages
In-Reply-To: <DIM6W7GRZK2N.14AH43S1XTFCG@gmail.com>
References: <20260517211232.1670594-1-tj@kernel.org>
 <20260517211232.1670594-8-tj@kernel.org>
 <20260518072042.GP3102624@noisy.programming.kicks-ass.net>
 <agtt2dEjS4Qg7a_P@slm.duckdns.org>
 <DIM6W7GRZK2N.14AH43S1XTFCG@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_164733_984452_95ECE6EE 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

Hello,

On Mon, May 18, 2026 at 04:26:11PM -0700, Alexei Starovoitov wrote:
> Well, this gen_pool based allocator of arena memory is a temporary hack.
> It's ok for rare allocation like in this at scx init time, but not suitable
> for active arena management. We don't need to expose it beyond scx.

I see. Peter, as Alexei is already prototyping a slab-based arena
allocator, how about keeping the gen_pool layer scx-local for now? Once
the proper allocator lands, scx can switch to it and the custom piece
goes away.

Thanks.

--
tejun


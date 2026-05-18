Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10285CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 19:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=947SOLNtyKjftx3F/FZ7uNcrN3ZeuC/GABDa4a4xvv4=; b=WMiFbnOzhtUZMPknjxXgqLKU5P
	AIrSEu0/K7fcL9oX1XbxgUAlg77C82VGh5axFxG+/9fEYUOHkld5rJeQ7g36RMCFCmUp4FEwSqO8g
	b63n2/UNuqOZPF6WbJ6KCCyfk5NLriD6qLpJnxaN7MNwKvGwFjOkhC5jQT8Z6I16XtKEJN3vM++u8
	PVOtGbeOYxvdf0fCUacgxmz73AVCHhWPXL5xpqnYKFviy5CAEox8SEQ2pNmsFJgphmN28LSN4rgRK
	9xgFrr3AQtzZUc5bavgIFKTujclxkHlOhd+MQKUAet2QpNqkL8vP+3tXJskOFj+eee0rs1FaU4043
	rQ5SLbMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP41y-0000000Go95-0BfJ;
	Mon, 18 May 2026 19:53:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP41v-0000000Go8e-3SY5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 19:53:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A661419B5;
	Mon, 18 May 2026 19:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245BFC2BCC6;
	Mon, 18 May 2026 19:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779134015;
	bh=nZ0D31rkJ58LmFaS2W1jBidt3T9eg8DSZrXA9r0f9Ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O7U/5SfC8PP4wcXOspJBnyLZb8fjuk1HP3PEPyF0HIn2Ol0sAqvYeirvFb76FXTEV
	 7bP5b9jtSmSp0lbLozkGPZzV2ePN+x3oKsnbmcjC3dGCgssQwrpbZEcc4f+Yrh9Zua
	 DriwYDD0PKgwef2oYAWjf8kFFx4pIo645Am5zxDzXKIwL0mUfQWQn+WqmrU6EUuGMC
	 4oHyw0BCaJQeh3JHzSX28eKEPukAnj95j2ZxM40kb+iIrvhAqcNHOH2uXrsebtcEn+
	 cLD/nrjnJYs4zdQz08NAjMpyWK/YGQqSjN2NP8c+cBNlGfIOS3hLZ4dA+dGnlzn/sI
	 j6XR/xgodjqmA==
Date: Mon, 18 May 2026 09:53:34 -1000
From: Tejun Heo <tj@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
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
	Mike Rapoport <rppt@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev,
	bpf@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] mm: Add ptep_try_install() for lockless empty-slot
 installs
Message-ID: <agtuPrgIDNKSu2Oo@slm.duckdns.org>
References: <20260517211232.1670594-1-tj@kernel.org>
 <20260517211232.1670594-2-tj@kernel.org>
 <9ba50fd2-077e-4291-9276-9adb18186873@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ba50fd2-077e-4291-9276-9adb18186873@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_125335_881086_747AD6A3 
X-CRM114-Status: GOOD (  11.73  )
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

On Mon, May 18, 2026 at 10:06:29AM +0200, David Hildenbrand (Arm) wrote:
> On 5/17/26 23:12, Tejun Heo wrote:
> > +static inline bool ptep_try_install(pte_t *ptep, pte_t new_pte)
> > +{
> > +	return false;
> > +}
> > +#endif
> 
> Ehm, what?
> 
> This is a very, very, very bad generic idea/interface.
> 
> On which ptes is this supposed to be used? User ptes or kernel ptes?
> 
> Surely we don't want this on user ptes.

Yeah, this is only for the BPF arena PTEs which are already managed in their
own way. I'd be happy to place / gate it however appropriate.

Thanks.

-- 
tejun


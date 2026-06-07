Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741B3CD8C89
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 20:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wIHOSWYohEmLG6pMXnfULhqgb287plk20JlAu4I5Ys=; b=M+xHyKwa++kirC9wSoxQN5LYaq
	CSbuy8OVqpfFiYh/jp5DAgOmolmM0/ExnCL4lR++nx6mOduqdDhYiFNUC3/etTFbPsgnXChWZ3UZm
	ZBSzyWBvxdEnEtskYKpDVdveMfmunE0cw9VNQl2d2lDcMt8Q44AVCwzjUPGALZgjz5fIBoQyJq++J
	i3YLBhiMIIU3SFf5lAOGMFTUK8AaPkcFuOvqpaXVuOCp0Fjuq4qRp5NI/UZ7wmSoKYk9salxibvRR
	Ywzsr3YbM5kgWf1/w+DRMYDjQTs3xk9KHFoRs+S0U1zpsO0MgcPBAScY40jyb+JmFXUSSdhJNPIPa
	xgzVfEtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWJpO-00000002T2K-1ft1;
	Sun, 07 Jun 2026 20:10:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWJpM-00000002T29-47M4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 20:10:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 13F3444281;
	Sun,  7 Jun 2026 20:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BEA1F00893;
	Sun,  7 Jun 2026 20:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780863036;
	bh=7wIHOSWYohEmLG6pMXnfULhqgb287plk20JlAu4I5Ys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bShHqSnI6oWOfUDSbW6cYy9eMbRTgUko/xyPhiYjQd4+q8UgRyl4FX9sU96QojKmj
	 7jK6GH6Y5DzVZNl/oYRof/zwlsdAgIq4fxxaZFx4NGJtrqT4D5dnzx3nfJWfCBYTOo
	 qOhK6VyjprDy5b4PtURtf5opb1bLBCMSUX9BCEzhGEFgCit94GdQXXSZ8nj/J1X447
	 DHVTof/qqRgiYNi6dpMLHS0InhtO5TGWFhmblbiv2yVcqPhabshMvd3rR4d7/yfzL6
	 CUrw06X/S8BL4t3f+hrAxCmBx9mGTYM7AciY6l3xlakeFNLHf3tkdeUpikDVPqcxDZ
	 IOF2V8sJaovvQ==
From: Tejun Heo <tj@kernel.org>
To: bot+bpf-ci@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>
Cc: david@kernel.org,
	arighi@nvidia.com,
	memxor@gmail.com,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	andrii@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev,
	martin.lau@kernel.org,
	eddyz87@gmail.com,
	yonghong.song@linux.dev,
	emil@etsalapatis.com,
	void@manifault.com,
	changwoo@igalia.com,
	clm@meta.com,
	ihor.solodrai@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] arm64: mm: Complete the PTE store in ptep_try_set()
Date: Sun, 07 Jun 2026 10:04:19 -1000
Message-Id: <1780862659.ccb18e27e916dc4b@kernel.org>
In-Reply-To: <5f68f44310d4878185fd5ebc52d66530b99f174c6d04ab1170dc53cefaa54568@mail.kernel.org>
References: <088f52fd25860ca961449d53f91b214a@kernel.org>
	<5f68f44310d4878185fd5ebc52d66530b99f174c6d04ab1170dc53cefaa54568@mail.kernel.org>
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

> Can this path actually loop, or is the deferred barrier guaranteed to be
> flushed before the faulting instruction is retried?

I don't know the arm64 paths well enough to say. What I can see is that
ptep_try_set() only runs as an apply_to_page_range() callback, and
apply_to_pte_range() brackets it with lazy_mmu_mode_enable()/disable(), with
the disable() flushing TIF_LAZY_MMU_PENDING before returning. The barriers
would land before the access is retried. It also looks like the same
queue_pte_barriers() path __set_pte() already uses. I'd defer to Catalin and
the arm64 folks on whether that actually closes the case.

Thanks.

--
tejun


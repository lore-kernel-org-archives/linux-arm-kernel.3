Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9351CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 17:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjTrDh1IYp4rFUTW3+q7qTPuVfhJVk8iFWhJhIbKVzE=; b=hhNlVddD8rrS+v7wh5rRQdpJme
	yDDND58APdNVyzoBvhh1dgh1G3R7bVAzdBs/j3318DqIHwpy0YgwaVNB2i99aJ/nlnyWEBm9PDPSf
	1WhZjm/vSpA7OKRzOyUg1eO/QEPvUcWOEct1Wmw4m7pDO31EGtVRi3rGKC+kljTYDy0YjbpWXqQiT
	kJKPqEkwNCcv1yD0ImgUgKffIuDc7biZxqj+XzC8uwVxlw4wopnp26Qw+ytSKnKVk9wn38J7C1P9f
	aJNVM2jEFJfEQaSgL+cPRjBrwYdzRkcKhYc1lPguEZ/gGeNXtCGTNl03od1TbnsBOB9KFnXqvLmWa
	pUnHknfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZB9N-0000000EfPo-3fHv;
	Mon, 15 Jun 2026 17:31:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZB9L-0000000EfPh-3pho
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 17:31:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E83B1601E4;
	Mon, 15 Jun 2026 17:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762D11F000E9;
	Mon, 15 Jun 2026 17:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781544662;
	bh=wjTrDh1IYp4rFUTW3+q7qTPuVfhJVk8iFWhJhIbKVzE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=eoam+ekJZ8hG/C57JLMcYP9+kxpo9xUz+JpGpJRAuTFMHRVCfDnK+wD8s59MgUnVu
	 ivErLfmIOPj6l741A9zGmpb8j46d5cSipkfXySONCDvt8tu/7vXZq7R6iCRqJfkwMh
	 ss09qyYEbeiU1T6GLih6b5AvGw2baikmwvqOpdzZIJ+5WaPP3FL/bw6uNvCj6auFeJ
	 sIfiVAj5X8t3b76GRBSuUWQUjXziD+HpPHmRk9CsOqKmDUlDzfpQFYnxnzfSAWZJxq
	 PkxDoTXLHTCt5/72CbkyzkJVAz345iYdyFT1KiKi0M5Pv4IfwpNEOEcPxFr2INPyeV
	 PJ4M6UMe8s0OA==
Message-ID: <31d1ac68dc230564301fc1e7dc748a1d@kernel.org>
Date: Mon, 15 Jun 2026 06:27:51 -1000
From: Tejun Heo <tj@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Will Deacon <will@kernel.org>,
 David Vernet <void@manifault.com>,
 Andrea Righi <arighi@nvidia.com>,
 Changwoo Min <changwoo@igalia.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 sched-ext@lists.linux.dev,
 bpf@vger.kernel.org,
 x86@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] mm: Add ptep_try_set() for lockless empty-slot installs
In-Reply-To: <f6e87467-2fa1-4edc-a739-9899be36196c@kernel.org>
References: <20260522172219.1423324-1-tj@kernel.org>
 <20260522172219.1423324-2-tj@kernel.org>
 <ai50IpfcvBiTZ7Ss@willie-the-truck>
 <ai8PO0NThJeuQYzy@slm.duckdns.org>
 <f6e87467-2fa1-4edc-a739-9899be36196c@kernel.org>
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

Hello, David.

> Is BPF maybe picking up patches from other subsystems up too early
> without waiting for acks?

Do you mean the comment cleanup I just sent, or the original
ptep_try_set() merge?

The original went through several rounds, and you acked the patch that
introduced both problems (258df8fce42f) before it landed.

The barriers fix came from Catalin, he raised the issue and reviewed the
fix. The comment cleanup got picked up quickly. Maybe that's the bpf
folks wanting it in ahead of the merge window.

Thanks.

--
tejun


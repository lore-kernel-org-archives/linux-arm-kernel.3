Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAE9CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 19:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcoZwd6NZEfUHZh7T//JHQ0H6dEGcLPgqCMFlRE4XCk=; b=DWMKfJXxJLu3/RD0w88vh4I2qm
	J/yLnf5DWmHBnN4njt2veDX9jTT+Kqur3i9fWDsmfhVmXP+B/F2UnuQ7Mj77oxIEKVfPsi3nCbHeE
	u2boFcTKe1Gjad0IF89GCcAXmo8EA48Vt7HDLCakAP5KCuOdSH4B7uefHCmff/0tu4Psqu4tPE6lQ
	DTQfJu2T8RIK46RY/ruTL3g9kHFRiUAQJI1ENYfvLEpcvgmj/4ZogimLbq0oudxAxnJKm+bHKOlnV
	Bqmrg2mq/P1B/8GTpM3Wos1z5MhkJq8q6aV3PUYzCV8xTOG+97u5mgBfSoTIxSO8wD+yn2TNlMCN/
	mU4Sna1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP40L-0000000GnpZ-3aA0;
	Mon, 18 May 2026 19:51:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP40J-0000000Gnoi-33g8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 19:51:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BCAAB43538;
	Mon, 18 May 2026 19:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71871C2BCB7;
	Mon, 18 May 2026 19:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779133914;
	bh=0EDZC3hd1XIo9RQYnoioqSdk6FylXyXD32g6lc8WK80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A3KTXS+Q/AEBoZ4uNfNUsQ0k+ej9XaXq69rCQFPw1ygtZW43gGcEuMye/wWE45zdM
	 YMDY+mI9YFi+aDyqPtX65ur9P0c1QLANOG7IYdZsxcU5O4TksyH0HhEMICOGFtEsDu
	 NbqOY4ZUq2HB4h+bfnVdA26kN4pBS4xYv5DFT9gazLd16W7FbrqAVkcww8+KXOp2eb
	 jkLATaJa7wZKYa7Y3RhuUVAq34sssOBxg9XNnYenpE4Kl2gYVnA293XdgSXNGs1/Y7
	 aOE88cBDoObjjaZ5K6sWE4I1ly4Ftfz3HR+tVZRTJvCijUZ6tVmR9iJuQl7V3aRIho
	 Az/hnaRVwWgCA==
Date: Mon, 18 May 2026 09:51:53 -1000
From: Tejun Heo <tj@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
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
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev,
	bpf@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] sched_ext: Sub-allocator over kernel-claimed BPF
 arena pages
Message-ID: <agtt2dEjS4Qg7a_P@slm.duckdns.org>
References: <20260517211232.1670594-1-tj@kernel.org>
 <20260517211232.1670594-8-tj@kernel.org>
 <20260518072042.GP3102624@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518072042.GP3102624@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_125155_791733_321028F1 
X-CRM114-Status: GOOD (  10.22  )
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

On Mon, May 18, 2026 at 09:20:42AM +0200, Peter Zijlstra wrote:
...
> Should this really be part of scx rather than be part of the bpf-arena
> thing proper?

It's just a layer on top of arena. If bpf folks are okay with it, I don't
see why it can't be a common utility thing on the bpf side.

Thanks.

-- 
tejun


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B4CCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 17:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJO1RcjiVrxikN4S2wMkT12NDdZvJEOL3uH9OszuZ6c=; b=3UWSkbWEW9JXbZbTT7xn/EMVbd
	LdGAVSKMf9hscIVMK0KVBYovshlhBx3+Y28Hevxug5/kVdP6Wu8JJQXTf5sgt4YO9yJ7//Yi6QFl7
	C0+NvcOnRxZttHovwxUYrIBas2iBdLJ0vMCy5FxNV42qp8xPFQL7Nu+PpWuSmGXR/hXM4FIQpUuSu
	3MjmZF4DRzk9UtM/MsGrdoXLlU0GsUTQKq3P8/rMHpttnXdtb67RKU0LDJ5JKe0qHuKKeBG2vvtSC
	9j04QuCzNkMsB9kvL33DVa15Jq+bGBYWe77DYZFhZsT0I9yboHOgiRIFQhciaWXquq1FXezmcMyWU
	cq2Z5U6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ7NC-00000008fUs-1iNH;
	Thu, 21 May 2026 17:39:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ7NB-00000008fUT-3Cd3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 17:39:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C92F260098;
	Thu, 21 May 2026 17:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522EE1F000E9;
	Thu, 21 May 2026 17:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779385192;
	bh=oJO1RcjiVrxikN4S2wMkT12NDdZvJEOL3uH9OszuZ6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Un7uQ1trx83eYUwW4uPp58qqvs/tOPLwPdqNWzVDB8TdjlrZg3PYemqiyguS3thAl
	 r5RMzSbCtDUCq1L5OYI8C19bFj43M0ei0laqWrel3mO9LzNY0PA/u8Ptgb2zjXkot2
	 eoZz4Kddz0tCIF+7fHSC4xxd2IiIXm2k+VY+P+lIsIDTjHT2/7ZXPguRju+yNr0L+f
	 pFtwpqfwkaItBOWCFBjHxFXJTPs51yxkfBgXyyyf7J3iVxNSXdfyacp6+G8MEDGXxr
	 FX3BkCtVScCsW3lP3RgenIgDaBUVQx1qv4re9v+xWcd0RfpNKUveGA3TM05F1+LFKb
	 tJVgWkvmEwd9Q==
Date: Thu, 21 May 2026 07:39:51 -1000
From: Tejun Heo <tj@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
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
Subject: Re: [PATCH 2/8] bpf: Recover arena kernel faults with scratch page
Message-ID: <ag9DZ84OyofILjHM@slm.duckdns.org>
References: <20260520235052.4180316-1-tj@kernel.org>
 <20260520235052.4180316-3-tj@kernel.org>
 <DIO99FYEHNC1.23KFEHRPTRB5N@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DIO99FYEHNC1.23KFEHRPTRB5N@gmail.com>
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

On Thu, May 21, 2026 at 02:42:50AM -0700, Alexei Starovoitov wrote:
> On Wed May 20, 2026 at 4:50 PM PDT, Tejun Heo wrote:
> First 5 patches lgtm. Should we create a stable branch out of them
> and pull into bpf-next and sched-ext trees?
> I'm preparing a followup for slab-over-arena on top of these changes.

I just posted a new version of the first patch w/ comment update. It'd be
great if we can make forward progress.

Thanks.

-- 
tejun


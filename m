Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0038CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 19:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dii3jeukr9ExIOwor2LDBx6O9OEuTAMnAAZyBHgb1+k=; b=Gj+6HrYgRyeIzfU/tNX0bYragK
	MX0Pru86lNkQdF9Wv1/HrGL5npglkcHRNMkCft9JAsmdIamFfr1kbASBN/ebBU/jr533hvBR4uIsI
	/3UScdwbXVuoXncfGlQlk7pYOPakb/dSUSSmCxHXZpvOKjt7zbesn3fTto+S/+HdOoJe3WFC/+kOy
	dgg5SsjokeC8+9EiIWJBp/gycW7zeEZwNEYCHZlSEi8h0/Z7qd5gIx/cIBK7nToXgJjSauLY1O/ZY
	lp8VwkBRvoauj1jDnWjImFcyOSiiwWV8yn6y36VuHu/M6+QF32iH647kWFPyPpyRQnfyhqbzgOFIi
	waT0eU4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRbNc-00000000MoJ-2xK6;
	Mon, 25 May 2026 19:54:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRbNa-00000000Mnt-3vgG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 19:54:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9068040630;
	Mon, 25 May 2026 19:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1241F000E9;
	Mon, 25 May 2026 19:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779738865;
	bh=dii3jeukr9ExIOwor2LDBx6O9OEuTAMnAAZyBHgb1+k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SqGm8cyerm1SAKBPfWzdO911EPlHOkLgLQxNL2YxIKlaa2m0/wIkdLGaWuQk+uw3A
	 G0G816Zc+XLJqqK1siV/8whKehjGCchy2oHMQybI8D6VxAGgQVAUZ+vcgQRLeAYQye
	 dWwIkfUAttGN+Wsn0GfAh/zvhzjAP/ItOgIemH25wTluWa6DsZan0Y76olOHNS5Sr4
	 1O6OhHpe8Tujbolu0VpDx2Iq0Hz5cjSu60j0wNILiZ92QyrouncjKvYvJS4zM4WeC8
	 xq9487/+ZwKDyziuUXNXpYKOVQwNYYTPa2ufLfi6pMzaq7gRCTDprZ0o9epjoJI8jG
	 zQZEOSY357XFw==
Date: Mon, 25 May 2026 09:54:24 -1000
Message-ID: <240ca6a938e38d2af591f09a721d6e9f@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
 Changwoo Min <changwoo@igalia.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>,
 sched-ext@lists.linux.dev, bpf@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCHSET v4 sched_ext/for-7.2] bpf/arena: Direct kernel-side
 access
In-Reply-To: <20260522172219.1423324-1-tj@kernel.org>
References: <20260522172219.1423324-1-tj@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_125427_000785_0A9F0568 
X-CRM114-Status: UNSURE (   4.79  )
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

Patches 1-5 went through bpf-next and are pulled into sched_ext/for-7.2.
Applied 6-8 to for-7.2.

Thanks.

-- 
tejun


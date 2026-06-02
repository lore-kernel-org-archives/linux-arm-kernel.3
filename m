Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B467CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 22:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GC8FjW8eAZZqSEHEtIR7QWUFGmOxnTJ1Nu6ikhwgeQA=; b=IOc3IyU5bMdB06vaLOUzKEYqY+
	T9feOFx2q1FowwtvwRo39++0OsB4SLXOWZcC4GFC9xHCZvrd0TurQHmQ8hGoTqS9QSXkKpGurm57d
	pMNIM+skmOzqEgVFpLrCDh56VIA8bIQ93bqdzgv5d/QRJEBjTpBDu69AkcjrwfE2MYn1B4CFjk3v+
	LkoaXfX225IfXyef5ohm9MGxy3aIlBy/Vis3B3k4myam9PeLrJdjXmtx+m4jxzNS1ElEvbsrvUNDz
	KNwnKgBb5qg70bfF472Z89IlMK6H+5m5AjDoNLdtkMmYmwlwx0tJuVal2NSUFdMWohEuF90p9IFw7
	7tlWikhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUXIS-0000000DrwK-0gaZ;
	Tue, 02 Jun 2026 22:09:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUXIQ-0000000DrvT-1qDI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 22:09:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 255BA4454F;
	Tue,  2 Jun 2026 22:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D634F1F00893;
	Tue,  2 Jun 2026 22:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780438153;
	bh=GC8FjW8eAZZqSEHEtIR7QWUFGmOxnTJ1Nu6ikhwgeQA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LezzoyJOYE8E5dHI2kTrX2OlVW8csGBo71kbltsEIXgUg7b3ekMDmNG6Bb/sOKisP
	 mBAFZPTtkKRnHQD4pmKo5hbhuMNRyNUbc3HkAm4ILzgTZJrmEO2mPVL83QV0lxShjh
	 p6zpwO8u9X+6fFWJDWQSKUAh5SKN43wkDR4DLRaQ00acWtw+On1hfmIWtMot7YOGsO
	 xUGHWBXkhk/Ujm73YVH8nRDI4SCq8HH8XZzGujRj1bbkqOfqznKCS52wriKePD8x2X
	 bcEt7+QCl4d/m8RdICey8u64NsLkzsUmcx99k6ZMKkmFyW+YpDiE98wvCCVl1FJfyo
	 gAdpWQlO7N+AQ==
Date: Tue, 02 Jun 2026 12:09:11 -1000
Message-ID: <8f133924fbf8d259340f3057e505f663@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: bot+bpf-ci@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	ast@kernel.org,
	andrii@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev,
	memxor@gmail.com
Cc: peterz@infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	rppt@kernel.org,
	emil@etsalapatis.com,
	sched-ext@lists.linux.dev,
	bpf@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	eddyz87@gmail.com,
	yonghong.song@linux.dev,
	clm@meta.com,
	ihor.solodrai@linux.dev
Subject: Re: [PATCH bpf-next] bpf: Replace scratch PTE atomically when allocating arena pages
In-Reply-To: <f45f02410d23c99d14f3577da9b27a327816b5a0904bdeefc8e229eac760d1cf@mail.kernel.org>
References: <20260601183728.1800490-1-tj@kernel.org>
	<f45f02410d23c99d14f3577da9b27a327816b5a0904bdeefc8e229eac760d1cf@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_150914_496208_FB4BEAD7 
X-CRM114-Status: UNSURE (   5.51  )
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

On Mon, Jun 01, 2026 at 08:15:34PM +0000, bot+bpf-ci@kernel.org wrote:
> After the real page is installed without a flush, can that stale
> kaddr -> scratch_page translation persist, so that later kernel-side
> accesses at kaddr reach the shared per-arena scratch page instead of
> the freshly allocated page?

It can on x86, but it's harmless: that CPU faulted on an unallocated
address and got scratch-recovered, so reaching either the scratch or the
real page is fine. No flush needed.

Thanks.

--
tejun


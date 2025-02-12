Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0651C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 23:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jiM6ImE8fTUfJoD38zZ2Ia5swkL4PxQ37cjswjPn7ZA=; b=ZgLZtjQLLOw+zd1GF4+2m+PUur
	0c5Pp7nkwpjGpuQ2W4dY5v4zGdbWpFuov8TSB7/KYQOKWVed9kKKS6F9OiHu4dcuLKWkuefYcvKqj
	2O4xzCTjiizDuoRTbK7pPQ6gXvtJK986DU7NK/rURLd9R1RtHJuoKPWuEjcNTCcLO9WjhbhLAJddN
	wJhuN9tZhanZC0QegbouCPg5F8+C6+0SMSWt8hiZAqGcDIn7xOYsGNR5/lJhEaD347By8IZXfspmm
	C3kvQnqFEQBweVgG/lhqZWVpK1h3fhlyrm72Bngft/myE7nWrXCLdqzigCAhcvkyGjwT94rMZzY4Z
	FIxBTFbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiMVi-00000009Dax-3fAl;
	Wed, 12 Feb 2025 23:51:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiMUH-00000009DNm-224E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 23:49:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 374105C6319;
	Wed, 12 Feb 2025 23:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B14C4CEDF;
	Wed, 12 Feb 2025 23:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739404188;
	bh=FGFJHoLpbX4ySRnxs3bfJkdLdlmxhJIsYSNovBRH/qY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ceKxZu1jn6eoyI8R1Jdqmo8izXjI15NYJ+bvYiFJPlkFiSauSqexaCKdbElLr1uCc
	 mFC8xlRJcLyxMVQJCyStPbdTNUcfCkNXTyJlO/eoBDE83k/RaH6NkHFNchBKz5Ito4
	 rbON7EKyXBSVM0dUu2DU1XLFmahq0dEaYXeEXAnBkjk8EVHGvAp1GNHpIxfVyS0djJ
	 dJlHjz/RLz1mrEs8GYYOUBAuGn2ETTc/A9C9uQwAgBUjs0j+7ov1e7yMq0VIXG/H2t
	 i4JPJAcmRi33/f7Q+i+AVg3hLywiWQE8oNUDd72oeZ9UZL6aijYKIETYbZu8MtjP7w
	 W1NKQCDWPA6ew==
Date: Wed, 12 Feb 2025 15:49:46 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Cc: Weinan Liu <wnliu@google.com>, Steven Rostedt <rostedt@goodmis.org>,
	Indu Bhagat <indu.bhagat@oracle.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev,
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>,
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org, joe.lawrence@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	Puranjay Mohan <puranjay@kernel.org>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
Message-ID: <20250212234946.yuskayyu4gx3ul7m@jpoimboe>
References: <20250127213310.2496133-1-wnliu@google.com>
 <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_154949_578876_F86F5A6C 
X-CRM114-Status: UNSURE (   7.98  )
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

On Wed, Feb 12, 2025 at 03:32:40PM -0800, Song Liu wrote:
> [   81.250437] ------------[ cut here ]------------
> [   81.250818] refcount_t: saturated; leaking memory.
> [   81.251201] WARNING: CPU: 0 PID: 95 at lib/refcount.c:22
> refcount_warn_saturate+0x6c/0x140
> [   81.251841] Modules linked in: livepatch_special_static(OEK)
> [   81.252277] CPU: 0 UID: 0 PID: 95 Comm: bash Tainted: G
> OE K    6.13.2-00321-g52d2813b4b07 #49
> [   81.253003] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE, [K]=LIVEPATCH
> [   81.253503] Hardware name: linux,dummy-virt (DT)
> [   81.253856] pstate: 634000c5 (nZCv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> [   81.254383] pc : refcount_warn_saturate+0x6c/0x140
> [   81.254748] lr : refcount_warn_saturate+0x6c/0x140
> [   81.255114] sp : ffff800085a6fc00
> [   81.255371] x29: ffff800085a6fc00 x28: 0000000001200000 x27: ffff0000c2966180
> [   81.255918] x26: 0000000000000000 x25: ffff8000829c0000 x24: ffff0000c2e9b608
> [   81.256462] x23: ffff800083351000 x22: ffff0000c2e9af80 x21: ffff0000c062e140
> [   81.257006] x20: ffff0000c1c10c00 x19: ffff800085a6fd80 x18: ffffffffffffffff
> [   81.257544] x17: 0000000000000001 x16: ffffffffffffffff x15: 0000000000000006
> [   81.258083] x14: 0000000000000000 x13: 2e79726f6d656d20 x12: 676e696b61656c20
> [   81.258625] x11: ffff8000829f7d70 x10: 0000000000000147 x9 : ffff8000801546b4
> [   81.259165] x8 : 00000000fffeffff x7 : 00000000ffff0000 x6 : ffff800082f77d70
> [   81.259709] x5 : 80000000ffff0000 x4 : 0000000000000000 x3 : 0000000000000001
> [   81.260257] x2 : ffff8000829f7a88 x1 : ffff8000829f7a88 x0 : 0000000000000026
> [   81.260824] Call trace:
> [   81.261015]  refcount_warn_saturate+0x6c/0x140 (P)
> [   81.261387]  __refcount_add.constprop.0+0x60/0x70
> [   81.261748]  copy_process+0xfdc/0xfd58 [livepatch_special_static]

Does that copy_process+0xfdc/0xfd58 resolve to this line in
copy_process()?

			refcount_inc(&current->signal->sigcnt);

Maybe the klp rela reference to 'current' is bogus, or resolving to the
wrong address somehow?

-- 
Josh


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4CCE95375
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 10:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a8sEp2rrQWLyGRRnZjwYD6KJ38E1O463IcDN5Ricygs=; b=hrMQH53bxiFe9/Jq91/09zDiLT
	FaKC5acByespVz1e6vYbcniIwP93E7N7pW3DNB9KuhZB92+mmaTfSjQeZQxXo4K7GGQ6vJsXvp3o6
	BdruLeDoHqgGFFjPcWAgr06IfztzYKbG9gCgtg+D3Ymfr/EjXsXLYbGeYEcil8gqe6s6AJP0Fwxcs
	/wTq7QcmL/NkaunKqONXES8aBXIqsLUfwwbEGso85JLb13SDx+1yUS9FF9SUSI3fAX1wR5cH4n4WX
	dsTUuSvFVPuZ+pOEy8HxVKs7XZXQ6UbtbFI5ox9SFdyS1Xi99/NWDjVtt1TSoMX3/30hCnIZLuD3X
	V7pG3rFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnaIO-00000008IUz-3Csh;
	Wed, 04 Feb 2026 10:39:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnaIN-00000008IUg-2PGT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 10:39:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 89F7A6012B;
	Wed,  4 Feb 2026 10:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E9CC4CEF7;
	Wed,  4 Feb 2026 10:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770201578;
	bh=jWq9hzFrHn4T0n/HkYPD0UMv27FmeuY0AJk3lrTEpgg=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=td6G3Ueyt9785VTOqQpQ1qDCNtWh4EIIq2k7oN3izFRukPxS8bE8VtXwyVFOk/qTB
	 IuhNla7cwOkfGGcQMY3Wm7aAOVxGjGOSS8kZEIARYbWMo99zrx6dx+n8xTHMed11Je
	 I04yrGUhFA1hs+dIEQigixrZmdMWgOB+4hUVwnPDGQ+vJpX1HrO9xVu2hUE+ft9hML
	 yYauzvTd8NT4xRUvHU4gJBaAk25bzyFymQUg0qhaeAdn7xMtK8UcipfBdudOkgIpZI
	 g/d7NrjEwbuoedp9i1NcRre823hhg5KPSklBpea4yfcxdpQRzl+zHbrjkity/Jp8ZR
	 Bh0wWcsZK/ydw==
From: Thomas Gleixner <tglx@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, shuah@kernel.org, kees@kernel.org,
 luto@amacapital.net, wad@chromium.org, kevin.brodsky@arm.com,
 akpm@linux-foundation.org, charlie@rivosinc.com, ldv@strace.io,
 anshuman.khandual@arm.com, mark.rutland@arm.com, ryan.roberts@arm.com,
 thuth@redhat.com, song@kernel.org, ada.coupriediaz@arm.com,
 broonie@kernel.org, pengcan@kylinos.cn, liqiang01@kylinos.cn,
 kmal@cock.li, dvyukov@google.com, reddybalavignesh9979@gmail.com,
 richard.weiyang@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v12 00/13] arm64: entry: Convert to Generic Entry
In-Reply-To: <2699bcdc-8d56-7fe9-fa9a-a3d61476e806@huawei.com>
References: <20260203133728.848283-1-ruanjinjie@huawei.com>
 <87bji552uk.ffs@tglx> <2699bcdc-8d56-7fe9-fa9a-a3d61476e806@huawei.com>
Date: Wed, 04 Feb 2026 11:39:34 +0100
Message-ID: <87y0l823o9.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, Feb 04 2026 at 09:28, Jinjie Ruan wrote:
> On 2026/2/3 22:16, Thomas Gleixner wrote:
>> On Tue, Feb 03 2026 at 21:37, Jinjie Ruan wrote:
>>> Currently, x86, Riscv, Loongarch use the Generic Entry which makes
>>> maintainers' work easier and codes more elegant. arm64 has already
>>> successfully switched to the Generic IRQ Entry in commit
>>> b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"), it is
>>> time to completely convert arm64 to Generic Entry.
>>>
>>> The goal is to bring arm64 in line with other architectures that already
>>> use the generic entry infrastructure, reducing duplicated code and
>>> making it easier to share future changes in entry/exit paths, such as
>>> "Syscall User Dispatch".
>>>
>>> This patch set is rebased on "sched/core". And the performance
>>=20
>> Why are you using sched/core, which contains a lot of unrelated
>> changes. core/entry is the one which has the prerequisites and nothing
>> else....
>
> By the way=EF=BC=8Cit looks like core/entry and arm64 for-next/entry have
> diverged: the first three patches of this series are already in arm64
> for-next/entry but missing from core/entry.
> Perhaps the two branches should be reconciled so that both contain the
> same baseline.

The first three patches of this series are ARM specific and have nothing
to do with the queued core/entry changes in tip. They are independent of
each other and these three ARM64 changes have no business in my tree.

If the ARM64 folks want to apply the rest of your series then they have
to pull the core/entry branch into their for-next/core branch first so
the whole thing builds.

But given that the merge window opens on sunday, this is probably moot
anyway and the rest of this series can go on top of rc1 in the ARM64
tree w/o any further complications.

Thanks,

        tglx


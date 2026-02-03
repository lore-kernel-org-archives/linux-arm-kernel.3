Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B81E87835
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 14:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zam1ZD1A+PoOm0WPOB3rGE8poSwUMpV98xoTtBaj0x4=; b=4eXfeEv8ESLWyXc7dG3CMyblRo
	hvOvMfcr+3r319jlYBgMoopn66ZBom6QaYjFYmQoNJIROj3QGdQ4+v8RdfMAxVVQi/uT7QrbVhBWZ
	sL66IbkvD171X+EAyrHrry/jFxDQBc7vqSFjl+zGfNw39xPHnp2JIanDtLMgSgLO/pxcRXyjihgsY
	4VWqLZOKbijo/69ABKrH08exb9cxOKTdtwB7NtBITZGjEYTFkG7Widwk5KpPqV653vlCTOJk7GrlR
	THg9sjDNhY39/jRMTCmlSHro9tXiMEpvnGVO7DnhU4PD+uF/p18ZbpWT9oza0QP1B67x4afqQQ8QS
	o/g68IEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHDA-00000006jzy-3XsX;
	Tue, 03 Feb 2026 14:17:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHD8-00000006jzS-0zvc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 14:16:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0022E44192;
	Tue,  3 Feb 2026 14:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A20C116D0;
	Tue,  3 Feb 2026 14:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770128215;
	bh=zam1ZD1A+PoOm0WPOB3rGE8poSwUMpV98xoTtBaj0x4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QZMobXiyLkOcySOAwBTdVMHFtfmDobs8TrkIhE1Q2WnUEzAc/aatxUKA4cnpszgDX
	 SjRVCF1MUd9aWGjcLwcIR9idOw77vZNpFCo9nwdTtF5lkXiegJbEny/7g75+J6E1zp
	 zXtk1XtEJ7tBGO1gLlrwDDcYAp0DvAIJkWWlOtVz4c60pYBRtVnc/D7jDHDbvpPrV6
	 ud6o+8kcgSOB1vkHQNnjVlSPdL0SXVeL/UOXBPFNWnvtBECuoXZq0NPWhlpjIVSyd/
	 iwjNJidV9dF5dXxPaBKsgamZEvVzNTe+FF1J+urLZtdZ5n/GlRVNF3dK4ElCBOgWnM
	 tHbvUsDisodPQ==
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
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH v12 00/13] arm64: entry: Convert to Generic Entry
In-Reply-To: <20260203133728.848283-1-ruanjinjie@huawei.com>
References: <20260203133728.848283-1-ruanjinjie@huawei.com>
Date: Tue, 03 Feb 2026 15:16:51 +0100
Message-ID: <87bji552uk.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_061658_350313_5C2D3C49 
X-CRM114-Status: GOOD (  11.12  )
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

On Tue, Feb 03 2026 at 21:37, Jinjie Ruan wrote:
> Currently, x86, Riscv, Loongarch use the Generic Entry which makes
> maintainers' work easier and codes more elegant. arm64 has already
> successfully switched to the Generic IRQ Entry in commit
> b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"), it is
> time to completely convert arm64 to Generic Entry.
>
> The goal is to bring arm64 in line with other architectures that already
> use the generic entry infrastructure, reducing duplicated code and
> making it easier to share future changes in entry/exit paths, such as
> "Syscall User Dispatch".
>
> This patch set is rebased on "sched/core". And the performance

Why are you using sched/core, which contains a lot of unrelated
changes. core/entry is the one which has the prerequisites and nothing
else....



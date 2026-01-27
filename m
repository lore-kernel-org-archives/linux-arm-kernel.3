Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDA9D2F000
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 11:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTb2RIsBURPVtJQ7QtJjGjUPrWMd3bnlruNprEcm10U=; b=GoEXPlHmqRFENcckL6a1VjSUmV
	hOsgXJj4DlmJNK/lNKgl3dAJzhbNA9X1QSiv3UTCRHgLmZuKSD3nHvDP5o35SjddpqvhH57PfU3jn
	2D390LEmJ3Vwiicd27OOrGqh0k4AF70FS2w3jqiZWuDZUSPbc3xeHjMZSXAm7h7GC0XLCXyNZH4BN
	XGwtFUML6TAeaD5OOQ840JpaKlL8UHffqQYfnRAL7X1e5bRQDqC8Beo9e25xtSuUmlpt5DMli4IiY
	yeclsZ49otN4/3WH2ud9OwkuzJWXx7GNqQ59ezb4nguoTn75eZJBFtwPmuN8behNz+afaUZs8314D
	iVTbSIlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhQ2-0000000EAfU-3cha;
	Tue, 27 Jan 2026 11:39:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhPz-0000000EAeY-0yDD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 11:39:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CFDF600AA;
	Tue, 27 Jan 2026 11:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232B1C16AAE;
	Tue, 27 Jan 2026 11:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769513974;
	bh=hPUb1Sf/Y+o1iHyYT+qaHgmrkVOaEBAa48umHaclhUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KsKjy2P1I4kpNU/SaUK3hQAAzsAQL0KnMZT7g9kSE29HhGgoDkANSZDKlEry1k8uA
	 mhs1g6ZR2DIkivh/7zkCiGhq0K336psB2fT91va7/qZpNuGLv+lnLevZHg+rYogr7w
	 Cot43YaE9jgvWKbgfWqG7OaYVlzi5GuY7pMOKSTkZCCvMPjTspcYKT0Daba/gnDN3o
	 4cLX5kwEraDJ+3XL8CUf16Dcb0LunODG2opMgEb9kS2j3OU1GHcmFPIzrvugyGI+sM
	 HwhAKkhFxENwSYAG0apeN4Kkoimbkwt51XH5Nh/Hn33t/tzpsq6xVtMNG/M7lXAahc
	 KkwL0aRctMLBw==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	oleg@redhat.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	shuah@kernel.org,
	kees@kernel.org,
	wad@chromium.org,
	kevin.brodsky@arm.com,
	macro@orcam.me.uk,
	charlie@rivosinc.com,
	akpm@linux-foundation.org,
	ldv@strace.io,
	anshuman.khandual@arm.com,
	mark.rutland@arm.com,
	thuth@redhat.com,
	song@kernel.org,
	ryan.roberts@arm.com,
	ada.coupriediaz@arm.com,
	broonie@kernel.org,
	liqiang01@kylinos.cn,
	pengcan@kylinos.cn,
	kmal@cock.li,
	dvyukov@google.com,
	richard.weiyang@gmail.com,
	reddybalavignesh9979@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v10 00/16] arm64: entry: Convert to Generic Entry
Date: Tue, 27 Jan 2026 11:39:11 +0000
Message-ID: <176951031735.722772.3896025304943173435.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222114737.1334364-1-ruanjinjie@huawei.com>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 22 Dec 2025 19:47:21 +0800, Jinjie Ruan wrote:
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
> [...]

Applied first three to arm64 (for-next/entry), thanks!

[01/16] arm64: Remove unused _TIF_WORK_MASK
        https://git.kernel.org/arm64/c/e7e7afdc7c14
[02/16] arm64/ptrace: Split report_syscall()
        https://git.kernel.org/arm64/c/741a9000173a
[03/16] arm64/ptrace: Return early for ptrace_report_syscall_entry() error
        https://git.kernel.org/arm64/c/a3386301667e

I know it's a drop in the ocean, but they look good to me and it saves
you from having to carry them over.

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


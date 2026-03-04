Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1174EF9014
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 16:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=macyhxl6gWt7A+tN06H7vrQVbiKfShkN9MEbSqYp2Iw=; b=CGrTT9czffY9915UPwEV2UYr/e
	ZaijO48irWvz/JvAJsdb+gxxz/SRvqtUbpkfhqUFveoDiLIYeL/AEkPCgmRYQug1G2bVCcwjoSTFa
	XoorvLf9o09LuVlZXwnUDLAxkLCq+7DhK2eOKXDm610atNU71bpA0L+IDDrXqiMSemOc8VPr55y28
	S56FUQMItGy+FNR5UjNWvSGJIzFKuoJkeq+jv/8iF4Ixsuq6eQHzUVVtVoPF7SOzY9M/5gqkSxh+H
	B/I7miKXBB9ysq/BkWMr3zA2ZKc4H43QjO0HIuE1qazIbFtpXssMNjacM3vEtryVKtD0TzgC/BtLs
	MuRZulpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpZ3-000000006vW-2Rdj;
	Wed, 04 Mar 2026 16:59:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpZ3-000000006vN-0b2q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 16:59:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34266600AE;
	Wed,  4 Mar 2026 16:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A60AC4CEF7;
	Wed,  4 Mar 2026 16:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772643551;
	bh=Q8SF8PpVcEqwHhE9zkoJiQiPPmkXeROWc4tmofM8UVY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WdQ5E4L/cKkiRXoolcP5h9Jy1bYgUCo5JYR06rotiss6DMec7ZC76HNf2gD9yx4N9
	 Qhghpz4YTlKcmxQK/AlcQDm+/10caQKnC2giO8soMyPWtALup2EwgID679xYCRzkb7
	 lEt3GpFmMNsq4UvTsyyuvC8Kme/D5jMEKfs5eKl+TXiIGZdvXDZTJD3Wgxpi2qoWVP
	 RbbLfdyhVb5MTRSJSPZ9NUK35ayoAc5iqrQfpqb1DYejWsOLLnOFzbnnHKe8IKXhuQ
	 xMJ4p3155LEPn7jcdJKnyLfvM3WhYgdzgE58v6BJZIqcI42ap6v6MsfDF4K2Sv3hkt
	 bg61ahlvPWZwQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Jianpeng Chang <jianpeng.chang.cn@windriver.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] arm64: mm: Add PTE_DIRTY back to PAGE_KERNEL* to fix kexec/hibernation
Date: Wed,  4 Mar 2026 16:59:02 +0000
Message-ID: <177263478917.2652582.12486871570942949010.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260227185544.1482632-1-catalin.marinas@arm.com>
References: <20260227185544.1482632-1-catalin.marinas@arm.com>
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

On Fri, 27 Feb 2026 18:53:06 +0000, Catalin Marinas wrote:
> Commit 143937ca51cc ("arm64, mm: avoid always making PTE dirty in
> pte_mkwrite()") changed pte_mkwrite_novma() to only clear PTE_RDONLY
> when PTE_DIRTY is set. This was to allow writable-clean PTEs for swap
> pages that haven't actually been written.
> 
> However, this broke kexec and hibernation for some platforms. Both go
> through trans_pgd_create_copy() -> _copy_pte(), which calls
> pte_mkwrite_novma() to make the temporary linear-map copy fully
> writable. With the updated pte_mkwrite_novma(), read-only kernel pages
> (without PTE_DIRTY) remain read-only in the temporary mapping.
> While such behaviour is fine for user pages where hardware DBM or
> trapping will make them writeable, subsequent in-kernel writes by the
> kexec relocation code will fault.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: mm: Add PTE_DIRTY back to PAGE_KERNEL* to fix kexec/hibernation
      https://git.kernel.org/arm64/c/c25c4aa3f79a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


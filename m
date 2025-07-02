Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E85C83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 18:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4x19Ee8t3WsLxcyJ7lFcYnif9M6RrnmWoakf6Uouvtk=; b=LIXeBi7dObYAeeyQR3NTQiP0gD
	nGNQ2x/vIsQGPmM0iivRBbBGSK+ZrnebGNKY9XBIfo/ilU5wwbBN455bZEEOZqFg1vGwHHriiKWHx
	gy+mUFSIYJ+Wggh8hIPigKY4tJ38PMUBB8bGfasbGvFZ+lF56tWwHDKJDym82jZo9wIRSHb1jIwW+
	bLgAhUFZiQY0OXl+SQLsA7kQLJtE2OPWuSwehQlNgS8iZUh0oUh2hSBCFHr+AOrbuEQNcCNfgkCYz
	BQ/Ri0oHYkAHzsOdm+WTAL9HbkbmOL0Kdmq55IAkyEI6BphZwnI9J6QZ7M8UQaCIqCMVjn3m1xRYD
	igQC9Uug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2OW-00000009IlF-3AJB;
	Wed, 02 Jul 2025 18:41:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2I6-00000009HnS-0im0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 18:34:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 90B97445F4;
	Wed,  2 Jul 2025 18:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937CDC4CEE7;
	Wed,  2 Jul 2025 18:34:38 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	akpm@linux-foundation.org,
	surenb@google.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 00/10] support FEAT_MTE_TAGGED_FAR feature
Date: Wed,  2 Jul 2025 19:34:35 +0100
Message-Id: <175148125053.2930777.15499665158759959456.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618084513.1761345-1-yeoreum.yun@arm.com>
References: <20250618084513.1761345-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_113442_226309_C3AB4FC8 
X-CRM114-Status: UNSURE (   9.54  )
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

On Wed, 18 Jun 2025 09:45:03 +0100, Yeoreum Yun wrote:
> The FEAT_MTE_TAGGED_FAR feature provides support for
> reporting all non-address bits during a synchronous MTE tag check fault.
> 
> This patchset extends the reporting tag to include
> not only the memory tag (logical tag) but also the address tag via
> si_addr when FEAT_MTE_TAGGED_FAR feature is supported.
> 
> [...]

Applied to arm64 (for-next/feat_mte_store_only), thanks!

[01/10] arm64/cpufeature: add FEAT_MTE_TAGGED_FAR feature
        https://git.kernel.org/arm64/c/66984536899f
[02/10] arm64: report address tag when FEAT_MTE_TAGGED_FAR is supported
        https://git.kernel.org/arm64/c/7c7f55039b8d
[03/10] arm64/kvm: expose FEAT_MTE_TAGGED_FAR feature to guest
        https://git.kernel.org/arm64/c/61eae495da68
[04/10] tools/kselftest: add MTE_FAR hwcap test
        https://git.kernel.org/arm64/c/49a9942ff80c
[05/10] kselftest/arm64/mte: register mte signal handler with SA_EXPOSE_TAGBITS
        https://git.kernel.org/arm64/c/cfafa517c9e6
[06/10] kselftest/arm64/mte: check MTE_FAR feature is supported
        https://git.kernel.org/arm64/c/2e3e356560ef
[07/10] kselftest/arm64/mte: add address tag related macro and function
        https://git.kernel.org/arm64/c/ed434c6e0813
[08/10] kselftest/arm64/mte: add verification for address tag in signal handler
        https://git.kernel.org/arm64/c/49cee364c866
[09/10] kselftest/arm64/mte: refactor check_mmap_option test
        https://git.kernel.org/arm64/c/64a64e5d12f0
[10/10] kselftest/arm64/mte: add mtefar tests on check_mmap_options
        https://git.kernel.org/arm64/c/d09674f98cdb

-- 
Catalin



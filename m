Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA4ECAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZyRMAGtJGacuQdFaM0nSr2jQ1lkMUltkxxjZY/sGCQ=; b=rHvFSuRBpnuS2am0B19HhXs02d
	99IUkhrWgjlAHRKu6SFkVtcKksgPsAkQ0bWy3sHoz2WhYucnj8N79OOu4PmQKcELVL2aUXl+dBHAD
	iavuL5+BxkPbGuXKWr7g4dMZ/6zo+bShOi444aSfiV3ayxnfjFQEVJlH5nJXn11SNbNwG1bOasJ1D
	10QJ+WkwgSrw1BadVDPFwBFE85FrLSGFmz2ZPizSJINczQZyYAizP5hwzJkvmLnVd7eMG3x2cRUQs
	NGQB0YpJHm2y6KzaOVabPjVMvS2qnAYDN0UGGA0NyMjhDDsJzRogJMSNEBhqlCjzuIEWE/s2IizHx
	DenTDKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLtm-00000001B7f-3Ram;
	Thu, 18 Sep 2025 21:10:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLta-00000001AxG-0C3e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:10:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 777EF601EE;
	Thu, 18 Sep 2025 21:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8B7C4CEE7;
	Thu, 18 Sep 2025 21:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758229825;
	bh=jKkcmf3MDfbgYuwWGn6u6Q37sQo63v9wUZb8rTdwbcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kdoP1WsYZzMmLUBAA/L36XxB9IEcVc4Z3/ChXrxWDhNsJZJzU3SIc6TS2LkVInryU
	 tVochwRrdRZdIIdxdorpyqRVl+mGLXr55YDmTdu95nHE/JWnwHuxD+/fVTdWmvhm2i
	 6LDGQnf6YW+KYWmnCOFrMmX3GvFaPoTYiFMkhDRmYJ5Ozf+V44WmhS24veu9DGogg7
	 UK14SwgRtDoiHI8l/XXxGjxXg/JvpNDz6zCXDE5S/s93DO+Sw0bsAbP/nSEjlkwS/+
	 Ccmvj9xhlgLfoch+tRE/ZqhgwmP39qNFB/c2K8tAJB5QkzUaekiVd5CNy9Gldhfi92
	 qsolnw97+XVpg==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	ryan.roberts@arm.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	lorenzo.stoakes@oracle.com,
	ardb@kernel.org,
	dev.jain@arm.com,
	scott@os.amperecomputing.com,
	cl@gentwo.org,
	Yang Shi <yang@os.amperecomputing.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v8 0/5] arm64: support FEAT_BBM level 2 and large block mapping when rodata=full
Date: Thu, 18 Sep 2025 22:10:08 +0100
Message-Id: <175822779944.710258.10028837182267037801.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250917190323.3828347-1-yang@os.amperecomputing.com>
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
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

On Wed, 17 Sep 2025 12:02:06 -0700, Yang Shi wrote:
> On systems with BBML2_NOABORT support, it causes the linear map to be mapped
> with large blocks, even when rodata=full, and leads to some nice performance
> improvements.
> 
> Ryan tested v7 on an AmpereOne system (a VM with 12G RAM) in all 3 possible
> modes by hacking the BBML2 feature detection code:
> 
> [...]

Applied patches 1 and 3 to arm64 (for-next/mm), thanks!

[1/5] arm64: Enable permission change on arm64 kernel block mappings
      https://git.kernel.org/arm64/c/a660194dd101
[3/5] arm64: mm: support large block mapping when rodata=full
      https://git.kernel.org/arm64/c/a166563e7ec3

I also picked up the BBML allow-list addition (second patch) on
for-next/cpufeature.

The fourth patch ("arm64: mm: split linear mapping if BBML2 unsupported
on secondary CPUs") has some really horrible conflicts. These are partly
due to some of the type cleanups on for-next/mm but I think mainly due
to Kevin's kpti rework that landed after -rc1.

So I think the best bet might be to leave that one for next time, if
that's ok?

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EB2C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbD3F19AVXvWecKcziS92qP+6dpgOuiXS9NFtO8UefY=; b=coyGLmLQBj1B/Dkxrj0VxHXPl5
	/xWvJG66FYqjOwzATmzer8a135Y2iBwlUU1CCH7khmTl0wMXSoN9UAZhZ2IjCqowel3EXW5JVmx/J
	0TPdemgtxfLRJnj0g5IIGCG4AI+IfdQ5pU0UZZWVJZaFpAIt+nmcS5DPjJiPP+0mkeVUYVBN0Td6a
	+3R0WQvLVZbnMFR0KJi1Y46hw/Gg+bNMuYWJHPOcByGvflzdE3zMZA3SRjR4nyf2z/Qsylzs0O4su
	vprq5eyUytX2z0QlH5UpNPfaFOqoYQTqdvZjBexnVSL80DWOCYQLI3j2nK/QROFIZa1lIryqU853j
	NdQdTQQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1dh-00000006Kdc-0SNo;
	Thu, 06 Aug 2026 17:12:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1df-00000006KcU-2LqM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:12:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 54AE1413F6;
	Thu,  6 Aug 2026 17:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621A31F00A3A;
	Thu,  6 Aug 2026 17:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786036335;
	bh=NbD3F19AVXvWecKcziS92qP+6dpgOuiXS9NFtO8UefY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V9dhzPZRTIMnSaqGW7duVoUiWfNXLMv8i/mBke6SSptU3hl0W0W8DODHm9ZZWj6Kz
	 iVzmv8ZScUZADuZvbx5IKJEEsQEbkSBt/mfe7xWdxlGncywWInx3cV0ykcqZF+jQcn
	 gnc7B0Kf62Gq30pP236Jmq5fu5V1zxwrlcY86wo/ew59nEbYSgprn0GvVTXyhdXGj9
	 eZzEXgM9PRNy+i4b9w8JInM9IL7QqxWCjWP/pGPvFx6IOa6JfKMS7YcaDYs1Y46mdQ
	 AAYUS3SSkw88j237gFj989Ojz1NNFu9Xfz2DhCVXmRfiK/z8/5llAcAaNma1HjYvgv
	 AzOR504tjwS3g==
From: Will Deacon <will@kernel.org>
To: mark.rutland@arm.com,
	Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	ilkka@os.amperecomputing.com,
	leo.yan@arm.com
Subject: Re: [PATCH v2 0/5] perf/arm-cmn: Support CMN S3 r2
Date: Thu,  6 Aug 2026 18:11:43 +0100
Message-ID: <178602260412.429067.9481734748320010942.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785252273.git.robin.murphy@arm.com>
References: <cover.1785252273.git.robin.murphy@arm.com>
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

On Tue, 28 Jul 2026 16:59:20 +0100, Robin Murphy wrote:
> v1: https://lore.kernel.org/all/cover.1782830759.git.robin.murphy@arm.com/
> 
> Hi all,
> 
> Since nothing else has come up, this is a very minor respin to fix
> the bisection nit that Leo spotted, and hopefully it's good to land?
> 
> [...]

Applied to arm64 (for-next/perf), thanks!

[1/5] perf/arm-cmn: Rename filter variables for clarity
      https://git.kernel.org/arm64/c/55c671f965b1
[2/5] perf/arm-cmn: Refactor event filter programming
      https://git.kernel.org/arm64/c/4da12d5c8bef
[3/5] perf/arm-cmn: Refactor event filter data
      https://git.kernel.org/arm64/c/f1b844fdc0d6
[4/5] perf/arm-cmn: Plumb in new filter types
      https://git.kernel.org/arm64/c/09178f536bb9
[5/5] perf/arm-cmn: Support CMN S3 r2
      https://git.kernel.org/arm64/c/21afe52e546c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


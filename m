Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D835FE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 16:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKmGAs6l4tPWCdOJctbGqBnJ1hBapWBJH5/mZAy2F+c=; b=gk9LvxEMSnsYvKavPaqJ19aR7D
	xSCjmsgC8wfd7zJsZ6GWGOZ7xo09OWfdxc1AILxaWSMUWNqWIr8KRbFi7oG17Jx+beh0VPvWl0LSZ
	fxRCXdROXNLk6kT2RADmdsZEDuP8azzmxzqqPckj5CAvIgKILOMJJMjpENMEHUxtNIYHrH1GAkAxC
	6sddYtdfUumm2oBYU9jPpc1ub1YSPwtakm7FUVY2b1gjRJbIYNCQCBmO8jqahYJlB/VWuD3GWX9gN
	nf+CSe4wur8yuoh7f+UFIU4wuOtfOQEMo0xWkbvQcAvl+zXNymQiqG0WMmcC5TzGIYpUgr2R4q5nE
	RmW1QeWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZPH-00000009I0P-1rGZ;
	Wed, 08 Jan 2025 16:59:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZ5O-00000009DHx-1KZl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:39:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C5D5A5C0EFA;
	Wed,  8 Jan 2025 16:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8B1C4CED3;
	Wed,  8 Jan 2025 16:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736354353;
	bh=m6CgzdMPzAX61Ca+UFuERy52c+NZuAry6HZZJK/uQnc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sdar5qah37AVgho6AKgqlqEEOoLkeEUFj+Mcf7HrcPrsHqC15Em0pFA2Ad2Bn8C3/
	 Fk9uvE9vwt3sstOvdxZEl/aIVbRDnayGnN48YHKPy5fRGJ+9UgIGaz9u8yPO1iXakq
	 +Xu8fvizib0OZf2nGpTdbDS2UkEkR5PHGza8CXi2cNtMu2utSCR0a2M2ztYbBRTKeV
	 aBj6XMCQziicckraSMdCmkznKC0Y5Mdrck7dOnBVQ8sIjB0IIBqEGHiUMYMNBwkL94
	 duTsG1/NAYzdHrz2IMME9nPOf5XiRJ7PywHGIs/jMHEFNCxhvG05/TNQraILwme8v8
	 O52NVWZGfA05g==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Jeremy Linton <jeremy.linton@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	suzuki.poulose@arm.com,
	gshan@redhat.com,
	steven.price@arm.com,
	sami.mujawar@arm.com,
	itaru.kitayama@linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/1] arm64: CCA TSM module autoloading
Date: Wed,  8 Jan 2025 16:38:54 +0000
Message-Id: <173634472957.507461.2595446733414158963.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241220181236.172060-1-jeremy.linton@arm.com>
References: <20241220181236.172060-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_083914_399153_42B01950 
X-CRM114-Status: UNSURE (   7.81  )
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

On Fri, 20 Dec 2024 12:12:35 -0600, Jeremy Linton wrote:
> Provide module tables and a platform device so that the
> CCA TSM module will autoload when needed.
> 
> v3->v4:
> 	More comment/function name tweaking
> 
> v2->v3:
> 	Fix __maybe_used placement, it does fix CLANG builds now.
> 	Add reviewed-by tag, Thanks Gavin!
> 	Ugly commit message cleanup.
> v1->v2:
> 	Various comment updates/variable renames
> 	Add missing __maybe_unused to the platform_device_id
> 
> [...]

Applied to arm64 (for-next/cca), thanks!

[1/1] arm64: rsi: Add automatic arm-cca-guest module loading
      https://git.kernel.org/arm64/c/a1edec22457e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


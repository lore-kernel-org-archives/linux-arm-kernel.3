Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28FCCD0425
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 22:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/7/zaTL3GJcOBMaH65uBE5CKKtBuyY0N2uf94X/zdM=; b=QU16FYVCoFSE/3J1/1leIIyeDs
	e6PoAKk5QOB0O8sYAKKUWTlk8g8abiqIP+AC7ASAp6JBxUmL8j2mu7ZMIR8t9dYCP9pjJtMOn7mIc
	mVtE+0sWaAMpZadAr8+gvSTic/2tTaSac+chCRwrR8kNg8un13/0P7V3Ru3IY0xIb+Ef/AD2w9Qjb
	UCor6Lhjn1WJ/+8mynMnKPMGOq8FzDkZf0hkhezOpJb1EWQ727j1fvuda8ec7GNlgtyoLK7yPTlg7
	qKoLb16fnqAxy0A+X8gxEp7ZZOz1gdkGFHm7uUE4tDrH+7FZHedcgtp1YFhrU6uC8dv5CPve7/oDc
	slml71MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXT-0000000CCvj-0qpw;
	Mon, 05 Jan 2026 22:59:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXQ-0000000CCtd-1OSA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 22:59:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F32443639;
	Mon,  5 Jan 2026 22:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4B5C16AAE;
	Mon,  5 Jan 2026 22:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767653939;
	bh=gIOnnaQJwb5PHVOw5B64r1U717QrU8ad3YegmX5iF0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I5526VeTbg+YDq0xF+TPpwbuSJXoGpYHgrK77YOGNILRrrAmscgVPoxt7RpnnWcsx
	 GuNXm0g+cyJE8kGCuvsg3oH0ok/PkmkSJ9fDBr8fHJpke0zPxb6jkLQf0icelo1Sqy
	 gxc0x7UlMnizMXDNXD3wQ7HBsMotq0G3iEyK7wNAryV7WSgJ74T+IBZUzwie8Oaqqp
	 DSzy1SMOt7/v0yq1RcsTF4QeIJ57igw/xcOtdYSfx0UuPQDd7JP1F0hD398GTEawWW
	 iVLIO90etT5hIDnApSvHIhkuWLVPP+Ax3fPp3AoYmZ8PQa2BLXK5U+pwU7JXLcjvoO
	 jLHIpwoaTkJJg==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	michal.simek@amd.com
Subject: Re: [PATCH] perf/arm-cmn: Support CMN-600AE
Date: Mon,  5 Jan 2026 22:58:26 +0000
Message-ID: <176763174079.1386255.16352848900159993179.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <f0c6e66df6b74f073df77c00bdf9ed560ca9c703.1764002394.git.robin.murphy@arm.com>
References: <f0c6e66df6b74f073df77c00bdf9ed560ca9c703.1764002394.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_145900_514305_015C9D8A 
X-CRM114-Status: UNSURE (   9.78  )
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

On Mon, 24 Nov 2025 16:39:54 +0000, Robin Murphy wrote:
> The functional safety features of CMN-600AE have little to no impact on
> the PMU relative to the base CMN-600 design, so for simplicity we can
> reasonably just treat it as the same thing. The only obvious difference
> is that the revision numbers aren't aligned, so we may hide some aliases
> for events which do actually exist, but those can still be specified via
> the underlying "type,eventid" format so it's not too big a deal.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf/arm-cmn: Support CMN-600AE
      https://git.kernel.org/will/c/12a94953c37e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


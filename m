Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E4BD47CDE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 12:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSXsGg47LigshzAAw8DzoAw3ZijHz7xMa7QAo37NLMY=; b=ZESglfuhNXKpPPGA6DeC+2BYdn
	lZaG9DX0NFlYWUnbroHwW14Pbp3Cd6Np2xKdB9Vaaa+wEaz30rvYBbpEjtFn54LxsvrM/SqFvVbym
	I2Qoe1V7jktetAok18aB1E9PWZK4zb43WXoJutJ98FGAmV3AGdzBMq1gJN4tVSuEWagK/+4Wrnisa
	cnOzXF0UHoFyMj410dq8Bl9iFWE/tJ8Ic6qtfuROtcmO3BucXVN0tilboRmk28io2MsWdrrbdB5VH
	FAyevlwWZkN5oLZv337PKZILhRLtFNI6r49RM+c3Hys6tu5V2Xs62275wC+Vjwpx77cKGXfIklzq5
	SaIN448w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgib9-0000000E5KF-42ct;
	Fri, 16 Jan 2026 12:06:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgib6-0000000E5Jj-3mAi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 12:06:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B86B81515;
	Fri, 16 Jan 2026 04:06:28 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A2033F694;
	Fri, 16 Jan 2026 04:06:34 -0800 (PST)
Date: Fri, 16 Jan 2026 12:06:31 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com, clm@fb.com
Subject: Re: [PATCH] arm64: mm: warn once for ioremap attempts on RAM mappings
Message-ID: <aWopx48U6A090aIj@arm.com>
References: <20251222-arm64_ioremap-v1-1-30ff5f718b61@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-arm64_ioremap-v1-1-30ff5f718b61@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_040636_974509_EB51195A 
X-CRM114-Status: GOOD (  10.33  )
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

On Mon, Dec 22, 2025 at 07:28:55AM -0800, Breno Leitao wrote:
> Replace WARN_ON with WARN_ONCE when detecting attempts to ioremap
> RAM. This prevents log spam when a misbehaving driver repeatedly tries
> to map RAM via ioremap.
> 
> A single warning is more than enough to show the broken code path, and
> extra reports don't add extra information.
> 
> Warning floods have been seen in production environments where broken
> external drivers hit this code path thousand of times, causing
> unnecessary messages to be printed and pressure on the serial console.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

It looks fine to me but it's not urgent for 6.19, so I'll leave it to
Will.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>


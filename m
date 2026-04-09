Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5124BF364AF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 18:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivgj9HrY0V5S0tj0LsDqgGFefdPWlDkakXPpyXhxS40=; b=Z/ptv5Mr1e6czOfqDEWWepPXpI
	dXRz4iYeYJ+fS+lCG6UIydF6B3hM4wIPy8hDuRfNAptLPIKPbSmWLlwaQj78auVRZZj4dSLPlnqrA
	LjkHHdhGh7ZzCADu9A/i/foPHIC7lc98a9sv/CKen3aWQjScZhBdYffZfQOJnjsVs+spwgfVZxhZ1
	Ry7eiIlVnVkw894rWTrfkIHychuYNx5bwvzGoPuzoOXfQagUSJzBecx33gddEGs/HiOyJaj85n3Oy
	jKzA6Cuia/d+s8iofoO1Dyk9MiMyPgNK2kqzK4IvoT0PeOSkAjQsYNkjP7TB2lFb+XfZwRzyW5QGz
	fzwIkbmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAuDX-0000000B675-2nLy;
	Thu, 09 Apr 2026 18:35:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAuDV-0000000B66c-0iQ9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 18:35:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 823372008;
	Thu,  9 Apr 2026 11:34:54 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BF833FAF5;
	Thu,  9 Apr 2026 11:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775759700; bh=z64SAa9t4e2bfwP6zFpKULuCfW08ZDEEa0wGIe0a9i8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i4MHuuMG3JIzd52WEm+m+gsbk3lPtetLRljdn4+JF7f2AIRq/D/YWzfreqRv0SBd2
	 Kk4EtYy4+amFu4Oc3wYQ0geduOdxBQosaJIppFg+VSb4Ss1u/+0nj9tx9p/ggbuvGd
	 gVqr5asORyIcbExC5LUo7YIeHZ6e2ivT7ojaOw68=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Thomas Huth <thuth@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lance Yang <lance.yang@linux.dev>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mte: Skip TFSR_EL1 checks and barriers in synchronous tag check mode
Date: Thu,  9 Apr 2026 19:34:47 +0100
Message-ID: <177575968737.3881470.6986347449670085141.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260311175054.3889093-1-usama.anjum@arm.com>
References: <20260311175054.3889093-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_113501_263782_A5D4397B 
X-CRM114-Status: UNSURE (   8.97  )
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

On Wed, 11 Mar 2026 17:50:50 +0000, Muhammad Usama Anjum wrote:
> In MTE synchronous mode, tag check faults are reported as immediate
> Data Abort exceptions. The TFSR_EL1.TF1 bit is never set, since faults
> never go through the asynchronous path. Therefore, reading TFSR_EL1
> and executing data and instruction barriers on kernel entry, exit,
> context switch, and suspend is unnecessary overhead in sync mode.
> 
> The exit path (mte_check_tfsr_exit) and the assembly paths
> (check_mte_async_tcf / clear_mte_async_tcf in entry.S) already had this
> check. Extend the same optimization on kernel entry/exit, context
> switch and suspend.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: mte: Skip TFSR_EL1 checks and barriers in synchronous tag check mode
      https://git.kernel.org/arm64/c/249bf9733198


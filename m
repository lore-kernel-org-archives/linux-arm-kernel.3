Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63870FED3EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75pdQbLeD2oBh5PRotlJeq21KLf8KiUS9ubptUEG4ts=; b=QdJH8qZkLcYP42qmUBdl/noykB
	7bWDAGnq1WCOtu0xRSUK6OReqpG9/tMMBITbnJ565Ji8ykk0S4dnStTvyE1J52f5+zsvFzwcWWNoR
	ZyD4i1ENykfhxSLDmblJ84HsGikB38Lt7CBtTN7AS1QMoOVFcG/XNvxA49YhOP2YTOfZyM7XaRIsm
	kmFdBn6FnT9pHqeupCrUR/OmTvcsxWV+awLGsuhiHBc8C0rEOO1x2jPzWSVDFqhp+NrhOHfa/+OfJ
	Pm2WTk1dGfj46yhIm3oJiKK1DCRD9mCB8onzc4KGoKGmS3w/EMfVBUepKdSvCnXd005+wb6U1yhR1
	V9JG+Kvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJdl-0000000DSsi-0Pc4;
	Fri, 24 Apr 2026 16:44:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJdi-0000000DSsE-20Vb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:44:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10A751BB2;
	Fri, 24 Apr 2026 09:44:19 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 800E13FAA1;
	Fri, 24 Apr 2026 09:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777049064; bh=a6yyF/+Http6UHyckaBMmwbISlEebiB5pcVWoL92C6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bt6hNc8XUGtXJqMPNnKc6d+t8PZk5JFxhIZGt/dmjoo9jFel1zv/VHdDeBJZ6uIpl
	 8aRrEJs6rcclMxBf3OBdGsjU3L3NpTW0Rr2J2+MsyURBcbtk8Bnju8yGJC36Zvi89D
	 xebzjhSLX4oxrExwIJGuna+KzjR7NEb92ijcbT1I=
Date: Fri, 24 Apr 2026 17:44:16 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>, Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kselftest/arm64: Fix build failure with GCC-15
Message-ID: <aeud4Hqxq4PNitMc@arm.com>
References: <20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com>
 <aeuRfEeOUWEHzPix@arm.com>
 <63409143-f4eb-48c3-89de-1aef4fb57381@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63409143-f4eb-48c3-89de-1aef4fb57381@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_094426_667708_A18EF076 
X-CRM114-Status: GOOD (  17.26  )
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

On Fri, Apr 24, 2026 at 05:07:42PM +0100, Mark Brown wrote:
> On Fri, Apr 24, 2026 at 04:51:24PM +0100, Catalin Marinas wrote:
> > On Wed, Apr 22, 2026 at 06:42:54PM +0100, Leo Yan wrote:
> 
> > > Building on Debian sid with GCC 15 fails:
> 
> > I think a better fix is to always define struct user_gcs and only
> > conditionally define NT_ARM_GCS (IOW, move the #endif higher).
> 
> I've not actually double checked that everything is wired up properly
> but I believe these days this should actually pick up asm/ptrace.h from
> the headers_install target so a current kernel copy.  We ought to be
> able to remove the local definition of struct user_gcs I think, there's
> still some weirdness with the NT_ definitions I can't remember but the
> struct should be fine.

OK, so it does look like it picks the kernel uapi/asm/ptrace.h. It
builds fine on Debian stable (no GCS anywhere) with including
asm/ptrace.h and removing struct user_gcs.

But I think we should include asm/ptrace.h in libc-gcs.h and not the
gcs-util.h header (for NT_ARM_GCS it's fine to keep in gcs-util.h).

-- 
Catalin


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAE6C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 11:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+iDWZwHoP4F6Gk/aQJutkUyb69JpPOzrtOraBt0YZM=; b=d/MPIV5khuZC/kL2FnmckhXc1m
	cvPHSsn3E5UZ+ywSfRT1bs10YTX4SAN8F+1VYYKCZRzy6AbCMelSIDr5JAd8EYi8l44s93eqmpGE9
	EauknRSVdGScgxOpXPtwimV0NW5knSIfm9gCEEDYeN1bSpBRpg1T+GUCi8bjj/nZeKqxU6KjmqqIA
	yGAO6dm9MrkYHEsCJas/Y7tFvTEodncGOYaqXkoGA7o29HtnfTbmBI3wMZBTadUkq9H4XbzI9A4lo
	QwOzdT3tPILUWi+2e97ghlWtOaXh7zSzrGgUvQOgltCpwkJGwPQpYHwgStn51yY3RCbtUipZF9tj4
	Lo11zySA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrD9O-00000001f8u-106Z;
	Tue, 04 Aug 2026 11:17:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrD9L-00000001f73-0k6N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 11:17:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27FE21476;
	Tue,  4 Aug 2026 04:17:28 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 676213F86F;
	Tue,  4 Aug 2026 04:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785842252; bh=PuLVuA3EE7hhRSTRE5aJ3fJc8wvzv1KpsD48t2Cvtu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YI3tXAjUWs3eUlwla6Vyx8b2j9EpWmRXeo0f5V6KOJSjyFfkXEJMMCvJMZRo+JkYL
	 OXC25ShkTg+Vxrz3vBQRMaCEG1tr8uy2nTa1oh63KShrm4aHyWCTuevEKTsXixJ8L7
	 keNJR9RrNcx4tZr1tPge1DqUbboypqpxfQApye3s=
Date: Tue, 4 Aug 2026 12:17:28 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm: asid: Do not replace active_asids if already 0
Message-ID: <anHKSN6bXkL37maU@arm.com>
References: <20180104180405.37596-1-catalin.marinas@arm.com>
 <amSFZixpR60Mrg7B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amSFZixpR60Mrg7B@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_041735_264848_00DC6744 
X-CRM114-Status: GOOD (  19.99  )
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

On Sat, Jul 25, 2026 at 12:12:16PM +0200, Karl Mehltretter wrote:
> On Thu, Jan 04, 2018 at 06:04:05PM +0100, Catalin Marinas wrote:
> > This patch changes the xchg to cmpxchg so that the active_asids is only
> > updated if non-zero to avoid a race with an ASID roll-over on a
> > different CPU.
> > 
> > Cc: Russell King <linux@armlinux.org.uk>
> > Cc: Will Deacon <will.deacon@arm.com>
> > Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> > ---
> > 
> > This is similar to the arm64 patch [1], with the difference that non-relaxed
> > (cmp)xchg is used as per the existing code.
> > 
> > [1] http://lkml.kernel.org/r/20180104111721.33834-1-catalin.marinas at arm.com
> 
> While the arm64 patch was reviewed and merged, this patch never got any reply.
> It needs a small rebase, but the change itself still applies today.

Oh, it's been a while. Not sure whether I missed cc'ing Russell at the
time or the archive stripped the recipients (I no longer have the actual
email sent).

> Would you like to resend it ? 

If you have the setup to test, please do check and resend it to the
list. After that you can send it to Russell's patch system:

  git send-email --add-header="KernelVersion: $(git describe --abbrev=0)" --to="patches@armlinux.org.uk"

The arm64 commit was a8ffaaa060b8 ("arm64: asid: Do not replace
active_asids if already 0").

Thanks.

-- 
Catalin


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71C7C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mt8faBpMB1IIl9+TZM5ARhnba5LkjGMQeGNB0pc/k+E=; b=WxxvdRdbczSYcGN6nKx3nMQiQT
	NnQZNQEK1lzHKFzWm39zICW09EiMCm6zMwocyH5r25CaLshEP95LBttkNm9vhUONuGoCBfXSGGCgG
	ofttcBi5dGxjnaicX6ytqfT4/26FYXPd2MuHleyx7C+jIs1Jo+lfbuIMyyOz4a0BKhJhq9if3kyHK
	2U0v1fJMS90ATEXLaATsJceLc88sy1yHlJqcpcnaCsHHQ1RkboG9t1yw4LrgfXqW25jVBIt4ym2x2
	VRypzjOmztof6XiFiCjoA/H8wNGIGdpFqF0AslvQgOG8nfQ5QMVufamYzFmmp6P7KUE3I7h3EZ36l
	UvgJ0hXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAuO-00000009aPN-0VlE;
	Tue, 21 Jul 2026 13:53:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAuN-00000009aPB-179n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:53:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E78CB4055B;
	Tue, 21 Jul 2026 13:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DEB1F00A3A;
	Tue, 21 Jul 2026 13:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641998;
	bh=Mt8faBpMB1IIl9+TZM5ARhnba5LkjGMQeGNB0pc/k+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IxHQZAOPNrAexzugCNFJxfW8YmvcPLCPNy38A7L9/Y+4Avd91FbCMriUf8SHT9K+v
	 wKoQP3TkufZuP+MOv8VbGzsdrAROCacst+2UvFQUbbx7TrEgsVcQ12de91xlzkaNfP
	 UWCBhAyXEccVfIyAF8gocZHBLz0vqID+vLqooy8AgxWH1RVLXQxOTWFRUPxJiBpX47
	 2Sq2MmJ9TKNZUg2m1eC7DBS1VEq+mFAqLgjvFHGm+8XgTvU/mF7WNCa87f7bM1Nykx
	 Fv9HoIOx4O/YGkgZWPfGLIflKljmkz8Ab7NhhS3WF6mefnWzPb3tgxOitXq5qOkCTi
	 KtV9RyP+GC1iw==
Date: Tue, 21 Jul 2026 14:53:14 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: Disallow disabling boot CPU based on config
Message-ID: <20260721-wandering-romantic-buffalo-ebbc4f@sudeepholla>
References: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
 <akfHIH_dZrr5bosu@J2N7QTR9R3>
 <f2d4b312-4a11-425e-8329-33838ed37d15@oss.qualcomm.com>
 <al9uRagYJSQPJr7_@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al9uRagYJSQPJr7_@J2N7QTR9R3.cambridge.arm.com>
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

On Tue, Jul 21, 2026 at 02:04:05PM +0100, Mark Rutland wrote:
> On Tue, Jul 21, 2026 at 12:29:54PM +0530, Sneh Mankad wrote:
> > On 03-Jul-26 7:58 PM, Mark Rutland wrote:
> > > On Fri, Jul 03, 2026 at 04:50:02PM +0530, Sneh Mankad wrote:
> > 
> > FW permits CPU0 disablement because it functions properly in regular run time.
> > But there is an additional hardware constraint in above mentioned platforms, that
> > suspend to ram has to be performed via boot CPU / CPU0. Due to this constraint,
> > CPU0 is required to be online when suspend to ram is triggered.
> 
> The PSCI spec doesn't permit that.
> 
> Even if HW has that constraint, it's up to FW to hide that from the OS.
> 
> [...]
> 
> > > This is a platform-specific property, and it's possible to build a
> > > kernel that boots on this platform and/or other platforms.
> > 
> > Yes, but for that reason the config will only be enabled for SoCs that have this
> > constraint, it will remain disabled for other SoCs.
> 
> Please re-read what I said. A config option can't help if you have a
> single kernel that supports multiple platforms.
> 

+1

> > As mentioned above, its not a FW bug. CPU0 is allowed to be disabled
> > from FW and HW constraint is for suspend to ram to be performed on
> > boot CPU.
> 
> Please see my other reply at:
> 
>   https://lore.kernel.org/linux-arm-kernel/al9tdvOxYb83zBxd@J2N7QTR9R3.cambridge.arm.com/T/#m872da3cc4ded3386dce92d4bd4bdf9c33d3e2d0b
> 
> This is *definitely* a firmware bug.
> 
> To be clear, I'm not saying we can't do something to address that, but
> let's not pretend that this is compliant with the PSCI spec.
>

+1

Just curious if CPU_OFF on this CPU0 returns DENIED or just proceeds and
ends up with cpu and/or system hang ?

-- 
Regards,
Sudeep


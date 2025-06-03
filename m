Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00CDC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 09:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R24fAEQ8DJV1Bu/Lk3GrR0V4p4KbCamwGPTjxJWhJ70=; b=K4EbGZ0R7G8xEJLdyhJBnCVp6s
	Su+Sl0Q5inwrhX3nAbybdKG2xYv3hxqEDoNLZrknB9CdxoM82CZdddTiupniwrBBBwPccv7MXVJmN
	pabHURRTLJddFHrn+CrpI/b+vI8ba9IfjeG4Tgfp+IoVb9hPI8dO2lpkAHCsdiSpGA7NrdQ4VjdFe
	RNEn/KTeZePE8xiTWoqB7FK7J1fMlQ43+SESgy/3TnP566ynf2mFwVBBe5+0X00i+BIGjq+LjseRw
	i7QO4uYO65reoiHeyjtf6LadEOrSG81PC0PaWRLQx4okv3iyv/wkR8CmbgBCu5rqyYpaCBN06qI7J
	Cig4rbwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMO0M-0000000AXE8-1MSM;
	Tue, 03 Jun 2025 09:32:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNuB-0000000AVi2-1WAq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:26:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00B6812FC;
	Tue,  3 Jun 2025 02:25:42 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E2D23F5A1;
	Tue,  3 Jun 2025 02:25:56 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:25:54 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Qu Wenruo <wqu@suse.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
	rafael.j.wysocki@intel.com, jonathanh@nvidia.com,
	ulf.hansson@linaro.org
Subject: Re: Kernel crash on boot, arm64 VM
Message-ID: <20250603-athletic-catfish-of-reading-65ef17@sudeepholla>
References: <17fc594b-b80b-4918-8945-4aef35dc9c94@suse.com>
 <20250602103521.GA1134@willie-the-truck>
 <20250602-solid-coot-of-karma-cfea5e@sudeepholla>
 <d7383d29-516d-4643-aaac-dfd930ec896e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7383d29-516d-4643-aaac-dfd930ec896e@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_022559_446397_90D912F7 
X-CRM114-Status: GOOD (  15.33  )
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

On Tue, Jun 03, 2025 at 08:40:25AM +0930, Qu Wenruo wrote:
> 
> 在 2025/6/2 21:42, Sudeep Holla 写道:
> > On Mon, Jun 02, 2025 at 11:35:22AM +0100, Will Deacon wrote:
> > > [+Sudeep]
> > > 

[...]

> > > I've kept the crash log below, but I suspect this is due to the __free()
> > > cleanup path in dt_idle_state_present(), introduced recently by
> > > 5836ebeb4a2b ("cpuidle: psci: Avoid initializing faux device if no DT
> > > idle states are present").
> 
> Reverting works, thanks a lot!
> 
> > Do you also have this commit ?
> > 
> > 39cdf87a97fd ("cpuidle: psci: Fix uninitialized variable in dt_idle_state_present()")
> 
> Not yet, the branch I'm using is from btrfs' development branch, which is
> slightly older than the upstream.
> (The base commit is a56baa225308 ("Merge tag 'for-6.16-tag' of
> git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux"))
> 
> Just tried upstream, which also fixed the problem.
> 

Glad that helped. Thanks for the clarification.

-- 
Regards,
Sudeep


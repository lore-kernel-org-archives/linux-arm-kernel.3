Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6F9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPdVHdBqE78Tyd4PBWnjxJl0mWtpdEwQn28B3/SGb/w=; b=FE1BzZuQva36C8B+zBSq147Y3p
	1B0QzMnJe1H/Cenwq8iy0PzaYvvQVec3oTF/HIhi8XYbRx0XKnHphPILozEDAl1qHJ99Eci1tz0n1
	AMcHohiQ96DcFp0YqMUi2FU12aQjb2bBlm8nJlqcR4LYwSZlsGsuy3RjtUjaIUYwT5ERHfFE11gv7
	fxllDW2tjgYLA6Tv3hNkwKpWURl9C4MZhPN0C2CD/HJYQLoBTJpAP0ZajBuFsRQz9X7bZoI55BV7E
	kvfwpkZNqaxxlUpIdqF6HowrOvYtdOdNgyXVR2S7Rth73QSyM0QAxgb5O+rGMWxCBLLC2FrX8bzvT
	SI8GkSgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlxS-00000001wDf-0LFR;
	Thu, 09 Jul 2026 10:26:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlxQ-00000001wDJ-1wEL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 10:26:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 748246001A;
	Thu,  9 Jul 2026 10:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85ADD1F00A3A;
	Thu,  9 Jul 2026 10:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783592775;
	bh=TPdVHdBqE78Tyd4PBWnjxJl0mWtpdEwQn28B3/SGb/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DTci9JOWIGHKfBoQb3CBfSV1SkaFony1B9cQxR/582XmSaBE0WcAVXehCunpqUihN
	 FcSL9fchO9EriU8hNo2GAlseP1MoOnrrdV/AyxTRDEq1Ol5ptedub8IwkszrzuqoEY
	 swWIWr9i1t5L/RQDig18MQO15ZxE+C2JBWaEWTU4bG25OzyCJ51zbowDDHd3UFF5XE
	 f3PMBjDE+iF6kT+TtVb99M0QRkFKJaZDrOEDpLo7xKZuZMAIMY60GLDzL1TodfoyH4
	 Wv9HTOujAGR4LZKtOqXySgP/XHA8H65aLq/KqyUT0ASQ0/EqW7VhIL1rPzLeQcwxQS
	 uTq86OLThc6Rg==
Date: Thu, 9 Jul 2026 11:26:08 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, ardb@kernel.org, david@kernel.org,
	will@kernel.org, linux-arm-kernel@lists.infradead.org,
	akpm@linux-foundation.org, bboscaccy@linux.microsoft.com,
	bp@alien8.de, dapeng1.mi@linux.intel.com, ebiggers@kernel.org,
	elver@google.com, enelsonmoore@gmail.com,
	feng.tang@linux.alibaba.com, gpiccoli@igalia.com, kees@kernel.org,
	kuba@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	lirongqing@baidu.com, peterz@infradead.org, rdunlap@infradead.org,
	tgopinath@linux.microsoft.com, tony.luck@intel.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>
Subject: Re: [RFC v2 PATCH] reserve_mem: add support for static memory
Message-ID: <20260709-educational-nimble-seagull-5fc031@sudeepholla>
References: <20260630170911.43521-1-shyamsaini@linux.microsoft.com>
 <ak4fu1qINGyAQUEl@arm.com>
 <ak7tTVs6tWZPOln0@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak7tTVs6tWZPOln0@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
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

On Wed, Jul 08, 2026 at 05:37:33PM -0700, Shyam Saini wrote:
> Hi Catalin,
> 
> On 08 Jul 2026 11:00, Catalin Marinas wrote:
> > Hi Shyam,
> > 
> > Adding Lorenzo, Hanjun, Sudeep.
> > 
> > On Tue, Jun 30, 2026 at 10:09:11AM -0700, Shyam Saini wrote:
> > > Following up on this, As Mike pointed that reserve_mem is best effort
> > > reservation mechanism, so what is the recommended reliable Linux
> > > mechanism, if any, to reserve a predetermined memory range during
> > > early boot on ARM64/ACPI platforms for warm boot scenarios? KHO is
> > > one option, but I'm specifically looking for a solution that preserves
> > > the region across warm reboots.
> > 
> > If you need ramoops-like support, I think ACPI ERST is a better fit and
> > we don't need any memory reservation tricks. I'll let the arm ACPI
> > maintainers comment further.
> > 
> 
> while this patch mentions use case of ramoops, there are other uses cases that
> requires predetermined memory reservation at boot time, one of them is PMEM.
> Like Mike pointed out in this [1] thread, we don't seem to have an
> equivalent mechanism for reserving predetermined memory on ARM/ACPI
> platforms, as is available on ARM/DTS based platforms.
> 

Indeed, it was been discussed in several forums in the past but AFAIK there
is no conclusion or a direction towards solving this yet.

-- 
Regards,
Sudeep


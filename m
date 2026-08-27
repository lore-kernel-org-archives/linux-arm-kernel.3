Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FE3C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 12:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u92UR6C9DT+TySSGXYlFFF8ogeUrPnMgsRSJt4BfLdQ=; b=yp7vth8OaRFf0jtSUGuUUYD+hq
	x2L+1BV0H/GyEv6VcP2GL4ewJWSxor4nE406VjtXG7rZ+z8zq1ZL9XtpK9p4okDMf6RswBlpsrnUt
	MpKwV+osRv5aVKVsA3OQwIRx4dSalX0sfrrT5ArlbzjP0NHlEeS1xCcFXWrELf0eEPcWWKtF9I25W
	oEeznPb7eewvysmTlDKRkCvUgc4zgAJ8LW4QUtwLrPfQcLtS0CsFMaxVKFZjKPQrD5PuvbLhzsWye
	K4PeXvIHEoF7bMo5HVM/lLjR2tlHgbG9ma0vIfgWlBAPAV2VmZwbRpDNzQwoxLSEGG0dWhLSp/xEK
	J6SXbH6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZIz-00000003yOr-1yrh;
	Thu, 27 Aug 2026 12:34:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZIw-00000003yOO-43yn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 12:34:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4401169E;
	Thu, 27 Aug 2026 05:33:57 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD2EF3F85F;
	Thu, 27 Aug 2026 05:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787834041; bh=mY3Eav+LjuHZMwXDTdn++FZAjJ/U1MT/NAZX93Cyy4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OsFUMBHEaz0MEEtpQe2t/mV0Bh0yAMbABVuevsnZfzq2jdkZC7jCmm1dBlOs17pWq
	 WZ55pKQ6caopkWdxmTSrDDeBrXYHU+P0eoZQCtRXzYJLjqvkMAgpWZVClF0upnWdGN
	 Y8BmeN/1xOQ58RPN8/J1H5NGvzOTt1q3snNZ/ufo=
Date: Thu, 27 Aug 2026 14:33:50 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: Sean Wang1 <seanwang1@lenovo.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"rafael@kernel.org" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Xuewen Yan <xuewen.yan@unisoc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sumit Gupta <sumitg@nvidia.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>
Subject: Re: [External] Re: [PATCH v3] arm64: topology: add source check in
 arch_cpu_idle_enter()
Message-ID: <apAurrE3JOpM3wE0@arm.com>
References: <20260811072830.10028-1-seanwang1@lenovo.com>
 <anrzT-ez3b7uYaCt@arm.com>
 <SI2PR03MB6688D1DC0796AC6F6A373C2E93DC2@SI2PR03MB6688.apcprd03.prod.outlook.com>
 <anxSsfvpZHHsVnp_@arm.com>
 <aoX_jiuhv3dyMS-g@arm.com>
 <CAB8ipk_4Zbhb=azTDGQEQ1S=n2Zhzvqs7pYr6ZfOOWL8meE_4Q@mail.gmail.com>
 <ao_9EiKz9Cmx_YHh@arm.com>
 <CAB8ipk9KknqBFeQrDYXAqRxGbM_bjtU0w7Jid95XucnzkgUdkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAB8ipk9KknqBFeQrDYXAqRxGbM_bjtU0w7Jid95XucnzkgUdkg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_053403_101416_DC681C27 
X-CRM114-Status: GOOD (  28.99  )
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

On Thu, Aug 27, 2026 at 05:11:28PM +0800, Xuewen Yan wrote:
> On Thu, Aug 27, 2026 at 5:02 PM Beata Michalska <beata.michalska@arm.com> wrote:
> >
> > On Mon, Aug 24, 2026 at 05:21:03PM +0800, Xuewen Yan wrote:
> > > On Thu, Aug 20, 2026 at 3:11 AM Beata Michalska <beata.michalska@arm.com> wrote:
> > > >
> > > Should we distinguish between events?
> > We could although for this particular issue clearing the source is the one that
> > needs attention. But I do not see why we could not have both.
> > This was just sharing the idea, not a final patch.
> > >
> > > > ---
> > > >
> > > > This is just a rough idea, and needs ironing out the wrinkles, which are there,
> > > > but that allows leaving the idle enter as is. I also believe this is the right
> > > > approach for the interface itself, although I also see some drawbacks and
> > > > potential issues (in its current state), especially that the functionality is
> > > > being exposed to modules.
> > > > Nevertheless, those are my two cents, untested, just sketched.
> > >
> > > As an aside, could we verify the functionality of the AMU's
> > > SYS_AMEVCNTR0_CONST_EL0 in the current CPU before enabling amu_file?
> > > To my knowledge, many chips currently have inaccurate errata in this counter.
> > > Alternatively, could we introduce a command line that allows users to
> > > dynamically disable this feature?
> > >
> > > Thanks!
> > Do you have any particular issue in mind ?
> > So far, from what I have been able to track, the issues reported are either
> > handled by existing erratum or by the latest change that reads the counters in
> > 'one go'. Can you share the details of the issue you are facing ?
> > That would be helpful in potentially finding the right solution.
> 
> For example:
> There is an A725 errata:
> [A725]The CNT_CYCLES event can have a significant increment error due to WFE/WFI
> Status
> Fault type: Programmer Category B
> Fault status: Present in r0p0, r0p1, and r0p2. Open.
> ......
> Workaround
> There is no workaround.

Right.
Will be sharing a patch for that one soon.

---
BR
Beata
> 
> Thanks!
> >
> > ---
> > BR
> > Beata
> >


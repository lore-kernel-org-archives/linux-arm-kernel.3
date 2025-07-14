Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DB9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 13:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+lX+6SZk5sjFDg8URvAuU+tegvp5Ckh4/1sUrFa9s8=; b=XjC9c0RjgjcX/jxf7j35PC7Bz9
	fZ113q1iwjz774f9kmum6Zrb4LVJoDEQhjQMGFev1oJpQoVmhYaI2sdb/cvGnMUvpai8UqGKFUb3g
	RcxAl8+GZQ7/GS/DMlF5wVWvCAO03kfu2WJpcZZ9LD6fLa5HgPF1ibAqW6Y1ZU41BF5vuyHuViald
	nddG1M3ic3xQXd00cLnZ9JpBfRyX+nGPWw4LpUjF76d5G0CfnPVzGRPtbHEAIqgz2fntQ3eUEvVnV
	MyoWZ1aRyxNMZ81MiKUydX57OVomT2CNbJlzo17kjYCs5sD+RGrbDr1K3NCjCMbgqe+Sic1vygZ1r
	f140YDUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJT1-00000002LXY-3WXg;
	Mon, 14 Jul 2025 13:43:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJIN-00000002JG1-2syf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 13:32:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0551A1BC0;
	Mon, 14 Jul 2025 06:32:27 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE4A93F66E;
	Mon, 14 Jul 2025 06:32:33 -0700 (PDT)
Date: Mon, 14 Jul 2025 14:32:31 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: "Koichi Okuno (Fujitsu)" <fj2767dz@fujitsu.com>
Cc: 'Peter Zijlstra' <peterz@infradead.org>, Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] perf: Fujitsu: Add the Uncore PCI PMU driver
Message-ID: <aHUG78Vv1QU5Aafj@J2N7QTR9R3>
References: <20250617102819.3685543-1-fj2767dz@fujitsu.com>
 <20250617102819.3685543-3-fj2767dz@fujitsu.com>
 <20250617103618.GT1613376@noisy.programming.kicks-ass.net>
 <TYCPR01MB67177BF90FEBAB9E20463012C141A@TYCPR01MB6717.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCPR01MB67177BF90FEBAB9E20463012C141A@TYCPR01MB6717.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_063239_773167_B550F167 
X-CRM114-Status: GOOD (  15.91  )
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

On Tue, Jul 01, 2025 at 06:13:57AM +0000, Koichi Okuno (Fujitsu) wrote:
> Hi, Peter
> 
> Sorry for the late reply.
> 
> > On Tue, Jun 17, 2025 at 07:27:50PM +0900, Koichi Okuno wrote:
> > > +	pcipmu->pmu = (struct pmu) {
> > > +		.parent		= dev,
> > > +		.task_ctx_nr	= perf_invalid_context,
> > > +
> > > +		.pmu_enable	= fujitsu_pci__pmu_enable,
> > > +		.pmu_disable	= fujitsu_pci__pmu_disable,
> > > +		.event_init	= fujitsu_pci__event_init,
> > > +		.add		= fujitsu_pci__event_add,
> > > +		.del		= fujitsu_pci__event_del,
> > > +		.start		= fujitsu_pci__event_start,
> > > +		.stop		= fujitsu_pci__event_stop,
> > > +		.read		= fujitsu_pci__event_read,
> > > +
> > > > +		.attr_groups	= fujitsu_pci_pmu_attr_grps,
> > > +		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
> > 
> > Should these drivers not also have PERF_PMU_CAP_NO_INTERRUPT ? Per them
> > being uncore they cannot generate samples.
> 
> Even now, the fujitsu_pci__event_init() function rejects sampling events
> before checking PERF_PMU_CAP_NO_INTERRUPT in core.c.
> However, I think it is correct to have PERF_PMU_CAP_NO_INTERRUPT which
> means not being able to sample, so I will add NO_INTERRUPT in the next
> version.

Sorry to give contradictory feeback, but given that the majority of PMU
drivers under drivers/perf/ don't set PERF_PMU_CAP_NO_INTERRUPT, and
explicitly reject sampling events, I'd prefer to do the same for
consistency.

Peter, are you happy with that for now?

Overall it would be better for PMUs to export a positive "I support
sampling" flag, and maybe rename/replace PERF_PMU_CAP_NO_INTERRUPT
accordingly, which I'd be happy to look at in future.

Mark.


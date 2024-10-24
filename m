Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE41CE8E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 12:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wYevecRCq7p97EWzJBMwmHm76aBQIQTVHCJSFT08D4=; b=pcwGP4/V5Xeksrur5wUzw802qe
	2dAyD7XVFp3u8LFoHoCSez7wqwb+wBTRc6Y1/inabkz5nGTMtB68UscLAemPKn/QibqLLDxV1MQBU
	LkTl/VkD5FscGaUgHfovLClIUSXi1Hf8Fiu04ShvaU8gqJOe2GEeG718inJYUYFs05vcJimICZzcW
	g3FGt19vakmmsUPunPXWY0JLnZ/1Ts9Aln1ELg1MaEQKAvPbKE9XKYN34fVvouTgeI5S5qTFwVSHJ
	ToK1Lu50h9iSBX0iQNiUZfgB0ae63REDys6axwrTn6JUKLhFcs/ndv0IWbs/+KWqsEpJ3W6cfEXRQ
	XB39Dw3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3x6C-00000000MkC-3mH8;
	Thu, 24 Oct 2024 12:37:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wve-00000000Kqy-2Ijb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 12:27:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 62C305C5AED;
	Thu, 24 Oct 2024 12:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281EAC4CEC7;
	Thu, 24 Oct 2024 12:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729772821;
	bh=lw6sXiQ6wtFxX+kp2lb3mbfcoAhgOy+cKDBtWDndOkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MAY2d50D8Q7Wngqp0j8nZOH+BiwQOIsrnP+QRDrthfgGBvPGB9yfX9p0zHpriPPkK
	 x8vR4T3QMoIoWPHiPF/dvosNZaUypb+QsESwMxmIostN6Vtso5Wtvw44heyRhCBWqy
	 diff+uzfBTVyunZmp3KJ2kSJxnhzoj0WgfnTMiCch6SWcOqZnVyHr6S10+KlmNyf+F
	 kJbKak7k3cEqMbYPIgXMTzTNn8yHhulHP8ORYa+Dfb0FgUAT0BtG1XdUuqDYJ0nZOE
	 TOnDSplIg0k8dxGKQGQ3UimuK4ZkLTCeqQ/1CdbpRH/mKXopcb00jZ94r3kzsXSeCk
	 hxVeyh2if7Y6g==
Date: Thu, 24 Oct 2024 13:26:54 +0100
From: Will Deacon <will@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Xu Yang <xu.yang_2@nxp.com>, Frank.li@nxp.com, mark.rutland@arm.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, john.g.garry@oracle.com, james.clark@linaro.org,
	mike.leach@linaro.org, leo.yan@linux.dev, peterz@infradead.org,
	mingo@redhat.com, acme@kernel.org,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 3/3] perf vendor events arm64: Add i.MX91 DDR Performance
 Monitor metrics
Message-ID: <20241024122651.GA30704@willie-the-truck>
References: <20240924061251.3387850-1-xu.yang_2@nxp.com>
 <20240924061251.3387850-3-xu.yang_2@nxp.com>
 <ZvsTJ47yHFUjo1uw@google.com>
 <20241008054935.zi2kqcaj4fwf2bda@hippo>
 <ZwYncyUlAtTAeOjo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwYncyUlAtTAeOjo@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_052702_651480_311DD037 
X-CRM114-Status: GOOD (  21.27  )
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

On Tue, Oct 08, 2024 at 11:49:23PM -0700, Namhyung Kim wrote:
> On Tue, Oct 08, 2024 at 01:49:35PM +0800, Xu Yang wrote:
> > Hi Namhyung,
> > 
> > On Mon, Sep 30, 2024 at 02:07:51PM -0700, Namhyung Kim wrote:
> > > Hello,
> > > 
> > > On Tue, Sep 24, 2024 at 02:12:51PM +0800, Xu Yang wrote:
> > > > Add JSON metrics for i.MX91 DDR Performance Monitor.
> > > > 
> > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > ---
> > > >  .../arch/arm64/freescale/imx91/sys/ddrc.json  |  9 +++++++
> > > >  .../arm64/freescale/imx91/sys/metrics.json    | 26 +++++++++++++++++++
> > > >  2 files changed, 35 insertions(+)
> > > >  create mode 100644 tools/perf/pmu-events/arch/arm64/freescale/imx91/sys/ddrc.json
> > > >  create mode 100644 tools/perf/pmu-events/arch/arm64/freescale/imx91/sys/metrics.json
> > > 
> > > How do you want to route this?  As it's mixed with kernel changes, I
> > > would generally request to split but it's a change just to add new
> > > files so it should be ok to go with other tree.  In that case,
> > 
> > Sorry for late.
> > 
> > How about you pick up this one to perf-tools tree and Will Deacon pick up
> > the first 2 patches to his tree? I didn't see Will apply perf-tools patch
> > before.
> 
> Did Will pick up the kernel patches already?

I have done now, sorry for the delay.

Will


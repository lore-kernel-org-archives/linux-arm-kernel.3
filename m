Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B906EC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 08:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HaLNr9oPxR/VdUdyrxgHJeRrQAHGaBeJ3dRvwFvu2Po=; b=ckXAWZ89U6lU2qmkYSlrsHXLFu
	9WgJsjCv4wZWs15FssY6pqKXJUljSLB9zNC/9oBs08AamMNV8QU+LT6oLzRth2KwAP3oPcTzPLdbF
	IzNxWf5vTJtlP4tieFUU6T3JAbzI+MkxjktpIII5h6d0UoMFzUw89yfXpxFH4RFUDWWKU5+S0SBo1
	nzpbja3aQcw3rwTnkVDVLBzhUm0N+/2KCCGVXZmONHOkB9XnjisZZrsgH5St9OV9H6Ki2RJ4elfZA
	fb/qTtPNiOR/G7rlqvJkHLBhb13nv2CRqGrahynoNr8ZdfXFoFMuDTlykKOaH5hT7styqbbnDyhp6
	gT0FDgkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh2ed-0000000131M-0HGD;
	Wed, 30 Jul 2025 08:59:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh2c7-000000012RE-3gV2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 08:56:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 063061BC0;
	Wed, 30 Jul 2025 01:56:32 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 917383F66E;
	Wed, 30 Jul 2025 01:56:39 -0700 (PDT)
Date: Wed, 30 Jul 2025 09:56:37 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mark Brown <broonie@kernel.org>, Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/10] coresight: Appropriately disable programming
 clocks
Message-ID: <20250730085637.GB143191@e132581.arm.com>
References: <20250724-arm_cs_fix_clock_v4-v5-0-63f648dae021@arm.com>
 <20250724-arm_cs_fix_clock_v4-v5-4-63f648dae021@arm.com>
 <b3782b8f-8c09-4fb8-bec6-186102cc66a8@sirena.org.uk>
 <f9fb2174-5bc5-4c7b-b74b-8542b4f7cbe0@sirena.org.uk>
 <15370a42-8e92-4f57-9ff2-f283d9fd30bd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15370a42-8e92-4f57-9ff2-f283d9fd30bd@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_015643_961306_03A04073 
X-CRM114-Status: GOOD (  22.18  )
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

On Tue, Jul 29, 2025 at 01:30:28PM +0100, Suzuki Kuruppassery Poulose wrote:
> On 29/07/2025 12:31, Mark Brown wrote:
> > On Mon, Jul 28, 2025 at 05:45:04PM +0100, Mark Brown wrote:
> > > On Thu, Jul 24, 2025 at 04:22:34PM +0100, Leo Yan wrote:
> > > 
> > > Previously we would return NULL for any error (which isn't super great
> > > for deferred probe but never mind).
> > > 
> > > > +	pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > > > +	if (IS_ERR(pclk))
> > > > +		pclk = devm_clk_get_enabled(dev, "apb");
> > > 
> > > ...
> > > 
> > > >   	return pclk;
> > > >   }
> > > 
> > > Now we pass errors back to the caller, making missing clocks fatal.
> > 
> > Thinking about this some more I think for compatiblity these clocks need
> > to be treated as optional - that's what the original code was
> > effectively doing, and I can imagine this isn't the only SoC which has
> > (hopefully) always on clocks and didn't wire things up in DT.
> 
> You're right. The static components (funnels, replicators) don't have
> APB programming interface and hence no clocks. That said, may be the
> "is amba device" check could be used to enforce the presence of a clock.

I was wondering how this issue slipped through when I tested it on the
Hikey960 board. The Hikey960 also has one static funnel, but it binds
pclk with the static funnel node. That's why I didn't detect the issue.

I don't think using optional clock API is right thing, as DT binding
schema claims the pclk is mandatory for dynamic components. My proposal
is to enable the clocks only when IORESOURCE_MEM is available, something
like:

  if (res) {
      ret = coresight_get_enable_clocks(dev, &drvdata->pclk,
                                        &drvdata->atclk);
      if (ret)
              return ret;

      base = devm_ioremap_resource(dev, res);
      ...
  }

The static components don't bind I/O resources, it is naturally not to
enable clocks for them. Please let me know if this is reasonable
solution.

@Mark, thanks a lot for testing and bisection.

Leo


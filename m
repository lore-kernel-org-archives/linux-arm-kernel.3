Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC7AF8E4B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 07:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fpxp29leS73wOStfPTj4yNCDV4Cy4Cm+kHYvfTMPm1Y=; b=GHvcG7GWjtI+BIBeaJWhGRbR4W
	EjeAiLw2/gXI0RngHjKoJGi0eKDspjHchY1eHtN//uX5PM1t3Rb9sY+Q4LWQ358sy4Nf1ckrpgiFI
	Zyg/MXm15wUE+hKH+PT44LgMa/ZjkDzdgWAoASIR8KjFR6qz2Y0wopUsuSnORZUM6rZ5G5EWY3qI+
	UB0lVgVY+I14FXJH7MbxXlQHbbazspE6kBT1WDCdzwG5M6O2NqIxUzZsYU4/TGkN5MR7EklgeSXhT
	nrlD2YWMoP/8jzYqvO1DfpnESlw/G99e+O9ZcDkzkGVnFBgH6OE+fes5L4B2Qham/g13IDjSeBTRZ
	s/JvKOpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDe0e-00000003cxH-0n8j;
	Fri, 17 Apr 2026 07:53:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDe0a-00000003cvX-2Pgo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 07:53:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7279B1FC7;
	Fri, 17 Apr 2026 00:52:52 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3DD03F7B4;
	Fri, 17 Apr 2026 00:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776412378; bh=JeVqxJf/IWIdjjFYdX/EzgOh5qNuv0u1m7eLpaiUOzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FrPDRkwRnK/Md38TY+WIZJh3m1M9DuW+2bANAD0vZkUFQyvvPfsbMx6m/OweRO4Ky
	 gdC4JHOFkxCkCjRg9p2tnEQa9mefuM5MpgmjBSX5lH3nJ+VHvrwBqo35lj3j2/gqcS
	 JdU+hqmP8S2MPFCBfHdXadBgSWJzxZl26fFAOHE8=
Date: Fri, 17 Apr 2026 08:52:55 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v5 06/12] coresight: etm4x: fix leaked trace id
Message-ID: <20260417075255.GO356832@e132581.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-7-yeoreum.yun@arm.com>
 <20260416165541.GN356832@e132581.arm.com>
 <aeEXIfEA5NpqhGX1@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeEXIfEA5NpqhGX1@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_005300_762865_26E43435 
X-CRM114-Status: GOOD (  17.48  )
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

Hi Levi,

On Thu, Apr 16, 2026 at 06:06:41PM +0100, Yeoreum Yun wrote:

[...]

> > We should use paired way for allocation and release. For example:
> >
> >   coresight_enable_sysfs()
> >   {
> >       ...
> >       coresight_path_assign_trace_id(path);
> >
> >   failed:
> >       coresight_path_unassign_trace_id(path);
> >   }
> >
> >   coresight_disable_sysfs()
> >   {
> >       coresight_path_unassign_trace_id(path);
> >   }
> >
> > But this requires broader refactoring.  E.g., the STM driver currently
> > allocates system trace IDs statically during probe, we might need to
> > consolidate for all modules to use dynamic allocation.
> 
> So IIUC, Do we want to "map" per "session" and save this map information
> in the "sink" driver? or just use "global" map but locate it in sink
> driver?

I prefer to save map in the sink's driver data, this is more scalable
as the trace ID is allocated within a session rather than system wide.

> I totally agree for above suggestion -- unsigned trace id
> in the coresight_XXX function -- (but we need to add another callback
> for this) but I think we don't need to sustain map per session
> and it seems enough to use current storage for trace_id not move to
> sink driver.
> 
> Anyway It would be better to refactorying wiht another patchset...

Yeah, we can come back to these ideas when work on it.

Thanks,
Leo


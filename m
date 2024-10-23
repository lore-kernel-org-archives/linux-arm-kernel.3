Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04BFCFA456
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mOi/NqeLHC3esm17jNs1ScSwhbLpXPm0FuoOUMlRDo=; b=rUY0T2UsXyW7BBYxYK8RsSqsOI
	U0wfXsE6SFd1h3Rl75JSuMdKQj2ezTB0W2Cy3s5evnzdHG/+pRWYCqPAO4G1geoZ8U8aQrme4iNqo
	DcYPp87OCbaiCuNd1vDVQ3Jwt77vvUbYOlE0a+BPgflNKV8t9T48Ugu1bZu6Mq23CfPWblfp7gBWr
	4xoqc/DIiao3lc47JxOezJKcGpwPegSoFGWfY19ZKwgfNrTSmvfg6Ly1p4W7IXKRLOFnT2pcS8rZq
	RfHQs/dRUFHfGq2j0KX3yZo4CajeYVO0zaKBX87etLq3Ii3/k1Ccru3w8M2eig4dTWwDqHlWcMIIa
	zBDE12+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3epT-0000000FIGG-2Q92;
	Wed, 23 Oct 2024 17:07:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eCC-0000000F9q4-0vWC
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 16:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+mOi/NqeLHC3esm17jNs1ScSwhbLpXPm0FuoOUMlRDo=; b=hynLiP3dXlMRIK6z/MbSZJH4yu
	/TK3n3Ii6RqZXNXqfeVUGD1I8VxhD+duPkg6veWOilKH0OhPDMPUFzxALD6vNpAB8BdgGfEe5AdqJ
	8gJjN2nj/uWxBhvHX814v6mH4oe8w5HS/TJWbZdvOiJ1Ge1nCWyA0kAZjOixFQPZdV46CUDnfrxfN
	YhxUHn6sPSegaWwkA+jHco3ZfJGpwuqGTJpuza6f6Vs10p5lH+cBuvcuDwznObNLsdj1D7Q2cCvYE
	TmyUYHSypLODuZtXYdF8AqhpXjaxUV2MP1iGgvdSRHkiPi1G2YwpLygsBbD7ryrHCxnA2b+GEA2Bf
	T3aBGOiw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eC8-00000008Rmb-2RPT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:26:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E29C35C5AFC;
	Wed, 23 Oct 2024 16:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4D9C4CEE4;
	Wed, 23 Oct 2024 16:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729700803;
	bh=n1frDIgSsJcb/DRHKoimwPh5ZqPXxcX87y/aHbisXI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iS8SwAceI/y883d1QM0e5+48FVIPf3L+8Mz/GjEfuZrGWWXDcAJ2RrTwYmSaIWBeg
	 rNTIQwAqsfAISoCmTnPYwQnKlV6q29x2KBLrnzsj31GYFIRbFA7IEWWrV6EcTdFjSe
	 EwtB4/Y0QeYqmZdHIdOW0G1stht+nm7AeyNiY1LSQ6EosDB8k9q4CCx943B+Q4pOjt
	 ovvKb8HeaPJtjJC8NZVUk1UNcjv9f0dIuJ34bA7ODa39zdsCkojr21gc0uN2gGmUOT
	 zGBYd4k/cNja/uE57SUKTSgib3LaYLlytnKIS3jdNSZ/fukgaahZYCJ7AlJhdhecCr
	 G/NVNHotylvUw==
Date: Wed, 23 Oct 2024 17:26:37 +0100
From: Will Deacon <will@kernel.org>
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>,
	Rich Wiley <rwiley@nvidia.com>, Bob Knight <rknight@nvidia.com>
Subject: Re: [PATCH 2/3] perf: arm_cspmu: nvidia: update CNVLINK PMU events
Message-ID: <20241023162636.GA29251@willie-the-truck>
References: <20240918215846.1424282-1-bwicaksono@nvidia.com>
 <20240918215846.1424282-3-bwicaksono@nvidia.com>
 <20241014131903.GB17353@willie-the-truck>
 <SJ0PR12MB5676697B93C267CE87C5A474A0452@SJ0PR12MB5676.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR12MB5676697B93C267CE87C5A474A0452@SJ0PR12MB5676.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_172649_116008_D1CA6BEF 
X-CRM114-Status: GOOD (  22.67  )
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

On Tue, Oct 15, 2024 at 05:21:06PM +0000, Besar Wicaksono wrote:
> 
> 
> > -----Original Message-----
> > From: Will Deacon <will@kernel.org>
> > Sent: Monday, October 14, 2024 8:19 AM
> > To: Besar Wicaksono <bwicaksono@nvidia.com>
> > Cc: suzuki.poulose@arm.com; robin.murphy@arm.com;
> > catalin.marinas@arm.com; mark.rutland@arm.com; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> > tegra@vger.kernel.org; Thierry Reding <treding@nvidia.com>; Jon Hunter
> > <jonathanh@nvidia.com>; Vikram Sethi <vsethi@nvidia.com>; Rich Wiley
> > <rwiley@nvidia.com>; Bob Knight <rknight@nvidia.com>
> > Subject: Re: [PATCH 2/3] perf: arm_cspmu: nvidia: update CNVLINK PMU
> > events
> > 
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Wed, Sep 18, 2024 at 09:58:45PM +0000, Besar Wicaksono wrote:
> > > Rename loc* and rem* events in CNVLINK PMU to cmem* and gmem*
> > events.
> > >
> > > Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> > > ---
> > >  drivers/perf/arm_cspmu/nvidia_cspmu.c | 21 ++++++++++++++++++++-
> > >  1 file changed, 20 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > index ea2d44adfa7c..d1cd9975e71a 100644
> > > --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > @@ -112,6 +112,25 @@ static struct attribute *mcf_pmu_event_attrs[] = {
> > >       NULL,
> > >  };
> > >
> > > +static struct attribute *mcf_cnvlink_pmu_event_attrs[] = {
> > > +     ARM_CSPMU_EVENT_ATTR(rd_bytes_cmem,                     0x0),
> > > +     ARM_CSPMU_EVENT_ATTR(rd_bytes_gmem,                     0x1),
> > > +     ARM_CSPMU_EVENT_ATTR(wr_bytes_cmem,                     0x2),
> > > +     ARM_CSPMU_EVENT_ATTR(wr_bytes_gmem,                     0x3),
> > > +     ARM_CSPMU_EVENT_ATTR(total_bytes_cmem,                  0x4),
> > > +     ARM_CSPMU_EVENT_ATTR(total_bytes_gmem,                  0x5),
> > > +     ARM_CSPMU_EVENT_ATTR(rd_req_cmem,                       0x6),
> > > +     ARM_CSPMU_EVENT_ATTR(rd_req_gmem,                       0x7),
> > > +     ARM_CSPMU_EVENT_ATTR(wr_req_cmem,                       0x8),
> > > +     ARM_CSPMU_EVENT_ATTR(wr_req_gmem,                       0x9),
> > > +     ARM_CSPMU_EVENT_ATTR(total_req_cmem,                    0xa),
> > > +     ARM_CSPMU_EVENT_ATTR(total_req_gmem,                    0xb),
> > > +     ARM_CSPMU_EVENT_ATTR(rd_cum_outs_cmem,                  0xc),
> > > +     ARM_CSPMU_EVENT_ATTR(rd_cum_outs_gmem,                  0xd),
> > > +     ARM_CSPMU_EVENT_ATTR(cycles,
> > ARM_CSPMU_EVT_CYCLES_DEFAULT),
> > > +     NULL,
> > > +};
> > > +
> > >  static struct attribute *generic_pmu_event_attrs[] = {
> > >       ARM_CSPMU_EVENT_ATTR(cycles,
> > ARM_CSPMU_EVT_CYCLES_DEFAULT),
> > >       NULL,
> > > @@ -234,7 +253,7 @@ static const struct nv_cspmu_match
> > nv_cspmu_match[] = {
> > >         .filter_default_val = NV_CNVL_FILTER_ID_MASK,
> > >         .name_pattern = "nvidia_cnvlink_pmu_%u",
> > >         .name_fmt = NAME_FMT_SOCKET,
> > > -       .event_attr = mcf_pmu_event_attrs,
> > > +       .event_attr = mcf_cnvlink_pmu_event_attrs,
> > >         .format_attr = cnvlink_pmu_format_attrs
> > >       },
> > 
> > Hmm. Isn't this a user-visible change? For example, will scripts driving
> > 'perf' with the old event names continue to work after this patch?
> > 
> 
> Yes this is user visible. I am expecting user script to be updated accordingly.
> Would this be reasonable?

I don't think so, no. We don't tend to require userspace changes as a
result of upgrading the kernel.

Will


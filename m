Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7170ED5B87D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 06:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pp5jahF4EDqnMQhR+QnYtwvUC2IOWyJKC9FlrE8KMeA=; b=jyWIN8oaox/DGMSQ+r+m2Gl8Lw
	1ItndG9skzVW1i+oa8HFWz+Ngoi40BK6kmf/YO2Y23R5WWwU6RXzXFWRDpURxesZPRJsC/MgkeBUB
	nEU2NlnMx/eJ87CpQfGNI4Zfqi/cmoj9/iCcJ3WWEbhlkfzX/+iSjuxu9XBBxUvn5p8LDIIN2e/iV
	9LSy1NvWacjYEajNV16hIw1dZFuim88EFlcR4oYEKb7Tqj5aqQcpNpUAsbnhv1k2QnNglRZwNgI3i
	cSXDsBHnSoTbIytXD0vZ5URY5w3RuP57TmGQUFg8ls99JEr1/v6Qdy7b6zZLYo+DEHuYIyYgK4iyl
	eMxwwE6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5fgh-0000000DMgn-2BSk;
	Tue, 29 Oct 2024 06:26:43 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ff5-0000000DMXm-1uWT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 06:25:04 +0000
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SGnATX020366;
	Mon, 28 Oct 2024 23:24:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=pp5jahF4EDqnMQhR+QnYtwvUC
	2IOWyJKC9FlrE8KMeA=; b=QXt+xrmDZb96FERvZb/Yoh+e/sKhp7bpbySOqT9XM
	/0YOla1nyiEG+8ooAyCM1VaHnosdrSjEEM93agPQdECIONop4mKJ3RbacEG3SE0g
	jlStwyKNHKXaagxaU7mKd33KocPlMXOrNidWgGdZScDCAryndMQQYyvAcJuY+oAQ
	u/Utomn4wqBDyO5C4Q8MlmzeF928PXenh/r5NgVluES7nDLI0iiUhR7eA4YgR6y9
	kdGRY3C5X+KRlh+w+bjDwjCJEuVdoQgXIDMPBUT4dFehzncHcMPbi8vdqA7PlbUK
	v3EBFqAToQmgnQyUMaIMmi6cL+jRPikKzJYUp8C3iFfqw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 42gyxf5mkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 23:24:47 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 28 Oct 2024 23:24:46 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 28 Oct 2024 23:24:46 -0700
Received: from hyd1403.caveonetworks.com (unknown [10.29.37.84])
	by maili.marvell.com (Postfix) with SMTP id 691C35E6988;
	Mon, 28 Oct 2024 23:24:42 -0700 (PDT)
Date: Tue, 29 Oct 2024 11:54:41 +0530
From: Linu Cherian <lcherian@marvell.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
CC: <mike.leach@linaro.org>, <james.clark@arm.com>,
        <linux-arm-kernel@lists.infradead.org>, <coresight@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <devicetree@vger.kernel.org>, <sgoutham@marvell.com>,
        <gcherian@marvell.com>
Subject: Re: [PATCH v10 4/8] coresight: tmc: Enable panic sync handling
Message-ID: <20241029062441.GB978396@hyd1403.caveonetworks.com>
References: <20240916103437.226816-1-lcherian@marvell.com>
 <20240916103437.226816-5-lcherian@marvell.com>
 <6b405b22-9b1e-487b-9b9c-5944358488e2@arm.com>
 <20241017121221.GA901001@hyd1403.caveonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241017121221.GA901001@hyd1403.caveonetworks.com>
X-Proofpoint-ORIG-GUID: tkJii9xgf4CURtHesQRos5sbQK2ofMBW
X-Proofpoint-GUID: tkJii9xgf4CURtHesQRos5sbQK2ofMBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_232503_647987_9F85BFB0 
X-CRM114-Status: GOOD (  39.95  )
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

Hi Suzuki,

On 2024-10-17 at 17:42:21, Linu Cherian (lcherian@marvell.com) wrote:
> Hi Suzuki,
> 
> On 2024-10-01 at 22:13:12, Suzuki K Poulose (suzuki.poulose@arm.com) wrote:
> > Hi Linu
> > 
> > On 16/09/2024 11:34, Linu Cherian wrote:
> > > - Get reserved region from device tree node for metadata
> > > - Define metadata format for TMC
> > > - Add TMC ETR panic sync handler that syncs register snapshot
> > >    to metadata region
> > > - Add TMC ETF panic sync handler that syncs register snapshot
> > >    to metadata region and internal SRAM to reserved trace buffer
> > >    region.
> > 
> > The patch looks good overall. Some minor comments below.
> > 
> > > 
> > > Signed-off-by: Linu Cherian <lcherian@marvell.com>
> > > ---
> > > Changelog from v9:
> > > - Add common helper function of_tmc_get_reserved_resource_by_name
> > >    for better code reuse
> > > - Inorder to keep the reserved buffer validity and crashdata validity
> > >    independent, is_tmc_reserved_region_valid renamed to tmc_has_reserved_buffer
> > > - drvdata->crash_tbuf renamed to drvdata->resrv_buf
> > > - New fields added to crash metadata: version, ffcr, ffsr, mode
> > > - Defined crashdata version with Major version 1, Minor version 0
> > > - Set version while creating crashdata record
> > > - Removed Reviewed-by tag due to the above changes
> > >   .../hwtracing/coresight/coresight-tmc-core.c  | 14 ++++
> > >   .../hwtracing/coresight/coresight-tmc-etf.c   | 77 ++++++++++++++++++
> > >   .../hwtracing/coresight/coresight-tmc-etr.c   | 78 +++++++++++++++++++
> > >   drivers/hwtracing/coresight/coresight-tmc.h   | 66 ++++++++++++++++
> > >   4 files changed, 235 insertions(+)
> > > 
> > > diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> > > index 0764c21aba0f..54bf8ae2bff8 100644
> > > --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> > > +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> > > @@ -445,6 +445,20 @@ static void tmc_get_reserved_region(struct device *parent)
> > >   	drvdata->resrv_buf.paddr = res.start;
> > >   	drvdata->resrv_buf.size  = resource_size(&res);
> > > +
> > > +	if (of_tmc_get_reserved_resource_by_name(parent, "metadata", &res))
> > > +		return;
> > > +
> > > +	drvdata->crash_mdata.vaddr = memremap(res.start,
> > > +					       resource_size(&res),
> > > +					       MEMREMAP_WC);
> > > +	if (IS_ERR_OR_NULL(drvdata->crash_mdata.vaddr)) {
> > > +		dev_err(parent, "Metadata memory mapping failed\n");
> > > +		return;
> > > +	}
> > > +
> > > +	drvdata->crash_mdata.paddr = res.start;
> > > +	drvdata->crash_mdata.size  = resource_size(&res);
> > >   }
> > >   /* Detect and initialise the capabilities of a TMC ETR */
> > > diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> > > index d4f641cd9de6..d77ec9307e98 100644
> > > --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> > > +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> > > @@ -590,6 +590,78 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
> > >   	return to_read;
> > >   }
> > > +static int tmc_panic_sync_etf(struct coresight_device *csdev)
> > > +{
> > > +	u32 val;
> > > +	struct csdev_access *csa;
> > > +	struct tmc_crash_metadata *mdata;
> > > +	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> > > +
> > > +	csa = &drvdata->csdev->access;
> > > +	mdata = (struct tmc_crash_metadata *)drvdata->crash_mdata.vaddr;
> > > +
> > > +	/* Make sure we have valid reserved memory */
> > > +	if (!tmc_has_reserved_buffer(drvdata) ||
> > > +	    !tmc_has_crash_mdata_buffer(drvdata))
> > > +		return 0;
> > > +
> > > +	tmc_crashdata_set_invalid(drvdata);
> > > +
> > > +	CS_UNLOCK(drvdata->base);
> > > +
> > > +	/* Proceed only if ETF is enabled or configured as sink */
> > > +	val = readl(drvdata->base + TMC_CTL);
> > > +	if (!(val & TMC_CTL_CAPT_EN))
> > > +		goto out;
> > > +
> > 
> > minor nit : Since the check below is "covered" by the same comment
> > above, please drop the extra line here to make it clear that "we check
> > for sink" by checking the "MODE == CIRCULAR_BUFFER".
> 
> Ack.
> 
> > 
> > > +	val = readl(drvdata->base + TMC_MODE);
> > > +	if (val != TMC_MODE_CIRCULAR_BUFFER)
> > > +		goto out;
> > > +
> > > +	val = readl(drvdata->base + TMC_FFSR);
> > > +	/* Do manual flush and stop only if its not auto-stopped */
> > > +	if (!(val & TMC_FFSR_FT_STOPPED)) {
> > > +		dev_info(&csdev->dev,
> > > +			 "%s: Triggering manual flush\n", __func__);
> > 
> > Please drop the ^^^ line. We don't want to do anything like that from a
> > panic callback.
> 
> Ack.

Are we okay with converting this to dev_dbg, as this could be quite
helpful to understand if the CTI trigger has occured or not.


> 
> > 
> > > +		tmc_flush_and_stop(drvdata);
> > > +	} else
> > > +		tmc_wait_for_tmcready(drvdata);
> > > +
> > > +	/* Sync registers from hardware to metadata region */
> > > +	mdata->sts = csdev_access_relaxed_read32(csa, TMC_STS);
> > 
> > Why are we using "csa" here and not for TMC_CTL etc ? Simply drop the "csa"
> > and use the raw reads like above. TMC doesn't have anyother modes
> > of access.
> > 
> 
> Okay.
> 
> > > +	mdata->mode = csdev_access_relaxed_read32(csa, TMC_MODE);
> > > +	mdata->ffcr = csdev_access_relaxed_read32(csa, TMC_FFCR);
> > > +	mdata->ffsr = csdev_access_relaxed_read32(csa, TMC_FFSR);
> > > +	mdata->trace_paddr = drvdata->resrv_buf.paddr;
> > > +
> > > +	/* Sync Internal SRAM to reserved trace buffer region */
> > > +	drvdata->buf = drvdata->resrv_buf.vaddr;
> > > +	tmc_etb_dump_hw(drvdata);
> > > +	/* Store as per RSZ register convention */
> > > +	mdata->size = drvdata->len >> 2;
> > > +	mdata->version = CS_CRASHDATA_VERSION;
> > > +
> > > +	/*
> > > +	 * Make sure all previous writes are completed,
> > > +	 * before we mark valid
> > > +	 */
> > > +	dsb(sy);
> > 
> > I don't think this matters much, as this would only be read by a
> > secondary kernel. In the worst case, you only need `dmb(ish)` to make
> > sure the writes are visible before valid is set to true.
> 
> Ack. Will change that.
> 
> > 
> > > +	mdata->valid = true;
> > > +	/*
> > > +	 * Below order need to maintained, since crc of metadata
> > > +	 * is dependent on first
> > > +	 */
> > > +	mdata->crc32_tdata = find_crash_tracedata_crc(drvdata, mdata);
> > > +	mdata->crc32_mdata = find_crash_metadata_crc(mdata);
> > > +
> > > +	tmc_disable_hw(drvdata);
> > > +
> > > +	dev_info(&csdev->dev, "%s: success\n", __func__);
> > 
> > Please no "prints" from a panic call back, unless it absolutely CRITICAL.
> 
> Ack.

Are we okay with converting this to dev_dbg, as this could aid in
debugging to understand if kernel has populated valid metadata.

Thanks.
Linu Cherian.
 


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557FAD5B874
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 06:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1ynE8W+TczoalRe2wSDRe6sqYPAktMak8oWY7jsCYI=; b=PD9+rMn91dj0nBAtjfNRG4d9cH
	RiXM9xsIwJ0JjJ5KnwGGDt1+XoUooyvAllNddRs1fbuSygi5OvFso8+CfAGeprorR/IlgIaLq8R1k
	Q/wSZjOEKyf4PVdsak8eeN8bwsbQOLtilbMaygNjF/BvBN8FPXVC6wNQGG7EZWj9HMCsQlPPCSFQi
	sWslsbEANkpT0JaXv0K1P82XNQnx/SNIFyPYpb+T2jKbkmm196RufIDmMI5y3B+8eVNRk3zVU3Ypj
	Sz+Y2507TlDQj2Y7I7nsrohaKcvPqEHavjYIcbiQ2ZTXPC0nmGdoCN1JXh+xOoMC8nqBxMRZ5aETT
	vSGfhYKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5feR-0000000DMTT-1aUw;
	Tue, 29 Oct 2024 06:24:23 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5fbh-0000000DMGz-2ypM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 06:21:36 +0000
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T3RJiS021204;
	Mon, 28 Oct 2024 23:21:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=K1ynE8W+TczoalRe2wSDRe6sq
	YPAktMak8oWY7jsCYI=; b=X96Z6NadRlY/3RJ/wrj4rspCBCqunD2jQEbLypL8S
	quVqkqRtZKcxOO2TgdTNkkUpTAx5a5yobBNR93Gg6NtPMwmsgDu1NwR6YexiE7Pg
	MUQ3fWcTjWmvIXGou9kMxx0dk5I7a04cNL/9jVzhzloIwplGU7rEn6E0paHO8Od4
	pA9fryHIENQXyq1zTZ8kIqtVY3mpG0bdyHLCY92QD2e0//OgBbfVr5fOa0JQI7pU
	kXEc32UWFYi435EFjYv3ZR3xBSgdrIlKCeDwNJ3pu6MFnQX9AvQo3ceiUWSJOseX
	VRz4Zj8rJoWgFC8YXtL7Izpk8XIMjoV0Gm6fYISUaYKuQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 42jqtcgb0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 23:21:19 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 28 Oct 2024 23:21:18 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 28 Oct 2024 23:21:18 -0700
Received: from hyd1403.caveonetworks.com (unknown [10.29.37.84])
	by maili.marvell.com (Postfix) with SMTP id 7FD5E5E6988;
	Mon, 28 Oct 2024 23:21:13 -0700 (PDT)
Date: Tue, 29 Oct 2024 11:51:12 +0530
From: Linu Cherian <lcherian@marvell.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
CC: <mike.leach@linaro.org>, <james.clark@arm.com>,
        <linux-arm-kernel@lists.infradead.org>, <coresight@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <devicetree@vger.kernel.org>, <sgoutham@marvell.com>,
        <gcherian@marvell.com>, Anil Kumar Reddy <areddy3@marvell.com>,
        "Tanmay
 Jagdale" <tanmay@marvell.com>
Subject: Re: [PATCH v10 5/8] coresight: tmc: Add support for reading crash
 data
Message-ID: <20241029062112.GA978396@hyd1403.caveonetworks.com>
References: <20240916103437.226816-1-lcherian@marvell.com>
 <20240916103437.226816-6-lcherian@marvell.com>
 <f1acfd07-7317-4b7e-bb81-ea9a894f25ac@arm.com>
 <20241017114054.GC896339@hyd1403.caveonetworks.com>
 <05ed4a6f-cb41-4953-a654-9988f0fcd373@arm.com>
 <20241021124040.GA929726@hyd1403.caveonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241021124040.GA929726@hyd1403.caveonetworks.com>
X-Proofpoint-ORIG-GUID: NKPqAWKODujtGMfbgAstczsDI6RTCe7E
X-Proofpoint-GUID: NKPqAWKODujtGMfbgAstczsDI6RTCe7E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_232133_795018_654F71CC 
X-CRM114-Status: GOOD (  55.22  )
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

On 2024-10-21 at 18:10:40, Linu Cherian (lcherian@marvell.com) wrote:
> Hi Suzuki,
> 
> On 2024-10-18 at 15:16:17, Suzuki K Poulose (suzuki.poulose@arm.com) wrote:
> > On 17/10/2024 12:40, Linu Cherian wrote:
> > > On 2024-10-03 at 18:55:54, Suzuki K Poulose (suzuki.poulose@arm.com) wrote:
> > > > Hi Linu
> > > > 
> > > > On 16/09/2024 11:34, Linu Cherian wrote:
> > > > > * Add support for reading crashdata using special device files.
> > > > >     The special device files /dev/crash_tmc_xxx would be available
> > > > >     for read file operation only when the crash data is valid.
> > > > > 
> > > > > * User can read the crash data as below
> > > > > 
> > > > >     For example, for reading crash data from tmc_etf sink
> > > > > 
> > > > >     #dd if=/dev/crash_tmc_etfXX of=~/cstrace.bin
> > > > 
> > > > There are some comments below, please take a look.
> > > > 
> > > > > 
> > > > > Signed-off-by: Anil Kumar Reddy <areddy3@marvell.com>
> > > > > Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
> > > > > Signed-off-by: Linu Cherian <lcherian@marvell.com>
> > > > > ---
> > > > > Changelog from v9:
> > > > > - Removed READ_CRASHDATA mode meant for special casing crashdata read
> > > > > - Added new fields full, len, offset to struct tmc_resrv_buf
> > > > 
> > > > Why do we need "full" ? See more on that below.
> > > > 
> > > > >     so as to have a common read function for ETR and ETF
> > > > > - Introduced read file operation, tmc_crashdata_read
> > > > >     specific to crashdata reads common for both ETR and ETF
> > > > > - Introduced is_tmc_crashdata_valid function
> > > > >     Special device file /dev/crash_tmc_xxx will be available only when
> > > > >     crashdata is valid.
> > > > > - Version checks added to crashdata validity checks
> > > > > - Mark crashdata as invalid when user starts tracing with ETR sink in
> > > > >     "resrv" buffer mode
> > > > > 
> > > > >    .../hwtracing/coresight/coresight-tmc-core.c  | 206 +++++++++++++++++-
> > > > >    .../hwtracing/coresight/coresight-tmc-etf.c   |  36 +++
> > > > >    .../hwtracing/coresight/coresight-tmc-etr.c   |  63 ++++++
> > > > >    drivers/hwtracing/coresight/coresight-tmc.h   |  18 +-
> > > > >    include/linux/coresight.h                     |  12 +
> > > > >    5 files changed, 333 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> > > > > index 54bf8ae2bff8..47b6b3f88750 100644
> > > > > --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> > > > > +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> > > > > @@ -105,6 +105,125 @@ u32 tmc_get_memwidth_mask(struct tmc_drvdata *drvdata)
> > > > >    	return mask;
> > > > >    }
> > > > > +bool is_tmc_crashdata_valid(struct tmc_drvdata *drvdata)
> > > > > +{
> > > > > +	struct tmc_crash_metadata *mdata;
> > > > > +
> > > > > +	if (!tmc_has_reserved_buffer(drvdata) ||
> > > > > +	    !tmc_has_crash_mdata_buffer(drvdata))
> > > > > +		return false;
> > > > > +
> > > > > +	mdata = drvdata->crash_mdata.vaddr;
> > > > > +
> > > > > +	/* Check version match */
> > > > > +	if (mdata->version != CS_CRASHDATA_VERSION)
> > > > > +		return false;
> > > > > +
> > > > > +	/* Check data integrity of metadata */
> > > > > +	if (mdata->crc32_mdata != find_crash_metadata_crc(mdata)) {
> > > > > +		dev_dbg(&drvdata->csdev->dev,
> > > > > +			"CRC mismatch in tmc crash metadata\n");
> > > > > +		return false;
> > > > > +	}
> > > > > +	/* Check data integrity of tracedata */
> > > > > +	if (mdata->crc32_tdata != find_crash_tracedata_crc(drvdata, mdata)) {
> > > > > +		dev_dbg(&drvdata->csdev->dev,
> > > > > +			"CRC mismatch in tmc crash tracedata\n");
> > > > > +		return false;
> > > > > +	}
> > > > > +	/* Check for valid metadata */
> > > > > +	if (!mdata->valid) {
> > > > 
> > > > minor nit: This could be checked right after the VERSION and we verify
> > > > the CRC anyway later and thus could skip all the CRC calculations if
> > > > !valid.
> > > 
> > > 
> > > Ack.
> > > 
> > > > 
> > > > > +		dev_dbg(&drvdata->csdev->dev,
> > > > > +			"Data invalid in tmc crash metadata\n");
> > > > > +		return false;
> > > > > +	}
> > > > > +
> > > > > +	return true;
> > > > > +}
> > > > > +
> > > > > +int tmc_read_prepare_crashdata(struct tmc_drvdata *drvdata)
> > > > > +{
> > > > > +	int ret = 0;
> > > > > +	unsigned long flags;
> > > > > +	struct tmc_crash_metadata *mdata;
> > > > > +	struct coresight_device *csdev = drvdata->csdev;
> > > > > +
> > > > > +	spin_lock_irqsave(&drvdata->spinlock, flags);
> > > > > +
> > > > > +	if (!is_tmc_crashdata_valid(drvdata)) {
> > > > > +		ret = -ENXIO;
> > > > > +		goto out;
> > > > > +	}
> > > > > +
> > > > > +	mdata = drvdata->crash_mdata.vaddr;
> > > > > +	/*
> > > > > +	 * Buffer address given by metadata for retrieval of trace data
> > > > > +	 * from previous boot is expected to be same as the reserved
> > > > > +	 * trace buffer memory region provided through DTS
> > > > > +	 */
> > > > > +	if (drvdata->resrv_buf.paddr != mdata->trace_paddr) {
> > > > > +		dev_dbg(&csdev->dev, "Trace buffer address of previous boot invalid\n");
> > > > 
> > > > Couldn't this be made part of the "is_tmc_crashdata_valid()" and not
> > > > repeated everytime we do the read ? Surely, this can't change after
> > > > boot.
> > > 
> > > Ack. Will move.
> > > 
> > > > 
> > > > > +		ret = -EINVAL;
> > > > > +		goto out;
> > > > > +	}
> > > > > +
> > > > > +	/* Sink specific crashdata mode preparation */
> > > > > +	ret = crashdata_ops(csdev)->prepare(csdev);
> > > > > +	if (ret)
> > > > > +		goto out;
> > > > > +
> > > > > +	if (mdata->sts & 0x1)
> > > > > +		coresight_insert_barrier_packet(drvdata->buf);
> > > > > +
> > > > > +	drvdata->reading = true;
> > > > 
> > > > Why are we dealing with drvdata->reading ? That is supposed to be only
> > > > for the normal trace reading ?
> > > 
> > > Ack. Will remove, we dont need this.
> > > 
> > > > 
> > > > > +out:
> > > > > +	spin_unlock_irqrestore(&drvdata->spinlock, flags);
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +int tmc_read_unprepare_crashdata(struct tmc_drvdata *drvdata)
> > > > > +{
> > > > > +	int ret;
> > > > > +	unsigned long flags;
> > > > > +	struct coresight_device *csdev = drvdata->csdev;
> > > > > +
> > > > > +	spin_lock_irqsave(&drvdata->spinlock, flags);
> > > > > +
> > > > > +	/* Sink specific crashdata mode preparation */
> > > > > +	ret = crashdata_ops(csdev)->unprepare(csdev);
> > > > > +
> > > > > +	drvdata->reading = false;
> > > > 
> > > > 
> > > > 
> > > > > +	spin_unlock_irqrestore(&drvdata->spinlock, flags);
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +static inline ssize_t tmc_get_resvbuf_trace(struct tmc_drvdata *drvdata,
> > > > > +					  loff_t pos, size_t len, char **bufpp)
> > > > > +{
> > > > > +	s64 offset;
> > > > > +	ssize_t actual = len;
> > > > > +	struct tmc_resrv_buf *rbuf = &drvdata->resrv_buf;
> > > > > +
> > > > > +	if (pos + actual > rbuf->len)
> > > > > +		actual = rbuf->len - pos;
> > > > > +	if (actual <= 0)
> > > > > +		return actual;
> > > > 
> > > > return 0 ? Because, we went beyond the file position, not because there was
> > > > an error. So, that it doesn't look like we are suppressing an ERROR ?
> > > 
> > > 
> > > return 0 looks fine to me. Will recheck on this.
> > > 
> > > > 
> > > > 
> > > > > +
> > > > > +	/* Compute the offset from which we read the data */
> > > > > +	offset = rbuf->offset + pos;
> > > > > +	if (offset >= rbuf->size)
> > > > > +		offset -= rbuf->size;
> > > > > +
> > > > > +	/* Adjust the length to limit this transaction to end of buffer */
> > > > > +	actual = (actual < (rbuf->size - offset)) ?
> > > > > +		actual : rbuf->size - offset;
> > > > > +
> > > > > +	*bufpp = (char *)rbuf->vaddr + offset;
> > > > > +
> > > > > +	return actual;
> > > > > +}
> > > > > +
> > > > >    static int tmc_read_prepare(struct tmc_drvdata *drvdata)
> > > > >    {
> > > > >    	int ret = 0;
> > > > > @@ -224,6 +343,70 @@ static const struct file_operations tmc_fops = {
> > > > >    	.llseek		= no_llseek,
> > > > >    };
> > > > > +static int tmc_crashdata_open(struct inode *inode, struct file *file)
> > > > > +{
> > > > > +	int ret;
> > > > > +	struct tmc_drvdata *drvdata = container_of(file->private_data,
> > > > > +						   struct tmc_drvdata,
> > > > > +						   crashdev);
> > > > > +
> > > > > +	ret = tmc_read_prepare_crashdata(drvdata);
> > > > 
> > > > I don't see the point of this "prepare" and unprepare callbacks, as they
> > > > can be made generic by populating the mdata->rrp,rwp fields accordingly ?
> > > > 
> > > > i.e., while populating the mdata-> fields, for ETR, do what you do now.
> > > > For ETF you could :
> > > > 
> > > > mdata->rrp = 0;
> > > > mdata->dba = 0;
> > > > mdata->rwp = drvdata->len;
> > > > mdata->size = drvdata->len >> 2;
> > > > mdata->sts = TMC_STS_FULL;
> > > 
> > > Agree with your point that this would get rid of sink specific
> > > callbacks.
> > > 
> > > But few points to consider before we go with the above approach,
> > > 
> > > * mdata register snapshots wont be true to their definition,
> > >    with such encodings.
> > > 
> > >    We had a similar discussion on this earlier regarding mdata->size,
> > >    ie. We decided to stick to register format instead of storing bytes.
> > >    https://lore.kernel.org/linux-arm-kernel/20240620041054.GC125816@hyd1403.caveonetworks.com/
> > 
> > Understood. But whoever fills in the metdata does need to fill the
> > mdata information above ? Including calculating the hash. So, I think it
> > is fair to say that mdata is populated in a way that makes sense
> > just by looking at it. In fact, we should :
> > 
> > 
> > mdata->dba = <address of the tracedata>
> > mdata->rrp = mdata->dba;
> > mdata->rwp = mdata->rrp + drvdata->len;
> > mdata->size = drvdata->len >> 2;
> > mdata->sts = TMC_STS_FULL;
> > 
> > Rather than filling in 0's.

Just wanted to point out that, in case of watchdog reset when firmware
is updating this, dba would be the physical address while in ETR case
it could be virtual address (with IOMMU).
So in that regard, filling in zeros seems better to me for rrp and dba. 

Please let me know your preference on this.

Thanks.


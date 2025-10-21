Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23F0CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 10:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppNHjezhbV7zB7a2r6Zz9ErjphbaQPM26X61mEuUHZY=; b=BIgXMzmHEncS7EtHQkGUiqujE7
	yTuLAaO9lWWvyt9bslNvfNEHExS+5nkOvunrdSD5E7ZZum8nujy0BxaiWDoITGxjUVK3te7GdYpct
	XR1NrTRu77FpzHm+nGL9ymHItHccrduK9Ec0ohE28GzGKfhg2uyWJ1YbU1zXyftooMr51qh9dMugk
	8RYSH7sz6wffhmeLVsXPrqX4J9fQOnuLf4JWeV/F1dWIqvDlICAed50u5nC7+uXRxGsBwrB+xtze0
	uAbA6dSUQ8X2QA6ObcNxDYcx6AKfD0bNR/FeSfnBp6JO16BAIO0NAbuqLJc301mqEHvcuNM3cTH++
	PQK/nMKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9dJ-0000000Gd98-0cc0;
	Tue, 21 Oct 2025 10:30:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9dG-0000000Gd7T-14Vp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 10:30:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DC221007;
	Tue, 21 Oct 2025 03:30:13 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72FA43F63F;
	Tue, 21 Oct 2025 03:30:18 -0700 (PDT)
Date: Tue, 21 Oct 2025 11:30:16 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [PATCH 07/10] firmware: arm_scmi: Add System Telemetry ioctls
 support
Message-ID: <aPdguGJ-fZFF7L3Y@pluto>
References: <20250925203554.482371-1-cristian.marussi@arm.com>
 <20250925203554.482371-8-cristian.marussi@arm.com>
 <20251020173034.00005c15@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020173034.00005c15@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_033022_350632_2B489FC5 
X-CRM114-Status: GOOD (  20.14  )
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

On Mon, Oct 20, 2025 at 05:30:34PM +0100, Jonathan Cameron wrote:
> On Thu, 25 Sep 2025 21:35:51 +0100
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Extend the filesystem based interface with special 'control' file that can
> > be used to configure and retrieve SCMI Telemetry data in binary form using
> > the alternative ioctls-based ABI described in uapi/linux/scmi.h.
> Why you say alternative.  Why do you need both?
> 
> That's in the cover letter but I'd put something here as well.

Ok..indeed all my babbling in teh cover wont be anywhere once merged.

> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> >  .../firmware/arm_scmi/scmi_system_telemetry.c | 402 ++++++++++++++++++
> >  1 file changed, 402 insertions(+)
> > 
> > diff --git a/drivers/firmware/arm_scmi/scmi_system_telemetry.c b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
> > index 2fec465b0f33..f591aad10302 100644
> > --- a/drivers/firmware/arm_scmi/scmi_system_telemetry.c
> > +++ b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
> 
> > +static long scmi_tlm_des_read_ioctl(const struct scmi_tlm_inode *tlmi,
> > +				    unsigned long arg, bool single,
> > +				    bool is_group)
> > +{
> > +	const struct scmi_tlm_setup *tsp = tlmi->tsp;
> > +	void * __user uptr = (void * __user)arg;
> > +	struct scmi_tlm_data_read bulk, *bulk_ptr;
> > +	int ret, grp_id = SCMI_TLM_GRP_INVALID;
> > +
> > +	if (copy_from_user(&bulk, uptr, sizeof(bulk)))
> > +		return -EFAULT;
> > +
> > +	bulk_ptr = kzalloc(struct_size(bulk_ptr, samples, bulk.num_samples),
> 
> __free() would help here.
> 

Ok.

> > +			   GFP_KERNEL);
> > +	if (!bulk_ptr)
> > +		return -ENOMEM;
> > +
> > +	if (is_group) {
> > +		const struct scmi_telemetry_group *grp = tlmi->priv;
> > +
> > +		grp_id = grp->info->id;
> > +	}
> > +
> > +	bulk_ptr->num_samples = bulk.num_samples;
> > +	if (!single)
> > +		ret = tsp->ops->des_bulk_read(tsp->ph, grp_id,
> > +					      &bulk_ptr->num_samples,
> > +			  (struct scmi_telemetry_de_sample *)bulk_ptr->samples);
> > +	else
> > +		ret = tsp->ops->des_sample_get(tsp->ph, grp_id,
> > +					       &bulk_ptr->num_samples,
> > +			  (struct scmi_telemetry_de_sample *)bulk_ptr->samples);
> 
> That is very unusual code alignment.  Drag 2 lines above left to match one line above.

Trying to please checkpatch while staying under 80 cols...BUT I know is NOT a
good reason for the above mess...

Thanks,
Cristian


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F82C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmFhfm/ycQNvBUk5VmeaGzE4MYZklDOtyKIWou97hTI=; b=zQ0/O12MNIyVw8zTwHpWKaOElE
	puB7rNckeH4Lv2VTxN8n62FjA4dZp3DT2MnnyZqWk7aBBaPwjs0yD6IXH/JeXKmwM2derBe+UubD+
	YbY6YFrnH4EjkRbpNCVkkltyDUrNWhiKYUa7ZPNpgpSK4DDUA9ghz9rMmGedsHSw7vOGKO0Fd2HXC
	P6Le68Clx9fus1sSWWeES2nV/FtYTwLObmPTTS4RtOiWRPlcG2e8VuEzrQOJ3/SSRVqQvduz3yetE
	Fl+2U/lK5xnyeXxyr46rDrF4Qj+5bRaowdJfA0mEqlvGHiqiysVP5d4Tq3TZA4zyP84vWcW9GRFqa
	OGv3HuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lO5-0000000ErNG-3yI5;
	Wed, 02 Sep 2026 13:52:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lO4-0000000ErN1-2prf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:52:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B0B440301;
	Wed,  2 Sep 2026 13:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D0A1F000E9;
	Wed,  2 Sep 2026 13:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788357143;
	bh=QmFhfm/ycQNvBUk5VmeaGzE4MYZklDOtyKIWou97hTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WPinB0zRFnUXHkzus3W+lndLqy3gUIAvGGafThEfeWRaKyFhAvFUIWCxhWmsggHlI
	 UYy2WVnrMdUjzb2q6eDMEaZbLO//1rl/VPhtBumpVRjJGeslODVe15TZAxTzeP6l1K
	 5cMig05M7SqaG4G62ayNB/cn8FAYjw1H4crE6FUwg5S5dEFknYHIQhcrSv1MwirDFE
	 jv4dw/jAhHOQ6XNjRypAVuvZ9TLaokE0ABDf1kBM4HtkRALOEaDQoVSW8yPUzAB/Ee
	 FJFda+BuMNHY8alySw01d33iRh0GFM+4YM13tZdZq73lsekq0c3PidKEAcrQeOb5F6
	 aAmXB1C7aMWOg==
Date: Wed, 2 Sep 2026 14:52:21 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 6/9] firmware: arm_scmi: Refactor protocol device
 creation logic
Message-ID: <20260902-cuddly-moose-of-champagne-3d0c87@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-6-cb6b88b4ebb3@kernel.org>
 <20260824104948.0000454b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824104948.0000454b@oss.qualcomm.com>
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

On Mon, Aug 24, 2026 at 10:49:48AM -0700, Jonathan Cameron wrote:
> On Thu, 13 Aug 2026 12:33:01 +0100
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > Move the protocol validation and device creation logic in scmi_probe()
> > into a reusable scmi_device_check_create() helper.
> > 
> > The helper centralizes checks for the protocol ID range, implementation
> > availability and duplicate activation before invoking
> > scmi_create_protocol_devices(). This preserves the existing behavior
> > while allowing the logic to be reused by the ACPI path, where protocol
> > child fwnodes are absent.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> A trivial thing and one follow on from earlier.  For that just be consistent
> with what you choose to do for the earlier comment.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> 

Thanks!

> > ---
> >  drivers/firmware/arm_scmi/driver.c | 60 ++++++++++++++++++++++----------------
> >  1 file changed, 35 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > index aad678db0f6e..951ba3df6ba6 100644
> > --- a/drivers/firmware/arm_scmi/driver.c
> > +++ b/drivers/firmware/arm_scmi/driver.c
> > @@ -3244,6 +3244,40 @@ static void scmi_enable_matching_quirks(struct scmi_info *info)
> >  			   rev->sub_vendor_id, rev->impl_ver);
> >  }
> >  
> > +static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
> > +				     struct scmi_info *info)
> > +{
> > +	int ret;
> > +	struct device *dev = info->dev;
> > +	struct scmi_handle *handle = &info->handle;
> > +
> > +	if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
> > +		dev_err(dev, "Out of range protocol %d\n", prot_id);
> > +		return;
> > +	}
> > +
> > +	if (!scmi_is_protocol_implemented(handle, prot_id)) {
> > +		dev_err(dev, "SCMI protocol %d not implemented\n",
> > +			prot_id);
> 
> Fits on one line. I didn't check if you modify this later in the series
> though so if this is churn reduction, fine to leave it as it stands.
> 

Fixed locally, must be side-effect of refactoring.

> > +		return;
> > +	}
> > +
> > +	/*
> > +	 * Save this valid fwnode protocol descriptor amongst
> > +	 * @active_protocols for this SCMI instance.
> > +	 */
> > +	ret = idr_alloc(&info->active_protocols, fwnode,
> > +			prot_id, prot_id + 1, GFP_KERNEL);
> > +	if (ret != prot_id) {
> > +		dev_err(dev, "SCMI protocol %d already activated. Skip\n",
> > +			prot_id);
> > +		return;
> > +	}
> > +
> > +	fwnode_handle_get(fwnode);
> > +	scmi_create_protocol_devices(fwnode, info, prot_id, NULL);
> 
> If you take the suggest I made earlier to make the hand over of ownership
> slightly more obvious by using the return value of fwmonde_handle_get()
> then applies here too.
> 

I will update 3/9, it should be there by 6/9, so no change here other
that the move itself.

-- 
Regards,
Sudeep


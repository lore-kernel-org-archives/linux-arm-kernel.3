Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD8FCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 09:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+G+4ShJKb8iddf8CFfC+I6htQZhYgGvauKOp/U6Mm0s=; b=MRYy6t4UIhE0CNjqsjBo+uKZJ1
	6m0Qp3QmSuzeIhLzizzaQN6eQ0vJYifpP2k6cXoLB6vbixTcTyVTmRrI0EViTa040roQxfPoiuLLd
	dNghrCAlTTeYehqSJXInm6WJwbXjW1LSDVMB5KGcNPTWU5FYAHXpJxIuoBMQq3bMf4o1M3F4/nfpU
	kB1PEU55fwwc5FP5ddlIFzacHNgPuTkaVc7GkKKldrxdz1XEGdCbUcuQ0f099fVesaZkSfkyQF572
	vMdmixbEtpM2IFU5Jb9uZf0C0a4TKz+RDIbksXPo78pVDzwjMTWMHdcujgbRFT4+8WahasckZQy7h
	62+CcCsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8oG-0000000GTV6-0xQ7;
	Tue, 21 Oct 2025 09:37:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8oD-0000000GTTs-3NQq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 09:37:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC6391007;
	Tue, 21 Oct 2025 02:37:28 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 415CF3F66E;
	Tue, 21 Oct 2025 02:37:34 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:37:31 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [PATCH 03/10] firmware: arm_scmi: Allow protocols to register
 for notifications
Message-ID: <aPdUWz8DkYp_Xooy@pluto>
References: <20250925203554.482371-1-cristian.marussi@arm.com>
 <20250925203554.482371-4-cristian.marussi@arm.com>
 <20251017161014.0000347c@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017161014.0000347c@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_023737_878166_4099276F 
X-CRM114-Status: GOOD (  21.35  )
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

On Fri, Oct 17, 2025 at 04:10:14PM +0100, Jonathan Cameron wrote:
> On Thu, 25 Sep 2025 21:35:47 +0100
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Allow protocols themselves to register for their own notifications and
> > providing their own notifier callbacks. While at that, allow for a protocol
> > to register events with compilation-time unknown report/event sizes: such
> > events will use the maximum transport size.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> Hi Cristian,
>

Hi,
 
> A few drive by comments...
> 
> > diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> > index 78e9e27dc9ec..3e623c14745d 100644
> > --- a/drivers/firmware/arm_scmi/notify.c
> > +++ b/drivers/firmware/arm_scmi/notify.c
> > @@ -593,7 +593,12 @@ int scmi_notify(const struct scmi_handle *handle, u8 proto_id, u8 evt_id,
> >  	if (!r_evt)
> >  		return -EINVAL;
> >  
> > -	if (len > r_evt->evt->max_payld_sz) {
> > +	/* Events with a zero max_payld_sz are sized to be of the maximum
> Local multiline comment syntax seems to be
> 	/*
> 	 * Events...

Yes of course...

> 
> > +	 * size allowed by the transport: no need to be size-checked here
> > +	 * since the transport layer would have already dropped such
> > +	 * over-sized messages.
> > +	 */
> > +	if (r_evt->evt->max_payld_sz && len > r_evt->evt->max_payld_sz) {
> 
> > diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
> > index d62c4469d1fd..2e40a7bb5b01 100644
> > --- a/drivers/firmware/arm_scmi/protocols.h
> > +++ b/drivers/firmware/arm_scmi/protocols.h
> > @@ -161,8 +161,13 @@ struct scmi_proto_helpers_ops;
> >   * @dev: A reference to the associated SCMI instance device (handle->dev).
> >   * @xops: A reference to a struct holding refs to the core xfer operations that
> >   *	  can be used by the protocol implementation to generate SCMI messages.
> > + * @hops: A reference to a struct holding refs to the common helper operations
> > + *	  that can be used by the protocol implementation.
> 
> @hops isn't added in this patch so either it should be handled in where it was
> added, or if that was missed a precursor patch to this one.

Indeed.

Thanks,
Cristian


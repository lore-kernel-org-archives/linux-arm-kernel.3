Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EB6CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 10:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4nYWZkVFx0cNBWI24z56+J0OCC7ADIsqmFr3iteHqg=; b=TXjgK57PCG5gGvUDtHIPoF+BCP
	qKaT+hZZRDHo+r+sxGUaRo0coNzheu/l+svUQETc4j30QzgQDntUD5jQ6G4r4jBt6lVidgf6AnUv8
	gZBzIsMGeejOGuW0HP5TodE3aF6zdlm5PE3pmBeIfTYS/ERJML29KuNgm40d7PcYAv8YIE/QcxAZb
	+b2jPLiI8kVFrvrxi+S8igdUdrCXjmJSzMIUou34FtDkbI0oAbdpTiouq8fS+kNjien73Nn3ZhQ/P
	HRlTBHG17jfpcEkaVzsauF7rFcezOdvDdUljR8hE6ySUUcJvd4UwFmSQo/GT57Q2Sc6yLLKQMLm4y
	0hQAWLPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZd6-00000000Vqy-22Ex;
	Wed, 06 May 2026 10:37:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZd4-00000000VqN-3f5v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 10:37:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AEC23319;
	Wed,  6 May 2026 03:37:16 -0700 (PDT)
Received: from donnerap.manchester.arm.com (donnerap.manchester.arm.com [10.33.8.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B20843F836;
	Wed,  6 May 2026 03:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778063841; bh=5c4pTncPmX+luIL7Evtc7A40nYaSrPqfh+f4kQDYM2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z5myFUTOkpLhUhZHLyv4iC+h4GXSOln/Lh+okHyslh8+3y4BGuAqNbdZFUUGrw4Iw
	 jzwkPZNwVVn+7QKwVJMbmpDhzyYdEBeWI7OTDrdCOQRYXVAChEdEWtqN4gpYCiZHeO
	 ErBYfHXa+rzFploFlocnXV7x9AjHC/oz7YEc85Ho=
Date: Wed, 6 May 2026 11:37:17 +0100
From: Philip Radford <philip.radford@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-pm@vger.kernel.org,
	sudeep.holla@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	quic_sibis@quicinc.com, dan.carpenter@linaro.org, d-gole@ti.com,
	souvik.chakravarty@arm.com
Subject: Re: [PATCH v5 11/12] powercap: arm_scmi: Add get_power_uw to
 synthetic node
Message-ID: <afsZ3WFA38iiifsw@donnerap.manchester.arm.com>
References: <20260428090922.346069-1-philip.radford@arm.com>
 <20260428090922.346069-12-philip.radford@arm.com>
 <afprmEnMf5mNf8NE@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afprmEnMf5mNf8NE@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_033722_948204_53044028 
X-CRM114-Status: GOOD (  20.90  )
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

On Tue, May 05, 2026 at 11:13:44PM +0100, Cristian Marussi wrote:
> On Tue, Apr 28, 2026 at 10:09:20AM +0100, Philip Radford wrote:
> > Exposes the current power usage from the immediate children of
> > the synthetic (root) powercap node. Iterates over pr->spzones and
> > sums per-zone power.
> > 

Hi,

> > Signed-off-by: Philip Radford <philip.radford@arm.com>
> > ---
> >  drivers/powercap/arm_scmi_powercap.c | 29 ++++++++++++++++++++++++++--
> >  1 file changed, 27 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
> > index d74869af1633..81b5214acda4 100644
> > --- a/drivers/powercap/arm_scmi_powercap.c
> > +++ b/drivers/powercap/arm_scmi_powercap.c
> > @@ -270,9 +270,34 @@ static int instance_root_release(struct powercap_zone *pz)
> >  	return 0;
> >  }
> >  
> > -static int instance_root_get_power_uw(struct powercap_zone *pz, u64 *v)
> > +static int instance_root_get_power_uw(struct powercap_zone *pz, u64 *power_uw)
> >  {
> > -	*v = 0;
> > +	struct scmi_powercap_zone *root = to_scmi_powercap_zone(pz);
> > +	struct scmi_powercap_zone *child;
> > +	struct scmi_powercap_root *pr;
> > +	u64 acc = 0;
> > +	u64 p;
> 
> These u64 can live on a single line...
> 

No probs.

> > +	int ret;
> > +
> > +	if (!pz || !power_uw)
> > +		return -EINVAL;
> > +
> > +	pr = container_of(root, struct scmi_powercap_root, instance_root);
> 
> usually we define macros to wrap this like to_scmi_powercap_zone()...
> ...even if used only once...this could be a new to_scmi_powercap_root()
> 

Will do.

> > +	if (!pr)
> > +		return -ENODEV;
> > +
> > +	list_for_each_entry(child, &pr->registered_zones[0], node) {
> > +		if (child == &pr->instance_root)
> > +			continue;
> 
> You'll need to check this in light of the fixes of previous patch
> 

No worries.

Regards,
Phil


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CD4C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hh9j/pEmKDaJiT1wmv/X91uEhhqIkV0D2bx6x4Y2JZY=; b=1K87NYwwhbqo0ZBI9Ze9BiLbGf
	zt4PQPujUpDy3R/NqKhnjeBPYdicogq4358gxBOMfbF3BnMLXnrf/vSysGuiBgOOIbhv5wGMvPQrK
	x19grhSBxJrNn3Ay2viA+hCKRd1+3gf/7yuXRIq/+BO0g5+Yb9oiwiszrOAg2eLj0B8x2j1yG4zmG
	75975TtcUi/HA+RkGE4KRluy62zhrbrFBqfQ4JP/i+3bXpUkjVSEpefQ4CiRK3/Qa9TTvBpL34IIj
	8BkgSDVcG64YZS9gM6a5PJ1D0vw1mhDha9bplzfWvwhjZDsGwweJxtvcr29C48bwtrka4Wc/3j+2r
	7WGFYdTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lBg-0000000EpUa-1BkO;
	Wed, 02 Sep 2026 13:39:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lBf-0000000EpUN-1chV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:39:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C2C7C600D1;
	Wed,  2 Sep 2026 13:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699DC1F000E9;
	Wed,  2 Sep 2026 13:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788356374;
	bh=hh9j/pEmKDaJiT1wmv/X91uEhhqIkV0D2bx6x4Y2JZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BegnjX+7LchNCBTRxj2iaw+WaH2IIhbvx+Ew1BmjUPv+o7Cxb91fzLtreneZe3IDZ
	 hbLu1Arw9Xewbc340s7/OyhPErC2bfwdaNX4+J3USENmEUU7JWy2Gs5Emp7cQ4khLY
	 9q0c902dVNfhyhEVENpqDw/T/GlcUoSgVkmn/3iQjXvubS/owoCIkEBSfQjXeCP7bl
	 tjjSoEagBTlZDzbuS7zk77tvOx3DlZ6z9ci38g6ask7Wck0MT7el6MDneTsHNmfpN9
	 bIndMyTKLJH8ls4BGP4fz0lP0/QIuG5C0peCBmhKBDDgbdivjX5U/4ftQgNj8eM4b1
	 4xooTzJgpUvmw==
Date: Wed, 2 Sep 2026 14:39:31 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 3/9] firmware: arm_scmi: Convert OF-only paths to
 generic fwnode in SCMI core
Message-ID: <20260902-funky-tarsier-of-competence-0ae6ab@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-3-cb6b88b4ebb3@kernel.org>
 <20260824103929.00004912@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824103929.00004912@oss.qualcomm.com>
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

On Mon, Aug 24, 2026 at 10:39:29AM -0700, Jonathan Cameron wrote:
> On Thu, 13 Aug 2026 12:32:58 +0100
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > Switch SCMI core plumbing from struct device_node * to struct
> > fwnode_handle * so the core can describe SCMI instances and protocols using
> > firmware nodes rather than OF nodes directly.
> > 
> > This change:
> >   - Replaces core OF property lookups with fwnode_property_*() helpers.
> >   - Switches child enumeration to
> >     fwnode_for_each_available_child_node_scoped().
> 
> Why the scoped version? See inline for more on this.  Probably just needs
> a comment here (or use the non _scoped variant)
> 

Sure

> >   - Plumbs fwnode through the SCMI device creation and channel setup paths.
> >   - Updates transport ->chan_available() callbacks to take a fwnode.
> >   - Stores per-protocol child fwnodes in info->active_protocols so the core
> >     can later locate the descriptor for a given protocol ID.
> >   - Updates mailbox/optee/smc/virtio transports to accept fwnodes and map
> >     back to OF nodes where their existing parsing remains DT-specific.
> > 
> > DT-only transports such as mailbox, OP-TEE and SMC still parse DT
> > properties by mapping the fwnode back to an OF node. On non-DT systems
> > these transports report no channel available.
> > 
> > This is a mechanical step towards firmware-node neutrality and prepares the
> > SCMI core for non-DT transports, such as an ACPI/PCC transport. DT users
> > continue to work unchanged; no non-DT transport is enabled by this patch.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> 
> A few minor things - with those cleaned up.  Only the cleanup.h one really
> matters.
> 

Fixed now.

> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> 
> > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > index ef29fd223287..9014723e0f7f 100644
> > --- a/drivers/firmware/arm_scmi/driver.c
> > +++ b/drivers/firmware/arm_scmi/driver.c
> 
> ...
> 
> > @@ -3352,10 +3354,10 @@ static int scmi_probe(struct platform_device *pdev)
> >  
> >  	scmi_enable_matching_quirks(info);
> >  
> > -	for_each_available_child_of_node(np, child) {
> > +	fwnode_for_each_available_child_node_scoped(dev_fwnode(dev), child) {
> 
> There are no early exits yet and I can't see any added later in the series.
> So the scoped bit is irrelevant.  I don't mind the change on basis of
> hardening or similar but it needs a comment in the patch description to 
> justify that.
> 

This is mainly to release the reference taken in
fwnode_get_next_available_child_node(). It is taken explicitly via
fwnode_handle_get() before scmi_create_protocol_devices() as discussed
below.

> >  		u32 prot_id;
> >  
> > -		if (of_property_read_u32(child, "reg", &prot_id))
> > +		if (fwnode_property_read_u32(child, "reg", &prot_id))
> >  			continue;
> >  
> >  		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
> > @@ -3370,8 +3372,8 @@ static int scmi_probe(struct platform_device *pdev)
> >  		}
> >  
> >  		/*
> > -		 * Save this valid DT protocol descriptor amongst
> > -		 * @active_protocols for this SCMI instance/
> > +		 * Save this valid fwnode protocol descriptor amongst
> > +		 * @active_protocols for this SCMI instance.
> >  		 */
> >  		ret = idr_alloc(&info->active_protocols, child,
> >  				prot_id, prot_id + 1, GFP_KERNEL);
> > @@ -3381,7 +3383,7 @@ static int scmi_probe(struct platform_device *pdev)
> >  			continue;
> >  		}
> >  
> > -		of_node_get(child);
> > +		fwnode_handle_get(child);
> >  		scmi_create_protocol_devices(child, info, prot_id, NULL);
> 
> Give this is handing over ownership I'd make that explicit and do
> 
> 		scmi_create_protcol_devices(fwnode_handle_get(child), info,
> 					    prot_id, NULL);
> but that is a slightly unrelated change - so I don't mind if you don't change
> this one.

Agreed, I can change this if it help readability.

[...]

> 
> > diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm_scmi/transports/smc.c
> > index 1fce3ccdeb7f..1079cd01190b 100644
> > --- a/drivers/firmware/arm_scmi/transports/smc.c
> > +++ b/drivers/firmware/arm_scmi/transports/smc.c
> > @@ -84,10 +84,15 @@ static irqreturn_t smc_msg_done_isr(int irq, void *data)
> >  	return IRQ_HANDLED;
> >  }
> >  
> > -static bool smc_chan_available(struct device_node *of_node, int idx)
> > +static bool smc_chan_available(struct fwnode_handle *fwnode, int idx)
> >  {
> > -	struct device_node *np __free(device_node) =
> > -					of_parse_phandle(of_node, "shmem", 0);
> > +	struct device_node *of_node = to_of_node(fwnode);
> > +	struct device_node *np __free(device_node) = NULL;
> 
> See guidance in cleanup.h.  Basically says constructor and destructor
> must be together (that was after some grumpy replies from Linus to early
> cleanup.h users!)
> 

Thanks, fixed locally now.

-- 
Regards,
Sudeep


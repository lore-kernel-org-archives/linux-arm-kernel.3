Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E763FE81BDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 15:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ThaQIr3JNpoVxnXPMSaLsN+fw1XVDahsQqIJe0btYaA=; b=YrIqt/hbklrl2Fq+xAi4evlkWq
	i8OFOaeWRe1N5QqYYPYvfmwl5ksAsg33ZrlMPuOESPATPzw/5Q3RlTSQTLKxs+eDG0mhi3jGdNKMn
	TAMarVjvPTdPApie12nvAIubcrQihbKpZnD3C5kIBwhHOQjaIoEhxMvsePRuyN17yDa2PIOHcTgBM
	TAhc6J2GRYMsseOssZYJIik1W0nTL5QLnBwffDI4yDaO4AWN5y2JvPRZDCCVQ841BmzV8GLmlD9Xp
	G2lfGzmX86bRIBdeNPAKXYYcxO/euGNxG+alX33uF0pvnC3LY48lLAcwbdx8mzTeXIW8e98n440Fv
	JWlj9vnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTRQ-0000000FdFS-23Lv;
	Mon, 09 Feb 2026 15:44:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTRO-0000000FdF8-2p0f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 15:44:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A343060138;
	Mon,  9 Feb 2026 15:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CA3C116C6;
	Mon,  9 Feb 2026 15:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770651885;
	bh=GvM3s2O65gK18I39hGtyeztUQDYF3w7gL7m0UjnQuUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yg2EXP+ILq2Rn3fxB8/j/piTRYrTNUkCe+a83cTkPyC/FMaEilXcQdwkNVESBrANc
	 +CdInaoIS/MEi5p3dfJ3ebMk2/T5IMoWCyUrKMVIj04Rq3O9+glJ9hnl6cVNjSXF1a
	 oOR53ceZ6rAxbCL97uM5NF+OvseHqBDZ2G8xSUPWt50zgXUIvRPVrj+26TYdKfoKa4
	 CbXq43fRfONLa4N/rneSu/jcaNFhR4QS5iVUJXNBftu2Yr1+44V/thLRp2t4CTrSLx
	 RKzC5s64Tqlv9JQEdotMQAOrk9l6Q3sCsHARe2sp29lYyPvhunXwyBOvVi5+nR1dYk
	 av29WcKbKYhSA==
Date: Mon, 9 Feb 2026 15:44:39 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v4 2/2] firmware: arm_scmi: Implement
 arm,no-completion-irq property
Message-ID: <20260209-quixotic-offbeat-stork-f1d310@sudeepholla>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <20260117010241.186685-2-marek.vasut+renesas@mailbox.org>
 <aW5ifVcxVf6uux3m@pluto>
 <9175b8aa-18c6-4dc1-8904-c26fa1dc7428@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9175b8aa-18c6-4dc1-8904-c26fa1dc7428@mailbox.org>
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

On Mon, Feb 09, 2026 at 11:53:19AM +0100, Marek Vasut wrote:
> On 1/19/26 5:57 PM, Cristian Marussi wrote:
> > On Sat, Jan 17, 2026 at 02:02:29AM +0100, Marek Vasut wrote:
> > > Implement new property arm,no-completion-irq, which sets all SCMI
> > > operation into poll mode. This is meant to work around uncooperative
> > > SCP implementations, which do not generate completion interrupts.
> > > This applies to mbox/shmem based implementations.
> > > 
> > > With this property set, such implementations which do not generate
> > > interrupts can be interacted with, until they are fixed to generate
> > > interrupts properly.
> > > 
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > ---
> > > Cc: Conor Dooley <conor+dt@kernel.org>
> > > Cc: Cristian Marussi <cristian.marussi@arm.com>
> > > Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> > > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > > Cc: arm-scmi@vger.kernel.org
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-renesas-soc@vger.kernel.org
> > > ---
> > > V2: Drop no IRQ handling from SMC transport and update commit message
> > > V3: Rename property from arm,poll-transport to arm,no-completion-irq
> > > V4: No change
> > > ---
> > >   drivers/firmware/arm_scmi/common.h | 4 ++++
> > >   drivers/firmware/arm_scmi/driver.c | 4 ++++
> > >   2 files changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> > > index 7c35c95fddbaf..7c9617d080a02 100644
> > > --- a/drivers/firmware/arm_scmi/common.h
> > > +++ b/drivers/firmware/arm_scmi/common.h
> > > @@ -235,6 +235,9 @@ struct scmi_transport_ops {
> > >    *		      to have an execution latency lesser-equal to the threshold
> > >    *		      should be considered for atomic mode operation: such
> > >    *		      decision is finally left up to the SCMI drivers.
> > > + * @no_completion_irq: Flag to indicate that this transport has no completion
> > > + *		       interrupt and has to be polled. This is similar to the
> > > + *		       force_polling below, except this is set via DT property.
> > >    * @force_polling: Flag to force this whole transport to use SCMI core polling
> > >    *		   mechanism instead of completion interrupts even if available.
> > >    * @sync_cmds_completed_on_ret: Flag to indicate that the transport assures
> > > @@ -254,6 +257,7 @@ struct scmi_desc {
> > >   	int max_msg;
> > >   	int max_msg_size;
> > >   	unsigned int atomic_threshold;
> > > +	bool no_completion_irq;
> > >   	const bool force_polling;
> > >   	const bool sync_cmds_completed_on_ret;
> > >   	const bool atomic_enabled;
> > > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > > index 3e76a3204ba4f..f167194f7cf67 100644
> > > --- a/drivers/firmware/arm_scmi/driver.c
> > > +++ b/drivers/firmware/arm_scmi/driver.c
> > > @@ -2735,6 +2735,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
> > >   	cinfo->is_p2a = !tx;
> > >   	cinfo->rx_timeout_ms = info->desc->max_rx_timeout_ms;
> > >   	cinfo->max_msg_size = info->desc->max_msg_size;
> > > +	cinfo->no_completion_irq = info->desc->no_completion_irq;
> > >   	/* Create a unique name for this transport device */
> > >   	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
> > > @@ -3150,6 +3151,9 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
> > >   	if (ret && ret != -EINVAL)
> > >   		dev_err(dev, "Malformed arm,max-msg DT property.\n");
> > > +	trans->desc.no_completion_irq = of_property_read_bool(dev->of_node,
> > > +							      "arm,no-completion-irq");
> > > +
> > >   	dev_info(dev,
> > >   		 "SCMI max-rx-timeout: %dms / max-msg-size: %dbytes / max-msg: %d\n",
> > >   		 trans->desc.max_rx_timeout_ms, trans->desc.max_msg_size,
> > 
> > LGTM.
> > 
> > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Is there anything left to do with these patches, or can this now be picked
> up ?
> 

As I had mentioned here[1], I am happy with it and I will pick it up for
v7.1 once I start collecting the patches after v7.0-rc1. It just came in after
I had sent my PR to SoC team for v7.0

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/aW5jwtoYCFs-Pzpk@bogus/


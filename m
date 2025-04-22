Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0628C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 11:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdUGNYcSlXp+RxovtBxf2hrOAAMnFPnykczx9UAa+Tg=; b=PFpDPohN6WYmM0eR3mxtPfDklj
	iW+kax5EiGe1JQx+UUybfHfroOLTGocSiJlxPyrspm+9hc/bxw12x9ey6tU2Hb3l/h5ffnPuPL/gx
	ToMV8muW3DzOTWgg2LQM6cLQN6tiLxgqlBoaSebirFxhJUyWTVgiu9AtxOJSt8yjWUI2J6vkg/xbZ
	ZvFleobu4eWACIIjhC6EJEGrdV+fTZclPFuWNgcByNIOdCdkAyRELNUx+FFZULcATV4V2PIUuSJH7
	aRzGrsi7NIj3CXwOPCfcmA0LNn/pcHSePb5pE5WdjxE1tvIGmVkO2gt0tXsFeUzopQ7hn1AGSE2nA
	goCvT8bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BeS-00000006ue7-0C2p;
	Tue, 22 Apr 2025 11:18:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7B4a-00000006oOG-13X8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 10:41:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DBB8CA4B8FD;
	Tue, 22 Apr 2025 10:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB7AC4CEEC;
	Tue, 22 Apr 2025 10:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745318510;
	bh=E7jJl3pOgy/SFZyxcaFNH2HJMXve7HqgzZcCrYSV+mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q3/XYOYPAiir29P1eGSzb5RwyFnYBEqV46mf1/jdzKdA1pCkZ0OcqF1YuMlgOYm5Q
	 CoMX57eL1aFdE5QkKXObGRuNSrfjQkjjcOpl58YGbXV0aKh6VechwDjLX45v0//Zh6
	 qmMkX8r0vDhNuz2x0UXavbtrTsdSxo2LxsvjOKeDrDqMIoj54Op0wZuGwVqvZ6hQQN
	 zdICWq2ACdiuAtNiXQWgYuW8tjU0NHcxzGbSrbeuvVQeqSWvUKAt1NPl1xQsZDj1k4
	 SgjwLColOdUV/zPrhtwoE/Tw4o26//NNzPEfavUziyckO1xeFpu5CrjRG0kf+uWf1v
	 CDqt7AH+xYSnQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u7B4V-000000004sL-2yOU;
	Tue, 22 Apr 2025 12:41:48 +0200
Date: Tue, 22 Apr 2025 12:41:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <aAdya5rephGNP_Tw@hovoldconsulting.com>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
 <20250415142933.1746249-3-cristian.marussi@arm.com>
 <Z__UJUKaMRoFLYLc@hovoldconsulting.com>
 <Z__cuT5IW0Sbjqpg@pluto>
 <aAC_aPHD4Ik-DW0x@hovoldconsulting.com>
 <aADhoX4Rkx8Eu_er@pluto>
 <20250417-teal-sidewinder-of-courtesy-d0473d@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-teal-sidewinder-of-courtesy-d0473d@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_034152_416404_8A3AA5FC 
X-CRM114-Status: GOOD (  37.94  )
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

On Thu, Apr 17, 2025 at 03:41:56PM +0100, Sudeep Holla wrote:
> On Thu, Apr 17, 2025 at 12:10:25PM +0100, Cristian Marussi wrote:
> > On Thu, Apr 17, 2025 at 10:44:24AM +0200, Johan Hovold wrote:
> > > On Wed, Apr 16, 2025 at 05:37:13PM +0100, Cristian Marussi wrote:
> > > > On Wed, Apr 16, 2025 at 06:00:37PM +0200, Johan Hovold wrote:
> > > > > On Tue, Apr 15, 2025 at 03:29:31PM +0100, Cristian Marussi wrote:
> > > 
> > > > > > +static void scmi_enable_matching_quirks(struct scmi_info *info)
> > > > > > +{
> > > > > > +	struct scmi_revision_info *rev = &info->version;
> > > > > > +	const char *compatible = NULL;
> > > > > > +	struct device_node *root;
> > > > > > +
> > > > > > +	root = of_find_node_by_path("/");
> > > > > > +	if (root) {
> > > > > > +		of_property_read_string(root, "compatible", &compatible);
> > > > > 
> > > > > Looks like you still only allow matching on the most specific compatible
> > > > > string.
> > > > > 
> > > > > As we discussed in the RFC thread, this will result in one quirk entry
> > > > > for each machine in a SoC family in case the issue is not machine
> > > > > specific.
> 
> Agreed, but we can predict that. You can infer just from the current state
> of affairs. Today all machines based on soc X may need the quirk but the
> firmware may vary across machines with same SoC.

Sure, I was just highlighting this limitation in the current
implementation...

> > > I was referring to the need to match on other compatible strings than
> > > the most specific one. For the ThinkPad T14s the strings are:
> > > 
> > > 	"lenovo,thinkpad-t14s-lcd", "lenovo,thinkpad-t14s",
> > > 	"qcom,x1e78100", "qcom,x1e80100"
> > > 
> > > Here you most certainly would not want to match on
> > > "lenovo,thinkpad-t14s-lcd" but rather on "lenovo,thinkpad-t14s" or one
> > > of the SoC compatibles.

...and the fact that even if you want to avoid matching on SoC
compatible, the current implementation seems to be too limited to allow
matching on machine compatibles generally (i.e. given that there may be
variants of a particular machine).

We may not even need this for the FC quirk, this was just a general
observation.

> > > of_machine_is_compatible() can be used to match on any compatible
> > > string, but not sure if that fits with your current implementation.
> > > 
> 
> I was thinking about the same when I looked at the code. Using it is
> more elegant IMO.

It would be more flexible, even if you never intend to accept any quirks
that matches for an entire SoC.

> > ...moreover this kind of carpet-quirking that hides the issue on any possible
> > fw version gives ZERO incentives to the aforementioned vendor to fix its
> > firmware...(or it fw-release process)...

If a vendor truly only cares about some other OS then perhaps this
argument isn't that strong and we'll just increase our own maintenance
burden.

> > Indeed, cross posting from your other mail thread, as of now we cannot
> > even be sure if the Vendor has somehow already updated the SCMI-related
> > firmware NEITHER we can be sure about this in the future since it has not
> > even confirmed how they are (or they will) be handling the Impl_Version field...
> > 
> > Having said that, I would add that in this specific case (FC quirk) since the
> > only way to make use of all of this SCMI stuff from the MicroZoft/ACPI world
> > is having working FCs and, since it's clear that our lovely vendor wont
> > certainly break this other lovely OS way of working with SCMI, MAYBE it could
> > be safe to just apply the quirk to this Vendor forever no matter what the
> > platform or FW version will be in the future...(so not using compats at all)

My understanding is that the version has been bumped now albeit for
other reasons than fixing this particular bug. And since enabling FC for
these messages should be safe we will probably be able to match on
vendor/impl_version here.

Sibi is looking into this and should be able to provide an answer
shortly.

Johan


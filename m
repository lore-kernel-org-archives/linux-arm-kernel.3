Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE0FC982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qYfBP3l0bIaYYx9lxJyE2I7qM/U4w1XTrG1Nu4ZagQ=; b=MLRZmtupC7Bp6F1r4B1bs6yybb
	0MA0I83slJH1nB9DBRVJpEdBkj+nd40R0cms47g+x+JsJJESA/uL+zQTW1gdOucghir+CF/Cb0R00
	izIemddNsr14EuTuc5+4SKO8kRwv/wO7VCY3zBwZoFff/gnXdeUUJDm5gPcohaN9OFUopWnUFTkhf
	PeJ0aodJ3eTLVKf/PR46Px/MwY8sbflQcBxw2eQudz1crKuzPmddxcenzeUpbYqFVLtH263OtR7EY
	aLGyZV12Z8bUfs25TijrdqdLL9DQDSMTXS2u6iHJhcGS0Klx3EQl2TLLpkLvNTOswLX7Tt3eDDtt9
	57Mg4VVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Iwx-00000007foL-2H5w;
	Wed, 23 Sep 2026 09:07:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Iww-00000007fnd-2fDs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 09:07:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1495B600AA;
	Wed, 23 Sep 2026 09:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91061F000FF;
	Wed, 23 Sep 2026 09:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790154453;
	bh=8qYfBP3l0bIaYYx9lxJyE2I7qM/U4w1XTrG1Nu4ZagQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KflVallCyNsdpqhTOTGscBnbizb4oRfsGlcpFCeI0AItfzqu1DZ1WGdshpUeWaBC7
	 0xjv55o/CEsYZL32mmIn6crZRcelbeZH7S+aQ4ffKsBi89PbqTi+8HSTTzaucjqAkI
	 sX2Y9Hh3F0QoEn/gL1OCwDXOB5u330/fkg1Pzcs1B89uNDT7mHiMoOHs19i5nFtsqg
	 EiY5oFDN5gwX24GflFiL7jk/m5AfS83xahfSpjeHjSvUUnSbWboOEX6gGG6TTlu3YE
	 /l9bsljv1N2Dl2nRvH1KG8JtnYqIWHfhknp9zhF5NqOwnZ8xecGKRf0x7nQv/s7vh6
	 ZrOgieiDoTbOw==
Date: Wed, 23 Sep 2026 10:07:29 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <arFKVhlgJge5EZyj@monoceros>
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

On Mon, Sep 21, 2026 at 05:19:45PM +0200, Uwe Kleine-König wrote:
> On Fri, Sep 18, 2026 at 11:29:50AM +0200, Hans de Goede wrote:
> > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > 
> > SCMI client drivers already describe their bus match data with
> > MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
> > SCMI device tables. As a result, SCMI modules do not get generated module
> > aliases from their id tables.
> > 
> > Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
> > visible to modpost, add the corresponding generated offsets and teach
> > file2alias to emit scmi:<protocol>:<name> aliases.
> > 
> > Use the same stable alias format for SCMI device uevents and sysfs
> > modaliases. The previous string included the instance-specific device
> > name, which is not useful for matching modules.
> > 
> > Assisted-by: Codex:GPT-5.5
> > Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

[...]

> > diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
> > new file mode 100644
> > index 000000000000..1b4ccfa9dcc5
> > --- /dev/null
> > +++ b/include/linux/device-id/scmi.h
> > @@ -0,0 +1,17 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef LINUX_DEVICE_ID_SCMI_H
> > +#define LINUX_DEVICE_ID_SCMI_H
> > +
> > +#ifdef __KERNEL__
> > +#include <linux/types.h>
> > +#endif
> > +
> > +#define SCMI_NAME_SIZE		32
> > +#define SCMI_MODULE_PREFIX	"scmi:"
> > +
> > +struct scmi_device_id {
> > +	__u8 protocol_id;
> > +	char name[SCMI_NAME_SIZE];
> 
> I wonder if you tried to keep this a char *. ISTR someone did something
> similar recently and they claimed it worked. That would get rid of the
> artificial name size limit and simplify this patch.
> 

I agree with this. 

[...]

> > @@ -1491,6 +1502,7 @@ static const struct devtable devtable[] = {
> >  	{"virtio", SIZE_virtio_device_id, do_virtio_entry},
> >  	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
> >  	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
> > +	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
> >  	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
> >  	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
> >  	{"slim", SIZE_slim_device_id, do_slim_entry},
> 
> I wonder if this is supposed to be ordered alphabetically ...
> 

This may be hard, just the best effort unless it is cleaned up first.

Anyways, I plan to send PR by end of the week, so I really need this
in by tomorrow worst case. I am bit worried if there will conflict all
over the place in this file as I know couple of other patches that may
come via other trees touching same entries(one is SMCCC)🤞.

-- 
Regards,
Sudeep


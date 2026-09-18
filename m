Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BB9C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAOy211GQO8ZsvZCQNqPn3L4mKEDMAq855MNr2jtBdw=; b=yC2wXsp0ltFuCL3YrjR664No45
	Xy0l0OXXIjSvcP0LZUoEVPE+IjccBgU3fl6n8F2J+VcvVEWy20k5xTf2YwoGVsZNWkcYrYbO2ONPH
	UjR+lTZOHqhz6mBkPGmpVtIdwBQOKGrpfKrWp4AxHLW0rhKIJNozLMzpGaUiYdcIy89vZdcizZ2pD
	t82BE8jJVWUBB5s5U1wkJ9VtqBo1AgxpysK8sFHpXJFpfYchjtwEobehDCo4PrpPfTn/6MMQYg0JD
	SNOnBNyf9OKEKEnyarhJcZ+72hQOEYgKpJGogohgmytMNTknLie+pz83LbwZRKzUcEXK8SB+nJDne
	z+Q0r9vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ynj-0000000Ea6L-2LCY;
	Fri, 18 Sep 2026 13:38:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yni-0000000Ea5z-0Skp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:38:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EDE760A53;
	Fri, 18 Sep 2026 13:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D00971F000FF;
	Fri, 18 Sep 2026 13:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789738728;
	bh=UAOy211GQO8ZsvZCQNqPn3L4mKEDMAq855MNr2jtBdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cUuOkv/amenXWBkIAUlZv6naAxqa57uqW1Nr/SIhH4UTEbrBfRdhsCWGVKcmXFaO9
	 NDSaTvl61cFqHIwaNmtm+lnnz3eLP+GwmMIt5YkTHazLlHeRvr3F1DhFTaidMndNNi
	 t6SwL5GdkNekf5UgqMsc2X+XhPzoinekoy1e8+hNssrHN3jzQ9txE5Zxigkl78aLCM
	 Esxw+wLXPd6Ju5c87rfo6bHENHPnuGTUn8SpQGflEF47LkECRVKUVhdEZIQejh6trg
	 b2zyHj6fCzZqadjaquey1fpzB9PhUiz10ytvscm40H8SBoVnsMpM38H/wIHNsE0yX+
	 1UzdbW3bncyXg==
Date: Fri, 18 Sep 2026 14:38:44 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, Frank.Li@kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
 <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
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

On Fri, Sep 18, 2026 at 12:13:10PM +0200, Daniel Lezcano wrote:
> On 9/18/26 12:02, Hans de Goede wrote:
> > Hi Daniel,
> > 
> > On 18-Sep-26 11:53, Daniel Lezcano wrote:
> > > 
> > > Hi Hans,
> > > 
> > > thanks for taking care of that
> > > 
> > > 
> > > On 9/18/26 11:29, Hans de Goede wrote:
> > > > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > 
> > > > SCMI client drivers already describe their bus match data with
> > > > MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
> > > > SCMI device tables. As a result, SCMI modules do not get generated module
> > > > aliases from their id tables.
> > > > 
> > > > Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
> > > > visible to modpost, add the corresponding generated offsets and teach
> > > > file2alias to emit scmi:<protocol>:<name> aliases.
> > > > 
> > > > Use the same stable alias format for SCMI device uevents and sysfs
> > > > modaliases. The previous string included the instance-specific device
> > > > name, which is not useful for matching modules.
> > > > 
> > > > Assisted-by: Codex:GPT-5.5
> > > > Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > ---
> > > 
> 
> [ ... ]
> 
> > > >    #include <linux/bitfield.h>
> > > > +#include <linux/device-id/scmi.h>
> > > >    #include <linux/device.h>
> > > >    #include <linux/notifier.h>
> > > >    #include <linux/types.h>
> > > > @@ -951,11 +952,6 @@ struct scmi_device {
> > > >      #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
> > > >    -struct scmi_device_id {
> > > > -    u8 protocol_id;
> > > > -    const char *name;
> > > > -};
> > > > -
> > > 
> > > What is the reason of converting the char * to a fixed array? That limits the name and may result in truncation and potentially name collision, no ?
> > 
> > Because of how modpost works to generate modaliases inside the .ko
> > any string buffers in device_id structs need to have a fixed length.
> > 
> > So the truncation / name collision issue pretty much applies to all
> > foo_device_id structs in the kernel. People should now to make sure
> > that any strings used will fit inside the fixed string. And I would
> > expect the compiler to warn for overly long strings.
> Ok, thanks for the clarification

Not related to above topic, but just wanted to check with Daniel if this
solves module auto-loading for you. Was there someone else who was testing
this series and was having issue with earlier versions or its you only
Hans de Goede and it was with v1/v2 when Bjorn posted them. I remember
something vaguely and couldn't trace back all the versions easily.

-- 
Regards,
Sudeep


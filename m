Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F70110A62CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 13:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIK3QznRbkr1yUS6tI8cDCIyoncUAl4+CtswBmj89hQ=; b=u9Y7Hmuj/74NL10aQ+fTNJ4wZJ
	KPRN7WaSm5CXFvmTHrdkbcMKLtXb3HmCF5oFUvZbdzSqJsroRyBdmZf6KHqfXSjrZXIZEZ61mKjxF
	8NLAH2MoYFIGAascJbpZZf1jx2O0wB9OIiAlyp7dg4Ssv/Js4IMyAaFL+VO9d75FTm2m/o1PSfIXW
	lSPI5S/TlB69Xa9GXYH6WZwns/CsegyxVp/C9aTnO4aYR6Pyo/91YAe1JQ/wJiMgAXrokAC7Egi+K
	F4LAqFvP+1NEgIeMkQrE21L4bCbfhxeUOCWQ4CBZyxAgJePg4tSSlOSyXCzSPKt72fdvgLV0SXjyU
	ioPLR8ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kpL-00000005YbW-0IS4;
	Thu, 26 Mar 2026 13:32:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kpH-00000005Yal-1L6o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 13:32:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A83C5175A;
	Thu, 26 Mar 2026 06:32:33 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82A0D3F836;
	Thu, 26 Mar 2026 06:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774531959; bh=pVRjgvx4sRKipOcdpOu4GP6wR1axgO9rbtcZeKZScNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WkRhNBZxbwBjOCmbpa+Vpq7Tow/n2qGhq6CWYdm45Wl5AHWL/y03ILfao74YspWWc
	 ZHJ670bVj/ewGZuWDBdEKXxi+LwmgCdQoT/pZi2KvyS/fYs1yNg1N/CsS6cfNdNhzP
	 2lVYtUwrkqNP+rYzL06890rAOpYAT9fbxbgQY9y0=
Date: Thu, 26 Mar 2026 13:32:26 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Elif Topuz <elif.topuz@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	sudeep.holla@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, d-gole@ti.com,
	jonathan.cameron@huawei.com, lukasz.luba@arm.com,
	philip.radford@arm.com, souvik.chakravarty@arm.com
Subject: Re: [PATCH v2 05/17] firmware: arm_scmi: Add Telemetry protocol
 support
Message-ID: <acU1arT1tMZVbe2m@pluto>
References: <20260114114638.2290765-1-cristian.marussi@arm.com>
 <20260114114638.2290765-6-cristian.marussi@arm.com>
 <02534a48-6795-4948-9348-fe507e8810fd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02534a48-6795-4948-9348-fe507e8810fd@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_063243_624839_DDE00EC8 
X-CRM114-Status: GOOD (  32.99  )
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

On Fri, Jan 23, 2026 at 11:00:46AM +0000, Elif Topuz wrote:
> 
> Hi Cristian,

HI Elif,

a long overdue reply from me !

Thanks for having a look at this series...

> 
> On 14/01/2026 11:46, Cristian Marussi wrote:
> > Add basic support for SCMI V4.0 Telemetry protocol including SHMTI,
> > FastChannels, Notifications and Single Sample Reads collection methods.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > v1 --> v2
> >  - Add proper ioread accessors for TDCF areas
> >  - Rework resource allocation logic and lifecycle
> >  - Introduce new resources accessors and res_get() operation to
> >    implement lazy enumeration
> >  - Support boot-on telemetry:
> >    + Add DE_ENABLED_LIST cmd support
> >    + Add CONFIG_GET cmd support
> >    + Add TDCF_SCAN for best effort enumeration
> >    + Harden driver against out-of-spec FW with out of spec cmds
> >  - Use FCs list
> >  - Rework de_info_lookup to a moer general de_lookup
> >  - Fixed reset to use CONFIG_GET and DE_ENABLED_LIST to gather initial
> >    state
> >  - Using sign_extend32 helper
> >  - Added counted_by marker where appropriate
> > ---
> >  drivers/firmware/arm_scmi/Makefile    |    2 +-
> >  drivers/firmware/arm_scmi/driver.c    |    2 +
> >  drivers/firmware/arm_scmi/protocols.h |    1 +
> >  drivers/firmware/arm_scmi/telemetry.c | 2671 +++++++++++++++++++++++++
> >  include/linux/scmi_protocol.h         |  188 +-
> >  5 files changed, 2862 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/firmware/arm_scmi/telemetry.c
> > 

[snip]

> > +	/* Build composing DES string */
> > +	for (int i = 0; i < ti->info.base.num_groups; i++) {
> > +		struct scmi_telemetry_group *grp = &rinfo->grps[i];
> > +		size_t bufsize = grp->info->num_des * 11 + 1;
> > +		char *buf = grp->des_str;
> > +
> > +		for (int j = 0; j < grp->info->num_des; j++) {
> > +			char term = j != (grp->info->num_des - 1) ? ' ' : '\0';
> > +			int len;
> > +
> > +			len = scnprintf(buf, bufsize, "0x%04X%c",
> 
> I think it should be 0x%08X%c to print 8 bytes.
> 

Good catch ! I will fix..

> > +					rinfo->des[grp->des[j]]->info->id, term);
> > +
> > +			buf += len;
> > +			bufsize -= len;
> > +		}
> > +	}
> > +

[snip]

> > +
> > +static int scmi_telemetry_tdcf_line_parse(struct telemetry_info *ti,
> > +					  struct payload __iomem *payld,
> > +					  struct telemetry_shmti *shmti,
> > +					  enum scan_mode mode)
> > +{
> > +	int used_qwords;
> > +
> > +	used_qwords = (USE_LINE_TS(payld) && TS_VALID(payld)) ?
> > +		QWORDS_TS_LINE_DATA_PAYLD : QWORDS_LINE_DATA_PAYLD;
> 
> If I understand correctly from the "chat with ATG" comments below, when
> timestamp is disabled (after DE is enabled with timestamp), physically ts line
> is still there (use_line_ts = 1 and ts_valid = 0). That's why I think we need to
> drop TS_VALID(payld) check. Otherwise qwords will be QWORDS_LINE_DATA_PAYLD
> although ts line exists.
> 
> Also, for the alpha version of the spec, the combination of use_line_ts = 1 and
> ts_valid = 0 doesn't seem to be possible as I understand. But I think beta
> version allows us?

Yes indeed ALPHA_0 definition of TS Line fields was ambiguos but now in
BETA the field is more explicitly called as LineExtension bit field...so
the code in the upcoming V3 will change accordingly.

> 
> > +
> > +	/* Invalid lines are not an error, could simply be disabled DEs */
> > +	if (DATA_INVALID(payld))
> > +		return used_qwords;
> > +
> > +	if (!IS_BLK_TS(payld))
> > +		scmi_telemetry_tdcf_data_parse(ti, payld, shmti, mode);
> > +	else
> > +		scmi_telemetry_tdcf_blkts_parse(ti, payld, shmti);
> > +
> > +	return used_qwords;
> > +}
> > +
> > +static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
> > +				     unsigned int shmti_id, u64 ts,
> > +				     enum scan_mode mode)
> 
> ts is not used in the function.
> 

Yes indeed I have removed it in V3.

> > +{
> > +	struct telemetry_shmti *shmti = &ti->shmti[shmti_id];
> > +	struct tdcf __iomem *tdcf = shmti->base;
> > +	int retries = SCMI_TLM_TDCF_MAX_RETRIES;
> > +	u64 startm = 0, endm = TDCF_BAD_END_SEQ;
> > +	void *eplg = SHMTI_EPLG(shmti);
> > +
> > +	if (!tdcf)
> > +		return -ENODEV;
> > +

[snip]

> > +
> > +		de_id = le32_to_cpu(payld->id);
> > +		de = xa_load(&ti->xa_des, de_id);
> > +		if (!de || !de->enabled) {
> > +			dev_err(ti->ph->dev,
> > +				"MSG - Received INVALID DE - ID:%u  enabled:%d\n",
> 
> enabled:%c?
> 

Yep

> > +				de_id, de ? (de->enabled ? 'Y' : 'N') : 'X');
> > +			continue;

[snip]

> >  struct scmi_power_state_changed_report {
> > @@ -1114,4 +1292,12 @@ struct scmi_powercap_meas_changed_report {
> >  	unsigned int	domain_id;
> >  	unsigned int	power;
> >  };
> > +
> > +struct scmi_telemetry_update_report {
> > +	ktime_t		timestamp;
> > +	unsigned int	agent_id;
> > +	int		status;
> > +	unsigned int	num_dwords;
> > +	unsigned int	dwords[];
> > +};
> >  #endif /* _LINUX_SCMI_PROTOCOL_H */
> 
> Thanks,
> Elif

Thanks for the review !
Cristian

PS: (nitpick) you should trim your review replies to remove all the long
bunch of code that you are not comenting on  (leaving a [snip] placeholder
as I did above)... it helps finding your comments in the sea of code...



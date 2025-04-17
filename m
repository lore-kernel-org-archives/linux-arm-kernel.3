Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C19C369CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 08:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J48PnJQNA9AsUd2AP1V+sjTsrszPFucbM5pFiijF4DM=; b=biuMvTtGSLqmeapLhScqdJFRvi
	kEKTJ9IDN11Hf8mnt83GyOeN5CAHDawPxfuUEktBrwIPt3uA+fDVrKUjHtO/lcmZlRCWS/nqKBIbd
	pvU+XAPlZs+LsnxllMewD3SXCzJvV6g1sy3zl88wf+XxY3b+jhDexvN5caGw2t5FPuy09kcA6EN8Q
	OKIIpJ+dZ4s8fe4CZ4n2F7AZEBY6KwAec2jNEH+ttZT2rnVK8fr6JIYETnk8yoVsX8cbaIQW4El+B
	er6uLpcWuS25GXe0IuuGLs4LTm8SEfVzuUkxcXWJ+hmOHoA+YxnGRMPY9FWjMX6OBQJugVA8/adcX
	YU9oMcYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Kzm-0000000CLM4-2IWL;
	Thu, 17 Apr 2025 08:53:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KrB-0000000CJa4-42hE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 08:44:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CC5C6842A;
	Thu, 17 Apr 2025 08:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB73EC4CEE4;
	Thu, 17 Apr 2025 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744879464;
	bh=A9Faa6Hi06Qb+FMxB+xHx14Tv/SX93t05l35ho7ZmuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N+KQFRw0/kn8KZrGZh2+3SvkvdkVsh3YQgjbvbIMID2194SEhzy5tJwwcadGkgjyQ
	 h4u33pTtYqlqrPwvt5l2l13hs+wu8TUkn9gnITtPrW6almo9xbnF9NdZSiYSJ94j2s
	 yb4FPaO2fpWJHRkBYu+zSAXKEPpxB75JAUuUMSBRoOunyYM0ncdt+e61gQRWGo/yD3
	 a2IUbCqey4ePsOGn/ByP5xOVJSL9m8gZ+kFKbSfZ5M9ViDRNofhKDQMyef3/+jBhdF
	 2t5pcwFHDZhObOAxf8IzV86b5pTgTiTeCFv1Rmly0HCCUhIEiywIoPkIqnZPmeGq2Y
	 UAC1wYop90Qqg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u5KrA-000000001ZO-0bIc;
	Thu, 17 Apr 2025 10:44:24 +0200
Date: Thu, 17 Apr 2025 10:44:24 +0200
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <aAC_aPHD4Ik-DW0x@hovoldconsulting.com>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
 <20250415142933.1746249-3-cristian.marussi@arm.com>
 <Z__UJUKaMRoFLYLc@hovoldconsulting.com>
 <Z__cuT5IW0Sbjqpg@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z__cuT5IW0Sbjqpg@pluto>
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

On Wed, Apr 16, 2025 at 05:37:13PM +0100, Cristian Marussi wrote:
> On Wed, Apr 16, 2025 at 06:00:37PM +0200, Johan Hovold wrote:
> > On Tue, Apr 15, 2025 at 03:29:31PM +0100, Cristian Marussi wrote:

> > > +static void scmi_enable_matching_quirks(struct scmi_info *info)
> > > +{
> > > +	struct scmi_revision_info *rev = &info->version;
> > > +	const char *compatible = NULL;
> > > +	struct device_node *root;
> > > +
> > > +	root = of_find_node_by_path("/");
> > > +	if (root) {
> > > +		of_property_read_string(root, "compatible", &compatible);
> > 
> > Looks like you still only allow matching on the most specific compatible
> > string.
> > 
> > As we discussed in the RFC thread, this will result in one quirk entry
> > for each machine in a SoC family in case the issue is not machine
> > specific.
> 
> Well, yes but the solution would be to add multiple compatible on the
> same quirk line, which is definitely less cumbersome than adding
> multiple quirk defs for the same quirk but does NOT scale anyway....
> 
> ...anyway I will add that possibility..or I am missing something more ?

I was referring to the need to match on other compatible strings than
the most specific one. For the ThinkPad T14s the strings are:

	"lenovo,thinkpad-t14s-lcd", "lenovo,thinkpad-t14s",
	"qcom,x1e78100", "qcom,x1e80100"

Here you most certainly would not want to match on
"lenovo,thinkpad-t14s-lcd" but rather on "lenovo,thinkpad-t14s" or one
of the SoC compatibles.

For the FC quirk we may have to match on compatible and then a single
SoC entry could cover tens of machines (and their SKU variants).

of_machine_is_compatible() can be used to match on any compatible
string, but not sure if that fits with your current implementation.
 
> > > +		of_node_put(root);
> > > +	}
> > > +
> > > +	/* Enable applicable quirks */
> > > +	scmi_quirks_enable(info->dev, compatible,
> > > +			   rev->vendor_id, rev->sub_vendor_id, rev->impl_ver);
> > > +}

Johan


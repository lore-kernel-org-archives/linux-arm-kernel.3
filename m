Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D4CC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 14:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/y1oyivJMSAEjr6lXPFwpHxNpW9dO8CfdCGEFf7lQQ=; b=m2wJ+qEF/xnipaXoBhsszwuguH
	JTIxKPW1M8jtsKHlr3TWqEjOEEmwGG6QnwT2QNTgLJamg7AUJGgYh9Y4ZI05SKFkH7ubSXZtuM9ts
	jGPXoWOwAd4SeZoa5L0cmhJARIujZ9H5P6bad0gRiVo9QUDnuB0cfadLzagkZ5ThxKoQHlwy3/sJf
	H3OtwV9kbCM8kor9eASQ9fOD9P+5x95wZeINPnLd0Q2o9GJ1j+MWMDT5+78LUc2k6TBmdYTt4ZYvV
	oKSvBGvVcfhg91LdLYVasQP7wouR6y6FGkMUWrwVmV3/MakqBpoRHh9X2pV+ynejDQpEfLwqrXL/g
	DVmf6hSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lir-00000009tfv-149b;
	Tue, 29 Apr 2025 14:14:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9l98-00000009nI4-1KaQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 13:37:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 025551515;
	Tue, 29 Apr 2025 06:37:07 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6ECC3F673;
	Tue, 29 Apr 2025 06:37:11 -0700 (PDT)
Date: Tue, 29 Apr 2025 14:37:09 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <aBDWBWqHTY-gfc_k@pluto>
References: <20250425125250.1847711-1-cristian.marussi@arm.com>
 <20250425125250.1847711-3-cristian.marussi@arm.com>
 <aA5BeONpC3CJE5-Z@hovoldconsulting.com>
 <aBCuSpToEklg340R@pluto>
 <aBC16CGDhZ_XO3Xr@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBC16CGDhZ_XO3Xr@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_063714_443917_69009AED 
X-CRM114-Status: GOOD (  43.82  )
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

On Tue, Apr 29, 2025 at 01:20:08PM +0200, Johan Hovold wrote:
> On Tue, Apr 29, 2025 at 11:47:54AM +0100, Cristian Marussi wrote:
> > On Sun, Apr 27, 2025 at 04:38:48PM +0200, Johan Hovold wrote:
> > > On Fri, Apr 25, 2025 at 01:52:48PM +0100, Cristian Marussi wrote:
> > > > Add a common framework to describe SCMI quirks and associate them with a
> > > > specific platform or a specific set of SCMI firmware versions.
> > > > 
> > > > All the matching SCMI quirks will be enabled when the SCMI core stack
> > > > probes and after all the needed SCMI firmware versioning information was
> > > > retrieved using Base protocol.
> 
> > > > +static void scmi_enable_matching_quirks(struct scmi_info *info)
> > > > +{
> > > > +	struct scmi_revision_info *rev = &info->version;
> > > > +	const char *compatible = NULL;
> > > > +	struct device_node *root;
> > > > +
> > > > +	root = of_find_node_by_path("/");
> > > > +	if (root) {
> > > > +		of_property_read_string(root, "compatible", &compatible);
> > > > +		of_node_put(root);
> > > > +	}
> > > > +
> > > > +	dev_dbg(info->dev, "Looking for quirks matching: %s/%s/%s/0x%08X\n",
> > > > +		compatible, rev->vendor_id, rev->sub_vendor_id, rev->impl_ver);
> > > 
> > > You're now just looking up the most specific compatible string in order
> > > to include it in this dev_dbg(). Since you're now matching on all
> > > compatible strings, perhaps you can consider just dropping it.
> > > 
> > 
> > Yes indeed I was not sure to keep all of this machinery just to print
> > the machine compatible that is used to try to match against the
> > (possible) list of compats....on the other side seemed useful to know
> > exactly what you are trying to match against....but maybe we can simply
> > assume that the machine compatible is well-known....
> 
> Perhaps it would have been more useful if you printed all the compatible
> strings here and not just the most specific one, but yeah, there are
> other ways to read this strings through sysfs.
> 
> Keeping as-is should be fine too.
> 

I have dropped the whole machinery.

> > > > +		/*
> > > > +		 * Note that there could be multiple matches so we
> > > > +		 * will enable multiple quirk part of an hash collision
> > > 
> > > nit: "quirks that are part of a"?
> > > 
> > 
> > mmm...as a non-native and poor English speaker I am, though, reasonably
> > confident that a/an is chosen based on the vowel/consonant SOUND of the
> > next word NOT on the effective letter...am I wrong ?
> > (then we could digress about which is the sound of a[n] 'hash' :P ...)
> 
> That's my understanding as well, but 'hash' begins with a consonant
> sound so I'm pretty sure it's "a hash".

:P ... so it is now certified publicly how bad my pronunciation skills are 

> 
> > > > +		 * domain...BUT we cannot assume that ALL quirks on the
> > > > +		 * same collision domain are a full match.
> > > > +		 */
> > > > +		hash_for_each_possible(scmi_quirks_ht, quirk, hash, hkey) {
> > > > +			if (quirk->enabled || quirk->hkey != hkey ||
> > > > +			    impl < quirk->start_range ||
> > > > +			    impl > quirk->end_range)
> > > > +				continue;
> > > > +
> > > > +			if (quirk->compats[0] &&
> > > > +			    !of_machine_compatible_match(quirk->compats))
> > > > +				continue;
> > > > +
> > > > +			dev_info(dev, "Enabling SCMI Quirk [%s]\n",
> > > > +				 quirk->name);
> > > > +
> > > > +			dev_dbg(dev,
> > > > +				"Quirk matched on: %s/%s/%s/[0x%08X-0x%08X]\n",
> > > > +				quirk->compats[0], quirk->vendor,
> > > 
> > > You can now match on more than one compats string, but I guess printing
> > > just the first one is fine.
> > > 
> > 
> > Yes, same as above dev_dbg...not sure if it was meaningful really to
> > dump all the list and overload the log with all such info...
> 
> Right, indicating there is some compatible string that's being used is
> still useful to know.
> 
> > > > +				quirk->sub_vendor_id,
> > > > +				quirk->start_range, quirk->end_range);
> > > > +
> > > > +			static_branch_enable(quirk->key);
> > > > +			quirk->enabled = true;
> > > > +		}
> > > > +	}
> > > > +}
> > > 
> > > This seems to work as intended and I've tried matching on machine and
> > > SoC compatible strings and/or vendor and protocol version:
> > > 
> > > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > > 
> > 
> > Thanks for the review Johan.
> > 
> > Since you have tested the effective final quirk patch, may I ask you to
> > post straight away your final tested quirk patch on top of my next V3
> > (with your authorship of course..)...I will drop the [NOT FOR UPSTREAM]
> > example patch so that Sudeep can easily pick-up your patch.
> 
> Sure, I'll do so. Thanks for your help with getting this sorted!
>

You're welcome.

Cheers,
Cristian


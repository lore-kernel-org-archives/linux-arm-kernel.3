Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30F7C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 14:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Au0tcKLqBitVQ6QTVWvjjrNXhNE+OFlXuViuGwtjYrA=; b=XnUGmCs5Y9YIMuhbUkoeZ+zd3f
	tPLD68mIabddE/EZC0vd0qAbuOhtQa3bh8ajcu5sxOHoEhPEvmeG0yt5aE/oWzBG/0EpXF70il61J
	RtFpAdx97cjBkCoP82EINwBgNFSYpxQk0OjlwpPbTdmQm8rv/2zX/j0c79hjuHyIw+LqOEyFXcoQx
	NjS6sKU78Bad1+wjNUKk3Wnuj9CZaCMnMwi8d4r4BWbc+YFk72gS8weycBG6AxeKfW5Nxh2Bi6CfV
	ea0xf8zOFcrTICapIuss2zkzPgBQrlmfGQvK8urThbGgFBIURYbi+0024UfKkTPxio10ktA/szAZ5
	GdTKqnZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u93BY-00000003gPX-119U;
	Sun, 27 Apr 2025 14:40:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u939b-00000003gFA-2H77
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 14:38:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A401B49F8F;
	Sun, 27 Apr 2025 14:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC2CC4CEE3;
	Sun, 27 Apr 2025 14:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745764726;
	bh=iqNyrXhXtNWzKzdJcnAl3HmTmEDJLWGh4BiARlXXw+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aYminJdb1iacYydize7B8EO9+rtgl1RduKYbdZt/fehYyNTEJ6uAUbOFdIGe9PyUA
	 yD6YMMJGPnXxIn1kTDztj8Yg1QtlvwEU1GXYepn47jUqvLgt2Cj165flaPrG3X0ORT
	 YgPa/hQUJC0FADRBzgYKWmX81JRAry0SYqEIZ/i2vt1v9s19jhobaYp6440SKt7A/n
	 bG6XzUCp12D1FRzuFv/lcjSknDTMXxuJnzWUDiFGRIrLsKnv3JLqu4rAnwq6vLK86b
	 YM3FYhkJopA70DAo54k5ShGcWsvMka3tn0rETGw15PrvlCXxNn+iPABHAosXp5RKhG
	 I7PnYt4mVGh/Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u939c-000000005vL-0heY;
	Sun, 27 Apr 2025 16:38:48 +0200
Date: Sun, 27 Apr 2025 16:38:48 +0200
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <aA5BeONpC3CJE5-Z@hovoldconsulting.com>
References: <20250425125250.1847711-1-cristian.marussi@arm.com>
 <20250425125250.1847711-3-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425125250.1847711-3-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_073847_630526_31ADD8B2 
X-CRM114-Status: GOOD (  25.19  )
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

On Fri, Apr 25, 2025 at 01:52:48PM +0100, Cristian Marussi wrote:
> Add a common framework to describe SCMI quirks and associate them with a
> specific platform or a specific set of SCMI firmware versions.
> 
> All the matching SCMI quirks will be enabled when the SCMI core stack
> probes and after all the needed SCMI firmware versioning information was
> retrieved using Base protocol.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> V1 -> V2
> - compile quirk snippets even when SCMI Quirks are disabled
> - added support for quirks matches on multiple compatibles
>   (via NULl terminated compats strings)
> - removed stale unneeded include
> - added some more docs

> +static void scmi_enable_matching_quirks(struct scmi_info *info)
> +{
> +	struct scmi_revision_info *rev = &info->version;
> +	const char *compatible = NULL;
> +	struct device_node *root;
> +
> +	root = of_find_node_by_path("/");
> +	if (root) {
> +		of_property_read_string(root, "compatible", &compatible);
> +		of_node_put(root);
> +	}
> +
> +	dev_dbg(info->dev, "Looking for quirks matching: %s/%s/%s/0x%08X\n",
> +		compatible, rev->vendor_id, rev->sub_vendor_id, rev->impl_ver);

You're now just looking up the most specific compatible string in order
to include it in this dev_dbg(). Since you're now matching on all
compatible strings, perhaps you can consider just dropping it.

> +
> +	/* Enable applicable quirks */
> +	scmi_quirks_enable(info->dev, rev->vendor_id,
> +			   rev->sub_vendor_id, rev->impl_ver);
> +}

> +/**
> + * DOC: Theory of operation
> + *
> + * A framework to define SCMI quirks and their activation conditions based on
> + * existing static_keys Kernel facilities.

nit: kernel

> +/*
> + * Define a quirk by name and provide the matching tokens where:
> + *
> + *  _qn: A string which will be used to build the quirk and the global
> + *	 static_key names.
> + *  _ven : SCMI Vendor ID string match, NULL means any.
> + *  _sub : SCMI SubVendor ID string match, NULL means any.
> + *  _impl : SCMI Implementation Version string match, NULL means any.
> + *          This string can be used to express version ranges which will be
> + *          interpreted as follows:
> + *
> + *			NULL		[0, 0xFFFFFFFF]
> + *			"X"		[X, X]
> + *			"X-"		[X, 0xFFFFFFFF]
> + *			"-X"		[0, X]
> + *			"X-Y"		[X, Y]
> + *
> + *          with X <= Y and <v> in [X, Y] meaning X <= <v> <= Y
> + *
> + *  ... : An optional variadic macros argument used to provide a coma-separated

comma

> + *	  list of compatible strings matches; when no variadic argument is
> + *	  provided, ANY compatible will match this quirk.

> +void scmi_quirks_enable(struct device *dev, const char *vend,
> +			const char *subv, const u32 impl)
> +{
> +	for (int i = 3; i >= 0; i--) {
> +		struct scmi_quirk *quirk;
> +		unsigned int hkey;
> +
> +		hkey = scmi_quirk_signature(i > 1 ? vend : NULL,
> +					    i > 2 ? subv : NULL);
> +
> +		/*
> +		 * Note that there could be multiple matches so we
> +		 * will enable multiple quirk part of an hash collision

nit: "quirks that are part of a"?

> +		 * domain...BUT we cannot assume that ALL quirks on the
> +		 * same collision domain are a full match.
> +		 */
> +		hash_for_each_possible(scmi_quirks_ht, quirk, hash, hkey) {
> +			if (quirk->enabled || quirk->hkey != hkey ||
> +			    impl < quirk->start_range ||
> +			    impl > quirk->end_range)
> +				continue;
> +
> +			if (quirk->compats[0] &&
> +			    !of_machine_compatible_match(quirk->compats))
> +				continue;
> +
> +			dev_info(dev, "Enabling SCMI Quirk [%s]\n",
> +				 quirk->name);
> +
> +			dev_dbg(dev,
> +				"Quirk matched on: %s/%s/%s/[0x%08X-0x%08X]\n",
> +				quirk->compats[0], quirk->vendor,

You can now match on more than one compats string, but I guess printing
just the first one is fine.

> +				quirk->sub_vendor_id,
> +				quirk->start_range, quirk->end_range);
> +
> +			static_branch_enable(quirk->key);
> +			quirk->enabled = true;
> +		}
> +	}
> +}

This seems to work as intended and I've tried matching on machine and
SoC compatible strings and/or vendor and protocol version:

Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan


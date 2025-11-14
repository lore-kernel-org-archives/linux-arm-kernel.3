Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF3DCE7AEF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KH92zZojK4QipLfS2n/Q4BilmnDtRDtWpUegIheJ23s=; b=V43SkXKnVcriModhaR0H9oDTVv
	ul6cCt8EmbV4Q5tzDjPs0jGz0ztX4b8lBS1MffuC1prJqVdhIxYf+2EnSUzeH9IbEVIuf16O8IEQH
	y0KVxpCzciK5oeMUHqTGn5mr3JusLHNROEAcMuFGbLL6vZ9tozlUA/Hv48sTQrrGjcZ/DS/o6UiVC
	iq/7fW09/uWZymcsFaD3fJNpLI+xFC4suI+oi5qWTath7GczX0CrB/WlY6sPMhtKhaXcW8fVUjVyz
	EOXsJFA7sm47pLfMF2N6U1USDsOjXj31FLJq/sZPePR1W+zyByridoWWymZKLcT3HRDamgTCP72g8
	A2TAKuGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJv7D-0000000CP1A-0DMl;
	Fri, 14 Nov 2025 14:49:31 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJv79-0000000CP0c-2is7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763131768; x=1794667768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zzzDKvrqSISBzTJB9sBIHCzKA9T2rntBBfYNwPbniKE=;
  b=BNHKZyU3k9yu6Tt9dGOjPTyCFHF8mXMnmsjxF6DQpTyfyksP3mFcANQo
   qzsCq2drxRf04IWalyM3xw8COY2+aj/9GRnkEC3DpA3iWy4kjZ26M8mUe
   N5LrWDImDqmTG1YNmeYS7rUdl6BUb9vwPuaOqEFRlo/GpDNaFcH32bG+P
   VEUpOIQ8PyneEVh6D4+lkJGauU7GoHvPtL2elP7757TM/2yG3+LY3VU5L
   rtuYuMkBICRWj5/NQs5DbmXxVZmqzCaGTmNjtjJY4nl8hi92R/lFK//Yk
   HNxgtXft7bX/8cLlcTF4tSXtlcQ4xpnTb9C1CibPZ9Z8SOcZeBD8IZIuD
   w==;
X-CSE-ConnectionGUID: 0//hIs0ITziKa2gNvrrPoA==
X-CSE-MsgGUID: 6nWtTPtyTYCrk3vN13byEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="76687610"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="76687610"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 06:49:23 -0800
X-CSE-ConnectionGUID: G8e9kQE9T2+LJH1L+zE0gg==
X-CSE-MsgGUID: XktjOyHjQTSdrcKtNxk3Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189636120"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.53])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 06:49:19 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8C624121DDE;
	Fri, 14 Nov 2025 16:49:18 +0200 (EET)
Date: Fri, 14 Nov 2025 16:49:18 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v13 15/15] Documentation: mali-c55: Document the mali-c55
 parameter setting
Message-ID: <aRdBbn4cpdn_7H0v@kekkonen.localdomain>
References: <20251111-c55-v13-0-3dc581355e3a@ideasonboard.com>
 <20251111-c55-v13-15-3dc581355e3a@ideasonboard.com>
 <2n4sn2aakwl7k2qvcefb7m2zzllytj7i4nup55xex2ggdngfkd@gwpxbpmlupko>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2n4sn2aakwl7k2qvcefb7m2zzllytj7i4nup55xex2ggdngfkd@gwpxbpmlupko>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_064927_768851_18726D57 
X-CRM114-Status: GOOD (  19.81  )
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

Hi Jacopo,

On Thu, Nov 13, 2025 at 09:39:37AM +0100, Jacopo Mondi wrote:
> > +the data member with the blocks that need to be configured by the driver, but
> > +need not populate it with **all** the blocks, or indeed with any at all if there
> > +are no configuration changes to make. Populated blocks **must** be consecutive
> > +in the buffer. To assist both userspace and the driver in identifying the
> > +blocks each block-specific struct embeds :c:type:`v4l2_params_block_header` as
> > +its first member and userspace must populate the type member with a value from
> > +:c:type:`mali_c55_param_block_type`. Once the blocks have been populated
> > +into the data buffer, the combined size of all populated blocks shall be set in
> > +the data_size member of :c:type:`v4l2_params_buffer`. For example:
> > +
> > +.. code-block:: c
> > +
> > +	struct v4l2_params_buffer *params =
> > +		(struct v4l2_params_buffer *)buffer;
> > +
> > +	params->version = MALI_C55_PARAM_BUFFER_V1;
> > +	params->data_size = 0;
> > +
> > +	void *data = (void *)params->data;
> > +
> > +	struct mali_c55_params_awb_gains *gains =
> > +		(struct mali_c55_params_awb_gains *)data;
> > +
> > +	gains->header.type = MALI_C55_PARAM_BLOCK_AWB_GAINS;
> > +	gains->header.flags |= V4L2_PARAMS_FL_BLOCK_ENABLE;
> > +	gains->header.size = sizeof(struct mali_c55_params_awb_gains);
> > +
> > +	gains->gain00 = 256;
> > +	gains->gain00 = 256;
> > +	gains->gain00 = 256;
> > +	gains->gain00 = 256;
> > +
> > +	data += sizeof(struct mali_c55_params_awb_gains);
> > +	params->data_size += sizeof(struct mali_c55_params_awb_gains);
> > +
> > +	struct mali_c55_params_sensor_off_preshading *blc =
> > +		(struct mali_c55_params_sensor_off_preshading *)data;
> > +
> > +	blc->header.type = MALI_C55_PARAM_BLOCK_SENSOR_OFFS;
> > +	blc->header.flags |= V4L2_PARAMS_FL_BLOCK_ENABLE;
> > +	blc->header.size = sizeof(struct mali_c55_params_sensor_off_preshading);
> > +
> > +	blc->chan00 = 51200;
> > +	blc->chan01 = 51200;
> > +	blc->chan10 = 51200;
> > +	blc->chan11 = 51200;
> > +
> > +	params->total_size += sizeof(struct mali_c55_params_sensor_off_preshading);
> 
> s/total_size/data_size
> 
> And I've also updated it to use the v4l2-isp types
> 
> +.. code-block:: c
> +
> +       struct v4l2_isp_params_buffer *params =
> +               (struct v4l2_isp_params_buffer *)buffer;

What's the type of buffer here? If it's void, you can drop the cast.

> +
> +       params->version = MALI_C55_PARAM_BUFFER_V1;
> +       params->data_size = 0;
> +
> +       void *data = (void *)params->data;

No need for a cast here.

> +
> +       struct mali_c55_params_awb_gains *gains =
> +               (struct mali_c55_params_awb_gains *)data;

Ditto.

Unless, I guess, you use C++. :-)

> +
> +       gains->header.type = MALI_C55_PARAM_BLOCK_AWB_GAINS;
> +       gains->header.flags |= V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
> +       gains->header.size = sizeof(struct mali_c55_params_awb_gains);
> +
> +       gains->gain00 = 256;
> +       gains->gain00 = 256;
> +       gains->gain00 = 256;
> +       gains->gain00 = 256;
> +
> +       data += sizeof(struct mali_c55_params_awb_gains);

	data += sizeof(*gains);

?

> +       params->data_size += sizeof(struct mali_c55_params_awb_gains);

Ditto.

> +
> +       struct mali_c55_params_sensor_off_preshading *blc =
> +               (struct mali_c55_params_sensor_off_preshading *)data;
> +
> +       blc->header.type = MALI_C55_PARAM_BLOCK_SENSOR_OFFS;
> +       blc->header.flags |= V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
> +       blc->header.size = sizeof(struct mali_c55_params_sensor_off_preshading);
> +
> +       blc->chan00 = 51200;
> +       blc->chan01 = 51200;
> +       blc->chan10 = 51200;
> +       blc->chan11 = 51200;
> +
> +       params->data_size += sizeof(struct mali_c55_params_sensor_off_preshading);

	... += sizeof(*blc);

?

> 
> With your ack, I'll apply the following changes before sending the PR.
> 
> Thanks
>   j
> 
> > +
> >  Arm Mali-C55 uAPI data types
> >  ============================
> >
> >

-- 
Regards,

Sakari Ailus


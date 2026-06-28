Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC66C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 20:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MNxq3nre2XFyGyvcWB6kaxnBzNcf2jxcozOoA2MEh8=; b=aqj/NiBpfwUnRndb/XYJTe34zA
	mGvlzikvacKejUEsr/Mx1+yALQtZV8u/YgQlhYvmDu6lcCeBWNzkH/a1BGg5WsYe2ooSLIUB7okZK
	0YlbfpB3pGutlVY2DE8w3TZtYo+VtRIiRKEenAT3lNNE+Zo0jDx3diO8UZPEBmnJaB8qV1+08EJnC
	+BoQCquUCTKm77BQvvDXKPrUmmnUTQJbAynzvp409yvd/zy6vXMl+yB1uRog7XRI+qpHmGq+sJ2ev
	S6gc5fkO6zUuuDFbAYROnzoeEP29IhulRCuXvKsFn2rWcc1avXcH45ArHjEKFJvPqmebzgI8ROesz
	oOyqMR2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdw73-0000000DMx3-2wcF;
	Sun, 28 Jun 2026 20:28:22 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdw70-0000000DMwi-3sy0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 20:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782678499; x=1814214499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x5Vi4f0phvjV60V3TXIOIorQbkIhfFhMCJ4c7HWwdqk=;
  b=THN6pZqbV0nOx/RKHW6ehnsTfLw/aMZJomlD+TJm1nwZPaDHxmML2m1A
   pi65PAJHOoFHpEdPHKx8TVJKKeaBx8DqyOwcZR0nvleKSOPXGvoUMbtrF
   4Nq2F3ktqBQQ3NjgUxZElRiLiJoAyPjh/xc81sj0K8AQYccdnuP6MiaCj
   YWn8LBHHeF3I3Q1ohCnVoGLZNVme3+Zdsp67A5J/Vtirn4ku9MyGvK7PV
   guYVvV7uYiAB3qIKAhMQ2NHKHT9eEaRFqUV21kwgDveVIT/1spnDXuPge
   K3yTkhNgM04wBdPqcD9Jpk4VWp2/9uHJcv3x4fAqnWmHFgynAyGRyILy6
   Q==;
X-CSE-ConnectionGUID: T/3NFD43TSe6MQAqehariw==
X-CSE-MsgGUID: X9arMdKNRWO5qcMM9Nj2eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94860426"
X-IronPort-AV: E=Sophos;i="6.24,230,1774335600"; 
   d="scan'208";a="94860426"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 13:28:17 -0700
X-CSE-ConnectionGUID: 0nckVlaHRHaa9RU2NwKC9w==
X-CSE-MsgGUID: QfjrX7T9R5Wi5lax0QCKnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,230,1774335600"; 
   d="scan'208";a="249152241"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.193])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 13:28:13 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 229E0121C1C;
	Sun, 28 Jun 2026 23:28:13 +0300 (EEST)
Date: Sun, 28 Jun 2026 23:28:13 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.Li@nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Guoniu Zhou <guoniu.zhou@nxp.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 1/9] media: mc-entity: Store parsed V4L2 fwnode
 endpoint in media_pad
Message-ID: <akGD3ZjW6GPHHI3D@kekkonen.localdomain>
References: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
 <20260624-imx8qxp_pcam-v6-1-4b3f45920d2f@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624-imx8qxp_pcam-v6-1-4b3f45920d2f@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_132819_080643_116D598F 
X-CRM114-Status: GOOD (  24.71  )
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

Hi Frank,

Thanks for the patch.

On Wed, Jun 24, 2026 at 04:37:48PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Each media pad is associated with a firmware node endpoint. Capture the
> parsed V4L2 fwnode endpoint information in struct media_pad so it can be
> reused by consumers.
> 
> This avoids reparsing firmware node endpoint data every time the endpoint
> configuration is needed, reduces duplicate code, and provides a common
> place to store endpoint properties associated with a pad.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Assume 1 to 1 map between dt's endpoint to medie pad.
> Change in v6
> - new patch
> ---
>  include/media/media-entity.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index d9b72cd87d524..4a3785cd9f370 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -20,6 +20,8 @@
>  #include <linux/minmax.h>
>  #include <linux/types.h>
>  
> +#include <media/v4l2-fwnode.h>

We have dependencies from V4L2 to MC but not the other way around as MC is
(or was?) intended for wider use then just V4L2. I'm thus more than a bit
hesitant adding any references to V4L2 in MC.

I wonder what Hans and Laurent think.

> +
>  /* Enums used internally at the media controller to represent graphs */
>  
>  /**
> @@ -230,6 +232,7 @@ enum media_pad_signal_type {
>   * @flags:	Pad flags, as defined in
>   *		:ref:`include/uapi/linux/media.h <media_header>`
>   *		(seek for ``MEDIA_PAD_FL_*``)
> + * @vep:	associated fwnode endpoint information
>   * @pipe:	Pipeline this pad belongs to. Use media_entity_pipeline() to
>   *		access this field.
>   */
> @@ -240,7 +243,7 @@ struct media_pad {
>  	u16 num_links;
>  	enum media_pad_signal_type sig_type;
>  	unsigned long flags;
> -
> +	struct v4l2_fwnode_endpoint vep;
>  	/*
>  	 * The fields below are private, and should only be accessed via
>  	 * appropriate functions.
> 

-- 
Regards,

Sakari Ailus


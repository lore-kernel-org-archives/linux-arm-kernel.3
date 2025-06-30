Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700C9C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 10:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5MsgvSZx39157oIxKTKGWWhRlPgcNpRNggVjUa93CU=; b=Zp/7pfIHUwXqDbx5iMzi4wQduJ
	UaA1Q80ZmsIXcT4M76y8obYvWl8x+4gf+c/CWuoKy/w0eLDuWVRzeIxnkGz77RxUUayOlzPhro/dG
	RtYjnCYiNjJl/hul+W/Ux806/bCOrIBms7nLcj05TXpowqNq1T+csAmxCK3SDFlNtkYfNjCD/gHBn
	h7SQ1uArIOMCxV7IXIX0o31/kwyYm30LxqX8xSKmudoQ0U9Q/UVtzIPXgKwVUF6L1YDM70ziPwdEz
	FEqd7OtvnqM/LOsIkEbj5nUcm0qXUxMxYwZHQpmb4Ux7DxJcC6wczMmc6bLlJEhoYBWNF3dDZ8joB
	4QdckkSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBih-00000001sqq-1DJ2;
	Mon, 30 Jun 2025 10:26:39 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBUq-00000001qk3-0ygo;
	Mon, 30 Jun 2025 10:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751278340; x=1782814340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RSFqeREWgaM1aQE7KXoh84joxLzArgDp6V+nuYoB4AA=;
  b=BINAZAF0YSxJoja4e7XapEDesdgMZZ8NYGghcApsAhPTnEtWUr6OU10n
   mbD8s3bsQu6Lxux8yoo6sMjAHb1CTAWNXOOIMd1T7nsiVTBYNo/6sn69A
   dxxCg8lGagKsziv6ayeUk1KRYSjunCYpYaQCNab6848A78hy3ELdhYP1i
   LoTu4AbqQN+ADJovTf8OCF4z5uB4nQ8q3NFEHh4Pd4sMMN2bD8OdlPUFh
   P8aQvMqmvNTsbLTuo4OttNHkivPUL5IX1/nDqDNsktlmQgTJXIleXsJRV
   WVM+S/cZTzpmC18IaFUXpT/saQWFdojyEuT826H72yQEGQxxBxQ/UVp9M
   w==;
X-CSE-ConnectionGUID: wefJpV8GSMqRTO8zXeAp/w==
X-CSE-MsgGUID: G12m2GtlSfu6RlTvFP5J9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53605045"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53605045"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:12:19 -0700
X-CSE-ConnectionGUID: qXo6RfMHT5i7Utb66m+o9Q==
X-CSE-MsgGUID: nusOzH+dSHmhDzdZ+uAtcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="158927306"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.127])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:12:14 -0700
Date: Mon, 30 Jun 2025 12:12:04 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Gerald Loacker <gerald.loacker@wolfvision.net>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Markus Elfring <Markus.Elfring@web.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Collabora Kernel Team <kernel@collabora.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Mehdi Djait <mehdi.djait@bootlin.com>
Subject: Re: [PATCH v9 06/13] media: rockchip: add a driver for the rockchip
 camera interface
Message-ID: <wi7ccmxg3gmqw7j5khl2hxrhht4iw2i6u3bozeb4smo6eg4ppg@md6yjasbbzi6>
References: <20240220-rk3568-vicap-v9-0-ace1e5cc4a82@collabora.com>
 <20240220-rk3568-vicap-v9-6-ace1e5cc4a82@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v9-6-ace1e5cc4a82@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_031220_308547_31E42F21 
X-CRM114-Status: GOOD (  14.07  )
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

Hello Michael,

I think this is the last missing detail :) The series looks good! Thank you
for the all the work!


On Wed, Jun 18, 2025 at 05:38:01PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>

[...]

> +static void rkcif_stream_stop_streaming(struct vb2_queue *queue)
> +{
> +	struct rkcif_stream *stream = queue->drv_priv;
> +	struct rkcif_device *rkcif = stream->rkcif;
> +	u64 mask;
> +	int ret;
> +
> +	mask = BIT_ULL(stream->id);
> +	v4l2_subdev_disable_streams(&stream->interface->sd, RKCIF_IF_PAD_SRC,
> +				    mask);
> +
> +	stream->stopping = true;
> +	ret = wait_event_timeout(stream->wq_stopped, !stream->stopping,
> +				 msecs_to_jiffies(1000));

Checking for stream->stopping is TRUE then waking up wq_stopped
wait_queue is being handled in rkcif_dvp_isr().

It is not the case of rkcif_mipi_isr() so we are always waiting for the
timeout when stopping the stream with the mipi interface.

> +
> +	if (!ret && stream->stop_streaming)
> +		stream->stop_streaming(stream);
> +
> +	pm_runtime_put(rkcif->dev);
> +
> +	rkcif_stream_return_all_buffers(stream, VB2_BUF_STATE_ERROR);
> +
> +	video_device_pipeline_stop(&stream->vdev);
> +}

--
Kind Regards
Mehdi Djait


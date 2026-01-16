Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FE2D48994
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 12:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qO9luZDIaDN2E1/3owFBQyqDXIAHSTOGorsDH4oOkcg=; b=rvYCSILLKlRxj/gFRLJqxQs1MI
	+6ZMxDg2GYUsxLKMBY2NMtsH9i8XXvs6lhf6hYchFtGm9L84LKmyQLLk5H3Rfh9rx1rMtgnZVyCbj
	sYlm2t8dZkJaMf8jU++fs2MgonE2aUpx+ghX4HkR4KX72BFi5BWSHFYYJC/Fezni1QuoTU24vE+O1
	G4ZHOu2556nIlW7LrvE7VfCwo982je/BJbAmn/HTGOm4NmJR3iIINTEsIqT5GRcJyRMS4kU+DSyF4
	Md3egrZuLBzanBak2Wdd0HY+5oiQAHLc5EJBeaLFOaIwfs743+4T6Z5ENQ2dm3tlB5bKY63+zWp7H
	Mol2cxkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgijp-0000000E66T-2Tsn;
	Fri, 16 Jan 2026 12:15:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgijn-0000000E66J-2Nmf;
	Fri, 16 Jan 2026 12:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qO9luZDIaDN2E1/3owFBQyqDXIAHSTOGorsDH4oOkcg=; b=Qzn6WcLO20QmvJCMb5waauLG/9
	SrjAB/F4c2HtkG1/RgBqLU0wk0w9XHsOyUCHBSAfLOdEVv+PAgck9lF11CAMbPIGI7rZAF/fZdXqe
	JQ1NLbrOTL6aJfqRBlzA7F1eZbuoyB5dYuX2DsGvI5Pymtq2ylrspjBRmICTkq5dRX3a5n/gh2Rzg
	1nQYjVFZ0gIoopWzh2MG/6WWcaxQC+CCHWNOWVy6AGP0VuP4ly0eJXX2kBK/U56x8meHWHX2k1E2+
	EgLgNROW+4wjAXX6MvugZsHXBmPIR4O21RwSZ598WZlB/yqs2GLQI5vaUn5FceTrU9tMWtMCbm2xS
	OURCi3gA==;
Received: from mgamail.intel.com ([198.175.65.20])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgijk-00000008gUm-17c3;
	Fri, 16 Jan 2026 12:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768565732; x=1800101732;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OIr+6UCiu8PtyDY3DO1T3eeJXV/4Zp3ip7vINaVaq1c=;
  b=nPn4wKez5CE7Fbvw2zq4kNUKmDi4/6NDe3y90yMDWJt1crUKotD7MXvP
   4Lwyd+zumB7cRkQA3dZZdkWeJhNNbie5iDXcoXDjmUraPom4J7GdROBZe
   DwwX0Z4CVt3TXErbFHwDVEA8hTle3h4m4Gn5yR/iJb7X5IuO1wIfm+kbx
   7YkBckUu44n4afy/OfXhF701rFD3dK1/qmvA8KJMwtW5m971tm3X1wFoG
   tdI0x5baQCxEkjGTelYKWoUGU+zv2vPSs3UDBcxpF72vOY+g+0QMEDVDA
   Qj446WRXc/PprHg7m9jr6mp51FqfSRSYEypLYwy4SQ1rBsCqRhAsWBsKU
   g==;
X-CSE-ConnectionGUID: HnfBWq62Rv+XFx0iD6wF/w==
X-CSE-MsgGUID: vutFZJI+Sja2uLnAKQsFWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69610998"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="69610998"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:15:25 -0800
X-CSE-ConnectionGUID: bQYu/FcJQzSKCczeSozK8Q==
X-CSE-MsgGUID: SZtPAKbWReGUT8lHnDMIYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="236491879"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:15:22 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1866111F726;
	Fri, 16 Jan 2026 14:15:22 +0200 (EET)
Date: Fri, 16 Jan 2026 14:15:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
Message-ID: <aWor2m3TNJ-kHJha@kekkonen.localdomain>
References: <20251114-rockchip-mipi-receiver-v3-0-16e83aa7f395@collabora.com>
 <20251114-rockchip-mipi-receiver-v3-2-16e83aa7f395@collabora.com>
 <aWdjGuhk9g1iaJuN@kekkonen.localdomain>
 <fc15b8e5-c7ae-4e0e-b3b7-7ce5b5139455@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc15b8e5-c7ae-4e0e-b3b7-7ce5b5139455@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_121532_741720_2DD074EA 
X-CRM114-Status: GOOD (  19.97  )
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

Hi Michael,

On Thu, Jan 15, 2026 at 03:50:59PM +0100, Michael Riesch wrote:
> >> +	/* set mult and div to 0, thus completely rely on V4L2_CID_LINK_FREQ */
> >> +	link_freq = v4l2_get_link_freq(source_pad, 0, 0);
> >> +	if (link_freq <= 0)
> >> +		return -EINVAL;
> > 
> > Could you return link_freq here?
> 
> Ack.

You should also test for < 0; v4l2_get_link_freq() returns the frequency or
an error (and 0 isn't valid).

...

> >> +static int rkcsi_register(struct rkcsi_device *csi_dev)
> >> +{
> >> +	struct media_pad *pads = csi_dev->pads;
> >> +	struct v4l2_subdev *sd = &csi_dev->sd;
> >> +	int ret;
> >> +
> >> +	ret = rkcsi_register_notifier(csi_dev);
> >> +	if (ret)
> >> +		goto err;
> >> +
> >> +	v4l2_subdev_init(sd, &rkcsi_ops);
> >> +	sd->dev = csi_dev->dev;
> >> +	sd->entity.ops = &rkcsi_media_ops;
> >> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> >> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
> >> +	sd->internal_ops = &rkcsi_internal_ops;
> >> +	sd->owner = THIS_MODULE;
> >> +	snprintf(sd->name, sizeof(sd->name), "rockchip-mipi-csi %s",
> >> +		 dev_name(csi_dev->dev));
> > 
> > Do you need to give it an explicit name? (v4l2_i2c_subdev_init() already
> > does that.)
> 
> I do, actually. I don't call the _i2c_ variant. This is a platform device.

Ah, I somehow thought this would be an I²C device. Please ignore the
comment then.

...

> >> +	pm_runtime_enable(dev);
> > 
> > You're not resuming the device in probe(). I guess you depend on CONFIG_PM?
> 
> I do depend on CONFIG_PM.
> 
> I don't think there is need to resume in probe -> resume in
> _enable_streams should do the trick, right?

Ack; that's fine with CONFIG_PM.

-- 
Kind regards,

Sakari Ailus


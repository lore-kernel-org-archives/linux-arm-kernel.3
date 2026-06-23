Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2376CCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 10:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wAPmSIrSM+4x+sRyOY4soM+SDdAdjENQXqDhlhF2Hk=; b=JR2XrsYjHF8wk+1Z05xu0HYKyt
	HaLGtcBcspf0uB6fXeqqVxJXJt8xBTTAs3VKrfG9EX7jQK8KYmAtLN8BDATcl6QFDloMJxRM+ijK5
	f1dXJRs/gT8N5i2X9b4/nNKDXp3ziY5JgKVGNd8PQnbRiwy6WOR5+3U7C3GsTgJiBUjNh3oSL8GhM
	lWO5zOSJOPUhZh4tjZ5G+RQT1Jv2cN2OZ9Pf0ENXX0P1O5BwkhWI+FcRBV51i3QIcMrLpapFFN9EA
	Ih7/epR7pckn8JjE/0HFLmESOu5t8NOYo2NHfYx8dGR0jyfgyvTh9KkOpM/jPCLskj1DWqjZUeYa1
	seMaaw1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbyBb-000000064nH-3aGC;
	Tue, 23 Jun 2026 10:16:55 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbyBZ-000000064mj-1w3Z;
	Tue, 23 Jun 2026 10:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782209813; x=1813745813;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6bKxg3mN3i5Bark5W9/mVCmbmllTCHZ+dsMNiE6JZKI=;
  b=gPCo8moZHSBJcdIlrltZYTDeRSMK5+9zyO1qY20AzF/bpUx/8AsBviX2
   d+fZQVDMj3skmScHVEC1mDGEWSfcjTW+pW79Es4y83LYDON7rgusJ3r/g
   F2v5fvPxdOroT/6BdxVA3tX3LBskIg66cDacoM4pnwZ4P4xiYMOyT7NWy
   Qim8IWKw+SxH22Tr0tT0+xC82Vfof+FhNemg7w2sob2zQdP+1jJDCcPPc
   v4Xm5kwBE10zCTYFBqOtC5Q6glmc4I7PvJ8c+U82L1heB0TYN2BvV4wlg
   N+9tvMUEXsdtZyd2lVczWd79i9hKQP/u6RDzV57dTN5KjbwBOCy5Dq8ET
   Q==;
X-CSE-ConnectionGUID: 6aTv/e9pQPKLa4mXckHoow==
X-CSE-MsgGUID: JtKS3VabR/qEGrY0vGyMow==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="94064581"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="94064581"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:16:52 -0700
X-CSE-ConnectionGUID: oBBWS6GuS0iUyF5cRmiQxg==
X-CSE-MsgGUID: Ax1MZTXeQRWV89v3jlZ8VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="245121467"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:16:47 -0700
Date: Tue, 23 Jun 2026 13:16:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank.Li@oss.nxp.com
Cc: Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 3/4] media: rkisp1: use
 fwnode_graph_for_each_endpoint_scoped() to simplify code
Message-ID: <ajpdDT1N5cjtmAly@ashevche-desk.local>
References: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com>
 <20260622-fw_scoped-v1-3-a37d0aac0a68@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-fw_scoped-v1-3-a37d0aac0a68@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_031653_538828_8169C663 
X-CRM114-Status: GOOD (  12.16  )
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

On Mon, Jun 22, 2026 at 10:30:13AM -0400, Frank.Li@oss.nxp.com wrote:

> Use fwnode_graph_for_each_endpoint_scoped() to simplify code.
> 
> No functional changes.

...

> -	fwnode_graph_for_each_endpoint(fwnode, ep) {
> +	fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
>  		struct fwnode_handle *port;
>  		struct v4l2_fwnode_endpoint vep = { };
>  		struct rkisp1_sensor_async *rk_asd;
> @@ -286,7 +285,6 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>  	}
>  
>  	if (ret) {
> -		fwnode_handle_put(ep);
>  		v4l2_async_nf_cleanup(ntf);
>  		return ret;
>  	}

In this case you can go further and actually replace all the

		ret = -Exxx;
		break;

with

		v4l2_async_nf_cleanup(ntf);
		return -Exx;

in the above loop.

but I assume the original is also fine as it's a common denominator for all of
them (and only one case has something in addition to that).

-- 
With Best Regards,
Andy Shevchenko




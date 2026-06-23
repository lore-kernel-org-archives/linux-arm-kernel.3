Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A30CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 10:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osWb8VPpirSTRgDBWbtKsZxOcarD8TaWy2PYjaB8LLg=; b=I9MFkN3Q5FjC8JxOpwdsiUHogs
	Js2TQbBpDWzUcQcoYWpQJR6J015uVh8ZCELXgYugDL7hVYTjrjlFtGYsmRPAvPA9Qrk9l4zmxoQwp
	xbpD1Vajzgruget1WHkay2wC3JxOidKVixjPRYReh4CZevczdEgDEpuVuHPWa2LEfXimLtqqhMKFk
	KEbWY1Z8VKlmICMh/3yR074Mt5qPfGX8etynBYr1sQbkxN3CD1GrCcTqx9QsLA+vYRuUWzbM0Zhx/
	7xXBIPpnXxdTilaipRRU3wf1Heg8986C0LZw3KFJH71MIVCoL0alRoGDH5HZzY7YzbCWGPYQ6UqRC
	nu6upG5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wby4W-000000063xN-2JmI;
	Tue, 23 Jun 2026 10:09:36 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wby4T-000000063wo-3OLs;
	Tue, 23 Jun 2026 10:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782209374; x=1813745374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xv4r6u0rAfI0XXJ7Y3S0NT2YfyY0CONMP/ImwPkH8bw=;
  b=iXalQzkY0cXapvobAqgPXti24h3js13Q8qAjccWfZXJ+atDxfIl6uRr9
   JUh6rlKF8Xs9reLfmpxb7HydGoygfBgFEiX/gLAF5N+4WlaCAd9LU3ciS
   jPvbjUgMvNnEJTLVUfs0OWENKbkiz1OgPYVDEqQuoZC0v6SZVfjTFIoP8
   /eIyQANaCzQkcpivpbOjzwDb2bOYN18e+iJYkq0Q67Qgf+wPL2+xU/1yG
   JIT3DJg9QLRImQCfttockVmcotktlLMhqYkXhb7N82i+rvPz6ML5kSxOH
   aKh2WxANOzAQlH888ET4kov0JstOu+GhxeFY3pWurNI5ES/y3x7itiOtn
   A==;
X-CSE-ConnectionGUID: 03vEpxKqTlCeFP7sTII19Q==
X-CSE-MsgGUID: 4GKr2iCZTJujHsFdssLmXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="100376404"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="100376404"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:09:33 -0700
X-CSE-ConnectionGUID: fO295pNvSEiHBZM9FO5beA==
X-CSE-MsgGUID: +viiu0Y0Q+aDKjP2Rb+XuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="251411103"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:09:26 -0700
Date: Tue, 23 Jun 2026 13:09:24 +0300
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
Subject: Re: [PATCH 1/4] device property: Introduce
 fwnode_graph_for_each_endpoint_scoped()
Message-ID: <ajpbVCGGKchNa2rd@ashevche-desk.local>
References: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com>
 <20260622-fw_scoped-v1-1-a37d0aac0a68@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-fw_scoped-v1-1-a37d0aac0a68@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_030933_887634_9FE97BCD 
X-CRM114-Status: GOOD (  15.57  )
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

On Mon, Jun 22, 2026 at 10:30:11AM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Similar to recently propose for_each_child_of_node_scoped() this new
> version of the loop macro instantiates a new local struct fwnode_handle *
> that uses the __free(fwnode_handle) auto cleanup handling so that if a
> reference to a node is held on early exit from the loop the reference will
> be released. If the loop runs to completion, the child pointer will be NULL
> and no action will be taken.
> 
> The reason this is useful is that it removes the need for
> fwnode_handle_put() on early loop exits.  If there is a need to retain the

Just be consistent with 1-space versus 2-spaces gaps in the same text.

> reference, then return_ptr(child) or no_free_ptr(child) may be used to
> safely disable the auto cleanup.

No objections from me.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
See one nit-pick below.

But you will need driver core maintainers to Ack this.

...

> +#define fwnode_graph_for_each_endpoint_scoped(fwnode, child)			\
> +	for (struct fwnode_handle *child __free(fwnode_handle) =		\
> +			fwnode_graph_get_next_endpoint(fwnode, NULL);		\

You should follow the existing style, the 'f' in fwnode should be under 'u' in
struct.

> +	     child; child = fwnode_graph_get_next_endpoint(fwnode, child))

-- 
With Best Regards,
Andy Shevchenko




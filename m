Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48C2C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 06:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jgtdgq7H6u2oGz9ubZWRYfvPpAotzqqr5dWVf/kONZY=; b=ooBZiwZdM3LpyJoxnEY+hRj6y9
	raCcnhDWmw10p9Gk8aXQMDKjZzxuA8081PVlt6r+v3IjtbSxsPbwq/wGL4JYAcBoFyX3eDztzblL4
	ffV1pDtu8GUXfmVeaHQXAAdk+VEPT/KndvhVUrAkNt/MBxrbZewRCRYuQznZCyZ+IFb5ellSCkHnv
	ephy3s/gH+bA6ZucgkoKQgWj0YpSBiTGnNwdXhuaYdk4oC3cLTL9drQ3HD3/LFzWXX6Gx01K+ZoUp
	NOdfTGHgDTNN7+vffpgtFgUXFjVBk/vV+iz+2MJLSv8VoHyj4NM1w+CKqGDhtM2TA1vF+QEi3HMBu
	dnsNXiiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobHz-00000004XBZ-2L7L;
	Tue, 28 Jul 2026 06:27:43 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobHu-00000004XAj-3mtb;
	Tue, 28 Jul 2026 06:27:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785220059; x=1816756059;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n61/Ko2KpmPXrNRArmSqenWM8pHBLVFT+MXAHy832ds=;
  b=csqszLbYrRJlJY78iHTjszmmCGOpJ6vq5wKsT+L3izWAYBqqjeysjx5H
   8rBKNNEfmKlHSzAlufEi8vNCd4SeQE09eEUNz27Oi/+SlCzgxt6JebfF6
   eBPNd38rQr0qH0sDnyYQ0z9+OkPX/VVMX8V9s+qZfCerpxymNaeODYTN1
   94pXeSH6f/ukYM3AZloriNENafuplGPNlj/6Nmf3Wvt+0kkPcz11qHJ2+
   x7tFlTQTNk1fyjtrBzAMBl4JF48PcOtrdnal2Z8OdeYLdVCkmJLAT0/nV
   46gUUpq58odYB4o2xpCyGh1+UA43jxRv5iOrdoq3JvsKbLqx80/w83hR/
   Q==;
X-CSE-ConnectionGUID: UOkUUL1zTsWRmJA2mrr5aA==
X-CSE-MsgGUID: YeKPAtglRcWJCQpwnVmfLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85916866"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="85916866"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 23:27:37 -0700
X-CSE-ConnectionGUID: 7lUQRfEHQpKN9hWm0txrsQ==
X-CSE-MsgGUID: YAB21esTSxytgpm7w8nVtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="284154898"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.69])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 23:27:32 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1FDE0121C02;
	Tue, 28 Jul 2026 09:27:32 +0300 (EEST)
Date: Tue, 28 Jul 2026 09:27:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank.Li@oss.nxp.com, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Frank Li <Frank.Li@nxp.com>, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 1/4] device property: Introduce
 fwnode_graph_for_each_endpoint_scoped()
Message-ID: <amhL1BkIG0uTPceL@kekkonen.localdomain>
References: <20260625-fw_scoped-v3-0-ffd0868e498d@nxp.com>
 <20260625-fw_scoped-v3-1-ffd0868e498d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625-fw_scoped-v3-1-ffd0868e498d@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_232738_961967_62465452 
X-CRM114-Status: GOOD (  25.23  )
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

Hi Rafael, Danilo,

Can we merge this via the media tree (assuming you're fine with the
change)?

On Thu, Jun 25, 2026 at 10:17:21AM -0400, Frank.Li@oss.nxp.com wrote:
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
> fwnode_handle_put() on early loop exits. If there is a need to retain the
> reference, then return_ptr(child) or no_free_ptr(child) may be used to
> safely disable the auto cleanup.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3
> - fix missed a tab before \
> 
> change in v2
> - collect Andy and Guoniu's reviewed-by tags
> - fix indention
> - remove extra space in commit message
> ---
>  include/linux/property.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 14c304db46648..c71177ca16a95 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -545,6 +545,11 @@ unsigned int fwnode_graph_get_endpoint_count(const struct fwnode_handle *fwnode,
>  	for (child = fwnode_graph_get_next_endpoint(fwnode, NULL); child;	\
>  	     child = fwnode_graph_get_next_endpoint(fwnode, child))
>  
> +#define fwnode_graph_for_each_endpoint_scoped(fwnode, child)			\
> +	for (struct fwnode_handle *child __free(fwnode_handle) =		\
> +		fwnode_graph_get_next_endpoint(fwnode, NULL);			\
> +	     child; child = fwnode_graph_get_next_endpoint(fwnode, child))
> +
>  int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
>  				struct fwnode_endpoint *endpoint);
>  
> 

-- 
Kind regards,

Sakari Ailus


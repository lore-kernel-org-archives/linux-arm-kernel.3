Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051AACDB466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 06:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2S5wQkJ7oDInTepN3k9OHxotHUCNgt6rfOIAJ5F7GA=; b=IW6hBd/nL1nJods53H4OEKs3UN
	s9rYkLy6MKBpNvN0p99QuV67Gmvp6Cc4R43f75jPP+JbGjGehyvcY56zv92X70idTRqglIcrBw78A
	w4PBYE57vZqLwAsm//tjqci+Bq3RQMzsErlGFcUZ80hmejjSjQrri6uT03bekOgTY+JsySMk1Gfnk
	41UpdAqh2U3yOQQad4Oql0d5FPTd3nb0GcTdAOVW1IWnikXX6p4qNJPO9o8/09DzbHeFsh8TETZnM
	zAtupm0vLvFBEqtgiQtHbPoYUbZDe3L61nGH1lCdl7Pk8o+iweBGolbuS2ovpZ8NTU0fBnpSTi322
	QN5xcczQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcdev-00000008i4b-1bUg;
	Thu, 25 Jun 2026 06:33:57 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcdes-00000008i3y-1NSX;
	Thu, 25 Jun 2026 06:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782369234; x=1813905234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FBfQ5z8ocvcr92KhtSfiqgzAuZkaUppGNWRywcRPaKI=;
  b=fqyGA7AxE2iGK/urbwigc59+P6kZNNo547WxpdJkMy8v7czURQov/Wnt
   fBIEZDbVnk0MNA7J6J5SEHqb4pCJAaEJ7+ie+YUivdljBMuHeoN0rZdaA
   XvgCYbjF2wkUME7KEPkof3BaEGEAbXf7s47SfXUrJIEGUjjjrx7ZMz245
   +iGL1PVh2Tq3yV7eLWlGRNbdGkLBVhhtTtvCqmyaVMPJ+LYDJaWLgxPLY
   XjeOsOglUyMPLDEZ3xBg7rA7LMKfQ5/GUO5vyYXMNh4DkEPkLN5/EOhmL
   gHnvyf/EWDMn2rIY+RTSlDCWqpc9/MrQVBl9TaU7TJcfrxxAkWQ3joYaV
   A==;
X-CSE-ConnectionGUID: fr/4i0JCSy6Nuvcdd7J3/Q==
X-CSE-MsgGUID: BqwP4fh3TFipQvldduEjwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83141345"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="83141345"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 23:33:53 -0700
X-CSE-ConnectionGUID: +diy+BegSCGuh5hOe0bZfQ==
X-CSE-MsgGUID: 874nazgcSQ6Sp/Y1exe5IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="274626595"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 23:33:44 -0700
Date: Thu, 25 Jun 2026 09:33:42 +0300
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
	Frank Li <Frank.Li@nxp.com>, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: Re: [PATCH v2 1/4] device property: Introduce
 fwnode_graph_for_each_endpoint_scoped()
Message-ID: <ajzLxtn_b3MC-NAl@ashevche-desk.local>
References: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
 <20260624-fw_scoped-v2-1-0a8db472af4a@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624-fw_scoped-v2-1-0a8db472af4a@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_233354_402815_71FB3325 
X-CRM114-Status: GOOD (  15.64  )
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

On Wed, Jun 24, 2026 at 01:00:09PM -0400, Frank.Li@oss.nxp.com wrote:

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

...

> +#define fwnode_graph_for_each_endpoint_scoped(fwnode, child)			\
> +	for (struct fwnode_handle *child __free(fwnode_handle) =		\
> +		fwnode_graph_get_next_endpoint(fwnode, NULL);		\

Now there is a misindentation of the \, id est an additional tab is missing.

> +	     child; child = fwnode_graph_get_next_endpoint(fwnode, child))

Collect more tags and send a v3 :-)

-- 
With Best Regards,
Andy Shevchenko




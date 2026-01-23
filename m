Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF74D7234A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 08:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CFcSuHr7dWPiV/hrXVfNULTjd0rP0Xmx2/h4KqK09k=; b=seEKZdnzuIPCx51objVr0ttBJF
	ED7DmlPacu6gfCgGrPAZTzkskDOtjL/Sqhq/2wk3NZbRrS5OIHlC2FUHo68gXH394P81qbrXU/4XB
	RPQtNhqhgJbjOBlYwsZzdLpX7PlYXY5zq73YLjEzfmR9NHYFtnV8YIEsUo2pRlDN5fK7Dn4kpiwCe
	ENZTzXyFmDjJ4XQwLsatzs1o6Hfqk9TtBn1T7W3ek14CC4Jb8z1GxPkX1END0KShOazN+CY2jFnhu
	yeBOdWqw2VkuJ2IxUd+Np5/ZOKV1bP4mSpDEIigtZkvcnuksWd0Tqu+LjlBZx/NtI9jgpu2d3Iyvt
	XgdHc0uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCWd-00000008TFf-20xG;
	Fri, 23 Jan 2026 08:28:15 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCWb-00000008TF2-0rE4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 08:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769156893; x=1800692893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f65dWROhIgQSllIOrHPg4GN88gqDR35g4mKGzowJeJ8=;
  b=EfUHxJkQnn5L5+Lut0OQ011I9W17hn5aN98vQpx1MIl5ilVzTszw/duw
   k0yrYrFx4HVwy4AIvGUSjyq4ZujxuYMMdXaco6ax8lEzxYeioFZFp3pKq
   U5THiSyYpPjuE888t8RRdES6UurItpKRIjavPCos9GlQ+34dyCbbml7UZ
   qAj02/w/BVBxQBXMqNmhDPn6MKt8hPs0MEAIiig/BdavnroQI+r6+Bx0S
   YcK5phicYxvJ4zI8geJxEvvqpIqn40ZOHifsicP6oDkIXOTxFq8cVaky9
   xTlzblcNzAhZqHOTgp9BCH2+9Vypk5+cydqU2scca5Ti5aWRazJSilus7
   w==;
X-CSE-ConnectionGUID: bn1dvtqTScm/9wY+d86TBQ==
X-CSE-MsgGUID: OsIiMGp7Rziu+N6mAA5u4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81851014"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="81851014"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 00:28:12 -0800
X-CSE-ConnectionGUID: rlqY79jXTOKaQE/biOXfOw==
X-CSE-MsgGUID: qOMa2TYySp+eDSwebWS2wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="211091828"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.112])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 00:28:10 -0800
Date: Fri, 23 Jan 2026 10:28:07 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] i2c: xiic: minor cosmetic cleanup
Message-ID: <aXMxF45gX1qS-CeU@smile.fi.intel.com>
References: <20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai>
 <20260123-i2c-xiic-v3-5-eb7cd4254dfb@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-i2c-xiic-v3-5-eb7cd4254dfb@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_002813_282852_0DD92DD4 
X-CRM114-Status: UNSURE (   8.37  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jan 23, 2026 at 08:02:48AM +0000, Abdurrahman Hussain via B4 Relay wrote:
> 
> Add a temporary dev variable and reuse it instead of referencing pdev->dev
> everywhere.

...

> +	struct device *dev = &pdev->dev;

No, this part should go earlier because of other patches that use it.

devm_clk_get*()
device_get_match_data()

Without this you add an unneeded churn.

-- 
With Best Regards,
Andy Shevchenko




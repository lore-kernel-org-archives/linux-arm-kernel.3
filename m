Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18675D7234A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 08:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZBMt67m6JLzWx3hVir/vPDPmNeGcdV84vmId0uhgts=; b=WdfSEyviAxn4WUUho+70L/o1O9
	1hJ+9vUoq3V7L2xED1qraBJj8KTivhUdnOFEzr2CWI6Zjdxw9lRf5ljLZvMf/rXZ4EhYGkhKOxpcA
	2m6pDqLnqSQByzQwHk7EpYINR/UZlxNqiGo/9iCOQ80DLJiOdrHed4lWoQErqYqeCgYIr1ZDQRcms
	5RzkrJS8A2y+A0tdbtOWIHkODPp2QINyLAOkD3vKvpN0WPUWsfg8RvTPnko1X2fFOreOgYcNlg8qo
	eiE50l6jRgpovb31kwofFW4z259gg7n/1nApSkqCDBCnG5mY+fpIqbqdPTkg663zmwO6z5FoCMOx/
	KB5q9nwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCYX-00000008TSv-13TY;
	Fri, 23 Jan 2026 08:30:13 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCYV-00000008TSV-1Vmn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 08:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769157011; x=1800693011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hh5sToR9AGwKIbDihovytp3JPE3xlUNC/QVFWChK7OA=;
  b=InC87shZsVrfXEJgM3wQW1yhrAXW2UnLQqSzl3OitotcnkYrE1bFCfuC
   8+0zD1TEVNBo0nWrb314og4BUGCfXGuaAPrcMvgfxhrZfwJTq3VKkvEJW
   6e/f+hCQIut1EUnLmCGcrnDDm4v3pr12Alj2doRyuPXC6O3qDQ8CMq+3U
   dvxETxqygvN+Wsnr7KmEfOBuyXD//2UcC7bDynSPuF4/p+g0Z/lLwFg94
   is9+suC+Wh9DAhcnKijGnIELaohVNx8PLCcHJfkBkwufjomdMiO7QRqEH
   TyjAxoteLyRUUbFajpkbhu5tns8hiBQ0bUWFtwM40wnxkeJGtsFJW6TzG
   g==;
X-CSE-ConnectionGUID: r2bnhbNDQISPN0XW5v6oNQ==
X-CSE-MsgGUID: evss0sL4SSe6YEvwTt+kKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70324201"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70324201"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 00:30:11 -0800
X-CSE-ConnectionGUID: rPNXQazcRA6HQjCwhWtTmQ==
X-CSE-MsgGUID: wkDdG5swQYmFViiTm5NO7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="238228011"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.112])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 00:30:09 -0800
Date: Fri, 23 Jan 2026 10:30:06 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] i2c: xiic: switch to managed version of mutex_init
Message-ID: <aXMxjo-KcfEOtsX7@smile.fi.intel.com>
References: <20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai>
 <20260123-i2c-xiic-v3-2-eb7cd4254dfb@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-i2c-xiic-v3-2-eb7cd4254dfb@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_003011_444584_55F27E6F 
X-CRM114-Status: UNSURE (   9.34  )
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

On Fri, Jan 23, 2026 at 08:02:45AM +0000, Abdurrahman Hussain via B4 Relay wrote:

> Simplify the error path by switching to a managed version of mutex_init.

...

> -	mutex_init(&i2c->lock);
> +	ret = devm_mutex_init(&pdev->dev, &i2c->lock);
> +	if (ret < 0)
> +		return ret;

Should use 'dev' instead (see comment on the patches 1 and 5).

-- 
With Best Regards,
Andy Shevchenko




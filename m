Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5696FD79769
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hyg7vN2ThWAMCuaTpUnSKl1dSyIfWQa0c6B0/PN7ta0=; b=Dx6k95hr0GC0BH4kuAO7R5EbFO
	icxbL/SRNAZXocB7K0pmL0yodkau5OGhC5I4QOXOAectrTu2m5Cn2c5ugvxUytK5IVa07c1xESD9d
	Z3BONENIHYLlqk69nxDYpQXQ55YGKIZ46DdiYdRp5Ywi+v9wE8Ct1BNw20qFijfMWHxy4fSJ9fhAN
	VYIk3NsPsSFl8B4MNGFhtr+6HC1VbwTgTtGAA5nJFRJk1Caeyg8kPAEh/1rxv8jZrxNiHKtIO6M6V
	yp5hZymQJQoVhMOWGWiboJUMlAruxPseegaW6L1FqPlByGC7JuC8IQ1yjB9Bmcka7l3S7CnotTXvG
	e8gWf+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8e0-00000002Vhf-2QJK;
	Sat, 31 Jan 2026 10:56:00 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8dy-00000002VhK-1ln0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 10:55:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769856959; x=1801392959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i8OKyiXWF1B5bWDrtl9oWmy/hdR4q3YhBRSRvOtR66Y=;
  b=BSVhqRmps1WNoNu8/R2hWrh2sfub6+fPg8lH9HEXn0I4RVCk4sekJ3L8
   hpomQLUH1VuVzbejKA8jUpj+WIjKBXDkF1le8iS59DmI7vlF/yKt4IBzq
   fbWjyF3RpGl+jwHUzOElTIyl4iQ0+jeJ2dGec8gXNAIPNpNKAu+u5xSh8
   h0GnZUqfjNLli1xTDqJ7sLRahx9phHhHHJ4jWPXcFFRiWQKJp+dCUjM/p
   fe7JgouwGHUwltQR8cSCwVXkK2EOlg1rvHb8Du9HXeoK9DwSGfvfsp5Er
   3lDlN0AJmYc+yk+HbYuL5C8Ib5I5cPcKLDHBUzuXGNxYk+vpCQq02qJ2M
   Q==;
X-CSE-ConnectionGUID: ivjfsWZORL2nEMUC39KJhg==
X-CSE-MsgGUID: 6GyQ8bRVTlmhRw6Laee4/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70811786"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="70811786"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 02:55:56 -0800
X-CSE-ConnectionGUID: BtYc0yn3QLOyesdykEGhUw==
X-CSE-MsgGUID: SPcmrXqkSh62GsT3WTbrmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="208646621"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.97])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 02:55:53 -0800
Date: Sat, 31 Jan 2026 12:55:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 6/6] i2c xiic: cosmetic: use resource format specifier
 in debug log
Message-ID: <aX3ft2nKrUkQ7Xg5@smile.fi.intel.com>
References: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
 <20260129-i2c-xiic-v7-6-727e434897ef@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129-i2c-xiic-v7-6-727e434897ef@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_025558_528874_06675904 
X-CRM114-Status: UNSURE (   6.08  )
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

On Thu, Jan 29, 2026 at 09:43:18PM +0000, Abdurrahman Hussain via B4 Relay wrote:

> Use standard resource format specifier %pR in debug log.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko




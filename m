Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144C5D32D92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l26aJY/Y6gePDvNbMcAS8A4cxSMlEmVxHTpKIa1O4DQ=; b=LTgFuIonMwV1PpA9/PUW3VhALW
	GeydmVCAxO1Z9Z42KoyuYUzA5PI8fkT7QD98pWfta5zcKow1la8HoWIZItXJM3bfNHFltUlC7Sf+C
	KPci9EipiDj2tYLkIXDTBDt4su+HGLvX+L+n5dlm/iQo/KtOPEuzSgbEuTnBKdExdvrhP6O5zmjfV
	6F3LYGjYXSQdz15Xt8mvDTrXaXfFS6FpWJPnT981PGTHxpPbpz+3Zsv13OxDhP+8NDlttx5KWumGE
	THKE5Sgi4Nl3nKCmPUy4mRbHAOI+6aVlJmcpwc3on4nu/uY0GtkgaPMe2VCCEY/cuZyPh5nywam6r
	I+gNgz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAovP-00000003CEL-11yT;
	Tue, 12 Nov 2024 11:19:11 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoHf-000000034gp-1bhO;
	Tue, 12 Nov 2024 10:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731407887; x=1762943887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qF8JGdf/0mGdjzYO7DP7kHts4/WoQANssCTIjAVjDss=;
  b=cE529qV5i7iQAcdAsEhbuzZ9lAL2Wk1X+rhplr+FVoDrpJaFBhCnNmkd
   O7hrXBvAvpo0/ibyZIcGXz+GnxYFX9p5qnjDsANAd6KqMYDxzj1kVUhQI
   zeK9zFZwkvY4/5Z0o5qp9Uv00dodOqkc/6PJ7yOtL1R00ZMo3vQ7iOe8P
   nzxcX6FDIOVAiUDWbEojg/+yO6UYLVUAEnj+zoi1sWxN+W84MjXqhxPzt
   ot0sljSL16N7kWEtPngqI1VcHyi5TCzqr6cNMZEN75Nqp5WyAns2LaDrj
   sGyJFLy8RLLDXnBTO2FqNS82nKcSRMt0vyj9kDbR9T5OXtwWgGEJpbJjO
   g==;
X-CSE-ConnectionGUID: LM8dVB/6RXWDZVsKabroRA==
X-CSE-MsgGUID: jCGneIYHRWODmCfF8BfSyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="31330502"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="31330502"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 02:38:06 -0800
X-CSE-ConnectionGUID: 77uiAGmWTViu8lVPjZb/aQ==
X-CSE-MsgGUID: qBYZYSd5RK6zlTAA1PN46A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87343607"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 02:38:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAoHX-0000000DwKd-44wz;
	Tue, 12 Nov 2024 12:37:59 +0200
Date: Tue, 12 Nov 2024 12:37:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v5 2/4] gpio: rockchip: change the GPIO version judgment
 logic
Message-ID: <ZzMwB8UQUR6BYAzI@smile.fi.intel.com>
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
 <20241112015408.3139996-3-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112015408.3139996-3-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_023807_482939_5299D61B 
X-CRM114-Status: UNSURE (   6.98  )
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

On Tue, Nov 12, 2024 at 09:54:06AM +0800, Ye Zhang wrote:
> Have a list of valid IDs and default to -ENODEV.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




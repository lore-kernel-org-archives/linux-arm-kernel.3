Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8564D2E9D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 10:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0IHteeKts4epJCun1qd5HheXpj3V4jYBcTr/zbvJxc=; b=aBxCqvHtQaKDTpYUFMuKGs8KhZ
	jHhFnEIC/RPt0WKWyNh3ZkGEMXuARz86VHCJxHyyTPKSTtTQupA1fVmlmiKXtP+L9StmzLaUBLbM2
	hRTHFxeY4yTVLK0imV6an8V4r7ZwIhNmgCk5f2Sv2Kwn0Ou5FfISpeOdMYbNYQPs2IMX7jDkcY23m
	7zOoV/XQ+KEDbJ3qowRzP8owJpOC4MEfjjqfkO7DAJqNjeC95c6ZFVjX6w+NYABN6GMhjkb9VE6f2
	MAt7oZ2YNf+nCbE+DVVCJjCdoSLeRxSiErAhnhWL36bIqq+OjMPJZ6JfA9Jpr+Ub8xOvLn2Yqt63F
	0AS+flBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAREb-0000000HCiq-0q1M;
	Mon, 11 Nov 2024 10:01:25 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAR0d-0000000HALn-2TU0;
	Mon, 11 Nov 2024 09:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731318419; x=1762854419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tWMIM6L6n/2GE8nZCCMK37Kf4CStm+u//iiEsM6/VpU=;
  b=ATd+d/KWsBjLihPo0haEdQLaYnFmKzEGWsNMJtA3orN8c3C5X6iLRs0C
   xW1YAQsM9c+Km/SJ/3/c0z3sbguRDxSbPUBWcXjlD7Tq/o6PLGqxzHeqO
   0Zn0jUIlV7tJMF5tGhQDQenmTGHmK593x0Dyam6qeeLw5JoJuTw5D5Egv
   O0+ZKKTXxbOe/hix6tvy0BjBlaLF8VMnyhevCoJWd0yxSlilf2Px08oM7
   eFuQmqGK0uBxHWD3XqdAFhuSHuwmnq+wB1ucuIYm1fIT6umvNPlm1yIi/
   wbwmI4NAOnGvM7zrumqY+KB3D5vpRZJjfjzukFu0zq5mSBgL4uTMuU8Cn
   Q==;
X-CSE-ConnectionGUID: k894HhpPTleb4Ey/0maXEA==
X-CSE-MsgGUID: SL9e1FIKRJuAh4vGT/+OhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="33980008"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="33980008"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:46:57 -0800
X-CSE-ConnectionGUID: MNzfa4EfQpaCk0tgmnhcXQ==
X-CSE-MsgGUID: nywjpN4iQPyfmRFzaRoFCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="86997425"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:46:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAR0U-0000000DXzD-0Yvg;
	Mon, 11 Nov 2024 11:46:50 +0200
Date: Mon, 11 Nov 2024 11:46:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v4 1/4] gpio: rockchip: explan the format of the GPIO
 version ID
Message-ID: <ZzHSiYyK9VjyzBBm@smile.fi.intel.com>
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
 <20241111023412.3466161-2-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111023412.3466161-2-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_014659_845127_C554E7A9 
X-CRM114-Status: UNSURE (   7.06  )
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

On Mon, Nov 11, 2024 at 10:34:09AM +0800, Ye Zhang wrote:
> Remove redundant comments and provide a detailed explanation of the
> GPIO version ID.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




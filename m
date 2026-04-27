Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C8FFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 09:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anaxGZ0X1VjiQEcMCKSdPt+wpxGQuGZA4nXVyCQsh7U=; b=mcR1i4TA6GuaQvzE6Lt/S/Sgdk
	DOY7XqQikwGxZx/+nHsUeDQc6rkbuePhG5ogbFxZkvOizkU8HJ1qeM63etvFPSheW9kZ4Cxx64WCn
	CO3Dvs+ZnsNbCamEpRgbPy7dvUjd07weEHZbTSL12vnWu2iKgMz7sBkX8M1lsebRumb+niTzRfzGz
	+q1bbgGJJkxOF8aUIDh3svjKuFhovJOz/MSI9InqSGBtXFCp53tEdWe1UPoLQjoWxkl3rNo8m61iU
	ycvspbWouXWpiy9y5bssxIw4F6GIdHXyYba3QcJLCVPQlQiVK62+9By4pBgIUxMYfwLSowOI2eDgH
	w+/zk3Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIk9-0000000Gdai-3P0Q;
	Mon, 27 Apr 2026 09:59:09 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIk6-0000000GdYL-3XLI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 09:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777283947; x=1808819947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mn4cjarikRtny3FJMZFSoB4LrzsPQzAV548uIkJF+HM=;
  b=aujlQ+7eFIfNXbXEhkDgZouPkpyfWYKemJbh9qHcnX44/jWC64MQENFI
   +v2XXb3wKu81LBYTLaGYAol+L+R7R1wZsO5o9EI5VRsAjl4hJxXcaWB5X
   z58s8jrSnbSjNwXUAsdF1Gaf1h7F/uyu/3CtvaQwBVW7D0B2Zj31BaN2V
   bXLhJA9sOLl3UVCvQqCRFZe3zoK68qC60jLAw7DFhRv6tMrUd7jMVz9/a
   4Zwgp5UWx/X3DqelogNpmOGHCeFnURTLJ/04VM7yYKnOdHzQN4wMWgu+l
   QY3WKBtPbGIAUNrL3F9d4Scdu/KP8JptLz0Pr1p2rk+itG4uifoE568is
   w==;
X-CSE-ConnectionGUID: 01MVtDRcQKCD8w9jDWeEEg==
X-CSE-MsgGUID: Uyeop4qqSJG/ZYv/IqonaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="88481108"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="88481108"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 02:59:06 -0700
X-CSE-ConnectionGUID: T/jc5r4fTByTlTQst1Rl6g==
X-CSE-MsgGUID: FMW/KOI1S1KR8QDuxVCqXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="229268558"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 02:59:03 -0700
Date: Mon, 27 Apr 2026 12:59:01 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Caio Morais <caiomorais@usp.br>
Cc: andy@kernel.org, dlechner@baylibre.com, jic23@kernel.org,
	michal.simek@amd.com, nuno.sa@analog.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH 2/3] iio: buffer: industrialio-triggered-buffer: fix
 includes with IWYU
Message-ID: <ae8zZU5WR8umynef@ashevche-desk.local>
References: <20260426211834.3318306-1-caiomorais@usp.br>
 <20260426211834.3318306-3-caiomorais@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426211834.3318306-3-caiomorais@usp.br>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_025906_944896_356D30AD 
X-CRM114-Status: UNSURE (   7.70  )
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

On Sun, Apr 26, 2026 at 06:18:01PM -0300, Caio Morais wrote:

...

> -#include <linux/kernel.h>
> -#include <linux/export.h>
> +#include <linux/errno.h>

> +#include <linux/linkage.h>

Hmm... This one rarely appears in the drivers. What do we get from it here?

>  #include <linux/module.h>
> +#include <linux/stddef.h>

This one for NULL, for example, which is fine.

-- 
With Best Regards,
Andy Shevchenko




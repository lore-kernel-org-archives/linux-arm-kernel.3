Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0796CC9831E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 14:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7grLbuns1CLD6JJcKGenIeiL6DRG8tXUwN8CD/AazI=; b=k7QSkIwTRrIPUtPKn5Phetuvhg
	EAsuZCCyDcMuBziU4Eg3FbXTFqZ9LqCUmimbdV60VSDBKyNWqfW81Nur+W+MZimg9+FRx4OXA4M3U
	P4wPXpwNmxVz1WY9dScf5gHJXnzor+5cHFuvvk+kn4DxVvhxNMB12RJ36A5WJwIwSuMTYarsC/B1G
	nxeve1vWtTdTRg/yIcEw2HjR8g3cI5llhAWzJLrnCa/In86SAAMPXwnszFiSUVveLR45IKNMfdZge
	U1ePB06x/YOEFSX8lBtfFkcYD9Ndf6SmdUcg2ud6RMti8YdOoABCF1B+pb3Nru5PDujlngVzEwAHR
	3KZPGnog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9k91-0000000BDSI-0TN7;
	Thu, 24 Sep 2026 14:09:51 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9k8z-0000000BDRg-185J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 14:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790258989; x=1821794989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qmudZkLU3y2eB9AF20M5NWcb805vn2pIDkdPZYgefvU=;
  b=XI/qYiJEYlU33z83BtgM3bj0m75a1wnfcndfXxAiBaoYJV47gy9wKJjc
   2fwpjgzRBSWubmAM6B3S5MffUQcn5Lxc7qTNx7ULHEpiywcveOZ4L9B13
   Nt58f9kONz1cRw45IafM5gmFg/WGph54LSokjbyZ4BvsqFwcoOi5DK4zn
   aeTguGPCk6VXCTdiXXrIFiQBL0Ah+CrbYYPXXc+uaikfNLQa1t4a3dWL0
   bDVFlNPPBnA0bh2/p+fTPX4d99ZGVaJsR7gVPT5dgLHMY035cG/HmjD1q
   OavFmwPxHjSYMVN/Nea1J3IUNZi/aFz8OcLlhDfx+IoIloEzpyeJ59rEr
   Q==;
X-CSE-ConnectionGUID: kOLAXJKgQXuegrhqrM6HOQ==
X-CSE-MsgGUID: 7UKjLN0mS0y7/gZmrx0XDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91136568"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="91136568"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 07:09:48 -0700
X-CSE-ConnectionGUID: Eueu/XtoTVq6U3pNjO4tjQ==
X-CSE-MsgGUID: mhCt5k8VQoujcrhULBFUFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="311951219"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.199])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 07:09:46 -0700
Date: Thu, 24 Sep 2026 17:09:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Malathi A <malathi.a2000@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] serial: 8250_uniphier: Use devm_clk_get_enabled()
Message-ID: <arUvJyvChXXcasSu@ashevche-desk.local>
References: <20260917040511.103232-1-malathi.a2000@gmail.com>
 <97e4ab26-b147-4cf4-97f9-307903f14e61@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97e4ab26-b147-4cf4-97f9-307903f14e61@socionext.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_070949_321792_678CDDB1 
X-CRM114-Status: GOOD (  18.98  )
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

On Thu, Sep 24, 2026 at 06:07:37PM +0900, Kunihiko Hayashi wrote:
> On 2026/09/17 13:05, Malathi A wrote:
> > uniphier_uart_probe() enables priv->clk by hand and is then responsible
> > for disabling it again on every error path. It misses one: when
> > uart_read_port_properties() fails the function returns directly, leaving
> > the clock prepared and enabled. The neighbouring path, taken when
> > serial8250_register_8250_port() fails, does call clk_disable_unprepare(),
> > which shows the leak is an oversight rather than intent.
> > 
> > Rather than adding another manual unwind, switch to
> > devm_clk_get_enabled() so the clock is released by devres. That removes
> > the error path entirely, along with the explicit disables in the
> > register failure path and in uniphier_uart_remove().
> > 
> > The clock is still disabled and re-enabled by hand across system sleep,
> > which stays balanced: only SET_SYSTEM_SLEEP_PM_OPS is used, so the
> > device cannot be unbound while suspended and devres always sees an
> > enabled clock at detach.

...

> I'm a bit concerned about the error path in uniphier_uart_resume().
> The clock may have been disabled in uniphier_uart_suspend(), and
> clk_prepare_enable() can fail when trying to enable it again.
> 
> In that case, wouldn't devres try to disable an already disabled
> clock on detach?

Isn't there is a guarantee that the .remove() is called with PM runtime on and
get, meaning it's called with the enabled clock? But if not the case, we might
use PM runtime force operations (resume and suspend in the respective cases.

-- 
With Best Regards,
Andy Shevchenko




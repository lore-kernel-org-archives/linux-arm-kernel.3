Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3451C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 11:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QidgRzXNwa2MtDG6Xj8clhuntQWwg8PG8FKxih6T2BA=; b=fXOMgmjhrtD/0BfNoJiony1Xkt
	npVQTNk2OyxwaBffHApnppQCun1J+aVuAcWBv8GtA+Y2lY4MbqH+ZmOXc0xta4O3QtXhXGyruRejP
	vdjW0bw/yWZz5cCnnpdn7gUdqfYpj1kYt1ZyMLZ9hWI9dVV3BHPPkQQliS8wYtQTloIU50bhHD5Je
	X4XVcnnBunvTKwU4XjRDK1mg5iAGGI7rKe8eJaXP/IA6H4REvIAZDVYqjsR/ack00dFnR13tFwIYW
	wc4jfjjK8gzgzaCDj68F0NMnv9BsDRBrZp9hR12VJu6gHpYODzVvAJpZ8PG7QALHViL0EX0AccfXo
	G4GgCpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nUB-000000092Fy-3uzs;
	Wed, 16 Sep 2026 11:07:31 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nU8-000000092FR-3dGV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 11:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789556849; x=1821092849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6MyMFTYyqXiVc+zeIiupA0xmhMyyGJOE11wnLVfHtjw=;
  b=lcR1IViDCGBN0wBp1pNZsSzrJ+2Kyd657YCXTzTQfGvmAS2RrtOKrVWc
   t/oHdUv0qij8W7FUGyX+OZAiW8e/nl5ikPzaoLc4Rqd8tm1X5YFX0T9N0
   lc3W1X8FB71GI8aDUktGfILQFsLKNz0b9+TsKzb4Bdh5YT0+sKC5DfL0P
   MA3v5mE6jrgbAzgInRLc2KQyAG/+tbe2Ogi8ckCr78rHSPANy8xYPLkx0
   2+mlsEsy07/2u1BnJCxGE188CD6aVOElAbOjbdeb276PGUZjK2WsHmddg
   BomP9Rc4hsLILAmHEO8vRJNq2mDFyo79O/sMjrHKqH+1HV+LlAsI54mUu
   Q==;
X-CSE-ConnectionGUID: FJIlEj/MQXOo+qurZMGi4g==
X-CSE-MsgGUID: C1aIdfrrQluyHFVdb9MwLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92437160"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92437160"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:07:28 -0700
X-CSE-ConnectionGUID: yma97Ag8RTmey/OQha+7TQ==
X-CSE-MsgGUID: dZZW5ZDQRvaQEgVXOGIE3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1709838"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:07:26 -0700
Date: Wed, 16 Sep 2026 14:07:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Malathi A <malathi.a2000@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] serial: 8250_uniphier: Disable clock on probe error path
Message-ID: <aqp4a5YmwC1Lt1TL@ashevche-desk.local>
References: <20260916095438.20837-1-malathi.a2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916095438.20837-1-malathi.a2000@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_040728_965333_9919557C 
X-CRM114-Status: GOOD (  11.40  )
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

On Wed, Sep 16, 2026 at 09:54:36AM +0000, Malathi A wrote:
> uniphier_uart_probe() calls clk_prepare_enable() on priv->clk before it
> reads the port properties, but returns directly when
> uart_read_port_properties() fails, leaving the clock prepared and
> enabled.
> 
> The intent is clear from the surrounding code: the next error path, when
> serial8250_register_8250_port() fails, calls clk_disable_unprepare(), as
> does uniphier_uart_remove(). Add the missing call so the early failure
> behaves the same way.
> 
> Found by smatch:
> 
>   drivers/tty/serial/8250/8250_uniphier.c:232 uniphier_uart_probe() warn: 'priv->clk' from clk_prepare_enable() not released on lines: 205.

Why not using devm_clk_get_enabled() instead?

-- 
With Best Regards,
Andy Shevchenko




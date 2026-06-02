Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDEACD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 09:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1hZCHsBDF0UzZLjGJuaWE3X7G9u3Khp34m3pFgNfn4=; b=MxnKfFDaPMXZJtanZCFXqKqUsS
	jNVOZ9gMYwCZpf7GMOyQMr7neTA9er6gqTyf2zPm98GvDCl++Y+w6GbVpZjM7CuxD1vnjnGxwcvVJ
	OwgQGLvkNy9biiBPdDIQBWs0M5+JR43hi7hHln63FCZ+dR0H31/B3C/S26ZIrxKwzWfhoE3fCZ/a+
	2dRGI1F+gxdKNHjyDzGL13QK/5KIsjpC4zTC1qyfjRl7/yhrCLBHkla/0HDO++J2k6L+mwLsGgj8U
	0XquE6gAVrWKbOc59zcOaVegjTvZEdkLkEgbKcfGV40Cx7gR+ctKzkOYKFe/sDVVxR7V28yF1Qab4
	K4Xyj9mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULbk-0000000CgjW-1JUa;
	Tue, 02 Jun 2026 09:40:24 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULbh-0000000Cgif-3FIL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 09:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780393221; x=1811929221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jqR4dzKGvV3HqFH6eaz3fG39vDCQjIDVnOKaJWrWjRM=;
  b=M+UCPAr/oPKwlKL6fcG6ZLCbOBD7nChfObtLnTdlG8QgXvhMRIvn877Z
   CauyKgeZxo/6Rjxvdu8m0hJBe/24lK+enD/EMyGgbB29JmUoY9yJE4aFK
   iD4aX8dKmE+IbPCsTi9Y+bRdVXJ13qccnz5VcaeLoYE97N2MmuDPAevpY
   oCNWUqt08m/vqBlwpD1vtRHDbpqQjvVrnkYaiVmPveq8NJsgEoCtrLPh7
   SidLDvvOYkAqqCgJZdpliCU6FISHhpocGser1N7IhK2vbF1h9eCK20++Y
   bJBIyUu0Nnxys37EChod2QvWeMF5NnuajxFr1X/LFi4wvC4Chrapipdx/
   g==;
X-CSE-ConnectionGUID: M0vFqjLBRMibAcGMz5aRDg==
X-CSE-MsgGUID: jroBkqTdSc6QrAqEkd8uug==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80203799"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="80203799"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:40:21 -0700
X-CSE-ConnectionGUID: h4duNntZTUmobA4ypFYP9w==
X-CSE-MsgGUID: p/6IPsYQQO+Vr1wS+/oE7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="240853439"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:40:17 -0700
Date: Tue, 2 Jun 2026 12:40:15 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Angelo Dureghello <adureghello@baylibre.com>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v4 04/11] m68k: defconfig: update stmark2 defconfig
Message-ID: <ah6k_wfIpwuussC2@ashevche-desk.local>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
 <20260531-wip-stmark2-dac-v4-4-7e65ab4215dd@baylibre.com>
 <20260531165155.13e586cd@jic23-huawei>
 <ah6hVLn_OES-ql9j@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah6hVLn_OES-ql9j@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_024021_825827_4257B770 
X-CRM114-Status: GOOD (  10.13  )
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

On Tue, Jun 02, 2026 at 12:24:36PM +0300, Andy Shevchenko wrote:
> On Sun, May 31, 2026 at 04:51:55PM +0100, Jonathan Cameron wrote:

...

> TL;DR: This change has to be fixed accordingly.

After reviewing the whole series, the fix is trivial, just move this to be the
last patch in the series.

-- 
With Best Regards,
Andy Shevchenko




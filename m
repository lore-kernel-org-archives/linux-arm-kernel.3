Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52DBCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 09:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=693ENqzUI3AYkli9Xt8bgPtXfYujCk3NMgsUh+ypvfw=; b=OD9mTNVuSiIkqZVEhNsMjahuEU
	+Ex3Yq3EjTiEhFDCeNe8vIaUOkun7tFYahEXxVQhOfEMy6voeFJh8o2pJctcIUIcVPssxPDHGyoh9
	iE5qtZoRHbKkOH24WR/0oZ28lCOC1Ak76CjvyshTEQcWwcwMlJj4svBdHuN5qiP/MABytWkd/O/QV
	kLwjxPZ1olzEsfngl1QU2aSQ0i7TwblrbePTIggusBHj6E3BTs7uLWdA+O3uQWxg6eEJ+OxBK05JQ
	Iog8vP1DkQT7H5goUqkSedlJp5XrCXKrY7fk3KJuBVDdPNlDgiGbZ8GmUeGRSq6UN5i3xqvX6kllj
	/YvbJ6mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM0P4-0000000ATv3-1J6e;
	Sun, 10 May 2026 09:24:50 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM0P0-0000000ATuQ-48Md
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 09:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778405087; x=1809941087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vV6fYEZMln0QIDLiRgIzI/8aacjHAcjlWG7g9QHZEOU=;
  b=lIRtFqxP+rjv6eJRljWPAKGnPm55nQpSwyLuwaiMSqCcdjYszTbzBtWI
   nwli8fSOuOve1fxLNeP5TjemEOAkjuFJFui+IbO5uvlTOqvgKrjBpsQzI
   LR4de9UYNNEpITtTbCX3tfuP6sqmrgQQR+hwBSJXUcuJuAaFMgty/Hx+E
   pR3la3ChhhYDUx+z6QqJJVqjOa/7xuzeoaZym3gNZ9WfQh5pT3BdsVCTj
   lxVtIukudvcZr01v6d2kPtlfGCzufnDAbJHmBWqXJkMX1WaIsqgD92/iE
   55pNBeVqcYV9dxRSUKWa0wySi+0ZpAWgYaw4r0vVcStVPTCkuwQRClfvn
   w==;
X-CSE-ConnectionGUID: CwcsNrfnSRCxcOysWPQiCw==
X-CSE-MsgGUID: mXuXDSyKRoG3mdXZCu/oUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79043457"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="79043457"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 02:24:46 -0700
X-CSE-ConnectionGUID: rTPAmrhlShKSNXX0RNpF0Q==
X-CSE-MsgGUID: iNXa5OY2RcmIq8/TS6qeOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="236339492"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.171])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 02:24:43 -0700
Date: Sun, 10 May 2026 12:24:40 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: salih.erim@amd.com, conall.ogriofa@amd.com, jic23@kernel.org,
	michal.simek@amd.com, David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	"open list:XILINX AMS DRIVER" <linux-iio@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] iio: adc: xilinx-ams: Replace spin_lock() and
 unlock() calls with guard(spinlock*)()
Message-ID: <agBO2G58CXypMEIN@ashevche-desk.local>
References: <20260508124513.17752-1-m32285159@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508124513.17752-1-m32285159@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_022447_120916_E1DEA001 
X-CRM114-Status: UNSURE (   8.04  )
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

On Fri, May 08, 2026 at 07:45:13AM -0500, Maxwell Doose wrote:
> Include linux/cleanup.h to take advantage of RAII macros.
> 
> Replace spin_lock() and unlock() calls with their RAII macro
> counterparts, which modernizes the code and increases readability.

> Remove "flags" variables where spin_lock_irqsave() has been replaced
> with guard(spinlock_irqsave)().

Unneeded detail, everyone can see that in the guard()() implementation
for the spin locks. Otherwise, LGTM.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko




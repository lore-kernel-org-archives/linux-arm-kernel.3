Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58B0CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 07:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwNaBu43rxQllHv6+z7TRNAqYwKgzIvoObxnJ1m0b5M=; b=rRBqF/GHazqP3CMHH+dMvDyLDW
	lWu9vBJWUBNy6IZVrH+X6cOPpPw9OoKsLg4JKarDZPYmgb3mcBXzHf14NkGQE6u020e3nP1m6hXOR
	FBBj5ingmN3Z4vZxrFPP5t3xboie6I+VJlnxb/WtC08A+hNFgrxr45OBjyqa60amTZDkXrANDQ7XM
	w+yAhVsFRvQtdEZCDQaBy23JMFNDpFSAVl/hVR/63h/aeYEZnDKVQXIUlSabvWEuj3vZEMPzj6SmT
	zXYihniji4JJADrAfzXixECR1upprwzGH1rupjRttT8sEYr7rhooQG0LZYd71mbVUtb4plBCRnpf1
	zWeZ0aEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNn7w-00000007dZU-48kk;
	Fri, 15 May 2026 07:38:32 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNn7u-00000007dYx-2Vm9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 07:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778830711; x=1810366711;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=lP9tVmtwzbLQRudPjuo1zfBP9p5/3imREIYkZ6AvAmw=;
  b=nxgN6fwS59tpDahkjD2IVGrVrqQq1D7CG34SkcB1KGu/1JdtjyF0NQwK
   MJyijXm2mzGIS+mR+nXWqP4h0Rgsq9Wx5B253RofM6fiZLWlOSOlq2Xmb
   SVcnZ95i2z9yqofqDYMrIGwc+gYVT8gexAfAYuZ73zgTM2o926H84S1S3
   cyB59LpAnmtDCfKu/xmc42gXG2tN3T44YJuTHFv91w+7DHkzNBRlFcdfR
   QcUNkKgO/sNxKX4/Zw2/Lp3ZfhJ/NAGEWnlWdIA7nL565PhE2vzgnUXxp
   iEz8j6zdyIdI2WLNUZiphMwHss1bneCd9jJ3UwSBlxT0zD0Rd8s6FQZXc
   g==;
X-CSE-ConnectionGUID: 8pXgttXVQ5mafbBAbPkfzg==
X-CSE-MsgGUID: 1LNyiDbLQc6YDQn/eXmUmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79956078"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79956078"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 00:38:30 -0700
X-CSE-ConnectionGUID: KzgjRThqSPG4EwBrKnmLxw==
X-CSE-MsgGUID: EIw5Ob1JRaKbZTPEx77eBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="242618938"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.33])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 00:38:26 -0700
Date: Fri, 15 May 2026 10:38:23 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 09/11] m68k: stmark2: use ioport.h macros for resources
Message-ID: <agbNbzD__8IDk5UA@ashevche-desk.local>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-9-fcdae50cf51a@baylibre.com>
 <agTcoVbImqMgfQy5@ashevche-desk.local>
 <cabngw2wuxh7cfx4cw4ik46dmxs72u47jyo6hcwgdd7a5whny2@dsp4cysetarw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cabngw2wuxh7cfx4cw4ik46dmxs72u47jyo6hcwgdd7a5whny2@dsp4cysetarw>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_003830_680881_D443B9E9 
X-CRM114-Status: GOOD (  15.69  )
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

On Thu, May 14, 2026 at 09:20:38AM +0200, Angelo Dureghello wrote:
> On 13.05.2026 23:18, Andy Shevchenko wrote:
> > On Wed, May 13, 2026 at 11:14:33AM +0200, Angelo Dureghello wrote:

...

> > This conversion drops hard indices, would it be a problem (for example,
> > some code modifies the fields based on the [hard coded] index...)?
> > 
> > If not, perhaps good to mention in the commit message and move IRQ to be the
> > second one?
> 
> i can't see any directly-related code accessing these resources by index,
> so would not change this if there isn't any risk. 
> Also i see DEFINE_RES_() stuff widely used in other arch, so thios make me
> think accessing by index is something wrong.

OK, thanks for confirming.

-- 
With Best Regards,
Andy Shevchenko




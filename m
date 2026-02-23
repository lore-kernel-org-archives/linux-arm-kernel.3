Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2276EEA4FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 15:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZxEV+ZbZhZTHCt/fOJBY9i58F0oT27mMMExCGnlCxA=; b=JNraCwFYcyJvTUxKbfgJEs+Fmq
	mc+DXUyVUi58SLXSaoCpl/QO1gFA2Byt+3PyqC7FTdcqi3coQBvdmWLi0auRhRYeajB1243owkQVI
	YQLbLaFguG66mRSYCUEbBfdXD+5S/4+9pAq9hL2UickxZwKzQEm4cO5Mo6+7pyJt+cOdfOiLQ/3Dj
	8S4M5bfuhjn2MNWfVyUdx+sXz2kYkLWHDCBDdlPJne18Q9J/Cu67OOOhp06dlwXQ4hk+pJWMnkkUq
	GRuWlORctlE5TZJaheMrq2TTIcCrsbm+PsEadXSMRbswL/Pebcuj32AHje9NAc0+x9yTDPeTDaxrj
	imrpP06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXnD-00000000ZAc-3dde;
	Mon, 23 Feb 2026 15:24:15 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXn8-00000000ZA9-3eeo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 15:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771860251; x=1803396251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LnPa/K8m1HXh91gH9byYDvVGpUurxv2UNobnzrueubY=;
  b=c3+HqkakkUKJP8HiKoB8qVbdELSPBksJs8qpIqXGuPnM8pv7/x6W4XQG
   QfhKX4D0MTpGKy3yBYU5/YaantVu6LAIXZybRop8qpcE1xPu93vbhuCjJ
   G4S6lclOSVj8qRgS9GA/HaC6RpLABWNPnDrtyGHnuMnixdsp56zVJdBmK
   Qd6lXgJQyBvDshaata4qKJCU3K3X23eGNfaIBO4XNTYgF48O1Dy03YlHI
   Mu9XWOPYsVcux1hU7QCT2nSTrI+7CFwJhzFTBsm34wibc8qxZX0xtg7+Z
   nwHyEXrFn7gPpb1OSJL78VDkZwNqhHgc22YqK3/9LzR9bNLfzUNgwVQQN
   w==;
X-CSE-ConnectionGUID: cMrzJS62SHmh6YFVaN3wpg==
X-CSE-MsgGUID: vgl70/TfRlyG6qMImggs9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76687248"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="76687248"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 07:24:05 -0800
X-CSE-ConnectionGUID: mKp4bAVBTcSEf1n0pCSpog==
X-CSE-MsgGUID: x/KL/Q2CS++YospSC0JNRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="253315857"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 07:24:01 -0800
Date: Mon, 23 Feb 2026 17:23:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 1/1] spi: pxa2xx: use min() instead of min_t()
Message-ID: <aZxxDhoyuhNK0r7h@smile.fi.intel.com>
References: <20260223144437.2836369-1-andriy.shevchenko@linux.intel.com>
 <20260223151829.6192b32d@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223151829.6192b32d@pumpkin>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_072410_980511_1E78247B 
X-CRM114-Status: GOOD (  15.19  )
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

On Mon, Feb 23, 2026 at 03:18:29PM +0000, David Laight wrote:
> On Mon, 23 Feb 2026 15:44:37 +0100
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > min_t(int, a, b) casts an 'unsigned long' to 'int'. This might lead
> > to the cases when big number is wrongly chosen. On the other hand,
> > the SPI transfer speed rate is unsigned and driver uses signed type
> > for an unknown reason. Change the type of the SPI transfer speed
> > to be unsigned and convert to use min() instead of min_t().
> 
> I think you should use 'unsigned int' or 'u32' not 'unsigned long'.
> There is no reason for these fields to have different sizes on 32 and 64bit.
> 
> Were spi to support 4GHz clocks (fat chance on a pcb track) you'd
> need to use u64.

Fair enough. I will correct in v2.
Thanks for review.

-- 
With Best Regards,
Andy Shevchenko




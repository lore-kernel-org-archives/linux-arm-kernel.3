Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65222CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cn7YN2BxymzZpH3QCsHF+6vqJ5ILky0+a2IfDQeovHI=; b=GZ/aTtjvnggOfa4gx1D/KpdtYm
	6XXzYjH/I5au5osovvPc6fN/YWueTBJKg9AYE8oET2ykbpb2tqVOljwMquiDWTP2UpoqtdV6BkjRA
	IU8NrxS9AXAA5NYaphIK9L8xkmw8XdHMu3/UK7AeI6fA8W4Ncvugk4MbxT42WzijgTaMvTnLuoDVK
	0JU1a6EChGz9aDYwZUtFV+yPmCRJ3X1MU/pe8EK5yCYvitNyZF/WIB7iHI/Lx2E8dxdGVd0wcqPfW
	G9CmRjNgX/66lo2wVP8vcoCY8ogpsLBGVxAHX3lW8bYi9Su5TrdBQ2v96FQMl9N+5qC2CAr9gC3cu
	wVJupucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwVW-00000005ewA-06n8;
	Tue, 09 Jun 2026 13:28:42 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwVT-00000005eew-3I8d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781011720; x=1812547720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zqvAnbCL8mHEhufVkeba6vDf+vgzM3h/Zh1dw0Gckhw=;
  b=bZWeuT1Sw7mImoxBrdL9qEi7DTOm7IzzsRDot1cNHhTiyHWucUoBGof+
   ZkBVlg8v8sk8/F9xlr6vT0CB+V0m4wVjb1P33ZElwPUD9cGbF1Fi3ytS5
   1A1N4o1pRkFaXOtG9cc15sh61RK/2qg3RQz6PbUgjWboGvoAxImiXo3Wa
   AtS/0dl/YRctH9cxChtWEARaj/NchjUOLYQOFnEokeaLHM6MGQtHCW4pC
   9G8gtRDPt3AG5LegPraNax3rHYUkM2psQmszv6Nmp6GUdNn9fmyo6CkSu
   9blYgV5unaqUye9kMHoXJSLBDoWYDX1BX4+YgddFKo+Pg+f/fxwLhpGXK
   g==;
X-CSE-ConnectionGUID: 2+Bap3x+Suey01Ai4+9ffg==
X-CSE-MsgGUID: cX4yzC5/S6+CZ3KDRh6glQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92335387"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="92335387"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 06:26:38 -0700
X-CSE-ConnectionGUID: 4HI4uIQOSRy3G8bSKTwXPA==
X-CSE-MsgGUID: rDO+gE63QLOZksbWhoVOmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="241414061"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.39])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 06:26:35 -0700
Date: Tue, 9 Jun 2026 16:26:32 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] iio: adc: add Axiado SARADC driver
Message-ID: <aigUiF_iX2WhQvOO@ashevche-desk.local>
References: <20260528-axiado-ax3000-ax3005-saradc-v1-0-345dd5f6608a@axiado.com>
 <20260528-axiado-ax3000-ax3005-saradc-v1-2-345dd5f6608a@axiado.com>
 <aiMU2bOFgKT9NrNQ@ashevche-desk.local>
 <1e2f4756-e944-473a-b4d7-a5692f2b609f@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e2f4756-e944-473a-b4d7-a5692f2b609f@axiado.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_062839_901911_08E74E9A 
X-CRM114-Status: GOOD (  16.00  )
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

On Tue, Jun 09, 2026 at 11:09:32AM +0200, Petar Stepanovic wrote:
> On 6/5/2026 8:26 PM, Andy Shevchenko wrote:

...

> >> +     info->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> > Why no name? It will make harder for the next generations of HW in case they
> > want more than one clock to be used.
> 
> This IP block currently has only one clock input, so I used the unnamed clock.
> Since there is no ambiguity for the current hardware, I would prefer to keep
> the binding simple unless a named clock is required.

Again, it doesn't matter. What matters is the potential future. Hence it's
recommended to use named clocks even for a single case as we don't know if
the next generation will use more clocks or not. In any case, it will be
your decision and up to the maintainers.

Note, I have not checked statistics of how many of those which started with
a NULL clock become more complicated in the future, but for sure there are
more than a single case in the kernel.

-- 
With Best Regards,
Andy Shevchenko




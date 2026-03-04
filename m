Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CC6EDEC12
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 07:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZMb7neNcWNZAiDz7ZC8+WVRR5inEjuqHVXwRsDjeuo=; b=vTPp2RxXDFcCukFOihjtRStJYi
	VchqXL1nMm6ZKVvxtX01Ej8tW2gMll0EKChLTF/HlG4zzUSj+bGl/b4sevzEw7GD8dZxe/Dc9QWhX
	2euPazY936DJx+xNcvAaCscuL5pqxbbjAkSl3mLW7jijc4XRDnF3er6ixk8kl2hSLPJKK0EIeRI27
	Tq5lggQiVSvTIuw/QJJGGCrTBF1K0JopyRuBVw4GZXLP2m18rRCClY8mHLjmB/0whDl6yywtNouJw
	WBAFoDeYFN+3DfKMBoejUu0rGJQdIHh7LIPy/o6tgzY51jEWgE9URbCip2ps/evsGZ9dR/g61KmNJ
	llmP/GNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgU9-0000000GZtu-2OsV;
	Wed, 04 Mar 2026 07:17:33 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgU5-0000000GZsN-3wBf;
	Wed, 04 Mar 2026 07:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772608650; x=1804144650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+8H30zAQTE0LO2mXt3s7jP7xEix21MB7BqkmoPEdEF8=;
  b=eDuhxYGY0SdSWHXYRTk9AysUKHCm6bDW4NnlHKeeOyeHeGYXCZwDbq3p
   87E8hDb7KMrJ8Qff8rtN1TZIyEa4yG6jjf2EAqVdrBIdhBVphXRWErr+5
   9CR7FojOnz13aXNZUQ5Mu5wHnFxLhlrDuXbR8F/n/y81B8RayPqQF6b9K
   efUb8256GEsyAF8I8cuu1a0S2dqFfxQ8SYGRIpYkVstIMIpRwyDG0IVrv
   yOXI4feoRoVm8mVfyAB6T1X4YxCOCFLStrWorRIXRiG05tI4L9fHN+meD
   6QqkKblpaB1Py0FhzhBDyxG+nvJ0JQQysqUFvAWlkzbsXWiq1BGkassef
   g==;
X-CSE-ConnectionGUID: fsYQ0aEzTJi8mMZ7joUNbA==
X-CSE-MsgGUID: iNlLZmhpTnm/Ev9MnIjH7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="72688052"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="72688052"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 23:17:23 -0800
X-CSE-ConnectionGUID: ozu3MjkKT4SIImdJ2/N2nA==
X-CSE-MsgGUID: Gi4wT+6hQqCGbwZSTS0UHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="214450663"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.127])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 23:17:19 -0800
Date: Wed, 4 Mar 2026 09:17:17 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xichao Zhao <zhao.xichao@vivo.com>,
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] iio: adc: meson: no devm for nvmem_cell_get
Message-ID: <aafcfd20DK5dIhi4@ashevche-desk.local>
References: <20260304041716.7631-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304041716.7631-1-rosenp@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_231729_985986_22E266F4 
X-CRM114-Status: UNSURE (   7.66  )
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

On Tue, Mar 03, 2026 at 08:17:16PM -0800, Rosen Penev wrote:
> There is no reason to extend the lifetime of this post removal of the
> driver when it's only needed in one spot.
> 
> Moved tsc_regmap assignment to avoid two nvmem_cell_put calls.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko




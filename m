Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2225FF8862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 07:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4xZ8O3GrJVl1ARjTJSu6oXGhIFUVfK552g4turRTd8=; b=LFi7UJ+GeAt968rim1P5FppkO1
	xuSvB+uWZ+PrtwwPxV7vJxq838tX07ILxN487bdgPTAzfRl5xyshjUBEVNtRghlFcWzEVjnl9Q1FY
	oyuGw3syle+eEkUFNpUN19bQM84HOD9vTo9H4847YUqarK6jdqP2nQQQXPrmOospvOzTZNvapaVqc
	25x89xR3gmEQffyh9o7Rtp+pvqRGVsDf6vn1ny5oJe1x58snAEfSeQLfdvATHzlTIHVadMyikcA2o
	XiwIubJXI8/2vynW66bwWVi5wzNaK9Eilm6doGdU2DFP3JHy+gVtGHU0K9Z/htDDhsRND/T6O3wXF
	YTIdvivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGeT-0000000GP0y-1uDF;
	Mon, 27 Apr 2026 07:45:09 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGeQ-0000000GP0b-1YP2;
	Mon, 27 Apr 2026 07:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777275906; x=1808811906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0twFypO0Cust5Vlkw+9ZGd+TnyzE7zX+xD9com9o9bQ=;
  b=WzRO6bxpUdeKDPOQ+NRR5llwOHk6Pdx9d7QF9AcllcBgCsjDQ4UgsSqv
   K8ScqDvrkam/qObY2y1rCiQuXRYtQezs5dJm9NwM5nWarMK2vXVhjqevt
   R6Ro6lLdzbsDCNXUOYJKtO9A3E4Pb5XFjDb+D339NniFPWjvRlPtmOzrr
   rGFy7ScBJtMRevDCmVom7hG5Vsw9UTHvup+QtPMlruq3JbZmhGKWaNxSF
   01s3CSdCthXw0RBC0sY/tOLGign6CILl7mwVtlOPgXPE8BLXK/gSLiMKa
   OWX1ZAofrkFMVByIfFokW555ibYaqZoSZWpwcQSdv4L9ph9rJify+DRTJ
   g==;
X-CSE-ConnectionGUID: /C3YxpBpRtOGWktNPzfvPQ==
X-CSE-MsgGUID: xAnOCGlfRl2r9JfiBjsDVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78174369"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="78174369"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 00:45:04 -0700
X-CSE-ConnectionGUID: VANwaX7DSdCaml7GSXTQyA==
X-CSE-MsgGUID: IwC3Bq6TQAyFcJTf4E8pjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="256868919"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 00:45:01 -0700
Date: Mon, 27 Apr 2026 10:44:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rosen Penev <rosenp@gmail.com>, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: meson-saradc: fix calibration buffer leak on
 error
Message-ID: <ae8T-pU8Pf9xaCKy@ashevche-desk.local>
References: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_004506_487897_67EAC631 
X-CRM114-Status: UNSURE (   8.57  )
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

On Sun, Apr 26, 2026 at 12:07:24AM +0800, Felix Gu wrote:
> meson_sar_adc_temp_sensor_init() allocates a buffer with
> nvmem_cell_read(), but the old code leaked it if
> syscon_regmap_lookup_by_phandle() failed.

> Switch buf to __free(kfree) so all return paths release it.

__free() is defined in cleanup.h which is missing in the driver. Please add the
include to it.

-- 
With Best Regards,
Andy Shevchenko




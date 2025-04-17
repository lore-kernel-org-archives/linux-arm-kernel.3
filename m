Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC203C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNrVnGtuC3LrEMn6XDRLUaW+Rsg3fuSCjKORqLuvUyQ=; b=Go/Y+jLWJ5AdHBmj6dy9D3QYKq
	Xf6G4luHjkEEKFhSjkYQiaL3Y4xWqrc3t0MSNMUHkmBz+N5CSo8A5X96qt6I14EAQc+oSceAiRneJ
	4irhDrLKJS1uHn5UNjJ33PCVY1LjKDRiHchuHbOH+j9sP5oM9fQjpLWx3nimirLbKa6OXPNiZu7vz
	ugJRuOsQtczFbena5XYlQt0mHmAZ1w6UK7aeWyHUIMOEKzI15tdZWBtDq+Vl9nw3GNUG3WSiymIiU
	sk0Wh7QryPDZOh5I5VjMIglJCYpDU33BFqh2lhjDsVqOhYqo0CVXZZLmhAXiafQDY9nk0mG6DUxe0
	n/WP5ghw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5T2j-0000000DqgT-15Dc;
	Thu, 17 Apr 2025 17:28:53 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Sao-0000000DkyR-0tLc;
	Thu, 17 Apr 2025 17:00:03 +0000
X-CSE-ConnectionGUID: 1Aw035HhSuKnQdYfCBui5Q==
X-CSE-MsgGUID: NKqcvUjaTbKhh3Y/XLP4ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="50319334"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="50319334"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:59:49 -0700
X-CSE-ConnectionGUID: 7jhBxJh8R6SNFsGSuYbh8A==
X-CSE-MsgGUID: tfqBq1xGRnqHLb9ZbCHoBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131848343"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:59:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u5SaP-0000000DGBC-21Cu;
	Thu, 17 Apr 2025 19:59:37 +0300
Date: Thu, 17 Apr 2025 19:59:37 +0300
From: Andy Shevchenko <andy@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomasz Duszynski <tduszyns@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Andreas Klinger <ak@it-klinger.de>,
	Petre Rodan <petre.rodan@subdimension.ro>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 6/8] iio: imu: adis16550: align buffers for timestamp
Message-ID: <aAEzeY_p6a8Pr-zn@smile.fi.intel.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
 <20250417-iio-more-timestamp-alignment-v1-6-eafac1e22318@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-6-eafac1e22318@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_100002_319683_70BDB801 
X-CRM114-Status: GOOD (  10.56  )
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

On Thu, Apr 17, 2025 at 11:52:38AM -0500, David Lechner wrote:
> Align the buffers used with iio_push_to_buffers_with_timestamp() to
> ensure the s64 timestamp is aligned to 8 bytes.
> 
>  drivers/iio/accel/bmc150-accel.h | 2 +-
>  drivers/iio/imu/adis16550.c      | 2 +-

Looks like a stray squash of the two independent commits.

...

>  	struct bmc150_accel_trigger triggers[BMC150_ACCEL_TRIGGERS];
>  	struct mutex mutex;
>  	u8 fifo_mode, watermark;
> -	s16 buffer[8];
> +	s16 buffer[8] __aligned(8);

As for the code, would it be possible to convert to actually use a sturcture
rather than an array?

...

>  	struct iio_poll_func *pf = p;
> -	__be32 data[ADIS16550_MAX_SCAN_DATA];
> +	__be32 data[ADIS16550_MAX_SCAN_DATA] __aligned(8);
>  	struct iio_dev *indio_dev = pf->indio_dev;
>  	struct adis16550 *st = iio_priv(indio_dev);

Ditto.

-- 
With Best Regards,
Andy Shevchenko




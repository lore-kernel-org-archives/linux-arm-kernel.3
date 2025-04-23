Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26771C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 19:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bp5kUiQVtxW9InMDVI/MpEQj6o8ctB12W6yIBGVj4io=; b=HDCfltAzRjkIN2EWs16AF5y/k1
	CDfilMQIw92eT+9oWtnna6/IcTWWrkQgDr8SEvF8krrF0x2hQnXPjOjAMpkw8tOG3VA27/7alSVPG
	25/iXnNGris9p3odjXavO1h0fcKnJlXPXa/7eSLSesPyR5nB875i+BUMZBXifoWkkG9sXNiSS/0v/
	QztaidqvnrjPXnpJfDuW99LwTPAHSduq8cc+SNLqM/h7VyPKCDHXCehpHRNoz3v7mYCoQ5QympzFv
	JrvgsMX2c0y+AGkzOdSFPtgG0ktofm9JhiKc29qTah7kKouLasw7yNoiHlmd1AOnrsZ4FwYo3SnYS
	xUYuCoIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ffg-0000000BjAy-1A2V;
	Wed, 23 Apr 2025 19:22:12 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7dqq-0000000BGF4-3u8s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 17:25:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745429137; x=1776965137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VPDAEHukUbI+oi/4og11d+8ZLIVqGYmsWG4hYtjyuhI=;
  b=CBHRszeo1jBz/K8yAxAnociB6BUZUjHlwdP67KhvQT+I/tzPoH9OYIvQ
   xrTpaljjtOHLxoNwAwRtV2g9BHQ84ujg7XD50HBxqMLTvtcqL1adyUg8/
   h9UtKrNKkE6rNEhkCAbrpYFPvmvw7YjM+nr4vcK3KH2+schx+g3X9Tip4
   xV2eMoEyY2tkvDPsAxaQBZ29+m3pww+Ab/Q/J7HRch10lDtnetxgxuIX9
   cEdM4tOpfXy01ZFbMynBMMHobTE/P8QLKugwv6Gf0LBGJ1oQEhsUQPVIQ
   j2442ESOIdb4cmAZAiaSiYUHCrBfbS6D14LYjiHOo7u/+0b7S/g8tDiRh
   A==;
X-CSE-ConnectionGUID: wRFkUvbFTEKDlYgVMcZ/9Q==
X-CSE-MsgGUID: mPKN8KUISe+rQv0U+wHvGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="50863740"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="50863740"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 10:25:34 -0700
X-CSE-ConnectionGUID: bMooqzDqQdeZnoEE66eaag==
X-CSE-MsgGUID: CoVTSh/MTHqyaZCTwy5v8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132908758"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Apr 2025 10:25:30 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7dqh-0003Up-2m;
	Wed, 23 Apr 2025 17:25:27 +0000
Date: Thu, 24 Apr 2025 01:25:08 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
Message-ID: <202504240112.hZy9LpvD-lkp@intel.com>
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_102536_982403_D2595B12 
X-CRM114-Status: GOOD (  12.19  )
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

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on aff301f37e220970c2f301b5c65a8bfedf52058e]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Lechner/iio-introduce-IIO_DECLARE_BUFFER_WITH_TS-macros/20250423-061049
base:   aff301f37e220970c2f301b5c65a8bfedf52058e
patch link:    https://lore.kernel.org/r/20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706%40baylibre.com
patch subject: [PATCH v2 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
config: sh-randconfig-001-20250424 (https://download.01.org/0day-ci/archive/20250424/202504240112.hZy9LpvD-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504240112.hZy9LpvD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504240112.hZy9LpvD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iio/industrialio-buffer.c:29:
>> include/linux/iio/iio.h:813:1: error: static assertion failed: "macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp alignment"
     813 | _Static_assert(sizeof(IIO_DMA_MINALIGN) % sizeof(s64) == 0,
         | ^~~~~~~~~~~~~~


vim +813 include/linux/iio/iio.h

   781	
   782	#define _IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
   783		type name[ALIGN((count), sizeof(s64) / sizeof(type)) + sizeof(s64) / sizeof(type)]
   784	
   785	/**
   786	 * IIO_DECLARE_BUFFER_WITH_TS() - Declare a buffer with timestamp
   787	 * @type: element type of the buffer
   788	 * @name: identifier name of the buffer
   789	 * @count: number of elements in the buffer
   790	 *
   791	 * Declares a buffer that is safe to use with iio_push_to_buffer_with_ts(). In
   792	 * addition to allocating enough space for @count elements of @type, it also
   793	 * allocates space for a s64 timestamp at the end of the buffer and ensures
   794	 * proper alignment of the timestamp.
   795	 */
   796	#define IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
   797		_IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(sizeof(s64))
   798	
   799	/**
   800	 * IIO_DECLARE_DMA_BUFFER_WITH_TS() - Declare a DMA-aligned buffer with timestamp
   801	 * @type: element type of the buffer
   802	 * @name: identifier name of the buffer
   803	 * @count: number of elements in the buffer
   804	 *
   805	 * Same as IIO_DECLARE_BUFFER_WITH_TS(), but is uses __aligned(IIO_DMA_MINALIGN)
   806	 * to ensure that the buffer doesn't share cachelines with anything that comes
   807	 * before it in a struct. This should not be used for stack-allocated buffers
   808	 * as stack memory cannot generally be used for DMA.
   809	 */
   810	#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count) \
   811		_IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(IIO_DMA_MINALIGN)
   812	
 > 813	_Static_assert(sizeof(IIO_DMA_MINALIGN) % sizeof(s64) == 0,
   814		"macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp alignment");
   815	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


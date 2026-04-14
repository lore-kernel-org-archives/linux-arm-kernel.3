Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC50F9D0EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 18:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kYp1W+c8Ug+Ye+6ZxmwBIHL4H5+A+oI2G2HKwyGZnQ=; b=sD45R2xDte5XxG9XqqvIY5KX6A
	FNHarS04QoJ2wqdL0jrwgmONtk/zukM7TYCd0kFDuKYoallgp88LnCYn9eLHyRiYR3yGh0GVzAokN
	hvmp5ki3mPgqeV6c8SK8l+Er7zTkmaG1YwLQvD6fxOQ1D3E7EdYoKHFhG+ybzNWRnsV7EwYDckX19
	6SGvyPi9bVg4KDvWAcqdpChwQWI+vN1vgTOAQHDI2EyPFXum6RavkRVmjV1c3MXqPUS88aKnd4CUz
	Orb6TSQxtEe81GCkQwgX5oCI5pzjrsKTk9BCruT3Oijm4KtTjGhDS9MgMF4GQ+mHNbbcztxuiQ/WD
	QftRf+Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCidN-000000006gv-0n76;
	Tue, 14 Apr 2026 18:37:13 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCidK-000000006gA-3VLG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 18:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776191831; x=1807727831;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+z4szrI8wNpQTGK93+rDAEUGrK79H8kuR2I7Oz6xiDw=;
  b=mHEu3vrLEvE6BfCF6HfhXqaIb9OrJvM73+wvoGcQYHMeP1sxxJCxl7LR
   YEOTJKKJtQdMZrpfKnUQ6+1h0P/rhvMv6XhGT+E5iSuPvAhpL4b3zuZmG
   K8GUZAYuh0QOTt8eURzr/tD3hOV+0UWg2XZPBRpJqZt28fsfLrbQBSjp3
   XIa+QqL0ZYV98QlKA58TLYFiPbxXSIx5QwE+489oYRdQHCAHky4nkUyyN
   2+oxlTJR6Bc31v+4Yt38euZR2FwW/HWvTO7u/unHZ6bnXGPg5Tfn6h+R3
   b2knVGKwxrjIxCsDHn+HJGNCJsJOIMrNmUPD9EshRJhbahD6hNeYZc5cJ
   Q==;
X-CSE-ConnectionGUID: 5poNg5xlR1KsaMzaK+sQ/Q==
X-CSE-MsgGUID: Dj9XqyiPTGGs6LtJ/nq5iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77036882"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77036882"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 11:37:10 -0700
X-CSE-ConnectionGUID: j/kMmFV3TuS4aKTnxxpCUg==
X-CSE-MsgGUID: SS2HCm0xQUu61aZDwAgUTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="231925127"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 11:37:07 -0700
Date: Tue, 14 Apr 2026 21:37:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
Cc: Salih Erim <salih.erim@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] iio: adc: xilinx-ams: fix out-of-bounds channel
 lookup in event handling
Message-ID: <ad6JUHXNCyB4J6QZ@ashevche-desk.local>
References: <20260414093018.7153-1-guilherme.bozi@usp.br>
 <20260414103316.18455-1-guilherme.bozi@usp.br>
 <20260414103316.18455-2-guilherme.bozi@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414103316.18455-2-guilherme.bozi@usp.br>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_113710_920245_A18EE0FB 
X-CRM114-Status: GOOD (  12.69  )
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

On Tue, Apr 14, 2026 at 07:29:17AM -0300, Guilherme Ivo Bozi wrote:
> ams_event_to_channel() may return a pointer past the end of
> dev->channels when no matching scan_index is found. This can lead
> to invalid memory access in ams_handle_event().
> 
> Add a bounds check in ams_event_to_channel() and return NULL when
> no channel is found. Also guard the caller to safely handle this
> case.

...

> +	if (i >= dev->num_channels)

The '==' is clearer. Otherwise, please justify the '>' part.

> +		return NULL;

...

TBH I do not see how this code is not a dead code. But for the sake of
robustness it might be added. I leave it up to the maintainer.

-- 
With Best Regards,
Andy Shevchenko




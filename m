Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BF4ED7B93
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 09:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUn4QusPbWc1URtyFzVFQTLNIJMysuVEk2ACRxhi8b8=; b=dDIFb5uQx7fOCMZSsza0YHw9WK
	bSCMaUivWrg2RU1VUFT+uxr9WLby/aGe3po08Ckp4UorbI64HrY1TMKttvNg+tAOK9uSueT+44QcS
	lNwI9Q57CZUEL70LN7lIfXHj294F5dwGa8ygxXmzLosVGlSS2K5vPNFAtPwgO2lcq+5YiBrLrvm+8
	V4kJbFy+8FSnqlGh0RsvVDilZNTklDDVmSlBo2Nqmv1pLKnLHqksXEtepljVFnq9mom0u69EsKsHN
	dG6T7WL/rfY5dx04P6cIJ2eujrVaMjw4JCSOIWkGFU9tJ+gqK8bh/BzQxkNdEFXpocz2rtFyxLL/Q
	oLQlzFHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCaXa-0000000H5tm-2OyC;
	Tue, 14 Apr 2026 09:58:42 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCaXY-0000000H5tN-0uZ7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 09:58:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776160720; x=1807696720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1hlA721MfokjRkyG5KY0seHM22gZqQM5oNsSnbvVu74=;
  b=Hd+5YmbEgY+mzWAAhfUZ1f7EW8E/wEOa4uq8nvIx6q1BOy/RcQzFihac
   feFzSL9ejFzvcJ3G1blJgdjXK2iX1Twf1+q9DPqr5ygtPGVsnGP84+ceb
   7nM4kHsvbE0BanAdSIfxUv6z67XhhMmoStQq5VmBWHjkLlV7qd0OM2exo
   t8H8miwCQp5+VaWJsISFgcfcpk32d7ff19nlzODDT2gQRHxZpOQ3h7x8C
   tPiXTbeCc6NC0r3IAwk+x7iS/Eb2O1VvRpGJfYpK9LSEDglOiouRkT04i
   nrIhGHRyy5W9gd6+eGr3Lh+PxuffLaMjQaQLo+GIBptKsaB+lTPgyEXD+
   A==;
X-CSE-ConnectionGUID: i3RDD7xpSYG18g4JDOKtSA==
X-CSE-MsgGUID: bexEDo7lQQy4cxhtJ6yEbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76994022"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="76994022"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 02:58:37 -0700
X-CSE-ConnectionGUID: M8vvljpGTbGQCh9rYLuJGw==
X-CSE-MsgGUID: cdQ8FNbSQ6+tFLv9y9zWXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="234447981"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 02:58:33 -0700
Date: Tue, 14 Apr 2026 12:58:31 +0300
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
Subject: Re: [PATCH 1/3] iio: adc: xilinx-ams: fix out-of-bounds channel
 lookup in event handling
Message-ID: <ad4Px0Aghm2gHzRV@ashevche-desk.local>
References: <20260414093018.7153-1-guilherme.bozi@usp.br>
 <20260414093018.7153-2-guilherme.bozi@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414093018.7153-2-guilherme.bozi@usp.br>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_025840_267376_6353C295 
X-CRM114-Status: UNSURE (   9.81  )
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

On Tue, Apr 14, 2026 at 06:29:28AM -0300, Guilherme Ivo Bozi wrote:
> ams_event_to_channel() may return a pointer past the end of
> dev->channels when no matching scan_index is found. This can lead
> to invalid memory access in ams_handle_event().
> 
> Add a bounds check in ams_event_to_channel() and return NULL when
> no channel is found. Also guard the caller to safely handle this
> case.

> Fixes: <d5c70627a79455154f5f636096abe6fe57510605>

Incorrect format of the Fixes tag. Please, consult with Submitting Patches
documentation on that matter.

-- 
With Best Regards,
Andy Shevchenko




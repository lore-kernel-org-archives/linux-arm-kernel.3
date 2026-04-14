Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59A4ED7B93
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 09:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MARVOoORRVcp4y/Q/b5wX+2A1SZJVBlKicNFfVUd7qM=; b=Xye1T5f6ZKdnrwn07YmuBWAcAr
	HSKX2++HGGNFyMNMnx/krjUQQKWr6FNTBLjKGO1Avve6gTsG8XYyuMpqXrLS02ntwP5enHOgGT1f9
	rGbd1R4QbVV7An3eMo9c456KYbeiyK2H52r+8LLv8Mhg+WWhttzws/Ue+XpXpI9x5BJpqHNZ16uY6
	lpQSlx4TFzQmWt62O+JfHnV1UQSlCFWN1NHWoxkL5hGt8UAvod23ymr3T9ULckeMtXwMoYVnkRefm
	dO9SL+Vn8tCNaX6hBSuZTa+bZsc38j/o45RC1SfX0b5ICeRoMOCCjz5JscUqRXJZNbgKSZJZki3sD
	ipaxgbrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCaYf-0000000H60Y-0Bo8;
	Tue, 14 Apr 2026 09:59:49 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCaYc-0000000H5zz-2Aa8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 09:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776160786; x=1807696786;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qRPEBhalGWr8kNJiRCc9zLBNMbRd/H4Z0wQVLL836OU=;
  b=mt/WbNNtyna7N0CaUB9Ocmf8do9iC9v/7dwj5316DaLKlLFuIYxdv1rz
   FYJfZgw+HfAfWY+cgnVmhUy1uyjlOafEMb/TgJkZyueUZ4OAYrTrnm5Zq
   p6zuQ07cEeBVZLWoWSwNVgxt+3Y3Zb2o4jeiG1lS10ynTFedHcit03PvN
   XPR1pbzAs6VwdZSrjfLVdHaoM8kDOpD2mwVt9HFZtXbmQ+ez90vKzLess
   5V2A1Go4pgR2/FJF6RbHIDKEthgLAgtNvmCrrL2B3g7IYQx4iBxwHasV/
   Tf8yvdQe0ma91D0ryRjCriyt+FHVnp/Xn/IEfghYs7m0nomAjmeW1UE6M
   g==;
X-CSE-ConnectionGUID: ntXJ5r6VRBSz3oiIQ72yYA==
X-CSE-MsgGUID: 7UvvEvCbS7+FuR7b1Nyo1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="94513102"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="94513102"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 02:59:46 -0700
X-CSE-ConnectionGUID: qb4AwUhCQG+84uKuzu9j0Q==
X-CSE-MsgGUID: O9SuEDRLSNeCusHJ7FV3pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="227390843"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 02:59:43 -0700
Date: Tue, 14 Apr 2026 12:59:41 +0300
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
Subject: Re: [PATCH 2/3] iio: adc: xilinx-ams: use guard(mutex) for automatic
 locking
Message-ID: <ad4QDZ47hUuOHLlJ@ashevche-desk.local>
References: <20260414093018.7153-1-guilherme.bozi@usp.br>
 <20260414093018.7153-3-guilherme.bozi@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414093018.7153-3-guilherme.bozi@usp.br>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_025946_591539_C2AE7AAA 
X-CRM114-Status: UNSURE (   6.71  )
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

On Tue, Apr 14, 2026 at 06:29:29AM -0300, Guilherme Ivo Bozi wrote:
> Replace open-coded mutex_lock()/mutex_unlock() pairs with
> guard(mutex) to simplify locking and ensure proper unlock on
> all control flow paths.
> 
> This removes explicit unlock handling, reduces boilerplate,
> and avoids potential mistakes in error paths while keeping
> the behavior unchanged.

OK.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko




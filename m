Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42C2CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDXbdM4qDrP50j7J2TcIVdmGclkOYUoKSDYJlKuQXMg=; b=TW2tS9m6JILglVuFWvVGPQ56LS
	61zER/8H5Rnin31yQiZGqOMTgy0xNXFSv/e6mqvcX5Z6ew+j8b1oFnlU1qSnSbqSTtcaWYudPyDYz
	jkoM68Tcf345UHUh2q7OQw/D9L9iuT4nTQuJCRRZzctxkHjKFolb0ZazHzH5jZBEodWITmxrd7uLf
	36mq79zXuZV76BRR1QvftisHgzwe0JISsHu/rn8MFhaF0tJFL8hoammBWsWTi0FflhVbah8sOqSrn
	zOAC4O7uqF4u23rvSM8OaX1Gz7Uux095ROoeb4BX7CwQtsSl2upNRITjgHscGbrwcVBNblP2j/bUA
	FHoyyUpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgjG-0000000FjQp-46kC;
	Tue, 28 Oct 2025 10:15:02 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgjE-0000000FjQL-01b8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 10:15:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761646500; x=1793182500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4xas4y94vi3/3tBwp2J+Ktp/jrZPl//0sQ0Xoe5S36I=;
  b=aiX6b85QZ1BlzNXZKvKCTxWKllqRdC9q1gzqQ1l3vlcIoZiADNvblOX7
   F+UJ9fjexla/gltD2JvvsCESDMg/pR1mRL/SS2oGNz5JP1zaj0bEJvvhL
   q6IKaCQPny1cnwhpp+2WhpTVkp4AZrjeZhQWDd1OPh4TzAoqvm6R0CPVl
   sjZulU8NJEHLljxEX/wVTamoOSPT64LvGCtfK/cKIL8+AdvJ4wa2Y6wZK
   9h2b89L0bl/F4oxCd4vFjoKl4fVSy/PnHDZlKnTCTscMtPNYXXmPxIVDo
   6dfBjJTb7ApGzHkfIurqBR5sqUg5i++gdydtoZ1hcWQJ5Uyc7HYjx4Ou4
   Q==;
X-CSE-ConnectionGUID: cpW+tKqxRAOLBMNn3BOI3w==
X-CSE-MsgGUID: Nsv8azm7RQCZlPsPuJlpMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74343470"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="74343470"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 03:14:57 -0700
X-CSE-ConnectionGUID: iFQ8YCGpRB2ERMJDAZdzpg==
X-CSE-MsgGUID: 721JDO40R1+Z9Qpg7Dkeug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="215964946"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.136])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 03:14:55 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vDgj5-00000003HMI-2Wgx;
	Tue, 28 Oct 2025 12:14:51 +0200
Date: Tue, 28 Oct 2025 12:14:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: aspeed: clear reference voltage bits before
 configuring vref
Message-ID: <aQCXm_rvwpB6-UUq@smile.fi.intel.com>
References: <20251028054102.1954503-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028054102.1954503-1-billy_tsai@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_031500_071387_A2F40C6A 
X-CRM114-Status: UNSURE (   8.82  )
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

On Tue, Oct 28, 2025 at 01:41:02PM +0800, Billy Tsai wrote:
> Ensures the reference voltage bits are cleared in the ADC engine
> control register before configuring the voltage reference. This
> avoids potential misconfigurations caused by residual bits.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---

It's a v2 and here a changelog is missing.
No need to resend, just reply with a missing piece.

-- 
With Best Regards,
Andy Shevchenko




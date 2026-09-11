Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD17C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 16:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahjV5Z/ZwrQZxcMl69+pDLCZhkdxm0sP6Cc39CgwBgk=; b=UqA17cHMhE6I80sM6xWONN3C1D
	KFvhJQLJapXzavNy97U1syWEo7HJAhqF2bKBIl0SKt8ZejEdlFIYAf2fOoGWfp+W9t0RtuGEYX/1F
	V3sSaV7ESO5J9eAKYNFBM7KfNFHlvaeR9XOd27Ig77tpY6AWYCj6GBusKsGia/zDNUaC6zqNvwmVM
	oy2hfn9ATYBzxsIIF5M5cuhGbzIG1F4RXy6UdjcHXWMIDd2bQnuwjUMREuFpEe6OmC+fbIwQxOvql
	M5bicTidVTsETScv3hhG/9vBX305NpeIjGAxInK/AWk0I1V9fvgzapJvqU54wP+kYl61FaJUsuchQ
	H4aYklyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53pO-0000000HBEd-2yKK;
	Fri, 11 Sep 2026 16:10:14 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53pM-0000000HBDo-1SBH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 16:10:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789143012; x=1820679012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a2Ztu5w1m+CAwAK5FGI24VNtN5jt6xLSkd9xsYrPPHY=;
  b=Sx++J6/PJdy5FQdLsAOCaez5ujB34g7hjoITlMb5BzwXWNuFvkmfCqWE
   7IexH4S3J5jgPI7No8znSyYLF9Y0opS+dfNuPj2jugCpCYQRppD3SSg+a
   M8C+Sc6UXPn/RzlaZjMZrmDLwKrbuQnbGh/A784Jusz2YrpCQHMfXVvXU
   MZFNsdn3DsB26Eja6RiQikj9v2xFYJmk2EnMsKTaTtxP+vKwOPVGTWeY/
   8OywbWa8EFTYDJutbr6fIchqTG3g33JLphV1VtVGjJTozMeH5W2u1oZmi
   1doAH5iLHglCzfLNvh3eZq/Yf3bvhN0l/EFjYDyn2FP92V+snW8Y7yMNK
   A==;
X-CSE-ConnectionGUID: L+Ja17xtTreXoYA9/+sRZA==
X-CSE-MsgGUID: Huub1NyPTk6TMDavgEkCIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115146465"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="115146465"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 09:10:11 -0700
X-CSE-ConnectionGUID: g9HwgI7bTsWw/VlF8EqmjQ==
X-CSE-MsgGUID: zzF8Ff4xR7qIRYRhDh1l7g==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.80])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 09:10:07 -0700
Date: Fri, 11 Sep 2026 19:10:05 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Marek Vasut <marex@nabladev.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Olivier Moysan <olivier.moysan@foss.st.com>
Subject: Re: [PATCH 2/8] iio: adc: stm32-adc: manage characterization voltage
 diversity
Message-ID: <aqQn3Tef1MJvIz7T@ashevche-desk.local>
References: <20260911-adc-stm32mp25-v1-v1-0-cef26eecdef2@foss.st.com>
 <20260911-adc-stm32mp25-v1-v1-2-cef26eecdef2@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-adc-stm32mp25-v1-v1-2-cef26eecdef2@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_091012_425652_373EA6F4 
X-CRM114-Status: UNSURE (   8.88  )
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

On Fri, Sep 11, 2026 at 05:51:24PM +0200, Fabrice Gasnier wrote:

> The characterization voltage used to calibrate vrefint depends
> on SoC family. Add vref_charac field in stm32_adc_cfg structure
> to store the characterization voltage for each SoC, and use it
> in vref computation formula.

Vref

...

> + * @vref_charac:	Vref characterization voltage (mv) used to measure vrefint calibration value

vref_char_mV or alike
(use unit suffix and you may drop that mv in the parentheses).

...

> +	const int vref_charac;

What does const buy you here?

-- 
With Best Regards,
Andy Shevchenko




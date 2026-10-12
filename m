Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC986CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 21:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcfPQmiXGdeVdfbhE8VrGXjn4S2YUmuJC0pXTHRdmSc=; b=sLY9KvL4bxoTPR+Nu0lKjiTKug
	L4efN5/gSq9vIOpdgV/3vo5qcWb2IkBGr0G2jf076ihvBUtcQgAwRdl7gq5dpVKFNv6DBI1lw6de8
	XbeQkLIbILe/TnLsL43my3E7t6S90PxG1zDd1FEF5ugJjwzMpLqjGbLNP2qdYQOAwAiyN/TBvkn6O
	FAWxc7sxd9B9S5CHVltZzw3Ok3DvtU9HqnQPYoOwivMUEUbizqtzdHq+6bU2NNmBkX4x7YsH549rL
	irHm+uvc2N0l4BGqayzm8Ay9eBIrIoDT2ZVUdCBosZAVgbRYCumh+AHORNCZsxr/5tP5wMW2LaEjx
	K0Ntv5YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNEj-0000000BWS9-3Zvf;
	Mon, 12 Oct 2026 21:07:09 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNEh-0000000BWRp-23Eu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 21:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791839228; x=1823375228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bVVAEipiwUOMUcpLzlPT7Lmm5gYJXvHswnCcfXQFJLI=;
  b=acNaFtXvnXcFxXIslHsF3gTztE5MhrgFhmXJ4RWBjaD+k3kikoLRsuQg
   TWw/+ZxHgkHWoOxd4I/PZ2rSuQb0N+Uo03SyL+4vzcRZejSZ3Ud1vXNc4
   JCdAZ3mU+UVBy/BweXuRaFfceOkDEU9ePtqvHGBCYZXx9hy7IBv6By1Rm
   qj9WA4VmTqZMAlqd1mlJtSOE6QoHabKzUgXMz8ElNGMm2skALHYK3qC4z
   6IbVV9ehdLQXA6o6+qV89uAXC5PE9zIoRy6N8wyggUAYZQOeTtryEcA8x
   chaoNvW3fz4zBFoq9R2tTJYxHbTzCL6KRVaBJnpx58/mXdkk7iWlH8i3M
   A==;
X-CSE-ConnectionGUID: gB9ZU4fkTU6/AR67f/Kn8Q==
X-CSE-MsgGUID: gV+nYrIlQqeLaPW3Dw1FZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="549324"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="549324"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:07:07 -0700
X-CSE-ConnectionGUID: gOhEPTXDQS+gPAMbHWHqrw==
X-CSE-MsgGUID: /MtGaiJhTBudBOHiTtDmWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1096907"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:07:02 -0700
Date: Tue, 13 Oct 2026 00:07:00 +0300
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
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Marek Vasut <marex@nabladev.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Cheick Traore <cheick.traore-ext@st.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Cheick Traore <cheick.traore@foss.st.com>
Subject: Re: [PATCH v4 00/15] iio: adc: stm32: add support for stm32mp23 and
 stm32mp25
Message-ID: <as1L9F3ua4LKvj73@ashevche-desk.local>
References: <20261006-adc-stm32mp25-v1-v4-0-d31ec75aecf3@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-adc-stm32mp25-v1-v4-0-d31ec75aecf3@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_140707_593422_FB83575C 
X-CRM114-Status: UNSURE (   8.24  )
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

On Tue, Oct 06, 2026 at 09:57:31AM +0200, Fabrice Gasnier wrote:
> Add support for STM32MP23 and STM32MP25 Analog to Digital Converter.
> It's a variant of other supported STM32MP ADCs. Add the DT bindings,
> driver, SOC DTS and an example on stm32mp257f-ev1 board.

Looks good enough to me,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko




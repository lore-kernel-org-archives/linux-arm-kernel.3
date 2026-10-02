Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBC6CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsDqxcg/n5wbI1PAbxInDdXphWsg7g/jnw1r6gwNoro=; b=SWRJo9YH/T74bag24IlLgjwHQx
	IcYff2vYK9qsT+JY6dueTdvoWN8YdrJb1L11wYGJmA7sxoDc/e5JnZgNXHdtFNKgfHZt6/yzVnM6i
	xHnXBYS1mTEZ6f7k4UXtQ+dXqFWyoZZGojBDisVewK7Raxbw/4pmN1HbHEPioFWZUWcvt7+YTXxEo
	B5Dhp0r81CTaZdvLAOo/DsJrSgRJM7OQYkPDf0Q+rxzTGXLIos9Xv7lGk4igYSc7G9qmkIuRrqrvo
	atTJQbpqy4Xi1vST4dogmHIlA2DrtyNn83GfmFoCzikG75zwgc8ueovENurUP0tr7bJ3lZtZRzKrz
	OJD8gZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZUU-0000000B8Dm-0IdS;
	Fri, 02 Oct 2026 09:23:42 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZUR-0000000B8C5-1odB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:23:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790933020; x=1822469020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zmuLiQbd8QxL0tTNDCxKS9p6kykYRAuOi0Tb34sjbfc=;
  b=jpMBUfB4oIMr9qCvufF8Qp84ebrX3qwOQqFVCKMRAUEmYFna/1cMpmNB
   EzelK9oxZ8ZDS4Fqx/r2L5j9vJD/E57lk82699Mzy+yH7i3mOtzuE1LZ6
   3Kcvn6//wcGo8/ejQN8ayHDzx2pG75jvve9UvY9uW872tyCZtDd6MuWTL
   VPrLIxrJ+MbGBojCYm1k4LO0J1mYInz+CjaOGXMYtyNf6R7QBkUgPHM/6
   h3VW9talKJKQd1wfORzE9J7VrALj88TnkKZoAjC4u5AIRbn+F9vQ4i8Zz
   81g5ZPMxNBSrm0UVpa2RJVo8cJrR4oU2T0aVArHzRTYLnww3fKh2U2C90
   g==;
X-CSE-ConnectionGUID: ChPV0LakQ/mSpzYbUPJmUw==
X-CSE-MsgGUID: C4WPaaHdQ5WTLly+Owfvrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90729051"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90729051"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 02:23:39 -0700
X-CSE-ConnectionGUID: hROUSMktQSiu7M7VaSE+0A==
X-CSE-MsgGUID: eSOna0UeRCqJhAwhBhROrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="302464757"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 02:23:35 -0700
Date: Fri, 2 Oct 2026 12:23:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] iio: adc: aspeed: Fix SCU lookup for multi-SCU
 AST2700
Message-ID: <ar94FZ2kEJZzJJb3@ashevche-desk.local>
References: <20261001-ast27xx-adc-upstream-v2-0-2f9c15cc0064@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-ast27xx-adc-upstream-v2-0-2f9c15cc0064@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_022339_507686_605BC598 
X-CRM114-Status: GOOD (  13.73  )
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

On Thu, Oct 01, 2026 at 05:50:35PM +0800, Billy Tsai wrote:
> The ADC's reference-voltage trimming data lives in a SCU register. The
> driver has always located that SCU with a global, name-based
> device-tree search, which works as long as a platform only has a
> single node named "syscon". AST2700 splits its SCU into two
> instances, syscon0 and syscon1, that share that same node name and
> differ only by label and unit address, so the lookup always resolves
> to syscon0 even when the ADC's trimming data lives in syscon1.
> 
> This series adds an explicit "aspeed,trim-syscon" phandle property so multi-SCU
> platforms can point the ADC at the right SCU, keeps the existing
> global lookup as a fallback for single-SCU platforms and already
> deployed device trees, and wires the new property up on AST2700.
> 
> Patch summary:
> 1. dt-bindings: iio: adc: Add syscon property for multi-SCU SoCs
> 2. iio: adc: aspeed: Use syscon phandle for trimming data when available
> 3. arm64: dts: aspeed: Add syscon phandle to AST2700 ADC nodes
> 
> Assisted-by: Claude:claude-sonnet-5

Assisted-by: LLM
(as documented)

-- 
With Best Regards,
Andy Shevchenko




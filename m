Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DA5C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 19:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97OJ/mlTAMlKy5EjSNHcp0JDElogp7owWQT+IYr41/8=; b=vaU7B/NSYyIIH6/E9+HrEjTctA
	vwJptZOTgwunLIzYAYxJaFPhna61NNoCkdfd+05ltgBpzMU4d/rahXdsAfUM79wbI0EDpRZjHfcr+
	K8SVZSiwPCx09PpIma1uSNtLuy9RwOs5nR0xozOiSvoHKodngjPfX/cRhKCGzYqb8fsQ0Cl0clYo0
	m+MU/Z4AceNdcWJUouVoVkqA/XgHonGVjUgh9YlZvtnTCyOjF/OQGnBR6jJ8JfIPA3S9IKgtao7pY
	KsTw1dlt9tFv2aWYLuYCRxLes6WaX7bK8SeVPICD7/OHHU1M6IunsWKl655v2hCWHMTcDu89Xfc8Z
	OI09tzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlu6Z-00000007oL8-0nS1;
	Mon, 20 Jul 2026 19:56:47 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlu6W-00000007oKi-0v6h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 19:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784577405; x=1816113405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xuBSAIf2BqyIqXPMitrv7lDaxfE+4gesNzdoI735OW0=;
  b=mU/GPmwEhQLBdYtxxdraePyGTwuW7ACjEGUvR/KiyyHQVHJ2BifE5mrN
   XoNKqzkJD2ZpZBHGramKpCLs9Hk1J8UIW7LVznXvboRiHrxPdIZHGlfao
   9bKYTCZeotF4jPBI9DCbBHcWt0t0JVEiCtmfXd3JlDe4VniUyJmzUersK
   ugv6NABW0iOVxWsrJa9E3jsNFIkKbohQN9ws3pIgSj7z9PHNMwym6FnxK
   3iKIhEeIjzPlfWn0vtkQ1c4YgkahaRUQg+ByOmhSnBtDyxcvxpgOF3E7e
   13cL8JmUIgM+xXV3hltE6o/7zTN+Vwab4fgC6JaJMwG6UMfHrNgHN8/8V
   w==;
X-CSE-ConnectionGUID: 4TAOXdjtS+qlFf1/PdRg4w==
X-CSE-MsgGUID: he7S6xpOR/yaJru+ZEENvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="89062622"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="89062622"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 12:56:44 -0700
X-CSE-ConnectionGUID: fWcSVIL0QG2H/pMvF8+BQw==
X-CSE-MsgGUID: x2ZAM/duSk+2r3A3i5//Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="262498572"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.175])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 12:56:41 -0700
Date: Mon, 20 Jul 2026 22:56:39 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shih-Yuan Lee <fourdollars@debian.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 7/7] spi: pxa2xx: rename local status variable to ret
Message-ID: <al59d-zgEV0KCPIp@ashevche-desk.local>
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-8-fourdollars@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720162117.32304-8-fourdollars@debian.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_125644_293053_CF33CAA2 
X-CRM114-Status: GOOD (  10.28  )
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

On Tue, Jul 21, 2026 at 12:21:16AM +0800, Shih-Yuan Lee wrote:
> Rename the return value variable name from 'status' to 'ret' in the
> pxa2xx_spi_probe(), pxa2xx_spi_suspend(), pxa2xx_spi_resume(), and
> pxa2xx_spi_runtime_resume() functions to conform to standard Linux kernel
> coding conventions.

It makes a ping-pong style of changes: Previous patches add more status uses
and moves, and so on. Instead, this patch should go before all that.

-- 
With Best Regards,
Andy Shevchenko




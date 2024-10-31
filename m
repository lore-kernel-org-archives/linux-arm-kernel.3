Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87ABBE68974
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 10:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLBk51EGz2mRl44PbXhv//RbEwrtj5WIQrbJQUSWqaw=; b=EuJyVR3MXI+/iWCGX91ArZK/xI
	MycmVgnpgJW49iqrISn0v7a5+gXemLtzY+jqtowwyIIcfkV4hbbYBT2UyA/eJ59fS3dEYvYvVVbjc
	OOucwOs4uhlU6O/MT/e3U11qCwbT8AaEhIzj3nvvGqpLQFNPUZ4hhDaI4aVhsfEP0tM/raV77A2zK
	wS7gHUnfVbl7ULPOzI1nTf1dTBSIShGVfi/JnUtmpUZaBgkVua3Ex15vN1c23LTwShsgRDObzrEN7
	nG/+rcZ8agXmy20S9UgMNtlOyaFXUgkOMS8oMjF5dZhEHadebCjTst5VZvXl7hNGzWwE6oTBjbyqj
	jlpNEwHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6StC-00000003KV1-02SI;
	Thu, 31 Oct 2024 10:58:54 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SrW-00000003KFx-0LAM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 10:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730372230; x=1761908230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tVuyw/2mK57aTALxTRXWhHaWAaydpe9xSAAGsUudOsk=;
  b=hKvZ12SPrlf9Jouyf2UaWC89vO9Dw4G44ZkjBfavM5n3m3Yb6rNtRog+
   TS9AhKEHYGt+789f8adKj81euFUe668bGbcIp3x8GdoXoemPtjoPvispj
   9UKRPzMGK5On4IPtahZZc2Jw1wYWo+jlQ1yyROqHTF89ErD8JvLUDarqk
   lCVtp/EDM6JMoaMFrtXc/DWKX2PhAH6GvLgk/pade0aWVF8ydiGXUSKYa
   MwUR8cvrA/IClzmhHQWgG/o1+DL5MLY/qnIhEhKEUzMjijhjG9U3qbzxg
   JIkEfppT3eOFJ2Adcfy1NF8Y6rJlFFbFYYhIur9sE8I8iDA8v6aVEB7O/
   g==;
X-CSE-ConnectionGUID: W3iwO4RfQi+9V/EUu5tz7Q==
X-CSE-MsgGUID: U3Hhk44SQNynNB7D3ieqcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="40714319"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="40714319"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 03:57:09 -0700
X-CSE-ConnectionGUID: H+bgwwtSSsiF/gliVd+ZGw==
X-CSE-MsgGUID: 7CjK28aHSzCapN3igqZRyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82698733"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 03:57:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t6SrQ-00000009cBm-2eBN;
	Thu, 31 Oct 2024 12:57:04 +0200
Date: Thu, 31 Oct 2024 12:57:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 0/4] dmaengine: dma_request_chan*() amendments
Message-ID: <ZyNigG_hoFFArNii@smile.fi.intel.com>
References: <20241008173351.2246796-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008173351.2246796-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_035710_151963_CBFA4EA0 
X-CRM114-Status: GOOD (  10.01  )
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

On Tue, Oct 08, 2024 at 08:27:43PM +0300, Andy Shevchenko wrote:
> Reduce the scope of the use of some rarely used DMA request channel APIs
> in order to make the step of their removal or making static in the
> future. No functional changes intended.
> 
> In v2:
> - updated the commit messages (Frank)

Hmm, any comments on this?

-- 
With Best Regards,
Andy Shevchenko




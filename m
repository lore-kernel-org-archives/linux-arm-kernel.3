Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C4BC54FCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 08:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9iItdrChO9S1LXxHW3hvSsYydsVITJNiXNWz0zbw0I=; b=jKeZgZqp8Zk48qSOAvbTCLfoIY
	Vu2iZWnZOSg0D8N/Rzod3+02p20uOsNdHj3g4zphRyiDcSalLKOVof4UzmlK7tEFm9uLlHMsB4NvO
	j3r9pMrGWcOH+iIIeAPqPMO6YRaJGy0NyC55kabSUIj1jszLij78cYH8+/hpDtUCZ0wMviXE9SA9R
	j6QS0JVxKBanvx5ZGN9LXfSGI/JJmHLzQ32oB3MU9MX+vAVvS10Ht1dUPHBes2WnnfbVsmS8BdNpl
	fOACiHA2+rPmz7eZWQbN302EWewyVE595kSrZm0e3nLT+YZulxuUd0hpQkPcsgVHQj6/1iGuWc8mo
	XkjmgLwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLRR-0000000DNn0-2gkz;
	Fri, 20 Feb 2026 08:00:49 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLRO-0000000DNmC-3iiR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 08:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771574447; x=1803110447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=u2j53cj3ue7x7sCrL+F4jVz1giBzQrJ6XhcElglrgx8=;
  b=na63x2nzgCTp5bqAqSjtA3mDvHNlY3A0wMJp1ETk1OnF7p9UooyfwsFm
   NPh5QYDBRYh/D+yOv4gWLK24Xr6aa1OtiWhZEAO831uIHFZvrbmlEjJl8
   dY0NlFMLePW6XGIacIaQ010RALf8/P5CiE6JtvrkQPOV1iqbY7Z+IhZ90
   E8xvzlEw4BbzL+yviT5A0p95hUi9HC7Gegaz/ULp4DYhr9BkoDB9OOVhO
   +mnvJSaxdTVh/ElSvVdy9HpMDW5oXDyVwF3u0xo3Cyy+NuEnOO1fw9S0W
   jy9PiaXkLWOaCH1squdlA3JPbMV4g5E7z1g1szdJk9P9DwGm9mYxkiDHW
   g==;
X-CSE-ConnectionGUID: sO+aopyPTiKZBhxOW702pQ==
X-CSE-MsgGUID: zNNo9IRWRW+/1MeGLNMQMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72368859"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="72368859"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 00:00:47 -0800
X-CSE-ConnectionGUID: oT17aMYHSkGNjv9BNnMgFA==
X-CSE-MsgGUID: IYFnq7SARIaMZ23/QCe5Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="218922082"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.25])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 00:00:43 -0800
Date: Fri, 20 Feb 2026 10:00:40 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, saikrishna12468@gmail.com,
	git@amd.com
Subject: Re: [PATCH 0/5] iio: adc: xilinx-xadc: Add I2C interface support for
 System Management Wizard
Message-ID: <aZgUqLwuy8xJ4OZ3@smile.fi.intel.com>
References: <20260220053941.611415-1-sai.krishna.potthuri@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260220053941.611415-1-sai.krishna.potthuri@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_000046_993155_7B754677 
X-CRM114-Status: GOOD (  14.89  )
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

On Fri, Feb 20, 2026 at 11:09:36AM +0530, Sai Krishna Potthuri wrote:
> The existing driver only supported AXI memory-mapped access to the System
> Management Wizard IP. This series extends the driver to support I2C-based
> access, which is particularly useful for System Controller usecases.
> 
> Key Changes:
> - Extract common probe logic into xadc_device_setup() and
> xadc_device_configure().
> - Add setup_channels function pointer to ops structure to support
> different ways to configure the channels.
> - Replace module_platform_driver() macro with custom init and exit
> functions to support multiple bus interfaces.
> - I2C interface support.
> - Convert binding file to YAML format.
> 
> Note: We are working on x86 platform support where fixed channel
> configuration is used(no DT support). The setup_channels function
> pointer introduced in patch 2/3 enables different channel configuration
> approaches for various platforms.

Thanks, but this series (and driver) has to be refactored differently.
Please, go back to the drawing board and redesign the approach.
We have examples of the drivers in the kernel that are using platform
and I²C approaches.

-- 
With Best Regards,
Andy Shevchenko




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB92D2FEDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 21:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uFl3oKDfdgDVsrVPaUfSdATDprU9YfXfQFaxta9O1U=; b=G6oM5fKms3i0FbcVzOaZsnzeSF
	dlXZEWU7JqWpD0CMhKQ+imHNKgVXPY0PiRYu9Qi1cjCFUuTHC6gDFV9m/4HajfrTx/+iPpifUdA5s
	ZoSalQfXfTA8kH49Nk0V+48HcqQMNmk0tMUS+YDulekle0e13nBQ6qC1RY2Ip3iiWGplrnNk17Rcv
	hEKHjASqD18mzwXLj55FCkPHfo9wOPPi/Vq8WObJxIvakY6kvw3OCFPMfDuND2xdYj4/3ZqO6NKzZ
	KbTYrrnAFmYWuCY0ZsdKRiwcXIMh26n2sJ08qBY2LAqtycDFyaASgcYt5ax1NK6jvGHqshVgQp7f/
	vH/Kh2ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqX4-0000000F3pk-0Rfg;
	Tue, 27 Jan 2026 21:23:30 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqX1-0000000F3pM-3mJc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 21:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769549008; x=1801085008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j/bEiAaLxiyNGE+l2ZoC6cQsleLGLQuu/EyYdye+BFM=;
  b=CGpg3HiDjYO8InReeue4V0rNVONS4CbeDzs06wi8dH1nOSq1LBEb+ol/
   ufwPR6fs8FV4zt/4SPt3HjYTlY6pBLL2C6vxwoZlEVJlEtk+Ey6chtVlp
   XMP1iDjLY5QcGwPmRAh0qK0nLXXtVtR2gLujUrfYipFJ8ECBPeXyehPOx
   IeO3E8FPUbaEKW3UmJeL4wI3TT+Dvq8IPQet6Ql5o5VrzVxPBlCwqLN5Z
   mnofkUwrMTMjkXowVZ5nu7O93FKvZQNNt3cSnNvhwLmXiwdSNOgAquUZU
   3zb0g260OIHGAMZ9abeFjP9UmapSo0GQjJRTScOfiV8r1acX6fS5e2uBI
   Q==;
X-CSE-ConnectionGUID: k9iWt2K4RpKp2VT4tUYDlQ==
X-CSE-MsgGUID: h9+M5mNTTJybmAbDzUirKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74380483"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="74380483"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 13:23:26 -0800
X-CSE-ConnectionGUID: U0rKPD/dRZal4lvLbz2Yxg==
X-CSE-MsgGUID: JKAPTkMgQF+hD+HkK1dkYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="212628840"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.248])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 13:23:23 -0800
Date: Tue, 27 Jan 2026 23:23:20 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 0/7] i2c: xiic: use generic device property accessors
Message-ID: <aXksyEkisTZdiByx@smile.fi.intel.com>
References: <20260127-i2c-xiic-v6-0-e82e2f6f657c@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-i2c-xiic-v6-0-e82e2f6f657c@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_132328_010209_6DE9EF37 
X-CRM114-Status: GOOD (  10.42  )
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

On Tue, Jan 27, 2026 at 09:03:54PM +0000, Abdurrahman Hussain via B4 Relay wrote:
> Switch to generic device property accessors.
> 
> Switch to managed devm_ functions to simplify error handling.
> 
> Make the clock optional since the driver is designed to operate without
> explicit configuration in firmware thus making it useful on platforms
> where clock is not or cannot be provided.

Why the heck you ignored my tags?!

-- 
With Best Regards,
Andy Shevchenko




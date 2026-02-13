Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDCAEDF023
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 09:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2KOUgDcFEFjA2oAX03AycRAFQ5YR9TpFsjMw5VU4jI=; b=3r4Fsj3+8QQBmlGiZK43uewmgH
	q2M4Plc0WsL2YRrXKvSwEbpG3bbKlZxZYm3ftapwEOnswdfm7n3QKsYuSYK+Fj2iywFN+H0Mnm4TO
	E1DhgtbHX8QoaiNPLgsgvArm2bZESFT+WnX8eUMlSbpeGSg6DnJw7GrQxcE4723eIDODAfzhSM9Tg
	Y8VbgvASFJpdjDYdFISQ/O69hWC/bHRFU5A35sZmnU8yKIbztrFKykdyCPdRRWmytzWdhYd8qW/3c
	H2iHzVfkbw4DxLQWNFEBfoMAfCzhsldFD2V1pmpO6oeeOJUpbtWb6iefByyR0SZh+VlJ25wqrEIqG
	KZqoaD+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpVC-00000003Em2-3EDq;
	Fri, 13 Feb 2026 09:30:18 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpVA-00000003Elj-00IP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 09:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770975016; x=1802511016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J0bcRfH5Z4TISZ7oetitXov1i9wHdjUAj8HdvDE9waI=;
  b=VyVaIJ49yZBui/YWJNYcEAEABRDvhzjo6D4L4tJIPoWGALzBcNqpf85L
   X2BQSvL1lQMBKbJ4+F98143JkawtZ/CVAlFO5CxeF+Go6uUeK/DjKATvG
   yNm6nFPBJnz43SSIuFgP0RwScfM0oA471ERfCaZ+ANR/x9h53c7MvLhw9
   1J8N7UrKhP/nuJvRJ2QBJrS1G/D0Wyy1tL/EAuGp3flXfmNIFlt/3bfFM
   jA2jMb0r9wcrV9996rdmWzKKhMX6lnCjC0zni7Y/8Gl75q2abw6dOtpy7
   uWCklGJlhzhH9rkuoUXgv6IHmmrJgd1bd7wZkcQddl8UOwBZ0WxcVAjYv
   A==;
X-CSE-ConnectionGUID: MDwYpKjsT6CTBYYEGKuZDw==
X-CSE-MsgGUID: 8MD7IhJ/T2iPzTKTt15smg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="83526420"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="83526420"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 01:30:14 -0800
X-CSE-ConnectionGUID: 4vkFDKhCRsWVrissVOAFcA==
X-CSE-MsgGUID: N2UG2pWZR/Ok/wsI2L+FXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="250543332"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.242])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 01:30:11 -0800
Date: Fri, 13 Feb 2026 11:30:09 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v11 6/7] i2c: xiic: use numbered adapter registration
Message-ID: <aY7vIXNqZgoE_gI0@smile.fi.intel.com>
References: <20260213-i2c-xiic-v11-0-5d18aea11bde@nexthop.ai>
 <20260213-i2c-xiic-v11-6-5d18aea11bde@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-i2c-xiic-v11-6-5d18aea11bde@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_013016_057893_2FDD7CDC 
X-CRM114-Status: UNSURE (   8.63  )
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

On Fri, Feb 13, 2026 at 12:15:21AM +0000, Abdurrahman Hussain via B4 Relay wrote:

> Switch from i2c_add_adapter() to i2c_add_numbered_adapter() to enable
> platforms to specify fixed I2C bus numbers via the platform device ID.
> 
> This allows systems to maintain consistent bus numbering across reboots.
> On platforms where the device ID is PLATFORM_DEVID_NONE (the default),
> the adapter falls back to dynamic allocation, preserving backward
> compatibility.

Assuming that the statement in the last sentence is proven and tested,
code wise patch LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko




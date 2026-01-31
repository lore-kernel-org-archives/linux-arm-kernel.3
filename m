Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B2AD79767
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsn6do0H2U9fqgk1QpalGugK1rhqoeeLKs4fiTKdUyA=; b=Hb/aT+NbwII6c4SKZzDiRnGaOd
	/bg7ZBHwteH5szWBCPy0QWHN3B+S2zTtrh5NNFfYbroShleWzHurM/3Q6cZm7soStp/V2LZx5Na+h
	PIfjauYxRaxeOoWyKgmdztaB3Vo42Vo4lYjUD7KCnlMzWgfqpCIypMlDlqgeakl68lKZkfkO/ABTC
	yz8Fa3VZ76Ms0h7OphhfXILXxrnjwABfCGoYM4wh8N2Yjn8CEHfX60EYS20wiGVxuVhizJNaByxjp
	vi0fnCZswioi1almQbgntwzRKBOcDhoh0bbFkAWoN0PtcbqszrML5dXtDedIosFUMda3SeBCK5/UN
	UcNj7oHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm7yS-00000002Tk1-0uBD;
	Sat, 31 Jan 2026 10:13:04 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm7yP-00000002TjD-3aMP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 10:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769854381; x=1801390381;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bDV6Ml2elbMroNLtxz9Br8GhUvJQ9gJTZXYx2UqJoMM=;
  b=W0fnUXBkt09Xw3ZeEWKuTJez7pA9idr5OIt2dHVHPGPYEH6CmdHJt5lH
   u8jT1wm6u4chyhQhIvjA3rbMnOebyPmVJGCXnTcFhz88XV1l+/U7M/UF4
   uBjlyluOa26jr1+5DI29W2yjpM9qohpDEVYJx+sdLtfazQ+cKyg0D2KlO
   mnj/9whalVjkvnM8zvBuAKtJL/ZllVDEfEYnt6IRg7Y8/uiQd7Kr6c2B+
   JrTPBlz6+AmQMgLwo3hrIVKmrkbeHUVN/tNVbuqzJjosDsDlUhEO2hJTY
   TrMGGyYcHpAl1G8cxRAMVn+SvbPvMtNPpzhDMy3Z5YGWNBzB504Dc5DDy
   g==;
X-CSE-ConnectionGUID: aZdcuyziQ2uW+RILYQKG+Q==
X-CSE-MsgGUID: F4ZDf1AbQS2LDt3WaOVgxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71176680"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="71176680"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 02:13:00 -0800
X-CSE-ConnectionGUID: Y9P1ZjhcQLa7lIeELafqxQ==
X-CSE-MsgGUID: EyfjgURpSt+yQA0l0FBXSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="209456821"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.97])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 02:12:59 -0800
Date: Sat, 31 Jan 2026 12:12:56 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Andrew Lunn <andrew@lunn.ch>, Michal Simek <michal.simek@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/6] i2c: xiic: skip input clock setup on non-OF
 systems
Message-ID: <aX3VqGlIUGCvMY5p@smile.fi.intel.com>
References: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
 <20260129-i2c-xiic-v7-1-727e434897ef@nexthop.ai>
 <ab9dc191-59c1-40a9-bbf1-e6c082af128a@lunn.ch>
 <2428D892-89F9-4013-9681-AD9BD76B0874@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2428D892-89F9-4013-9681-AD9BD76B0874@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_021301_922147_21B4B4BF 
X-CRM114-Status: GOOD (  13.80  )
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

On Thu, Jan 29, 2026 at 03:29:45PM -0800, Abdurrahman Hussain wrote:
> > On Jan 29, 2026, at 2:43 PM, Andrew Lunn <andrew@lunn.ch> wrote:
> > On Thu, Jan 29, 2026 at 09:43:13PM +0000, Abdurrahman Hussain via B4 Relay wrote:

> >> The xiic driver supports operation without explicit clock configuration
> >> when clocks cannot be specified via firmware, such as on ACPI-based
> >> systems.
> > 
> > Are you saying it is technically impossible to specify a clock in
> > ACPI?
> > 
> > Maybe a more accurate would be:
> > 
> > The xiic driver supports operation without explicit clock
> > configuration when the clocks are not specified via firmware, such as
> > when the ACPI tables are missing the description of the clocks.
> 
> Actually, ACPI (since 6.5) added a ClockInput() macro that can be added to
> _CRS of a device node. The ACPI subsystem in kernel could parse these and
> convert into proper clocks integrated with the CCF. But, AFAIK, this idea was
> rejected in the past.

Rejected by which side? CCF?
Because specification still has that.

-- 
With Best Regards,
Andy Shevchenko




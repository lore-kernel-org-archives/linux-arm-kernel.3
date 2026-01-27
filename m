Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80919D13C1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GJKa7xLlmSaeeYe4REc3fsB2deMuanDC2PSrKRfYtg=; b=QH2M5jup1xMYZeDY2wi76T1EsT
	FXohgUfzCQXJRoQ/NtmDdfe3kL/o+r8IzhJo6nUdxxrGx1vBCrjQ0DQDZ+t6U7f0wtZicbKRdI8m4
	fz0GBp/zMaZoc2IAtdt50VVv2U0oa1VDNd83FjqPLdEsE22xLxfEauKDnbE0D5QvaCmvuB3BovJ9k
	0HnJJXA8aLWfXFsnVjuomywmG8UoxdQqsGiY9HkbCW3D8+L01b06xmxcM4PsGr/VsxfnidE+AGsh4
	/0nD6a0EE+i+Di3cw60VSc4ct+Yt86m5w+OSeV+dmtnxe5AhmXtPJFoEgNgB6G3VCQGEtnsi2CODX
	1JYkZ4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfUa-0000000Dx6G-27Zg;
	Tue, 27 Jan 2026 09:36:12 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfUW-0000000Dx5b-0XUE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769506568; x=1801042568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B7DFX5lqbjM4djzDpxG9RwFOYzDx+Gb3DTdEDYClDgY=;
  b=fk91wynQeY5HY6m85CjKxll84cRN1lAgZhUn4WigcsGFI4fsH5bcGNP9
   fqbAGihz18cj7S/9IQ4DAEJhkbLGAjEE4Le2l6VtxIWf87c62VDYsGea/
   9pwLLExQ4Loeo5yYYABMAiGVne3sBVrrozGXxqfSbrMjZt+7c8fnCUtXq
   m1QRtYlHlra76k2Lx4G/kxdHLcQRvauV9oamMca/2zZ+9RHMUkGeHgUZD
   Li6fv30TsQUKACtDuKy0wro5x1wTpwWsYDNWwm5KOObPguL0pR7ZaaHpw
   Rn70hlAxhlYU8YAnWfT3rYVsVLfVd+xlrZjgNXbodk/jFP+lideCd80KV
   Q==;
X-CSE-ConnectionGUID: Kw1A28XVRNOqjjxL3MQTkg==
X-CSE-MsgGUID: xQjexuESRNSbI0s4wT4icQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70591296"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70591296"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:36:07 -0800
X-CSE-ConnectionGUID: guJ6KiTnRaiQ+vatan35aw==
X-CSE-MsgGUID: ZsJuwkAhRx+Hvslj9xkPuw==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.248])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:36:05 -0800
Date: Tue, 27 Jan 2026 11:36:03 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/6] i2c: xiic: make the clock optional
Message-ID: <aXiHAzsmQ46mYTbF@smile.fi.intel.com>
References: <20260126-i2c-xiic-v5-0-88a16a28721c@nexthop.ai>
 <20260126-i2c-xiic-v5-2-88a16a28721c@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-i2c-xiic-v5-2-88a16a28721c@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_013608_915271_3DA179A7 
X-CRM114-Status: UNSURE (   9.91  )
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

On Mon, Jan 26, 2026 at 05:08:17PM +0000, Abdurrahman Hussain via B4 Relay wrote:

> The xiic driver is designed to operate without explicit clock configuration
> when clocks are not specified in the firmware. This functionality is
> already implemented in xiic_setclk(), which performs an early return when
> either i2c_clk or input_clk are zero:
> 
> This condition is satisfied when clocks are missing, as clk_get_rate(NULL)
> returns zero, allowing the driver to rely on hardware-configured timing.

Bingo!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko




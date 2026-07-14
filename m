Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCEEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeMf/eY4qjjyu9X8QZzKnRIFUsj+vQtSNZbDufBDUp0=; b=zMSAPXv1bdFple8FoMNMijudhJ
	MzkxwqVMiCibKwnfWaDFY4O17vYTobPPXkGtdQVkDGm5PIfhbBZlzGwV4kN36UevHSsCwtDatU3bM
	hXwRO4kb1CmWclR3uZWAWlaXAWFQQ/mGOsCw4BMo+Xf3p4qrrekquafJ+k8mZI6wzhh2w8O4PVo8z
	Dpm91QwaIudklZ/Qv9royQi0MorFSpRzJCdV+ESFzK1rEhK0yJlBmHHURXMmMbZWGBzFe+D7AOlgQ
	LHljpSD01MbVfVaLxJtCZIHLLJhGqT+j4VMGQu/swriA2bCM815ME3VvZG3F3DUiPsEcgqCBICZT/
	z7az5QBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYpv-0000000BMK8-11k9;
	Tue, 14 Jul 2026 08:49:55 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYpt-0000000BMJl-0N5p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784018993; x=1815554993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+E7FMZfjaMpGYXNkxgxHTecyjtzcJGKD+XR1OvEDBsA=;
  b=cTEuXRckQLTHoIBOzAWj9ANVNz7tTJFh+TlMSX9RLZ2dncmywD33AfSL
   as4p58ICLem858tP7155neig5bgzwiMrR5hTW7BVSy4A+78fggIt4/A9u
   vWg4xszaYQULXdJUqrvEZR4YAT1eqIiNslMjcdms9SplKZdStYFLqtulD
   OPFAcg5jE5zlR+cUfGh2q46vyqWQls1CmhT6wnfaabYVPFA3NCFWrAV0U
   WVe3cgw9GxB6mWdGgF9ve/I8fvCdjAwkcZz3LxmcnigzfeqT97xkl5MgT
   aO0rYUn3AZrN3NajvjUhxvA6ezxHEqbZi5lzWzPSjsb7iUuYiltjCRZPz
   Q==;
X-CSE-ConnectionGUID: KlNABbhWQm+b0vcvjOC6qQ==
X-CSE-MsgGUID: 9Sh4QKX/TlqH+02WHeNR9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84755992"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84755992"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:49:51 -0700
X-CSE-ConnectionGUID: EEd/uLT1TvGHqn1QHAWiFw==
X-CSE-MsgGUID: 4JYHRuwTQEC0U62oxVTcNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="285879297"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:49:48 -0700
Date: Tue, 14 Jul 2026 11:49:46 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 2/7] i2c: mux: add idle_state property to i2c_mux_core
Message-ID: <alX4KrhAr6ysaaQJ@ashevche-desk.local>
References: <20260713-i2c-mux-v11-0-72bb8af8ee8c@gmail.com>
 <20260713-i2c-mux-v11-2-72bb8af8ee8c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-i2c-mux-v11-2-72bb8af8ee8c@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_014953_144712_D7F9B397 
X-CRM114-Status: GOOD (  11.74  )
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

On Mon, Jul 13, 2026 at 09:19:58AM +0200, Marcus Folkesson wrote:
> Muxes treat their channels differently when idle.
> Let the mux core have this information to make it available for
> internal use.
> Reuse the same state values used by CONFIG_MULTIPLEXER.
> 
> Possible idle states are:
> - MUX_IDLE_AS_IS: Leave channels as is when idle
> - MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
> - <n>: Enable channel n when idle

Here and in the comment in the code I would elaborate a bit to justify signed
type for the field. For example, put it as

  " - <n>: Enable channel n (starting from 0) when idle"

> Default value is set to MUX_IDLE_AS_IS.

Otherwise LGTM, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko




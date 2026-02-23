Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EA0EA4FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 15:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQKnlwnY5Kx49VSTkQ++BDaUF3P4xQtcU/Q3W4t1Kv4=; b=pu1d11J8NU7FJHmxGoJL6ZbYep
	Xg00+RqZRNo52uGoH6uJSpd3u2vAHGwC8LwqPjrn9y2C9xaogqGQRpTaRZRkeASTMdvc35GvR8Xko
	tmuWnvj44c+E7To1L5i8LlpUJTFig15yYAmcam9DSlDmSpVb8ia5naHyrM9Q7zt9GeDa4hJznk59E
	YOzx+L6GNJCXTkbXbam6PL9I12ZUFuBUklTLfj7rvwNYn40yHgW20gl9I3sZnm03sNIwYVAZQw2fz
	RuXl8IjLFsPvor0TfpHEEFHZVpUkrXjCyoxo2B4I/VQiEJeF2/Bm+AMnIj2mP5YCzRCuSrxDzL74s
	TsNBfY+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXR3-00000000XVE-3Ksq;
	Mon, 23 Feb 2026 15:01:21 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXR1-00000000XUW-3W19
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 15:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771858879; x=1803394879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dN8m8k43WpMaWS8vB4HV6uZ0DEcxBZq5ecRCAj/+QNw=;
  b=W9cXDJZsBpzwEEonNRHTNSFmW2KyICiRXH42DpJYqA0ylxL1A2IkPY4+
   Wkyf7g5wn19yGNNIDmEzzMlOFGDJkA/5IhzTVjlj7rD6PgXip7DIKVI9k
   7Dp+mvp9LJnUkstsSWHey0elL6FBEbWDYMQ4x0+9U9gumhUHGz7yS+dQg
   bf41tU2CyP71fK2qGchnQlM0lxwHOuvCr3k418zqTDT7TGv/Cv2y5ZJx8
   pzZbdMHZDzxIOmr7HhIPZ7hkioMcIglAyP26K0sI5+xt+brufHsJhwdi2
   ludP++MLGBk9RLxVMHd/kLG44A9+414ob5ErvX7N7Dx7IqnxIK55kAKjC
   w==;
X-CSE-ConnectionGUID: TpyHcGjjQOycKlfCEHmvyg==
X-CSE-MsgGUID: i/2j2PZbT+Kn9/QT2hjgJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73030945"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="73030945"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 07:01:09 -0800
X-CSE-ConnectionGUID: KN3As6DRT4qD4KrQRTxh4A==
X-CSE-MsgGUID: fGf7C4b4R+GkTp6MYnaUaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="215729960"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 07:01:07 -0800
Date: Mon, 23 Feb 2026 17:01:05 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 4/5] i2c: davinci: add support for setting bus
 frequency
Message-ID: <aZxrsTXVZpgRy18X@smile.fi.intel.com>
References: <20260223-i2c-mux-v7-0-ec75b214718a@gmail.com>
 <20260223-i2c-mux-v7-4-ec75b214718a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-i2c-mux-v7-4-ec75b214718a@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_070119_945130_67FEBE97 
X-CRM114-Status: UNSURE (   7.53  )
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

On Mon, Feb 23, 2026 at 03:33:53PM +0100, Marcus Folkesson wrote:
> Populate adapter with clock_hz and set_clk_freq to enable support for

.set_clk_freq()

> dynamic bus frequency.
> 
> Remove bus_freq_hz entirely and only use clock_hz instead.


-- 
With Best Regards,
Andy Shevchenko




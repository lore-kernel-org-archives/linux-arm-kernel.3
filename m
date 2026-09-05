Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C491C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 08:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f3IkQdGQFUUL8PgksUeiwLtNl/yePASqx24LFOIJeZw=; b=2/gcUlEoloWRNplEjkxMNqucVB
	OnVkQCJWyVJVr3yecj2LxIKgkH9uFjYGqJ53IvzwwPGFdh0YICeIgfJFkYf4s0OES+rV/cLfilkEM
	qozOYtXrKgEQJSheLTNsAFBA0y2dBIMkNg97J+czo746NahaQjix7Z2cgyyXijr7eTIslBwr/WKZF
	6v9SxUGcTRz4YvwzRdnhFMzzegMfGenY5j0s3bQwll02/rfVVyqLyBOLZb56+2cwGai0nnmZ01QNM
	+csj0xrXHE4WEKNeofDauzuTT//um3yCpYaID0MwwJ9euqwUNkwyIJngpyO68PAvzx6KoT+7Wi6/j
	7/93t6wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lVe-00000003q9l-0kL2;
	Sat, 05 Sep 2026 08:12:22 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lVb-00000003q9C-3eAZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 08:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788595940; x=1820131940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=twGdAWZBZ05fb4+QLfejbwpApFgNt4hwjf7CHvu6qnY=;
  b=YQ7QzYlvmOSG6MDnW5WXFErMOdUKyc5nqIuSfPWoJ4HjN+TVbaOyLD6j
   mS/vFog0OlTulMZm4AYIswwAlYhTkP1B7J3qR2O5fFjmtlcALQPoi7ihF
   hrrCfyzoI+6ck4nJfFvFZ7Rl3h42MBrZKcoxSmwkK9Bu8gjf9obHqX2gn
   Wfh2tGMgjIqxQMi/cHGVYS0LdyNU3/l4NKVgnLJRAbveH8Cxhc30umlU0
   si8liadWM9hAVTHrTjNhC2QGAJBWaqnH6vX2V/9GOLvavVDEzfN8QQ5gj
   civLsOtSND1k/H6KWoPs+yMAcLR4nMpFHvIsMCsXse4KZcobFVFvshQrn
   g==;
X-CSE-ConnectionGUID: RTQZy9c5ReOC/3dCDkjMpQ==
X-CSE-MsgGUID: TmiNakNmTFiJW2+c+PQzwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88963855"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="88963855"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 01:12:19 -0700
X-CSE-ConnectionGUID: d2AoCfycRCqiwUVlTWIAKA==
X-CSE-MsgGUID: u75Jy/s6RFWx2r+1s2JyTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="274067004"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.105])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 01:12:16 -0700
Date: Sat, 5 Sep 2026 11:12:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Viresh Kumar <vireshk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/4] dma: use designated initializers for acpi_device_id
Message-ID: <apvO3uWUEYX-I2pp@ashevche-desk.local>
References: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_011219_920688_39D6EAF1 
X-CRM114-Status: GOOD (  18.26  )
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

On Fri, Sep 04, 2026 at 03:10:39PM +0100, Pawel Zalewski wrote:
> This series is converting lists that contain the acpi_device_id
> struct, which is defined in the include/linux/device-id/acpi.h
> to make use of named initializers (which they do not use currently).
> This work is part of the on going effort in the kernel associated
> with device-ids [1]
> 
> The plan is to convert acpi_device_id::driver_data to have an anonymous
> union, similarly to what was introduced for PCI and I2C device ID tables.
> The goal is to increase type-safety (as most of the existing casts are gone),
> to improve readability and to make use intent a bit more clear:
> 
> ```
> union {
> 	kernel_ulong_t driver_data;
> 	const void *driver_data_ptr;
> }
> ```
> 
> But for that to work all lists containing the structs need to use named
> initializers first to avoid triggering -Wmissing-braces. I already have
> patches that implement this and touching a lot of kernel subsystmes that
> use the acpi_device_id struct and that list keeps on growing. Therefore,
> I have decided to split the series per every subsystem into:
> - pre-clean-ups that convert the lists to use named initializers (this series)
> - actual implementations that make some of the modules use the new driver_data_ptr
> 
> That way the task can be fragmented into manageable and independent
> chunks of work and makes this effort easier to review.
> 
> Tested builds on x86-64 and a64 in Yocto using 7.3-rc1.

All good to me (with what Frank suggested)
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> [1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

-- 
With Best Regards,
Andy Shevchenko




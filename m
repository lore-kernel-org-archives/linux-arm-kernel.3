Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CA5C44529
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 19:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0iCIEUW10O2kbnfX6KiwVUa+mnyTLrVr4tfL904/Vw=; b=oELJwekxB7uwGqnvywWuYaXL+9
	AMkWrSJmXVeieRCtbmZ9DJTSpym9OXfubI+veX2nLF9aZX/Wdaxw827PV2xbm2ZvveS6GCfLa77WI
	bbPOFdP/P2KzSSzzQmQ8uD8H+Bue06rGIpNvGhbafHPta+GoXBl3BEUb7xDX+Bcv3JuEPpIxnKEpc
	ayidZD0lq4IJHcCZcqa0344u0LtFgE7lVkEoi41TBosmS6Ggp8Tq5zofE2/F51QOaTAx8xEnE5igz
	NbMphFSZb9sU+MjL5tMdCHtz9HMY9PmpLsWm0aypcVbTTXHPV6c7c72wX7zVDTRYHnSy5wxc5df37
	5uqYaTyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlu9N-00000007ob8-2Vrg;
	Mon, 20 Jul 2026 19:59:41 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlu9L-00000007oak-2Itd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 19:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784577579; x=1816113579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5nBWDPcmFe0n+me7Aphp9FEdrZbw0OAsproebJUVPfo=;
  b=RdD1wjUTVPoGRZLgFWQV9JG3WIH3uyIc8t2Xiv7MsSizcZF1Py7iSzqy
   uYR+YW1ae1cQUoaM0pdP2OKBYRStXleJB7s9aPXeEgKwovHpi6XENq6By
   E3D5d0Z2iqqOdhCLp/Gz9bQI7N95RTs9ae/qMKV85Q8NsnLDCjtMRrIDM
   cskuKUJzmjl8DGdYKncqYC6qu1vD+DLw2PKfvj9lV/JdYQqoJOSLg5Z8X
   iez9oXN5zIKWpjRl+FOVbMrTZqn5PcSYsS2mcNMSlOc6HsXyOaeWFtbnH
   VRahYG20FyBkZ+Nw25o69OS0FlVQn+aaAHj88lDxVTF8rM6Oaj3gFa8c1
   Q==;
X-CSE-ConnectionGUID: PtQl1DIrRea/2mcZG7Cgqw==
X-CSE-MsgGUID: DbV27P8hTfiM7zqG19vAfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="96680607"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="96680607"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 12:59:39 -0700
X-CSE-ConnectionGUID: eIrH41XgSc6mjV9zSfN6lw==
X-CSE-MsgGUID: fSuRV11BSymJPi12DM5ZSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="295761514"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.175])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 12:59:36 -0700
Date: Mon, 20 Jul 2026 22:59:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shih-Yuan Lee <fourdollars@debian.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 6/7] spi: pxa2xx: restore LPSS private register state
 on S3 resume
Message-ID: <al5-JasTYF5r8A-j@ashevche-desk.local>
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-7-fourdollars@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720162117.32304-7-fourdollars@debian.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_125939_635602_9874B08D 
X-CRM114-Status: GOOD (  17.00  )
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

On Tue, Jul 21, 2026 at 12:21:15AM +0800, Shih-Yuan Lee wrote:

Is this series AI-assisted?

> Intel LPSS SPI controllers lose all private register state across S3
> suspend because the LPSS power domain is fully removed. On resume the
> driver only re-enables the SSP clock, leaving the LPSS private registers
> in their power-on-reset state, which causes two problems:
> 
> 1. LPSS_PRIV_RESETS (offset 0x04 within the LPSS private space) stays
>    zero, keeping the functional block in reset. Any MMIO access while
>    the block is held in reset causes a PCIe Completion Timeout and a
>    watchdog-triggered system reset. LPSS_PRIV_RESETS_FUNC and
>    LPSS_PRIV_RESETS_IDMA must be de-asserted before any other register
>    access on resume.
> 
> 2. The LPSS software chip-select control register must not be blindly
>    restored from its suspend-time snapshot: if CS was asserted at the
>    moment of suspend, restoring that state corrupts the first
>    post-resume SPI transaction. Instead, call lpss_ssp_setup() which
>    unconditionally writes SW_MODE | CS_HIGH (idle/deasserted), matching
>    the state established at probe time.
> 
> To resolve these issues safely:
> - Wrap S3 suspend/resume with pm_runtime_resume_and_get() and
>   pm_runtime_put_noidle() to guarantee active clocks during MMIO
>   access and preserve PM reference counting.
> - Restrict LPSS private register save/restore to LPT, BYT, and BSW

^^^^ (1)

>   platforms via pxa2xx_spi_need_lpss_restore() (newer platforms are
>   handled by intel-lpss.c).
> - Save only the first 6 LPSS private registers (offsets 0x00..0x14) in
>   drv_data during suspend, avoiding reserved offsets beyond 0x14.
> - On resume, de-assert resets first, restore saved registers, call
>   lpss_ssp_setup(), and clear drv_data->suspended to prevent unclocked
>   IRQ access.
> - Add error recovery paths for spi_controller_suspend/resume failures.
> - On the resume error path, call pm_runtime_set_suspended() before
>   pm_runtime_put_noidle() to align the PM runtime state with the
>   already-disabled hardware clock, preventing pxa2xx_spi_runtime_suspend()
>   from attempting unclocked MMIO via pxa2xx_spi_off().

This is an ugly hack.

Saving context is done in drivers/acpi/x86/lpss.c (see #1 why this file).
If something wrong in the flow it has to be fixed there, not here.

-- 
With Best Regards,
Andy Shevchenko




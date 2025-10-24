Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12C8CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 07:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhsHCTfGl4yNGIuoCeRVSA35xVWQ3pWFORYoj0BUU8c=; b=uU17a89Eu2xTVwvfXRpSg3j9MR
	dSrPhHXdYvqC1ZnLTTU7btdm1U3ET4LBApmlAKYcGv0hlnron58Qu0P0lrXpISze4GpN5C/cPfFNH
	GSaYpA+mQW+sn4Q+sdK9MSmmSzzg/+7W0ogF1q6hj/xfykxmAaax/FHx55ZZGxtn7yWYL4YSDDBog
	Gun7XDHUinh/LvkVbPGX7DRE/53so62umKAfaXAhx0WzvcRRYzf5PKF9ydRmzaxNnGpGVLFo+Yvta
	BbumXUEorwtNFeRULdgGn29qRL7DjT3sCxRVcPhq9xa3N2OBzo+KWbNRCKQ0dqln7972Fj2cbbQxQ
	/Rbem4ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCC3M-00000008SNj-2Grg;
	Fri, 24 Oct 2025 07:17:36 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCC3J-00000008SMK-2ZxM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 07:17:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761290253; x=1792826253;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rMGxKZ0Ruy3iCUh4rd6b4PVfetuW2zT8H06yJpAOPnw=;
  b=MmGmTi/ooGDYnXlT9vxzpTbUFtx/PHVAxO+m/90BEuSDBm19xvNS5b7K
   biD8B1H/hcetH/J6QCPFH5WfI8G2d8h/X35fAmMdIcxm0wVGhGKkZa76M
   2JHDm/LWrMWBB6Y2/hoLXMIwMFvmp6znYDi+WJkDKohZMog071lqa2Hzx
   s7c1Br7Yxq7ROEeecz8OCTpcz5Kdxc4ArVbxb+ndtmu7BNooAR589oC20
   weZhYCHLqkU8Fh7rAgKKnjSLFTAxasmPe+M4vDjKo981t6tkbEOb3M9wD
   dSEnoT65JfrtpFYmIGG1eIeDg49NoVVO0s8fBIgQyt3OjQRpo6vYr9Zhm
   Q==;
X-CSE-ConnectionGUID: B5GVQf2/SUCLLrlGSAgMBQ==
X-CSE-MsgGUID: TshxSa1DR6eZP0wy685viQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74140906"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="74140906"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:17:32 -0700
X-CSE-ConnectionGUID: 6dbO8RbwThiKWhQmjgGvLg==
X-CSE-MsgGUID: Ro2zwlh4RQa3GJViwyA9Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="189488248"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.211]) ([10.245.246.211])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:17:21 -0700
Message-ID: <db05003c-8ac5-49da-b0ce-e0b668f49caf@linux.intel.com>
Date: Fri, 24 Oct 2025 10:17:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
 Mika Westerberg <westeri@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_001733_664516_88FFFC43 
X-CRM114-Status: GOOD (  32.04  )
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



On 22/10/2025 16:10, Bartosz Golaszewski wrote:
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.

I had few stabs on this in the past, all got somehow derailed, one
example was:
https://lkml.org/lkml/2019/10/30/311

> The proposed solution is composed of three major parts: the high-level,
> shared GPIO proxy driver that arbitrates access to the shared pin and
> exposes a regular GPIO chip interface to consumers, a low-level shared
> GPIOLIB module that scans firmware nodes and creates auxiliary devices
> that attach to the proxy driver and finally a set of core GPIOLIB
> changes that plug the former into the GPIO lookup path.
> 
> The changes are implemented in a way that allows to seamlessly compile
> out any code related to sharing GPIOs for systems that don't need it.
> 
> The practical use-case for this are the powerdown GPIOs shared by
> speakers on Qualcomm db845c platform, however I have also extensively
> tested it using gpio-virtuser on arm64 qemu with various DT
> configurations.
> 
> I'm Cc'ing some people that may help with reviewing/be interested in
> this: OF maintainers (because the main target are OF systems initially),
> Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
> in audio or regulator drivers and one of the goals of this series is
> dropping the hand-crafted GPIO enable counting via struct
> regulator_enable_gpio in regulator core), Andy and Mika because I'd like
> to also cover ACPI (even though I don't know about any ACPI platform that
> would need this at the moment, I think it makes sense to make the
> solution complete), Dmitry (same thing but for software nodes), Mani
> (because you have a somewhat related use-case for the PERST# signal and
> I'd like to hear your input on whether this is something you can use or
> maybe it needs a separate, implicit gpio-perst driver similar to what
> Krzysztof did for reset-gpios) and Greg (because I mentioned this to you
> last week in person and I also use the auxiliary bus for the proxy
> devices).
> 
> Merging strategy: patches 1-6 should go through the GPIO tree and then
> ARM-SoC, ASoC and regulator trees can pull these changes from an
> immutable branch and apply the remaining patches.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes in v2:
> - Fix a memory leak in error path in gpiolib-shared
> - Drop the gpio-wcd934x fix that already went upstream
> - Free resources used during scanning by GPIOs that turned out to be
>   unique
> - Rework the OF property scanning
> - Add patches making the regulator subsystem aware of shared GPIOs
>   managed by GPIOLIB
> - Link to v1: https://lore.kernel.org/r/20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org
> 
> ---
> Bartosz Golaszewski (10):
>       string: provide strends()
>       gpiolib: define GPIOD_FLAG_SHARED
>       gpiolib: implement low-level, shared GPIO support
>       gpio: shared-proxy: implement the shared GPIO proxy driver
>       gpiolib: support shared GPIOs in core subsystem code
>       gpio: provide gpiod_is_shared()
>       arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
>       ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
>       ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
>       regulator: make the subsystem aware of shared GPIOs
> 
>  arch/arm64/Kconfig.platforms     |   1 +
>  drivers/gpio/Kconfig             |  17 ++
>  drivers/gpio/Makefile            |   2 +
>  drivers/gpio/gpio-shared-proxy.c | 329 ++++++++++++++++++++++++
>  drivers/gpio/gpiolib-shared.c    | 530 +++++++++++++++++++++++++++++++++++++++
>  drivers/gpio/gpiolib-shared.h    |  71 ++++++
>  drivers/gpio/gpiolib.c           |  70 +++++-
>  drivers/gpio/gpiolib.h           |   2 +
>  drivers/regulator/core.c         |   8 +
>  include/linux/gpio/consumer.h    |   9 +
>  include/linux/string.h           |   2 +
>  lib/string.c                     |  19 ++
>  lib/tests/string_kunit.c         |  13 +
>  sound/soc/codecs/wsa881x.c       |   3 +-
>  sound/soc/codecs/wsa883x.c       |   7 +-
>  15 files changed, 1067 insertions(+), 16 deletions(-)
> ---
> base-commit: 304d18863e6e62a8f2d0350ce0a59596e2e42768
> change-id: 20250908-gpio-shared-67ec352884b6
> 
> Best regards,

-- 
Péter



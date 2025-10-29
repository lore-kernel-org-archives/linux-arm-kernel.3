Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F272CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VdtYvebGhP8pWLWcHJ8Gx9a9ZCcvroHCTEl3W85fQA=; b=pkZ9LIka62zAQDx+YisZm/nR0/
	UB4WbFY+3ctNZ6/WzNfwDtb2WDd3NTNmzhLPMN62JFDYfYMOBwG/Oh9hB87Qlm/3tTK7X7PYhyxwy
	NZ1iNTkEAXIdZ1QGHA8AWeiUw2QDnY6Mhs7NQguxHSfH4IpZOoA0XX8lne3XW0R3FRMuQ8bB7Dj9/
	PozWDewXY9aIjkFxRePGLOkrPo4nAJdpx01/A/AIplz/EQmCP2dDZbCj93T9eoxEKz7cxPgHEeqMc
	eNNVB2KTlYrvaSeK11gLIaZ9dgvf5DqAnoYgsZnV25XULeEioqTWyv7l5QAsv344ZiRhPxsW2TOzX
	9W0LgN9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Z3-000000011sg-2zZr;
	Wed, 29 Oct 2025 11:42:05 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Z1-000000011sG-1gxt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 11:42:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761738123; x=1793274123;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CWuanT4v89ELYuCd8YftnASQ94vUasO0QCGZu7kMtN0=;
  b=i3iHezbNQzMWxvLEaFTK+GAWyMoLXvCici0LsbgU6y3rL5F2m5sghavu
   wnivl1wVXtpX6gGupNw526ZYaRdjcbtAlObIdQfODzxMz8YSFGbE7XXcy
   9byZpWmJRol9CE6ICG+REqd8lVUro2efiiiUnuPQq/ymUdB6kOyD74wxX
   MprO/uqA+FBWbGOQ0Df1XW9n+kAfFk4WsaB5ew13M7FtYwmYmrImG8fCu
   xfPp1cwD64BCigR2Ztbc0adKZLT+UwD8bRDd0t6nFkHU3eWj4rY1mSYFR
   LkakjVSmrwoMuB8QKoBnrt1xZ8RCXfO4FaNMXDnyXG7yfGGoQRc4LSD1c
   w==;
X-CSE-ConnectionGUID: oqk5vHY0ROqL01xpdaN1zg==
X-CSE-MsgGUID: q5j1ebDtRWSBP+6ZHf0Tdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="74532699"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="74532699"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 04:42:02 -0700
X-CSE-ConnectionGUID: 4nHoIBj6QnSvV/LLtgGNBQ==
X-CSE-MsgGUID: Tm0xW4g9SaCREL+ybcXZHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="189702787"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.248])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 04:41:55 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vE4Yq-00000003bB9-1kAi;
	Wed, 29 Oct 2025 13:41:52 +0200
Date: Wed, 29 Oct 2025 13:41:52 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 01/10] string: provide strends()
Message-ID: <aQH9gE_fB119CW3l@smile.fi.intel.com>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-1-71c568acf47c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-gpio-shared-v3-1-71c568acf47c@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_044203_455339_AA74B0DB 
X-CRM114-Status: GOOD (  14.81  )
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

On Wed, Oct 29, 2025 at 12:20:37PM +0100, Bartosz Golaszewski wrote:
> 
> Implement a function for checking if a string ends with a different
> string and add its kunit test cases.

...

> +/**
> + * strends - Check if a string ends with another string.
> + * @str - NULL-terminated string to check against @suffix
> + * @suffix - NULL-terminated string defining the suffix to look for in @str
> + *
> + * Returns:
> + * True if @str ends with @suffix. False in all other cases.
> + */
> +static inline bool strends(const char *str, const char *suffix)
> +{
> +	unsigned int str_len = strlen(str), suffix_len = strlen(suffix);
> +
> +	if (str_len < suffix_len)
> +		return false;
> +
> +	return !(strcmp(str + str_len - suffix_len, suffix));
> +}

Can you rather re-use strcmp_suffix() from drivers/of/property.c?

-- 
With Best Regards,
Andy Shevchenko




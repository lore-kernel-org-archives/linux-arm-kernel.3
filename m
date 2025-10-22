Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BBECCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 15:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4otkAiJIE5kQreYn4apMXAE7QM9ZCag6i3A/3vNxINY=; b=cWZknpEEyWmRLnF4+JsB84kdll
	WPAQ/EpunWTjjNWksCgXRo3eZ/5/UoSYaoc8HP5ykN7QjQ6zzF6DXRcMdKcrdw1xLMNPey39E3aHW
	3+UpnWT6zoy77X+BbtEcuJL7czXR72au8fQAInFDG1DzsRlAjw5Y53cDG384NxFPLtF59FwFcvYeO
	bsrJIMZJI9GOGYcyZu1i7jrU+T4SYE87Qx2fede1FmF1LK8b0Nnk2lcP3d1tCkvQnnipZXeB0JaCb
	MuHiae6uMoWn4+uhgiOhJpe0EFJuJ0jUBB3g/OvYlhijpV5DQ01zV5YTe9Gjc0DpeULF3I+IOEvJa
	LRwbJqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBaiv-00000003OR4-0KTY;
	Wed, 22 Oct 2025 15:26:01 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBais-00000003OPs-1yFz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 15:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761146758; x=1792682758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n5qJuWlLlHVuEXG7O8FDK5axC/YJ5rWbYgBY3q+c6wI=;
  b=gVW22chXwtwUUCaEwDhii1NcYXXxLiNXZBlPXZwkH9+TmcjwGfZBnIAu
   Hog/VUtSi/SGn74OLeNRZVlrYIXUYyZKUaiybFTXQC8WMIWPpI7l1V+ta
   xHf3lzwKU0SsAa2QI96rvXGq0UMEbCLxvQpoOGyM5QPHiZE0iJAuHXP4u
   4LJ8fuToWtkg9AsOUVF2jHxLYA0+hL/DlzoOfTTQdRoofeCite8UXOQFK
   tyoBo0bKnuUZTOwV9w44zUdgq3dOCJTrPoqUXeeTSjTD4Xt9CKGf2Cimy
   QINilU3Am/GnGgJPjzXBvcPaM/mXF3ELP/r3ZT7EzZfaEEV+ttdlqLUyn
   w==;
X-CSE-ConnectionGUID: lmbz8Z5ERHKOHPEYZbv2aQ==
X-CSE-MsgGUID: 6106TUtdQsazQBgjz6gMiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62509292"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="62509292"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 08:25:58 -0700
X-CSE-ConnectionGUID: 4nAf6deMREqTFG3FaCY/0Q==
X-CSE-MsgGUID: xAGf+JgZSgmEWj5zMBbbQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="221093692"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.83])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 08:25:53 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vBaii-00000001jE0-3r3l;
	Wed, 22 Oct 2025 18:25:48 +0300
Date: Wed, 22 Oct 2025 18:25:48 +0300
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
	Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 01/10] string: provide strends()
Message-ID: <aPj3fCYj-NQdDSQT@smile.fi.intel.com>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_082558_536885_4A726DC3 
X-CRM114-Status: GOOD (  11.92  )
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

On Wed, Oct 22, 2025 at 03:10:40PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Implement a function for checking if a string ends with a different
> string and add its kunit test cases.

...

> +static void string_test_strends(struct kunit *test)
> +{
> +	KUNIT_EXPECT_TRUE(test, strends("foo-bar", "bar"));
> +	KUNIT_EXPECT_TRUE(test, strends("foo-bar", "-bar"));
> +	KUNIT_EXPECT_TRUE(test, strends("foobar", "foobar"));
> +	KUNIT_EXPECT_TRUE(test, strends("foobar", ""));
> +	KUNIT_EXPECT_FALSE(test, strends("bar", "foobar"));
> +	KUNIT_EXPECT_FALSE(test, strends("", "foo"));
> +	KUNIT_EXPECT_FALSE(test, strends("foobar", "ba"));
> +	KUNIT_EXPECT_TRUE(test, strends("", ""));
> +}

Have you checked the binary file? If you want this to be properly implemented,
generate the suffix. (Actually making the function static inline makes my point
really visible)

-- 
With Best Regards,
Andy Shevchenko




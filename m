Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A895FCCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 15:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIt3C2BdMmpYpoVA0idIF0JSug2fDGkqfALlEP8pUVQ=; b=bEfHsqx7e4UVVNrv5WWodHTaIR
	vdvAcG2RmzP/tW/feEf5GSlkN37o64w9i4iMR084XfWwl71xw+I6jKZacwafQO4COPdl+C2iTNZqW
	PghG5E6gtJSyeicZFG88A6dZIeAep1v8F/QORDqsBkfxq+WoQykNZOiuc7NIAuPdcerd3DRdZAgGT
	rcod1fJFMJPHa1IBb7gBVZqtRJ/1kMmBmWEu12UqniW9iAsz/A/6ybt8Ko3m+MKUthKhjw/7W49EO
	LvsSn3Qsz7tW3VXBDaUPF5XGswy7oBbE64T2PpC+/bxsi+QajGiy0qV+L0tYsMjhxCPC05LcS3y/O
	McEkt26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBah0-00000003NkG-0HAh;
	Wed, 22 Oct 2025 15:24:02 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBagx-00000003NjB-39kk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 15:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761146639; x=1792682639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3H2G3e9u/HWbF1bcYxs8o9niOojFUMCOW6N5igyK8zE=;
  b=AGft1LGEApZ289cEz7kDPB7pNQ4IzM14SHzRN4mwJV8Oejpk5YE8cwF6
   /GSkjaWax8yS5qpuH/RS3vVLgGHB33EZL+zQtfzuPYyUoS9d9BWya38hd
   Yydf8IyQdljvSpRIHr9W4bNWqL/Tm3GBXdvFXRMGh9ZGAFdUEwtIhhoHb
   2sHyITXw1qlLD+sOYx/lduJ91oOKnDTVeSx5Nt8TnOeXsk7OJRKKV63NJ
   G9r2bq2SSkadB6n5vTUSvvBBxIq1mB9OQTGcc7wiNBxRm2Rib8gt0Seva
   GeHY9GWJX9kmAXMfWzAbWA/NwqSt9yEuItCIcbcxBIHUiDS48A+pp/7Vv
   A==;
X-CSE-ConnectionGUID: tWycV+KWRsaqisuTOBRPSQ==
X-CSE-MsgGUID: qs9K9heZT6CaAn5FokTKuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74645413"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="74645413"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 08:23:59 -0700
X-CSE-ConnectionGUID: aZfCjIYeSgCfOShAlazg4A==
X-CSE-MsgGUID: ATEEnZdDSyiOXykbwDzTrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="189179298"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.83])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 08:23:53 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vBago-00000001jCg-2CaW;
	Wed, 22 Oct 2025 18:23:50 +0300
Date: Wed, 22 Oct 2025 18:23:50 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
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
Message-ID: <aPj3BlmgdnJU9DM4@smile.fi.intel.com>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org>
 <CAHp75Vewc2OoD7=eoFtrkPrGRuB9ZGT2vu4Z_wdHZUDZ8igUtw@mail.gmail.com>
 <CAMRc=Mf_qfFzWqy6ND+YDuXcv5NOYiRTo9QY76V719PqJBMxPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf_qfFzWqy6ND+YDuXcv5NOYiRTo9QY76V719PqJBMxPA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_082359_826517_5077C560 
X-CRM114-Status: GOOD (  12.87  )
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

On Wed, Oct 22, 2025 at 03:40:00PM +0200, Bartosz Golaszewski wrote:
> On Wed, Oct 22, 2025 at 3:34 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Oct 22, 2025 at 4:11 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

...

> > > static inline bool strstarts(const char *str, const char *prefix)

> > >         return strncmp(str, prefix, strlen(prefix)) == 0;
> > >  }
> > >
> > > +bool strends(const char *str, const char *suffix);
> >
> > Why not static inline as strstarts()?
> 
> Because it's not a oneliner.

So, and how does it answer the question? What is the obstacle here that it may
not be a static inline few-liner?

-- 
With Best Regards,
Andy Shevchenko




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56E9C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49JN+s6IWX82rF9/oIGJ/XpKDoHvxZLgYIF4u+kRqGw=; b=5DF+sJ2JmkFJfCSGpAQDMseR2E
	unas6LLu3bIl4DaNCdUjMBizVPXvjIGRqyxwdxo13V1kkI+xkyCm3jCY91FnLj95mMcdf+BNrrSHJ
	cjpSGueQiZMpBPY5eu6o/EgQ7ZknjGYEL8UCmS2Ssud1pGZUJNHzj+y5xS0LBRCo6a5tAk6kLuVQg
	gPKSCPu17h7eWG6EuSY89MI2lOyPQGMDJRBHN+4cFpIDBKyBcmdaGr2muyjayCCEdyb7RkiNXEznD
	xTO7G2YZDA2RTPBDcIwVHPh0pWB/Rwhjtm9vIxWCaTAsKaw1STMlXMqRWpH+tW1g6AW07XJmHtKt4
	6FR17EEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8yC-000000025it-2AAD;
	Wed, 26 Aug 2026 08:26:52 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8yA-000000025hl-1Zoz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787732810; x=1819268810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DjG1oq7SnqRdBe8jkPiEySnDuQMRC2HVO2VHS57Nhcg=;
  b=dNnrA196ISDSiP+21DBx3eca5xi6jEIxaa4RvK3K0F1Zr70yuImG1H3h
   pz4QsSxEuJ+/7SHRQ1W6ryfzJDKid6LXlcdOhpF7Ytpc4tL/KRAtvUIf9
   HZaOXa8GWrYzVrTlWWgsh2Jnu+yRDYh6LsJ6/r6nLtUJCRPzyeZOwq1Y0
   DROyf4R2EKJD8RfToGTXvc4DdhzrrmUeXZuirW7rSEr+IVwBEynP8kGLc
   twqWXN9lI1klddQhl3QPtg7yp62ivcF2z8SuOrLd176CeitpCs59S/QXB
   PHuVSNGK48oq14abtJyahAid4ijl766eIeLYtDsyitmiNGaU0f/81Lpy5
   g==;
X-CSE-ConnectionGUID: skZgy2JAR4aKehmA1QVF5Q==
X-CSE-MsgGUID: 2/5298zHTXqd6sPznposZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="92025824"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="92025824"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 01:26:46 -0700
X-CSE-ConnectionGUID: eyUnDHdPSLK0+ojSgWQ8EQ==
X-CSE-MsgGUID: Rk9WNzlvRhuTPNK+gKAvEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="261382198"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 01:26:43 -0700
Date: Wed, 26 Aug 2026 11:26:41 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: mdshahid03@gmail.com, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] iio: adc: bcm_iproc_adc: sort headers
 alphabetically
Message-ID: <ao6jQaJc9FokuK6A@ashevche-desk.local>
References: <20260825172155.250484-1-mdshahid03@gmail.com>
 <20260825172155.250484-2-mdshahid03@gmail.com>
 <ao5dVuReF1Q63ccU@debian-BULLSEYE-live-builder-AMD64>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao5dVuReF1Q63ccU@debian-BULLSEYE-live-builder-AMD64>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_012650_504199_B9706D8C 
X-CRM114-Status: GOOD (  14.60  )
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

On Wed, Aug 26, 2026 at 12:28:22AM -0300, Marcelo Schmitt wrote:
> On 08/25, mdshahid03@gmail.com wrote:

...

> The sorting looks okay to me. Though, there are some includes missing and a
> couple of them that don't seem to be needed (delay.h and io.h). Either in
> replacement of this patch or as a follow on extra patch (not sure how maintainers
> would like to have it in this case),

Too many lines to sort, hence separate patch:
- sort
- apply IWYU

> it would be nice to also update the include list according to
> include-what-you-use principles.

> If you decide to work on the update to make it iwyu compliant, it may be
> helpful to set an IIO tailored mapping file such as the one shared by Jonathan
> a while ago.
> https://lore.kernel.org/linux-iio/20250629194336.34a03946@jic23-huawei/

-- 
With Best Regards,
Andy Shevchenko




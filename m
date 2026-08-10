Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CFCC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 08:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MtARaysgcP7PkulbRAum+OuoE+n0df5qhEIU2ONuiIY=; b=tZWEx+OJb66DvV7HzO+NObR0NV
	RfpZqUT8QHbOk2muUaZ+4EmjcLnlz6HkISPC8dxx5hB8/Jc3plKYQNvLYufpk2lBFTon2MwwJ5DCO
	cDo4POtXFJq6TD3X/c52M1aNou3P1VOvVSaBFDPAmB4S9FKUr6c0v6ZJpZncICYb7XY395mUyQucn
	9Y460pwNOgEYoDnTS52mbtG1W00Ll5b2R+g6UFDXmeK6yezsNHO8goyJSZ0TclBGtVFTkzdgBrvz7
	AAelqr4EFNWbRRZ48IRjPj2nXFFkF6NuKOzWepdOaAPNDDmucjrLnBaykkJ0oGuZu5JOeff4cDkfb
	3bCfFnnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLKQ-0000000BHaY-1qQC;
	Mon, 10 Aug 2026 08:25:50 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLKO-0000000BHZv-1NJj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 08:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786350348; x=1817886348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jJ/9TlLP8y1Es2atfj4khaOE6GTnMAWPN63aLAZe4VI=;
  b=PWhhv/Ts8dmZYC/g9d0tyxeZXr5B8pdw8yO6ZptIKJg+lIzIyOP9CoF9
   e/iPQs+7y7PELIDwTAU7i2YQRxHUwuzoslelY5V74CMj0yFrUYL7GZoeF
   DpLlbSB+2v8kCVhRy7ZzPtoA8811fk7Ws9dKdkSxmGQ9ug3gWRTvX2vVT
   E27l3eUo123m9woPOZL5ZTRft6Zr9J4h4/H8ENBhcVIkCCe2fI9OixyTu
   SXWylABYWiHrW19XWrVz76JTNfWYfzsIovLdBE6Q3VRRiqHtwl+1jzEzG
   +IFIn2derSWss+UKWoMI2bVVQo2R6Dz8LyHaUOQisfe7T0sTgU6Vvx3+A
   g==;
X-CSE-ConnectionGUID: zGFm704OSGCeUBFnc46KKA==
X-CSE-MsgGUID: Ags4NGBhQvmwbDkobX9IBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="97512370"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="97512370"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 01:25:48 -0700
X-CSE-ConnectionGUID: +CVtWkuUSqeoufOw1Ie0fA==
X-CSE-MsgGUID: jl3+KhifRv2Ych2rhCw6Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="267224372"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.99])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 01:25:44 -0700
Date: Mon, 10 Aug 2026 11:25:41 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	Joshua Crofts <joshua.crofts1@gmail.com>, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] iio: adc: bcm_iproc_adc: Remove redundant probe
 error messages
Message-ID: <anmLBVWpzRc3Qtk6@ashevche-desk.local>
References: <20260806023902.8608-1-mdshahid03@gmail.com>
 <20260806023902.8608-2-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806023902.8608-2-mdshahid03@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_012548_382038_E7814F8E 
X-CRM114-Status: UNSURE (   8.26  )
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

On Thu, Aug 06, 2026 at 08:09:00AM +0530, mdshahid03@gmail.com wrote:

> devm_request_threaded_irq() already logs an error when the request
> fails, making the explicit dev_err() redundant.
> 
> Similarly, iproc_adc_enable() already reports failures, making the
> additional dev_err() in the probe path redundant.
> 
> Remove both duplicate messages.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>


-- 
With Best Regards,
Andy Shevchenko




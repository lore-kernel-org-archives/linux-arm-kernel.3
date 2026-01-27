Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67513D13C1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPtozfuxc6h5ObQODLIoMHu2MVy1vQa38AyUtSxAe1c=; b=xaCAyzL7vC2mG1JSZBeq2z3F+W
	Hc7MJSAwm/Da+7/zoMWFshEs0XHcx9Nm6L07oN5h4PWxesecSGUgU/mKGWsw9bvkIfs+l5w62X0dc
	ZJu0zgJTvUx2lzhbOufsEUY5RHfMeTQsTb8J3HiXyMAqbFL8a888E6nDm7d1lNDy/TPzaVKC3pdIJ
	SjBqtpvQq4Dl2n2rdc0AVi09mXuH/GLYDnlJyH14RqTj+r3E3G55tl9ocagAkIfi8xKCqchnUFNG/
	58qurb4WRaeYUL/Tf7qr+jGDosEQNjq4aqQ5amrjVK3SvrQlg7FjK93Eah3gVAH576V8t3IGP0OZS
	5NcYtQ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfXX-0000000Dxld-0ME0;
	Tue, 27 Jan 2026 09:39:16 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfXU-0000000Dxke-0v0N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769506752; x=1801042752;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0H0A1G/t2czBhckAV5bQ3Z3fhdMMfySyBYFXGzClirc=;
  b=m6aYYqgimOLQ1BI02wVUpRNGpO7kCJSveFQgOKDtfnIpyTukmDo6QZQj
   O/JFQCU4tTD2Vj/iljAyXZusrf/obViqueXEYbiCjSzCV/0u8nAUBUIcf
   cHK8ZlRj9Klf2UjZa5uiWkT0JVSRKJpSqvQEn8tkd33jDC5amJgSbG6fL
   4nQyQ08DAtsNVEedBbAA/Id0xipcYXN4jSxtC+HV9XM/GzcLl1rkdRU1r
   9b4htbdj+y2yxLk1q4YrouFYpAUG96M644dLfbfzOBg+nCraE/iFQcVFN
   o1DS8OFNlrtg4vSp7x2c5A/dI6weH0r3ythO0S8Bs+dBXGOrU5B8U6dRe
   A==;
X-CSE-ConnectionGUID: Ft+/782jScya9hkyGKhTeQ==
X-CSE-MsgGUID: 3OpsNx9KTvCS3lqy7tXTjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70591624"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70591624"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:39:11 -0800
X-CSE-ConnectionGUID: 0SkoKUduTUCGAiPFvI9HNw==
X-CSE-MsgGUID: tGE2q9KeSt6oYs33nFTn6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212787380"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.248])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:39:08 -0800
Date: Tue, 27 Jan 2026 11:39:06 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/6] i2c: xiic: switch to devres managed APIs
Message-ID: <aXiHunnXmHb8oqTN@smile.fi.intel.com>
References: <20260126-i2c-xiic-v5-0-88a16a28721c@nexthop.ai>
 <20260126-i2c-xiic-v5-3-88a16a28721c@nexthop.ai>
 <aXiG5p9BQ-vkAgbV@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXiG5p9BQ-vkAgbV@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_013912_305322_1FC69AD1 
X-CRM114-Status: GOOD (  11.57  )
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

On Tue, Jan 27, 2026 at 11:35:38AM +0200, Andy Shevchenko wrote:
> On Mon, Jan 26, 2026 at 05:08:18PM +0000, Abdurrahman Hussain via B4 Relay wrote:

...

> >  	if (ret < 0) {
> >  		dev_err_probe(&pdev->dev, ret, "Cannot claim IRQ\n");
> > -		goto err_pm_disable;
> > +		return ret;
> 
> 		return dev_err_probe(...);

Actually you are right as here we remove the message in the next patch,
so discard my previous comment.

> >  	}

...

> >  	ret = xiic_reinit(i2c);
> >  	if (ret < 0) {
> >  		dev_err_probe(&pdev->dev, ret, "Cannot xiic_reinit\n");
> 
> Ditto.
> 
> > -		goto err_pm_disable;
> > +		return ret;

But here it will stay, so

		return dev_err_probe(dev, ret, "Cannot xiic_reinit\n");

> >  	}

-- 
With Best Regards,
Andy Shevchenko




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953F1EFCD9A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 11:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Vv9BfhfvbfQezGeZZKah87njUdsKOWXplIdJ8ddBB0=; b=MREaXoiTz3B2xQ5TOSVP4sSgYc
	qv1P4pwa5PEYJoTtGy01pQlhNMmbWNrdAC8/7tfuAcsalURt/E1d+7ZGH406ijyobd0aUQxM5FawQ
	pxEmpW3Nddu7Eo6HktAR9Pdasx6QGoLzRzNK6EaZY09qWAW+S+TjZ2jPL5ht//WcJDX/J+ySqq3fw
	vf4LTEKVrJ/NqnMNbNYQQwFkKE2aAtnkYND942jYANFuGYLJSYaxOEJTV23LoOi4ccNjxtu6OUNJ9
	7xxd1aTTQRG//bA75CQ5hBPL4iWMSgj2PrvCo68jVj0CVYOSBajuqU7Amupyf9VfAvMgrdRFMhBL2
	tV572BGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYrh-00000007CUj-0Ad8;
	Mon, 09 Mar 2026 11:33:37 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYrb-00000007CTN-1kBJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 11:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773056011; x=1804592011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JuHpzrbAufQ+zpTIrGamvkXdl9yX1h0YnfoBnl5c9Yo=;
  b=HVMcF50flk/oqlC75AgL8qV920tjMNr15BRv+UBn+T4znUUw+Ta+JSNJ
   fsWctuLpW35uUjfmzo1YUbH55ohdfeKxGBlIXGySAUtRKgqrulJpb+ZyV
   AGTV0vijpP+e4Mh/PqubFFLw8smb9ndscrOfgpZSUVoBeExBHb0iAKVjQ
   c4JCVbKnGvi6i3lOIka9As20BPyRI8R9D+h8g6QggeKhuvAXjUHBqshz6
   lEJpI9oPm8EiveypkgUeWghoQfJWxFY3GgzTH6nGRe3NfvFTchw1mhHdK
   4ujM6E+1YB5vmQ9gQoq34t885tBp8PdwpG/A6DsWCnO1btZwrGbN7cRW9
   g==;
X-CSE-ConnectionGUID: WWxe4CClSm6qJTsfDCdnPA==
X-CSE-MsgGUID: 49gc+iXCSrW7g0D7I6+IVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77926823"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="77926823"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:33:27 -0700
X-CSE-ConnectionGUID: BYjNij6OTQmvnxYxvf3Gqg==
X-CSE-MsgGUID: zc0Q1d8yRM+8lYkv2wtCgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="219851993"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.181])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:33:25 -0700
Date: Mon, 9 Mar 2026 13:33:22 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 3/5] i2c: davinci: calculate bus freq from Hz instead
 of kHz
Message-ID: <aa6wAvSdgqs8947d@ashevche-desk.local>
References: <20260223-i2c-mux-v7-0-ec75b214718a@gmail.com>
 <20260223-i2c-mux-v7-3-ec75b214718a@gmail.com>
 <aZxrZbbXxm31q62s@smile.fi.intel.com>
 <aa6rhyZLhPY7aE-D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa6rhyZLhPY7aE-D@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_043331_496638_AC59AA8F 
X-CRM114-Status: GOOD (  16.20  )
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

On Mon, Mar 09, 2026 at 12:14:15PM +0100, Marcus Folkesson wrote:
> On Mon, Feb 23, 2026 at 04:59:49PM +0200, Andy Shevchenko wrote:
> > On Mon, Feb 23, 2026 at 03:33:52PM +0100, Marcus Folkesson wrote:

...

> > > +	dev_dbg(dev->dev, "bus_freq_hz = %dHz\n", dev->bus_freq_hz);
> > 
> > %u ?
> 
> Thank you for your comments, both this and the other.
> 
> This driver has a a few  other style & formatting issues, would you prefer
> to fix those in a separate patch in this patchset or in a following one?

Depending on the issues and churn it makes.

In cases you already touched the lines these (what I mentioned) can be done at
the same time as they do not change the logic. (Yes, theoretically you may get
-BIG NUMBER for big frequencies, but I do not believe we have 2+GHz for any I²C
controller in the world, so IRL it's close to impossible.)


-- 
With Best Regards,
Andy Shevchenko




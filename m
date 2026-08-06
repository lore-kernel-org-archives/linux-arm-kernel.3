Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F87CC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 23:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zA6ayysZWhoV4HSQJVxXsZ9EovVxXB8fWroFbAF3FAM=; b=r5vRgqTu/xUjAEaGPQ7VP4GRaQ
	JbUELnmnkVrDrftyVWOLQaoEbMYpMnyDL/EjqUQC4dbrOAbLfRcnXalQrHg+1htaoxdVuIWB1pdEz
	TM+d9K1PnHLxdKj8n0gGIi5MxbbysygJR8ujTqkRCV+qsxbuYJMhkx1e1HnLq8SO+c3FnYs5ZlTCW
	hKkM6mMAz7ZVlXWa/F9N2Mm+tix4T0OVHBAF/CT6iY44d6wuRSEZlNIwY7BH9VlF7Grb4clYPV7d5
	EmcmsHFQVHhk2nJhdTlBOjtXdxGHKfs55FJ/veIR5OCiqWO8f0zdHJoJViK4ogC/d+SGA9B4BC5AW
	57WO2cqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws7t8-00000006sKp-0oZ3;
	Thu, 06 Aug 2026 23:52:38 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws7t5-00000006sKQ-1lNg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 23:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786060355; x=1817596355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sa2YHFJVH+Xj6g/4VuItSxfnJNEDnyYTmOISahdJtLU=;
  b=DSqzPJj35ABhH4BGn9JLeRoIPQJf435PVgf4PFBWbF9eC6ljFJICixgf
   b4E7eTKXSc3JioHTdgPj0koDyaFdrPOY+SczY60KjFWEovzZB5JN4DVna
   SZtrvVDsSfo8ZZ5+EtDzLl1Ibuy9HHKEkM0Y6V/hPQ6BJKAIOuZefWfAW
   VaG6b2tujEbd6TVYoSKxmaeddkwnTdVBIsz8J0hDnRn2P9izQZqIt0pxh
   aNy6Ijli7InETC5TnWd65zLIgwZ3sFZ4Q4haRgwynW88DOM2z+IU0hYmD
   l4IQx8vKyobMUMYTPzaIqAeEX8QagHjP8tUYyPWRmywDiMB3LQLDRbw/w
   w==;
X-CSE-ConnectionGUID: mQvtnc24Q6yrrZC8h7NY3Q==
X-CSE-MsgGUID: A2t9a59xTqeOJE6C45zXoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="98030198"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="98030198"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 16:52:33 -0700
X-CSE-ConnectionGUID: qrk721O5Tf+t1OGyaWdYEA==
X-CSE-MsgGUID: cGzaEPkaSKy62GFi+D2ZSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="265718608"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 16:52:29 -0700
Date: Fri, 7 Aug 2026 02:52:27 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: mdshahid03@gmail.com, Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	David Lechner <dlechner@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Subject: Re: [RESEND PATCH v2] iio: adc: bcm_iproc_adc: Convert probe() to
 use dev_err_probe()
Message-ID: <anUeOxR0cS8Yzwh-@ashevche-desk.local>
References: <20260730155712.374464-1-mdshahid03@gmail.com>
 <20260731115309.000073a3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731115309.000073a3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_165235_466270_9CF14004 
X-CRM114-Status: UNSURE (   6.67  )
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

On Fri, Jul 31, 2026 at 11:53:09AM +0200, Joshua Crofts wrote:
> On Thu, 30 Jul 2026 21:27:12 +0530
> mdshahid03@gmail.com wrote:

Basically Joshua said already what I replied to your v2 (w/o resend).

-- 
With Best Regards,
Andy Shevchenko




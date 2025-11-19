Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253EACF3953
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cuAfspbGZ4sy29S+/sDz2RKUTR11Cjrmyz2ihEZJwtA=; b=Ap0jQ7cXNZuMyX3ZW751Le9rRK
	TKyrrS3t7JfJvx7MRIsMgBGzKLQFkUKeMw1flCJuUCUae3876FSMdGu/Fb/5l2/k0EU99/wIT1UjT
	1TNYHwCU/m5QlZP5RYUT0yUAW8inQwFGAd+BENo84aijrHzCthSkwE6tzxj9KfajYmMT7LLVQg/jg
	46RJsZhr/I9BGBwq2ly8Db7PJt7gsiVN+DpzG7oiqHnUtH4VF61tqsQPhVa1HYY/jfClHbwn6OgKQ
	Oko5ntTj2dxgLNR/+Jqj6zfiIvSE80n1PsKDY10a9w9d4xR36pZHjLwrd8JKkG651m+9QnFC6CF4I
	cvwxSAZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLl0T-00000003hP9-10U5;
	Wed, 19 Nov 2025 16:26:09 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLl0Q-00000003hNf-3ysr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:26:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763569567; x=1795105567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rcYiTW4WgTYzSq1h46XlhyDQby8fcyyNoQwZ4LlKIJk=;
  b=HaSTDyTjvOkK6IoDzHGezULvoB2/XZrTfvTfRAjqPyTqkfpRZRRXC8QK
   spK7qDEdOOjzd7tekvY317QvFiqc/07lx6guhG/kq+GpHSW5tYnKpamg9
   s7N23ZUcvCXcwjL1G7D/GTJ80xiirEcFSPK10YbtSYYEwjiDxZW24Bn2c
   yd20WHOIFQW/IM7BpOnNsWrrDer7Vpc89c9i/eGB1gs5DtBPPuWy7zNjb
   Ii20xgffWUn/qdAmcrZMF+cx+GncykBmt4SkylvdMuGcSXCUQq9AlSWhk
   tEOuMyGGERPJAsV80Yf/mD2qg8UvoKZd/4QXvJ02PZaZV0VQxiVf7RoHr
   Q==;
X-CSE-ConnectionGUID: mhaDd0UFS5i3bLlKh/sIaA==
X-CSE-MsgGUID: kIrY5oeRTDCT8plNlpgpIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="77083286"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="77083286"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 08:26:06 -0800
X-CSE-ConnectionGUID: C6AjU3XJRhCz5LxNOI/G7g==
X-CSE-MsgGUID: IupJoa/+SbSMxo/3outhag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="228432613"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 08:26:01 -0800
Date: Wed, 19 Nov 2025 18:25:58 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 05/15] gpio: pxa: Use modern PM macros
Message-ID: <aR3vllR_9-aVxCAG@smile.fi.intel.com>
References: <20251119144327.13345-1-jszhang@kernel.org>
 <20251119144327.13345-6-jszhang@kernel.org>
 <aR3mnWQedt7SMRP0@smile.fi.intel.com>
 <aR3pG7Em5RcRqAKT@xhacker>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aR3pG7Em5RcRqAKT@xhacker>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_082607_047031_9DAC8058 
X-CRM114-Status: GOOD (  14.21  )
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

On Wed, Nov 19, 2025 at 11:58:19PM +0800, Jisheng Zhang wrote:
> On Wed, Nov 19, 2025 at 05:47:41PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 19, 2025 at 10:43:17PM +0800, Jisheng Zhang wrote:

...

> > > -#ifdef CONFIG_PM
> > >  	unsigned long	saved_gplr;
> > >  	unsigned long	saved_gpdr;
> > >  	unsigned long	saved_grer;
> > >  	unsigned long	saved_gfer;
> > > -#endif
> > 
> > Same Q as per dwapb driver. The CONFIG_PM=n doesn't need these.
> 
> Now, I know why you commented like these... 
> the pm_ptr() and pm_sleep_ptr() can optimize out the PM
> functions, but those functions still need to be compiled. So if
> we keep these #ifdef, there will be build errors in case of !PM

My bad. I haven't realised that it's not just being discarded...

Thanks for your patience. Then please, fix the typos and we will go
with the v4.

-- 
With Best Regards,
Andy Shevchenko




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E1BCF3957
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JPPJZO+cB+dyO3CWOQc7FsuVaL2zOpj0CVW99wfQoy0=; b=GQJjHQcisMXi9Yq7T+CrzvWoSM
	r2vOJUdxLoJG95d9d0el8AM5p1YzkMpDL5uHosENxHWwgni75fuKhWmr6L6YdnNrBK0+VJGWUb8o9
	gS5AoULXBiebHQ7ZFAFy7G4lv8MsA5wj+cHKu8BFdjrjpKoOReAAql5a9ZN59Gi1BtzMh+Py2vQS4
	rmosXqF0pYCMd/AMSDMEcPWqOK2eC497i8zwUXe2wG1ndwnxCJVa/HtHQaprMivzL85SlM4Pr0NyE
	3RjABQPF4Yptn4Rt/xqELDGa1mCSbMQS6q8z3PM4nSBkZa/CeYcKqv8g7m84EXHTTvaC26PvPvdVx
	O/n9XbLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLl21-00000003hbT-33mI;
	Wed, 19 Nov 2025 16:27:45 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLl1z-00000003hb5-3pYF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763569664; x=1795105664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RbuaFqbU9D6cniO/gNnWcfYENkpByHD3Voe1dJhlElY=;
  b=fWnxETeBaGlp5DHDqsX9MhFHVCSTrJHmkx3zIr9UdiGNSdCGpxFfd/1l
   NO5LsB6gNnZdHT2fsriT6J6oM/kStMHs5p2/sIxK+9Idg67iCZVYeflCp
   jbpGfH6ygJsnDnFfKutOfVgPbqUK56U8mzVGrzcZj+lEPuC9L0UqddzWN
   j0lC1eRipNRoWpFailsmrdmAC8ITTUFIpAi0TQnPNPPdB9J8bnBXirclO
   mdMFeSUli6O0Jy8qrcNyn2zDMniDI1H3fKqeo2+bHneZwljpYr9CnFZ8i
   C6jjzz+2g3BA0rjY7sfTo3iyehz+1gmgufHSyjPMhYhN6qV5vhcGesFfw
   Q==;
X-CSE-ConnectionGUID: V1drZYQAQm6EprNjsHU1kA==
X-CSE-MsgGUID: xhoLRnfZS5OOM8S1pr2i5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76974667"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="76974667"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 08:27:43 -0800
X-CSE-ConnectionGUID: 9KXZKRZeRCukiU/VqRnRnA==
X-CSE-MsgGUID: wozMmkBUQuuTUolHAPVh0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190356219"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 08:27:38 -0800
Date: Wed, 19 Nov 2025 18:27:35 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Doug Berger <opendmb@gmail.com>,
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
Subject: Re: [PATCH v3 01/15] gpio: dwapb: Use modern PM macros
Message-ID: <aR3v9yv2tXPiDIwn@smile.fi.intel.com>
References: <20251119144327.13345-1-jszhang@kernel.org>
 <20251119144327.13345-2-jszhang@kernel.org>
 <aR3lg0aNaoT-_7SM@smile.fi.intel.com>
 <aR3niy7_jwzQSJ33@xhacker>
 <CAHp75VcLjknMLZ60b7mUPqL2miT_x8EexQPhCFueua5vDg6uxg@mail.gmail.com>
 <aR3qqkgdqFS6dlf6@xhacker>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aR3qqkgdqFS6dlf6@xhacker>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_082743_991111_F5FB7095 
X-CRM114-Status: GOOD (  16.15  )
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

On Thu, Nov 20, 2025 at 12:04:58AM +0800, Jisheng Zhang wrote:
> On Wed, Nov 19, 2025 at 06:11:53PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 19, 2025 at 6:09 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> > > On Wed, Nov 19, 2025 at 05:42:59PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Nov 19, 2025 at 10:43:13PM +0800, Jisheng Zhang wrote:

...

> > > > > -#ifdef CONFIG_PM_SLEEP
> > > > >     struct dwapb_context    *ctx;
> > > > > -#endif
> > > >
> > > > But why this? For the PM_SLEEP=n cases it will give an unrequested overhead.
> > >
> > > the pm_ptr() and pm_sleep_ptr() can optimize out the PM related
> > > functions, but those functions are still compiled, so if we keep the
> > > #ifdef, there will be build errors.
> > 
> > Is this an expectation or you can share the error, please?
> 
> drivers/gpio/gpio-dwapb.c: In function ‘dwapb_irq_set_wake’:
> drivers/gpio/gpio-dwapb.c:368:51: error: ‘struct dwapb_gpio_port’ h
> as no member named ‘ctx’
>   368 |         struct dwapb_context *ctx = gpio->ports[0].ctx;

Thank you!

I just answered in the other email that I will tag v4 after fixing typos
and dropping unrelated changes.


-- 
With Best Regards,
Andy Shevchenko




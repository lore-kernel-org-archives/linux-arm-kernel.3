Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D75C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 10:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/qSOlMwG1tBEqwfJZ1I0Em2NJMBVmrSeT8vIpdwl2s=; b=QKQIN0C6Jk0LCoykWItkKcdI7r
	KESPq3LW6688BUcyoFEp4UHdWRCaGI8z08YFzSy5YZfC84RWt3hG8JI2FVIxvGwuUkXw0oA/5XivH
	TGFY31vbuKvr5cBZURaSaO7p+ahZN+F189sfIOpY08Zhrd6MkxiU9E/X107FibyFyfpuBKhk0d7yx
	GGr/vWY7VN+TwCaNbQl5rlJ01bruVwPZu4HywEGD01BEVZkzmPfYMBubiHmlpyrDt9ZMYgPSOOZP6
	FWwbWDCyGW6uoH/LVDul5a4QzcnfSr2ssgEmyFIcdnsjok9V6CkBlHRi1ZFkWuEe0hVcf020p+o91
	PeVSJg4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5jAr-0000000FtZX-44On;
	Fri, 18 Apr 2025 10:42:21 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5j3R-0000000FsTj-3AEs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 10:34:43 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5499614d3d2so2167444e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 03:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744972480; x=1745577280; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S/qSOlMwG1tBEqwfJZ1I0Em2NJMBVmrSeT8vIpdwl2s=;
        b=zzeyKmqsVuBYiazF3i52s2Je8BYuROd1Lx3DMCLdOuk/YwHzWTjiSIZZmV/guZuGg+
         v3ViXmFoBLz96In9L00yMgKQMbqVkLI1DSzOOrWc4PN3caF46gO88AL0nvjGzea6yduS
         tJyKeTtn+9DK1dvMmn8SEBJ/WNDYhuBC2lg0o4/KuWuoB1qJlBInqH332snttZSClG/w
         hDNa77ifhLvJ7GtRJaIo4dJIqryP+MFZEK+3Gk7GA9r1JQyRUYGWFPAQkKs91IN8x68+
         DlhdiHKGE8wHrfCoO+/Z2IiIwv7Zj1Y7QkoO+u0ROpY6pN+neDRkx+JMHpgSWbndOlMG
         DLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744972480; x=1745577280;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/qSOlMwG1tBEqwfJZ1I0Em2NJMBVmrSeT8vIpdwl2s=;
        b=q3uOuW1pdfNxjZFrG9eqcR9xNgye1E6nsDqzs64tr/SRfAplETrhoDVAEXgrJgOBAB
         IdlzKx4kDFGg0pdnN+CyrH+bWfwkMWusZOqaTTdJYYHxcPYVt9IFubnwPGhAEvT50JyE
         tV5h18/VkJ/xofWKtNuWx8XyLipGZgMb28JMCj7JcUYZDzsnohotj76ivhp1xlmsZEaL
         Q771WeEebtYHI8iuce1epLXHbBnSS6LvHQRTPQlCSjoYMDnkii66XOXgj5wBu1RqTAdn
         /9m7SyOEsMJlRBF23vnJtzXXCMrN9ZRVzP/48V/tpp3qK1GXJE/taLodGFF2gX5NuD48
         TI6w==
X-Forwarded-Encrypted: i=1; AJvYcCXVHimjGdxpCaAVf03OM8bCMriB3elg0nihys+E2XM5UfrmTh8zHIuVBC9Rb9MqPMPJIt4WPZSVBj5lrG4FmLH3@lists.infradead.org
X-Gm-Message-State: AOJu0YwnPyNKQbNPPadRsYKXKUQ+ngHKSF5f19ghlNEoeXPAKhrRAEAX
	WRtA9bMAIdb9hytmu/VteVidvVxaPtln9pD0eeRcz4wAkk5afsAaNKFzSHFo+94WSzCL+RO4Toi
	cCBw=
X-Gm-Gg: ASbGncs28GTCzeVemQmXZb582UhvMS/k8SMckrQkzKwm5FdndKVIYMtuz9YJ0oCl2Dn
	0/LVNIMKLo8tzRCP1fcdtZPQCSbcW9RbmSKI6ZQGKzk/Hw4ken5HktCYDcu8lxVIB4QaMLd4kh9
	vAxh6xrooLHh+uG07OmhXHwcxyPPF7bQNKRbkFmXMs4Ah0mqVfbM/c2n5R2ch3L15SA+Hkmt2O4
	wEbZQYemO9bcr9Te8RcvMLva7mnaqm3TC8zP6+E9/WBo/6CuiZMbzHay7GXjr9ZX34+Mzli9T+i
	zvQ0rPNVgmo8oIyTTvqeleI+372Fq+8+syoZyfamy5Q9BkSdr2yPmIHOdtY3jXJYx0Eji5d5KX3
	0/c8=
X-Google-Smtp-Source: AGHT+IG1L3VfWz9J+obAaFerB2Z59MsSd2dFbffUprl7yAb1d+1L7oSTlRW/aqUm+C4DsUsSsv8Z1w==
X-Received: by 2002:a5d:6da1:0:b0:39e:e259:91fd with SMTP id ffacd0b85a97d-39efba3cbbbmr1721753f8f.17.1744970916627;
        Fri, 18 Apr 2025 03:08:36 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4207fcsm2342052f8f.19.2025.04.18.03.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 03:08:36 -0700 (PDT)
Date: Fri, 18 Apr 2025 12:08:34 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liu Ying <victor.liu@nxp.com>, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] vsprintf: remove redundant and unused %pCn format
 specifier
Message-ID: <aAIkouhM_ePdhgJY@mai.linaro.org>
References: <20250311-vsprintf-pcn-v2-0-0af40fc7dee4@bootlin.com>
 <20250311-vsprintf-pcn-v2-2-0af40fc7dee4@bootlin.com>
 <Z9BKW_06nLAOzYfY@pathway.suse.cz>
 <20250407184647.3b72de47@booty>
 <Z_TRZSxwzfAZ9u6I@pathway.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_TRZSxwzfAZ9u6I@pathway.suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_033441_795534_DA20EF4C 
X-CRM114-Status: GOOD (  27.44  )
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

On Tue, Apr 08, 2025 at 09:33:57AM +0200, Petr Mladek wrote:
> On Mon 2025-04-07 18:46:47, Luca Ceresoli wrote:
> > Hello Petr, Daniel,
> > 
> > On Tue, 11 Mar 2025 15:36:11 +0100
> > Petr Mladek <pmladek@suse.com> wrote:
> > 
> > > On Tue 2025-03-11 10:21:23, Luca Ceresoli wrote:
> > > > %pC and %pCn print the same string, and commit 900cca294425 ("lib/vsprintf:
> > > > add %pC{,n,r} format specifiers for clocks") introducing them does not
> > > > clarify any intended difference. It can be assumed %pC is a default for
> > > > %pCn as some other specifiers do, but not all are consistent with this
> > > > policy. Moreover there is now no other suffix other than 'n', which makes a
> > > > default not really useful.
> > > > 
> > > > All users in the kernel were using %pC except for one which has been
> > > > converted. So now remove %pCn and all the unnecessary extra code and
> > > > documentation.
> > > > 
> > > > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> > > 
> > > Makes sense. Looks and works well, so:
> > > 
> > > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > > Tested-by: Petr Mladek <pmladek@suse.com>
> > > 
> > > Daniel, if I get it correctly, you have already taken the 1st patch.
> > > Would you mind to take also this patch using the same tree, please?
> > > Otherwise, we would need to coordinate pull requests in the upcoming
> > > merge window ;-)
> > 
> > I see none of these two patches in linux-next.
> 
> I see.
> 
> > Anything I should do? Resend? Or just wait a bit more?
> 
> Daniel,	Rafael, Zhang, Lukasz,
> 
> would you like to take both patches via the linux-pm.git thermal tree?
> Or should I take both patches via the printk tree?
> Both ways work for me.

I'll take care of them now

Thanks for the heads up

  -- Daniel

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


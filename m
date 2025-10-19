Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C89CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 06:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDRUSkhiE/XFv7OW4RSw91eps1PHNhul5pJctkyAuh0=; b=i2J+Fh1gWLmfMoEObZW3Yp+gu4
	7uEgXMYdmg8opNeHzUeqc+0/ID+qb5UCprlOrnVuz+0g2XiKk329SotMjb6SEy3Uol8kxeUsrt1Sv
	ccfxz5ytwwFe1N8iVAE8C4zDPX90jfmiyyyfJRSIBA09fAJ2pdPzz09Us7YnNUeHDpKU4NTqgZNJH
	ScC6KNLgI+b3VSW922YLy7nbEfCy4yqmPAkIGvOTtwvRPWzFSxVaSfVhObxfBEnrCYzr2/zqPu4pb
	kccwkI0+4Meepetb8Rrqq4Ry7h9nwCN/b5wE2vmHzjF/1R4VVZcxpKGgPJHkgeJEFozXjBltmdf+Z
	Zc+E50Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAMTC-0000000AiGc-23WJ;
	Sun, 19 Oct 2025 06:00:42 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAMTA-0000000AiG1-016K
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 06:00:41 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b40f11a1027so628514166b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Oct 2025 23:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760853638; x=1761458438; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RDRUSkhiE/XFv7OW4RSw91eps1PHNhul5pJctkyAuh0=;
        b=ZVa14rNMiaB7RU4StYAYB5W7ccWqezVaQTGQeGu+14+a5eNciAiY3j09wdFg0Y+WJh
         sqrnGOotwKs1cVfhXtJHW3qjdYwqkR58CNPR5U+LB42NA74Zg/6BpKUT4Osv9K2ih66s
         1PFa2j+WH6pV4Y95TguC4d/15/P78lVm0G0d6QgrRDX7qO26kIODr2EnwZe2WLk9Tdrb
         0MGduY/iwxpwdIabzU/gHFn8CVncmp6Nohbjstr50/vMbuz4Wrm30/MT2AnEHTJV730r
         1Xo9vp4WbtXu+mckX5ZgOOy6ArOCmcT+sQ3FwsQHqhsIk6L1YS4zkQb+UXt9IFFgtkQm
         j9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760853638; x=1761458438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDRUSkhiE/XFv7OW4RSw91eps1PHNhul5pJctkyAuh0=;
        b=nlt8R9lxYgfZIucjaIF8ziA3UhrVjEEJ4rd+YlkfvMYKB0ciDstAcmDDUPyhHjFL8D
         1YqxYpyASQkCWLs4K72eWrWTOFPY8maMBdxYnEoKPds7nTIHrmiV+DpyzXAu+CDd8W4R
         roMeydyWBpaPITCz/HPr9Oz8k92GRXPuCM7v3CBF20As66B5dlKCdG9GiS2AmpKxbdv2
         1THiuM730r7Rjdg+NljLNZqzgQmaHvN4v7CpN5g/Il7LVh2lVAZLqw/hcrZfff6MkrBa
         A3WK4sVKO35VuZ3525v4HsImyGtrtRa+PiZic2EVcCg7sq6ARtMea97O9K9wKlZI3bxv
         cn2A==
X-Forwarded-Encrypted: i=1; AJvYcCX397i/5pbsFjA5FZmUP06wOxF7d20bOSC46CxJOfSYoaJ3oOn+cMn0h3+r7/cmSrZYp2wCpNZs01gKDFaAam1o@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvv5U1ubPlVKaxnUu+FdR48Kqm72nIOMIxQFo5MEfcLAL+zK61
	bqAdW1CK3tQ/RkfibWfSTTxc7HvtumUWlkFw0rO8/HkweXNw4xZr9q9TZ2dQYxR98zBY6tFFSXy
	K5C/9+NJLUsC34z3QgTzdIAXw8cZWIow=
X-Gm-Gg: ASbGncuMaVcP3uZWuk76I2umrD6S0ObxflMNggchQ+UCpzlXbdF7yYQNfGFrg4NB+Z5
	6bYEmXVylLx+mf9elwIzXoXgcxqonQ1nR8vJZYXJYaW/ZeEj2WBfCCMjRM43dtoVpmfjR1uE3ZU
	yctpoRgv0XtqkyZQMQIsesN1OvMIXGzVhVkEEyDz1FnykE1gSlXdr09Q9vBP8VtNIvBZ8sqYyxh
	k7Q4Hvowbzlpr5HpnW/CHBeh25K+OEd1BPYwcgMIBk/CY9bM1rkiKrOrz1cUasiFFwK1w==
X-Google-Smtp-Source: AGHT+IFouXM66dWGoME6chpnuaQA5AhGJ3XBtWEQPmJjkQDMbd8DEH4sRrB+vsmFy93A7mrCfiSnE5e4aC5FUlXjYmc=
X-Received: by 2002:a17:907:7b8c:b0:b04:b446:355 with SMTP id
 a640c23a62f3a-b6475706d77mr890751766b.59.1760853637425; Sat, 18 Oct 2025
 23:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20251014113234.44418-1-linux.amoon@gmail.com> <20251014113234.44418-2-linux.amoon@gmail.com>
 <aPNiW8QzsLv4R0E6@stanley.mountain>
In-Reply-To: <aPNiW8QzsLv4R0E6@stanley.mountain>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 19 Oct 2025 11:30:22 +0530
X-Gm-Features: AS18NWDuyNsNiWxQmtkRHjc2M2PlmVH_Wd0KhK-4VAGV-r5GP86AOOEs_7Ea5Qw
Message-ID: <CANAwSgRchOvNPShUZOsUzdS0jaBOtFmpPLpJZEv7NNqOohWo3w@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] PCI: j721e: Propagate dev_err_probe return value
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>, 
	"moderated list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_230040_091003_F98E235D 
X-CRM114-Status: GOOD (  22.16  )
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

Hi Dan

On Sat, 18 Oct 2025 at 15:18, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Tue, Oct 14, 2025 at 05:02:27PM +0530, Anand Moon wrote:
> > Ensure that the return value from dev_err_probe() is consistently assigned
> > back to ret in all error paths within j721e_pcie_probe(). This ensures
> > the original error code are propagation for debugging.
> >
> > Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v1: new patch in this series
> > ---
> >  drivers/pci/controller/cadence/pci-j721e.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> > index 5bc5ab20aa6d..9c7bfa77a66e 100644
> > --- a/drivers/pci/controller/cadence/pci-j721e.c
> > +++ b/drivers/pci/controller/cadence/pci-j721e.c
> > @@ -569,20 +569,20 @@ static int j721e_pcie_probe(struct platform_device *pdev)
> >       pm_runtime_enable(dev);
> >       ret = pm_runtime_get_sync(dev);
> >       if (ret < 0) {
> > -             dev_err_probe(dev, ret, "pm_runtime_get_sync failed\n");
> > +             ret = dev_err_probe(dev, ret, "pm_runtime_get_sync failed\n");
> >               goto err_get_sync;
>
> Wait, no, this doesn't make sense.  It's just assigning ret to itself.
> That's just confusing and pointless.
>
Ok, Thanks for clarifying.
> regards,
> dan carpenter
>
Thanks
-Anand


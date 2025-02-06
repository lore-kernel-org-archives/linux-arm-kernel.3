Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7403EC02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKka8q8Has39PLR0Yd8RpCT4IAmN7UpWKg6ZilU2jFU=; b=zs6BvlVrClJC1cs5Wy3tpyWmb1
	bGvga0StB9Eor82bimbM89dzuVRYKPRljKdbepoKfXwN2psco2dl+pLM9eisVxWyztuwCJki+jHsU
	HscpLIlbsla/1ByX3ED8/3Eh91KIxbyVP/tyh4tGn++y6Wlo9c9n+7L/cR7mnQDPi8nJouUWLFufm
	GkA+LDg727+RaZEDHk5LnwwDZz4SfX6Ts06QpLeWGs++0zw51eq7K7T3uGWuA1mlZlAXTffU/HGRl
	K4J96LWd4Ze5gZSiH00YYZl3AOH3Y8Ep1MANdoFyJpIaPlN9uxWfCNk7GQEkH7WUsONXE+YWlfxPI
	1pu6+aBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0Vd-00000006DHK-2L97;
	Thu, 06 Feb 2025 11:57:29 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0Ey-00000006AGl-0wmw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 11:40:17 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385dece873cso322845f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 03:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738842014; x=1739446814; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKka8q8Has39PLR0Yd8RpCT4IAmN7UpWKg6ZilU2jFU=;
        b=OBGorFLbQ8V+lfXl+g36hAkY05sNnExg8LDbxOTZ4j5G33lMRWteD3/UuR4ir3Re1U
         NXCsyOCbdGsmgciKD1yH7QSTIpwW4SNTD11ajfJoFX5Y8bHkH+4iBFguGdXnmZbt4+/U
         bO+YNK9gKmrNj3nCPqlnqDzhF+gHnoj+eZ7bj8Uf/bfED+W87gxd/DsvRIJ/JWwZdKO0
         PykJbHQUsTx1g6vUiwLgpgMqJtj6OkgtHfDoc9TYQbKxvBbHCzs2goMp0vJHrk5WlWUF
         LgLFHeg+HKmdnEJlA0PeFGZnmO9zhpdDtUpKoqeXZPuWnfX8FYfdHYzgwuyEZaQKYdWT
         U2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738842014; x=1739446814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKka8q8Has39PLR0Yd8RpCT4IAmN7UpWKg6ZilU2jFU=;
        b=VrQSXhhwrpKrUOwM0rbTbITtDH1yo43WrV2EYVN7WuqWMnjVPiRsqfE0YDwmb22/m7
         ifP+zupWCBixY8aK0Oil+uw1n1rD3dhHHUEBzA/LESlNy+DVlzD6btiq5sWW2YJ2fe5e
         XXOnNg5vyXlae0oFiAPljwNiuqXv6AkfCTTagzsk0cToVJt8Wgoi52WE6S7UTLa0nTvG
         v/YSDU7N/1dWDZSGnxglgXNbI15LsoQTsh94I4L1Gj6cBl4nVqIjSl++d6GIGVvJ/oN+
         RWZkxyUa3KbIwSY1/2q42i4aaJi5yVCkqxMeJtvXFpgDSik+a+AThC9VTNYS06SuEfA0
         OLNA==
X-Forwarded-Encrypted: i=1; AJvYcCVeKRzRKB0OyNzlfCwJ72mK1Ri+AimOYK1fKIT3tCJ4EVDhbqn0C6clqnQH5AT73ddqmjDFp+0pvctWi3FcY+Jf@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7MDi/2zjpvSC9joeeFKYYfuhgBpKFgBFMuuSfiryFmajp/5vc
	nfkM6RTNr6l0Nn/FfHTc0/hpjBcpgkBUO52qk6qW+fvoeRbyQbn3ipMqGslz+eE=
X-Gm-Gg: ASbGncttUaCe/xJ/ACQFXG/1Tq7J1CA0hhZEm5ke6CPsRAn5z10ZCLIhemH/9JuIAok
	oeEnlKzGY0J2AMSzCXxw4SKSQDQ3+6OORnzQv0hiVwA4aIF8m8mWD9dYSbZvHKB9KaMP47oZB8C
	Q4dXOgqq1arl55zDbOlxWW2qc94+zF0RN9zQNt9zquxaxvukhHa+pyY1ZfWZpRVRL15Y6IShnAE
	EIr9dtG57pZ0VVppN0A1AJc8vBf7WyoUrn3s5Y4b8uoPnKyPcOW5eNCgPlXWo46GiBLu5wDhf58
	ujKr3T4YhT7xCoZ8j6Gl
X-Google-Smtp-Source: AGHT+IHK7xN1+O0lC7SA+Z4hYlZwlXq1mhwhsAv5rC/JniJV62KNS95+EeAeYIVWA7BzbT+PnwAdWQ==
X-Received: by 2002:a5d:588c:0:b0:38d:b6e6:4445 with SMTP id ffacd0b85a97d-38db6e647bamr3919617f8f.24.1738842014402;
        Thu, 06 Feb 2025 03:40:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4390d9334e7sm52136505e9.6.2025.02.06.03.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:40:14 -0800 (PST)
Date: Thu, 6 Feb 2025 14:40:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add machine_allowlist and
 machine_blocklist
Message-ID: <15f20562-d5f3-4432-94e1-06c8174bf3c1@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
 <230612a4-92ee-4acc-85bf-f1c47dc3c35b@stanley.mountain>
 <20250206110508.GB22527@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206110508.GB22527@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_034016_267091_E0A305BB 
X-CRM114-Status: GOOD (  32.89  )
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

On Thu, Feb 06, 2025 at 07:05:08PM +0800, Peng Fan wrote:
> Hi Dan,
> 
> On Thu, Feb 06, 2025 at 11:02:04AM +0300, Dan Carpenter wrote:
> >On Mon, Jan 20, 2025 at 03:13:30PM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> There are two cases:
> >> pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
> >> If both drivers are built in, and the scmi device with name "pinctrl-imx"
> >> is created earlier, and the fwnode device points to the scmi device,
> >> non-i.MX platforms will never have the pinctrl supplier ready.
> >> 
> >> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> >> With both drivers built in, two scmi devices will be created, and both
> >> drivers will be probed. On A's patform, feature Y probe may fail, vice
> >> verus.
> >> 
> >> Introduce machine_allowlist and machine_blocklist to allow or block
> >> the creation of scmi devices to address above issues.
> >> 
> >> machine_blocklist is non-vendor protocols, but vendor has its own
> >> implementation. Saying need to block pinctrl-scmi.c on i.MX95.
> >> machine_allowlist is for vendor protocols. Saying vendor A drivers only
> >> allow vendor A machine, vendor B machines only allow vendor B machine.
> >> 
> >
> >I think patches 2-4 should be combined into one patch.  This commit
> 
> They are in different subsystems, so I separate them.
> 

I mean if the i.MX driver prevents the generic driver from working then
we need a Fixes tag.  It really makes it simpler to understand and backport
if they're sent as one patch.  Normally we would collect Acks from the
maintainers who're involved and but still do it as one patch.

> >message is a bit confusing.  I don't really understand how the
> >"fwnode device points to the scmi device".  I understand vaguely
> >what that means but in terms of code, I couldn't point to it.
> 
> Sorry for not being clear.
> 
> The devlink framework will take i.MX as pinctrl provider, because the
> fwnode is occupied by i.MX pinctrl scmi device which is created earlier
> than generic pinctrl scmi device.
> 

Ah.  Got it.  Thanks.

> >
> >> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> >> With both drivers built in, two scmi devices will be created, and both
> >> drivers will be probed. On A's patform, feature Y probe may fail, vice
> >> verus.
> >
> >You're describing the code before.  Is it a problem that only one driver
> >is probed successfully?  I thought that would be fine.  What's the
> >problem?
> 
> VendorA 0x80
> VendorB 0x80
> 
> If both drivers runs into probe, VenderB 0x80 driver may crash VendorA firmware
> if the firmware not designed well.
> 
> Not big issue. I just think we should block the probe.
> 

This is a theoretical issue for now.  I would just leave it out of the
commit message because it's kind of confusing and it might not even happen
in real life.

regards,
dan carpenter



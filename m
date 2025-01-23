Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC825C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 08:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7vfNOMJ4n++kfz6xlTIcGOIzfhrBCGByHH6Dh+jmoo=; b=1JLaOjTu57LeWmzjkGLhl2QIBY
	7zbrUk8V6cPsBHxhBwvDeqI6g1nkdq2KSoWzEQ3uT5z++FBxRNbOMlP5UdpPoVrL09t46s6x5RM3g
	jpIpM/CJ0Pe//OBtfG0GFM1DB1Ny1kdGzyOkLdxp7d2rvMFmQmKJ/FhqsIp9jXewFMGQRbCzPGi6b
	5ZDx7cYrxhW7bjr24Lds8F6zZzHjkRnWZ96dSu3y6jY1nrk52lJPPTK94MHZDmjoeMKM58mD3S9Kp
	EZOK3RGGIODfbcHt2EF9J9MS6+c2y9vMLHYGtZ6NBFwbsN6BIXjzh2hrUZkrZOqsGn72/Cmf5T2WJ
	RgkYL4ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tasFq-0000000BwOF-3c6W;
	Thu, 23 Jan 2025 08:07:58 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tasEY-0000000BwFP-1Ty2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 08:06:39 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso507634f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 00:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1737619596; x=1738224396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7vfNOMJ4n++kfz6xlTIcGOIzfhrBCGByHH6Dh+jmoo=;
        b=wdjlDs5POk1Jbpu4aMpC+Kj6D1eF8qeUTraZLXt7MzAVVwNkP1IhglcxWqnVQUy2oz
         +kdSHYr8qc1PirMAiO8dE1CFpzdALxWSxVvAW0KA4+8QEMAZbRgHEZieuYpuwXtmEoLk
         HcZwqqNwxfSxTwySP668X/G5030rs9i7xn+EKVnqrq+fINeSr/xoMSMpatI8nZboDUgy
         at8b/+/oHULTkuGjaN1thEYPsCOPFHxRjICLy4lSBf9DIUhlIadeWvsuLhBelV0XAYrf
         1D8kGJ5gSakY6vZrgPPBVabcForL99tbFtYNk9/lrX+VH6k+UQ8IDV3MG+WlYVEJqW6K
         QgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737619596; x=1738224396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7vfNOMJ4n++kfz6xlTIcGOIzfhrBCGByHH6Dh+jmoo=;
        b=rsF6LIJ91TkIN3qPe0XpsSrBIqZa7mqv7HBBH4Kh7+QLGuyNp+ebYoWpoK0tLJfDT5
         mu/27OymbojNvWASemmUk6V7RvpnHKfXwzBy+xKIGhfHhGhaJoEJacq/+LINZwOzq9k2
         QZAXdx0Z0DaBSNubawFh8YNkMw14i/nhYwfHyxwvcb2N1PYAx2QB9LjXVscNmqoBjAuu
         P5I65coiO+ftWWIHUWvnHLvG5jOZUKZ60fkxZnlBOnpi62/O4NoqK+hJ/fvnAwCQTPeO
         cUOio4Mru+yTBCy3/Bvn8eVltLDzzdOWTRyv8fAngy4ErZd3PYyde8F4CT2YCp0RzMgR
         aLgA==
X-Forwarded-Encrypted: i=1; AJvYcCWtKtJu9xD0iAoQf/1ODQb7Mzr5oT/SW695H2ewBF7XtIGnxPmrD2Tp59dnv0ceuMiAoJGeT6kR1+o/vsAsZlWb@lists.infradead.org
X-Gm-Message-State: AOJu0YyV1mi4T9E3nuYPqj4SQuwUxip9ONv5+rybM6fG7eClik8NiHEw
	wsxv2AgC3FzKdQu73eB3lJO9wnUeg+UvfjOiEcEgoGjg0E1B3przV3/ic9OSD3o=
X-Gm-Gg: ASbGncvyrzuPsVtcFOsw1BR6mtnmq3owjt99eysuGI++AGQRhk3d+fk7nal9ZOSsSvC
	NOFxKJiMRmGLpqXa+QDyQEcMDCY3aXzn29eD96uSt2kd7d8Nk2fZ57ecpUQ1LoEhxp1+PdWBdYF
	qlpMLu5lrAjSXW1I6FkeEYJ82Ce/9Qrs+uNPbAZS+xXtsFzXWMZKo1/5fq0tBFBv6R3Wm3El4wE
	dkNEZaYd6JW+rVz3rulf79i6nMystnav6FQ8mBKsVrvBB9CZ6y5IINyDbhu/7ajL+Ms+KEFNHtS
	vE6xOubqcIIcGzk=
X-Google-Smtp-Source: AGHT+IFoSVv7AjtPcj5hMzm0WESMq53vzX3x7yD7jufTSV68NHpQ8JrlP4BZsZhmIRQzeL0cGJ5DoQ==
X-Received: by 2002:adf:cd81:0:b0:386:3a8e:64bd with SMTP id ffacd0b85a97d-38bf566464dmr15670016f8f.22.1737619595796;
        Thu, 23 Jan 2025 00:06:35 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ad40:de3b:e658:a016])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327e06asm18802231f8f.95.2025.01.23.00.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 00:06:35 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 0/4] gpio: mxc: silence warning about GPIO base being statically allocated
Date: Thu, 23 Jan 2025 09:06:33 +0100
Message-ID: <173761959063.8981.4421815655644713601.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_000638_666168_75ED0B05 
X-CRM114-Status: GOOD (  11.32  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 13 Jan 2025 23:19:08 +0100, Ahmad Fatoum wrote:
> The i.MX GPIO driver has had deterministic numbering for the GPIOs
> for more than 12 years.
> 
> Reverting this to dynamically numbered will break existing setups in the
> worst manner possible: The build will succeed, the kernel will not print
> warnings, but users will find their devices essentially toggling GPIOs
> at random with the potential of permanent damage. We thus want to keep
> the numbering as-is until the SysFS API is removed and script fail
> instead of toggling GPIOs dependent on probe order.
> 
> [...]

Applied, thanks!

[3/4] gpio: mxc: remove dead code after switch to DT-only
      commit: b049e7abe9001a780d58e78e3833dcceee22f396

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63544C02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 08:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPXgxL3/vPlBnnI2Yfl6MiqQiCTLYqV9DTTBZ0YDUTk=; b=kgPymQte6KwZWA1yoCDz3Jgkx1
	LDr3Srju2ZE7dJpNomqfUvkj+SpG3EmryVtadK1gHKNKu4sklCv9KxAfjC2Q8+fwKFZTF8MDWFsAU
	9OYyXN5pKiRQhu7s8ptPdNochwBLN6axh1P625rQ5H700pYXJWM+zTyA9p1yVKEr6VFpqglUjHevo
	BfLUGF8alaYXIqZwTKKGMbnk6crhiaXVTFBtXYuQLeGPEvAgW8r4rpZZHgmBlsWc0NRMhtZWXqcJM
	gDgNtSgrjNn6JUz0CG+VgPNcLAF+oPrhqc6FRaodLlPXW7ses+D55HR+cGm2NtWHAC1H2whSdDiu3
	Yx6e6KOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwwd-00000005gNl-0CsA;
	Thu, 06 Feb 2025 08:09:07 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwpu-00000005fdu-0QE7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 08:02:11 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38da66ce63bso268383f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 00:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738828928; x=1739433728; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nPXgxL3/vPlBnnI2Yfl6MiqQiCTLYqV9DTTBZ0YDUTk=;
        b=HNsBEB+Jzy/C/iMdeGdl0wb02L5gLzXsY/6JbbUQPHzoV/M7cGEIEzjAPQuiqJzDzU
         EiS0TutudzuZpuypQX7TKRpRxrmPUnYaSfqIMJ03r2Rl4Zbm0fTnUa1CYN/yo39ZLysP
         H9JciOlxumbpi8RGwLFBr5XFbm35LUf7R3npcZiToDduI8qGa37MQkRnecpqCoL24L5w
         9ijm2AFyuxnCgMAl2yjRPC5cChQvr0HhA4opJbffY2nUIqWdHHHj1GUfXcW6XCkTYgnn
         vSvoF098szKPXtuj8AacBc/YCSBI3h+PvsaRKu1Un9Fr7eprzJEHJUawsrjCYhIQ4Ijc
         zafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738828928; x=1739433728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPXgxL3/vPlBnnI2Yfl6MiqQiCTLYqV9DTTBZ0YDUTk=;
        b=YXAdaeM/D31/cCzF8bsezCnczKhc+uRAk1NNrvKrc+7AFnZFjvtQ7X8JclFbhWgH9F
         NYTcKUcuHhRBiigDIRqA9RlzeMbOMvc1cCEFoCSqKsv44zyKOfUz8zjFtI5KEBwA05Yf
         CvCf7BP91n9+KFGqvgaeDpFTKCtDmMgoTCqpuXqBR84AY3KG2RQ7XeD4tVAHS95ilU+s
         7UDCfHCkxgbfSOf3GD7V5U4NjWCWU4z65pcy7iQKHGncO3LvDXd9QLJLVUNxWpPzl5qT
         MIiWR1+hFVOl0oRvbB0C5joba3PLl4gNu6/pD3pRFxzx9spi7ou+GiIP+K8EkHR7FD5f
         CSkw==
X-Forwarded-Encrypted: i=1; AJvYcCVON5eDKbSk+hAtZexes4EHL8dh8hkSJ1O7rD7Pzk1n35uFaGobfOld/OPVkSqOmHW1uavdu/TI7VP5o7r7WlGs@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9VGtgu0SEinssPTxJ/VYx5JSnxHKRXqqrQpBAD1nNbYHYlgn8
	DdiD2Jq8toZj++OZWUHnxYFXTU3k7Cmd9NDUcQM978uUShgwmqZItLBqwLzWyW4=
X-Gm-Gg: ASbGncu5zYY2xqUDLW1Cw4ddtm8+ertnHu7fovGhkvfggBRJxymfHVV5t7w/n76Bcj9
	gMFfGWYf4og6WtgCuz2+GC5ZL3+Y19E2jM/5vFrRwnUJ00hCj7E+CVeqh6BIwXRlE+b2Chz9/1c
	Z947oeYtwCi7fzPPmh95CxY5+ZxUQ94nTYda+KehJ7YyNDLApX3vfuzvdeDpIwBLGafl5Jl+rEq
	RJ0gsRziUbnlzE1VgRd0Y117035lGJEzQb86kvnprw3tAMfqeky936PY9AszQ9Xyo6F6WI8Zpsy
	g3/J1tspbL1hNs1wn/5w
X-Google-Smtp-Source: AGHT+IEWof4zjE60RbTVNnoMwQe4mseAM8axdA44ewFLN78LsrMf1OHW5JZiuHAT9VHpIyLKYwWl9g==
X-Received: by 2002:a05:6000:1a8b:b0:38c:5b9e:ab83 with SMTP id ffacd0b85a97d-38db48caa3bmr5083926f8f.40.1738828928370;
        Thu, 06 Feb 2025 00:02:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4391dfd7d7asm10502945e9.36.2025.02.06.00.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 00:02:07 -0800 (PST)
Date: Thu, 6 Feb 2025 11:02:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
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
Message-ID: <230612a4-92ee-4acc-85bf-f1c47dc3c35b@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_000210_145265_2653A4AE 
X-CRM114-Status: GOOD (  26.55  )
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

On Mon, Jan 20, 2025 at 03:13:30PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> There are two cases:
> pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
> If both drivers are built in, and the scmi device with name "pinctrl-imx"
> is created earlier, and the fwnode device points to the scmi device,
> non-i.MX platforms will never have the pinctrl supplier ready.
> 
> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> With both drivers built in, two scmi devices will be created, and both
> drivers will be probed. On A's patform, feature Y probe may fail, vice
> verus.
> 
> Introduce machine_allowlist and machine_blocklist to allow or block
> the creation of scmi devices to address above issues.
> 
> machine_blocklist is non-vendor protocols, but vendor has its own
> implementation. Saying need to block pinctrl-scmi.c on i.MX95.
> machine_allowlist is for vendor protocols. Saying vendor A drivers only
> allow vendor A machine, vendor B machines only allow vendor B machine.
> 

I think patches 2-4 should be combined into one patch.  This commit
message is a bit confusing.  I don't really understand how the
"fwnode device points to the scmi device".  I understand vaguely
what that means but in terms of code, I couldn't point to it.

> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> With both drivers built in, two scmi devices will be created, and both
> drivers will be probed. On A's patform, feature Y probe may fail, vice
> verus.

You're describing the code before.  Is it a problem that only one driver
is probed successfully?  I thought that would be fine.  What's the
problem?

It should have a Fixes tag.
Fixes: b755521fd6eb ("pinctrl: imx: support SCMI pinctrl protocol for i.MX95")

Here is my suggestion for a commit message:

  We have two drivers, pinctrl-scmi.c which is generic and
  pinctrl-imx-scmi.c which is for IMX hardware.  They do the same
  thing.  Both provide support for the SCMI_PROTOCOL_PINCTRL protocol.

  If you have a kernel with both modules built in then they way it
  was designed to work is that the probe() functions would only
  allow the appropriate driver to probe.  Unfortunately, what happens
  is that <vague>there is an issue earlier in the process so the
  fwnode device points to the wrong driver.</vague>  This means that
  even though the correct driver is probed it still wants to use
  whichever driver was loaded first so if the driver you want came
  second then it won't work.

  To fix this, move the checking for which driver to use into the
  scmi_protocol_device_request() function.

  Now both drivers will be probed but only one will be used?

regards,
dan carpenter



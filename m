Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB381CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 15:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rxsm8dROfHJzJS5T442q1f8SyIa/yfC7dsK0KWY//o=; b=A+P4L8Kpn0h6YwAt0YmUWPs6CB
	BzoObcLxjUJeK3bX/N2pmIn7hds+JGliYpdv9KEQ8hKp4Rzn/o0sGnUjQSQRfS0CCrEP9NqlfV57H
	uF1S9KIRiw81j7c+5OLdXxdG1qyGC6RvhIMgAD0S4uvBHTVyU4+M/8aYKd+TRM1NXN01UcLvi9/dJ
	ZZbww608xQIQycZxQ9cvWJDWBrBgAme/W9Rxl1OG9GxCjaqIR/Ejr57rBIB73zRqTikFPbKfr2HZo
	0lmwbCbVnrmvI3wj8SCFpCedq2Qetpko03oAj+w6q6sfMB2jU5AkWzVwjfUkkWp+PJ8SaPt99fnau
	LbaB+J7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5nNP-00000000JE9-3Mo7;
	Mon, 06 Oct 2025 15:43:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5nNO-00000000JE2-2GJQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 15:43:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EDD6660579;
	Mon,  6 Oct 2025 15:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B325C4CEF5;
	Mon,  6 Oct 2025 15:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759765429;
	bh=U9taQDdhEq0Hr+LrDG0gIGzCorDNrdISkQr4eQ/LzLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M9wVRa1m/ER2+xT1SLzEI+eRcA3ZENPekBsLbBSuDM+SW5K5ZqvgN2Pl0lYu8qPLZ
	 iXr74DqgjReTkOFRsIoynkficpE2aHVAxYMCKLyFpC2dlpGTUFMZLBPnJ3+wdarTO0
	 0tsBt19WkNaP+VV/W+PKm6wTRxd20RXf2cXWppSrlvz3vNWHYM0tifMR6OOyuMG2aB
	 BJM/ENlMx0f2hoUmbwgFaZn54PHceuPvJa1Vc6uSGPi/fTW1TVfOtm+h+4VoM6fVrs
	 UvoovmWW+8cKyuRrAvj/v0dC37FRCu41fmn/X6sWPOgaxY+vSg+T+YORmBfB5jZH9h
	 8UqkyPahSVsoA==
Date: Mon, 6 Oct 2025 08:43:47 -0700
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Message-ID: <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
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

On Wed, Sep 24, 2025 at 11:25:12AM -0700, Dmitry Torokhov wrote:
> Hi Bartosz,
> 
> On Wed, Sep 24, 2025 at 04:51:28PM +0200, Bartosz Golaszewski wrote:
> > Here's a functional RFC for improving the handling of shared GPIOs in
> > linux.
> > 
> > Problem statement: GPIOs are implemented as a strictly exclusive
> > resource in the kernel but there are lots of platforms on which single
> > pin is shared by multiple devices which don't communicate so need some
> > way of properly sharing access to a GPIO. What we have now is the
> > GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> > doesn't do any locking or arbitration of access - it literally just hand
> > the same GPIO descriptor to all interested users.
> > 
> > The proposed solution is composed of three major parts: the high-level,
> > shared GPIO proxy driver that arbitrates access to the shared pin and
> > exposes a regular GPIO chip interface to consumers, a low-level shared
> > GPIOLIB module that scans firmware nodes and creates auxiliary devices
> > that attach to the proxy driver and finally a set of core GPIOLIB
> > changes that plug the former into the GPIO lookup path.
> > 
> > The changes are implemented in a way that allows to seamlessly compile
> > out any code related to sharing GPIOs for systems that don't need it.
> > 
> > The practical use-case for this are the powerdown GPIOs shared by
> > speakers on Qualcomm db845c platform, however I have also extensively
> > tested it using gpio-virtuser on arm64 qemu with various DT
> > configurations.
> 
> How is this different from the existing gpio-backed regulator/supply?
> IMO GPIOs are naturally exclusive-use resources (in cases when you need
> to control them, not simply read their state), and when there is a need
> to share them there are more appropriate abstractions that are built on
> top of GPIOs...
> 

Not always... For something like shared reset line, consumers request the line
as GPIO and expect gpiolib to do resource manangement.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


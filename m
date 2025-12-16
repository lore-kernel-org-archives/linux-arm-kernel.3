Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9043D5E146
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 12:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hzm2zWIxp6Ats+FaEL2tb955KZrPBO566twkC6OY4U=; b=CIaA84UzNSsvEuZo4oE1z4uOC8
	DwxpqFNspqqio7xrV/c8BlhVvsljQC2+JZDw7Dww8rAzPOz1sps+YSAKMXOihCZgWClD4MX0inoyN
	5ZwRB3JOGKwHaIZmJF6SICiG79prZIYox4ZpQUJ0Oql3DRDLY6WX90ZtOZilz1R9dJQTJk61gkAib
	NPgCbg7P9FmPPbZo9E54i/ypTOjfOJPjFvqO0MrvGvKfOJ92lPI9s99INGSLxAY7d2nSwOSp/Odth
	8hTfBKZOwFpNyexoEEOul30QsgBEKPyhVgibNpCJxFnLy4pYs1R/iqdZt0Hcd5QyrXAepD609DMsF
	tk7d1duw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUJ6-00000005ByB-34wz;
	Tue, 16 Dec 2025 12:37:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUJ4-00000005Bxn-04gR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 12:37:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A72C2404C0;
	Tue, 16 Dec 2025 12:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD50CC4CEF1;
	Tue, 16 Dec 2025 12:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765888652;
	bh=w1qYW2xmXgVfXXGeFISdHirQ14dBGp+01Z84bmcAoxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aR3wVGMDzNnIcKBOOE+/MF8FuwhIksnbhTapQBBhtqZTjhlO6x+KDxt4u7wGbRWBR
	 uIQGNnaOL1iJ6rj+u9ahs7nPsz7TyD8OD5xoRWm556DnhXi6uqhHyv48g19GovYZyf
	 +m7r7OrR/U5DziC0c02H5N4W7n3tho9s9qFCJoJxtaxgD3zmjAEPlDVhjC2pUX+I3W
	 TPeor9o3wMi6y0HglB/kEQLUwwqu9oenAfdpokaG5IjzfCfuUPTait/g8wp7lr5UdT
	 LnPVTqwgHpBylqiT3FYlEG3wede2hrslhhEgkl3t7efJEDN+YTgBP1+GZXhSeukbtM
	 hKJnAm77V8CXQ==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: (subset) [PATCH v6 0/7] mfd: macsmc: add rtc, hwmon and hid subdevices
Date: Tue, 16 Dec 2025 13:37:12 +0100
Message-ID: <176588840252.31586.16326303552542183142.b4-ty@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_043734_092621_183AF631 
X-CRM114-Status: GOOD (  11.36  )
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

On Mon, 15 Dec 2025 19:37:44 +1000, James Calligeros wrote:
> This series adds support for the remaining SMC subdevices. These are the
> RTC, hwmon, and HID devices. They are being submitted together as the RTC
> and hwmon drivers both require changes to the SMC DT schema.
> 
> The RTC driver is responsible for getting and setting the system clock,
> and requires an NVMEM cell. This series replaces Sven's original RTC driver
> submission [1].
> 
> [...]

Applied to local tree (apple-soc/dt-6.20), thanks!

[6/7] arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC node
      https://github.com/AsahiLinux/linux/commit/faf317d4c705

Best regards,
-- 
Sven Peter <sven@kernel.org>



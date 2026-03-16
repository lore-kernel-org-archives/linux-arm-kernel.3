Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99335F013EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 08:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnLXTziv/oESSosjbc2G6ZUToQZc8/ezPhvrWzY5E6I=; b=ne3KbYtJyiWs1HaspjMv3Gv2eO
	2gQc9jLtBZ9mgyPSHoiX4TPbK8v9vZQx1AioxvIAFtdlqmcxhKNqOGXgNbXL3aRt+/WR2oE8WHr/l
	BByD3ykMSCLjors5DyLOkTvehn+ShlkTo317cmb0pTgTHqPG8mvfOF1dWCH6PQAYQ8zaJQdWEeYDJ
	iozk96N1bxMJqMn2JrcOL0N/BvE2dyhZEHjzKAE6s9xYF6kByWozz6AsRKkJmPsixpWv2tkkt0biq
	5vVg+8ajySh+BYJdi+hu9okkrGSGazTu6oIS+Pb8tS6ZirwIeLChNHyLsXzGLiIiGKtYyfRTDQSV5
	DvtY2OsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23n3-00000003aek-0yXf;
	Mon, 16 Mar 2026 08:59:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23n2-00000003aec-1qG9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 08:59:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA7A660121
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 08:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899AAC2BCB5
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 08:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773651547;
	bh=fnLXTziv/oESSosjbc2G6ZUToQZc8/ezPhvrWzY5E6I=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=a8exm6Fbq6etXnGFsBdBrURZx0yeI/cTOHP+fXrIO3uSPcijpPAVNJwMsI6oo6aGr
	 5Crj+6k1B03QCECDNIcrzNGJsg1k1LkfcZ8pibpnKBB0oxTlIGOz1gJkbBthv5/4DD
	 7+wLgBwWrz1M533nqA/Pa+2KJfBuznIx0UzCS/A4FzPcFSHvjwrWFfBv6M2SAWZNwX
	 s7M8w6kya5RLQlABkZYqBWjT005u1wjfgkCb7KM0ZMxezZQ3Yc+03faLZ6hPoai/EO
	 /I9VmOvqqxn7Ubp7fPJAkvhoMipkh9Ru7K1gqs/6qjyfeKELKSxC9ne3BsZNn6NESx
	 g0ob5SV3aqzkA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38a3fd333eeso34797481fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 01:59:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzX8qIH26RgZOs3ZFiag9OcVHkkunVqtfCSMQnrm2ig0XPRSOfoTV1GXZFTTsAvEZ8I8bv5ZYYE+lNC8aXIzbD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5XKF5qXPRroIdjK60f6bwnVhJxsfEhn4gLKqkG8I/zM1l6Wy9
	VRgh7RP6f2cDDoe/Hef2uwkqlEjWOBVZiveJxlOnvXpHYO1J1Ywfk2tK+D286CsTdLQDz71c7Ty
	Qi4/l2aoV9nhPZNoCq2VFUNoyLgW6NC1UREYAyk7Y7g==
X-Received: by 2002:a2e:9e4b:0:b0:387:5ea:e298 with SMTP id
 38308e7fff4ca-38a7278e904mr35834111fa.8.1773651546169; Mon, 16 Mar 2026
 01:59:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Mar 2026 04:59:04 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Mar 2026 04:59:04 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260314-asoc-arizona-v1-1-ecc9a165307c@kernel.org>
MIME-Version: 1.0
References: <20260314-asoc-arizona-v1-1-ecc9a165307c@kernel.org>
Date: Mon, 16 Mar 2026 04:59:04 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mfsv+wee_v3f0shhOw9owKi2QRzh4ydPWMK4K7DWmdy4g@mail.gmail.com>
X-Gm-Features: AaiRm52T7Yjh5LiUALQVcYnPD3UPhNluzpKLRyKl4GR9B4seATU4YtXWIzOG9uE
Message-ID: <CAMRc=Mfsv+wee_v3f0shhOw9owKi2QRzh4ydPWMK4K7DWmdy4g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: codec: arizona: Convert to use GPIO descriptors
To: Linus Walleij <linusw@kernel.org>
Cc: patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 14 Mar 2026 23:56:49 +0100, Linus Walleij <linusw@kernel.org> said:
> This converts the Arizona driver to use GPIO descriptors
> exclusively, deletes the legacy code path an updates the
> in-tree user of legacy GPIO.
>
> The GPIO lines for mic detect polarity and headphone ID
> detection are made exclusively descriptor-oriented. The
> headphone ID detection could actually only be used by
> the legacy GPIO code, but I converted it to use a
> descriptor if someone would actually need it so we don't
> just drop useful code.
>
> The compatible "wlf,hpdet-id-gpio" is not in the device
> tree bindings and only intended to be used by software
> nodes if any. If someone insists I can try to add a
> binding for it, but I doubt there is any real user so
> it seems pointless.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

I expressed my opinion on ABI compatibility elsewhere in this thread but
for the change itself:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


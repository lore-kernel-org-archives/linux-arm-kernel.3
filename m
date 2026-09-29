Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD331CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 08:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=; b=pkZCaqmTDPtbQGllviGmashOgI
	JwD9W6JtdzLoW+erKrg+e9uCott0DSzjWWp8P6YB55xWYRvwosSpXn3oZkt7iDmzv+ishT98hApgV
	ZC5kNstogFDrKBpe6jEQRSIvjhgJw9H8MIQWG9EW3OYsqsOFFG3/9Y4C9KgNkmdv53xcHcKte2/hH
	UYgFYA6rgz3WI8n1ukQYQj4kOmDW/mCVHC7G/rTZVn2YFhQ1sN1xkftfNAm/PXWTREqQXbZALhxYY
	zs5Lsy4J7Cvtb8/eN3EzPXnbvRCukTaj5dIFmiOfLRxHHW6004lfA4BvSzpm8KK+NsVr3rjWQNgG6
	frHd/9yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTe2-00000002tgO-3pWP;
	Tue, 29 Sep 2026 08:57:02 +0000
Received: from mail-ed2-x0f.google.com ([2a00:1450:4864:33::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTe0-00000002tf9-1zlZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 08:57:01 +0000
Received: by mail-ed2-x0f.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so6281888a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 01:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790672218; cv=none;
        d=google.com; s=arc-20260327;
        b=gre25e914sk24QiswXz4n0CzVtEUXnbtPcxQ+DkQGRRN+Rjm3lkung1gGV15mu8gWb
         m/i+SGKmI+RUUuZHXGYv+zB2r2zEqZ5qUQvzY4SbWv9lSn/zIy9Vigm47rf22tCobjcw
         VI9jJlz/a4jv/RU6/qFarIG5f0VjnkON/ATYbQH8XIlBSZZmVlnCTSeTUIEwHuJYEqPI
         XZMNGFDR6nI0D+94yCik3bXGKWQDrIjkNmROC+TuAKRmZ4kryWajuV6OHWMYzRJdCIBm
         Ff5fqvoB/X5MObgpa8C+I2vvpwQ8mftQbVsgflsZsJ5QXtT5YuQQsJmDuOmkyapJK2kQ
         I/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=;
        fh=prmFIRwgFVGkoJDBSuySLjiJFOHpVmeZkHpFIrNVxDo=;
        b=jodHRk25SPdJRrgw4KzjNvQbwEBarEAKRO2qXItdvcFlxQNDSnBanwe3WI1UvV8Dk+
         JvVJwsnz2v4ODP12vXFxu8iRznLrtghoe9YgnBvG/gYC/RxNqS8o5u5xeta+25TttcZw
         H9utJF8i7ndqbqDQuw2+fFE4SHmyF3WLZWfamBJI7h5mTevc7SV9/FHSR2Dfsy/54LWC
         IusiNfCq9KbygeOOYTFY+NOI1TOUsF7jN/jZkdfVNbdtBqfnqst1jH7PcVAgRv8J3hVg
         O81j+Vw/jeW0+OBVEFCqf4ot9bBbNZxHrNlzMBUQR3whxwjLpxqleO1z1+3+J7E7Fq1b
         XFww==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790672218; x=1791277018; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=;
        b=HrQcOXtR5IJtCpfd803rCMl5E0vfbzZYPT6A1D194MWtvup9ALmiHtpPb1mpoODVhV
         sCiw/b1QXUqi+QA2Au+W903pL5oIZVmbQhmI8ZPX1b0c7hvnpmCq4Wgu2rs92Dn0u6tX
         XRfCOX4U90yR5cbvoOWLUoj9XO7+DEm4Ytkp/S46Oq4ncwPFs3J5x1uOTCccSxZTzUHn
         DAPi8W9smcc9c+3oBwUDFL4mu5zDhdyyG8uh6zCl31NKBqribi0fNvOYaVr+HcoCZq8f
         mG37R2rfAxtHgGVtC65vQKwPOKXItHr5GVG2issPxRBOB4KKVjlwTp3ACV8iTXufNytz
         FBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672218; x=1791277018;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=;
        b=Fz6+P11tn+4xn8KVlj1hfEbHLtA6zf09iFVr2zzgdavUpTR5Hb+qpOrfz45wG7Seds
         trwgFdUa9CISma8ZRA9TedZRCzCjvSd5U9RWhnRckBw0pse/qzEML3NKdkN9GKAsKdBg
         VQ1icNIA8hhs8mKH35PFxwKaq2QA8shjD2e4A3FcN4qnsk3HGNv0xdtRr/i53qb4Gdq2
         og4Vreg30DQD5a0oDsHMtrpeAGzyIf8TJeR6L02FuD3Rfhc208VoFkHsDBxbCGkYo8ou
         8SSColwAqCYoKAJLpfR8+vUMQyn7w1tY5ZT7kjnJpwUpS1+XDTUbvnP7hUWMO2apu+Ba
         qjxA==
X-Forwarded-Encrypted: i=1; AKwUvBzFEbZz2EOSrQN0rAZoMc4zh9euLsDcib7hCSlaIWVih3aHmXN6K7ct/C3RJlApDHtCQKWAeoQEznBQAWRPaPKn@lists.infradead.org
X-Gm-Message-State: AFq9FYL9D3DTEyL9Hab6gZXCX5pQIgIeAqWMF6agGC7l+55PxNZAeg8o
	NTCQkjWEWXfhAorev2+Qn+J21/K4d1WFzIDpPPTSbIDhVUnS9cQrXcNQqvkzmpO61wr9LrN5RJI
	Ds/HKATOnslo6rFJNZRUUSRFndcqbtc6Jo6DJYHjpbQ==
X-Gm-Gg: AYBFou1NWffdqBuUTzBINaymlAk7YQHdVV0Fi4kO1Q54sA8+/D5EZUpfbyejnW1ARIW
	GI86EB3Sjfsgwvzept4wbnQWN0LkVJw7xMvB0cf6nBk2OXCCQUILLXPVHn0xBry3QWvxOHnVwCk
	NNrOYXPYG+Q7A0S3X2d3yzgehlq03pqIWaICXU+1hCTtrZ7x13Z/drwxG4qb+QKo27YI+2oFAKg
	oLRMC358Nbgf8WEbNsWx1DE7AT8EWMne0TP8p6G4tsqw2dCBUyPKEKv7M51tODF3KEno965iSEQ
	yG9eNllAlcpL8HK9HuWWSBg4jBXT47Ryj/E+vy9M3AU8mhUUa4KeFhTpT/Dwzhz+x3Cd0aWGVzl
	rFa/3dI/Fga1W
X-Received: by 2002:a05:6402:1951:b0:6aa:f14f:556f with SMTP id
 4fb4d7f45d1cf-6aaf14f5874mr8695635a12.43.1790672217943; Tue, 29 Sep 2026
 01:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
 <20260918-contrib-pg-pixel10-initial-dts-v4-3-745eaca28b1a@linaro.org> <7553dff6-004a-46a7-88c2-728651366113@kernel.org>
In-Reply-To: <7553dff6-004a-46a7-88c2-728651366113@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Sep 2026 09:56:46 +0100
X-Gm-Features: AclHuK-S5lTQAo2phJ3ee1A6qOipGEmCVgzdBHBpPtrnraavkUJzNtrZ-i9YXbY
Message-ID: <CADrjBPrUr4+oa2jFJw8PkFbO__Ov91Do7A-h8xp3zdePGQcMKg@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
	RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
	William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-serial@vger.kernel.org, Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_015700_542610_453D58E1 
X-CRM114-Status: GOOD (  17.60  )
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

Hi Krzystof,

On Sun, 20 Sept 2026 at 16:16, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 18/09/2026 21:05, Peter Griffin wrote:
> > From: Douglas Anderson <dianders@chromium.org>
> >
> > Add initial device trees for frankel (Pixel 10), blazer (Pixel 10
> > Pro) and mustang (Pixel 10 Pro XL). These device trees are enough to
> > boot to a serial prompt using an initramfs.
> >
> > Currently only Laguna B0 silicon found in mass production phones is
> > officially supported. Further revisions such as A0 silicon and EVT
> > devices maybe added in the future if they are useful. As of today,
> > these device trees boot fine on EVT devices with A0 silicon.
> >
> > A few things can be noted about these device trees:
>
>
> I actually forgot if you intend me to pick it up. I assume it's not for
> me to pick up, but nevertheless let me know if something is needed from me.

Thanks Krzysztof. If you could take this via your tree for this cycle
that would be much appreciated. I will then look to set up my own SoC
tree moving forward.

Thanks,

Peter


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E57ACDDE64
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OOvHNGAVgHImRA4rtLY0Acms6nJmTWGumvJk2gBIAw=; b=K1/AaxCmJO11xSBUqzL8H7LdPj
	uwf5YX3OVFPtrlirCjM8IfDLIC444IRZWhgJzdtXhOHzBIxuvu88xa5zgfprMeubM/iIcL8Gft3/o
	MbHtYv1vw2Hr3j7ozb94M3rpgIRYdhOAvKXmAgjr/i/Iam2yoAKCtKuJNobNT4rL8g2z09VV5ma+U
	ipbEa9mKpBxldvHv4uDPAGPjynQ+9MK2PNOYcH+uMwKLAGhEXYkmnOYUpPMDXIYrMXyUPgVUkKASX
	fv0O89SY6x4+MjzciP87H61n6RigG2SXeV6OH9P/ncnkaHPoxgUZ0tbcqRUgVRrJIYrnSktRmnrkZ
	2DBEfA2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Ytg-0000000E2Yn-1Tgu;
	Wed, 23 Oct 2024 10:47:24 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YKa-0000000DwA0-1kOM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 10:11:09 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539e8607c2aso7295928e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 03:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729678266; x=1730283066; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OOvHNGAVgHImRA4rtLY0Acms6nJmTWGumvJk2gBIAw=;
        b=Kvm9cBnfUNGDdZoePqFyQjmB12nsYUTfoVODT3SC1cVt1hs4DPSzgVpvGlmoUyHFDQ
         DToXBuXmryfhReSCRGP7rrNlV+9/0w6G159OJZC5cbobRAZ7gaKsaNL5JSp30mj5SHLh
         Gt8tsVqM+uD6a+14d3GAszo06Fl0Bj967E7d26cvXAB0xqE7TT0Rv/HIsHPV+uvQ9r9p
         4BfnQJ2n0NHbQPc82gY20h4UuxaIr6RjSTbSh3FeSgGFi4VOHITXuMkfS2bfOD7BggMh
         kGi97GVpyaLpvCiu+e8QE/DHCAsJ2s+dFnvZ1poux3gs66BrwWK4UdGfFqQifpIaa8Ig
         Ojbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729678266; x=1730283066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OOvHNGAVgHImRA4rtLY0Acms6nJmTWGumvJk2gBIAw=;
        b=NOqYCfMHGoXUDlyFD826oVx/TL0e6fJY5I4gpMXjayi1zxVuwsxbjk1VdLycogPzOH
         RRjbR0rvmy3fHmFUmEOzkIbVsYyh4XM9D5cFk5hJchYNOKU29VFuGccle4n76CP+Qeg6
         2jEXg9mY/sp4unKObd6g4X1wL+Iu4CNSyw18sCkntURPehEXwLfs/DcWVRh6Br7B+9Q0
         UviPRZ+k2Iklk0w+bcVDV+qE6CczHlnFASG9xHfoYQDm8E0pMpzf4FR/zQ0Epf+LdbYh
         e0scEyqTLXTOxzSlfwGMz06o0ozuiVreSmCOvzNuqo/nkGa+2KLW+Su6elmIXjsSv4QL
         ehXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpQcaBZ5qAPMFEsex5sONhpYwzLPk8qIcUb5izmKN4LVkGGnBTlCofRxAFAuKy6nn+Gks/dHy1bIdVudNLoWaC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3cK0fMw6l/QdsR2Czbi8udazr9BaBuowz4FBsnnhjTp7BXu62
	6dSUokwIbklaTzd7LmMsEDDbh1Pdoj8o4+usO/oOZmWMQ7MB9MWAxd7TiPmO/G+H15N7oG2fCDu
	Gly0VNFqrIfLM5hfDwd1iXsgSJyusnnFduxWP3A==
X-Google-Smtp-Source: AGHT+IE089tWVwoXd/8Hysqc4S/uDg7EGVHjVvwgua3xypehCFmJa3XmQQ+EwelSROlylF6cOjc2uO3oYJn05SS9GVs=
X-Received: by 2002:a05:6512:1114:b0:539:fde9:4bbe with SMTP id
 2adb3069b0e04-53b1a30512fmr994214e87.20.1729678266366; Wed, 23 Oct 2024
 03:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <20241023044423.18294-1-towinchenmi@gmail.com> <CACRpkdZP9oDd+fRKKagFtGbfLx=Rk5LJ7bvaKimw5-t25XZAfQ@mail.gmail.com>
 <5e1b807f-82ac-4ab8-867c-32b2bf2a91ce@gmail.com>
In-Reply-To: <5e1b807f-82ac-4ab8-867c-32b2bf2a91ce@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Oct 2024 12:10:55 +0200
Message-ID: <CACRpkdYjmwHaHPTmjOKR8E9kYQBZAx04Ydby7HKZzE3KhbNh2A@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 00/20] Initial device trees for A7-A11 based
 Apple devices
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_031108_480356_6021CA98 
X-CRM114-Status: GOOD (  18.25  )
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

On Wed, Oct 23, 2024 at 11:37=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> =
wrote:
> On 23/10/2024 17:05, Linus Walleij wrote:
> > On Wed, Oct 23, 2024 at 6:44=E2=80=AFAM Nick Chan <towinchenmi@gmail.co=
m> wrote:
> >
> >> This series adds device trees for all A7-A11 SoC based iPhones, iPads,
> >> iPod touches and Apple TVs.
> >
> > This is a good and important series. FWIW:
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Are patches not getting applied since you resend them?
>
> This series along with the watchdog reset delay series mentioned in the
> cover letter have not been applied.

It seems to me that the watchdog series is only a runtime dependency
and these binding+DTS patches are well ripe for merge.

I suspect the three Asahi-affiliated maintainers are too busy with their
own stuff (like M3 support...) to respond or queue patches as they haven't
responded to the patch set for the two months it's been floating. (OK
Sven Peter did respond to some v1 patches.)

If nothing happens in a week or so, I suggest you just send a pull request
to the SoC tree (soc@kernel.org) yourself. Perhaps you should even be added=
 as
comaintainer for the ARM/APPLE machine support so things do not
stack up like this?

Yours,
Linus Walleij


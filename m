Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5D3C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 16:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03CNHJApFKuIItIyArXaqYORwbEMmfvmo2iXGsI2caQ=; b=JT+Onew+FGOypvez5bLcX6nznP
	9jhgF8C20IjxZ8N1QMBJ9P5o40buGh4Eqnj1iCeOHpoJ1JJe9A+1dHiMs6eRa/dDLI8P5RYJnj6Rh
	bETTwiEtmEHnUXQl9HnZ6n00LrrFqUNG2aY35iQfBHx75B8bkyWg7n6Hd9yF1b8XUPcoH5JkzbhsH
	VjIGgHTtFcDKaABK47vX9ff5nknZ6z1C/OA37Ss8rN42iu65eCZvXrilaQwDc78hKmLNgKt7YFNSg
	YQQvLsiq1LIsGLatPRhmw/SchKW7cVZXg73z/9Zqkxx8wfob/+SEmMutoXVMTBRpRXq8mZcKT4+Iv
	3t6nb0Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSO6-0000000FSrh-3zL5;
	Thu, 16 Jan 2025 16:06:30 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSI9-0000000FQmD-41uZ;
	Thu, 16 Jan 2025 16:00:23 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so1939336a12.0;
        Thu, 16 Jan 2025 08:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737043220; x=1737648020; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03CNHJApFKuIItIyArXaqYORwbEMmfvmo2iXGsI2caQ=;
        b=eJNwG3Bzy3E8dP51Zjxk0vpLCiMKBotwB+D3tTAZNgTAJTW4ilMQ33SFY/QTotJ7p1
         I7QFHRl4NdOWEGuSgKj4dBgRtvt0laNl9KEju0G9pSFRNzc0nEARN0wcCo7voFgNjHus
         mjZuhBErVtKCnl/IuXw0n0zPA9iFxSl1dC/mfN5Vz6l8nWHIXs3z/G9eIXS8547c8JAK
         tcJl5UK90bGk0LdxygT0bcWNVR8DpnrvEA0pgqdnxr5uBEY2MdYp1tJHJFZQbiSZbVuz
         9vkT9iWFbm3YEwo9ZR5hJ56NZS/ZJwIN/RC2WMTo5VyTgOeeNtUYMI+on6yDXYuyZfEh
         wO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737043220; x=1737648020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03CNHJApFKuIItIyArXaqYORwbEMmfvmo2iXGsI2caQ=;
        b=clb4ldgacdWKN+0oDfBIKJ3ejZu001LJsss3DhybMtEy8iQU1lk3HiwtqJd2xFqhBl
         DKhISJQld9PNAP3VfAYMNpk6Zew2BVZPPN+rxQRHFL6dngqE3mMFw5Gd/H0if9WZROa3
         KC13BQLaUCMN5eCDhe2wyZ4ApjwpYHgpFwg7CtH0J0Wybk0mPgEcPptlKejwXxVyG4xC
         RmHz2ld1qg7cqwF8dWOxIOKdyfySaO1J7mlo0vk7TsR35hvxYBKLHsYnMGKNjxGLvb5/
         fsUJuudYbEfnbQ0O1JOvfr+tSLS+erWLaYqGTwa67JIbWOJ/bAK/Bz0LE5u5tbEd5clT
         yuSQ==
X-Forwarded-Encrypted: i=1; AJvYcCURIblKrnB6Icduj/8Cwa6Ndm5Mz1PrzdMhIsYejKyopUJ/b33xa+1Dcy15P5p8yz7c/s2cElsQSFU2dE9widoj@lists.infradead.org, AJvYcCV66hl33RJPSzw6Eh2LDu4eJVGd0HYZrb+QWf3sRc6MXT7JEbSMh2qC8zo3tzdsF1Aq7Df/My0bh8dc5wVv8Ig=@lists.infradead.org, AJvYcCVxJT0amuVPuH9tWKY3r/dkPG92hNyyJPW3S1oI1oeZDjJ67nI9ULGV/G9t5Lb4463gQ0y7mRYEoKod@lists.infradead.org
X-Gm-Message-State: AOJu0YztY8QnMPeoHCnrdnh4SW3Dfp8vegYX9rDSdpAtaiOelwFzZwrk
	mJB3JvgKSgE5NiH/3jYhvoFKXfd5XP/wi6LxkwZe2mDS+xy6RCLlW1YkKp+0HFX6VFrJaS6y4b8
	sserAfIkoDr3pCpSOV75GqKWwq6AHsFAL
X-Gm-Gg: ASbGncv2Y6EeSvMMLQ4g3bEFbkNXjrTyRb6UldMTA1RkEO/eJWvPlAWwInpcH5vEUPl
	bkpvJTpzZ06G9p0UD4DIIlGjexKv3roOuIQBVGRU=
X-Google-Smtp-Source: AGHT+IHuxtD1JvcYemQsyiIws6tdFTgTs+4qivEFZoap/TFlX96ws2N0XRh4Mzzuy/ekqhM6BhFqBHePlBLhuYIk58Y=
X-Received: by 2002:a05:6402:35c9:b0:5d9:f402:16a0 with SMTP id
 4fb4d7f45d1cf-5d9f4021a86mr11833443a12.22.1737043220056; Thu, 16 Jan 2025
 08:00:20 -0800 (PST)
MIME-Version: 1.0
References: <20250115012628.1035928-1-pgwipeout@gmail.com> <2EEA8028-8E4A-4588-A480-E5FF0F7BE82E@gmail.com>
 <CAMdYzYo2W1hLgiH697AdRSUbhBU4rU2uB=N6EMWMD2-0R+VLBA@mail.gmail.com>
 <B1C9DA16-F285-4AD0-AE4E-AF1A5CA20932@gmail.com> <CAMdYzYrxX=RsSZja-3+zLZUSpyLoRz8Zm0w0hTfL3RQ9cjqgOw@mail.gmail.com>
 <3536B507-8658-4377-A1AC-2C5D9093BDEB@gmail.com> <CAMdYzYoCj9FsyHdTQAOV4DFpD7OdMDaJ0R=BBxXG-SLguy512Q@mail.gmail.com>
 <F69CE715-C0E4-4FCD-943C-89CC1D3E848D@gmail.com>
In-Reply-To: <F69CE715-C0E4-4FCD-943C-89CC1D3E848D@gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Thu, 16 Jan 2025 11:00:08 -0500
X-Gm-Features: AbW1kva1Q_Tqsgtr00KCSe1Rmn_xPDMkxiMe43I-JtCUAF1Z05Q1Na6dcupVLX8
Message-ID: <CAMdYzYo2gwJw_HvhS-gsqSMFof+n0dS1LUhVznL8bRZWYp_wHQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/6] rockchip: add a functional usb3 phy driver for rk3328
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Michael Turquette <mturquette@baylibre.com>, kever.yang@rock-chips.com, 
	linux-phy@lists.infradead.org, wulf@rock-chips.com, zyw@rock-chips.com, 
	Dragan Simic <dsimic@manjaro.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-clk@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>, frank.wang@rock-chips.com, 
	Elaine Zhang <zhangqing@rock-chips.com>, Alex Bee <knaerzche@gmail.com>, 
	william.wu@rock-chips.com, Zhang Yubing <yubing.zhang@rock-chips.com>, 
	Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	Trevor Woerner <twoerner@gmail.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	Vinod Koul <vkoul@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_080021_995195_1602C497 
X-CRM114-Status: GOOD (  10.67  )
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

On Thu, Jan 16, 2025 at 9:35=E2=80=AFAM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w d=
niu 16 sty 2025, o godz. 15:02:
> >
> >>
> >
> > I'm at a loss here, I applied the patches to a clean 6.9 tree and even
> >>
>
> oh maybe issue is in kernel age?
> 6.9 seems a bit quite old.
> i=E2=80=99m on 6.12.9=E2=80=A6.

The patches were prepared and tested against 6.13-rc1, but nothing has
changed significantly in the kernel in regards to rk3328 clock
handling in several years. I jumped back to 6.9 due to dyslexia.


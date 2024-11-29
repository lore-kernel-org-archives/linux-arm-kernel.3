Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27754D6EBFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 11:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOU65vm/LSIomsbDKHI2BR+2CFwDzAWKrSYahD7R3ms=; b=21MjivG9Kyp41HDYWpu+PO6y0m
	11nxj+8BEa9qCqU8V1KSVJIqedlV3xVdqhbOYIWilt5n+vHfuiQj/XnRjd51Ut/rwyiL6LnFGwXKk
	uzKxJ0W/T7Wmt+UEIrldDEor6F603clZQ8AtaVj44RDMnsZUSmA9gQWnnteMczZjedotO4T/TU89N
	iMNKexapMDaLOQz0eMJc2lFB97JB32R6CJzj70wByllEI/CioBmB2odI8EgR/WZPpbGuNdckfJgxI
	9mo2b1we9sd1E8MJYAaM0j983BvB7+FAWq6R39e07bcKNL8EqZvKD2RQwry2if2lcSzqw6Gdz++/Z
	vtAr8yFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGz1t-0000000HWb1-2sP7;
	Fri, 29 Nov 2024 11:19:21 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGz0u-0000000HWKY-0RYp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 11:18:21 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53de6b7da14so1791154e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 03:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732879098; x=1733483898; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOU65vm/LSIomsbDKHI2BR+2CFwDzAWKrSYahD7R3ms=;
        b=PwouvRmdQiUFAtUz+BilQy8otScMi8xpaaKvpqLXldWhTpot8dMzcT2bXZtc+jj/LJ
         JOiEirPHc9wUASCyA9+9zMVFICYppxwKajjrzpP5ow1AEEWeV9PJiY0jKljMxW88uONO
         I7KeZuLilkIhbHbtM74aBibS2s17VRYs7iLH80dzH3D0G0FWlz9eqaYXbVvPIRwPBouw
         Gxtu2npsLdFZAA1u+lMVRK+rzJvZ1YNi9EbjMuQwaD/KDCU5anPhoqjyLYCOi5C3rhFE
         QZtFUVw3p3p4dF6GhiG1sgAbbnCb7VJeoR/1qPTCgYx7rMZrF1/SeIh7X6/DP6ZwwPzC
         lUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732879098; x=1733483898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOU65vm/LSIomsbDKHI2BR+2CFwDzAWKrSYahD7R3ms=;
        b=GAPWDIpqygNmPBsG1bXP1THNK38mZCKx+LhtkNj3dOjfKeVNeoIZPP6bksNXk0iagP
         i5E40aV+vYjQaxb2WAN+fk1Mo7wfFVbUOIEp8NFLntStAuPAMr/0O2NJgjEIljaweUm6
         +7AqTH9f2/ziuciMb2cZn9Ve5fPGzWXgGpUOSTcvtzSs1cy0ByTiHYv9JIiOm4EjjzrP
         4Kaj8fzq5LJU70vQuiDOFv9RHYk7R5X34uEZPsEiZyog/pp0jU9p8Uw4gQxjTii08azt
         n288uxUkWr3IwMvvHwAQWJeGr2sd+s3DSjsZN4EGivuivY7d3PZmqhYE3TOqs+3y83Xt
         5+WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXigzQjd1Lc7aPR2aWon8GcGlgann7c+PTaqEoPrjhdjqYGFQpH4DTxfpvfI9qlXLJSibkMF6KwrJUDBaTzptR/@lists.infradead.org
X-Gm-Message-State: AOJu0YyD4Xbj06djLvOwdNtwsLFIhWpqRkEcqVl0V3hezwX4ZRVLB9SW
	mQ0Gquu66JJKqaiXTbXY+KWltdH5NUs13eRIesG6W6uxxKt7kx8UdF2mgJ/loQe2eQ65D28dVJm
	fgCEutO3wOFJS5IFLSDtdpvgMLXA=
X-Gm-Gg: ASbGncuoS9twqUNfKJ4esuVGM0Z+6gUrIs+7fkQ/cYR5fn4MvxyaamZOrySw9URQXUH
	bqn+9a4eSuyULzdSmP6TuikWWm4gnXtdeL89/6a/zmr1yHrhOZtlrk5uzyRvcLuY=
X-Google-Smtp-Source: AGHT+IGaUUHzoanhVPRPEfEi0nJkI5YEmDKHNF2hGMFhFR6CkwGEiLoh9eXbuUcramkmRyujAOMQr9l0pEIc/VPNtF4=
X-Received: by 2002:a05:6512:3d1d:b0:53d:ed16:7a43 with SMTP id
 2adb3069b0e04-53df00d3d4emr4322112e87.17.1732879097468; Fri, 29 Nov 2024
 03:18:17 -0800 (PST)
MIME-Version: 1.0
References: <20241127190605.1367157-1-festevam@gmail.com> <CACRpkdbJgrwzh_D5=71dMPOx3jgbyUJOiP-+16JUdL79zDEbTA@mail.gmail.com>
In-Reply-To: <CACRpkdbJgrwzh_D5=71dMPOx3jgbyUJOiP-+16JUdL79zDEbTA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 29 Nov 2024 08:18:06 -0300
Message-ID: <CAOMZO5CRJrY=E4bZG1aBDh6H-+rrtL-n2SEuEuzC7MN1zDvqvw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: imx: Re-introduce the PINCTRL selection
To: Linus Walleij <linus.walleij@linaro.org>
Cc: shawnguo@kernel.org, linux@armlinux.org.uk, s.hauer@pengutronix.de, 
	esben@geanix.com, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux@roeck-us.net, arnd@arndb.de, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_031820_140940_8E302EDD 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

Hi Linus,

On Fri, Nov 29, 2024 at 7:15=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:

> Fabio are you pushing this in through the SoC tree as it's ARM-only
> or am I expected to push it through pin control?

17d210018914 ("ARM: imx: Allow user to disable pinctrl") comes from
your tree and Arnd sent an Acked-by,
so I interpret it as it should go through your tree.

Could you please apply it via the pinctrl tree so that it can land in
6.13-rc1 to avoid the regression?

Thanks


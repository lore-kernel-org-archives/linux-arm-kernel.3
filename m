Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CDFD735E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 22:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKyfqIey8BdSBpHRzlBKwl2jvnn1XIYjneHFkheyqzM=; b=flnJI2xYgq3z8zL5RTpsp4TSOS
	cCv0Gdy3T50kdYjNi4E5I2QghJgFJtviw0qUPjj8NyjUOtJjq902xCCrvoPHwwZn2ZtgC7Ai97XP8
	tv2mRiXbw3IjMn7yQ4SgW5rOkqbiGfQ/xlmlffOPfyS32VE6mvdXnTlD5dry0+nzlQ+6KBSrMSNNg
	hVA+/r6N2505befHydeX+BQ/DWVyR5SUvxWiIUNse7GoMB7GyitMyGUxDqylKNm7l9kzcwuOb8wlz
	05GjGUKHZ/bObtJQBQHkfnAtN+CXZyDagx+xH7MztPoFvAHqMa36kJPA5qCWQtLMoDlfyYtCirot6
	fVx5CGoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH9t8-000000014Ab-0ZMa;
	Fri, 29 Nov 2024 22:55:02 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH9s9-0000000145s-0IZe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 22:54:02 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53dd57589c8so3543009e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 14:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732920839; x=1733525639; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKyfqIey8BdSBpHRzlBKwl2jvnn1XIYjneHFkheyqzM=;
        b=A1uCiklC4H6XPESflLGn3rlIpmBFUUMepuLP34LdeGEMLMGrX1ZiE/4GspME8mVo+u
         shmIiATlDRhmSiR8sVF9NM1TPqWAwB8cuUtgRqjGAAkCPDcUuIo3SpjOP2MuMyYq8P/J
         mllLyLzLfG4G44cev9X65M6wRB3E5a5fTVHyWpI80wo3n5RJRKyKoGVz5G4zSNDNNiya
         EwCY8XpKX6zr9zgvnLxcaYTT+Vx20wuHlRn6GSuTLTFEf5FTj1MlhSE7vH1LaIMPN43S
         le9dOdTb5rsdOqHSnuny1qimB/T0Ef0no4gwC0ZH7GXTYriCryRUdqGQZi+hf0ulErx1
         CMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732920839; x=1733525639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKyfqIey8BdSBpHRzlBKwl2jvnn1XIYjneHFkheyqzM=;
        b=OkXI7JVPxzg+d2myFJPEXlphzX6Rzw39rlD4SIngMpkwN3F+BLBgqb1bDZWGsX4lfG
         0Onuku4a2VyhwkDyXT/hV9ngaWEJGmtcCieIyPFZD5Lvi4RAwCdCFtfaBd/aaCTb1bkD
         QULF/Cj+x6/cxqTOXj7EmgNEPuI8kmlYYyUIrOlWhErgDybaO4nkbpYBTCk05zxtcyng
         RAXTUGl+SuHawQMQq1s5K45vvolGcngBhG5nvI2wSv5h3qxTlKqNZszE5dTYZFhTo453
         C7Xm0gO3ypsZjrgGRKM33FWbkH3ZfWlNfrfGBTKZAcDcX4kfRxnNmqjbNwabGLzxj3Qo
         qvRQ==
X-Forwarded-Encrypted: i=1; AJvYcCViiCSk7d6R9mQftiKmVENWYMpBHuKNN9GiIT5uyC3U+iuz0oGW34dYXPXfd2Ez5cw3QOU+/3btpYENnKdECVnM@lists.infradead.org
X-Gm-Message-State: AOJu0YwUZZekwY++Yz79LBEzyMu2E5pyr8sAR+fgO9ypOHaVyPDBAPvw
	G73jrk5TPaAsmuva3rR27Rn0rEwhUcvrEmpVrPhfwlVplJfG0p1g+3CuPgggqVqFLbSvxViRkd7
	/29cjiLj1MuqxZegJLCuPN/ecJJJ+W6e3KGWWIw==
X-Gm-Gg: ASbGncv722ouiNTOGMSoKhLXMJ422ACkUMGRi6Vq32xlqMW5ye6q9gYyZs5fm1CYGyT
	mDMzt5A+DZE9GUeqrdBejbGH+MIFzmw==
X-Google-Smtp-Source: AGHT+IGcVRupOMbTvZ7t+jprssuIrvHdEDt/2Twz85iMQXHN5G0PwHo8oCHXUut9lX73sLXrsQN4D4noECo1WJcQuBQ=
X-Received: by 2002:ac2:5687:0:b0:53d:ed29:43ac with SMTP id
 2adb3069b0e04-53df5080beamr3485099e87.28.1732920838933; Fri, 29 Nov 2024
 14:53:58 -0800 (PST)
MIME-Version: 1.0
References: <20241127190605.1367157-1-festevam@gmail.com>
In-Reply-To: <20241127190605.1367157-1-festevam@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Nov 2024 23:53:47 +0100
Message-ID: <CACRpkdYAeM+=P0ymMUQhn3urV9HMWK7+4FkNDZevfvz_AbSF+Q@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: imx: Re-introduce the PINCTRL selection
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, linux@armlinux.org.uk, s.hauer@pengutronix.de, 
	esben@geanix.com, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux@roeck-us.net, arnd@arndb.de, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_145401_126945_AFDE70B9 
X-CRM114-Status: GOOD (  15.95  )
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

On Wed, Nov 27, 2024 at 8:06=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:

> From: Fabio Estevam <festevam@denx.de>
>
> Since commit 17d210018914 ("ARM: imx: Allow user to disable pinctrl"),
> the CONFIG_PINCTRL option is no longer implicitly selected, causing
> several i.MX SoC pinctrl drivers no longer getting selected by default.
>
> This causes boot regressions on the ARMv4, ARMv5, ARMv6 and ARMv7
> i.MX SoCs.
>
> Fix it by selecting CONFIG_PINCTRL as before.
>
> This defeats the purpose of 7d210018914 ("ARM: imx: Allow user to disable
> pinctrl"), but it is the less invasive fix for the boot regressions.
>
> The attempt to build Layerscape without pinctrl can still be explored
> later as suggested by Arnd:
>
> "Overall, my best advice here is still to not change the way
> i.MX pinctrl works at all, but just fix Layerscape to not depend
> on i.MX. The reason for the 'select' here is clearly that the
> i.MX machines would fail to boot without pinctrl, and changing
> that because of Layerscape seems backwards."
>
> Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/linux-arm-kernel/49ff070a-ce67-42d7-84ec-=
8b54fd7e9742@roeck-us.net/
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Patch applied for fixes!

Yours,
Linus Walleij


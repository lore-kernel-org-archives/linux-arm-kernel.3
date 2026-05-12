Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D518ACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 13:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIBbDdY/6Vl81uBfM5dEV50W8t5LzE4VYm82dl6aad0=; b=j1RRK5QWDLPdj1XKJ+08Gn9Z/k
	5lGYeEtvv0o1/aNTrsf6N5qMhI4r17O3S7QJK81hzn3QMRm0XxzlgOjUWLSNxEvNQ/SSkdmF7I8Gr
	QvzaNcQo3351aM2nTafjs/5dTqo5xWS+I8ZVcqx3dOZXaUUXdRziUFOLLHYtIxwis6VboliNniYlp
	DzVGqLy30phW7K2ZgU6WZGiVSQQYjMcByrSB0/Y10YsGtPnxJTlKiuy3gRxh4xzz771w9wmxWx1Er
	3iGdjKiYdtOJ5fb/QBJui9+4EPNSxISx9akfgbU1Z18RE5C0DQ0bn68k4QeQN2s9cQFoQCkKvLp/0
	lZgyXvHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnP8-0000000GtUP-3Dhp;
	Tue, 12 May 2026 13:44:10 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnP5-0000000GtTV-3GuS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 13:44:08 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-39378db197aso56616021fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 06:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778593445; cv=none;
        d=google.com; s=arc-20240605;
        b=HZtFEycmhz6A5bAjcaQeurwrjGd84e+vCgneenefb4WAAytnkQhYDpNU7xV5CyrjSZ
         /gGNnunWh7Nncp3bs3fI9NolmICJO8dxqQmhxw784RJl8yy693pQT5Z8GR6dPk1sTggp
         PAeQCkiAY+DCyyAI2S0ipbDk8YD7Ap9AnPuRs8tFgnRQpxquAJEqGKNzCBmBJgg2UTJe
         hRMgbq71uIKIKlxO8G6EZGnN0pK//gZuH8O7wdBmcX+G4AyZtB0bp2FP2xIkoVrlhY11
         q9BfYteYwcxfhQeEfF+6ogFwvnz0CFhftXwTdqVb/LkawwU3meH/zVkxDGL0gmsEPoMQ
         d12g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UIBbDdY/6Vl81uBfM5dEV50W8t5LzE4VYm82dl6aad0=;
        fh=l0d1wccZDcita7fwkra7aKDCTnrR1zdaGDFqFPp9ln8=;
        b=VMVziR+DBbFh0Ie8tmXOiaD0ZWAQRElkSa1Q2YCRklZYJvJW4DxHZiSwiu62rv5YGj
         BTo9T6a5RIRlGdS4UVPeuXze7AvLj/q8lXmqd6wUwzuwBnGMO1X9YMPUrokm6Qtltont
         cTB9pEa6ZGnhwT+YkUxHjg3DN9BdC8TOgsjHknpWCfQGndzBJ8g4t+0FJVi0QiUe67ZF
         dVwnJCyUTkuPXbdNRKup9dsNk/5E/TLpRgUZoEWlFY+m8KwRt4oks4H9rVQRj8M2AuFb
         d+K2JroGRS/pd+Lg0WyzqUq5aIDJ/PrDjITKeEIiV4bP2edWfl3IGAxatV/uA+zhuguD
         KRCw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778593445; x=1779198245; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIBbDdY/6Vl81uBfM5dEV50W8t5LzE4VYm82dl6aad0=;
        b=KGh3cZ6/NmpoT4MWyY+mNGN8C/f+Fimlbl6XKJTZq4ONyJfb10aowkESxBvmoSx+D+
         NgZQtCC0aV5e6TAfZKje+isH4gRk2o3vC1qUttIv7sYRGJ4FQ5ymyGtSwoapNqy3sAEA
         JuemJhb2Zu0+v7VdScpBVCfBbzVW4IxlhPEeBY6OgdkEXsnRiy5ZgInGtYOk8yMiL49H
         XpP5TjRZPZy8TgsBVd0z72DMLKGKIzzu19G6w81NUx+vg6KgAjoEWvJKnAmf/fn6q1AO
         nEMOJzq5Sn6Dk8L4zd+TR+umno5t1siCs3eSUvQIOlBScU/6F3QB8pEMaSWtFA20ZEaJ
         AVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778593445; x=1779198245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UIBbDdY/6Vl81uBfM5dEV50W8t5LzE4VYm82dl6aad0=;
        b=SYiDRsLnOryN++7a/rDYWAEFrd6NMvAVj92JM6lrqh5h1hvs3UV8B9J3D0W3lhz5Va
         w6MD3IXs5dqR4zw2xnw6s/0fwC/RMmvF3qVARQANmSJ8YQkd056rFWQaYozureW9X6cA
         FcWBKtFGrqFfAbR2mxadmu8N1i+9Az7mJklKCzXGDOZGoMsInlJ5XzNuwPEoNZPgLHr0
         9v075HsENDvShVUsgm07sLD8X+WCUBf65hqYKQn7NjOj3NmC4uIpJi+mwdV/A+tGcwF9
         7u0KagAJI79wh64EW0vbj8WADKjkiI1VYBAWM9TiKHEollykXkj08TaGn/N1AFu2ggiF
         4dKA==
X-Forwarded-Encrypted: i=1; AFNElJ/lUozuyIAGzjbZIv9ykb1T9PrejlkrFarB8yn1o6u7r+WPH8ZwOpQXRJnzz/+DgansT7a0rJdT+WeLlN99DU/S@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz0pJJu9IsXNVCo+Rbl8TonnNI4Q5OO9vA65ywXal/e/FVtoQW
	JbRgVtmIwqKGTVw+68qUbW/gCm/TROv1FxVi895ouZsVAhN9rG8Zfb1BCrzknq640fqLpyj5Nc4
	5UZHgvA11OY5NZDsoAhELxe8Pas1Qbpw=
X-Gm-Gg: Acq92OHcFx9KGY6Jvz3F9nGEDOckMzQnqDvgW2fcaaSWscxTSDbK3wUlbFGdeQfkSHa
	4Nejh+LaR5pUotr/d15cwYXiaHemxrxiWRcQ6zGKJ+S6Mpddr7I+eCPpC9yc2OZsIQz6W33UEXi
	QMEdI+iDDav1M2K/HbbEJn5eLSB9u4eVhzbWVKzPRSAH/HRtVwROVk74S0Vh0kxnNDJyPFl1Yoe
	p3Xko1I9qcuAtI6kUu2ydYaPJP/rFKMM5b61VscuTojCXmNw7auMtMTMbD1sd7NJOOjZMjBWHTp
	X8e4X3m4mXmBsvbJt72sg9MZ60+Sw1dfyBcJ3Jc1/hGY5J5pPEwiKZM3UfaqbIT2N9tAJ4oJ
X-Received: by 2002:a2e:be10:0:b0:393:ca4d:2313 with SMTP id
 38308e7fff4ca-39408002f04mr46273671fa.5.1778593445018; Tue, 12 May 2026
 06:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
 <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com>
 <f04fadf2-8d73-435b-b713-9d07e48e80ae@lunn.ch> <CAOMZO5Dm8FgzOfyp=6ZuDc=528FiqCPVYF07PjMGVP0Paye6vg@mail.gmail.com>
In-Reply-To: <CAOMZO5Dm8FgzOfyp=6ZuDc=528FiqCPVYF07PjMGVP0Paye6vg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 12 May 2026 10:43:53 -0300
X-Gm-Features: AVHnY4LZUMkE_oZU8jhYuGqiMMJ-pFMt78stSfr4BKQ4Jreq-iTmwB4N5o8icjY
Message-ID: <CAOMZO5CscUL=uj0dqmUjoxXNvJHfH4hsno9-jLLrLx=09na5kQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: imx6qdl-sabrelite: add mdio phy address 0
To: Andrew Lunn <andrew@lunn.ch>, Gary Bisson <bisson.gary@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_064407_838710_E95F1ED3 
X-CRM114-Status: UNSURE (   9.69  )
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

On Tue, May 12, 2026 at 9:23=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:

> On this board, U-Boot checks for the Ethernet PHY at addresses 4, 5, 6, a=
nd 7:
>
> https://github.com/u-boot/u-boot/blob/master/board/boundary/nitrogen6x/ni=
trogen6x.c#L287-L296
>
> In this case, shouldn't U-Boot fix up the Ethernet PHY address accordingl=
y?
>
> Something like mx6cuboxi does:
>
> https://github.com/u-boot/u-boot/blob/master/board/solidrun/mx6cuboxi/mx6=
cuboxi.c#L414-L446

And from the devicetree side, imx6qdl-sr-som lists the possible
Ethernet PHY addresses it can support:

https://github.com/gregkh/linux/blob/master/arch/arm/boot/dts/nxp/imx/imx6q=
dl-sr-som.dtsi#L72-L95


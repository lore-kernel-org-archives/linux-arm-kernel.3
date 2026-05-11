Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C35CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 20:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfDxlUWWZJepOCZjfdEmEkPzN7o0zQAK0IZPSz7H81M=; b=TYDRngaGw4MvxU1PTW9d2HwmR2
	5KCXfmjzQqx7GoZiyaJdxlxm4aToym6TwMJH/KOLHdO2nkiUpQpVZ5nUNAVWa4lqIdxs2C8qendLz
	LwAv1iN5H21k45MxFiM9MYrM0Bjr9pcG4DI9a3HusBRYYgbwo/JeZxz58n7/b4xVsHz8GIEwegzjq
	I+8BYK4hSdUKKH3Do+I25ikKjwzaf9oR71Cld7BlmgUqZ7mVe4nBsi+H3yqBm55fJTEQlnzmGdXbI
	KqEKnE0HIsUBrmBB8lIWM+cSXuzWdiyTTXRyLKQYnvSGwVpB/AFvWqx7LJN99V2UiXptw6/J0jEs9
	82SDDiUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXL1-0000000EjAK-3xAO;
	Mon, 11 May 2026 20:34:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXKz-0000000Ej9u-0O4F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 20:34:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F90A442CE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D43C2BCF5
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778531688;
	bh=pfDxlUWWZJepOCZjfdEmEkPzN7o0zQAK0IZPSz7H81M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l5IWnmnszX4yIlsBRwcZauDRDjLsshju3WeQ8Mfnk7HKw8C4aOvGcekN56lNTA761
	 zHnwpsT5guPRrb372CdGuH1XRzjJsWAjX+CFc0yqjuRfFNnH0QsHrXN6FDD062YsLz
	 MDOlqoL+JtTt20cTc/YgGBnUqZQGJSEJjgkN919VgdSU90p2W9QEBoMBs5j9JMfzHO
	 tzPRoORvk2B2zcajxNqtRcoYPM6xGw2LT7MN1RNJWH93+D2S6o0LB1A1gU0L9Sd93A
	 hgnASXHjDNKPcCvIsZ7a/5+xHRa81a5udY/K9yiH+Z7IYLTraMnVDyfEtZFfQhJmcb
	 rbdVbcfSHZBCg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a8d1f43432so1889836e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 13:34:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8oE4lFnVkqbc4HCPF8FN08HTbckrZrTDg1wd7o1+2c2DqVkoc51XJwM6m5Ncdi159+nZdtS/ZT4kgpK6+Jal4K@lists.infradead.org
X-Gm-Message-State: AOJu0YwLpMIZe9N95FVDt5lWDwYTPRoiVaqlG7PUew372rx7CDtsCDSj
	Atpx0oZIjVxw3ifqIomg+7z4M0jDR64UZuGoZ6PpaZvRdPYS5gA8EsBBDMeLE0X90YwwqWGAIwC
	k80JI9YZfP2WQJSrE2X916FBFZLbXGDc=
X-Received: by 2002:a05:6512:3ca1:b0:5a8:7be1:24c8 with SMTP id
 2adb3069b0e04-5a887ceaa65mr9872399e87.37.1778531686850; Mon, 11 May 2026
 13:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
 <CAD++jLmXvnf6sSWsGe+++u37ONJpFFvxFMUkLdvvxiiaWuf9gQ@mail.gmail.com> <agIwOYrKXlnKbpII@lizhi-Precision-Tower-5810>
In-Reply-To: <agIwOYrKXlnKbpII@lizhi-Precision-Tower-5810>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:34:35 +0200
X-Gmail-Original-Message-ID: <CAD++jL=eqEaTcG7P=++Md7fqosmrGbRRPDb90+=Q4q8oQ=xqRA@mail.gmail.com>
X-Gm-Features: AVHnY4ISeOUwTMvzSWT7CmqN0mVa50nOH_KekHRgu0RCcEYz-W900TVY-Ai2s7k
Message-ID: <CAD++jL=eqEaTcG7P=++Md7fqosmrGbRRPDb90+=Q4q8oQ=xqRA@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] pinctrl: Add generic pinctrl for board-level mux chips
To: Frank Li <Frank.li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_133449_156330_DA009C3B 
X-CRM114-Status: UNSURE (   9.66  )
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

On Mon, May 11, 2026 at 9:38=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:

> I fixed a build warning by missing doc 'np',
> https://lore.kernel.org/imx/20260507152117.240612-1-Frank.Li@nxp.com/
>
> Anything need me to do futher?

Sorry was busy!

Applied this fixup on top of the branch and merged it into my
devel branch for v7.2!

Yours,
Linus Walleij


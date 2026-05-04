Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75237FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMk6gznEFWFtiMdbbQFFlZkrxCOoLWZWOTTFHy55KrM=; b=D+mh9600vVNQyvI1Q9MndgsxJr
	nLAz81B7MN3ouP3G/gVuqh7NdSfElBYW1iAP+03aKr1d84BwPS7Jy9JLEuaKIGlLU+D+O8v4CjrVd
	mx7OrvRD7GD+QCaUoP3ORCKdfWEyu4tV6+PB+YdGOnkgdIqO+Qm5076eUi2OF8Lc+XMtZKZwm7o4P
	uiN6OpkbqKy0YM57mgZbLkJx9pxGhRhGoDbhNXcw/dtAtZm2Gxu3bDe3oXBsmUxqmMNgGv3+F2c1d
	oejJ0p6DzxebaXR11YZkBJGSafsE6uiRabJlK3GRmjCIYaxNnqbhcrObSUfk1vX9BRL0X8p+mGuX+
	47fx7KDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuUD-0000000DTrX-0MG9;
	Mon, 04 May 2026 14:41:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuUB-0000000DTr1-22Q8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D651744122
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 May 2026 14:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB77AC2BCFB
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 May 2026 14:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777905686;
	bh=UMk6gznEFWFtiMdbbQFFlZkrxCOoLWZWOTTFHy55KrM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=au9ugCWGP+Euffa/xDAni5La6kDaMHD3MzPLmvsA2cSuNuAf+o4NhIyD64zHq2L5F
	 h+PI/ovXIq2emAz/ynrnA/FBeHk5HmlCOtoWh7Qp0QfsYTCVv45/+APt/SmAMFd88V
	 lS3599qrrwPYRahD1ql0fBpfwcPX8tYnsiYsEWjeQDu3xFf2rDeqGVaZ3y7a36gMeM
	 M5blinNaBcqQQbjBBIVHx/Nn0vqmo306hGqCWut6FxfDktG2qRRH1YXFvWjaWqUrqe
	 yeKhOddkTzTi9FYbT7zDD/FtyLDPihheswgOQYSPctDlIAQ49afFArNNg2tIrrhHHT
	 c4fNrPaRBjI0g==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38e7d983f91so44312991fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 07:41:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+rrsEsLK1lbQj9sYCEUg9r0ctHrTUZ9H77YsIzd/WpGBfDh5Si/JFOFpLL3hQfWnv+oFzX9LMYEVzT2DEzTA0D@lists.infradead.org
X-Gm-Message-State: AOJu0YwCn4YL7t5D9bcFPGkdBDrnsQpyWG5rBAsU9qAj7ToOCS6aTbx5
	T2vg1VW5zlCATh30JRehRNS0Ck3QgTv8N4+fkOEjWqduZzHgcP8iogP6fiWocy5uqoO3vlZku9Z
	5kQWVDcbEe87K7g8JfQOvtnZKIKN5M28/hJygtIBrQw==
X-Received: by 2002:a2e:be0d:0:b0:38e:cab9:3647 with SMTP id
 38308e7fff4ca-3937842a16bmr37456631fa.13.1777905685320; Mon, 04 May 2026
 07:41:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 14:41:23 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 14:41:23 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260504131148.3622697-3-khristineandreea.barbulescu@oss.nxp.com>
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com> <20260504131148.3622697-3-khristineandreea.barbulescu@oss.nxp.com>
Date: Mon, 4 May 2026 14:41:23 +0000
X-Gmail-Original-Message-ID: <CAMRc=McqV7-R4b5D8Atj0XXt=BRVBPOod_=RQOyYuJk9vQff2w@mail.gmail.com>
X-Gm-Features: AVHnY4IwqOf1wd7u01HaUABcS9MKFWPCAiciyd-hECZ2A9Dac8kob5RJY_KsY2Q
Message-ID: <CAMRc=McqV7-R4b5D8Atj0XXt=BRVBPOod_=RQOyYuJk9vQff2w@mail.gmail.com>
Subject: Re: [PATCH v9 2/7] pinctrl: s32cc: add/fix some comments
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_074127_562438_D2822621 
X-CRM114-Status: UNSURE (   9.21  )
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

On Mon, 4 May 2026 15:11:43 +0200, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> Add/fix some comments and print
> statements.
>

Why the line-break?

You're doing more than that: you're creating kerneldoc entries. I'm not sure
it's worth it as these are not exported APIs but - if for some reason you
really need it - it makes sense to mention it in the commit message.

I'd just stick with regular comments, not kerneldocs here.

Bart


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13824CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4ClDao26narGkpzxkxbLuuYZwnOiaOwXZxQ6iS/WOA=; b=VKquubjz2FbQ/3QI5YNVCaJ/d3
	y/VkMt49u6LV6CPAGB5VNjprXGHLAPNhNImjhPItr6YiyINLhEVEeAK4Wr+ICMbxDM5dT6+xZctuD
	+tPFMZ5e8GoKXEz5o8PYkHUxAplemthP5hvflWbyD50QBdTAJXbJLTtC7DT7idmZwHEE2krv7ZgXB
	kF1F5P6QTsje+Zx5h6MLlZWmY+lI34CJGgEq+OPDww1a2HCk0k8CWD2zVrVnaT10SY+p9aEeDWTKN
	jzgr4yyHTGuebH4jgNJDU9RqwljGKDcviqODUTD1YTAjtdBMXxCw9baPy8/5fqeMr0qh0utLrMciN
	S3jlRJxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuUg-0000000DTy5-27ip;
	Mon, 04 May 2026 14:41:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuUe-0000000DTxC-2rGQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:41:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 556E54433E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 May 2026 14:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23ABAC4AF12
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 May 2026 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777905716;
	bh=z4ClDao26narGkpzxkxbLuuYZwnOiaOwXZxQ6iS/WOA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=alX7WODpN39KoOyojy/Sn2eOaaGm3GLiOMwz2RcB/jqkwxcINgZfKWviHQDstClJ9
	 nUhsuoUZlT7eF42W/+GRFswQCg7f93GWgohx+vV502YLQPkr5XKN++fq6c3H5PPor+
	 i+M6ORB/yu0ulmIH67jb43WD3KIkZZC9xy+8qqa2J5pW/EUvhBb93gE2yn09rc+sBk
	 szM+FgokpOAAOxhc0ik/DsX3mmjP2RwJhPEtbwJtFFcyFjoMdwG8GuytVYY8XNXx2g
	 NP6U6P6IlPhX/2H1B6gwQRoxk9lt+cbC+q0QPpA4OZplk2fNy4ewP6VWOjMaydYCYC
	 LI1oPK9Mrb+uA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38e7d983f79so42109681fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 07:41:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/14Fd5Py67R3Jhe+ur/omRFDaA78h3cLkNbNXOeP5yKVBiG9VbfbYof7zilFfQCdar37mwhNjG5LhKc3TONImN@lists.infradead.org
X-Gm-Message-State: AOJu0YysvX/D3fmiKMmRFtPO6xfJRx7zhx3Cw4bgOdvFyZEX4uzFdBLN
	Vbemcte1NZ7G3431u08c9QCtBGe2M4taXIuA+u2VorcAaRpL+MqtIZ14QBx/z6elTA7p/DHz9py
	rAt84eiznLbYNldaNl2o4sGO0Dy2YxYJTdyGL02BaVg==
X-Received: by 2002:a05:651c:b13:b0:38d:e977:5533 with SMTP id
 38308e7fff4ca-393785b95e0mr37146491fa.26.1777905714769; Mon, 04 May 2026
 07:41:54 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 07:41:53 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 07:41:53 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260504131148.3622697-4-khristineandreea.barbulescu@oss.nxp.com>
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com> <20260504131148.3622697-4-khristineandreea.barbulescu@oss.nxp.com>
Date: Mon, 4 May 2026 07:41:53 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfgv-OD0cFZAmMROk40pgpT4xT6wJxnEWvqkVN7wX9CQQ@mail.gmail.com>
X-Gm-Features: AVHnY4KioxtFWoxvVcXY6wMzFf0SRwYI0OQ6liv2xdIp_Qf3oiOkJNSF__25P2o
Message-ID: <CAMRc=Mfgv-OD0cFZAmMROk40pgpT4xT6wJxnEWvqkVN7wX9CQQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/7] pinctrl: s32cc: remove inline specifiers
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_074156_759170_E07AE34F 
X-CRM114-Status: UNSURE (   6.41  )
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

On Mon, 4 May 2026 15:11:44 +0200, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> Remove unnecessary inline specifiers from
> static functions.
>

Again: breaking the line too early.

But the change is fine.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


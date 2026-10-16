Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFFDCCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBtsww379ucVBkMmo8yYkba7gIdGc8re+3xjl0WWVV4=; b=KLXVDGMFpCPdgn/3wPtkTMzeum
	T9H17yXzo0SSXr4+L2tapAmxUqBiW69CZ+USxfKHEY6DPxn9TP+2rlE2kHZBzKvANhPiKcFc1Wz6k
	DGsP4SM+dEgToN6xEqbyuMuKaEts0IyyILrK525VniIbMnZgmUljfH0TKeYqamZYfDj8eoVyXK4o8
	FKm5ptGghbJLYQAEMACKUavMvx4m2GRmdtQ1hJKNPqx2usihCpTnO/j8p3q21iAx/X+uSu3oMvrgb
	aQpe8dSxO5tUfKOwLxZpPBf9LLUR/dmc1R2ipvc1RLUjKOcbewqenAAkylSh4K1W/LG1KeDdQS10y
	R8kURcYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhll-000000031BE-1Q66;
	Fri, 16 Oct 2026 13:14:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhlg-0000000319Q-1oI4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 13:14:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F76860A56
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 13:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37EEF1F000CD
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 13:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792156479;
	bh=IBtsww379ucVBkMmo8yYkba7gIdGc8re+3xjl0WWVV4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=V0WGVumeTedEHR2AoRQDo1rd35kxpGTR5Rco75l54SLLNp9tfdxKm2bSXoIUdCuhI
	 1ur4JAJozcXoz0KGYEqwE4KdS/J9M1DMiVf2XZo9TmhVD3qrvLSBu7rAhEIccXmM2s
	 zM9++t42GyzOu8UikZZ6UhtlQ64REpWMzRi3GFYFe6DKdigTIhlwHnX75lbPF9a4Xh
	 f/wTZbdzX369cL4C4jqD9k1HeLlckcjRMRvILAnRZS+16M1fcpoaXSu0dgCJ5BBw4C
	 QZ/Q8P7mFVIRByEDdWNuWG16se9GjqK/xXfGav7ekMFSXlFlI1b1aPRfxkhfPZpyUF
	 cJpbikXvONepA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab27b4924aso374151fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 06:14:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwhpJ06zkR/Ed7jZ1tbS70O0MN/KKuVOyayz7JUYfmbCNkAg5gcoozl2xwi4AoGVB/ZYWymfL94Jr1vDS73yuRq@lists.infradead.org
X-Gm-Message-State: AFq9FYJ4NNuFYC+JtgG37UvgkS0r0nJ5Qg52iBC2/pxTeexjzSZ4DxP0
	XMqVr/Zoy4mNouJjsNUqwl2FBVxFLcqD2Jc7IOVheuBRaXYUWbGW4ovJVhe6YisBFdQzA6P1sid
	LnEHrYmtpWyx34igE1sta7kd52NkQ+rk=
X-Received: by 2002:a05:6512:1193:b0:5b8:f523:6886 with SMTP id
 2adb3069b0e04-5bcde8d5ddemr7061879e87.66.1792156477967; Fri, 16 Oct 2026
 06:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20261008071436.596651-1-khristineandreea.barbulescu@oss.nxp.com>
 <20261008071436.596651-2-khristineandreea.barbulescu@oss.nxp.com>
 <20261008-1e3e0aa3fab167d544c21e68@squawk> <5738951b-4856-41c1-8766-c41f2e63f3d2@oss.nxp.com>
In-Reply-To: <5738951b-4856-41c1-8766-c41f2e63f3d2@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Oct 2026 15:14:25 +0200
X-Gmail-Original-Message-ID: <CAD++jL=k3xFcFMsAS9gOc-tnGd0nOxidqST093YXzL+4mvM3PA@mail.gmail.com>
X-Gm-Features: AclHuK89SeERPwraJjQ-sXSvZlY9dT774wPNQR4vvufG9BfgRm39fBetpzFZiak
Message-ID: <CAD++jL=k3xFcFMsAS9gOc-tnGd0nOxidqST093YXzL+4mvM3PA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: s32g2-siul2: describe EIRQ
 input mux registers
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Conor Dooley <conor@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
Content-Transfer-Encoding: quoted-printable
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

On Wed, Oct 14, 2026 at 12:16=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> On timing: I'll hold the v2 respin a bit longer.

There will be merge window on monday.

At this point it's probably best to wait for v7.4-rc1 and rebase on that
before you resend.

Yours,
Linus Walleij


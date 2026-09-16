Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92798C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 17:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1UErD4H6r6whOgpoMHeGy/yiV6kGc+XBk8QJER2Od8=; b=JtSqf+x8qUYWRm+2CxId4F9ozn
	ac7XkJLJu9eqMTOVp0eaigL/a73SZLEB59XY+dVNYL8mFa5xTjD+7ZHnC0NAjVz/KREV9AkC5QH5V
	7YJQDsNYKsb6l4C5ktGQX9ihSjttf+KTrs/LR6tZs+j8RzFcU853ZYnF7CwhTQkG4ngzK5CbJYRQB
	a9Qipyh6KyUb6JNbtFhIVSQ4NwZNCx59K2Fg/BmQVKYskgRigxR6ikPNURoykKio5aMSX3+9/wY7Y
	d/B7SRdpwd+XnEcjPlUPnARqXCs/3jn/Mvq5xZVFVUh7jtP0zWE1o/w8YCUno5BFKP7n807gMBjjb
	SuNoIIqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tKL-00000009rRb-0ECg;
	Wed, 16 Sep 2026 17:21:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tKJ-00000009rRA-00dD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 17:21:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 24C8C601FD
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1061F00893
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789579301;
	bh=F1UErD4H6r6whOgpoMHeGy/yiV6kGc+XBk8QJER2Od8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EkXi8UIfYQfKatoSflTMKoZodk2MFzTeqn7IzFw5own8by4E4X16L2h/ix8kE8zBX
	 cqm8+yilh8//wJFwcRlPFj8XbvL9n/SJXykY/n384D5CJsiov0+h+AOVx/oTkKb2Y7
	 lEGo4xi6G2c5kMX9Jwy9u3c9xSohw6kM6ewpOuRspjSk/KbFgc9Q+Y20moK8Q9Cle0
	 LMySEXuzfhWhnWstDPZ1AEhJyJGSVe0oxzWxrfWMWBg9iYw1oqUHvmQEZa+ErvRGH8
	 GDp06kn44KOOYFlXwvtsa/1EM1GEQEDJjyD43SlMEcx9ogqVB7yIto//IFLrxyPI0O
	 nWAABdTdFAhAw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso2387066e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 10:21:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByKr6f9ZbxBiW3fNVUHZwQCsNYSsOFfbz3F5iyTRop938lXqizwgu8/53qRBNeKVrKRt2n3HAIonaGNGRNf9wmO@lists.infradead.org
X-Gm-Message-State: AFuF++mcTKLO0aWs+CDLCc0eKNfgcr4UhEgW+jcM9WmjqxNhHDoZK6qm
	stKGc0CeQ+MIpkdzNQd8v3kdOke2g/2D7evBDy7V9KSZZDagq6NlRFQCJM8Jxt7ro8SR+yLQJC2
	ThydHmEHtTfIiGSc0uMsASVsyPksG+lo=
X-Received: by 2002:a05:6512:6883:10b0:5b6:172b:7ba1 with SMTP id
 2adb3069b0e04-5b8ba5d1a82mr67749e87.9.1789579300578; Wed, 16 Sep 2026
 10:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260913123223.99893-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260913123223.99893-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:21:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLm2hQ=fHmLGL4KnaK-q2L95tz3P6__qx=dFCUeiMUz9tA@mail.gmail.com>
X-Gm-Features: AcwNN1WeMHFPjUODWxifW5uhfKTviiZfd6OYXXOq_JHN6cgG4pckjp0gwgbXDp4
Message-ID: <CAD++jLm2hQ=fHmLGL4KnaK-q2L95tz3P6__qx=dFCUeiMUz9tA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Use consistent indentation in the example
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Gary Yang <gary.yang@cixtech.com>, 
	Fugang Duan <fugang.duan@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, 
	Del Regno <angelogioacchino.delregno@somainline.org>, 
	Rahul Tanwar <rahul.tanwar@linux.intel.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Krishna Potthuri <sai.krishna.potthuri@amd.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
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

On Sun, Sep 13, 2026 at 2:32=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij


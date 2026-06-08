Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987B3CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hs0AopP641Nmrjln5qzy5oy7hjGy8ZfORbZ+12k1w10=; b=0KKTURSGu2ikf4fwrNUEFcovUS
	HV6O7YWPoJiIsNSE4UfSjqbiZvd2cEJDd7VuSYT/dtdh4Q8tBAo7inZ2u8T3h6JKM90gJCPjoFhr4
	NOy/OitEWyi21BAdFTralU5a/VpdBhp7hjhhAi4c5qaukmKQGXWjnYlsaRhUnIAeLxqad5HfVO91z
	P0XVWZF9B+m2TndehwWz4YPyszQkkITv5e6uotub1fwmUw6Ic4QraePhAsNKMn8SXF90Dk6MO14Bd
	ypUsTlechsmSCXTwJVfjuCUtL+cRRo5XOYesg4FNCJT0pbf0LYWhbaH5aJ4mqvuzPdf0xK/RfvnSF
	dhdv1Tjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbOI-00000003tEB-0l7C;
	Mon, 08 Jun 2026 14:55:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbOG-00000003tDB-2iVK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:55:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 242CC409AD
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 14:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076581F008A2
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 14:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780930548;
	bh=Hs0AopP641Nmrjln5qzy5oy7hjGy8ZfORbZ+12k1w10=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=cPX6ZhS6K1cJGEQsPncU5ZdWEiXX29SCBQQD9gqQUxnd2qSp1R6wxFmviNTA3u84w
	 6ejXLLwQyx/z6uw3pNRHkDY4ujt00dYpc6rZX9Cxum3y5yOcs/mFEElYaX3uChA2tp
	 rgWp33wurimBPZRarYf1vhtAHy8nTmxtK5JEA5Z87t2AEIEoJQ364mC6sRb7cSvcNs
	 K2rFs5dYWAXwQCR4B98uh/GQcUQKTceHk3fZd4rZbhasgBoU0KId/kDbLC8G/wVh9F
	 Ly3vXqX4u7AN0xP1y/kZ22T6UcWZ08Tqi+Pp+7hh4QPTcmouKsLb/WQsMtXbF9AdxM
	 Mh5xxJdYsmn+g==
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1382533d428so237991c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:55:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/qc7xR6d3yZk5iSTb66u1OyRe6OYI9R4jakSeCjb0W+YFnvVGVnTfwZhd80TCVRquQZxhTCpyKnu2kpNWgGT/M@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg5ZasbwxlCYALmUy17v901LEQ3eEc1tDgaJHReqp8awOHBxRp
	vrCT4h59w/CL9aDifgoxJNHeJ4Ys0Mfwp9pzBYPJX/VsH8IwjkBvwdeHTQwfdcP9tNYtzJNnnRP
	FGR2U1mSBrY+m5K7KrGd4D6RkDjMckneUPEPC/NdETg==
X-Received: by 2002:a05:7022:10c:b0:138:267:af4a with SMTP id
 a92af1059eb24-13806687266mr7893634c88.8.1780930547462; Mon, 08 Jun 2026
 07:55:47 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:55:44 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:55:43 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-13-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-13-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 07:55:43 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdy+-_M7HAHrAPw983HwMaVA=ZbMcNqHrroxnYEq5BFMw@mail.gmail.com>
X-Gm-Features: AVVi8CeIxTG42QPBj9M8bPaIsoqISAxcCByPptlPDWWa4A54J-OukW4uUVkVRFc
Message-ID: <CAMRc=Mdy+-_M7HAHrAPw983HwMaVA=ZbMcNqHrroxnYEq5BFMw@mail.gmail.com>
Subject: Re: [PATCH 12/18] pinctrl: airoha: move driver to separate directory
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Markus Gothe <markus.gothe@genexis.eu>
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 7 Jun 2026 02:16:48 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> Preparation step. Later the driver will be split on several SoC
> specific drivers and a common code. So it's better put them to
> a separate directory.
>
> No functional changes.
>
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


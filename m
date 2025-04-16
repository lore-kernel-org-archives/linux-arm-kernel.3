Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0661C369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 07:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vaofwfGevdxm4fxBlcFaPcuDKOl1lL/bjN1PokEW5s=; b=G2gAizdQ1FRs0Q7x5REsKys4v1
	xuuyU0sjcjpRwjflfZJpv6B49N57Vv0WNBTJ000na9xk2/582cHns3vGAh7GWzpobVb+OHFTf1XHD
	juXJOz5J+rfBhoKaY3jDDRWrjaNJqOG1DgPL/f2xLCTtma081e5YbSsi7iu+Y/3yVQrSaKxeNyvsf
	V9nW8lTh2BeAmt6jY1gbSKbs4AW7nWdcP2dAzX+F0K+yBhRdjnN+tWTdCK5WSj/eYykEstChnPrYi
	UiNYG4dH33nrnTJQHpQNkE6CSaw3tFdwgDQizEq0tc0ectuqXV/+qXZmE/i39nlQ0bhCH3jtCn02z
	BWnc2Plw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xDv-00000008ccA-1RDJ;
	Wed, 16 Apr 2025 07:30:19 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xAd-00000008bru-1LxT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 07:26:57 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3105ef2a071so37342731fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 00:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744788413; x=1745393213; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vaofwfGevdxm4fxBlcFaPcuDKOl1lL/bjN1PokEW5s=;
        b=QXAoacItrIomB4kiZwHwhJ/yF0K3eW0hcwE2iZ1xM3tflRw403aUX9HzIkeNHqtduO
         L9nrYbZ1xThINl0PhEgTD70D13aAhmTqRfMvaKA7KN1HreY828mhCAAF/Yi/sasQi47f
         nuUvfGP1eXKMxPKNPqrfw5BX5XxOOEIuG6rduznbOvnIusSceebyTQT75CPZ1+pZtclt
         wRnc0iSLdu62rj+gBpJIBwpAmPlCv1e3tv+JOpOqPbUdLeZLpIclRnE6SfMZhPpDolgZ
         8sVMG1uYqqoBNrvDzixPy3IC7apNmM9GH10Nf5esCJOEynYBUUnnjXSqEDXPHx0AUIOc
         HHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788413; x=1745393213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vaofwfGevdxm4fxBlcFaPcuDKOl1lL/bjN1PokEW5s=;
        b=YDtlpgfTa7K02/wbj75vVrh4u5SfCAdulCRY4Gcd2lBZY62mYgoU7ynRA+UoUGQLHN
         UGxlDgUqOtfuJX29NFYd36mqIKmKtRtgnLfMITzJmGzipXW718Lc0fBImqpNaAR/pzEt
         BwqiYAa1wX/vmNQrLWg3c9z2dyWs9FlbX9ssRgFcfscz4hA5TpaGCfsbf19ARWcwb0hN
         HdGL9AgRXK+pOBILOPq9rOpCfnJ43c+er5yVLaN4FyPKdpzE0j+fpDbay+VKdaPBF1G9
         W6XRNMzma8OJMXmGxqqaPGRlxYLxlSI5mb4Vd7fd62FySva9ckRNFAL60ScbFWwjeSDj
         wpew==
X-Forwarded-Encrypted: i=1; AJvYcCUVuMcMIMMDyy8cDM9ZuKFjQHpZ9fmZE8eJYNTqtFGPuB/adXHotqIOr9NGOQmJsTLDvqXtA0SCJDtfGGH8HMT/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9+0d0NZU8n5bAGFAanPRaywza8gXLeoTEDprK8rbES/43nITD
	WYrKrTrEJtKSeFaJi+grY/XyKYnd3MBwIdCKEhzWf7S2uXv9OlOcal+aq6XvaiJdn9eRcIHTYsf
	G7mY8zWDnjBlWVRNazTubSyVu7TRjQsqpHK5zIw==
X-Gm-Gg: ASbGnctEa6VHF+7RNUQLwadqlbvwsNafTnikCWVDKKC96b2MKMDaYSxnucgGpHPKxNF
	VYe7lQUgfCL01jJiedZUYd6dqdHKRV4DuLIKssAVVcd0u8UCBrjhFmpFEezkVrMhY3YIe/ia0QI
	dkL0/+rjdUJE+bMKB47yG4OA==
X-Google-Smtp-Source: AGHT+IGFJYXFDDo/c9HFNj0hqEBV+yqtCpFXburGgG3GtJzyM/i0Julc0Ne5mNBFD3uMq2MVFDEsN5XeZET5w+5UV6E=
X-Received: by 2002:a05:651c:220d:b0:30b:b184:a8ef with SMTP id
 38308e7fff4ca-3107f6bdddamr2202021fa.14.1744788413502; Wed, 16 Apr 2025
 00:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250411084159.3307-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250411084159.3307-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:26:42 +0200
X-Gm-Features: ATxdqUEqi0bEqmx8YQckOZ12kcmNHaSqcTf6fCpAz3VpdY46Sk3RpC-b3QUf-pw
Message-ID: <CACRpkdZ63dWzMg0t96zPFL4+4Ewg1nA=utPJ2QUg2DvmFe0_FQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: pinctrl: mediatek: add mt8196 eint pin
To: Hao Chang <ot_chhao.chang@mediatek.com>, Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_002655_374167_59174BD4 
X-CRM114-Status: GOOD (  13.61  )
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

On Fri, Apr 11, 2025 at 10:42=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek=
.com> wrote:

> Add eint pin support for MediaTek mt8196 SoC.
>
> ---
> This patch depends on
> [v3,2/2] pinctrl: mediatek: add mt8196 driver
> [v3,1/2] dt-bindings: pinctrl: mediatek: add support for mt8196

I just merged Cathys patches, can I have a review from Cathy on this
patch so we are all aligned?

> Please also accept this patch together with [1]
> to avoid build and dt binding check error.
> [1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D&su=
bmitter=3D215008&state=3D&q=3Dv3&archive=3D&delegate=3D

I don't see how this patch (which is just code) could cause DT binding
check errors?

> ---
>
> Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>

This use of --- comments will make stuff disappear when applying the patch
but I can fix it up I guess.

Yours,
Linus Walleij


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2CECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 21:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxK/8o8TYuy9PyLKW/7vylp/E9GnFz21EyXlXO2+pIQ=; b=DwVu8YXjxkzRGiNHFVVANTJMr0
	4qvDP6DUp5Imgd7+hclOOaPtliMOzoYfW9+DmqbxN5tyglc4lI2al6KGI2kfkTqBfWdErGd758gtG
	WraFJ2c+nqyfgSV2GtcWopnDtQ1Ybu2xY5F43nfgtq/X5QH8uQYk5ao3g9pzCLv374sgZq5vwQsNE
	7RQz+1tU5JCA4qzTwf3SiAzFM861lLVCETOxpxHPW7KSq92f4Yn1I7/nwgoJcEcHKKOslLV921AJx
	e7l0CUdO3DWcDei2ww4G9ClZBzbSaCRtb9YGpWsuHgQew1Vuq8UEeiO4eoV0gve6zutvjQd3hQ/xC
	ITfHKlcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUBZ-0000000Bf6y-465o;
	Tue, 19 Aug 2025 21:48:05 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNlL-0000000Aozk-0vAq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 14:56:36 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-32326e09f58so5960177a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 07:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755615394; x=1756220194; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxK/8o8TYuy9PyLKW/7vylp/E9GnFz21EyXlXO2+pIQ=;
        b=QhA/diKwoJuqpTaZqkF2AUSOvMrXPRJLorL/ZHhBjYCz4RrIeCWIrwczXnf7JSUmBM
         zn/Aid8y4kS+oD20U9EEUung9dya7ggJ3N2Pz4A5dKaGb5+HbodZ6gss4rN9ODhavu/x
         YbuONVUUNYsYhBLlMC+KZg7sJ3ZYnSdh7wEF4Km4CVmgNz56B8kzG+tZYOvKB8y2FT3i
         RsT2NuAj36L/pV6J8yX7Pca7mc78RpWJqif6bOM+kXkecTt9+JG9KzVjcURhQWrZ0fUF
         LN1il5rOWNx+gMY/cvU1VcaTpOp3MRv4XcwUVD1MWnFIthm33X9aVha3vs1nPF4cFJf0
         Xvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755615394; x=1756220194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxK/8o8TYuy9PyLKW/7vylp/E9GnFz21EyXlXO2+pIQ=;
        b=M3ND8h1jpqvmeO1d29dRRPzZ01oOxR34LBx7DyuYCHOfGSWn5aKjiRx6AQpy0ONWoq
         nVExpiH35t24HGqczy4l3ynF5KU7jD+4cEjXPDPtSc99CUW+0yhscoJG/Mj5A0ktat24
         hBmkDjOw8G/qGNixbBbNfAxuovrNhEjH6aby14gmQi1aBY09w0RgTCiATXi9W9cVmOgb
         Umm1txJkObtu6Or5kc8QtEKKaAXt2phz7/bwHQQcAHD5gDjsinhEIWkXBe4DTiGqhtE9
         5L2rerFJjzQ6OgDvGzu+UlWnbEflufph66SJkJdpWjDworr+2C5tVQm95Ve/mOrs77eu
         Ze0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2ap0+T9xY/KGvjKFGCjUaMsEYL4fcJVnDxtOBFrLUuYOuepWiSi3JjKYptMUr6tJVyEkINbP3+cA8OFyGac/R@lists.infradead.org
X-Gm-Message-State: AOJu0YwDfrfQLbPt/ZF5WdHKqsBrt1HsL80GjbuBvifnJbGVfGhM19yJ
	f1NYb7INg3hzQKi0sFbgvqHUyeJsSveohIzIZFS7avvl+0B7mSdDUBomqCEAnStxqnGHxutiP9a
	k7zyMc2G6+JGNMZR7ZgS11QOjSJMqhgA=
X-Gm-Gg: ASbGncv99G09WG/eLuv74CshCsH4iyxh/mNP7vj008nw1QjK37tAhf1sxyp67BGdG9Y
	+Oo/KxLxIVvlQpYRFmWZW/0OVpm+KdNoJaXwyvNH3rD1yirEvu70pWPs/4JKd4ESXvz+NV1iv5l
	V8mCkVII2IgvSlyXi4PFWIu2wAujhUplG4CGNFkGNEvFJNsP9rDgNXLmkv25gmra67Yh8XOhRm7
	8pnAGUWlI0oPrU=
X-Google-Smtp-Source: AGHT+IEpjmZ8XVkcuZKfCV290Wvmbyt6Tv4cR0Fg/t2sSiijLaZh9EFM7KMO1OHNGRVKT1fRGi1Jac5EIi6kT1CFbYs=
X-Received: by 2002:a17:90b:37cf:b0:31f:3cfd:d334 with SMTP id
 98e67ed59e1d1-32476a1d6d0mr4123679a91.4.1755615394148; Tue, 19 Aug 2025
 07:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250819131800.86990-3-krzysztof.kozlowski@linaro.org> <20250819131800.86990-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250819131800.86990-4-krzysztof.kozlowski@linaro.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 19 Aug 2025 17:58:45 +0300
X-Gm-Features: Ac12FXwVQ1C48dlhpVxnCgyHSgql8U6XY0RR1RKOzS1VLcKJpTIqytqaU50CpkI
Message-ID: <CAEnQRZD-Ph+HUWp=X50YcaU1LRbz3KxJWopBRt7+3RQnG8oCGA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: freescale: Minor whitespace cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_075635_253980_EF56B021 
X-CRM114-Status: UNSURE (   8.68  )
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

On Tue, Aug 19, 2025 at 4:25=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The DTS code coding style expects exactly one space around '=3D' or '{'
> characters.

LGTM,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

Do you have a script to find this kind of issues or just manual inspection?


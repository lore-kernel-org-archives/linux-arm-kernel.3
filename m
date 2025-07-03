Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F0FC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rhVhsVllegKUMnK5NOGl/rqgDtbDtwFSHzwLKRqIUk=; b=whbpMHyCs7FQWBCgVAX78OJ5ee
	rsHNkzZLakuk5eLTz7cc3quEMFNCDcQqcqDroHwe/myaxylWyBU3BcyegUEnSK/75glQGJPizLcjq
	FBgaOqPyUs7X0LXbZDLqx/G6WJfLJrBwwPE/5xe219I/18PO8Mcoic6W2VaIYncXt4cEmMVlcKWlX
	dvu1SNPvXM1+a9hBt4xVjiCgUsH8/8uIec7NU3DvVLIUoBGdoer0/Oc4Gtmj/9LgmbkusMvUjgogS
	0aBprwlTUVAhG/0Hz0GDkpWcFy+/+EDbVaiZFeUaIxJynjTPE2KQ1NNSkM+nmDqdE8nGzusaJesnt
	49M+ONzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQza-0000000CTJ1-3se9;
	Thu, 03 Jul 2025 20:57:14 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLdB-0000000BmQI-092y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 15:13:46 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so11172822a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 08:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555623; x=1752160423; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+rhVhsVllegKUMnK5NOGl/rqgDtbDtwFSHzwLKRqIUk=;
        b=GhTVONAg95wjGqlCbkV4kUyTpGZ/4lV3vlJRSsp05xS2GLAHw55A1E3zlze/jo1m9z
         sDoWfovqC+DmSnRd8BNCdmmVFDTS2eckTHS6sYtF43SnEdrRPd8yENiKFz71OFgozjLm
         Yqx9jWvtgT/HbQT40bsQZE74jEPZlqrQwJ055crxKGXyeQvya0GrCipofb5jxBjl1o6o
         3qEnln4SGT5a9ASpOdumTxgwSzSnl3wTZ9S5TOw0vWaCEta2/co4fxMzvag9sHVj7K6A
         DjfgCwkdAN9kzT8lGRwaIYBVu/160h1p9joyGqIMLLaohwLVXymcrN2h8PTPc9/khOBO
         2xVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555623; x=1752160423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rhVhsVllegKUMnK5NOGl/rqgDtbDtwFSHzwLKRqIUk=;
        b=LzqoHi1JE+9vpPXJsmk+GziCUnA/xpiHi+Hhxt/0p5AxG55/+zElVlcE//oTfO5Uua
         Kt3+nBJTmFeGwn58Yv76W1R5/z0hSE8dze79lPJxZP18kz4SSUy/HgAQuv+5gxhaJe0Y
         nDZ3w4zkJjl02mXwiVPlw2fPvAQ6cgvrbJA2umwvrm4mafGmey3aUY7wVV5U8m3q1uaG
         cARb+rTx3WjTaVe/k4J7FG2if15RNNU2Hq9GH1rp89s6vOt3ufZh9JNd+bkC4LmAFz5z
         5lX4PVuDknATgeZUI5xYK5iV3PCSr+8S7TgIVet/c/KscP2lKTf/AD5IiRuBE2IOZIz8
         sStw==
X-Forwarded-Encrypted: i=1; AJvYcCXbbK/MC98tiF+KODFFcvKyzqs3SmMHS3OOeP3kzitrXGwAlnv1AioQG5BCSPG6XdcnWgLsRzQVcqoaXd8Jr//T@lists.infradead.org
X-Gm-Message-State: AOJu0YytLiUkZ3DLPStPRcIX1hmzmSjJakZXAk/5kQxpV/O0VZoTtYfY
	ba9mT19Hq7ueZtXosq7RvWZ0eEYLG1RovNBxNww+tw+la8ehQVuJtFSE5ARZqvGGrVo=
X-Gm-Gg: ASbGncvYx0Yl9osV5fvZjMkrI9RtFG1Dh/CJnMa6Xdzr1Duh01H64xDWKnljom1cONY
	Y2SCmhNqrvpAHEBqxW6t4ccRcVXCwjs+mkIwDt+cCAxD1FMRBGxGfF63vSkPkMeL/u63gBpPkJz
	T3r70FVGETRmDLs6fMYfQSC5bZCGbD7VKEjYYTuLr7TBYLoogxEQpRB/6O2Q1awS1AMUb/vrsoQ
	2onKtEw1THKcympUnTO4RsUWwESrZrZI7np+3wHXl70CbPqREwc1jY83aCtsKhCxcZRMZrEoTlm
	dEgBGDkYihyUZHWWA+T1kHazAr8+TWv1vgXFMFD94kvLsa9qF2ky4Fpfgc/6UDNtqp0mJA==
X-Google-Smtp-Source: AGHT+IHLbeEWvDtZyLpkZYq9v/9MjHWg44ua068Wk7HOmNac3d6CS9uj1wvGNiv38jkJSQ0CP6C9+w==
X-Received: by 2002:a05:6402:22ca:b0:60c:39e4:93e6 with SMTP id 4fb4d7f45d1cf-60e52d1939cmr4886568a12.24.1751555623170;
        Thu, 03 Jul 2025 08:13:43 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828e1845sm10903471a12.23.2025.07.03.08.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:13:42 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:13:40 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: Add support for i.MX94
 LVDS/DISPLAY CSR
Message-ID: <aGaeJIjFMLcV8ly1@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-1-b378ad796330@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-1-b378ad796330@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_081345_070833_88D447C0 
X-CRM114-Status: GOOD (  15.94  )
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

On 25-07-03 11:40:20, Peng Fan wrote:
> Add i.MX94 LVDS/DISPLAY CSR compatible string.
> 
> Add clock index for the two CSRs.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml        |  2 ++
>  include/dt-bindings/clock/nxp,imx94-clock.h                 | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index d0291bfff23a27cb55683880fe3a1f8b3e2ada5a..27403b4c52d6219d31649d75539af93edae0f17d 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -13,6 +13,8 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - nxp,imx94-display-csr
> +          - nxp,imx94-lvds-csr
>            - nxp,imx95-camera-csr
>            - nxp,imx95-display-csr
>            - nxp,imx95-hsio-blk-ctl
> diff --git a/include/dt-bindings/clock/nxp,imx94-clock.h b/include/dt-bindings/clock/nxp,imx94-clock.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..b47f74f00f119ff1c1e6dad885b5b1e3b1f248a1
> --- /dev/null
> +++ b/include/dt-bindings/clock/nxp,imx94-clock.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */

/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */

With that fixed:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>


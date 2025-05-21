Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2858FC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 08:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwr4z+M06i1mMSwv0rCr5dUsFp06XkoBxQnrw1/GtgI=; b=II3myg77wgeiKFQZbUcs4zykYu
	kPTPFtqHVe3aLwNc+AxH6DKhnFZcLEVu7iUjrxltbVkq4sJuYNIvUV4+r/ywatWuLUbD3JPAsXkh+
	wNtNPx+Ij4d9mmvRq5mgat3+yq8ihzMKrHCvEMyXwimIFZbzZDvArNfATF7m7wow4af1h1zji6WS0
	eEbBQju5QuH2h2gti8CtCerqRZL4WKCiIQNTs7fImI7TDG6R0DtOJLn1tps62VI0WtpMDAFSc+ofx
	LNvVMFr0SOSvafsiIIA+UHBFPkZekQWzfdTy4/adCX7eaGDGiYhQaz7e6tlq+EiaQwXZvsVAwX8XB
	t/2u4Rog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHebS-0000000F8dG-25yM;
	Wed, 21 May 2025 08:15:06 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHeZP-0000000F8WO-2sgY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 08:13:00 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-54d6f93316dso7694039e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 01:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747815177; x=1748419977; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwr4z+M06i1mMSwv0rCr5dUsFp06XkoBxQnrw1/GtgI=;
        b=mtHOk34Vnnivp/tQdptsmzYp4nMW8P1IdGqKbBL9yOzrxMzMkcGfoFWsG08L1nF2I6
         5cuZENhSpe984LL+qomHsJfnb9afuFRgy7M/XyvtiwgZ+em5zLmbFITTxs3xfa18hmqM
         iS/XxRLIR7qGGKYUeKOHUs10IrqTJWgBgA80gCruVf3V1Ydf8XznQIuxa0AzkOcKKsLX
         UDLzA1D9JrNtwkRuJvnVmRFktAfB2cRuNJP0UzBY8N7ofhNNbhIo9UZlkHkp049ym4cz
         op1J+Lcztd/isboz4/GPUcgZpW7wJzwn1D9xmA5PsEh7sPf/VnzMtnfQdzdN7zlI5x2T
         bCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747815177; x=1748419977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwr4z+M06i1mMSwv0rCr5dUsFp06XkoBxQnrw1/GtgI=;
        b=g3uUirD6FRjL4XlTRBspn/HgFEx6aka8Qc0OJHG7rTL1JydiBW9EEqYV1Yvs+RQu+N
         Na70bSfYhlCRk60h+ANNNJIrw+oFRrXVDCO16VRDg0ixE+n9yFwK6+ypxh+wW8KEjDeo
         ZfSleCnLS7G5MfFMxOtOPavqq+V/btn64xL0hOQ3wkLv/1spfd39qMKkKAekSXbu1Gzp
         304/W3ZUhEcGevBsUXLqZ/gJwFR+e2/yubb/imh9hko48zD2pe/Dhi/3EiEL8wdKVgaE
         i2GbjG18EVaZ6S5Oh1n+8HU0ORR67XJ3SE+DQCsmoRD771UzlfxfbJ/2nY9DCx1+8yzw
         D17Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwdkzlR6tcEfYCyOXfYNGXJEJTIAR/3MFsK+ssuCZtEbghThfzQ98EPq3fFyUnw+/9fxL53PftPJ+GTExt5ZlG@lists.infradead.org
X-Gm-Message-State: AOJu0YyL1JSDJ6JlAAwck6+IzYfg/j9O2iS2sxeG3ed4ph34SdsNOwF1
	VZ3XigKKtVXlH/ffzR7Z3Jl8s8OFoG86loRyT64/ogrUwOVwUJG3HKSGXs7SSRdejoeDr0fjoUO
	8ODLaK+SK9WQ2jdzSINz9pJVEtIn5YzAYArhe5gB7cg==
X-Gm-Gg: ASbGncuLX7wRd4/pOiSgnaG28nlZPmCm0EJU6GQh88eqoyeH9hge1rdkfP05QFLHLz/
	Xf5zwAgFeUGwpfzxgw3QEhygcHY9SibsnhmmigYIcvbFlvmX9ctbpfrN162Iq9ysgSKCriCiVsD
	KbT4JMnmdOZVbt+POQva+a1JXyDXu8p8o6OWn+qks6y3k=
X-Google-Smtp-Source: AGHT+IHypaEtLgbAx0hI1pwfX+02JjmtIZJY41Yl+79R8Nfu0dbAldHSIKhHCLmxFeUhAu+kg3UiZtw/f5zBM85OvXE=
X-Received: by 2002:a05:6512:6805:b0:54d:663b:bda9 with SMTP id
 2adb3069b0e04-550e726811emr5586519e87.51.1747815177553; Wed, 21 May 2025
 01:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250516100423.1685732-1-ping.bai@nxp.com>
In-Reply-To: <20250516100423.1685732-1-ping.bai@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 10:12:46 +0200
X-Gm-Features: AX0GCFtWAB87B9iw-eCTV-w3vbrXw3ATM0xxduBEOTn9gKp9rC41cR3ebYjTvJQ
Message-ID: <CACRpkdZ7iymSvvst8Gi3EaeG--2icRgkoKEiJxxjLgC2LCDW_A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: freescale: Add support for imx943 pinctrl
To: Jacky Bai <ping.bai@nxp.com>
Cc: sudeep.holla@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	cristian.marussi@arm.com, aisheng.dong@nxp.com, festevam@gmail.com, 
	kernel@pengutronix.de, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_011259_731443_B3CA4ED6 
X-CRM114-Status: GOOD (  11.61  )
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

On Fri, May 16, 2025 at 12:02=E2=80=AFPM Jacky Bai <ping.bai@nxp.com> wrote=
:

> The i.MX943 System Manager (SM) firmware supports the System Control
> Management Interface (SCMI) pinctrl protocol, similar to the i.MX95 SM.
> The base offset for the i.MX943 IOMUXC Daisy input register differs from
> that of the i.MX95. Update the pinctrl-imx-scmi driver to add support for
> i.MX943.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Patch applied, expecting the compatible string to come in from
another tree!

Yours,
Linus Walleij


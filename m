Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1C4C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 11:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=; b=V6NQfTSwdbPovaudYqduHjpNOB
	YRFmiTqlkztkUSIVsOL3M6UkPwi2vVHhsTjueGkVMR8dSaiUFrt3zXtINNOeqEikWJI3BJh9/b/IX
	bPSy52SFpB895mxFmATFhzIBAQaEnEGonRrsI3pWT7m6dzTK9Bz/sWlBlMPCBv1Ho6gzZ6pJh+Is9
	50GWBFgm0SnhTsQvKB+5bdn33qTuAeoDM+gfg6hOWyKyWSe3e5SFa58zg6uMa8J/h9ffKpehBk7vz
	Yn9ou0V7PwcpfvTwBxafocZzb0kBkZf7edPrwEZs8enEFtKhT95Ho1BR2rLVnK+d+T1A3hg0fVa23
	s70AmLcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ii7-00000009O9d-0ehT;
	Tue, 29 Apr 2025 11:01:11 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gWM-00000008yXR-0XcT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 08:40:56 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-3106217268dso54204181fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 01:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745916052; x=1746520852; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
        b=AKfDRRjgvVLEd8BjDO8BEft0/sbUc+IYaqPUP1cMuuXzKXB0dFRYFWKbDicFXjlJz1
         LBU96/EExesDIHuhjZN2s+Ksk9mhBno0rILWjs2TkvzbR45Tc5ujnWTd04+sbVbTqTlp
         CizMEU0/72KTvShFHYi1EjrW3cvgLsv7ZN3QPFdAUvUu00Gdv8mUvnvmAQ8k8BPJFFDm
         9gCOwlUf9CyE4wtBrNepGr3gECOKQUgbNOVinIuCfMfT8f+/ZocrfSvljFEt2czU5agH
         DVtlgZmdyIxEo0jjq+4RjhiksyjmecoShrM7H/UI4C9lQ5BBZmO5qL7eGMV/sCB2+yvB
         CTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916052; x=1746520852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
        b=Cx6dlw1aU0TNzf206a2IiLwwQlH16Hdqdx0r8EInFQ5Wwou/CEkmp3JMDooelR+ld9
         bFzLjHlcmGZnpaGBv2XCQ/Og23rtF0wutdJ7wS7gMsZIgQmmCOMf20DNDmYS3/iflZoX
         KgggNoBL6GtKtilmC9hgEuriT5f5jtPyeu+nIxrQBzq4gcdOTucMe2gmOMfq5KWmj9hY
         zYQyCSyRquPG3K7UCbdH25Lnlnx+uAceDduv9SuiRGeyxb4V2rOLl71GIA3r+8rEtRPl
         53cjTOMbOofULgobRzVtufUs0CXJmWrHSnUQ0ccmpjG8tu8apXIBgKNtfgSTsvcAjOf0
         qEsA==
X-Forwarded-Encrypted: i=1; AJvYcCVH6WywfeGUWVzLJ1ZrbeMyCoikv1c0vh+Dyd9HF4rdHtYiev6lVHOadiQAg4C1pIphyPNTs44iuhnqSHROQGnk@lists.infradead.org
X-Gm-Message-State: AOJu0YwwZ4qVuFO5qiUs7+WdjSvU6np50Zzg+WKMV84jlHRS8QorvU7i
	drP7Ug/lTc/7RZHJHwMqVB/2Wt2VS7lvUPiVflmKqQt+IcE8iQOzWW3ilFC4mrvkzMIcvsaPx6b
	KBDvaxXJClguYnzRGCdU1G+6Zsmf9J1mRm6EXMA==
X-Gm-Gg: ASbGnctlbB8OMJvZWG434ZpzSn9s6vY8coe5BNzrwlNC2qiY5+rYJKizUxkGMiKdOzs
	UvgtsCdnskeQkJECyxnB0uEe54BFfMbLE6Gx74pt2e3q6isCV+1AtTdhqBxpOjLEaHxJ0tp/Y1n
	i7EKZ6X+vNjw8oKbdLlhUPTA==
X-Google-Smtp-Source: AGHT+IEUiqYB296CVrwZ+xxBw7BC+pTcJa/x+6Bu5GNB2EvNhnBwa7BLSUJNRUMp+Ehtf1mLBoE9JSmzpMhMYJBukms=
X-Received: by 2002:a2e:bc0b:0:b0:30d:894a:a538 with SMTP id
 38308e7fff4ca-31d34b6c243mr8766341fa.21.1745916052135; Tue, 29 Apr 2025
 01:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-15-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-15-8f91a404d86b@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:40:41 +0200
X-Gm-Features: ATxdqUEhPh2HxY_cKMawBJnfuogL8n7jPhFvg8U9jTR5km8hYrNkb1VPdIYXtGQ
Message-ID: <CACRpkdZt8zem0hFUiq3-Z1feNZHRh3R=Y0cEtK=pVt=bJ9Qf1g@mail.gmail.com>
Subject: Re: [PATCH v2 15/34] drm/mcde: convert to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_014054_171546_5A841C40 
X-CRM114-Status: UNSURE (   9.13  )
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

On Thu, Apr 24, 2025 at 9:00=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> This is the new API for allocating DRM bridges.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


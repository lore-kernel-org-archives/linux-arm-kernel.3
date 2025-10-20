Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067D6CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELGhRwkcey/M8p9/NQ4xSZezxHFCzELpwhxQQJfRai4=; b=ygrtr17yrhOEcBOU8chbanK6rz
	cM73Q5ZGXQqNaNPeY9ecQRAkmZixADG8pKpD8ZXie+v8BF0TZ671H+AXI1bGD5rXG7AMo363+Wvu/
	ukkn1Jlo9xfI/IN5EGdLaLaXT8ilaK3pbM1s0jy7JzQ7YWcKupGLX7KtWtVLi3XxPmrofJDCdtivp
	ZE2l3V4KEh04HOki9MLBVVTQed+M/CbzQqPGkzdfWM53cRRq1CuXe3YR9r8QDC+Xc/M4Mk7lnqD9n
	/m4xaul0sz/qOraXscUsjJoo3YX7DAw5qRE6DjtqyTapQY/6oW6hptV8aPGTkGudCICgG33h2Fle1
	qT015njw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmoI-0000000CknS-3lmX;
	Mon, 20 Oct 2025 10:08:14 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmoF-0000000CkjV-0MGQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 10:08:12 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b484b15e72bso102613166b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 03:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760954889; x=1761559689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELGhRwkcey/M8p9/NQ4xSZezxHFCzELpwhxQQJfRai4=;
        b=XpHuHy28o7kw8F54OMgoXsDwLggS6pRTYXxgD0KqGj52HFqUg6iEnOHboVGZh0iFSZ
         4SCnhhg34siUTfegsCrlkegC3fUhBvqhJ2WB4ZDHq+yPofmJCXyhBCDqJX0yWJZJjdRv
         l92mJhk6TR8OIwvX8xqwTsU7g2eQni+b3X8wMZRnByHZquPQ4B2u27I0HQaeog03jL9P
         2xJ7h8bf6fkeXHaXh8p/cAA0rkSfdrOM79/jQ8UKo03UCrwl65+rR7MrX5h/TCEhwnf8
         HU/WN4hBAeXpRyC00BuHMegXmoD3Rso8ym548kMPuuJ6C33wY8UzsmiXfikf7EGdbo4A
         Ezhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954889; x=1761559689;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELGhRwkcey/M8p9/NQ4xSZezxHFCzELpwhxQQJfRai4=;
        b=DfQlGgeIqKJmY89P0UJXx5vjJAAx+eS7AFMc22ytkuUYYFBmVHTPg84cGfetNxy7f5
         i9ICDIF3TB4VKYqK8oCcGOcK+ig2JYDLXQpERdMfPSeBSUKRjeGIxPEKoNWq+jbeC3Wt
         kxtn4IAPFw6UYkLwJcmzqpzCFbhM+twFVa6F2wZsbiv77JIPsyh7m+k10IITS539VFXy
         b5ejX8wvxfT15KWwaHw+5XsDwLGUtRGz+WsrvHfxG5B2wRUEJ5cPCCEwUsM6cvTCzuqU
         ONI0T+9o9ce162hs5IM5VoTNJzmyEl+9LHU9NwEgYygVFbQ7ov9blpZKPJM3O3v0cpUm
         v8jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH5LOgJmDo3FGCVBAftMfA88yjK7aKd+ZzHzWr8f6sbyEyNgpP2RHSYx62kSYERwT9AUT24Fg3gVXG9Xa1UEJF@lists.infradead.org
X-Gm-Message-State: AOJu0YxKTLiP15SeaWWEV5M6bGD7KRKf96vxOrA1sNLxMJh3nmProUSj
	GMj7ijOw6CNXqsXjacpugHwJs1i4WeNK6qipWtTy8LMhyx8Br4O+RTaaJEJmLgZQ4iA=
X-Gm-Gg: ASbGncvov5Orx3P8OOpLWNhyorC72PUJZYOu6BEeODrkbFHyzlGXCPJtGxrVXfTlXb/
	M8OMl/YJUFL2LvLXqSUcyhQGrEYLrGJEYaR5jNf9k4zBp3Z1DORIVdB+pw08c9iGUVLL5NkUkjJ
	t720r4Gb9m/boBGoJnS1s1pkpU69u/7nooy2ffcRdq7OxoFDjXGBfwxtBnSc0E7hFUFNFZEQdLW
	Oe88y+MoAYm/Ax1bk4Y3AaQ6dUFRg0hWzo4cGMOZ1HIfYrgkx2BXiBctjJkAC2Ph8nFuVzDQ7Lv
	r15bWuL1cj9eS46b1LIgMZ680BmqPtKyXxwJBT4lFDhtp6IACLKN1OUeZ4StG0rLSsNSrGpkkyD
	tl0luPMK0YQNgNimoX8aBrqYHncfSuvY0xylPRg0B9a0qDiAYmbMLBe/v5xXuI6PoxGXQ5sRK70
	+Hwvp8DkPzyZgpVQly1RgY/FFMCgQ=
X-Google-Smtp-Source: AGHT+IHb4qKarfFb2e6yhqx9qlyNVzUbEwguNDAebFS+BWqgt85Rblg9ZZAJ2S/IaUQJYck+aE3lyw==
X-Received: by 2002:a17:907:3e98:b0:b50:5956:482b with SMTP id a640c23a62f3a-b6474b2e281mr817509466b.7.1760954889230;
        Mon, 20 Oct 2025 03:08:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036846sm740987066b.54.2025.10.20.03.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 03:08:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shenwei Wang <shenwei.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-imx@nxp.com
In-Reply-To: <20251009222716.394806-2-shenwei.wang@nxp.com>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-2-shenwei.wang@nxp.com>
Subject: Re: (subset) [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc:
 Add "rpmsg" subnode support
Message-Id: <176095488745.45867.896865155474758901.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 12:08:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_030811_152421_600535EA 
X-CRM114-Status: UNSURE (   8.38  )
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


On Thu, 09 Oct 2025 17:27:13 -0500, Shenwei Wang wrote:
> Remote processors may announce multiple devices (e.g., I2C, GPIO) over
> an RPMSG channel. These devices may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
> 
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



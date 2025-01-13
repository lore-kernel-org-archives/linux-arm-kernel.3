Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6055EC02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHmss5GuNuMPMuJLhtCwmXANZEgbIohfRiOzTjx30TE=; b=z4Xk+374NGqY+jldYBObSEqZgf
	0yBh7y+8bjaX2dobMq0M5Hd3Th3mPhBcnHG4tMEY3gDyBb2+lvBJ5ptOKxa/rTrbOlDbM+n7JQaO4
	d4dFhjn6WjItZbt33oDN2yw78uKZYa8irR6+fdlAY1AUXejd0pe7jjGpvMtj+vaP3PlsPMtNuaT2W
	LoJCNWRFUNN/IzO8yL4pN6YicYhf4fKuCLEJNn/VbIomoin46tl6hYjH6mB14m37o5PucuLqSH8yU
	L4KbT3pQZxq2bFjWV7gendcWjPnxelxXmWv28mbQmI9vox85M86r+3o+8g7NALNXo3SEeiv/5rvfQ
	q+JiJAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMyj-00000005mrW-3bqR;
	Mon, 13 Jan 2025 16:07:49 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMVr-00000005fuw-1p8O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 15:38:00 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e3c8ae3a3b2so6076498276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 07:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736782678; x=1737387478; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WHmss5GuNuMPMuJLhtCwmXANZEgbIohfRiOzTjx30TE=;
        b=wQy6fLtQ2bqMDeP3JxQ5BFeQQ1F+SNodcHdvFDEN4iz2iTkD9CzcT0MrM/zH9SoSMY
         /72nUvlpguWEx++MG9OW3kKYtrmTX7SLk0S/5NZbL2TvQ1lDGnJlI9l/qVnGQyXt3/aY
         yFVFT+C/VRYbFryNsTHRu7RFvQvBZSWo1RSWaGGsMGboTuC1ehRLEKYtfu8wHuFbWqqV
         lE9gbNYR8oo7LI3uuIQdBwOkC7vu2s4EooTjri1mxtF6IApgDLxD0m64iceAnXE1/lJ/
         uJGnDm9NEUPVoJWY1kQtP+LFS6TPq2Db+XJRKrWIwQ19vOgCRnGXmKFFsGB/GJwY+79w
         zG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736782678; x=1737387478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHmss5GuNuMPMuJLhtCwmXANZEgbIohfRiOzTjx30TE=;
        b=amUZ88c8yYkd6PvghdCcR+opgErHXw6ADhcdqQJ+MuYAXGqKZZPpoZqpW/Sqfb+xgL
         rpiqjDMGxjqYWG1E6/D8tCZfIh6WhWOEfrJfRsDyKhDlW4fmSOdyRavAaWtLh2OvYh9k
         gXXa5HRVsINxVUVEOhygJy+QT89SKhmmZokkkuuwysfveIU4OadUFEA9IyGOhT+Tywfd
         sAerDHGLknjkprft8bizPUv5TPqSKsg05Vir+3mfw5fiwm6UJz+kZAsLlYd0jm+Q72qi
         09hI9T956l6l9+FRE7nAl68dGsuaMHlI3IRaJxiSeiLUNqdJlWzPON+TP6kryKEt8P72
         LfkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrBZ9B+QAwT0C0nYcOw6wjumlPhEfyywJkk3tYUKF7zE/tkEdJGPeHQh7WaGmPCTVoCw/fKTWQ7+4x2CcnvXrG@lists.infradead.org
X-Gm-Message-State: AOJu0YzentYFDd/Z1bWu3nMrnq5zbjU41hxJKjK2UnWG2rdeehmLwmSr
	Ay+cdpFJ+3PvmhZgBFoYEj7yMRs3Db8zMr6/Rwe5vhmli0fL6GYFQ9LFgU0ov6R083StP/LjuLJ
	Yl2RradYcILYyZBgBjglslRfcPN2uAVmSYZJIiA==
X-Gm-Gg: ASbGncvLKeJhZv6hwS/GhWCR4iLNE3Ae9LjjrbEoW59cRGLTrlWLxMuzaUcNMj+7HN+
	cDVR4SivwXust5v06EC+8qca9aWf3n7rieMfUhsE=
X-Google-Smtp-Source: AGHT+IHmfuzafpUqk3KxG+kn0+sH+vHEKlPScEseDnN/W27tVQ+3wEY9S4Ua75At7AAxf3Kwrj/jQOrBdgSbPpY4wvU=
X-Received: by 2002:a05:690c:3693:b0:6ef:5abd:d0d with SMTP id
 00721157ae682-6f530f28e53mr163298117b3.0.1736782678456; Mon, 13 Jan 2025
 07:37:58 -0800 (PST)
MIME-Version: 1.0
References: <20250105161344.420749-1-ivo.ivanov.ivanov1@gmail.com> <20250105161344.420749-2-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250105161344.420749-2-ivo.ivanov.ivanov1@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 13 Jan 2025 16:37:22 +0100
X-Gm-Features: AbW1kvb6SL7ENMYcV-U0gwzZDQlxjULLo1-VKuQbPKeXd7cbjjP45Tg9iM2uUAc
Message-ID: <CAPDyKFoUajmhPu-xTzvjrMZUzqmECGXX-N-KLq=A6+hrwNuvWQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: mmc: samsung,exynos-dw-mshc: add
 specific compatible for exynos8895
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_073759_489981_FC424C73 
X-CRM114-Status: GOOD (  15.28  )
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

On Sun, 5 Jan 2025 at 17:13, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com> wrote:
>
> Add samsung,exynos8895-dw-mshc-smu specific compatible to the bindings
> documentation. Since Samsung, as usual, likes reusing devices from older
> designs, use the samsung,exynos7-dw-mshc-smu compatible.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  .../devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml          | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> index 5fe65795f..ef2d1d7c9 100644
> --- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> @@ -29,6 +29,7 @@ properties:
>                - samsung,exynos5433-dw-mshc-smu
>                - samsung,exynos7885-dw-mshc-smu
>                - samsung,exynos850-dw-mshc-smu
> +              - samsung,exynos8895-dw-mshc-smu
>            - const: samsung,exynos7-dw-mshc-smu
>
>    reg:
> --
> 2.43.0
>


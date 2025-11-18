Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59486CEE328
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 15:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxHLXotX/VR/smtmuGtjLAN5l6lgr5iFZlYRIN9JEyQ=; b=mdXwsGcV1NCvHG7kYOzOdNyAxX
	Y8CkovqFAvAQr8KqevchVm7UbwBMoLoRpnFi451CrX6LknV+pbqOoJ/DVaVefYcDxN4O41zNGZbfj
	TqNr9ZXB9AMElXvOztJxs/q/nKGs0lN8HSfzEv/C/woVxC335vqywqGh2tOfEulO3UCSLw+LQAP6O
	M8w5WSoFwvpqgCT+g/Qa9L4drsrrGVtxVp2hGO+sutzsONT6kvxLIOvOPw0bUFXxVhBmnfetzbh2U
	JBhMwA05Y4aRwoNlgRaALlLOpcLm1l7BDuNuc7wZ8dyLLAQ0jMi4wM+jiIhfkjcKer86gzE7C0rZh
	NAxKx/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNgk-00000000dBs-0Gv0;
	Tue, 18 Nov 2025 15:32:14 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNgf-00000000dAP-22Kl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 15:32:10 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-787ff3f462bso64849077b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 07:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763479928; x=1764084728; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IxHLXotX/VR/smtmuGtjLAN5l6lgr5iFZlYRIN9JEyQ=;
        b=tiahZMXecCmny9sSi0ZOa9THL174yrscR8Z0Qdf4H72NorSzn52mUDmBA14iSD5MZs
         ykwf1gmNubMHDIpbCFNzm8a2r3KheBqmJyUjB4tSEfXdD0lbL39i99MKWW/VS1ZIhWJp
         Rt2TFu2jmjek+p3AtXetRTY5lKK7ybM+VJyCsQDP6Ame6wn3fcuQ5a0bzm+WCoVf2kbq
         2akie1trAPslovqNCkYLwlbDVm3tVHASexgI6gPhQ9cVttcA7ZC1OL6QNA3d39z7CDHc
         zhpUBwW2Jm5qvaUt7AFiHOX/KVL73ttUZykkCFTi6YDHlaxNNMmqhZObQ36fmcNwm0bE
         B3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763479928; x=1764084728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxHLXotX/VR/smtmuGtjLAN5l6lgr5iFZlYRIN9JEyQ=;
        b=lncXvKsuwvZhlkAzq8mM9vhcHGH4KCWw9SFnRQUre3sSLnEwsiOLx0xlWx/ZYpur7T
         RDNLNktdzBGzV7+MhTYp5RGZe/TiH9tt2A/7lTaFDZ6i2IGAEuSUln3fOO2k0pvqRtzM
         CkHPzO3GLipSsf94yQMs79oGkrQnguZabPrIUMNNTcbXblyRN4/LDTBhqhrN9KXO2PAl
         TdL58YPwJguhscKwK/QncSJnIkCDfbw4UbiOW5FzychlRutor4yRsZxus2uTULM21E07
         CvFz5P4RtSxIzs0HXcTOWmcVyCVI7vCIltoBZuaHPGl5IM3m3VFVnV67b60jW5x1WVgW
         3D5w==
X-Forwarded-Encrypted: i=1; AJvYcCV1P4bjJhqK/coq9DuP84Gy6imP2VTYy8NMjUFdC5qXGx/ACM3hiec8AFYfnbCeMXjTcjROc9DL3jPMm2PqwnVD@lists.infradead.org
X-Gm-Message-State: AOJu0YzsCiS+caf4czdnWfUJQL8krW29eMLJ/RspBvGI80hOPz2/wEQW
	rObswskeSnie792DLd8dBr0pPGfEYVn5iA89ke/0ob3IwSgF+SLlZ8iD9mAXH70WUzSuGp7Afti
	oHTFW9H+5n64Yod9vQkCW6VU3i/bjoC6ZrQqKh6shIA==
X-Gm-Gg: ASbGncsimtF9tV1sehan/5SLKARtZcjOXzPobvH9Gtz9XkwFt2bnh6GB+7IKYBguvW9
	iX/Epv0bHS6IDWyBOzK2pF2BXHENab+HOXCftbDuAxELts8DRrLrHaOohU48f8YnlWGsK579659
	0xc7TwuiO5skQbv4YjYeYe97BfNeHPlBbO1l/ws7KDwuukSaB7q6k+T76XX92lB21MkjXYnTuUI
	Y6Wby4JTnT0gRyXI1drG1pOWlAE7seVZIOv/tEdq2uR98IBK6BAF0mqYFcR2pC1cWDvFhnkpC2u
	3lnmJ/4ypFjOGszQMQ==
X-Google-Smtp-Source: AGHT+IEc8GglvCIsD6cGrALsj9LLh6N+Jx7VKw+16XtXMLh8fZV72joZEMGSMeUR4bEuhwbV7IWYBeRgua2rFcuL8iQ=
X-Received: by 2002:a05:690e:d86:b0:640:d597:4170 with SMTP id
 956f58d0204a3-642132db3f6mr2565633d50.0.1763479928233; Tue, 18 Nov 2025
 07:32:08 -0800 (PST)
MIME-Version: 1.0
References: <20251115122120.35315-4-krzk@kernel.org> <20251115122120.35315-6-krzk@kernel.org>
In-Reply-To: <20251115122120.35315-6-krzk@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 18 Nov 2025 16:31:32 +0100
X-Gm-Features: AWmQ_bmXlb23IcHWwlaA2kdC6A8acUsbATP4k59c9PPxA0jX-7QbyyZj3x6u5n8
Message-ID: <CAPDyKFpquaBo64eKvMPiCPdKrPkYc8fhpaOmFL9KN0UzFs0xkw@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: mmc: am654: Simplify dma-coherent property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Michael Tretter <m.tretter@pengutronix.de>, 
	Harini Katakam <harini.katakam@amd.com>, Shyam Pandey <radhey.shyam.pandey@amd.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_073209_527402_7FB6CACB 
X-CRM114-Status: GOOD (  14.62  )
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

On Sat, 15 Nov 2025 at 13:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common boolean properties need to be only allowed in the binding
> (":true"), because their type is already defined by core DT schema.
> Simplify dma-coherent property to match common syntax.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-am654.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
> index 676a74695389..242a3c6b925c 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
> @@ -50,8 +50,7 @@ properties:
>        - const: clk_ahb
>        - const: clk_xin
>
> -  dma-coherent:
> -    type: boolean
> +  dma-coherent: true
>
>    # PHY output tap delays:
>    # Used to delay the data valid window and align it to the sampling clock.
> --
> 2.48.1
>


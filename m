Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE369C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RAyMzA/EpimoKgZu8On+/pcgYmPCkV2jR9c+DuBL0OM=; b=PSu1AzShNdpSbEa0qIn1xC1i3b
	Qp6bdaN4LnUisrTNNcO4LY4Ug85iMeexChfD1zqhwuRx1eUTAFP+nXQKEe2b3S6F8Pag1DbfJ5x+Q
	xixnkVQpsMRC9lVl9zZ6rE8p9wvX6WZMmL8cPOZCvcFOgRKfkY9nM5mJnBnc3kOCmdZvIcxBel1yn
	kuIK4YGc9t9mG4Mo8eNztQrkroCvVOCyg/mYXR5cE1V5BHWOfGOrQ0RYQSWjBmgvTC7KZsS0hCcLs
	UhhdK7zAvMmAolNpgPX4D1zCCjcFh+o7XyDawKTeYNRQYqbp8SEXFPZ8UyLF8ks4Jcm8R1UV6V4vz
	3havEgXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKxZ-00000008NB1-2FXU;
	Wed, 12 Mar 2025 12:13:17 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKCu-00000008FGj-2rCk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:25:05 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-6efe4e3d698so61914377b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741778703; x=1742383503; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RAyMzA/EpimoKgZu8On+/pcgYmPCkV2jR9c+DuBL0OM=;
        b=koY5dodAWfJucyFjyg1vZjMoKfE+gtI6vSu3ErFl75WS/SN+kX+AHQ3tJZxdYp1J0V
         z3jn9YF/o2KLU7PjT1JXji3HFAHoo+f35gLavSQaxzNfu7uexccDvxx0ez0krt+WxEvJ
         Umi7H+H9QGNJCisMdo37NNLhaSqBJcyPZ1nm/wjPNL6Maw/5YQ8eOxj8kVQ6QfZSy4DY
         lP9Hv5hrncXyrnxjYoDeKsiR5jvk2YFxdv2FQOu0KNCmr+ld+8uEY6+yMzFRfRNrRgYQ
         4k7TL/nLU7vPfhdyvKFLLRe0Zr87zngbJDga7VCTzG+iN2kT9NqbocQwrXIjsLcCtjp0
         nAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778703; x=1742383503;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAyMzA/EpimoKgZu8On+/pcgYmPCkV2jR9c+DuBL0OM=;
        b=B7dAb/uI92ReA/E7GxVPBPQtUaFCdSz9EKV9vwUKgFI503Fc25NOuvFopAHsTJkO/+
         YKlZxF+Jf1rK4evXKMS3OpIWbao4vRCLCyo3L/W0CUZ1/foprFye61bXU3de16OeBL3k
         BOSyqSU4nsLvOVdw6BOxOq5NVVo7J4JiDEgAmLS9WBXKPdg7JlVId3vj9gk8XPBo2mBM
         NCOLB/nrjOV25rfJgxceY6GJz+OgkL19IUbBASa2dQPuaafxdlMoHvIIZ7kbNY2z5BQX
         3Bkm4scwYTNuXnPwAeISsEWhfjSE0V2Vf6kF3XO44ay/smksN3cn8P59FJmzehQxG7vc
         s9ew==
X-Forwarded-Encrypted: i=1; AJvYcCWWJ0I+wZ3htYavlX0qoq06uUIQVKG0O5F3ahhJJAI5/CrOH5Rsn+2H9R4oL8dhRjszIr7Eu39ZIKtq0u6cc9H2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxybmzpsl88qPmq+oDJsSI6KUCRHFAnGCUKtxpzPm4hAIifa3H1
	j6Ye3/idiDNxH2XdBdJmOMnpAFZ1mPPGukJrOZQeIRwEmHCleyLYts14KO7+itfFUqyxo/oWBMo
	2LHS0QHjmgH+4ZOb6IZ89x5XCW6q2jcNtur8uCA==
X-Gm-Gg: ASbGncsd/r2nelBnCHcQDkxX1stwdXQI6En+T3gb1CxLp2JDxZ0FNwjcy6uTUn72DkL
	wtkepoRRJcHFJZphYsx/Qk9Jr5c7RwA159RwiLFw0SCqu5yJ/ABg0Eg02h27w11KOz+l+L9I1HK
	ny+ctvRTrlvAxkJBvsDDPeuSiQzLo=
X-Google-Smtp-Source: AGHT+IGglu9wcUZQJ7kM7L4REyiuLkmFGiD8FrS6mR3Xkylx8tygAZpPYRnV6JQzsp7VhJrt3avxrAJ6Y8EDAb/0jS8=
X-Received: by 2002:a05:690c:4287:b0:6fe:d759:b156 with SMTP id
 00721157ae682-6fed759b590mr172175717b3.2.1741778703631; Wed, 12 Mar 2025
 04:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250306170937.242183-1-Frank.Li@nxp.com>
In-Reply-To: <20250306170937.242183-1-Frank.Li@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Mar 2025 12:24:26 +0100
X-Gm-Features: AQ5f1JoI6EhIkJvZ2urcM945k8zoD09K83RZ6y4RdDZ4NA6PxGMieT1lQ5GBlVM
Message-ID: <CAPDyKFprhKa-XqJgfPjphuBCcn4ra2Gj0VewZ8iGqjYAYc2CFw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: fsl-imx-esdhc: Add i.MX94 support
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_042504_715875_4CC0B470 
X-CRM114-Status: GOOD (  14.46  )
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

On Thu, 6 Mar 2025 at 18:09, Frank Li <Frank.Li@nxp.com> wrote:
>
> Add compatible string "fsl,imx94-usdhc" for the i.MX94 chip, which is
> backward compatible with i.MX8mm. Set it to fall back to
> "fsl,imx8mm-usdhc".
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> index b9b9995705290..b98a84f932772 100644
> --- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> @@ -57,6 +57,7 @@ properties:
>                - fsl,imx8mp-usdhc
>                - fsl,imx8ulp-usdhc
>                - fsl,imx93-usdhc
> +              - fsl,imx94-usdhc
>                - fsl,imx95-usdhc
>            - const: fsl,imx8mm-usdhc
>        - items:
> --
> 2.34.1
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C019AC982E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 17:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+f9X0ca+9K+KN+ouHkTy41XPStpAzUEe61gXgOIJlE=; b=rsU1jByAOuLFOrcVCnl5tADgzW
	K/gTjfXIWTeXY+QsiUjBqat5hQx2uTBNvBhyCpbwft5o2MNDPg/dFVAv/Y/4t0HYDZDmyC6GlbaiK
	pvbfhCLGmDcx7zN1L6/kV54iXM2UgPc6Rl36gka1rPzTjz3bIh4H5/9Ks2tPMjIoONJEJcUfbft/9
	pOl8jD8TY2QP5tWOJqlrE6P6dq1aaAKi+FOFfhc15d9bbkbdmEN2NQlGeoebHjz2MhjQAATX7Ch+t
	9eMzWfqPxZcjCglS/LiKrlJyUDQd5zu+wOgCiufjmws49ePMRWkR8hwYET8D68ML5r3S1mvWZ+gO8
	laJ4YodQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnyo-0000000EbXP-3K4v;
	Fri, 16 Jan 2026 17:51:26 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnyl-0000000EbWi-3GHu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 17:51:25 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6505d3adc3aso3670837a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 09:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768585881; x=1769190681; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t+f9X0ca+9K+KN+ouHkTy41XPStpAzUEe61gXgOIJlE=;
        b=JtIq4wtqvS+w5YJ7zRXnBrKbITEG/BJnmRXKNVP8OnSSJOUaqbaCMUxQjKyokinqgr
         H5Yb1+T26MsG3owuagnDLyzzglTBMRjgX64KkAC8RYOgM2K3qYwa76dOLD7Cb/XEn1z8
         uS3kemRH+fIpRtuaUJjAnSmuR75TM348c5j3yX7LN/UKinBdQzO96J3wcY8U6nj25NCP
         kGydNtOD/mEDJnqNC28XFtVK1R7LxSOxgJoPfohBI60H9ArxLrT6keudflAkp0U5YSkG
         jKRzosqZwpgi6t5ds17t3IOYVv8jLHubwHy+Ng9Pe2N7L4YJPlu7h8QnUozPk1nZVEDn
         IDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768585881; x=1769190681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+f9X0ca+9K+KN+ouHkTy41XPStpAzUEe61gXgOIJlE=;
        b=c4EXJJMHWAApD30LCnZkEPQc+R6I/WjeIzThHMI8qh1Sz5X+QiCzOcwIwjGYsiGcrB
         EDuvePF+kA2mMng7S7qSK1fdsO1KLHTLDr7uvP/RQ4aBeINPpq4WlPZyvWqSbe0wP8vX
         WsnzQXoY+EWiFfNJ+Y1mbi5vHWOgksPhtekLfbrnTgE7gqiMHhJJ2c4CLP+XGH5ACGlh
         u+7a+DhVvQ4DNmu1aswxN/5XyLw0nSSZmxV5g3SzA6A+/x7iJBqe9isiyFThgu8KUpdx
         9F91dOzGSLnSTChz3Gki6p5Nc3B7pldUBTQaX3R8F0F7PTF3wF+WzKWpA+4eTQzjm83e
         9zmg==
X-Forwarded-Encrypted: i=1; AJvYcCX9qDqYXR8i/P1hEty2apUqxDkyRg2ePEIPrfCYeWXC1f9WA2zpLyUJtwj5gkfLnQJxvYCWJmvBsTH11z8eUCux@lists.infradead.org
X-Gm-Message-State: AOJu0YxmwjaKwJnO9rmcgIzIA331klwnCKqWu+a5Zq+WPMxG4M/ebcR7
	/qLN9BI74d2RUYQ6q0dS/GlxfiyhczoKr51zI+fLuoPOW0fdS/8XOYHmPzTI4L/BzK2Bzb04W4V
	i2ESrFkDbFwSpqJXo5IRSuQbw3Rxcps3Sc1k6nic+5w==
X-Gm-Gg: AY/fxX5Lh1EbBZpRku4awGxXmwYspQbCfvHWksGUC4hpYdARt5scYmi8SWC8IsWhOBR
	RyYe3h/lBPUhY3V7izV0F9m7gxs65YeZF1UZ0MXDI+LqiiK1Ol/rYpP+ifxj6dzEQeNciH8tppF
	vaKKivW6NKuQDbHeuw2EacQuONsas//tNIJywhC27oKDSXKROD1aSjr+Y8ECQN3dJUw2bAqhHA0
	JPnIzkeDxkqkO5tSKntqmvS4wRynunE4rWB7lzok19xZvOTFEOTkW6/S1WIGst17tYknnR0fCiG
	CLDK6aURUXMs3Mv+CeEik5dpPwHflwWThh4Pxozn
X-Received: by 2002:a05:6402:524d:b0:649:cec1:6cf1 with SMTP id
 4fb4d7f45d1cf-654ac00290emr2575856a12.0.1768585881040; Fri, 16 Jan 2026
 09:51:21 -0800 (PST)
MIME-Version: 1.0
References: <20260116172915.99811-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260116172915.99811-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 16 Jan 2026 10:51:10 -0700
X-Gm-Features: AZwV_QhtJIlvC8lax7reCIuuwunpA2-9R9Z6379FfXEQO74d5fi8ERBctyrcGDE
Message-ID: <CANLsYkzU8YDv_PzSMjj3+zAg-js8Yo8uFWotzzz2r_nYDK3M_Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mediatek: Replace Tinghan Shen in maintainers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_095123_854523_4163F632 
X-CRM114-Status: GOOD (  15.17  )
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

On Fri, 16 Jan 2026 at 10:29, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Emails to Tinghan Shen bounce permanently with "550 Relaying mail to
> tinghan.shen@mediatek.com is not allowed (in reply to RCPT TO command)",
> so switch to AngeloGioacchino Del Regno - Mediatek SoC platform
> maintainer.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml | 2 +-
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> index 88575da1e6d5..508b8c2f13a2 100644
> --- a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: MediaTek mt8186 DSP core
>
>  maintainers:
> -  - Tinghan Shen <tinghan.shen@mediatek.com>
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
>  description: |
>    MediaTek mt8186 SoC contains a DSP core used for
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index 179c98b33b4d..bdbb12118da4 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Mediatek SCP
>
>  maintainers:
> -  - Tinghan Shen <tinghan.shen@mediatek.com>
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
>  description:
>    This binding provides support for ARM Cortex M4 Co-processor found on some

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> --
> 2.51.0
>


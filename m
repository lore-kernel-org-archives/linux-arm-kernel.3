Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D2FE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNXvfug15XfoQwdKiIGBWtNC3tcA8qpMkETpkFfQs6Q=; b=KU7Jqh8GpRwVdhuHyxurL5UVtT
	wVLhVW/OhKp1xu5uIV+9Ibk+AN6RJxtZPNaaFUQfQFxKHpJIMN1VXsniYVZA5EPOpzF7vErrFsu1e
	SI2+r4fzJn6CjOxA0dgbIfpMrTeJdtWLDPHa+SR+0eCWJCJrXuckMlNAsI9Teii2yl9pRrTo6f/4d
	Nr9gtr9gseXXqvJ6Kt9cEwFKzg5tLrBc8C0/U4NHm8ciRxnoVjnqZOw9DCAyCp5pv44q+QEaRr5pL
	NC+dg5m50V6MzFhZN3iFGaAY4TIyOhr0y6J5mYXlxjqgraf3s4TsNK00jz3tH/haW0u75PL9hAWew
	aDmA/w4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2tU-0000000C3Pn-0L8E;
	Tue, 10 Dec 2024 16:15:28 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2oQ-0000000C2YV-3FIP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:10:16 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e3982e9278bso5075798276.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 08:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733847013; x=1734451813; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HNXvfug15XfoQwdKiIGBWtNC3tcA8qpMkETpkFfQs6Q=;
        b=EglYlCcUvbK5+9SIdzWa6X84cNs7jL+zhekHrNLQjflWhofO21g8KWRbvxz0iwr6OU
         U+38R6fi5/kx5FKYf91js6FQ2Zw3bb0UWnOSTuiR5/ugk287w7g7LVatUFGma37m/Diw
         V1Z9jsR3RQwtuKObFfuZbqQNiINrJeW0OmVSeiAZXIquLERo83eFML9WAUgJ1+909kfc
         D6YWH9adSnTTzsuvZyxHG75nKtQKIz68ybyShffNp0lfj20UMoKMSx0PSNBRHbl15eTE
         /9zi+js+Xe22ooKURWaFXOQQZv8LgVPadBrHe1OikjkVIQqEf/Dj4gs4QKEWKkOrNGt6
         A0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733847013; x=1734451813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNXvfug15XfoQwdKiIGBWtNC3tcA8qpMkETpkFfQs6Q=;
        b=QfcpcsUbNqPVK56zgTiUXr9vjYkmVKKeex1/KmdxyHYiIg82zbSEF8DlEIx5tr6mJ2
         Bf3AnPZC5gqzBeaIrL9UOYU5agkDtJss5TUUMSo/xB2+sjXzdHT/416UI4CXNK2RBJUQ
         oVgf6/lEJnTajxAXkzq0V5QeJ5M/jIIIi2aQ6Y+tci49QUbjTu2GngT2QVCXC0/8vRsf
         SXR9RdDoEe8AEIraZCgAfG1dxKLevR+2eBJl7OdoBZO5qCwvkaB4OftNYEhwGSouQ8jH
         RX8NOyXrrZdHvNxoI0wrTB/K333qNH1UmCPNKG4/uieogkoBTg/nlznjJA5nfSP4/YXB
         k4mA==
X-Forwarded-Encrypted: i=1; AJvYcCVQgtKRRC1nBSv3M3VRthZhUDebPu/qLXX+8paLsBVEruVjzldDs1yRxqDqJMkhtBnu+ci60eEKoB3ocr70eZ8W@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8rF9Wt1XeDHOIG+twB1v2ag7N4f7TvXRBzn4HJbqS/lwoF5sl
	+HZGfnbC+gdtxcJpW1calHhT4MRgSTunjCseewgTApjeV8ofKnjnEv/KM7AVS+CTi/2SuBD/Q5Z
	WBaPA6h9eQ/7VNujvuvfDLnme0MxPz6Ez/5nxxw==
X-Gm-Gg: ASbGnctwL7bX5ZTAfUZiLGuo65CZUKDUm0AZ+4DeIrt1XnwCcyOMUoxxEOAumFMVuaL
	dDuslyWxBbcHxt2XI0z+Er1uTEz06TL7NEmT0
X-Google-Smtp-Source: AGHT+IELbJvk0NPV36M+fcncTTHMyREVObNbnHGvfeRgsIrYaGiOwpPdOwf890kyMOnEyS8+yJEfq/uf9mQc3jRotz8=
X-Received: by 2002:a05:6902:2b0c:b0:e38:b889:7eff with SMTP id
 3f1490d57ef6-e3a0b071e93mr15453171276.6.1733847013083; Tue, 10 Dec 2024
 08:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
In-Reply-To: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Dec 2024 17:09:37 +0100
Message-ID: <CAPDyKFon9-3U5Vn2i+WtarSAYQHnA_ho8CGQmiVoboq1tnt4fw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] dt-bindings: mmc: document mmc-slot and convert
 amlogic,meson-mx-sdio.txt to dtschema
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Ripard <mripard@kernel.org>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_081014_829105_35C87895 
X-CRM114-Status: GOOD (  14.77  )
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

On Thu, 28 Nov 2024 at 16:16, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Document mmc-slot because used by amlogic,meson-mx-sdio.txt and
> cavium-mmc.txt, so make it common.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v4:
> - Fixed address-cells description of mmc controller
> - Cleanup '|' when not needed
> - Added review tags
> - Link to v3: https://lore.kernel.org/r/20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-0-ad4eb22c2a8d@linaro.org
>
> Changes in v3:
> - Revert and insteads move common properties between slot and controller into mmc-controller-common.yaml
> - Fix other comments on patch 2 & 3
> - Link to v2: https://lore.kernel.org/r/20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org
>
> Changes in v2:
> - Fixed description, limited to 3 slots
> - Moved out mmc-slot in a separate common schema
> - Link to v1: https://lore.kernel.org/r/20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v1-1-b7bfae886211@linaro.org
>
> ---
> Neil Armstrong (5):
>       dt-bindings: mmc: controller: clarify the address-cells description
>       dt-bindings: mmc: controller: move properties common with slot out to mmc-controller-common
>       dt-bindings: mmc: controller: remove '|' when not needed
>       dt-bindings: mmc: document mmc-slot
>       dt-bindings: mmc: convert amlogic,meson-mx-sdio.txt to dtschema
>
>  .../bindings/mmc/amlogic,meson-mx-sdio.txt         |  54 ----
>  .../bindings/mmc/amlogic,meson-mx-sdio.yaml        |  94 ++++++
>  .../bindings/mmc/mmc-controller-common.yaml        | 357 +++++++++++++++++++++
>  .../devicetree/bindings/mmc/mmc-controller.yaml    | 346 +-------------------
>  .../devicetree/bindings/mmc/mmc-slot.yaml          |  49 +++
>  5 files changed, 504 insertions(+), 396 deletions(-)
> ---
> base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
> change-id: 20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-6fa70546ebb8
>
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
>


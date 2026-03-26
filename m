Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6491F10A3D8C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NdPYgPAlCNYmYAY44z3R1vgWi5y6H5hfActLsqe8b8=; b=SQfMP+4v0yRCnQg3HuyPTTw9Mc
	wUyXOhiQXudy6szAWg8NXuXx0LxBz8ikqOap8H45MNX4cleAm509ETPC7ZeMhwzYg8qgg8M2APTwq
	3Obi73p/zZyROgrZZe3uFLaVUg16b7vwtG7Ptx3HyHbU4DT0Kopyqr217XCE73BtaTwcx/luB9aCP
	d+bnNiGNAO7ngsKUYRrGFkAwVrJ8zs7LvsbTKOhLj4AN+2O1y/faQ7SPV+C3hCatCsKeYdh0X0Pd0
	vKMlsX49TBbjjxuu3Q8eQHpxASKueSrppzTH5wUsVTFzHOtJBUzIh8QCafe8wNOHITykpGXr2Rt2f
	VGTvOgXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5juF-00000005RyR-0rj6;
	Thu, 26 Mar 2026 12:33:47 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5juC-00000005RwE-44Af
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 12:33:46 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5a2a5236811so307663e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 05:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774528422; cv=none;
        d=google.com; s=arc-20240605;
        b=H5lptOoMwmXd80YqELRSVFlL10RXzW3AiEdEhkdbUPj+AU96J/t8vlYe/5T48HBdUb
         Ixomtb87x7fCFi7NLmsl3zsooVjTv6Wyv9514WPFlSS+WUU90T+SF+QXi85XAAINexqF
         aHxjy7wd3+Y7dY0Rq9SvlWdJ5b3+Hiu82/kBDljKjfQz6Dfv3zxbXOQm5KEVFB2RhmOT
         qV2XeGRIy6PrWJPA/n4ynuHZF0zKWMyeoLobK6c8R61m2SeE9F22qeXaAodsZi3uL/sP
         RhF7ZL2OhAKpgewCUl5jPNQuUvQok5Z3If/KSMpUdxPudgFtoKkYvNRH4X+WLJxVkYlc
         R8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4NdPYgPAlCNYmYAY44z3R1vgWi5y6H5hfActLsqe8b8=;
        fh=tjjxMlTuAyDh6KawHHQygbqQsnxvmc56wbGtRZxzL/Q=;
        b=NNIiSsGzDvZYQa2qKdShkEUvbYvE7z6cEQNH25QS0DquPRm6o3MQ6hox8lun0OB47P
         +zMjSdVxHw/WR9MHNiz4OROu9JtW/XDyvNDmZ3UxIO9NmkhlHVX+tkl6HiI1Y9Vwab8h
         kJrYuYUqm537lvLv+H1U9w+wZU+NXjiGfz35Yg5woxwyuYoB9MGzsPYLi3WeinEnHaRt
         SpuOORCI1SPMiQk+q6mwj56X3ajpzIWY0zexknq0xlsaWrFujSNlIMtNG6q46bSyHh9A
         /oeZ+mWCvSqeKpVia5qIsTb8IpPSYr9DxB7wRMwQOHv6cC25IDC4cxN2fc1hV1ZFXsCO
         rixQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774528422; x=1775133222; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4NdPYgPAlCNYmYAY44z3R1vgWi5y6H5hfActLsqe8b8=;
        b=NV508e4/Xa/OTx3fLux1n37uqAV3u93062W6C78Fn+b+HPK1X0WxJeHumnVg4HIyBg
         T8SdaqPGsGBL5+VxF4RcZR3xkwoo8mE1EeXC6CiiomwzO/Jvn27LpFj5mtLqOAXtuXOe
         kwvRp1gZ3jedMHZmZPesUUT3W0u81puNDWmpJUrRlZwwYjjB+gefPPydgWWSllQ5otfY
         YRs0zaoR7xhsaXDHc5ge5OCMtOSF4SSzK15J3+hdVTy8aH2AdbWbxTr8zByLo3wMQNM9
         KipV0TNOYRVov0BM2Ui9wc1UmpsVoUBdDjyu0ljXPfa5f1GU8/XF+uzuXe6AlSsVx9Kn
         fhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774528422; x=1775133222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NdPYgPAlCNYmYAY44z3R1vgWi5y6H5hfActLsqe8b8=;
        b=CgMJFSwjJOMUtuNIJkL7M6iMKSXsPnde8dLyXmLHvL044mr6irFhl0Ue7zvjbxyeyr
         n6xOxJMgiLAG+c5/REeKZEVOtN7iRdg9fPMtbLc9g9lkIryLs53O6xMe70FZi6RydbbF
         X5P6iOBNmnQWD3IRgNGyI0lZ4peFBoux1iE/rIP8ujbfyNiN/OZgzvRbDn9FvUoa7C1q
         yAEhCoKenwyU4PbUnAd6KGbw3Wbfkxr4dr4L6unFtMz8GJ/BfrsG+ymdMxv9ahCzqzxT
         SAnOyEpGTJPQ1wW/UpZTGro5CH57PtcZfVOlmMsFYAxrZd41WvbTGbNer7SWJtNloUD8
         mWKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcON6ooXCUPOuHLiK3VqYjGxD+Tp+hVGaroluaeqhFaoqLipXbnzIJbLkVXB4zSwrO+hnvUJmOu1DDbsdifWCh@lists.infradead.org
X-Gm-Message-State: AOJu0YyC32OZ8bKrHeF2kUTfsIEBUyJjTgImWpdslUeIAd1rMl+6sXaO
	oWsXOCsfKKqTYqfsFrsIJARij5EIYN9DQGaLiKgTCg9NrDyyP4lljWbSUMCh5k5HV9VwDu5t+yM
	OgQ/O8CUvE0+tm5eu8zkKXHariPcpfiwj144zwJH+QQ==
X-Gm-Gg: ATEYQzyNSkoWQEEcer8YvV5X2/zVPRqaJwHODzfbDxpudhmXFg1grQ0VpNT6jG7f/F+
	+HCB78HOMTQdZsIVnM+FfOXst8Fe1YCLax83GM1uyX4QIVWa/dlOCHWI6pMdYOiXthc+ZafkIoT
	X3DvHnkrh06F/hUO9weuvBLtI27GO2oHVnlFqztCk/9I1Y9b7yyhRoY3ad1hJck3F+0TXkLumvN
	wP0XxRSEjKIuGSvcuLZS8hKOgX5fJkKFdgr5zXiunMA1gvC7gpppRSjWyWf8r+vTzvqC6vZe0db
	dpA9c94=
X-Received: by 2002:a05:6512:48a:b0:5a2:9cb6:ef4e with SMTP id
 2adb3069b0e04-5a29cb6ef5emr1889782e87.21.1774528421913; Thu, 26 Mar 2026
 05:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr> <20260326-add-emmc-t7-vim4-v5-2-d3f182b48e9d@aliel.fr>
In-Reply-To: <20260326-add-emmc-t7-vim4-v5-2-d3f182b48e9d@aliel.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Mar 2026 13:33:04 +0100
X-Gm-Features: AQROBzB17m2aMMak7aWoPUlujOd0n_VyTP6ICjVn8RwU1l2ZGeIzCfBikAgvSj8
Message-ID: <CAPDyKFpacFOs_T-Q5ETAEd+bjqtx3J2mZBioztCSM8Li0KgR1w@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] dt-bindings: mmc: amlogic: Add compatible for T7 mmc
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_053345_035343_BF2EA898 
X-CRM114-Status: GOOD (  14.16  )
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

On Thu, 26 Mar 2026 at 11:01, Ronald Claveau <linux-kernel-dev@aliel.fr> wrote:
>
> Add amlogic,t7-mmc compatible string, falling back to amlogic,meson-axg-mmc
> as the T7 MMC controller is compatible with the AXG implementation.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> index 57646575a13f8..976f36de2091c 100644
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> @@ -19,6 +19,10 @@ allOf:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - amlogic,t7-mmc
> +          - const: amlogic,meson-axg-mmc
>        - const: amlogic,meson-axg-mmc
>        - items:
>            - const: amlogic,meson-gx-mmc
>
> --
> 2.49.0
>


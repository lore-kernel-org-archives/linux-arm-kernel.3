Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CDBC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 13:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6b7sWVXjkhrJaD2m6/tPkXhOgFWBsjjzpPJnK8wguo=; b=Y66jkHrFucEigjE70tP8nV4mxy
	Z4/lyaMujNhDDu4wMYKf7Z1Hpl8WWawLPl1UgdrSNlWSm6qaWbmisgyfDZyhNeR4FzqR3w0/ZG0UJ
	HDoQJTMiQEfDxZT6KN/FVwQdBqjYQnYSCqLQi45TkQidBtD3G13EqZ8Nh6Z25AIqxX0jjlTa46jL3
	zzT5y88R1YZnVZ6X/Ae3gbTq5jkuaxFNuJfibhUo2otsTcjf6f6AhdPJCO/AU57CeFDLSEskIFZtR
	iGLvWo/oZfcIuBeKV/yLDv1r2B/zcYKaOPkWeaV61F48fDbqcJPS4LCNypsNyHC/5MDRRagnSfEMt
	6AOphljw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txmyM-0000000B1kO-3Ya2;
	Thu, 27 Mar 2025 13:08:38 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txmqB-0000000B06J-2sVN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 13:00:12 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so1758206a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 06:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743080410; x=1743685210; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U6b7sWVXjkhrJaD2m6/tPkXhOgFWBsjjzpPJnK8wguo=;
        b=ahfzDQ2UOOAGtVj9W25+x8451avTJzzS2+bwg1VwiYNcCWXrgUvWLKZpOjcDiJT45s
         YVpBHIIxAk9xkPauTxANG/4o0VGlPGlfliRwfey7QtPe+3pNiNy9Pymn2UkdIrSgJeTZ
         +MPy/2HXS/ACvdqqM89K+AiGNc2zgOYRoYdLjtyWi01Si9hxj52A8zwe+wV7wNERaLzL
         NTm9+5gTeXZS5CfWvJGans66XCamWDNCFEbbbFCV8QMvnj7KKXKdOTki02DauCS/6IIY
         CL3OItUM7qw5BUNdqNNswf2NNLn54a4TaiC9Su9BZ45fdT3wYXsiXRvgcUJB6pbyC+bK
         n+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743080410; x=1743685210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6b7sWVXjkhrJaD2m6/tPkXhOgFWBsjjzpPJnK8wguo=;
        b=l2t3MjCeYJJF0bI1olwWQCfXWJ+7mHsNF6cdQYjxEzIIbus3IrHgYcTikmkrpCdXoh
         Rwk4DW8V41bnyGIfhQYORoTy7HlBeV/Er6+rmsh1g9ZqHFCCOMFTHcnRXeeNe1LEqQdq
         myX82nw8sITUGQgEPohMxeWmdwRSpei677IMQQpnoB5vKfU13zvgAukRlgF8Ny1cQrD7
         hMEdWmByEkuyfeiUhyy5QByohdKFmznp7oo0zTc/TqeGaO1B2prruXREjZMj2TNhdp3U
         NtxEsyudZj50SSHTQGOPRbxFgwrF5jaVuKOP2cPYStPGS0dwzpAaIENUfMN+/CXeH945
         zwCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8EZg1z2/Hy6qU+GFuVcm75hQtq5ZjGhFK+d2q8AwJ40VIy8hoc2/GeYoZJidmzbiq6LzPvS7xTn/JsK+EUxEG@lists.infradead.org
X-Gm-Message-State: AOJu0YydpUCLPjnAe6ahGLVwDkM3Y78XXh/nsl9lyiGPalsKYMV6dZyL
	3kaO2Hu1Gz6egPWO9kUG7CdGbaOnW0FPd5DHPXVIEsVLG0tz1PddQuaCvJlhxVFW+/FUvjCo5ZS
	p6iH+afYIHOGstTsgA1WGzXsKbkrEEIq5X0w=
X-Gm-Gg: ASbGncv/hWV+h6IO8rlQ23ryqnkE56OyftwE0PJJrF+f6I5w3EDT42AfQ2LpS1t3vB9
	UfoLCnJqklpG5GZ0moqlKi2fxD77gTWbOXQkp/jWCaMyWSPxltfOeDeHXqWKaTVtq4hGLbuE4a+
	dg5rN+oJ88plt3T1n2jpNt+RY=
X-Google-Smtp-Source: AGHT+IHOx1vxujfIGQkM2NnfBK5kG0HOb/N8CJ8A+AmXs1oiNNEb5E+p3ftVq1R9qljzIuPzJrCtsq9rtR73AjSqNrU=
X-Received: by 2002:a17:90b:3c0b:b0:2ff:5ed8:83d1 with SMTP id
 98e67ed59e1d1-303a8164697mr4599906a91.19.1743080410136; Thu, 27 Mar 2025
 06:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250327120857.539155-1-martyn.welch@collabora.com>
In-Reply-To: <20250327120857.539155-1-martyn.welch@collabora.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 27 Mar 2025 15:01:37 +0200
X-Gm-Features: AQ5f1Jrb0eLYTMXk2wVS9fPQ0Qq3m1Z8Jo5KryHhA8RkTAv3fjuFXtjyUWNuMVA
Message-ID: <CAEnQRZD15J9GOHFL6MfaLtSkgaN6ksT_YL7GvG2U_St8q2+KgA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp: Add device tree for Nitrogen8M Plus
 ENC Carrier Board
To: Martyn Welch <martyn.welch@collabora.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	kernel@collabora.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_060011_729988_5D00DFA2 
X-CRM114-Status: UNSURE (   9.90  )
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

> +       mdio {
> +               compatible = "snps,dwmac-mdio";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               ethphy0: ethernet-phy@4 {
> +                       compatible = "ethernet-phy-ieee802.3-c22";
> +                       reg = <4>;
> +                       eee-broken-1000t;
> +#if 0
> +                       interrupts-extended = <&gpio3 2 IRQ_TYPE_LEVEL_LOW>;
> +                       reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>;
> +#endif

You should not have dead code in the final submission. If it is not
used just remove it.


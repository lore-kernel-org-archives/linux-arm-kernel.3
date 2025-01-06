Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4A7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 21:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSksfoV0Ccs0LphJlugUorrUGEPy9Zvkm+EQdSpvqv4=; b=J5o+Q/6rhnfmB8v5O7OxRtrHdH
	Aakoy4BqXfCMI1DeFyjGrxy4JWiDb0EkUyOd7lPvzrXSyyMj9YNdPYoCmFb34DVioJaf5qMd3eh+P
	fTCkOARqp0J5chZQg+KEPbtsQJofliZ14u/6ORdnayf2JFfIZB/BvaOL09YmXUgtPSBm89tLV37Si
	HbszYClq3z/b5bWkaHTbAYEqa73OpoRJlueXQxrVEtdUeMXzjY236S75ccqzlU8aHAt3nVtQzRk+L
	UheZIC+E3L/WXRRe4Sa5ULkQnJyzuDyQ/oRpVspsEyrnOSRDeKjZia0RrwfvVnWMd8N1296XHBe6A
	rVOH+sag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUuH3-00000002gRP-433o;
	Mon, 06 Jan 2025 21:04:33 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUuEs-00000002g1R-2zoj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 21:02:20 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5401c52000fso14838369e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 13:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736197334; x=1736802134; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSksfoV0Ccs0LphJlugUorrUGEPy9Zvkm+EQdSpvqv4=;
        b=gKD1Lzr9jyjQn6oaohzOc6n7kG8ZkXW74OmGXHdFgPjDD85hh0vM4cRpju7weey9hs
         PPmjvLBxrHmXg3NH3iYIkWs0SDLPyJRXp1mJW0++oJeHQRfeMD/uas/G7AhpfdIDxB40
         gmQIJCzpUKfSVFtwF+4jzwy3onCWAutjB9hbX2SW4uWWiNFjeICmOqQT4zpvxbK6DrJD
         WKJaWirYfIP0lxpQb6mbLv1aAxxxbWXJPQ1J6C6zx2fagF/cbxxkMkC3SP93+s5yINST
         SItaot/L3T5UA5zkt9b5oBOP8YfV9cnCp4KlmchWOET4EI9ezrMJkGdnEn0t59jHkWGc
         CRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736197334; x=1736802134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSksfoV0Ccs0LphJlugUorrUGEPy9Zvkm+EQdSpvqv4=;
        b=anz+fMsJsf+7hhLn5KgG1CcpULK2qWFYR/+M1Dy35YiorvpIfzIkVf/emern3qLByM
         7nvMh+ojbQZ2Bt1wKD9B1+qTK4NIRqsZ/qcJQVyYAumCb6nBEhW6r7xhcWHEI6cyGu+1
         1mBOmuOu6jgN8DUiMqFWGh9O8c9QMUKjb4/TznXm/UlRk2/0yMJXQuXnuKlp0ocAP8WP
         IQwg2wEQnQkiMbrUiAM2uE9aky9qAL6W7dVOf6lRPn31ZQP0PYtFwzlYxvueb3UG760G
         YX/woSvGBKezUR1LShEjtZ8O7O1ogr9bxNFeZouzMcH1vG1XpdXngUiJ+eE1+kb7UUe3
         6vuw==
X-Forwarded-Encrypted: i=1; AJvYcCVgumphNsiUs26Kv43I/JthNiM1PzfrlR2pWIpJeYBfyM0Sx+JmTrhHc876vlExc90CGdiXnMhLFcZADgnm5Fyl@lists.infradead.org
X-Gm-Message-State: AOJu0YwY+UQjQZWqxuZS9ZY68Xe3pleY5Ak8dcBJ+EB9P0CM+jrO7QS2
	JrFuM36Leph/DGCyIIkqkprCPCS5bsBLLakADExtTyi93olE/4WdwAwchcbkoS10XTAQSqmiusd
	JO5gnm2e5wo0gBN0Lt2OeR8S37Sk=
X-Gm-Gg: ASbGncsAeEUKbQSxG3eGnlZNeWsFpdVyFak5szwgYvhdCp/kKYIUns/+g8MGgZVXmx4
	vy1Atq4rRpGKAGPkc+DGFo5vkTKyAP1bBK3Du426kBigcUJnHEZASjv2+pitIUcGc5UADOw==
X-Google-Smtp-Source: AGHT+IH5sSW1uM19drmFof3pNxa3vYfTwiNNLlLGEBw4FDaRtnaIDgnVsupO45AUaUAgf9tyT3GSnfpvL9Ng/Z/humg=
X-Received: by 2002:a05:6512:110d:b0:540:2a92:7da9 with SMTP id
 2adb3069b0e04-54229539f3dmr11610884e87.21.1736197334159; Mon, 06 Jan 2025
 13:02:14 -0800 (PST)
MIME-Version: 1.0
References: <20250106205635.2177321-1-Mr.Bossman075@gmail.com>
In-Reply-To: <20250106205635.2177321-1-Mr.Bossman075@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 6 Jan 2025 18:02:03 -0300
X-Gm-Features: AbW1kvYXgq6GgQzzyf3D1NZI4udm-1B7Nz4fQpoAIJcXJtm_KNj5TR_fMH-dl_c
Message-ID: <CAOMZO5DDDFAWoTsujKuUsvRews4dez=rc6a3+Hnaq5iyoL6T6Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] ARM: dts: imxrt1050: Fix clocks for mmc
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linus.walleij@linaro.org, arnd@arndb.de, 
	--cc=imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_130218_760367_748D0B20 
X-CRM114-Status: UNSURE (   8.52  )
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

On Mon, Jan 6, 2025 at 5:56=E2=80=AFPM Jesse Taube <mr.bossman075@gmail.com=
> wrote:
>
> One of the usdhc1 controller's clocks should be IMXRT1050_CLK_AHB_PODF no=
t
> IMXRT1050_CLK_OSC.
>
> Fixes: 1c4f01be3490 ("ARM: dts: imx: Add i.MXRT1050-EVK support")
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>


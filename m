Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1096C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 14:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQiQxuwGR8sipxLnE2QpNqD0m337joQm8Mgec26elhM=; b=jIWRd6VSUEZw/2CtJ8MPiHFevR
	fBuv13syD6Wh0hmB95/apbPcmrkhfvRL3wtCFzdFnoIFbREuiXBg/e6ZWdu3C5X6R8pl/ilmmNenN
	zlJV9gvTF19cxlhC1XMjLdX7OAbxpZv5e05ySZdolRBr/CVgm05H4gllZF+cx7rqK5AN4VibAfk9g
	9NPQ4HnGE74VGBRxCvqL/CB/1euX0Jecx6iwAvpRhJHeuF4DyyRg9siTMN3MlUCvg6h1CeJZafvto
	vW0dd5OahHm/d5gAjpsAk5CWTo87V5avD4z41ULs12zcPm7KZpfadXt0avFGGpvhBgatc1ie0KxGC
	Tks0kn1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLUn-00000005QH6-1ch7;
	Mon, 13 Jan 2025 14:32:49 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLSf-00000005Pds-1xLr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 14:30:38 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-304d760f0dfso34779871fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 06:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736778635; x=1737383435; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQiQxuwGR8sipxLnE2QpNqD0m337joQm8Mgec26elhM=;
        b=EFWLXxGOQ2rkn5VkF2UdQNUM1qmXOrt0ZRjKoHZhWeqAbzlVAh/s3SDiaV8nRbWlZC
         v6f0p+okUdgWED/LZpNcyRth6QWRviH69zfkgEK9p28dsGk6cNIS+xud6ioZL6F5fG1g
         fBf6ytYVgBWrqC6MWfNRUg8IaQBJYWnOE2GEJpTRATBXSW2hdeaBN0FXmV0WzJ7BZx1P
         hRmz0R96m+YXio+U0NWQG9cXKCl7LJyZoVu0w91YCByIinslOSeHuECp2CVRtyHUgIvX
         Ifse0HUYwEfb5D2GybNlg/ai8IZpa31zkZgOslzPSeQLxUJawJLKa7pMZ9m983lpT/kr
         iprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736778635; x=1737383435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQiQxuwGR8sipxLnE2QpNqD0m337joQm8Mgec26elhM=;
        b=wt8vy5ndJqxBDMvBnPmNfXFcuvkkjSNGHNwGXBefx4aQHV5bf9EPYViBhyPn8MJf1R
         hT/csT2hA8yVE3N4E+GT+WBvZxWXj3FIJgLbRrlZOVdZPaqvFbEaiJeGOpKApT04rBgJ
         489Yah0VeYY5AlPVwz4HyJwLGIUjQ8chNFk3TzuiNiJSlo24tvXWaxYP8e0hqLjaEEiD
         J/Mh1ZMUtF91vtjZGu2HGdCPyHh+eTmCvFY80CGDmMaq9AoElwM6Vkb5NEAPDJWYyw1p
         L+m5+7UFxE2bI4y11J0koF/mgKQl6PXzwX5mhfIBqjQnqBfuAGhiowKsDlHDMh7seUX3
         WqxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcH9WUk5ISyrzGOiLcbRNAMGpegQ3kc1tVUqCPxwhwiY4+6DaetJOB/ii5lvFYONWyRxYjWMHQ7WMmuCdzKzOX@lists.infradead.org
X-Gm-Message-State: AOJu0YxGxRzIn0tU1LR95ImM8MeTIzLmzLiNoitNPxwaPUgmgAeV6Ttn
	ypf76rfeZOKE5Ai+vzGTiDk+JWE9xcZcmLfSMjKeTJx4rHLg/0e/vijOfBGBzyju7cyAAioOWjp
	/ZjqRmUYH9dqi6kqK1t9y2h9nk5jzpTpIiApqIQ==
X-Gm-Gg: ASbGncvKPun2fV8IVTBw6yB9Vip9XjBa7/savi25duUXjqzidlWMUbB90BjhyTsDnQk
	U0JY/RgizEyUpnf/TfYA4Z/fdadwzRSkBW/Nw
X-Google-Smtp-Source: AGHT+IGhfOPi0kkaR3fzIiz3zYVKzNITf7WqJXfvCEhBW44RAY34fqtT6fXLyl378DmtnGYFFnV3yeRTPKvHK9wdrxk=
X-Received: by 2002:a05:651c:221f:b0:302:1c90:58e8 with SMTP id
 38308e7fff4ca-3060ce3d06emr30538601fa.33.1736778635404; Mon, 13 Jan 2025
 06:30:35 -0800 (PST)
MIME-Version: 1.0
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com> <20241227-a133-display-support-v1-10-13b52f71fb14@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-10-13b52f71fb14@linumiz.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Jan 2025 15:30:24 +0100
X-Gm-Features: AbW1kvZgkONvTczIqxIzrr227mixg_kY6H8hXCa96ZE9JLa4yEIXQA2LwUItM1s
Message-ID: <CACRpkdY29s6Cz3zvtksLO8sESwxhkVdmGUipVAqiEtix3E1=Vw@mail.gmail.com>
Subject: Re: [PATCH 10/22] pinctrl: sunxi: add missed lvds pins for a100/a133
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_063037_517593_ED93101E 
X-CRM114-Status: UNSURE (   9.30  )
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

On Fri, Dec 27, 2024 at 12:09=E2=80=AFPM Parthiban Nallathambi
<parthiban@linumiz.com> wrote:

> lvds, lcd, dsi all shares the same GPIO D bank and lvds0
> data 3 lines and lvds1 pins are missed, add them.
>
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>

Nobody seems to have any objections about this patch and it seems
technically correct so I just applied it to the pin control tree.

Yours,
Linus Walleij


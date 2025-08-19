Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E0FCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 15:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73NLA3Q5TxwI++kTf2HzDKfU8xX1fFXua00XcnHgTMw=; b=z23Ww153sKIGyJROK4uHC1iMdX
	6LE51LSeFcGgbT1TDjmQJUIwg5W9hOYkj8CmdVTrp9HqvI9BTWxty0tlYwhrbHFMSnsMFvyBiNXG6
	00UppKT+zfdYCjmXGXXNFbxLdIW92y3RZtqe+rU4otOcDN+AZY7BzRwSPpu8X+mHMBq4Jz3iukcNh
	JX0hYmLlERlpI8T9KJS/7nSvKAVPd5JgRf/8KcdxZmvyiU1iR5JbptbaDi4DjUyud/ntLiHrDpy94
	GQ48jJ+GuF7atBS1mZBpDT+QUijAongLe2orihjbN65K19ofLkF2bONi8m3VYVnS5cVWHy6CgHkg1
	bWWebtBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoO9z-0000000Asez-3eXn;
	Tue, 19 Aug 2025 15:22:03 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLSA-0000000AQwa-28gI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 12:28:39 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55ce5097493so5058912e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 05:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755606516; x=1756211316; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73NLA3Q5TxwI++kTf2HzDKfU8xX1fFXua00XcnHgTMw=;
        b=B6PXX+S9LqNn9wFoCcUBoO5Ths8JeIzzOjspEGdZsYXYLeKUOOgUJFncvnskTrvsm/
         4YLKsYQccTPR9HOB9gwpezGf/kd80ft7wa0p8r/UH1OEj94923WkSxhF0vjJcEY7WjLJ
         e3vHvlbifvtQN6sIuP4GkbyVP+vLM+rkxDnhEVFGMp0WlOHTSoNkmc+K2BvT0tvlNH8y
         bW4bcQxgCuTZjcQkRh9JbOBp3bY/JJsysC3R+PAplO9F4pnV9wW2FNr2hQsa3U1h5Cf1
         hwMF95BR+gy96UyXyB3Mj3W4MvQ32uDAHJTULAncW7M5rUb5zHmG7MDYbTp5sG+ab1Ab
         yiiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755606516; x=1756211316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73NLA3Q5TxwI++kTf2HzDKfU8xX1fFXua00XcnHgTMw=;
        b=sUopqZXci03I8GekXThdGgxFvGmcQib31xcLPccoE/nFdK0/qErafs/5WIPhOC/Aa/
         GUo/WREKHfUimEQsLzuEW1gMv8D4SbdTHdUX5O02+/eLrenddSsVVwupSJQe2ESJT3/2
         kWQQ6Epyt1coE2FY37DEQNAt+GCbJujuFVUWJ0gIUiJYgki34n8FiN3lif2KeZdM3liL
         FQ52vQ2yl6N6fX/g2kxGJxAMrokFHj45IvtQHZfsk6UrBmi5f+QCl4ZVnidUX7+5oORe
         czeZImzoK1a7IZwmsEifvTL2rr0QVEbv2PJpzz/ypYJefFjdK4tQH6AW4eF5VAP/eP50
         oHSg==
X-Forwarded-Encrypted: i=1; AJvYcCX/kC5wMPW33y7RgADtEoC9PG+7G2zdNZmourS1Gpd4zv9HP3ppZ5Vv1HmmOAohcYxZe1lb1Eh2hEhPDNhYD3J6@lists.infradead.org
X-Gm-Message-State: AOJu0YyDRDvkdxH+ts5FAuRiiHCxO1RZUwOn4wehBXW364TM1p9Hgkcd
	O8k+gvKeXAgOR2WU/lbEuA2TYOM+Oo8CJa9i9hBnrHdMQrKX+4d454rua8X0gM7aBvjGAJ/laWF
	RtWy6Of3IAVXrd86G7oB4mGjWDfeg8Zw=
X-Gm-Gg: ASbGncsv1rXUjHubFo574SBgLlK4aYkMbVVW8DpEyPTzgKNNAeQKFbs1EWVXsEdEiaU
	pFJFUNzUuGslcU8/JpvLiKQq8WrGEs0FbkNXgsIxWlgWWP6mPzsfaoi2vLIgvLYbkt1d0FDjums
	Fi/0/oKBL5KiYMdvyvLl02U6XVYWn9k9xh4JhIfw3o4pShACRx9KlTiYYODKyMI2z0QHiE685oe
	qSQBGGVzj8bQC7aGBaeZdtvqFylfWBxQ9saiwo=
X-Google-Smtp-Source: AGHT+IF3FdZF8lxL8RpNSUh6zxATY4SIt92cNJtcaia124EXxHOqkJg6/HCXrud0DRgssmpwJMmfWsjfkko12V6DytQ=
X-Received: by 2002:a05:6512:1349:b0:55b:8e2e:8cc7 with SMTP id
 2adb3069b0e04-55e008538e5mr661274e87.42.1755606516081; Tue, 19 Aug 2025
 05:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com> <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
In-Reply-To: <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 19 Aug 2025 09:28:24 -0300
X-Gm-Features: Ac12FXxqW79wXsLJzEF9Uadzf5uAoXqplbY5O5fWW6-5y6AnA9c00um3MEHlLP8
Message-ID: <CAOMZO5D6m3V2ZpFOtabrkvf6+SGE+3-xpAE=PZo+Ak=49ozyLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: backlight: Add max25014 bindings
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_052838_545727_3E06F6BB 
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

On Tue, Aug 19, 2025 at 7:59=E2=80=AFAM Maud Spierings via B4 Relay
<devnull+maudspierings.gocontroll.com@kernel.org> wrote:
>
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.

Typo: integrated


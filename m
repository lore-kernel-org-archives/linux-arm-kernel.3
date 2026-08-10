Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30C3C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 20:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnc0EdyeiEsqgD6ZmbcZDCKYRtZBL5CUiTZPP2YKLs8=; b=oZeRTB1IwdulRH0eyP9+3U9zJO
	VbiWHng7fyQD5PXbRpy09TT3vJGZlsU5C4lIGTQgFUZxEPRjxfHgUojzFs1b4lJ6aL5HmY5W/eAhT
	/DuVz42qirelEkpkBZ93TnR0Xwmro2G2+ueWqtbBnFXq447p4/wS/CDuol6GEDa7Xjd3WQTfvz+3S
	uvcutWRfUDfPDfN0HsxO5fQKZIZ6Ng1djaDRGHa/NU0nsHqP+XUqas3vkLe/ZF6kCmerbNMncLy49
	o2eOHGArD47mi8RWQ83xPFxTUXI3uQ4WOKJ2IHOXUiyRUqUQ4tm8vlmbgOXdGheETKX7pHibhsEEA
	4CVheukQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWIJ-0000000CnvP-0QVy;
	Mon, 10 Aug 2026 20:08:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWIH-0000000Cnue-3TgA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 20:08:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DDA0543705
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 20:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C521F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 20:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786392497;
	bh=gnc0EdyeiEsqgD6ZmbcZDCKYRtZBL5CUiTZPP2YKLs8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OxbBDOX8FR1yMtYc2FacGlyQTM3NSC7+jsLExWaIbFSyfE1EA+wYk0Cw+4PQlGDYd
	 ZKsW1uSmZ8I5ziy1HHflUgz4kXVOZcSiOp/tL2oGd+eVf4WormnmLanbHUot9N6t23
	 ps9W/JJkPq9H455D0V+c5bppDGzrpSznrZC3aS8C2ew7fs5zwky9OiWjX5k34H+cR0
	 MYIEVgtSDlH6IOosraoRZq3IWMQjBj1WhmSM8Ih90RaFhtab11G4jvpsM6xhJ3cB1D
	 oWBgkjYkJ/D6X/e4Zap4RC9CwjbJS78wCtMRlFO73MzJ0C+avmtQjkr0OqgBtODaNG
	 01Oat0bB4dxUQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b0148201fbso1623805e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 13:08:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrvC05pGhWkglSBZwRcpbFgtGhJ/YcUYJHFaOckEiGrZ7MhXW4Z0OcmRR2KOVq94XdL6fAITke5ksKbH6sA57pb@lists.infradead.org
X-Gm-Message-State: AOJu0YwZeI85tEyk1Pn5wBLz4k7JFEUvg6T5dnk0lRwFPrRdgnRFldoY
	gZfhm/cxD4JwXnS0T7ANQFXYHUk0rHjDHFNCMp4xtOWt/7LLLmqs9MVW1kIeW7IeiHUyDPg2I7Q
	gxlUQxdfqQFFtUUPoe3N6MPhFvjOoOXA=
X-Received: by 2002:a05:6512:10cf:b0:5ad:5cec:74d4 with SMTP id
 2adb3069b0e04-5b30b77a1d4mr2649686e87.41.1786392496581; Mon, 10 Aug 2026
 13:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260729132736.3807082-1-sjg@chromium.org> <20260729072727.v3.3.3a4f9d47d4dba36e14141f8796afe8907028aa9c@changeid>
In-Reply-To: <20260729072727.v3.3.3a4f9d47d4dba36e14141f8796afe8907028aa9c@changeid>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 10 Aug 2026 22:08:04 +0200
X-Gmail-Original-Message-ID: <CAD++jLkfKKeht4VupGiGaHRnJEZJEvoozD=6ZBjHe+oqLSP+yg@mail.gmail.com>
X-Gm-Features: AUfX_mw9WSjT9UvG0UlhqGTC--GuRIOMT32n9ySgxc10IaFc7YOGymcNv3-QqPE
Message-ID: <CAD++jLkfKKeht4VupGiGaHRnJEZJEvoozD=6ZBjHe+oqLSP+yg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: pinctrl: rockchip: Add RV1106 compatible
To: Simon Glass <sjg@chromium.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	linux-rockchip@lists.infradead.org, Jeffy Chen <jeffy.chen@rock-chips.com>, 
	huang lin <hl@rock-chips.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jul 29, 2026 at 3:30=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:

> Add the compatible for the pin controller of the Rockchip RV1106 and
> its RV1103 package variant.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij


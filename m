Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BEED591A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luJMq8TMt6cFTuAKZlZ6Gilvnr9koKbdl4S7YCH45+M=; b=B4JotD2UiNlcaQMw07cH3lwjVg
	csfwgobR/eXp64in3PLJxTUvEszw+kLmIFJQ+YqbAS9hu68ri7hL6t4lJjbqB5FljJo5EcF1lrQ6T
	NUovOsDxPWJ+7KRn+R65KltzQfYQnQeyRImmvWK95gcP7xp9R6tFfYnSFfBU2so6V1V13AnrT7ZYW
	S5lON6za5HGZiyqKbmn08NNy9D7G6MXE5V3D3qh73mxy9ilOVlTbvS+TkE5q3qdI55s5NdsRNmUYF
	Vsnet0DmsI46675r1mzIrW/xyz35lg/Iesqdx6gl4RVdqiJ9ZZUR1WszkVEb3xF16++roVx87+YEH
	YtG+nx8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD4gG-0000000A4ir-2dzZ;
	Mon, 18 Nov 2024 16:32:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD4fJ-0000000A4av-3xOG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 16:31:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 084FAA41399
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 16:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B22C4CED1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 16:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731947511;
	bh=x31hXLbjYV3wi9biP4K+7rZS3e6ndOZvglcnzxylZHY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NpARf6cAiEWNNEMmssyDT9yyHlXJeFhtN4Xmp+owA4i7fHuykWm9E3qAfQBmvDTTt
	 LOduWA3XtvjqgXlS8PB+7jHGRVazuJRsbZlLeBQHwhytZ10K95AGh2LtgwbbXi9hT5
	 kyw3hAF1gR+UA8ahCNwB/1OeXFLb+UsM6I3HLkia/SoZC7WEQTa4LWVpWVPqlysrpV
	 0nAD3NmiczhhcJn/O7JtIQ7KPHGPesZZegZZF5ZL1GwfOEVv8m9x2j5Xx1tg9QmWO4
	 ThsmdnJKn9TLiGKlTgP0pNRq8IVzP6BhDCcys7q61L5gRkMaSNyarzz7LnR2Zi886U
	 +dt1SMTyG2c9Q==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ee7a400647so242517b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 08:31:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZQs2iBi9g/Tw26olH4TRYIUqsIi/HRHXHmlQc8NFlVKhDOhVDp5zQEx0gT0+L43QR5mLV/sENpLeTVkRSVNFt@lists.infradead.org
X-Gm-Message-State: AOJu0YyBj6rq+YcFqDYNtNJkqvc0vH27qqACbB0ADD0IgiQa8WOCAAOD
	gyU9lF2MWMNOdHg3BKHfBOtI+7+XoeLgYjVNZY2vwbCWefhQAAsKC96RatzObW6s0pb1Qw0WcYz
	Q6qF2Z2gvHE8vMMVuMDtRW7cagw==
X-Google-Smtp-Source: AGHT+IHgWFGBpHakcpgOPIljqoMGrStpMMrXYqwxsjF16duHhASCw+zuAKS78YVpDNsXsy2xlxtfkrziGx+PnoDYKfU=
X-Received: by 2002:a05:690c:604:b0:6ee:381b:eb74 with SMTP id
 00721157ae682-6ee55c2bad7mr122627077b3.22.1731947510541; Mon, 18 Nov 2024
 08:31:50 -0800 (PST)
MIME-Version: 1.0
References: <20241028-esai_fix-v1-0-3c1432a5613c@nxp.com> <20241028-esai_fix-v1-2-3c1432a5613c@nxp.com>
In-Reply-To: <20241028-esai_fix-v1-2-3c1432a5613c@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 18 Nov 2024 10:31:39 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJY5RHnfo9TWFLWBcj5h+FuvbkTYSg+gwN1L_r2ysSMgw@mail.gmail.com>
Message-ID: <CAL_JsqJY5RHnfo9TWFLWBcj5h+FuvbkTYSg+gwN1L_r2ysSMgw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx8-ss-audio: add fallback compatible
 string fsl,imx6ull-esai for esai
To: Frank Li <Frank.Li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_083154_047419_D50B4576 
X-CRM114-Status: GOOD (  12.49  )
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

On Mon, Oct 28, 2024 at 2:49=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> The ESAI of i.MX8QM is the same as i.MX6ULL. So add fsl,imx6ull-esai for
> esai.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi   | 2 +-
>  arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Shawn, please pick this up for 6.13. The binding change landed
introducing new warnings.

Acked-by: Rob Herring (Arm) <robh@kernel.org>


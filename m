Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDCEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 17:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRSvG4lHDviRuzjJRGYuKFbYzwOqYOzJbZ32m62ocNE=; b=v/IuUwzXsKOpe9Yh9/hOGk2j9Y
	PCGKriLj2t1nv2SMZV5GY/PmxINGWYf6J3mict5jHyBySq8E03ahrkiMutXV1saztrpl5oGJy40fC
	fqrhmaVn5hAWUPhcG6X3tMerSA2MadrJkk2zZNiE6h6DD553gaBzY4uzNRxomflS7uJlviXlPWxjK
	3dk5LBmiYP9VMFL3csVXqu7zy8VHepaDs/LEx3G7+fg8KuB0gni/qgbTF8raII3o2yK0ihNZyYgWo
	yqvbR4lGt3ER6Y/w0siEdtasbj7nXS/vvF0wXXLMLo5jrApmTW/1lFvvMIH4kXIQiafDOAFZpZzBh
	qeaxAnSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1q0-00000003Bvv-0dj0;
	Sun, 12 Jan 2025 17:33:24 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1Ub-000000038MW-0sMb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 17:11:18 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-2a7ccb2c618so2064544fac.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 09:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736701876; x=1737306676; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRSvG4lHDviRuzjJRGYuKFbYzwOqYOzJbZ32m62ocNE=;
        b=YKCJ0drNz5WfWdKvQnE8NHlJBNCPvegeOG52VIc3JSQjFG3bCL8A3p6nIlFQQLgimN
         pzXVvhnR2xTgSFhx7IOZyF8s0apF64Rn5cpFygp28VIIV6d08H4RimH721ZpZM+KYIp6
         +te6ehMLzCzwzWklS1/KnHFDgJkSBN8MTiLre4s85DvOCgqzPlMTiVOsWBqsQWULD9z1
         emMu9LYvGDYR+limZqSVbWmQ06zKLYT+LOvnTIOB7Su7C9DRzDE2oDhJwx9HvLa6iRbx
         RP75ZfXsd7j/fY6b0XkheUHVL7z62Y3Gwko4fLCdde6sM4Dkrz3mg/2jLqhW7iNelI9H
         qLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736701876; x=1737306676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRSvG4lHDviRuzjJRGYuKFbYzwOqYOzJbZ32m62ocNE=;
        b=p1bixqF6TDYrCIuX95BFyHTYnxxoBljohMJ+45qWVOSw1wZ9HdIW/TAMXZ6AEpj1fm
         lSObJTEk2eJt+/DxINfBqqeL0tJY73TYXb1fZGMC/JU4AWGJxpIOW7nZVsfsoexlGRLO
         sF3w1SyjO1cfh5NjGfCgNty2jCQa5u9qUlRAzKQfYqB3v2pGvf+BPIUZdXi2YLswAnjj
         mAr1yYXfbR6GQs8oK6gYagtU2RmflU6uLw8K8R9C++Ak/Agnrg1gZe7A80QVFiNFfeH6
         KrK7DeqfSinp0fSxLKMWPGEgGctOCQZz2474SK/flUG5TCEr66gqwV4Qvk7vpy3x8bnn
         0gOw==
X-Forwarded-Encrypted: i=1; AJvYcCXoq+rH/JBMWulGwiRsm8gQ9/8rWcUj0Sm4o77HaDWrettZg19drdUjUA8Fbwj77aYupCmDaVsLpn7soy2kA7T/@lists.infradead.org
X-Gm-Message-State: AOJu0YwTl37h5SjNWrQMFGQEQKT24AJTPGamoHKIgMdinSFCJU72HCdU
	kQS+zInKLUaMhgzZ6JprC3Kh6Js6HxXI9G+ISUN8ke0IkJXFshGOYBZk5uhsiHk3dIH7eup0xGo
	DDqr3xcpUidCqPBQhNryxCpd+aXU=
X-Gm-Gg: ASbGnctBGyWOCC9ja1G0ilPkPVI8h1yyDm4sDGjCyjdi3t5uTK2OY4xK9Xbwc4e31u8
	CrWUWESN6ZiXwf+vSAbdCnnuIrF7fkzku9hkzYgM=
X-Google-Smtp-Source: AGHT+IENGjLXxXcSGe+w7tY3R64tOX7yK5WBTBwurxfDdtVFwVvG/FRtTErahZqTGTD6G89aj5oqyZiB1L1vqwlTv1w=
X-Received: by 2002:a05:6870:ad84:b0:296:bbc8:4a82 with SMTP id
 586e51a60fabf-2aa0690e4f6mr10712332fac.27.1736701876276; Sun, 12 Jan 2025
 09:11:16 -0800 (PST)
MIME-Version: 1.0
References: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 12 Jan 2025 11:11:04 -0600
X-Gm-Features: AbW1kvbXjyqTnf9gPwBQ9ZLkKzxPws-DMkCbBAzJp--cshKBewoVPRLg0dMWqYE
Message-ID: <CABb+yY0sgg6-zF-0shQbcZ=TqxYGDO=S847WpLGFcF3Xh9f2Nw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: Correct indentation and style in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Justin Chen <justin.chen@broadcom.com>, 
	Al Cooper <alcooperx@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Benjamin Bara <benjamin.bara@skidata.com>, Bjorn Andersson <andersson@kernel.org>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Del Regno <angelogioacchino.delregno@collabora.com>, 
	Tianping Fang <tianping.fang@mediatek.com>, Jassi Brar <jaswinder.singh@linaro.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_091117_247490_ED2EC008 
X-CRM114-Status: GOOD (  12.82  )
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

On Tue, Jan 7, 2025 at 7:10=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/usb/aspeed,usb-vhub.yaml         | 40 +++++++++----------
>  .../devicetree/bindings/usb/brcm,bdc.yaml     | 14 +++----
>  .../devicetree/bindings/usb/cypress,hx3.yaml  | 24 +++++------
>  .../devicetree/bindings/usb/dwc2.yaml         |  4 +-
>  .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 20 +++++-----
>  .../bindings/usb/intel,keembay-dwc3.yaml      | 30 +++++++-------
>  .../devicetree/bindings/usb/ite,it5205.yaml   | 18 ++++-----
>  .../bindings/usb/maxim,max3420-udc.yaml       | 28 ++++++-------

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DDDD6EBF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 09:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wW1UPfI2pZbnJAJq8B5Y02AKlDZ/ksTo9I5RBhqTvuI=; b=wP2lryZ58jeHrDaNqhFVM+9Cpu
	ovjK2gaK9J325pSkkigIpJfAaz2pNMLWx1pxApWEHhj1qLQkl7yYaY8SEHT72bVZ0u50E0Wg80N5K
	borXMPkJ3TD+OaTsfDFZ06Tcd2oMJqiljjz5oCy1zLOMnsXpDztGtdgwbns5vuJYsBNSGGA4YIxqY
	ivOSwFRtgSXCLIAzVA5TXn0Ww4A+4gHYiAf13ohq/+jEV2wSOHCs/s0Ct1TbcSUbjOvSzbwOULte/
	HOLCmb6U+kudhTs/Ns/KNu+r2TdyqdrgpquBI4oZbVGi3pKYncxMw+sXEw/cJlB2C5hMeMmFBAr3W
	cLrf4Pjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwvN-0000000HGw8-2NdY;
	Fri, 29 Nov 2024 09:04:29 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwuO-0000000HGnN-1sDt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 09:03:30 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-296252514c2so1783494fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 01:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732871007; x=1733475807; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wW1UPfI2pZbnJAJq8B5Y02AKlDZ/ksTo9I5RBhqTvuI=;
        b=fZw8J+u6mB1enTN+p4T81UG2QmPvleGJZ11rzlqYx4SjUzV4sfawz37542EFMAbMGZ
         I71in1ouN9GG0K8Oj3bjrqrdez9MdoIN8GX7g3UvzUJczbhDFTYP+HeMWkcQkReh64Rr
         /qIOEG17zDJ1RWQIb5x/3BGmMXs/hyNJ8AID8xjhMJRZ5i74YJs4iyl9OgcnAc43zmU+
         KkX6Kg1tXsdjvoRNs1TY06OaKsTpBXwwnxSRanig/6wXz7xCAgKw4fG2f0/GEbQLBtZI
         5gvNhwmuFw/P26IYgQiu/mQF+8LgxAFqKjFNA8QWZKH54BfgRXWKkhWkYDkeFkzw3CTi
         NjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732871007; x=1733475807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wW1UPfI2pZbnJAJq8B5Y02AKlDZ/ksTo9I5RBhqTvuI=;
        b=FF3ck48/ei4rIq7xH0i15g/o/6tOQtxzGtzeXE8bkflrIMndwO9Svq26/WoeK4+gOb
         zzlu9Ls3g19NkfmUzShshiAQ71WZyKAZL+SC0gHuIe7imFTSmiHmYPdo64zafJLtv0Di
         8n6uy9GxGeOjF1Jkx1hXg2R+dp/sVZfbmhwdi3U7vLc7d7NQH/Z90qcKwm8DiZKzKqEj
         kj5gnc+HkMLxm9FdloHx/467e8AXYLDb4deppwwxwMgLXQmd0eam9u4a8Gwmac9cWK+e
         qjs8m9b813WIhJzvWg0J2cQV24dRD+OrYZC+FzQcI6sP3HoveHu/kX/OlgXohTjEqaKn
         Fi0w==
X-Forwarded-Encrypted: i=1; AJvYcCV3b8g4V/GsgwJ+7b++hAJrDG0lQ2UixIb9LswEbbffTIs8vQa50GkKKDLYBOnem3CjKpQ2uCUgIPXzFGOaCJuV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1KhMJX5vHDY5/ABoodCuCIkvPHQiQ/MLfI9GCy/rccHTxKeGV
	0Qz0stc5XqynLJAHmAugWyTyQNEVhPhtCI8FMnc7tntN6VSXm7uYucHxQTOh59fpvGVJa79DhcX
	WUeqtF+/q0VqnaiAZM3dW5RT3IaBikTwxcJhAcA==
X-Gm-Gg: ASbGncsI46Z4Uw8E2zeIjYdmUh4oemb9Pt3P2Zp01uNPvv0KCxFLwDA+QvC3kXsRzrI
	3MJB+c0HYi7XMvU3Ag7SMzLLZHnw8Efp9
X-Google-Smtp-Source: AGHT+IERoPgZEiqiqez2SpbM2z9r3e17P7M26vSOjg5eYLpH30rXYi96JJOb9xGSNWtscEvyPnFpElGY/PMRwNHOdqA=
X-Received: by 2002:a05:6870:948b:b0:288:a953:a5c7 with SMTP id
 586e51a60fabf-29dc4033a56mr9209530fac.14.1732871007224; Fri, 29 Nov 2024
 01:03:27 -0800 (PST)
MIME-Version: 1.0
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-1-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-1-1b7fce24960b@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 29 Nov 2024 09:03:16 +0000
Message-ID: <CADrjBPopeTk5d0irJ3UDBBG2=gJF4F7hKWbaGP80x9F+p2jhUg@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: phy: samsung,usb3-drd-phy: align to
 universal style
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_010328_530918_29003AF9 
X-CRM114-Status: UNSURE (   7.94  )
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

Hi Andr=C3=A9,

On Wed, 27 Nov 2024 at 10:58, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> In [1], Rob pointed out that we should really be separating properties
> with blank lines in between, which is universal style. Only where
> properties are booleans, empty lines are not required.
>
> Do so.
>
> Link: https://lore.kernel.org/all/20240711212359.GA3023490-robh@kernel.or=
g/ [1]
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards.,

Peter


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E87CCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tptGbnUMiBCsaJa3McpSM7cvw+fPwwT/+mAijjESQgw=; b=Cv/HncCOIDUDb+sRg3zl5cdSN4
	PUV77AFH6uFWk1I/vIJa4IICD6K/b/5c4qj2F6hvWXiFZNNgb5eZxwtbEIg8gMG8scJXD4UXLaXai
	kqL6jKG1ZpTxkS6skqJmzwtxBHMCIx/siVgv4E/5lA4LIDH0utofIHw1q71KFzZbJvuGwlmft8Uqk
	78O4XWq25kBR0tj5Td2H5sPgjWfgRiP5W6R1Vwy8q11uMZAkPss8jD9c5PFRJYDAcRQt9Wb0AIvy3
	f8dphutR90mFR5+5ZW1WobU9u4lfifGQ6uhIJb8ge7qtdaXT6m/TsQkLWl/Sjg1GOLvdJrgzg/xpW
	eG4UgrHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhv1-00000003240-1lz6;
	Fri, 16 Oct 2026 13:24:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhv0-0000000323s-1FTq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 13:24:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB5B1440B7
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 13:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E901F01574
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 13:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792157057;
	bh=tptGbnUMiBCsaJa3McpSM7cvw+fPwwT/+mAijjESQgw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VhVS1sBbaKLkdcvLt5i6gurhbGPS6GnTaL9afj14kDG2UyKbacO4DdRHG3unPm1z/
	 EesiWEHhYiN7gJQo+wJxPOQw7wvbbd35FHkMYzoFAjmul/CgdZa7oHBmt9hBs3bEZl
	 KOzAFdXS4JaGkCLnNIkil7kTOffV47s1XYtBl3kAOiuEux+AUF1hlIKG5sH6lyuCGP
	 zhobrqKDM9G/CWliZVlCRhzq7E2eHE1IzfX+CpzBY9qtHcQdyY8KKeEd+w5njxPj32
	 Gzbmf2VfVG8F3r+9eXSeruqbFG/aaFOo8ax+CERORR6yaMLOtsEn1Fy9uuPfHI/Vfj
	 i8ld0EEUl51GQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a980c1153bso40370091fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 06:24:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByeamjrhai1QTHPMtgSnmoNXx84hiRJLEccqZoymvEAMdTqJ/XEUGqaXpkJzRIZgVe3hDjDBthkfqFTy7ns0c/Y@lists.infradead.org
X-Gm-Message-State: AFq9FYI8rHwM8MG1JlgQWsi0wlB0ddK/Qe3L4OdsyV/AIhnYLpIDC6cM
	GRbNROxD0sYo1aaj3KhdQSqYFITTpS++Yqh1zNOCSK+0NJ0+pV3GEDXtasCkLHl+hGshl+SldFg
	rwTgWHf80/Nm+0eijEegRXDXsyegtX14=
X-Received: by 2002:a05:651c:2212:b0:3a9:d70c:f75e with SMTP id
 38308e7fff4ca-3a9d70cf9femr44778141fa.7.1792157056449; Fri, 16 Oct 2026
 06:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
 <20261014-apple-m4-pro-max-initial-devicetrees-v2-7-961edd8d661b@cyberchaos.dev>
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-7-961edd8d661b@cyberchaos.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Oct 2026 15:24:04 +0200
X-Gmail-Original-Message-ID: <CAD++jLn6dKK+1WSash3t0ha8Av9zJENjY0voXD5kRqOqm+3fHA@mail.gmail.com>
X-Gm-Features: AclHuK9pL3EIJMMfpSpFM0KiMYOGh8ROn5xZqcFmx2VF7M6wTBgCRfX7l979pQc
Message-ID: <CAD++jLn6dKK+1WSash3t0ha8Av9zJENjY0voXD5kRqOqm+3fHA@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] dt-bindings: pinctrl: apple,pinctrl: Add t6041 compatible
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hector Martin <marcan@marcan.st>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <k@chaosmail.tech>, Mark Kettenis <kettenis@openbsd.org>, 
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org
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

On Wed, Oct 14, 2026 at 8:56=E2=80=AFAM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:

> The pin controller on the Apple Silicon T604x (M4 Pro/Max) SoCs is
> compatible with t8103. Add "apple,t6041-pinctrl" as SoC specific
> compatible under "apple,t8103-pinctrl".
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


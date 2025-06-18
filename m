Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A58C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 14:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQTB75G8uUgBMyAAX12JhH5txrAj1DcFBhtKKz24PTU=; b=prcCLstRwttsDgBrVkn6mlX/Ow
	dzog8r+XrQNJqaYVNNdrSpUO+b7eOZU/xWGN6YkhBTfEwK/CYPn6oqTFY+n7mqH1eia/nkrOeI9bu
	4Ylpl8yRD9aXsL+eGHX87BxuJwrw4vtWJpaCPUH4h3q3FkJJ3MEB1hk6HJVER5FisAnwes9QAut4t
	bOFpc0wcOIvDDOuwmoTxJVxlMa4jDSZIZ1hBuiubJ3RVLDlB8jhhWMyNYrGvgrjZQ57p5msWG8zRa
	yDEE6YecWzn9+KCPuB0+s52K/i4Fu0q+xd89stBWFTyNGU947ozRYwIYlmG1aEMZCyvwiEPCEux6j
	7Yt2VV9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtsU-0000000ASVE-199D;
	Wed, 18 Jun 2025 14:35:02 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrvp-0000000A8Kv-3pKL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:30:23 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-553d52cb80dso458712e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 05:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750249820; x=1750854620; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQTB75G8uUgBMyAAX12JhH5txrAj1DcFBhtKKz24PTU=;
        b=VFNF2fUBjcDCD+IPbNcL5Kb9/nxmgohGiYM9fj2HHv9uNHNHo3cmcALILGJ8bjLpdk
         FuEjWOsmK/kRApnhtGjTB6djk8X4am6p/1DF+9pGgCdULwLDAl5yBFrgIJaU3zEfR6Rp
         yg7COCansbtyyqoK9Ixe15n2hmreWoAkNmJnivTUZ1q8SShSvZ1dDtmIU9fOzU11r5bz
         7eIP3pKiNviMo0UG0A4cMC8s8w5TXdL3wGFs+WiFZUi0J7S61l00ScgzEpJV21t6UUiT
         mwyxVW+nURvr6F3bZP876Eze1VGqCXaHdtP+okdbOG4pfkSlMu/qggmiL//9j/1DWBQJ
         O0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249820; x=1750854620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQTB75G8uUgBMyAAX12JhH5txrAj1DcFBhtKKz24PTU=;
        b=aAyQyMZLOrB0bZovl1orzs8mvzzpNjTQBmrU6vLPHTGGxQ0xYobViOR8iJk8H8qtCd
         nYJbL3XuYtkqHBNJtKuzmDILo+CxVKCbBpCRRrlvbmXbY+MywD0GFHnVFPC1WT0tGeA6
         jefYetaq/p7jQ7A7DJ5abyX67XKjbP6OJAqLTeiMMYGjmMBJk1bzXQSNZLMSH6LUjPON
         7CzJ+x/pUp53oW6s4S7dlgiUGO+SHR77iCC7ReeQK6Ia7aVv6d42SrHtXa6SwPkDC5VP
         eOJx0M8r/ojh9rI94q/55AW5aDf8K/gialB9a/gZYsX2Vmzfmgs8sDvZYYJ8thHslHLy
         YYPg==
X-Forwarded-Encrypted: i=1; AJvYcCWpyHlDFVOXLO8ff7FWWVPPdM9vz0AC+mhhdF2+EaGwhti5FPIVTWLLoL38eDtk7HAixHXwzQo78VwM44iIxp/+@lists.infradead.org
X-Gm-Message-State: AOJu0YyeUGp3L12fkMNTVduYdgeKgxN9+oIu0YWTzdx67rOefClcloE2
	u0hFeMlqJ+HsnleK7AgSTeUfjButkE1s1qDWc/fW9GyC2WSK9kgx4eWpsinr364CxJq99PgtG3z
	vHWIcMjK8oywTXNu/6bEkq3bxQsVRBLNJfI7VzKch6A==
X-Gm-Gg: ASbGncvWtMzAb8ooTtOrYZ6lVfROEuF+0vU5nxepr9wNJLcmd7KOABI2MoNJemiAPEq
	2/4dBV1I1cGThZHr6DmQsA6ouji79ueTryn6wiNjYbATmVoVoelg7fUSrjDiwwKcCaucFXNTvav
	xvBSiFJqDALRZL+Ocw/ZLlqCilTazUp50AwTWxC+cJwss=
X-Google-Smtp-Source: AGHT+IGIhRJFv1Ba6R4yp8rFo6dY6wGpRl5V6O/QGXm52fbnJBdughdFvLkQvf2FB3CR5WNkXCk+SFCfrmRt90k53JM=
X-Received: by 2002:a05:6512:b14:b0:553:2912:cfdc with SMTP id
 2adb3069b0e04-553d38ca1c3mr855269e87.9.1750249820186; Wed, 18 Jun 2025
 05:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250613181312.1269794-1-miquel.raynal@bootlin.com>
In-Reply-To: <20250613181312.1269794-1-miquel.raynal@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:30:09 +0200
X-Gm-Features: AX0GCFvrCunV14RNvzKSZ2HTRXKME5qG74EO21bVrPNwSxtcFCcj-72MPW9Sr4Y
Message-ID: <CACRpkdagchPQke6mu4Ma=OC169Fkm6swnPxA-oO=XxOoGQ+KiA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: Fix boot on ma35dx platforms
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Steam Lin <stlin2@winbond.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_053021_957108_198824EE 
X-CRM114-Status: GOOD (  15.77  )
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

On Fri, Jun 13, 2025 at 8:13=E2=80=AFPM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:

> As part of a wider cleanup trying to get rid of OF specific APIs, an
> incorrect (and partially unrelated) cleanup was introduced.
>
> The goal was to replace a device_for_each_chil_node() loop including an
> additional condition inside by a macro doing both the loop and the
> check on a single line.
>
> The snippet:
>
>         device_for_each_child_node(dev, child)
>                 if (fwnode_property_present(child, "gpio-controller"))
>                         continue;
>
> was replaced by:
>
>         for_each_gpiochip_node(dev, child)
>
> which expands into:
>
>         device_for_each_child_node(dev, child)
>                 for_each_if(fwnode_property_present(child, "gpio-controll=
er"))
>
> This change is actually doing the opposite of what was initially
> expected, breaking the probe of this driver, breaking at the same time
> the whole boot of Nuvoton platforms (no more console, the kernel WARN()).
>
> Revert these two changes to roll back to the correct behavior.
>
> Fixes: 693c9ecd8326 ("pinctrl: nuvoton: Reduce use of OF-specific APIs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Patch applied for fixes.

Yours,
Linus Walleij


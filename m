Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68683C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 20:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8QBo7I1WRpVvZxfxRgbRTRR3HZAE4SdeL8FRmGw55g=; b=SFIWWQIoGvvz57Rg+ua93mqTT6
	d3slNzpE9l0ZMHJyQD5FyIYUHRZCxRDFAAPGd6+qhqrHXn5RU0JQp1IPN+QMEy9MwyCtjdiMFe5vk
	87ebljmCTrwOFWr75u2NfEX9BbSkPAz6ifQOGbm8GuS9ykE3SsmiBf2U+IYeOtmIA5KzuB7vfEXKj
	Gdo3zfvLiHodRX/EVUD8XtiBeWOtVZ6TsTVjire7zxLfd03C6BE/XV1fBx8YJyffCb44uTaGKrtD9
	aoeFjqNCf94wO0db64AXHFTmRiBZyS0wKAt5Sf45kq96MsNTiOXfvI0wqql3xOsgZsPTeztknUZNa
	SeDkB6GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiMy-0000000GXPa-3mb8;
	Fri, 20 Jun 2025 20:29:52 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiKM-0000000GXDf-04Hh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 20:27:11 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-553bcba4ff8so2352037e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 13:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750451228; x=1751056028; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8QBo7I1WRpVvZxfxRgbRTRR3HZAE4SdeL8FRmGw55g=;
        b=om2qlq+NJDwVACTieD3Jwz2ch+i0zqU5Uvnl9XqnAu6xGeDRUOinUYpbkmz+V6GHKZ
         Gg367taUyWZpjGQGeQhemdzb/svgO+2AlmEtgzUeAGs1u7PMNkVKKZjgmt0H1WbjmUfj
         u9nlU8oLGI5vgVRNC6EgXenL29210B7LwNJH2SaY+tBLH3m6LGw8ozQDLM900p9mTfyr
         fYX2Ar9jlBkMvhqucNiLrGMBARZXhzMbgDg+WbMfMUKOZMmsZ5Q3zXBwqwKZnuuf9GRF
         smU0YtWQhkwO0CsMacivbqW8ot7fMx8yIy7Ggu79hdAjVMwyWqaO/q7E6rR9a2TkXz2q
         ugXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750451228; x=1751056028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8QBo7I1WRpVvZxfxRgbRTRR3HZAE4SdeL8FRmGw55g=;
        b=xAJMdaUpvbCQ76W2SwDQLaIgGfmKtYfktdQ6cYdW/Jp/l/lwDMVCUwZzDu/H8HmoxG
         d6Qq2XY61XdUBu+CFAK3m48dgx8koTbm70AD+naUKn+cDLOtycT4+n5e+BRA2jE4mmt1
         jeE8Ri2ecXN4DKe5bRz94uUKhTXlSdl+RZH+dcv7dSVuWdmH2QpaUfFCGsNUdwbBrHi9
         vOxHqBsuOtFqAA5E1418olalvn9SzjG8uW9rXZw7rO4ryc5SSDrU1/zspRTUOpwjFa1M
         DowCIGHODZJ7xggFLvBlurd4+LbOQ6Olf1m0asUIXf+w1T6oTAIWWGM5RZoYaqMuhAC/
         xQnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA1yLSLUM+asw9hIocAK5TNwxq80GuXMnPBfmWmuglaPCd7SUOCsSCGQ5sctMM4ZcdjvNhk6NA3zN999rGZNZ8@lists.infradead.org
X-Gm-Message-State: AOJu0YxCvKJGVEvO/u01LzndDCLZdqmjBD/IpPziY6dWCRRho0lJynhC
	ofqmA6ofIRTYzc/rxv2RNexUP5RRUj6qsuroDDvCC4VdLjXF9+LQvsCdUjw7zd0JIPMIL+aHlRX
	jvpSfEz3ABm6hVwSX7+2d01mrVYTWOmPyE6kOMat0ApAla82cd+yZdx4=
X-Gm-Gg: ASbGncuWIe5F+Aym67ZxWersRnpUZuihwKec+qjwy7+kELWb0+I5IvNkAf2pBEvWg7B
	0CFMnUBhwSDI2ClIQztJarkcYrgv43n3Fz8gHH16PEBEHsCzqRICGS3zCQmo7rzyysGpyWj4srI
	j2Wd5Sk2EGKUJ7HA5KHFsJwC5hsy81thjkofU+qxQ4uzw=
X-Google-Smtp-Source: AGHT+IHz94hRrEwwkjw4WiRDoSc3MUv6m88S6TTbUeVjSJxJ3VdOJuKjRU4AfBWHOWifxWnhx4vVHj0Yz8hcJ0Bj1Ng=
X-Received: by 2002:ac2:4c48:0:b0:552:2257:93dd with SMTP id
 2adb3069b0e04-553e3bcc3b6mr1248695e87.25.1750451227394; Fri, 20 Jun 2025
 13:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250620111257.3365489-1-arnd@kernel.org>
In-Reply-To: <20250620111257.3365489-1-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Jun 2025 22:26:55 +0200
X-Gm-Features: AX0GCFsffUVLgSu0U2KPzmpnvQsAmO2VLzwwQc1qhRBEB7gSUJwT8WC6J3gNd4w
Message-ID: <CACRpkdZgggMYqm1OBOUZtWQo2jArFcK8QqCf5Z1rviqk=r83mg@mail.gmail.com>
Subject: Re: [PATCH] ARM: export __memset/__memcpy/__memmove
To: Arnd Bergmann <arnd@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Abbott Liu <liuwenliang@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_132710_073008_A4F99EAC 
X-CRM114-Status: GOOD (  12.02  )
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

On Fri, Jun 20, 2025 at 1:13=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> When KASAN is locally disabled for one file, the string functions
> get redirected to internal helpers, but those are not actually exported,
> so this only works in built-in code but fails for loadable modules:
>
> ERROR: modpost: "__memset" [crypto/ecc.ko] undefined!
> ERROR: modpost: "__memcpy" [crypto/ecc.ko] undefined!
>
> Add the missig exports.

missing

>
> Fixes: d6d51a96c7d6 ("ARM: 9014/2: Replace string mem* functions for KASa=
n")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


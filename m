Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AAFCAC589
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tF31xmJcbc0qseWIsNrqZ2L4YD6Ay+rKlY4qBWnaoK0=; b=iYwEXcCk7FoBVRMCNkjrfqWXv9
	jjNTLPPM9s6pFGuyxx2BMdP4XkvfFgXbP9vR+jltS9ss4074ZBbNf+H+I9OMWcpK6j4+qRGOynux7
	hUKRX+2x22fAigdtZUsoGJ9pC+6QdeAuw90TdYbp7m0fGyNQL2Mna9C7rYLko0yKUv59Ds+iuP3Gc
	EqmoTqf0k0sM5uq+Yiu722bZ6HlQpFvdesgVT6ux6E76TbD+j23mcuNB7T/x9G20zr12U2TVO2IbW
	00WDZvn2CYWXqItO1/AKQ64R+0vUB6Ht4Q2VHfhX2C/9nzWf0f7+V67AWP7sIJNrhhiWX1k6Nk4tQ
	3ZjclgnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfNB-000000012xS-2HRp;
	Mon, 08 Sep 2025 17:09:45 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbVg-0000000HEJk-2T2x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 13:02:17 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-336b071e7e5so35212351fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 06:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336535; x=1757941335; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tF31xmJcbc0qseWIsNrqZ2L4YD6Ay+rKlY4qBWnaoK0=;
        b=K4PaeHAMctpiAF0fYM5mb8DRoyehqcd4ugl2rl/fvk3WLSPRIUNola6bMYT095Rl1K
         16vVD1Q98REac7bUtSYBWYuUwqKZbxK9ZK2wejRU1uLr5DKqARf2MvZR01yTjq7l6IV8
         PYhuMC9SKDlZez3HYBdXyRewERGgOfkPZpfsdz3Es91+KYcvkpPVAxiaXIwDRl8ubZ/6
         PieufsXpn1nkm/g/sgE0Hdn68aIoH2lsnTMs8dwuxsFrzP+Bk8RBVJnKOEJelmGrNpE6
         HIYBjEwXuKmEdBZeV5VKyO/nR9xQLrUAAisq+Bzinm0ffo5E6okLS0Xu9d8MDI0UL64P
         8IhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336535; x=1757941335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tF31xmJcbc0qseWIsNrqZ2L4YD6Ay+rKlY4qBWnaoK0=;
        b=rR9a/E0Oof9kkWh6DrP25Dlv7h9g9c/ukwPjPt/HgG0ghS+0BAdOzrkeBi7j8Szuke
         4EgM+hgv7m/JoVVz3WOLaosGkIn2MP3nalUEzgm3pIpxqWTr9gs/gyAUqeUPcmPKEx1H
         DR7KDmrDM8ec5B6fqV315gEzYutzLzAn0hsw6hypVs2iL7KIZSKmpkHgSNydp0vtRnn4
         fwJsCCHL38rKHXpHjfjiaUf4PrIuH5H1wt70A972JbctDwyZoZsFujPWcV+Kw1spyr+i
         hWqUK7JxfW9XghSzrVMz+ASgn0RjREwdo703LVZxJ1Bb1fr/X4Lvl6oNRAMDd0TA0JSF
         YrtA==
X-Forwarded-Encrypted: i=1; AJvYcCV9BdjG+B0Mjf7YrCTongck1O9+C10flSu2uVOALabmURZ87syDiC85Bi+HYf5tY9A8HXhC81FWJhBn1vt5FyAk@lists.infradead.org
X-Gm-Message-State: AOJu0YxaFTu8xKMDo6bQGHqnohqYSwinFRAujLDn1PYKfovG5pi22pMI
	PGqWIL2tPLGe+E3GRbCdG5yRnW5CKsAD/iVe9vUDEpRjogQh2HQSplcxLuNLN2Us0dqp2Gq3FeL
	EEYWKs3ety1dO5DAcG/ZIF2clCv7/LtIakyzDjnxkwg==
X-Gm-Gg: ASbGnctFldRtj7llzctT7cWBl54EZskhlGT3jHpNXIA9MKy01SVnz4CpKL0Uij66JrC
	VBCxLGjDTMNSeHnwyQ07YBlKZo9/gTX8S/0QX5mLfNpNrw0rEO2882KzKugMeGMo+tSg3ruTOBq
	Y+01kGsMBKiiDyzmH4mblQXv8wIMzoazP64Eq+ir46pzHLzA05CElfIPVm+4u2sbazCNAj2g3LE
	R3nSFCwdQVIZRJl4A==
X-Google-Smtp-Source: AGHT+IEDQrNGIVJ+srnhccYYtb5VT5e/nczDh/a0UTBab1jQ6lcNoipDjpuZsUUuvBbVHlbzfGsEUZMyzV5z27NtBG4=
X-Received: by 2002:a05:651c:b0b:b0:337:88c9:4e00 with SMTP id
 38308e7fff4ca-33b4d6e156cmr26649511fa.18.1757336534706; Mon, 08 Sep 2025
 06:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250908113425.31002-1-ansuelsmth@gmail.com>
In-Reply-To: <20250908113425.31002-1-ansuelsmth@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Sep 2025 15:02:03 +0200
X-Gm-Features: Ac12FXwmkJnm8MDVmgkMoi1FgB_EyiAfRHJw-rYt80JRUULYhM8CUT2H32uFUK4
Message-ID: <CACRpkdZJtHU_pne=48UDBgpfM-9FnJsC8sfN6c4zV4KmDWs4Pg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: fix wrong PHY LED mux value for LED1 GPIO46
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_060216_629649_9FE6B0E8 
X-CRM114-Status: GOOD (  14.16  )
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

On Mon, Sep 8, 2025 at 1:34=E2=80=AFPM Christian Marangi <ansuelsmth@gmail.=
com> wrote:

> In all the MUX value for LED1 GPIO46 there is a Copy-Paste error where
> the MUX value is set to LED0_MODE_MASK instead of LED1_MODE_MASK.
>
> This wasn't notice as there were no board that made use of the
> secondary PHY LED but looking at the internal Documentation the actual
> value should be LED1_MODE_MASK similar to the other GPIO entry.
>
> Fix the wrong value to apply the correct MUX configuration.
>
> Cc: stable@vger.kernel.org
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Patch applied for fixes.

Yours,
Linus Walleij


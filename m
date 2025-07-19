Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E12C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 15:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5bc8PEesDrnBIXOtuFP7+ZA4bNJkI3uyCmzQ6D87WI=; b=dZje+sOfWAO5sKSItgHrle3RL5
	XGqp469vDmRh/Ndn/YSGzssbhfb9rtaWc99nHaMjjIt8nKUN1QeUlv7qUfAlR5vVjtwXljeD+nOWZ
	jGjBuHRpuzZUG75ntpZjdFY9SR+EhpNVRl/9tVq6GDfb/vugZKCkuD6vsI48LYkjqKM2nVa6YXBF9
	wLixh14ylwxXM3BcNvQHJytuA0OOtabnkk01FrN9pxirjINQ+VPpw0BLDxoSkvfuQJuIp2eDRjjIK
	rqK0D12ElmAtLiYcSheiFBNELxob4AqLb7FbUFx/DmmbCK3kBUpJgWjyrN9jkGpNkAn4EsZEMZ/Ov
	HqHUeXhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud9ty-0000000EPJg-1CAn;
	Sat, 19 Jul 2025 15:55:06 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud9rU-0000000EP9X-3I0p
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 15:52:34 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-32b8134ef6aso31531421fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Jul 2025 08:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752940350; x=1753545150; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5bc8PEesDrnBIXOtuFP7+ZA4bNJkI3uyCmzQ6D87WI=;
        b=OPv7UEZcXdCnGBHl8P1OmmXPq75HEO6h839bLD8ROWS4rx/hRpF9BH9DCVUii9ZMsm
         kqiHwvYc6ZmPBMnvy5fbKEJdNYwEaaT5GTFT6L7sM4qZB98yqTF7R8nNm9H24xF1BkDB
         R34pO7RozTN0W3UFjB/7Ja27mRY22ZhbSZWrt40sbmb6ZukF3bSD4GEcbWi+ObKbzXg7
         TFpjGocbIq/vp0JJCyuz446cY3XQDiI5jhdvKdJlW7UcWg/zgAphIN3G2U+DE2Rmu/MW
         ZfmHG0oL3/zzdqU2zDDmUS6wb2XGsR4/TLsgQEqot7FFX+MjNX4YeMIWVROozyXiDAqJ
         CDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752940350; x=1753545150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5bc8PEesDrnBIXOtuFP7+ZA4bNJkI3uyCmzQ6D87WI=;
        b=ukcIvTYJYX8dQcY/KQGhnobKSnjQRgiMyxfj3eay8fDjKthOKHqQL0Eo54CwBe+ct2
         LyovRZHwnHKKIRg91fqqSGNa9eOqEk0zEGI631surCtcy93bSwzEyc+8xcqIII+PX9Dz
         SrbERGgJ2PevjOdV7ZF/YewJ2Fy69SbL8gkR+FQV5hxAjUokCOnQAaePjxS1+Ple7oVt
         IlL6FZKV0UVOmFnF3DeDEH5EnkuzhMdEQVkG8JKQQPKooTIZorq829Wjx6KGFFvp++vn
         8rx/WG0VNZo3b7LvR1ZW/Df822mfwwPEYuFw6Ze7tsNyzY1gtw9pvY3aXuqcx1Hg1WcI
         HBJA==
X-Forwarded-Encrypted: i=1; AJvYcCUHFX0HkNzviv44nGC8rYrs8ZuTkLnTGyVFWkAJENCJJfll222hntaJvcJaUrBxmHEU5jViUh+QoZNDiSAUGQgx@lists.infradead.org
X-Gm-Message-State: AOJu0YzuVkf0EApuazEEb6SRi5eVtm1PwnQygaWLuu82lbkUgWxAyE6M
	a4ZZyz8h5mIk7+dHLzFDGzyUyagdfvWCCYjb8/FlHjG3UVh/W7/6Fcbvn1c/VeiDgUDZiTUQaf0
	pQBSAPjvn/Hf5izi+AykilEa70ji5FGmuB8xPoetpcQ==
X-Gm-Gg: ASbGnctUVBDUESzylOlft3Oee0ClywPQveFr8Hv/OR51rBibj8xHPmFVW+ygD3fcPma
	aqP+uYRgzIYBU6wqtIx3xD6Xm42j7Zl5po4TmAWW3Jgvz+vRvFHhaf+21r+hpYtHQa94NRVvU+H
	CB/yDjIEWvn65DJN7xmHpj5UI5JvOt+nFXHcs3qaSBflumBZ/e+hq+640pVQ/RPR5f3CsN8lJR7
	tUecaEMcrV/qpbKUHBV7O6vOMTig/dyIlWGC4I=
X-Google-Smtp-Source: AGHT+IFmiA61E4Gg0hTSxNIaahpYBE3l0iLJ8kM3KyoRS/pDDJR+mBK07r+7Ph2Rktom9ZxkS+DLG3ISTwAgRVBfuh8=
X-Received: by 2002:a2e:a550:0:b0:32a:85ad:2162 with SMTP id
 38308e7fff4ca-3309a46638amr29026981fa.7.1752940350231; Sat, 19 Jul 2025
 08:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
 <20250610-smc-6-15-v7-6-556cafd771d3@kernel.org> <8f9fdb3e-9655-44ce-8a2f-c1628c88c929@kernel.org>
 <CACRpkdZdz7eHVjgX-X_UwjJ_qSu5hSPeocuQ9DWSiyjNLU5AmA@mail.gmail.com>
In-Reply-To: <CACRpkdZdz7eHVjgX-X_UwjJ_qSu5hSPeocuQ9DWSiyjNLU5AmA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 19 Jul 2025 17:52:19 +0200
X-Gm-Features: Ac12FXzcG7EoJK0F7AkshhLftC2Qw2ygudqOy-1un15EMy9NVqfotyOTu45yZjU
Message-ID: <CAMRc=McNK3fmbP2UON0EGkjM6gH_1zSHFr_PzZ9JhR7a5swLQw@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] gpio: Add new gpio-macsmc driver for Apple Macs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sven Peter <sven@kernel.org>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Hector Martin <marcan@marcan.st>, 
	Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, linux-pm@vger.kernel.org, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Conor Dooley <conor+dt@kernel.org>, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_085233_062477_B9784670 
X-CRM114-Status: UNSURE (   9.95  )
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

On Sat, Jul 19, 2025 at 5:42=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Sat, Jul 19, 2025 at 2:59=E2=80=AFPM Sven Peter <sven@kernel.org> wrot=
e:
>
> > top posting on purpose: are you fine if Lee takes this commit with the
> > rest through his mfd tree?
>
> Bartosz should answer this since he's dealing with the merge
> window for GPIO, but generally it's fine, and it's even using
> .set_rv.

Yes, for sure. Lee typically provides all interested parties with
immutable branches after picking up complex drivers like this. I
already reviewed it but for the sake of completeness:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


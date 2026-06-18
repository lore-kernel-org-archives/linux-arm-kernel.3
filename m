Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEFDCD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 14:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klc37y86Bp+o8UgyvGFZJuEx2h0iQwGBFLogZZiStCY=; b=CABAypQ67r8i/IdMX5wgdrAcA6
	b5Sz5weMzDeOUC/hD1f+RCDlGvdSDkTgTjKVKpzidUguNqgEDGhxvZmeJopHCxJg6tA1Kub5kCBz9
	L6lGfltL2QkAExouITjRBY5wX6cihV3Fzet4+a2r+W9GL6B8wLNGEcCLsPYcwXVAvkUlJ0JyRFyN0
	mLrXn7sC02Ll8p0XiUm8z9bu7avQo2Gj+Il0xvMUtGSb/fdBz8exOEUM829a8BTqKx66tHScp8ilK
	fCFSgxW8je2YikXBuPbFdISApIOtNjyW+y46iDrPTUa7ZKvK6WwBl7UbOSK29bti5GIzd3K4E+6Yf
	XEGWRZWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waDuV-00000001RGY-2jMD;
	Thu, 18 Jun 2026 14:40:03 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waDuS-00000001RFJ-32TX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 14:40:02 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6912f4acca4so1714595a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 07:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781793598; cv=none;
        d=google.com; s=arc-20240605;
        b=FSHhpWbNYRxiIuFV3Mow0P0Vn0qb+/Jo9ZmQQZXBnO1uXDBeBWG2ESMBzSbs7Y1PbP
         zJDBItQbLbQ/VHpL7D7UbK0Slc3UwLpko/9ERMpNhiLLACEz1yz4n/58tixeS9L8ZYoM
         jpjxop7BLYyuvl/jpFqw9XdgO4zWsWUSOZMZSFjgkgq9dX8UWVAjDqLU69Be8uC8R8H7
         I6JodW/EFbhG6RAZgigXJ2OFch0FTGzUD9ty+4Csn2k+cX/YVFhsQ0gWT9ruGOKLXdrT
         PqtAnjjMoyvPlnqtap9yexHUgO9DRrCrLh7smgKslpLuDZQKoxfBgK4tbCur1QYg+cj6
         GCuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=klc37y86Bp+o8UgyvGFZJuEx2h0iQwGBFLogZZiStCY=;
        fh=xh3BgycrIfc/qTI0H8tlABOpsDfCNmGp1ksypK3gkZU=;
        b=jgwypwOO5oz/3Jq7PQutdJhqPsDRs5xgEVallvHUMWBzDhgu0unGamKIux/Th837CO
         rW7nEdrnJ0l2Mr2Y85kidhWdyk8lIxkSNHcBvyHfRKBThY3Vgj8EeikHT+I8E+MTTFAu
         swnXo40AC7XAgeDkqfhtVdQ3zB9YArT8VY78P42ag2Ab8rOtXXNUdxqTvrkfHL4CQepj
         SiwmxWvk5h7BEamx2EAhIOf7qz40briQOTY8TYZoFFk0wdh4UKOOGLcmU+wFsaI+2Icl
         XHUsdCQQ+0T7Pnaa5gH3Ms4PEgE+mpmaMTLe9yX2F5BzndGyzv9qIIG4S1bNZocTeQfS
         OsUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1781793598; x=1782398398; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klc37y86Bp+o8UgyvGFZJuEx2h0iQwGBFLogZZiStCY=;
        b=7v+iGvUWiKKZA35zA540yJtNVV7zdEjC3LHKsCu5PYxf24q869ZbB5k2oqenpVKvDk
         KaCxgyp4vRj0kXkmf5D7GXBhTqQEt5xH985q8VO3xhY2n9SGrPULUo3sT12l6oXZcw7q
         ijHnJ04G3/gtZj+nXegxbpJFstb/HduCf99IPLk3OIrIn2zNWb2utA7zW8jMan1vBiHp
         U3XlWKbyzgX0K/zAa4SCpltQ7uALTslZFZtBDpKxa98GzGmcezLtWEW2xp9zKSy09Gw4
         IJRkn0GVKACm1an3BtV1dt5FLKtNzCypokrOuPaZIXLmAB45bwN0MHxT+c47kDj8IGBO
         md5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781793598; x=1782398398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=klc37y86Bp+o8UgyvGFZJuEx2h0iQwGBFLogZZiStCY=;
        b=BCJAgJ5iOI0lBKVCBroBY475ywCLMFLnu7U2y3a5hVebzJfV1jaheQIfkHebKKWQAA
         DMAcijFe1FypFrjJi8ubtA5+so2gzRxct0xO6oQTQqHC0mva98RDjdnH+qmK9T211UAk
         u5qy/ljkDdKIIkw7VipHp1IuWjytXi24o8lpcOBbE3lG5PcyW4bCyk9kjFTfas5+RJGG
         SBPHgNqtzyH3SmvuS2iLw3wS/FfxKIco0yYjaTbKtkqZOJ9CYlK0iR036xQlk//XN8Bx
         k3JvhdfVI6qgwEHcPudSb9iC2LRjqi+4dHO/pAUjK6kUEj4tWJR50+G96uzve+Lx3Ylu
         99pg==
X-Forwarded-Encrypted: i=1; AFNElJ82T6rc/qhfyA8re8azgbh5Fmnzx+iRn3/8REvCKpVIQmz+nGJHIPxJHASAl+paOb6TdCjaWIgxjuJ2fK93xuBn@lists.infradead.org
X-Gm-Message-State: AOJu0YxQXuRWEeiEid+Z1S11XWK2mF0hT4mZaSGeJ8T6tEyChpd1fcSJ
	mTtbrl+b8l1MyYLCywxjOb7DhsRxspPtWKH9EUWQ7khy/PFKXbzWR7uAN1OIAqrcVqiCEZI4t6R
	O8yGCDXSkk0zN/QPlbkczfAcvviVcTqLMuch2UHNr5cMSe4kSAKKJI3bmYQ==
X-Gm-Gg: AfdE7cmfma/hjY+Ftx19u2AFYrYExFh4IZ9CZIW/ZT65RuU23TuggzwPS7V3tp1W716
	OhRlDYiFjD8UNvRjy9x2D1O9fqp+wZS00qP7jDzWImMaqXirFqw5qb9ZNzheHEmslMWVpNJzdMn
	FH9tJ6eYszwFIVCI57qN6knZ12i5OZZQxcW25Xl7NHariCzfEu+xpNdDco78VmiAms0NnvibJRU
	flZnBZatjfzYrL1jiGXDOpZDwEfTUuo8FQizMsv3N0/2hsWC7Y2GI6u0pOLyRM1uYTlPTYJPv96
	TEtvaABKKayJC6bUkwuukqXF6VYt/Q==
X-Received: by 2002:a17:906:209a:b0:c07:6950:4490 with SMTP id
 a640c23a62f3a-c07695ff1c8mr122729166b.42.1781793598164; Thu, 18 Jun 2026
 07:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
 <20260612-dh2300-mcu-v1-3-ab8db1617bc0@flipper.net> <20260618124034.GI1672911@google.com>
In-Reply-To: <20260618124034.GI1672911@google.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 18 Jun 2026 18:39:51 +0400
X-Gm-Features: AVVi8Ccbf4bgucBpzfdBMYf6dTmoR9eMWMyjmKeq_8LMA4KsT1l7bFz4pMkxg6A
Message-ID: <CAKTNdwEta01QjuaqfJ339pCTKMT_4K9QbmvFu9OBt=M8-JSDKQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] mfd: Add support for UGREEN NASync DH2300 MCU
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_074000_789470_09EAB76D 
X-CRM114-Status: GOOD (  20.39  )
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

On Thu, Jun 18, 2026 at 4:40=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Fri, 12 Jun 2026, Alexey Charkov wrote:
>
> > Add a driver for the HC32F005 MCU used as an embedded controller on the
> > UGREEN NASync DH2300 NAS.
> >
> > This part provides the shared I2C regmap to be used by function-specifi=
c
> > sub-devices, and instantiates the SATA drive-bay power gate regulator.
> > Implemented as an MFD to allow for other functions of the MCU to be add=
ed
> > later: vendor binaries imply that it also provides a hardware watchdog
> > and somehow serves as a wake source, but so far only the SATA power gat=
ing
> > function has been confirmed in absence of documentation and sources for=
 the
> > vendor firmware.
> >
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> >  MAINTAINERS                     |  1 +
> >  drivers/mfd/Kconfig             | 16 +++++++++++
> >  drivers/mfd/Makefile            |  1 +
> >  drivers/mfd/ugreen-dh2300-mcu.c | 60 +++++++++++++++++++++++++++++++++=
++++++++
> >  4 files changed, 78 insertions(+)
>
> Did you see: drivers/mfd/simple-mfd-i2c.c ?

Oh. Now I did :-D

It's exactly what I needed, thanks a lot for the pointer. Will drop
the boilerplate in v2 and instead instantiate my tiny child device
from there.

Best regards,
Alexey


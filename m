Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4C9C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZQFkTG+TE9XyLSvBWPzBX545sfzGUulEWKqLFKYrkU=; b=ywjGYgV/EgUc9X0tGb6QdzqdDf
	X4+OvJa+sAh19MOr5RF7ygzDlAlRgNgSDxJS1wuOhUFtVNzWqoO70L0lNuYF51vfOFhyY8c+bX4aB
	wgbRMnLAcMhJZJzJdnY1li3l+A9ZNmaPbV0mqIajdwU0CNE6mVaHy+rZnHeYhl8TJ5qLZSTnf5DxH
	KswtwCWCyNb7Krntfnn93kWz21gc8fm6dNsH6FFB/sT8ozElwyLw5Z6WTD5M3ZDIiFI+Dbol1Cxe/
	WkcoV39g9Q44GbvDGSOSYLwL9IyS3J5BJ7QOcT9kDzfkLkuTGI8KtoA+vWX8NArqzhXprONwhmb0C
	7ZBopFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55j9-0000000AHgk-3I6H;
	Wed, 16 Apr 2025 16:35:07 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5532-0000000A8zd-2AxJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 15:51:38 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54996d30bfbso6216095e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 08:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744818694; x=1745423494; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZQFkTG+TE9XyLSvBWPzBX545sfzGUulEWKqLFKYrkU=;
        b=bSBIYzeQHqxv23TUWHcklExGUt8007KSbavpBXQDf7Mij5TID8nkqM6Qcz0WowsbNc
         x/NGmBe7vApJmoiTXYw+P/wcIyak+zF24tHm3FjGMgcKkXQHrXRntYmQFSbd9gCkGogy
         qyMxgb3T1fqn95gQxOAfCkbQaOnLNcT7bBQ/pIP31TqE/7ZxgQwHKW/ryFEZZxHvDHI8
         kSEc1uHcgn0B7HY4aytXM0VD6fiAZUOjvQ8ZMQQKv6AhICqb48liZdaoOS7O8H08GfFb
         fcV4LurkNYdtuIyqzHBJ9erQAGnE97kNwbeyPpoaHbULJQPSfSXpVAWb4AXDuOM7aW5X
         uTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744818694; x=1745423494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZQFkTG+TE9XyLSvBWPzBX545sfzGUulEWKqLFKYrkU=;
        b=APKnQ5Kx3dpEcGVuRbNMOA7QfxT3/V4Tuep2F0VX5MbMzMmuDZwE6U4zEZPc78nfKj
         kxxB7qZPEdZFbmA8DWTvQ+gI73PKqEk7xKCqMd+4tzwGIqdv/52FOpzVP74FOxo+rsps
         QU2pDPXGT1zehioCEveAAb9OrqE3QOYgy8vVIxJNFC/t/qSELoj+rFmf/SIh47Of27ox
         awuNS9cj3Uo3Or9NguXa5Mjp2QH4Dp7ddFrHrX6XUxzNdzJWaCuWXnWngzcQTTeRWwCW
         uigkFueOLt5B9IswyB9kJXYTST03xst3X8+rzd99LDcufsK4Y6UXc+lj/ZJmKy/TFSY9
         r2Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUauNByGi6JD7o1fV6/uO5Z0s1Pc6JyfFAvxU7a815LtSybK3nvcupHybGBtjgHI6c9qlvADzUk2NrhBRLFkiEx@lists.infradead.org
X-Gm-Message-State: AOJu0YzzYiFD1Nh3RC2eJbu7qowfxRn7tvSaOb747rehHpZ8OB2JJ2Id
	z1YS661pOxbf0JxMN44VLdpBFF3uMII3Xp1zT8xySJ3Xf6ZNV6iEcQMvt//WJvgKOr35G9JoGGu
	pnCUFuRn2mou5k1DoXSJX8qQNKivt65gmgtjJPA==
X-Gm-Gg: ASbGncv3WTl6EnuyWN/9ouRU+ZsnJJp3IdfxeOLZ4+4YRZgOF1lwANse4J7NbCUEfu6
	xLoOwSUzJnozoxO6ru3cdwIGPkdjhcNg56BkCOsjl2tx9tNNnqREhrZ31+hEQ95tKK/SAvCZrpB
	QmEdgdM6UpjgqrJMIyIKfbpNszrspxh/FrAg6bETILF7hTym0ag7LAWKE=
X-Google-Smtp-Source: AGHT+IEOA9pETzEiwUlfAn6Sgi+fzg/ihyH1PJsUp8cWH2CmtJSYAu8VpLrjwtghIihEu2y05c8/xl7tyUGx2qaGSuU=
X-Received: by 2002:a05:6512:304f:b0:546:2fde:d2d9 with SMTP id
 2adb3069b0e04-54d64aa9f74mr849955e87.28.1744818694067; Wed, 16 Apr 2025
 08:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
 <20250407-gpiochip-set-rv-arm-v1-4-9e4a914c7fd4@linaro.org> <075b347d-dac4-4b75-9c97-f2578bbfd279@kernel.org>
In-Reply-To: <075b347d-dac4-4b75-9c97-f2578bbfd279@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 16 Apr 2025 17:51:21 +0200
X-Gm-Features: ATxdqUFAaEqfpWy-Gz1MlrWfTBrFjpknqD-4vV0rj7YLmXL5PjV9ze05bHY7Jgw
Message-ID: <CAMRc=McFDhTRV9Zgdu80u+O30pADNRTQEsM79XOPndyGEk6GOw@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: s3c/gpio: use new line value setter callbacks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, 
	Linus Walleij <linus.walleij@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_085136_756073_358862D1 
X-CRM114-Status: GOOD (  18.09  )
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

On Tue, Apr 15, 2025 at 8:23=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 07/04/2025 09:09, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  arch/arm/mach-s3c/gpio-samsung.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> This was applied a week ago, but it is not in the next (next-20250414).
> Are you sure you feed linux-next with all your patches?
>
> Best regards,
> Krzysztof

Hi!

This is a bit of an exception for me. As discussed with Arnd[1] I
picked the patches up into a new branch and sent out a PR to
arm-soc[2]. Once Arnd merges the PR, the patches will appear in next,
I don't have any ARM branch to feed into linux-next.

Bartosz

[1] https://lore.kernel.org/all/18d59ff1-a357-413c-bde2-961ae0c9b5f2@app.fa=
stmail.com/
[2] https://lore.kernel.org/all/20250409083513.21115-1-brgl@bgdev.pl/


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CEBCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 21:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/EfDBi2iuXg+iTflyjOQYQZOOuaeW3hYJUN8DQ5IUg=; b=1+2uEzK4gYqRXro2bxXMEagNwq
	gIRW6UoGq27uTWxlCOhORT7BFuC1IhXucK2ZMq6LpOzR7MPCYwq7DW4bNxNSDHbo6KqYaR0nIV0o0
	9HAOqYR+K+xBMAquU+eUSVduRkb5uMwImzHwH0zGjUJFBcvTnq64gjPLWYXE8SmAemIYDbSKKO5kJ
	ZT8EPKFepdg6LRKgQfq2u9QRdCaTCPH5bo6aAy5rRX1X7guaKfrLelKYmNJYuImJVwknNWi1D3qXb
	HQOSCpCbxhyDb5kbotM8g6rDfM7dD885vlTm/P4mS7GHaY5zi13sOEnhIivzPft7B78dgTSRgQtaE
	pmgZvcww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2ysQ-0000000072V-3zJT;
	Sun, 28 Sep 2025 21:24:14 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2ysO-0000000071d-3Nlx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 21:24:13 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so59346405ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 14:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759094652; x=1759699452; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/EfDBi2iuXg+iTflyjOQYQZOOuaeW3hYJUN8DQ5IUg=;
        b=jP5BcjtEFWBMbX2RNWHsd2k9GeXR5aHciBf+oZocDw4oyYjbfzUjbrGmlDhhDbu9Ry
         8r1Aksy1bIo65Mm04EZYF1uKB0XQj1cMYKXC/YIBP+1cIPZbuDfi15Fj04Vgy4UP/uKQ
         1iBudP3E9g7yCPP07VuuxRvksvbVHLn9rDdO5FC+xRLjw4S93LoEL0+JojpO1Ax6okDU
         UkvfpFHP7WvfxQDICo9/lyvR5E9YDMy284PQ4rnJ8HX75aQ1TJ90fZhXZhlm8e2KpngY
         dKAVcPCOpmQ8C19S7MkXSw/ui84AYtVVz8Rn7E4rgXM6DS9wEb/l5ltYxWdsaXQDwFNe
         dzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759094652; x=1759699452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/EfDBi2iuXg+iTflyjOQYQZOOuaeW3hYJUN8DQ5IUg=;
        b=OpPawMCUSUc50K5NXav8A1ouXY2ue3ALaEUBJRJWesZhEvE0UlrxPalExAv/tB1q3W
         OBsoAzemznZqrOrkkzezR69Bq5XuZeEbj40cJHpgDR2tfeJc2FDPkeA7WQjo8qwEMf6b
         YeKwDw0ifQIcuml6sBUmu/Ke2dhIYjHXub2ugZogtEF+M5LuCmNcAVBqBEkUz0K3DdW0
         rb6QMpb5b33PAPwcC9voti+lvfuy0scg8WCNh10GdnQqQAXgxsIzn57YjXhKTGSS8lSZ
         c4dNZvTdxhsxHuFmAAtTzHZ46TwoHvM9h9SYZ0vuzxXhO8AXfuU3i/NYZMPmYoUeOzC8
         zOag==
X-Forwarded-Encrypted: i=1; AJvYcCXe5+2juatthcYQdIBjpYEC6lyO7MyK+MXAnBRTYFxVnzSUoBnrfHqLf1QZpCtAhBTfsv/N4HfaWjgSvnWLi6or@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf0REp+RMOgYpwDt9yR91rbK/7vW0Mgxo/ttBCRDTQHPqkhO6D
	vVWb07mFLEtzTeMxQpoGfVc7c+JrKMqICwgYHUTlCSifyrWlijJvqU+IZXfhHM5QLVjgZ76cbMA
	veleqGaI64sylf8EfIfdW/Z0JxRboYERSag/t
X-Gm-Gg: ASbGncvoFlIk0BrP9ivpwWLuX7d/3E4sVSo3JOFFSZinw1gzHJrdQJ7cE7RsLmkCf0f
	k4gA20DTtbtIU59ja6gU0BdIaHbXelkBsuRxjJHbY1/G3kt1EMZ583Dl2lJ5Mn5nRSYD0lZpSKD
	vO7+iYMWut6UPDWRoUnqWXvt9/UovZGU+EKgEiG40hlTAmErFUrNeIrgLaKW5n3NsG7fa+Sb1Zg
	pGt+orzKneiHRSQBQaFuQ9atcZVwJ/qbH/RhuvO
X-Google-Smtp-Source: AGHT+IGYeAH/2koMMwWRpMeTjHt3nx4vF27nPj6cQxfPYTjKMshJ5FnJQAOC0KdwVHl9l4KPM6h4tqlgjIdg+H3Sves=
X-Received: by 2002:a17:903:19ee:b0:269:b6c8:4a4b with SMTP id
 d9443c01a7336-27ed49c7798mr160858095ad.6.1759094652033; Sun, 28 Sep 2025
 14:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250927130239.825060-1-christianshewitt@gmail.com>
In-Reply-To: <20250927130239.825060-1-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 28 Sep 2025 23:24:01 +0200
X-Gm-Features: AS18NWDzM6EO1Jvv--jbu1zBUk9kHyWLoS06NGipbYnYIhNafpGwzdVcGq2jayY
Message-ID: <CAFBinCCsTqsn06A5oVXGTW6PgmSQH0bHE+8PSftyWNRAbYUTcA@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: add support for 2560x1440 resolution output
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dongjin Kim <tobetter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_142412_844746_89C1F47D 
X-CRM114-Status: GOOD (  14.52  )
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

Hi Christian,

On Sat, Sep 27, 2025 at 3:02=E2=80=AFPM Christian Hewitt
<christianshewitt@gmail.com> wrote:
[...]
> @@ -894,6 +908,10 @@ static void meson_vclk_set(struct meson_drm *priv,
>                         m =3D 0xf7;
>                         frac =3D vic_alternate_clock ? 0x8148 : 0x10000;
>                         break;
> +               case 4830000:
> +                       m =3D 0xc9;
> +                       frac =3D 0xd560;
> +                       break;
Initially I thought this was wrong because it's only added for the
G12A (which is also used on G12B and SM1) code-path, leaving out the
GX SoCs.

Was the 2560x1440 mode tested on a computer monitor or a TV?
I suspect it's the former, so I think it expected the code to take the
MESON_VCLK_TARGET_DMT path, which automatically calculates m and frac.

I'll give it a try on Friday as I do have a computer monitor with that
resolution - so any hints for testing are welcome!


Best regards,
Martin


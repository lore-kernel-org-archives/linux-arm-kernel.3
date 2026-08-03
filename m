Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE315C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULsy1ctbWqO6V2elk1FWgzGLxyQfY/VXo4lHMIY/JzI=; b=m9p1PCHKxaFyr4Ycasf9SA6pI4
	BacA1wgvN79wkMTYFrJNaHTiejha0XrWeXYyLu95/lblZ2xCBFeKvCws3dTmwfVT2Q5YVC5sSXLKy
	LUFljEuVCOadnHu9a6BosOY+83A81eXoNAQ2i0UnAoxi9kNc5J0K7o4+8sjb+ysD6Yw97362E88sr
	jsUHfwL/glr8q5Z1TezZ2zVI4xJPZyk/TLh7ZOUHl6Ikiy+aW63tQQCCClza+1TqTZczrHQU69B92
	Jg95KgNmLVLmkxVEBcLtw0FW1zUtwRhKvwbrvUF0nuKrJl25g9gDUhWYfxzfvQUq8RVtpBD2Etw1r
	8kV5A6cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtg2-0000000HOT1-2SCV;
	Mon, 03 Aug 2026 14:30:02 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtg0-0000000HOSK-0LCo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:30:01 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-69c5fda04a8so6081544a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767398; x=1786372198; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ULsy1ctbWqO6V2elk1FWgzGLxyQfY/VXo4lHMIY/JzI=;
        b=HfNg/FTFGku5T/It0oDvyn6AA9sQyUd5xU/oWVa7QHkEiUtmfdhDwpJ23Qr+mZwMhP
         CAP/y6jTYiVgnS7Cem1B6Io4bnCJ7U80RXEpMDe8tMxLKFb0yQoXmR/oA8gJoR0TlMgs
         k8edeSeQZmX/LTXr6bIuPjytQJFz43aDlpzb8KM5zQeNOKLm3fWawFj+808uySRJRuh0
         +bEI6StZr6Lab7xbaGcpvZhn/Nc6k9hpjmqHKqQuXzNhn4MyIAszFvS5RnmD7lrGFZtK
         fjAtxziO+YdobjS+PtbvADhIEDzBpfdoTYaNaASovj2MW9XGd2oBlevSOGmED6KtlZLW
         gExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767398; x=1786372198;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULsy1ctbWqO6V2elk1FWgzGLxyQfY/VXo4lHMIY/JzI=;
        b=DuItH4LTaDO6rmzPDHxSYvsaM+8uBK4gjo3ng3iCqHWm7U9z/4libvAGCF7nNzrT+q
         T3V0PFiopyQH2kFgc5d8NZTYRqAYEK8+SVH4jLoYdRYldk60+d6fzitt3Lh+9ELK85lL
         8sjuk5zKGoy3/BBfjkfz6O/cUTFWOJ1D6wd/rBU/Mf+38kiHu9VjIbEp4lhqDpGOBWlT
         k5u+71TFpmUeUXrsZJyQt+2oAR5+K6OV1X/g7PpzToNfPym3m6wzD2RYSM/m1CDqxBzp
         k4c0+hC1ZZ0yT+1/vBdxQOSQLiVIqelPto+1wC8FvIreILZKiFdCC+M2M3A1pWSikaL5
         +GVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp910PlIuXaL1dZVFNjB4ZuNuuyyhpd9+eskCyZsbArHs6LzkY+T3WzjhflV7QviK8Bar+z16Wg+5WPVKwqAqZI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4aQ4D/FzloiLm3Y6VK0mC+Os2yFDTSls2fQubebvYHWJ4JTRr
	vWXCQOIVyKahrXiH8od/v9g/TwuNfS0zVsq5kG36ifao8YfOuXVxmdDA
X-Gm-Gg: AR+sD10eXJC03WKmxAdoj2HLGYkxZgdHQC0ZPnmV+pD44C9ETXE93oK5Cme8oaGRk2D
	jMdkbW0Pn9OlB5GnlxOpuS8cSKg8Ym+3z3NBVifOjJoaTgRJh+iNqpbzt7Ezx1g2CiYuCX0gCdM
	ZAHAQHNw0oC963Hkvpb1eNzcP/AhIvx6fzuyx2RtmtGknRPKFeZD4DMmDCzhGLJ0rOARpOvZzDA
	j+933EZ2tRyA1a99JQcogkqNa+J9skCHzCdQusuWZcKoTlFh+7KhJTPu0SCZTHE9SpHE2M6yUt2
	eVBqR9SmKZ6KPtwdbekUfUTWwkUsmd4IIXnQuSKvKObpVxOReuDORmCacuP/rUcHlxpvCje7TMv
	Mk1RB2mLCDfbT0moGIp/D0GNq4GYQBVbSw4ysjYkivcliUtTZ2fccMgPKFHy5bPuwRQ0MpyNMPU
	9rDcD/mTsTN28HiK/BNWOSNPiRXhHKBKV5AFw1H9kEk14r7veQv6HXuvaWaY311K7itVU/idFG/
	JBb1FbDE/bu6RTU1CNLTnhU150XcPct12mWhFq+a5IXWmnPDmg39UOPFLjKpruKYoYBpNg8MUKs
	w1hpElyvJMX7gG6tTZmSjXIg0MK1So+EqlT/2a0P0i5vtjC+TSHWuWDSKadJcqu59N2vHUHs2iO
	OfwRiLQQlFkb9u+D8aTq0ggWlgagmlaGm74unL+6t54ECQyymMAUqoSjZ826TDoHI+uFmvkTLOy
	5SEEeNf1U=
X-Received: by 2002:a05:6402:21ca:b0:698:c13e:179a with SMTP id 4fb4d7f45d1cf-6a0a7c72678mr7302242a12.10.1785767397382;
        Mon, 03 Aug 2026 07:29:57 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-68.dynamic.telemach.net. [86.58.6.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c63dca6sm5741293a12.16.2026.08.03.07.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:29:56 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-sunxi@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: framebuffer: Set mode_config.normalize_zpos
Date: Mon, 03 Aug 2026 16:29:53 +0200
Message-ID: <lyqNcSMNQtSAKCGG4XMGOg@gmail.com>
In-Reply-To: <20260803111319.2836240-1-wenst@chromium.org>
References: <20260803111319.2836240-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_073000_156132_9E79FD3F 
X-CRM114-Status: GOOD (  11.53  )
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

Dne ponedeljek, 3. avgust 2026 ob 13:13:18 Srednjeevropski poletni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> Back when support for zpos was added in commit 47a05f4a68f9 ("drm/sun4i:
> backend: Add support for zpos"), a custom atomic_check callback was also
> added in commit b8f1230dd3bf ("drm/sun4i: framebuffer: Add a custom
> atomic_check") to have a place to call drm_atomic_normalize_zpos().
>=20
> Commit 49efffc7fbd4 ("drm: Add drm_mode_config->normalize_zpos boolean")
> added drm_atomic_normalize_zpos() to the standard atomic_check function.
>=20
> Set mode_config.normalize_zpos and drop the custom atomic_check
> implementation, which at this point is just a simplified copy of the
> standard one. The standard one also checks whether async updates are
> valid and updates the self refresh state, but neither feature is
> supported by this driver.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej




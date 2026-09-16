Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5E1C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAYn1OR/urJcX7Y1PYkiEnveKTXrW8w2C8NfOif91L8=; b=ah96ct/1d5ws3BrfaJUL/G3u4v
	8u8+2b99RN5t8mCmZz6PO44d8WyHe3Z9jOI7FTf3venDV8g0JoosWoa52AdqLsmI7UrvRU2Xvr5BP
	4hjythohrKpN0g9NajeHSYnveydwkVD47Mkc0+8qOR61G1RpGMPgSFgmBJeuSesKDNjMvzwRap/zW
	U32zEl4E5Fky7utyiJDSfJuVuAgZC/7fdHa+9qWPWXZsnpq5HyRbnYEMrNmnsqy3jfey3GVmpELGc
	OgQOnU0J0rQfIS7DpLNrmjyaF+us2fmqXJdsOpWr3oraICVIlSvVqW/lAIrUaOavudZx2Gdm1W5Yc
	VrpwV7gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6m9j-00000008sFc-0tJs;
	Wed, 16 Sep 2026 09:42:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6m9i-00000008sFP-0Vj1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:42:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BDA7E43ECC
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAA41F008A2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789551737;
	bh=OAYn1OR/urJcX7Y1PYkiEnveKTXrW8w2C8NfOif91L8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=DIBXyWb7UH5fiTMzXNE37a2F+G9RIUwumVarRFiKNAZBsd99X6vZXzaa9EATH9e0P
	 /+ofei18bmy0VfPJC4iHaMTvZnQs6kyqXxu/UUHKaK385/aV7yYjBIl+xBhHJ2mGIE
	 14L0i49LA/xQPxgMOQ2waI9AzgehLyjrTCAln0GBeyyu6a3JEZhq2sW6VblSycwkn4
	 T1zQS4e1h7dc7R123LzQUJzZgyqxLihnLBPKyg7YHcpmc2prefCKoozmsXKfkTlZNT
	 D1iTlKgwEuKzjP413TGKYMB8MMlQq79pjYd/phOTBhUcUZgVzzlHRBvpGchaO5BRPV
	 581T61ApkigvQ==
Received: by mail-lr2-f38.google.com with SMTP id 38308e7fff4ca-3a306a4f797so5548471fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 02:42:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBznShDPOmhacoPqqct19esUNVFnz1tH/zDlmBLDK7eFzU9DASXJUwblU7jHoPfySFn2ogV6eU4dhSovf01B5WXp@lists.infradead.org
X-Gm-Message-State: AFuF++ltlAkVmMY5JMqJjc9kC7XB6AFMyNuu5fy01As3OKUz7nk9L5Z8
	+LtGxkiwScQkedCcOqhzfEq94prfjgFX31JDh/QPrQ7nRWROVqkKI4UmjeGQpARvQnVKDgaDvip
	oQe7e7QxRkooDjQK9OEusOEq/yMfPKfvnUzYAxb7m5g==
X-Received: by 2002:a05:651c:2107:b0:3a5:bb28:3324 with SMTP id
 38308e7fff4ca-3a5dca282a3mr3987981fa.28.1789551736240; Wed, 16 Sep 2026
 02:42:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 09:42:15 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 09:42:15 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260915080501.329424-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
References: <20260915080501.329424-1-mehmet.fide@gmail.com>
Date: Wed, 16 Sep 2026 09:42:15 +0000
X-Gmail-Original-Message-ID: <CAMRc=MdmqkG02q=4_wJAVjeBzP_8KqQWNx6cBaL=FUTn_wxw-Q@mail.gmail.com>
X-Gm-Features: AcwNN1UbxaY2LXeizQ7uYjEouexjsvFGbwv4lQlNYZHZGCxRnPnk9_dWQHfZ6g8
Message-ID: <CAMRc=MdmqkG02q=4_wJAVjeBzP_8KqQWNx6cBaL=FUTn_wxw-Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] gpio: mmio: report the line direction on chips
 without direction registers
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Haibo Chen <haibo.chen@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 15 Sep 2026 10:04:57 +0200, Mehmet Fide <mehmet.fide@gmail.com> said:
>
> On trees: Linus offered to take patch 2 through pinctrl, and patch 1 is
> pinctrl as well. Patch 4 gives wrong answers without patch 2 (an
> undecoded pad register would seed every requested line as an output), so
> I would rather the two pinctrl patches land first or in the same cycle
> as the two gpio patches, whichever way you two prefer to split it.
>

Linus can put the first two on an immutable branch for me to pull.

Bart


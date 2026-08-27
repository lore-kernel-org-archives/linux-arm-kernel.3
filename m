Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B265C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 07:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9nnWcgoWlf1wj4Ru9lPZhKoaI/HWiFsPFG1d4YLYUs=; b=0Fq4WfwB5WdJ4qivYIUvQvSH4U
	FrMVk6+8Wq/Udqw2pHAubMFuQjXv/2UTMB89yXvPJBdcf64h8R9Of9VpVKIgw4Iun3ACRzAr0Qg5+
	VdsPdufVhObXVGP7SVSYNM7+4YhoIDGlLkk/5SCSXLs77VdZ4uykFh9KwRzCnPMmux+Xr7KtIL+13
	EzTwY3vLLKMsiS3j4wQZpSxMjtTv/bVtz4sk5lUhrRQyMkqGlvHt6IZ5Irj6cwTbDo9ar6bgoWMv5
	eVoPJsdu79dnQaAT2mhrWWXpVkwVFUY94qSVhgwtgJXISYW66wzXDYDuwsuuXwtaN85xmrTkH5iog
	swwKLsNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzU8y-00000003WFP-07gj;
	Thu, 27 Aug 2026 07:03:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzU8x-00000003WFI-1NtY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 07:03:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B67A600DC
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 07:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA271F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 07:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787814202;
	bh=W9nnWcgoWlf1wj4Ru9lPZhKoaI/HWiFsPFG1d4YLYUs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f1slLTVK5sOuTkChpV90e3DKl7/kNzM1KMBwHGZQZoUyyqJHbNTt7MGeP1sZ0F8cs
	 KlPAXd3JbinXyNx3rIbZqPVU250WgGTFTVZJr5T754vN4fo8XJVligXsLwUBkkVIYJ
	 MppRFWD4osfzNVlvQlKiFCbB0p0U5YQ70ILiLBKlWEcg0TUzPhM6EIvTwnqYfFG7KB
	 F9f8bqudjwaCsUT4aekgCLh7HuBlHwwKWSYiTy9Cy4rC3V123cwjv/M1nSCweoD1XY
	 srY3qAbdk3maGHb3o//bAzFX/fB4t5xHp6Q4wZTzBX3Jj6iL3JHqsSiUOnSGcCjU3t
	 wFyjWCsT7qXSw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b4740ec30cso1519425e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 00:03:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpl4EeioYguyStbuU5WttAarIUqwPydhvCHiAVISsSRhI7ENKOXwgIVC4JzwvK1ft9TrlQE7PamRCcQS5ukGtvS@lists.infradead.org
X-Gm-Message-State: AFuF++mHH7uWZqrRlNTUcY3HN9OVqEkgCgzwgqz2GbmtY4K6WMFUHCPv
	NdJA1X/f12ZP9WLzwlRmezrFdUxcQr3+w5vhTyxCTX65Flz7uzpEqcvXVTOX/DRStY23vXCHde+
	l3NTicNY1dIQlxRKMWM7dCjX1AQkIgT0=
X-Received: by 2002:ac2:51d1:0:b0:5b5:e263:dcc7 with SMTP id
 2adb3069b0e04-5b5e263e266mr28670e87.5.1787814200712; Thu, 27 Aug 2026
 00:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260827013634.167932-1-rosenp@gmail.com>
In-Reply-To: <20260827013634.167932-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 27 Aug 2026 09:03:06 +0200
X-Gmail-Original-Message-ID: <CAD++jL=8OfNw_uBoJNphoJXZvu7ws-9iUBYy-Z9=YOp0XA7mqg@mail.gmail.com>
X-Gm-Features: AcwNN1WGux25MIiGrEnw-amtAQmQ3YQ-7vY1ZVAQBSZKJAotasia4tMjWPJsinA
Message-ID: <CAD++jL=8OfNw_uBoJNphoJXZvu7ws-9iUBYy-Z9=YOp0XA7mqg@mail.gmail.com>
Subject: Re: [PATCH net] net: ixp4xx_eth: handle probe deferral from of_get_mac_address()
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"moderated list:ARM/INTEL IXP4XX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
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

On Thu, Aug 27, 2026 at 3:36=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:

> ixp4xx_of_get_platdata() returns NULL on failure, which the probe convert=
s
> to -ENODEV, discarding the real cause of the failure. Return ERR_PTR()
> with the appropriate error so callers can distinguish cases such as
> missing DT properties (-EINVAL) and, importantly, handle -EPROBE_DEFER
> from of_get_mac_address().
>
> Fixes: 95aafe911db6 ("net: ethernet: ixp4xx: Support device tree probing"=
)
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Thanks Rosen!
Linus Walleij


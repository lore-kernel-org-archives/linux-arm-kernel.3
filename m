Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BF3C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 19:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWXT/WupRqW0CupybvTkEKLCMDuWAmD/tW/zMc48HoA=; b=gQCzhytAhS7/41Zrb/7XTLFedz
	YyAY5EZMuPj13ysi1n9S5Cms6JjKlxnigwUHL4biBaWtgxtcFwTUmkquWBGS1vc3XekhzDjI0ywS9
	8ZMgFmpfdhd7o1W3hS+z9lJkAbvsSxUFak+YZ6QvNZU2f1WqlzeXZDG/aMN7paUwl2r14ljJHrRah
	0xjfNZu/PMDlP0gZ8/zXV3dPpA+Dhu/9Nf4qILCT4y9LAIH5bcORyDMod++be5yd+NsZ70QOVHaXx
	mEBgN2+csMgyBIJ/sYs8jh4K3jUfOikDWSgzUqQEFt+CtWHQSpE9DvtQqjyreKKq/bQq7tQDlQpYn
	etGqufqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJztu-0000000BQGl-21UY;
	Tue, 27 May 2025 19:23:50 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJzri-0000000BQ65-1ZGG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 19:21:38 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-4e58d28ebb0so405980137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 12:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748373693; x=1748978493; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWXT/WupRqW0CupybvTkEKLCMDuWAmD/tW/zMc48HoA=;
        b=ViUmQZORx8oOIZn0QA/dCf96Wt2GIhcx9uc3m3oTTIgH2I4ZlyqVS06fsQE0xKDAhD
         oZE/BWD1WczSXCYRqYKW1S7i0hTurqLPIcOobTiPp2Iq6L34hxBIfL5fmzMSZSEucZXT
         FP3DOoRXeBdFLuaR0kBQ6W/JJ2OTRLsQhvZzM+ftUmV58mYtITko4KopP1FPa7F1G6Ko
         8qw2OiGeDY/AjrM4ayCD6hiJuKlXEilKzkltTOAx4H1rcAWOXyar1ICa5YLNCWpD7SRG
         QWhftFwcZG0T2nLB3zKHGiDwl8hciI6aedwpwfUd9F8VgxzaEEv+SXyLsOUQWFxUFdeM
         FadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748373693; x=1748978493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWXT/WupRqW0CupybvTkEKLCMDuWAmD/tW/zMc48HoA=;
        b=qoOzpKdz920/uVv+gjiHXWMR5tjVzosL5q3aRewj3oJ2z9liakaB5xyCy5FRmniGYa
         2hqZhJx+fP1k0oFHiTqt80rD2OaDzD2Rbq75VABRBy41JXhABcSmdohNDSz1RC+ICNP6
         0/1HC8YToHe0kjEHc7G8j/VKLmKq/9cXWgAWbI+5smTkp6TY3lnPc0lqvNKP+WCXZprF
         KZoISyteqOpMWXtbXzX9bn+0KnZRu1/K7vPYHV7gnZmXbQGP4Iinih/mJkM80fjT4aoD
         KiIX+xmUaLqiztwtA/RXK41mUB7A6eXJy0jh1gdSW+uhed8Opk0sl2O67I4V0yCqQKqE
         GXbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzIDX9Q9fpj5FBJP5EE7R2IhZofrqIayq+iOLh8VVt/Kk1HajHDkfZWXlzEgVrLX1tBuCM83Vsswvnua7znBVh@lists.infradead.org
X-Gm-Message-State: AOJu0YwKMwCKZg/K5Qel7LYkemBHW8Mg3mnnFsS/Oo+f84NnZXpmmGWV
	xgQ8PM1p1+S/AsxHLuaCUeuJvlod81ypwCMYaZRQsy52l1odYLaIoqWBFJq5Vy4T/dE8Dn9WjZj
	GheypXa9MFWfXV93Vs6Vkihyw6hemKwg=
X-Gm-Gg: ASbGncviYn102l+whz+Sgefxcv2zSgsmpnqNddTMN/dWsEcVs2C6s0oiK5TCZM/yCTw
	ZWZ6Z2NcZPQAWgKXIMO4A8p3+qyBv4gQJpKR6eYvy/uwZlsccltYUn9OP/LjoiRNKXOC6L5hksS
	jDBASW8BxwhJHtxgUT0B+Q1oJSclJ4f6YiBA==
X-Google-Smtp-Source: AGHT+IEChjVJAaQHlGSjHa9hTKxCJFyJzR7c9+aL/0QxNkhj4bg8SHCtIwSUXtZJZi5/vjBpZfQlumATcldCYDUWxqA=
X-Received: by 2002:a05:6102:290c:b0:4e5:9c06:39d6 with SMTP id
 ada2fe7eead31-4e59c063ae6mr471806137.2.1748373693026; Tue, 27 May 2025
 12:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com> <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
In-Reply-To: <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 May 2025 13:21:21 -0600
X-Gm-Features: AX0GCFvF6Ti9-VC-WdHc6MfKeYhf1F3qOQDDP4BI4jj848sa9rzAvWhhkHP0KPs
Message-ID: <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Furong Xu <0x1207@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_122134_409833_2B179D46 
X-CRM114-Status: GOOD (  14.39  )
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

On Tue, May 27, 2025 at 1:14=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, May 27, 2025 at 11:55:54AM -0600, James Hilliard wrote:
> > Some devices like the Allwinner H616 need the ability to select a phy
> > in cases where multiple PHY's may be present in a device tree due to
> > needing the ability to support multiple SoC variants with runtime
> > PHY selection.
>
> I'm not convinced about this yet. As far as i see, it is different
> variants of the H616. They should have different compatibles, since
> they are not actually compatible, and you should have different DT
> descriptions. So you don't need runtime PHY selection.

Different compatibles for what specifically? I mean the PHY compatibles
are just the generic "ethernet-phy-ieee802.3-c22" compatibles.

>
>         Andrew


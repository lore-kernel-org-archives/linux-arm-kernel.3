Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F517FD4F31
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 19:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RXGLrQA3PHUbiCW7ahzY4YSUNLcaCGRz11hbC2SjiDs=; b=n2xXZhtWGFfqzH
	c3NvwYjMy4RP4e7Kt7UY7PAJZHVsUyRpYLfLnmPjJblamV5HWmq9c0CRcus4WIN16SDb6jzQtQO6z
	Tfiq3mRzasXTJelihya9PcqIcbmuf2XmK7egfxqxFch/KSRu6rDH9JuOp6rLFlr2Nczl0jFX+pJ/2
	8Gr54WfnfGJvH8cIHDcwbmFowoqc8hN3En2NIkfOeCdd/M38rrKQzFyemA5sqJuOkUL5XsP76zxQc
	jjRD02F6FFz93GNV3Y035lRKtJ0fp64MXqgupZB7foj47pQNBcsiwSw0AFTvYwCx2lmRBA0F1iACw
	jDEbif0pLXeeaCQGvfYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0306-0000000AC2O-1m0o;
	Tue, 10 Mar 2026 19:44:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0304-0000000AC20-0IkY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 19:44:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 52BDC43903
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 19:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F73C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 19:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773171855;
	bh=6gYqmZjlIbK+gPex3tBu/8cgozPF06E1IvkrFktqKlI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=nbQ9T1brX9pJKz/vtQvzXAHLIkpTRia1JMbtBRynw8i66J8Dei8l3IqWHz8dSITHw
	 ri0b/ikLIuh6Ob4ShoqE62TspoBVlMbSueThvUXz9fL/PpRxIVDV5Z7p/G8XblbWjI
	 KqjTca6LrNli4ZHBkzQEEUtKetGu/CWsaJy6blSPJPmt8ocI3uK4J/Z8opAlSdo0jp
	 X7BcVfkAhksgUaydIxDCgVYbMBYhU2KhaXT/g+TEpSTqyRRY21T6tc+EaJ80LHs1Mi
	 IPgpNeIT1PVpIt7F5vfvra3yj66lB2P0bIsvZIEaJoG/93rJ5xAZn+7GIs5QoqxTWN
	 ypt5XRGDz6WqA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38a23cf08e0so80319021fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 12:44:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwxEWakVKusk/zRQnvoUYgPrZyj+RpuzH6y/6uWGtH8q6v2FXWO032Hgw9SCoAxdo0iXCRDgt+lvfpk1Jag7eW@lists.infradead.org
X-Gm-Message-State: AOJu0YyMBjnwWj8qKkpZvq4YZN16uiYIZNKF9HaM7+WW5HyJAOWhBXAM
	e+YmexksKfcITUpheIpJnR3C5NYY5U9sJiYq/YhiZkG6NeKa0S/jDhOElBb3KpPWUWRsbiZQEIO
	KqaDBuhqrniWGz7aehfWJ00sD2UHWcWo=
X-Received: by 2002:a2e:8804:0:b0:38a:29e9:d29f with SMTP id
 38308e7fff4ca-38a40d6c579mr38932071fa.35.1773171853511; Tue, 10 Mar 2026
 12:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260302153559.3199783-1-wens@kernel.org> <177317166704.379398.1719490251066452420.b4-ty@kernel.org>
 <f3ed7b81-4e43-4baa-8a56-b18fa7f56436@sirena.org.uk>
In-Reply-To: <f3ed7b81-4e43-4baa-8a56-b18fa7f56436@sirena.org.uk>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 11 Mar 2026 03:44:01 +0800
X-Gmail-Original-Message-ID: <CAGb2v65TyEkirWpfynKnSCiuOAyTW1FZQyXncnTFEHGGOQr_Fw@mail.gmail.com>
X-Gm-Features: AaiRm51nLv5COwibdiI9vPOV_lAA38Sg7w2SopLeh4Y8wY_dnKu78qEnGgK1HgI
Message-ID: <CAGb2v65TyEkirWpfynKnSCiuOAyTW1FZQyXncnTFEHGGOQr_Fw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] arm64: allwinner: sun55i-t527: avaota-a1: Add SPI NAND
To: Mark Brown <broonie@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_124416_148138_332DA743 
X-CRM114-Status: GOOD (  11.29  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Mar 11, 2026 at 3:42=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Mar 11, 2026 at 03:41:07AM +0800, Chen-Yu Tsai wrote:
>
> > [1/3] spi: dt-bindings: sun6i: Allow Dual SPI and Quad SPI for newer So=
Cs
> >       commit: e2f93f45d38f7b6dacb44203cfc7bb5d7e287b8e
>
> I'd have expected to take this one?

Normally you merge patches pretty quickly, so I thought maybe you weren't
going to take this one.

I can back it out if you want to take it through the SPI tree.


Thanks
ChenYu


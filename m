Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1E3C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 11:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAV23ibcQMvv75aNFNBuJ4ew2A9O2KMZ5/PYIGEEavM=; b=zyg8VF2jaYbcXdAKDVxZiHJagB
	mh66aBEMt8hOp2pLIyCg34laJoELjTxYdZ7PB0uRoV9hbC6jJQZSBTuttgrl8Aj3yJXvcTBM0RmIE
	mxjefPBOEebfirUjA5mXqSvCGXDsa+8B36jxPG6XM8K8He13P38T4vxFvPqeDC8MmXapCtAi88n6z
	jx12679CT68T30+06AXmEIRwu2ZmSihHmGvY3gwAh3DmdKOMarS72CtxvmraPf0GAhbEtiruZQfIr
	Cj1F/BOCBrBHxnH6T3+eDMk0Tt4vHM2a04t9Jq7IZM4tacK2HRcwn6RGA/UGjfply/2OHuXQvUxxs
	GshTcCMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcN32-00000002C3Z-1qyr;
	Mon, 27 Jan 2025 11:12:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcN1j-00000002BwX-44k0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 11:11:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AC7DDA41383
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 11:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599D3C4CEE1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 11:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737976294;
	bh=QzWIcfoUu4/gTEfIKnxjk/E8ZEHvpvzqvrQc4/Dp2fc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fr9cVVFH23KGKh5kIPUgIvl5oVy4Vpg5pTgePjZy7ASv+wI0GTqv4Odm9az101znP
	 FP96+HXcUboXZm4tu46qOotyFNkQHPTrQSFuCq5r6K00b5r9yAd1GcjDCkOp4pKhNO
	 4z0Oak9WyaTBB98hadgase6seRwOTiugXL/fxDHYsDghM1w5/jwEro7plRcFL+Nxvh
	 drO4la4CbxNvyVWs21xIo0mKXhbzSI4+MphIPjSvkLgzVSEA94MS5XPQEFF5gxYYYp
	 C5Lgpw7YYmrPnzuQG594Wo9fvr7jKp5ZJ4bUW/KCkUDRv6okqwk4/6WYh4/f3YKurl
	 HNBmcNmGzoNNA==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab2e308a99bso844810566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 03:11:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPElzDKHQDKsifh76gJCWTP6mNYFkf+ykJRno+AdNUJL4GbRQC0ph4NkQR8B5lIM10RUz9kbt2CV86XeJrhkmS@lists.infradead.org
X-Gm-Message-State: AOJu0YwSpUYhtCkXsQJThGTVVQD2wVm/S1SjjhvPGswc4nNWlcfjd+ao
	JTSpCXbJHjM2aqiP7yVmf4xUPpd1rav5Z2Od/qMx5h5IAF+B5GycF2dqEqCiV8+eM/AYyJSpm3x
	qzQpQmT7nBx+5IhjQvbs4r8RnmcQ=
X-Google-Smtp-Source: AGHT+IFW34bx+TvwETM2bWIhS/ttR/C5lgyWGoTlj/cjsPy2ouNJ3mTayzMCZgiBRkUQYm0oh6q1eg+j2GgENyL6FiY=
X-Received: by 2002:a17:907:3e8c:b0:ab2:f6e5:3f1 with SMTP id
 a640c23a62f3a-ab662968433mr1675237066b.8.1737976292927; Mon, 27 Jan 2025
 03:11:32 -0800 (PST)
MIME-Version: 1.0
References: <20250127092450.2945611-1-hayashi.kunihiko@socionext.com> <Z5dXJ1EIUx8DAh6J@shell.armlinux.org.uk>
In-Reply-To: <Z5dXJ1EIUx8DAh6J@shell.armlinux.org.uk>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 27 Jan 2025 19:11:26 +0800
X-Gmail-Original-Message-ID: <CAAhV-H78fbK+jAsootOaZW=eQ3RPna3VQTxHd33vDSueYkyYtA@mail.gmail.com>
X-Gm-Features: AWEUYZkSqEExKEOJzEl1NVXZboUYivpjZE39q6fB7IQV6e_xCVeNjqqX__GrteM
Message-ID: <CAAhV-H78fbK+jAsootOaZW=eQ3RPna3VQTxHd33vDSueYkyYtA@mail.gmail.com>
Subject: Re: [PATCH net 0/3] net: stmmac: Fix usage of maximum queue number macros
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_031136_139680_35C8D884 
X-CRM114-Status: GOOD (  19.38  )
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

Hi, Russell,

On Mon, Jan 27, 2025 at 5:52=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Jan 27, 2025 at 06:24:47PM +0900, Kunihiko Hayashi wrote:
> > The maximum number of Rx and Tx queues is defined by MTL_MAX_RX_QUEUES =
and
> > MTL_MAX_TX_QUEUES respectively.
> >
> > There are some places where Rx and Tx are used in reverse. Currently th=
ese
> > two values as the same and there is no impact, but need to fix the usag=
e
> > to keep consistency.
>
> I disagree that this should be targetting the net tree - I think it
> should be the net-next tree. Nothing is currently broken, this isn't
> fixing a regression, there is no urgent need to get it into mainline.
> It is merely a cleanup because both macros have the same value:
I'm not very familiar with the difference between net and net-next,
but I think this series should be backported to stable branches.

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

Huacai

>
> include/linux/stmmac.h:#define MTL_MAX_RX_QUEUES        8
> include/linux/stmmac.h:#define MTL_MAX_TX_QUEUES        8
>
> Please re-send for net-next after the merge window and net-next has
> re-opened.
>
> In any case, for the whole series:
>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>
> Thanks!
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8C4C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okTMrHZiP0sVY1prxXrRl26i6JyH7ulay0Mr3CLRG44=; b=3EpXHHy4iskDCeLPRQAndNqtPr
	0nvYp/SsIJF8+OrzlrOZY9daVwKjGhfc4zMhR7jg8gZPE3y9F3hZX+UpBgjKFyDKF3fB0FyfW6SOa
	JJ57BrJe1FCnOSsWcmfPh3jyDU1C/qVhglBGqEhauDHN0Xd5IKBmYLJFxuOfNxQ7beXAG8baYZCp0
	/IopWZQSsFBtmyqax8qeUIY/AauuGx83JcRiTv61W7I9WMxwYwhN8rmTX/a3AVBiRMnCaw3+rDcrG
	Trr7BiAVJcP+3S5e7fLffzGB1DGOJ+9dfMmCHDD8HYeBNB3ayhAXjwtoKMZ3tmCKgTW+1tbkKlghZ
	HQL9akFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Ao-00000008gDS-3ox7;
	Tue, 21 Jul 2026 07:45:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5An-00000008gDA-1Ehq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 07:45:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D9CE60A9D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 07:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2951F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 07:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784619952;
	bh=okTMrHZiP0sVY1prxXrRl26i6JyH7ulay0Mr3CLRG44=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ojz3AsS3yLTPkRMTWCGx3vLCWNJy+520RCn2Hza8D9RWBnYJbEh8KKU7q6b9KxNCG
	 FHzBMRNMV2NDCrmrXTMAIDh9ZXTD4JaCCfqPRiKYxkEDYlZJ79HsJH6w5Bvcqa2j35
	 /omhQr4tItO8u+8wN+5vTIlZd3EYh61tK8e/CZ7sLleetWTivG2suhIYaIlSpCEyp/
	 SsGRsiKsxsfU9dORzY9BMmR9Smd6yYuNmJF6wGZiHD3krGX8TLAD12v9/uNGZZx5WY
	 CmCGVYzGk8bqrjiboPfGsdBPU1t+QrGnJhA7IwQNzCgVmInxUhn16Zd6G1KqYYHiea
	 YWW+3gTKLQsVQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso9655571e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 00:45:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrIf9NHKMhKk99JiPY1GZCsJKfJtN7Nn7Fn7kRCOst80Y/YRd1ceRdX/isLiMUGFNVuOp80AjYxHMbkxXRyP+x2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+QBf9RlYskl1/8Y4dbV3dE25p0HVyt+PEx2JdFO2bthdBPn0i
	MWQ9djrwR29vRhoqDKMl/CTTpsErNQu1RFG1AhYffnjdgndc4dfsWMNwoSTveqcjlT2X4dosjov
	lO4+5G8rB2RjV2pLWA5FPsQXVBIUkgE4=
X-Received: by 2002:a05:6512:611:10b0:5ae:bbe4:f4b9 with SMTP id
 2adb3069b0e04-5b28f9aead9mr2079075e87.55.1784619950751; Tue, 21 Jul 2026
 00:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260721052859.171341-1-manikandan.m@microchip.com> <20260721052859.171341-3-manikandan.m@microchip.com>
In-Reply-To: <20260721052859.171341-3-manikandan.m@microchip.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 21 Jul 2026 09:45:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLkjY8hwGE9nNnDpuapVyTf-cBJhyZA8B9PE7U-CWmkyjw@mail.gmail.com>
X-Gm-Features: AUfX_mz_2Va_62Eq0-JUpFBlFm9mhUwZ4GUXlXtPLrXevxSFmqeo3xMHXg5EG2Q
Message-ID: <CAD++jLkjY8hwGE9nNnDpuapVyTf-cBJhyZA8B9PE7U-CWmkyjw@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: nvmem: layouts: add Microchip/SST
 SFDP EUI layout
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, 
	arnd@arndb.de, michael@walle.cc, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
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

On Tue, Jul 21, 2026 at 7:29=E2=80=AFAM Manikandan Muralidharan
<manikandan.m@microchip.com> wrote:

> Add a binding for the NVMEM layout that exposes the factory-programmed
> EUI-48 identifier from the Microchip/SST vendor-specific SFDP parameter
> table (e.g. SST26VF064BEUI) as a "mac-address" NVMEM cell, and reference
> it from nvmem-layout.yaml.
>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

I like it!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


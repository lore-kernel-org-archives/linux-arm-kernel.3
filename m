Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B792EFD21B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vxNxps+OuZ2xANrOCzteDxtEt2BxFwhyI1Ya+QPBeRo=; b=bv+Fd1Yn2qYhYr
	kwETN4hYS9No4qnDO3x3fQPWQs3Vu67FcSC8okqn3GEGV6nI3pE1i1El1GDPhQtHvDDx6qZwz4kcM
	zAsKCnS7hisPCz9MMCwyh49KumYuCnmm6/lW1EFm9LbJSRLxHxboj4/C4SwVTEt1XoQ620hkNbGPA
	/wxfa7Gqrlir+h9L7Rc3llUyGsJ4+IPTAEtNtsbBUe7/LqxqRngZyu51y0DXrU7Xv1pnIdCgio0eS
	qrYihQlnEtJnAs9rSgNedcjN9mgQBDKNahKDfcfQZ1eUA16y+FbvcDPX5qVn7BhIPsMrgGjjo7WEO
	x+6yWP1rp+dUXoImIALA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBL3-00000003hjn-2sa4;
	Wed, 25 Feb 2026 09:37:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBL2-00000003hje-00cZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:37:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A3F760054
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 09:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5BFC19423
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 09:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772012266;
	bh=vxNxps+OuZ2xANrOCzteDxtEt2BxFwhyI1Ya+QPBeRo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Chhl3YH9kOiN/ftbHTBwHqPLakN+mnq3Wz8u/Ew7YxHGj+Rk1ZIWR2K89ecE8iAUP
	 K5Z9l2eymGUDOsoBt5T2/q/AJBWXINcjtLCSlgWwoS5TjGxU1Ufbd1D1ht0efSX6mT
	 LAAoRmLRjjte/GNPaUq1jJS1telxI+uZd2c6Y00MwjFBJTAL/UXWflBYdVrg49LpCK
	 07p+ZmNBwwuHjYnZiOdKL5FHketp0aA0aMNWvD6FnXz9flIHK0Of4t10/rniRRl1gY
	 w4DTkhtcZ05G55SFy/LP4rU3BQbvOBLayIkFTw3Xi5dcaG2450y8R4p55t83Sjc0vW
	 JUMOeoTa/BTNQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38706f96202so40711771fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 01:37:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7SMvciQsMAWuAO7e1kmzl/25sgX0ponVBSWSGGJCCGf1XilNkkf1ZC6DPD1Fe28nLREpJqcddGsFjyw2Na/kZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxzxbAPZCU73COS9kjuuYnMVl5IU7Du3HHa9QBD5THRTvMOYhGE
	RXEPTV9sRZsmpbc6L883+1ZiGZfIauyjodposEQoKHsfuby71kOn/SQ7d84s8Ll/ckaQTVFCDR8
	Z64cbhKHV26U1/DJ3PJL28rFUC1OGiqk=
X-Received: by 2002:a05:651c:2104:b0:37f:c5ca:a6d4 with SMTP id
 38308e7fff4ca-389a5c9276fmr48586841fa.6.1772012265107; Wed, 25 Feb 2026
 01:37:45 -0800 (PST)
MIME-Version: 1.0
References: <20260225072225.3345307-1-wenst@chromium.org> <20260225072225.3345307-6-wenst@chromium.org>
 <CAMRc=MehRxdoip8++NfwU_WEJ+yYuC1=2BRv8Ry9VytU=YvR=Q@mail.gmail.com>
In-Reply-To: <CAMRc=MehRxdoip8++NfwU_WEJ+yYuC1=2BRv8Ry9VytU=YvR=Q@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 25 Feb 2026 17:37:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v67MwbOA3oQp4NCDEzzsLP6-zzTTyXi_uENJVDbJi6RpCA@mail.gmail.com>
X-Gm-Features: AaiRm50YXFDVbK-wg2pjz5zqS_wWe0Q4kSUl0929RdQ8XNtoQPy9JMLS28sbKio
Message-ID: <CAGb2v67MwbOA3oQp4NCDEzzsLP6-zzTTyXi_uENJVDbJi6RpCA@mail.gmail.com>
Subject: Re: [PATCH 5/7] PCI: mediatek-gen3: Integrate new pwrctrl API
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Feb 25, 2026 at 5:30=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Wed, 25 Feb 2026 08:22:22 +0100, Chen-Yu Tsai <wenst@chromium.org> sai=
d:
> > With the new PCI pwrctrl API and PCI slot binding and power drivers, we
> > now have a way to describe and power up WiFi/BT adapters connected
> > through a PCIe or M.2 slot, or exploded onto the mainboard itself.
> >
> > Integrate the PCI pwrctrl API into the PCIe driver, so that power is
> > properly enabled before PCIe link training is done, allowing the
> > card to successfully be detected.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
>
> Thanks, looks small and sweet.

Thanks! I originally had one large patch that was kind of ugly. I managed
to dissect it into this series.

> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>


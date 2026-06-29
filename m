Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36676C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EuaEiP1R/Ld6EoN/FwVrc43DhXOZIUY3usyXo926Mcw=; b=Br5xI+cG8/nZDq
	MdJriVou4n1nLHdkXLiZ/DauLaW2ZeVdQCDgJnMaRvvNIQ9CFQaxDqN5M/pQa3u3eCa3RkSNbCaLw
	eaaka95zosbeLFH/IRatIDph+dwdRFrRJaS7smSXVWs4r+gdWLOxfRidL4KcNLOYMjEAfzfj8Y3OR
	dkpWCXF1cONfjWkkQF62J07lASIYPX04boicV/JwlaWK3acV5DnkTNHMUHjlfNDC+v23M8M8fjxKX
	qljrVRAEubECefY/CO9nHm7Pos6nwF4ZtKEpGsFBfRy8D33aOocT3t+GX0tgkPTNjyCK9qPc/nTrV
	cK2Ky3Dqf1OvNw8bj/1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDrZ-0000000F3rg-03pJ;
	Mon, 29 Jun 2026 15:25:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDrX-0000000F3rW-2GKX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:25:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 11295417EC
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 15:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A7F1F0155C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 15:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782746730;
	bh=EuaEiP1R/Ld6EoN/FwVrc43DhXOZIUY3usyXo926Mcw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=NEaaQMMmgiu3Bi9aHlfHaIAXM4xHO2fxsd3nLwPGvb0LQbca34Sbhj2utpQT13UCR
	 uxC2ZiOdYhwUHtZr28/r/ExV41qLjJDePbNblKiQedtsyF1Iu509vzKboVFudoJmn1
	 0bifMfsOAVN62Z31LJlaLH+gT4E7c4KxQfFkca/TfJsKacxZ2Ei4Z3hiBgS6xwuWlF
	 FOEqn/tiU1AgRsLsGE79j91UHJGYQJB4tFkrVFE6X1RhVahVfUotEWBMh47uPfo0P+
	 Y8IbwL1dnhGw+iN2yi0Bz6f7q1qeDokuKnMMUuzK2gYjBrRiGsAAD7XR6LYdxvly26
	 sRMQZMVoPt5Bg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39aeb9513efso17022561fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 08:25:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqWfTjVch1QYQlRwozKci1x4cN4M49d4FspYY/puWVapR/k1bGw9EE2kIsBhe2SsnLoM5ELA5lytBtz4bSAFBLm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2obyhfYonqvf7zV8JOQFY/737bIJVTVD244i6IgmE6qmaycJM
	HRNyFV95pjLFqijoQGkbr/mdtJXPbV6HVEb70Phw4vcVVbjRRp+7dI5x+RIibzBSDCEb6lKvLOO
	H1cDNQ/NCHF3zjWx31an2spUTFO/apu0=
X-Received: by 2002:a2e:a988:0:b0:39b:70:e808 with SMTP id 38308e7fff4ca-39b0070f5f8mr12585631fa.35.1782746729301;
 Mon, 29 Jun 2026 08:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com> <20260629-a733-rtc-v2-3-7b72112784f8@baylibre.com>
In-Reply-To: <20260629-a733-rtc-v2-3-7b72112784f8@baylibre.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 29 Jun 2026 23:25:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v67_N5WQ4GqGsn6xzivVpGDN5_GNtPXKmUMC4WTHmDyztg@mail.gmail.com>
X-Gm-Features: AVVi8CecxM3k7I339CdtYTrFlBU6hFBOIy50N3ezSA0spmb-80bIde-G7mpTp9c
Message-ID: <CAGb2v67_N5WQ4GqGsn6xzivVpGDN5_GNtPXKmUMC4WTHmDyztg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC calibration
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
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

On Mon, Jun 29, 2026 at 8:42=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> From: Junhui Liu <junhui.liu@pigmoral.tech>
>
> The sun6i-rtc CCU driver currently uses a global static variable to
> denote whether calibration is supported, which makes IOSC operations
> tightly coupled to this file.
>
> Convert this into a feature bit to decouple the logic. This allows the
> IOSC clock code to be moved into a shared module for reuse by other SoCs.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> Signed-off-by: Jerome Brunet<jbrunet@baylibre.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>


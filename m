Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0221EC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCuUFaxO74UvNf8ac6Mkf2PobFmcSk7DdsO8xzbxiB0=; b=gCMESB+cx2EHFX
	ga3ks/4lZqv8TG3Gt8v0Cfz/fBKeja8t49S49tn3tw8acwe6iRx537rISQ6zNKqadFjpYCEJHA3cd
	BpKUDRsF6XPk88lMBdwheV0ZIuFanJmoW5Dc/wbwA9wwp1uM5FDmeEBqmH5SZudGyIxQELk82xQJ6
	eTSWaZm5cpckGV29AH4yOW4D7LLxlgNMFg+uKVtqVDLE5DiAEbgt0Gl+LQ/dtJ+I6kUufk4Rr6SCn
	HMgAFXdqnv76Q27HfqybjpeqDLh+IWYIKYc8TPfKfMPyiXZM7V6IxBQXho8Sdn4zkKXo+6jsBx82A
	HKFK+gmJCs6l2kPJtQtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gFb-00000002gdz-2jxK;
	Mon, 21 Sep 2026 15:48:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gFa-00000002gdK-12hu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:48:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 455386021E
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 15:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37151F0089A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 15:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790005693;
	bh=wCuUFaxO74UvNf8ac6Mkf2PobFmcSk7DdsO8xzbxiB0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=N2iQCU1YUquoO8Y2MgEugWsjZPkt5CzMttzM0K+O+YYYH+7I2k3MMfyhoc057zqFm
	 A1t514vKJaOqRMdoYmJtUpBCuLS0QikkdI+nYeuZP5/Kc/RsBwp71+0EFKbbnZdYDi
	 6jHRjppY2yYGk4WQi+xYv3kevzz/uWbCdegSbB4VdTr8IsCuXZhUmqdNrqA9Qj8pTD
	 DyUhRt05CpO+QKS/Ri8XB9v0WCjqxwqY114Gli8+0e0w/Ikyd0RU5nXsLF0CW4iOkJ
	 7Jbw50Tb/gVOzdUp6VMczexXHRhbtnstETlPtgNpf0vGh8N1/Tc6gMR3eafLfus1w/
	 aXODAIw0tcI0Q==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff148dfdso20483891fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 08:48:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBys5TJkDAiwrljY6BLHz16RAl/D6+WjSwk4hr8N589/RDQZt3XgzLLHuD0+VYob4qRtUQlNosPOsiBGI4VwsgmF@lists.infradead.org
X-Gm-Message-State: AFuF++kPSe1DOW8VEMw6t3Vr80ERUNjJZYEPl0dRJeQqyMVvTzv1v0il
	qIVkveSBqQXe8pb78MeBgJijn9zD6LLUB2355p24z0adxn1fhoVmwa+9OVaoeV4hiwd+8kKHeNQ
	t9UlyBCT/dmJDIN2T6WtReWxG895JNig=
X-Received: by 2002:a2e:be92:0:b0:3a3:7681:6d67 with SMTP id
 38308e7fff4ca-3a5fc04ac64mr25842931fa.16.1790005691189; Mon, 21 Sep 2026
 08:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260917223913.1855301-1-andre.przywara@arm.com> <20260917223913.1855301-2-andre.przywara@arm.com>
In-Reply-To: <20260917223913.1855301-2-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 21 Sep 2026 23:47:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v64E7j2ZJraU6A5dtDR+YhPEum9KtQ2CiPj7homJnB7N9w@mail.gmail.com>
X-Gm-Features: AcwNN1Uu9hlzRJFga8qpiScROV7vtn-TiiKmN7r_Qjatnbb3PEc5x8sEUmLWBys
Message-ID: <CAGb2v64E7j2ZJraU6A5dtDR+YhPEum9KtQ2CiPj7homJnB7N9w@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] clk: sunxi-ng: generalise update bit
To: Andre Przywara <andre.przywara@arm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
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

On Fri, Sep 18, 2026 at 6:39=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> A few of the Allwinner A523 CCU clock registers introduced an "update" bi=
t,
> which must be set for changes to the other bits to take effect.
> Of the three clocks where this was used, it was always bit 27, so we just
> encoded this as a single bit feature flag.
>
> Now the CPU PLL also features the update bit, but puts it at bit 26, so
> this flag trick won't work anymore.
>
> Add an "update_bit" field to the common sunxi clock struct, which takes a
> bitmask, so we can encode any bit to use, even potentially multiple of
> them. As uninitialised fields are set to 0, we can use this as a default
> bitmask to set, so can OR this in unconditionally.
> It turns out that the "update key" feature is doing something very
> similar, so just convert it over to also use this same bitmask approach.
>
> Change the existing update bit users to use this new encoding, and add
> support for the ccu_nm clock on the way, since we will need it there
> shortly.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>


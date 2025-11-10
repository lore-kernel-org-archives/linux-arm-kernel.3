Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2165ACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 14:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AixT7Oh+5FxWWMEZrxu1kDjvQPH8JSRwqc8kK2kvJaU=; b=QzgfSQyCVu0/7Qg7umm9EH3AYM
	tKb6jwqJAJv9/MfN+itV003SChay2JeGPfOFJEfef/9UxY9GFtko34cERlpEpJIr5IQx6xTcWUsw3
	wFNRSpXy+ej3lwVe0XoK4Jjf2CHo1OsMbyjHz4sjlQMSI6xoJk2CfsIFvrkUfzVceXaX7fRZb9wkF
	JiDjQ4H6OSSqqKUHw8LtuuGtRbJ5t/sOYWtJlOqEeuAUWd8y7aW2K/spYs8G7OZQ4TSLCxaQTsKz7
	osmmBC89F13Kmc6i4+bwl9+gYN1PeUeRhgx5gcq6NEMtd1TdpnindvTeEuYuLtZLkfL/bJL/b1uv6
	fO5sx4Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISjz-00000005Z6n-0GxY;
	Mon, 10 Nov 2025 14:19:31 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISjx-00000005Z6N-0ddb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 14:19:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 29A7C1A19AE;
	Mon, 10 Nov 2025 14:19:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8E9E606F5;
	Mon, 10 Nov 2025 14:19:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B459D1037176A;
	Mon, 10 Nov 2025 15:19:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762784365; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AixT7Oh+5FxWWMEZrxu1kDjvQPH8JSRwqc8kK2kvJaU=;
	b=tGk9KTsQI2Q65bzJrFFGVZMBlqJL0S5t7NCc7oHdD3VkJ7+4DvdWCQ1H+fAUPwNSCCkKTo
	mb4cak229bqD5R2nYdIofNZNfCwEYFNwjrDP2XMzY4gRkKtvgxHNNDrEpzrh+F7s+3tohi
	IF88La9EBzOBGWNmzeDbgNfVvwUMISSod2H02ulMO04OGgjoqPISyStUXuj5kb6RpzzPfx
	u3G2MpuRo2y5hlF0j1NqsgamhemSCsrxPqK4Z/TgsRHzg6He2ENBbGaz16F4XH62zhf7nz
	ypVF6xKKeHJphkB1yWfga+Le2zF3iBCyw2R7QXAhmJKB/9bIEv/riz+QGqXDXQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Josua Mayer <josua@solid-run.com>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Rabeeh Khoury <rabeeh@solid-run.com>, Yazan Shhady
 <yazan.shhady@solid-run.com>, Mikhail Anikin
 <mikhail.anikin@solid-run.com>, Jon Nettleton <jon@solid-run.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Josua Mayer
 <josua@solid-run.com>
Subject: Re: [PATCH 1/2] Revert "arm64: dts: marvell: cn9132-clearfog: fix
 multi-lane pci x2 and x4 ports"
In-Reply-To: <20251030-cn913x-pci-clk-v1-1-e034d5903df1@solid-run.com>
References: <20251030-cn913x-pci-clk-v1-0-e034d5903df1@solid-run.com>
 <20251030-cn913x-pci-clk-v1-1-e034d5903df1@solid-run.com>
Date: Mon, 10 Nov 2025 15:19:23 +0100
Message-ID: <87pl9qrmvo.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_061929_345521_57527972 
X-CRM114-Status: GOOD (  16.35  )
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

Josua Mayer <josua@solid-run.com> writes:

> This reverts commit 794a066688038df46c01e177cc6faebded0acba4 because it
> misunderstood interworking between arm trusted firmware and the common
> phy driver, and does not consistently resolve the issue it was intended
> to address.
>
> Further diagnostics have revealed the root cause for the reported system
> lock-up in a race condition between pci driver probe and clock core
> disabling unused clocks.
>
> Revert the wrong change restoring driver control over all pci lanes.
> As a temporary workaround for the original issue, users can boot with
> "clk_ignore_unused".
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>


Applied on mvebu/dt64

Thanks,

Gregory


> ---
>  arch/arm64/boot/dts/marvell/cn9132-clearfog.dts | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts b/arch/arm64=
/boot/dts/marvell/cn9132-clearfog.dts
> index 5cf83d8ca1f59..2507896d58f9b 100644
> --- a/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts
> +++ b/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts
> @@ -413,13 +413,7 @@ fixed-link {
>  /* SRDS #0,#1,#2,#3 - PCIe */
>  &cp0_pcie0 {
>  	num-lanes =3D <4>;
> -	/*
> -	 * The mvebu-comphy driver does not currently know how to pass correct
> -	 * lane-count to ATF while configuring the serdes lanes.
> -	 * Rely on bootloader configuration only.
> -	 *
> -	 * phys =3D <&cp0_comphy0 0>, <&cp0_comphy1 0>, <&cp0_comphy2 0>, <&cp0=
_comphy3 0>;
> -	 */
> +	phys =3D <&cp0_comphy0 0>, <&cp0_comphy1 0>, <&cp0_comphy2 0>, <&cp0_co=
mphy3 0>;
>  	status =3D "okay";
>  };
>=20=20
> @@ -481,13 +475,7 @@ &cp1_eth0 {
>  /* SRDS #0,#1 - PCIe */
>  &cp1_pcie0 {
>  	num-lanes =3D <2>;
> -	/*
> -	 * The mvebu-comphy driver does not currently know how to pass correct
> -	 * lane-count to ATF while configuring the serdes lanes.
> -	 * Rely on bootloader configuration only.
> -	 *
> -	 * phys =3D <&cp1_comphy0 0>, <&cp1_comphy1 0>;
> -	 */
> +	phys =3D <&cp1_comphy0 0>, <&cp1_comphy1 0>;
>  	status =3D "okay";
>  };
>=20=20
>
> --=20
> 2.51.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


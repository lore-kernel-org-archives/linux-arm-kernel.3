Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA0DFA3753
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 18:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9EJ2X8RMS9IecySDKNE83h12NY8fqhR6DwLAlrRmCs=; b=4gIa9qmC9XDG6yOkR+jNVmalb6
	N93G5D+BmkyX1BrLI77WgXM3rixGKVoV4IxAxXz+RPfnQy4kwFEUqoIbvMJJLnhPRdqMcPlLGQTmz
	Dqbi+Nrj1BgOggprCQKpqYCBpWzPn0ycV6hiIKV1yD8RM/740gneTkNcYVqa2o+7WrFIOjXi03dQj
	ToAGj/VuEsLKlSf20e22Z8IlUltcq3Ap0KpYW3+y0Z6EJwmLGHM1fwo2azgmLfFZ58q13ckQPGssw
	+z8Bdm2JxHibgLRLzzNNQfz32NDPR4UnXoXg+DutAGERCO6NtKhAodZjdoRjkCVDKabfOTiboKtSa
	XsgrKHIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbkBv-00000008e1m-266j;
	Fri, 02 Jan 2026 18:48:03 +0000
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbkBt-00000008e1O-3SHj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 18:48:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767379679; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=FF1mhaLwEXV6c2uA2Ka4DoOiIr8oXvscuH3PfGytWJwfYWhp5f41eY+MnE6Y12GX9T
    PMMAg+mTiRx2nSs3Ikfh9KBgnkEXawyG0GXf7wubFdwWFAdCILH+92EnFW59rKVXSqtp
    keSN3tgOi6b9tprwzH7/BzlerMBW+zMF7tNHTJDyjL8qymmahA94dm6eKZ2v6y1jNq0S
    afDYoqgjJDLodMsQ/FVlrPyUA1lmbRNRKjJgFcRyL6zBSjY9+OJksAhEbQPaenvc+3iS
    /bd9qb2HucSzwO07HiYdvrO4EuWpjCf1qzX+4wmm0U4Mx+e5en4iiTqS74ARQDD8rGQU
    faYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1767379679;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=j9EJ2X8RMS9IecySDKNE83h12NY8fqhR6DwLAlrRmCs=;
    b=A60BygkXpIdu95J6POmNu2s0BesoelcXa1Z6PiyS7tzYKBkjMVjy0iaKtT8escNRpw
    fWe+ItvVZ9vG1kZwUX8ysNoy8vdYWM0b02s2lRJKBQAVMYyOI64q3urieO6uL83tDfPF
    0vT5hbWJ4yFC1XqvrWwa1HqWsCjDsLeMZYknmO19YkR5bEQumaZrGHV3UakTanaYZxe9
    nVzrzK63SPl2AZ6dEvydVlu3bxSsAMF8cQK316Xm7DNTc+Z9IbjR+tCP4Gne2iOKPdnv
    FgczyH4U/VeQIendBIJaJj/7RCDacdFoD1xOPrGZqIKkdENDIPVkPtJVjIr6a/VIzD02
    9EBA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1767379679;
    s=strato-dkim-0002; d=jm0.eu;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=j9EJ2X8RMS9IecySDKNE83h12NY8fqhR6DwLAlrRmCs=;
    b=HS4uPEl9TxCPlteJkHKB/3YESWvOJv1dWxiWcyyM1K39td6B1Ngbw9OIg4ze9xNxWo
    nQIVW88oL34eYPPAOjz4RzuMDmColNl75feDtECrAikh2tcdsKXFUGDCX+60/p7WgRvB
    shOhF+09uJq8JspCieR4EXNetzjDNzcaBVYyAinYies48QvrBKbty93PtR9ZkL1ynWXA
    zwQchSx+NgoMsGg/MV5azFJpoVWkiBLKRK/0uxdMcqSh/asa2q4pdhxFdGKakE7ew5td
    ru3tBwsNZw/JKBtqeCkgNcMZaILU+qZlrYxptx4T2eSCp7LyfgZO575CHHrc9B+bXE7j
    +qag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1767379679;
    s=strato-dkim-0003; d=jm0.eu;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=j9EJ2X8RMS9IecySDKNE83h12NY8fqhR6DwLAlrRmCs=;
    b=VfPQEo6tUFQLxnxhUf1a/yYdohd8sf8DrrfbgUx2qRd2EAG6tfGnNhfMvDcD8IBBJy
    I3v1M4BpGQD/sIZuIdAw==
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPUekEaRuJYlK1sYXypxVL0CQ9+6hiGfCNGIsC/uv4p9fxkB90Xm84033ewK4crZA="
Received: from localhost
    by smtp.strato.de (RZmta 54.1.0 AUTH)
    with ESMTPSA id z0d4ec202IlwEbp
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 2 Jan 2026 19:47:58 +0100 (CET)
Date: Fri, 2 Jan 2026 19:47:55 +0100
From: "Ing. Josua Mayer" <josua.mayer@jm0.eu>
To: Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Lee
 Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] power: supply: add battery driver for netronix ec
Message-ID: <20260102194755.000030a4@jm0.eu>
In-Reply-To: <20260102-kobo-aura-battery-v1-0-501f2a8fa575@jm0.eu>
References: <20260102-kobo-aura-battery-v1-0-501f2a8fa575@jm0.eu>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_104802_114668_4A0D842C 
X-CRM114-Status: GOOD (  15.84  )
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

Greetings everyone,

I made some mistake using "b4" on a different device,
and the v2 was not added as subject prefix.

I will try to fix it after hopefully some comments.

Am Fri, 02 Jan 2026 19:00:29 +0100
schrieb Josua Mayer <josua.mayer@jm0.eu>:

> This series adds a new battery driver for the netronix embedded
> controller multi-function device.
>=20
> Bindings are updated supporting a monitored battery, and battery
> description is added to kobo aura device-tree.
>=20
> Signed-off-by: Josua Mayer <josua.mayer@jm0.eu>
> ---
> Changes in v2:
> - Fixed identity mixup between from address and SoB.
>   (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
> - Changed patch ordering, device-tree first.
> - Separated new driver and mfd subdevice changes into separate
> patches. (Reported-by: Jonathan Neusch=E4fer <j.neuschaefer@gmx.net>)
> - reworded Kconfig to explicitly mention device-tree
>   instead of vague firmware tables expression.
>   (Reported-by: Jonathan Neusch=E4fer <j.neuschaefer@gmx.net>)
>=20
> ---
> Josua Mayer (4):
>       dt-bindings: mfd: netronix,ntxec: add reference to power-supply
>       ARM: dts: imx: imx50-kobo-aura: add description for battery
>       power: supply: add battery driver for netronix ec
>       mfd: ntxec: register battery subdevice.
>=20
>  .../devicetree/bindings/mfd/netronix,ntxec.yaml    |   9 +-
>  arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts      |   9 ++
>  drivers/mfd/ntxec.c                                |   1 +
>  drivers/power/supply/Kconfig                       |   9 ++
>  drivers/power/supply/Makefile                      |   1 +
>  drivers/power/supply/ntxec-battery.c               | 101
> +++++++++++++++++++++ 6 files changed, 127 insertions(+), 3
> deletions(-) ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251227-kobo-aura-battery-3e60bc159d16
>=20
> Best regards,



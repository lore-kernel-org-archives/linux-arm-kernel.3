Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871E0CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 03:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qT5BbvAf0970jGpHLlqJ9wvkmx5X5Z5+OFS5PTjFcE=; b=2TaK9WRqoizHke6Co6ZSKH5VvA
	V9MAovItHDOX15Sq3NVsNe8oZtlyqj8u3T0vJXBxiRL/aeOuSg56OX8gHgV0WsIKrmMDrb4sFlCbr
	b6VpK3pl9urtnZ4EQeeywp8bvP7T2bIg4Y08RFLFUUzVAPxoFuGZk7zSZMuuGc5kSl/v6VKiLnRB/
	o2ZWN+8utWgcoRhOVTs0D2hdNs/n+2ky6vnUo6iKQEvnwZQnXAascLkKlIbSpdxC+QN5w1h3AGzL1
	Y28t4q/IduGXTMm34TuOPAXzJ6s11UGc2RSrG6oh+U0Y1cowF1u3yXuvWeHYVsiagW1F7JmwusNXA
	kQydNykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGtI-00000009gCI-1iQ3;
	Fri, 22 May 2026 03:49:40 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGtG-00000009gBl-1PhH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 03:49:39 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1357c851a48so8489167c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 20:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779421777; cv=none;
        d=google.com; s=arc-20240605;
        b=hq5tYAtI5+jLRf/mzV04esC7NTtsMGCnXHCuECIvpjxHyBM2QUXxE/icyCszZjCHyD
         3wIe644jNPfQaOR7oMOyJ9nPKZDUFlC1OEYgBvD5I6yvcUxwFeJKbPEUT9o/ZqGJEilj
         shZphj3Bc9CavWqu6avFg9rMo7o0OL8M0vV6Rxd3QB4qbNLeN81dfyY+9VgwF50P1vBv
         /jz2vMfI/cboOf1qkvFRzcx51hARTkZGr0CZmZrnPCu0KTgOrzvbcRK6oiuZwbSdR6vF
         0UI5KG27SMPS3lF8M8hLMw/SsFF53ciiIxtLkCac7Y46Eb/JOR1s6tRzrCqV98QIgSIn
         hVBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+qT5BbvAf0970jGpHLlqJ9wvkmx5X5Z5+OFS5PTjFcE=;
        fh=hI2yE8M6jZz1UJSk5JsMLldpKEfECEexC8FjyP1/kuk=;
        b=Mm/oaOwmGv3qOcOrYbl5nOYipEi1gJs0jWo2R0E95mqOPXREhuQs263GU70xNMsPeo
         +7R8lTEAZaQAtnZ4CsMvC5pbTHLoEJ1mCpsMH1AGEgCaijy9r3ENZwe3RH0kTFnARPem
         CQuTUdWjA0Llp4hZeFGmOuw0NRPM6gS0dNvVTk9WrKO/m3kQJHZLhizOQvBOc2KEZUun
         qWDuRKTbDpPH3XN67Kidp8Us9FHWAsynnhG2qIlqs7leo4dU82JL2ojG1V/62luf/odw
         jpn8f+nm3MC21pz22BEiEfG7AdMB1qwhDLYOwHxkEK61ERfYSpp8jCWphZEbOkZReTU/
         s6Gw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779421777; x=1780026577; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qT5BbvAf0970jGpHLlqJ9wvkmx5X5Z5+OFS5PTjFcE=;
        b=rc3vTahZy0pfWcF1msfEORVAZh/ahsgGwWt+bopZ3TNf4zU0E7Hb+eWHuH8dCO2bp3
         DM4GF27pjlXCDJ9HG+eZJb33T/egcU0gPgplZLwHmFcQ5fJ2PTQg9oZkN4dUaYIQTdoQ
         IXQQ28Kg41OZoBV6h0VApncU17wRiMIjlhGiwnPYXrklNH1ZgZO0dg+tcX0OitSirAPV
         3BVuuXWtyc7QEf1ET7YVtD/mNhCGp6v1UK9MwuueV3Jee/gkhlHWIMW0MTBNvKshpOAM
         QJrf8KGUbXCLmBj+3YSNXn+YCrxjTGXqVrmRxxI1z8S59fQo8AEyx3If1v3Slqbc0r+r
         vaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779421777; x=1780026577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+qT5BbvAf0970jGpHLlqJ9wvkmx5X5Z5+OFS5PTjFcE=;
        b=sZWvimUNWDYY4IxbF86wfZ12j17ZWQgpkPWJ9KnaxIwEZqnPrF2lD7GZBfdi6uD89W
         oog/Q/G2CrmCD3u8rMz4ge1hvBZdF0R1VD2u/myTtJD6ArzhVe30XEfsXeLGqC6VxEgG
         ZYRlnIkjKIOXxBLrrFBcBwvZzJ62C7V+ZeIkChJYZj9yY39p2Wz7FG3fIxaMlqcC3P4u
         /+SF2axV8RJrsGJbU959aY/gSd81S81k0DfqLgGf2dkPSrgWgtZsNBZCSX4bfxMLZpvA
         Wrcsz/NNEtsnBu7P2OUCcFP3owxn+VOiuSxM2DFSbyI4m5lkiB5wCBdyVmkled/FpT5B
         F3VQ==
X-Forwarded-Encrypted: i=1; AFNElJ+jhbAxRmg12zIo9AWlThlt37eY6NiwGk48jL4yiFClCMR2ro1o36pq0LkwiqadrFSJLKrlSq8mxqOVeAVC+Zky@lists.infradead.org
X-Gm-Message-State: AOJu0YyPBh7WxVh7wMOUEZOVFOjXJ9cz1aeQLRZ4bVBVuS0eKjHrZ57n
	bafQJt5lsixn+S/ZPVdhDvkqlUtyNAyQmIEMGrtOkc/toLNRU1pKpUFqRJnYl9Pmzjz7j4SfemT
	aAo6KRvyx/4PVe7QzCU83GKA6SbcCORM=
X-Gm-Gg: Acq92OH4BYx0e1n966ljYu9Xat5Lf+JMK29gtEmGP8AZSE7djZXDg5ERLoFwIZKE/aa
	sQmoXoiK/IvPJH+hSt6zYYhlHVnKpzbjmIWGTmBWROnbu+0hQtSkF8Oy2wBBmLw0p+Z/vjrCoNw
	VUZfGvN6EanEdPoSE7lsTw7wTQcGRjmJKVKoY1Py2lXQsJkOzjvY7V4HyhA7fWroLiHV5rIWJ5S
	Q0TzliW9u3px5AtYS3QhMaDa5muhpBktYrZJPA6gFO4CrkoQwwVmUEKb5mdTR62+zsyNnk0giy0
	cUMlTaV//Z9AO+RMFr8ttutUicSnJr3EP2n92Waw
X-Received: by 2002:a05:7022:4a4:b0:135:2640:70cc with SMTP id
 a92af1059eb24-1365f6fe0d9mr845587c88.5.1779421777083; Thu, 21 May 2026
 20:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260331-asus-kommando-networking-v2-1-f7d72ae5d40d@gmail.com>
In-Reply-To: <20260331-asus-kommando-networking-v2-1-f7d72ae5d40d@gmail.com>
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Thu, 21 May 2026 22:49:24 -0500
X-Gm-Features: AVHnY4Ka54_MLKGXewXkQbTwbb4nAvWDr8M9psv1cc8wtCfvwYFbBij8bhm-Seo
Message-ID: <CAJ13v3RtV+_P_ShfrM5vH+neT0cB6t5yAbqGiiw7S7Y8qpVY=Q@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Enable networking for Asus Kommando
 IPMI Card
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_204938_378934_98AAE47B 
X-CRM114-Status: GOOD (  25.65  )
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

Hi Andrew,

On Tue, Mar 31, 2026 at 9:18=E2=80=AFAM Anirudh Srinivasan
<anirudhsriniv@gmail.com> wrote:
>
> Adds the DT nodes needed for ethernet support for Asus Kommando, with
> phy mode set to rgmii-id.
>
> When this DT was originally added, the phy mode was set to rgmii (which
> was incorrect). It was suggested to remove networking support from the
> DT till the Aspeed networking driver was patched so that the correct phy
> mode could be used.
>
> The discussion in [1] mentions that u-boot was inserting clk delays that
> weren't needed, which resulted in needing to set the phy mode in linux
> to rgmii incorrectly. The solution suggested there was to patch u-boot to
> no longer insert these clk delays and use rgmii-id as the phy mode for
> any future DTs added to linux.
>
> This DT was tested (on the OpenBMC u-boot fork [2]) with a u-boot DT
> modified to insert clk delays of 0 (instead of patching u-boot itself).
> [3] adds a u-boot DT for this device (without networking) and describes
> how to patch it to add networking support. If this patched DT is used,
> then networking works with rgmii-id phy mode in both u-boot and linux.
>
> [1] https://lore.kernel.org/linux-aspeed/ef88bb50-9f2c-458d-a7e5-dc5ecb9c=
777a@lunn.ch/
> [2] https://github.com/openbmc/u-boot/tree/v2019.04-aspeed-openbmc
> [3] https://lore.kernel.org/openbmc/20260328-asus-kommando-v2-1-2a656f8cd=
314@gmail.com/
>
> Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
> ---
> This patch is based off aspeed/arm/dt from bmc tree
> ---
> Changes in v2:
> - Commit message now mentions that the u-boot tested against is the
>   openbmc u-boot fork
> - Link to v1: https://lore.kernel.org/r/20260328-asus-kommando-networking=
-v1-1-66d308b88536@gmail.com
> ---
>  .../dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts  | 18 ++++++++++++=
++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.=
dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
> index ab7ad320067c1ddc0fea9ac386fd488c8ef28184..e0f7d92efa18ccbad2c336236=
c3b9d01b7de1bba 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
> @@ -107,6 +107,24 @@ &gpio1 {
>         /*18E0 32*/ "","","","","","","","";
>  };
>
> +&mac2 {
> +       status =3D "okay";
> +
> +       phy-mode =3D "rgmii-id";
> +       phy-handle =3D <&ethphy2>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_rgmii3_default>;
> +};
> +
> +&mdio2 {
> +       status =3D "okay";
> +
> +       ethphy2: ethernet-phy@0 {
> +               compatible =3D "ethernet-phy-ieee802.3-c22";
> +               reg =3D <0>;
> +       };
> +};
> +
>  &vhub {
>         status =3D "okay";
>  };
>
> ---
> base-commit: 76b4ec8efdc3887cdbf730da2e55881fc1a18770
> change-id: 20260328-asus-kommando-networking-5c0612aa6b8c
>
> Best regards,
> --
> Anirudh Srinivasan <anirudhsriniv@gmail.com>
>

While we're figuring out what to do with u-boot, what are your
thoughts on getting this patch in so that the kernel DTS changes
needed for networking land in this cycle?

The current commit message might become somewhat outdated if the
u-boot patch changes though, so not sure if that's okay.


--
Regards
Anirudh Srinivasan


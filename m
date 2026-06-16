Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4F2CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 19:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/iTjePusMfrSdj7g6pBjEhl+rxxuYxnDgZt7OwEz8Q=; b=cfywMuV20y9t/HAOdHmX6bIyc9
	4gfGF7Ktnd80WPGRGxJCk6CimTuTTgF/+6kTDYE198uEvrHv4Re30nd7g66Enk3jVcG3A0Bq7BvHS
	tocbbQnIVTwXi47DmpY+UjjJgHGE/pQgR6VuHCWZgqIQ3bC63vpqoEUcL16KRtpS8MMSf6qfSaZKZ
	g1B4VK4UEW7E7p5abaVjKepdv2wA6f3Iul13QjLQz+9g/sfcv523KqWaaZ/gfbRq6OJNnxfftTvOt
	bNhYAjLLnp7iLgkFBqABdZuin0NU/oAdS3KosTAcY1QsngBeZhPObIlF40dAAid/RAKmfMAiS8WIk
	bENolpbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZZ96-0000000GF63-2s2C;
	Tue, 16 Jun 2026 19:08:24 +0000
Received: from mail1.manjaro.org ([142.132.176.110])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZZ93-0000000GF5c-3Ffw;
	Tue, 16 Jun 2026 19:08:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id D5997427AE;
	Tue, 16 Jun 2026 21:08:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1781636899; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7/iTjePusMfrSdj7g6pBjEhl+rxxuYxnDgZt7OwEz8Q=;
	b=q/XlcshgZ5d7bmbC6Av+0R7gz3PiYxIhj/Sxd1nbzT0iv2OOQOO4ZD5KEBJvFZookuTsGm
	3kZ++ozB5rnSQVv0I8dzvJfGMCMpWLuIe7EWGTluCxoQUgLNcjFwKHCH5y7BFbRb9SwiDE
	E+CEaipOAYnVRiD4Ycdb0uHEYovqA4fjAgcW6SRw7HIlq7wyh7klELU0n2m3c8YugPu4PR
	09LPAKrv/sZ1c19NzNIOJqkaXTBtHK2U/nNAwtd8G+ul6R4vPUZBC6pJ53VwmWbLvWFkDE
	/c2vsDYK8j3Cc6Rl+Dh3+LbzLIDBYwulikomP0A6IoU+/PnfuNQ6FfkD1OqJqQ==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <68f6353e3a2ea4914de36c42b6906e41282adad3.1781622998.git.geraldogabriel@gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <cover.1781622998.git.geraldogabriel@gmail.com> <68f6353e3a2ea4914de36c42b6906e41282adad3.1781622998.git.geraldogabriel@gmail.com>
Date: Tue, 16 Jun 2026 21:08:17 +0200
Cc: "Shawn Lin" <shawn.lin@rock-chips.com>, linux-rockchip@lists.infradead.org, "Lorenzo Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: "Geraldo Nascimento" <geraldogabriel@gmail.com>
MIME-Version: 1.0
Message-ID: <583cf740-1687-2c0c-71d0-b3f8425c17ce@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v7 2/3] =?utf-8?q?PCI=3A?=
 =?utf-8?q?_rockchip-host=3A?= do not attempt =?utf-8?q?5=2E0?= GT/s 
 retraining
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_120822_033414_F914F207 
X-CRM114-Status: GOOD (  14.99  )
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

Hello Geraldo,

Thanks for the v6 and v7 of this series.


On Tuesday, June 16, 2026 17:25 CEST, Geraldo Nascimento <geraldogabrie=
l@gmail.com> wrote:
> Drop the 5.0 GT/s Link Speed retraining from Rockchip PCIe Root
> Complex Mode Operation, so called host driver.
>=20
> The reason is that Shawn Lin from Rockchip has reiterated that there
> may be danger of "catastrophic failure" in using their PCIe with
> 5.0GT/s speeds.
>=20
> While Rockchip has done so informally without issuing a proper errata=
,
> and the particulars are thus unknown, this may cause data loss or
> worse.
>=20
> This change is corroborated by RK3399 official datasheet [1], which
> states maximum link speed for this platform is 2.5 GT/s.
>=20
> [1] https://opensource.rock-chips.com/images/d/d7/Rockchip=5FRK3399=5F=
Datasheet=5FV2.1-20200323.pdf
>=20
> Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21=
b@rock-chips.com/
> Cc: stable@vger.kernel.org
> Reported-by: Dragan Simic <dsimic@manjaro.org>
> Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>  drivers/pci/controller/pcie-rockchip-host.c | 20 -------------------=
-
>  1 file changed, 20 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pc=
i/controller/pcie-rockchip-host.c
> index ee1822ca01db3..1374a2c92b563 100644
> --- a/drivers/pci/controller/pcie-rockchip-host.c
> +++ b/drivers/pci/controller/pcie-rockchip-host.c
> @@ -328,26 +328,6 @@ static int rockchip=5Fpcie=5Fhost=5Finit=5Fport(=
struct rockchip=5Fpcie *rockchip)
>  		goto err=5Fpower=5Foff=5Fphy;
>  	}
> =20
> -	if (rockchip->link=5Fgen =3D=3D 2) {
> -		/*
> -		 * Enable retrain for gen2. This should be configured only after
> -		 * gen1 finished.
> -		 */
> -		status =3D rockchip=5Fpcie=5Fread(rockchip, PCIE=5FRC=5FCONFIG=5FC=
R + PCI=5FEXP=5FLNKCTL2);
> -		status &=3D ~PCI=5FEXP=5FLNKCTL2=5FTLS;
> -		status |=3D PCI=5FEXP=5FLNKCTL2=5FTLS=5F5=5F0GT;
> -		rockchip=5Fpcie=5Fwrite(rockchip, status, PCIE=5FRC=5FCONFIG=5FCR =
+ PCI=5FEXP=5FLNKCTL2);
> -		status =3D rockchip=5Fpcie=5Fread(rockchip, PCIE=5FRC=5FCONFIG=5FC=
R + PCI=5FEXP=5FLNKCTL);
> -		status |=3D PCI=5FEXP=5FLNKCTL=5FRL;
> -		rockchip=5Fpcie=5Fwrite(rockchip, status, PCIE=5FRC=5FCONFIG=5FCR =
+ PCI=5FEXP=5FLNKCTL);
> -
> -		err =3D readl=5Fpoll=5Ftimeout(rockchip->apb=5Fbase + PCIE=5FCORE=5F=
CTRL,
> -					 status, PCIE=5FLINK=5FIS=5FGEN2(status), 20,
> -					 500 * USEC=5FPER=5FMSEC);
> -		if (err)
> -			dev=5Fdbg(dev, "PCIe link training gen2 timeout, fall back to gen=
1!\n");
> -	}
> -
>  	/* Check the final link width from negotiated lane counter from MGM=
T */
>  	status =3D rockchip=5Fpcie=5Fread(rockchip, PCIE=5FCORE=5FCTRL);
>  	status =3D 0x1 << ((status & PCIE=5FCORE=5FPL=5FCONF=5FLANE=5FMASK)=
 >>

Looking good to me, so please feel free to include

Reviewed-by: Dragan Simic <dsimic@manjaro.org>



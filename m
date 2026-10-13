Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C45CCC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 16:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVucm6TmpsPynLUnOOW2Cs0RI56YCS5KoTFcnprJ3Oo=; b=v62V0nWs9gIWzqpD6rUrgG3o4N
	GRsoT0wqUNbqNidBr2MU2LUSEhtR/rOLHcSMDcJPUgEvcOAzByYCAmPXT9UaoAXg45i5ZSVtABcp0
	WXWZ4GnIMf/4wYT1XXdEhQxv22GaCIsbwRybyzkXIQHY1giQljqurVHmcrWhCKU06ZCEAODTa1+CV
	J4ZafX6nLTZIXfEsvYcuBgjjseMwYF4B3VPxewsiXfRrEF6z7yBM2THgOqC+B0st6P+mwSgRUW4by
	oU3HKFS0VpTeQpk5aiEZoV5g9tH7Q5a/oHK6+RzlOu5phgszPvFd/jhOyVUfr/eJlOagIvjPGiL93
	XZcqxHQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfLW-0000000DVII-3Gfd;
	Tue, 13 Oct 2026 16:27:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfLS-0000000DVHj-38OE;
	Tue, 13 Oct 2026 16:27:20 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:46f5:32b8:ff94:7599:1aae])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2C34230;
	Tue, 13 Oct 2026 18:25:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791908714;
	bh=shKJgZGIZFLzoHitxdERk+7/62vgv0+CoGsFsHHoCMI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rgP43o8LhCvfC1SbvJSrRxJBUKppE11ZS1DuyXq90Y1itX2aXXxg9jpzh04btvdef
	 PNIfKLPD9vUyQzBrktYA8hYLLCrX/1+e6tju1cWcO8Hq0DsYaUEamUaqy7i0aPNFd0
	 8ZFsaEhLIF4rnDgE6xA2AYDNli+Tt/QAE6qLw4Mc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261013131435.1454019-1-martin@wetterwald.eu>
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com> <20261013131435.1454019-1-martin@wetterwald.eu>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at subsys_initcall
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, regressions@lists.linux.dev, Martin Wetterwald <martin@wetterwald.eu>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Martin Wetterwald <martin@wetterwald.eu>
Date: Tue, 13 Oct 2026 21:57:10 +0530
Message-ID: <179190883032.11414.8457896168331458036@freya>
User-Agent: alot/0.13.dev38+g8e372ce37.d20260925
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_092718_927659_D19E25C8 
X-CRM114-Status: GOOD (  15.98  )
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

Hi Martin,

Thanks for the quick fix.

Quoting Martin Wetterwald (2026-10-13 18:44:35)
> Since the VCHIQ interface was moved out of staging, its bus is no longer
> guaranteed to be registered before its client drivers. bcm2835-audio,
> still in drivers/staging, registers at device_initcall level and now
> runs first:
>=20
>   Driver 'bcm2835-audio' was unable to register with bus_type
>   'vchiq-bus' because the bus was not initialized.
>=20
> Register the bus and the platform driver at subsys_initcall so the bus
> exists before any client driver, independently of link order. The
> platform driver probe already returns -EPROBE_DEFER while the firmware
> is not ready, so probing earlier is safe. When built as modules, this is
> equivalent to module_init() and nothing changes.
>=20
> Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
> bcm2835-audio both builtin and both as modules.
>=20
> Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
> Reported-by: Martin Wetterwald <martin@wetterwald.eu>
> Link: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R=
272j6Bs4tg@mail.gmail.com/
> Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio=
5R272j6Bs4tg@mail.gmail.com/
> Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thanks,
  Jai

> ---
>  drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/d=
rivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> index e78641703252..d35f5ac5c2e2 100644
> --- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> +++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> @@ -1462,7 +1462,7 @@ static int __init vchiq_driver_init(void)
> =20
>  	return ret;
>  }
> -module_init(vchiq_driver_init);
> +subsys_initcall(vchiq_driver_init);
> =20
>  static void __exit vchiq_driver_exit(void)
>  {
> --=20
> 2.55.0
>


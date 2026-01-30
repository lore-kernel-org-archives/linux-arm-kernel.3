Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1896FE6BF10
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 19:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vo4Rf3dfLPRxkR/eEUBoYbb9X7tgcY5B3I9SrGjk83A=; b=iPr/HNVH3aXQodfo+97GIYt9gV
	YjZe2Mv7RXocu2He0E03MgyniCQ73Q36a4xhGE6s4BbVdMwHargCZOHpX8xVIzidtwRIEYNxbpaOn
	x/9iMqowx9MkRcvjQUooo1hbBhJtn42oPNKzJ06XsNeLtBe5b4ZHU5IHkXeo3ulCWy+g2q4evUP3K
	YvxtkDm8IYr+QObgFmGoWJi/zO7h8X0o2GqNLCn6DJEOHr2V7kQnPQYtVYjUDl9G4OEInzBdlOD98
	uKHuKDSNal9jyJbme63pXIFt2LluQ3NDPBMdNkpFxmd7CuVhcuZ9Qlfs746lXtUnbtPJJvPdFSRZd
	JfZZ8C/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vluZO-00000001trQ-2cpC;
	Fri, 30 Jan 2026 19:54:18 +0000
Received: from sender4-pp-e105.zoho.com ([136.143.188.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vluZL-00000001tr0-3Cpm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 19:54:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769802836; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nRffW1Z5XxSDkMQt7OhOuU6DU5fgHNkbTBCm30sYHWNJ6RTclpyss9cYCa3Ssxgos7+EjbW12+4yHrzpV13hVqJgk3MaFmBIg9Ko6VjeVJ7arA2jHMW8JFkPNvPMDi/uhVRD0VYu6E1GAHTVi2QgTxGsYD7tpSAzUsKo2deEABc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769802836; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vo4Rf3dfLPRxkR/eEUBoYbb9X7tgcY5B3I9SrGjk83A=; 
	b=Z1EU174o+oquHRSh7Jg2fwveNwtCmQwXeD0sP6PItTVE90cR1EFfBU+9RqK/GT8rzihIy7qJZR3dX+VY+tQFFM2UehmQeOiYSroWKObP3EkvRUvHXKLugRJW1zVsLBZ07ONrs4hBuT2PxSmlatnS0mrCyYL6srMw0SoCW27Mtzs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769802836;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=vo4Rf3dfLPRxkR/eEUBoYbb9X7tgcY5B3I9SrGjk83A=;
	b=Y+e8wOwNV1koDVLX+46cGwrmdJ3EpGF440WvWGs+E97si3bGvL6nx+clVhK3lQH/
	T+zhM5PhbMwPCB4Oy+uIM3kzq0ASH9UpaXz/3LuP31UFKIDuzR5hK9fhvkfiymAAtTo
	1PnR2U6dcoLogNb9eagJ9j+Yw+hRXsgcC4xxo3us=
Received: by mx.zohomail.com with SMTPS id 17698028344131016.595532239749;
	Fri, 30 Jan 2026 11:53:54 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 6BE0118050E; Fri, 30 Jan 2026 20:53:47 +0100 (CET)
Date: Fri, 30 Jan 2026 20:53:47 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Hector Martin <marcan@marcan.st>, Joey Gouly <joey.gouly@arm.com>
Subject: Re: [PATCH v6 0/2] Add Apple Silicon SMC power driver
Message-ID: <aX0L6Kb63My-PsGd@venus>
References: <20260126-b4-macsmc-power-v6-0-9861d4070f92@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c2qyfuanbzwu4v2h"
Content-Disposition: inline
In-Reply-To: <20260126-b4-macsmc-power-v6-0-9861d4070f92@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.1.1.4.3/269.789.21
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_115415_839464_2EA6E479 
X-CRM114-Status: GOOD (  27.05  )
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


--c2qyfuanbzwu4v2h
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 0/2] Add Apple Silicon SMC power driver
MIME-Version: 1.0

Hi,

On Mon, Jan 26, 2026 at 10:16:55AM +1100, Michael Reeves via B4 Relay wrote:
> This series adds a power supply driver for the Apple SMC found on
> Apple Silicon devices. This allows the kernel to report AC status,
> battery charging status, and power metrics, and modify the charging
> behaviour.
>=20
> The first patch adds the driver itself, and the second patch wires it
> up to the MFD core.
>=20
> The driver is based on an original out-of-tree implementation by
> Hector Martin. It has been refactored by myself for upstream inclusion,=
=20
> including support for newer SMC firmwares, devices without batteries,
> dynamic property detection and improved state management, among other
> things.
>=20
> This series is based ontop of the current linux-next at time of writing,
> the exact commit hash is listed below.
>=20
> Tested on: Apple M3 (MacBook Air, J613)
>=20
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
> Changes in v6:
> - Add FS header include for emergency_sync()
> - Link to v5: https://lore.kernel.org/r/20260126-b4-macsmc-power-v5-0-302=
462673b18@gmail.com

This fails to build as module, since emergency_sync() is not exported:

ERROR: modpost: "emergency_sync" [drivers/power/supply/macsmc-power.ko] und=
efined!
make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1

Greetings,

-- Sebastian

> Changes in v5:
> - Readd cover subject that mistakenly got dropped, apologies.
> - Link to v4: https://lore.kernel.org/r/20260126-b4-macsmc-power-v4-0-aa2=
a682ca650@gmail.com
>=20
> Changes in v4:
> - Restore Hector Martin as primary author for the series.
> - Restore downstream Co-developed-by and Signed-off-by tags.
> - Add Reviewed-by: Sven Peter <sven@kernel.org>.
> - Simplify MFD patch authorship and remove redundant tags.
> - Fix probe return value being overwritten by devm_work_autocancel.
> - Return -ENODEV in probe if neither battery nor AC adapter are found.
> - Add bounds check for nprops against MACSMC_MAX_BATT_PROPS.
> - Refactor macsmc_battery_set_charge_behaviour to remove unnecessary rese=
ts.
> - Improve critical_work shutdown flags and remove return.
> - Add comments explaining SMC key firmware history and flag meanings.
> - Clarify event ID descriptions and restore BSFC flag comments.
> - Remove redundant dev_dbg logs for missing battery or AC.
> - Link to v3: https://lore.kernel.org/r/20260115-b4-macsmc-power-v3-0-c23=
6e09874be@gmail.com
>=20
> Changes in v3:
> - Rebase on top of latest linux-next
> - Drop charge control threshold properties.
> - Switch to devm_work_autocancel() for critical work.
> - Add platform ID table and remove MODULE_ALIAS.
> - Simplify property array management in struct macsmc_power.
> - Improve probe error handling and device pointer usage.
> - Minor style and indentation fixes.
> - Link to v2: https://lore.kernel.org/r/20260109-b4-macsmc-power-v2-0-938=
18f1e7d62@gmail.com
>=20
> Changes in v2:
> - Added Reviewed-by: Neal Gompa <neal@gompa.dev> to all patches.
> - Fixed Makefile alignment by using tabs for the macsmc-power entry.
> - Upgraded physical battery exhaustion log level to EMERG.
> - Downgraded software-triggered orderly poweroff log level to CRIT.
> - Added check for CHIS key to skip AC registration on desktop models.
> - Link to v1: https://lore.kernel.org/r/20260105-b4-macsmc-power-v1-0-629=
54c42a555@gmail.com
>=20
> ---
> Hector Martin (2):
>       power: supply: Add macsmc-power driver for Apple Silicon
>       mfd: macsmc: Wire up Apple SMC power driver
>=20
>  MAINTAINERS                         |   1 +
>  drivers/mfd/macsmc.c                |   1 +
>  drivers/power/supply/Kconfig        |  11 +
>  drivers/power/supply/Makefile       |   1 +
>  drivers/power/supply/macsmc-power.c | 852 ++++++++++++++++++++++++++++++=
++++++
>  5 files changed, 866 insertions(+)
> ---
> base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
> change-id: 20260125-b4-macsmc-power-bb30389e05f1
>=20
> Best regards,
> --=20
> Michael Reeves <michael.reeves077@gmail.com>
>=20
>=20

--c2qyfuanbzwu4v2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAml9DD4ACgkQ2O7X88g7
+pqQ1Q/8Cb19xiApcNcSJEDxbhyxB4BudkaNoYUVQ6nC9MRDxdhiJowcBtS2vNx1
y2iSxyH+gbdMZEQnCQa08wa4tVfdPzfcuxUGCwYPdw5stfJh0gtPrOwXw+2H9794
og+JOvNXIL5yyF9ZcMeN0LOgv3WZmS5f6aNNWi03+SxOftbn3w2eAlCDTh4IghJ5
Rb8DmQorjenKDhKTYj3xZmDkTY2AmA6Xjmq6mHXzFlL1Y1hvTUtcWo4AOZOvII2y
peGq8faxW0jrOHpZ/Ox+9iEJ5mIONPVUw8Vpm/THCPtZuapHLHqGLC52TH3r+tNs
OvDUeTHIZbu0OlUEMoet3UrsKRe9/xiQU3MTpmt3d65uQtCmt4fKsjQqol63MZC9
8gDyhtyRq/O7/4hLM1/NzlEnxLtyeOeYJiKTYLlDN3F9tyshRZMc9YYkMqEgyEp/
urRR1L9hptutPIGqXfdhl4cybZLwI3id4f4nruU93dNMd9g8kDzq7U6yj1xRouX6
xXf6h4+qWvaPZlBgOg/UA0dVPhXJJuDPpn1uB2jRNmj+gaqAn88S0wbnRkXh/+hu
4q0E574Pk/RtB66Y1cv8N86d+rGDLvLQ1x1ycJTmJZwwwMT/b7ho+BQZ94K3Dnqc
Kc9e78af8k2Je0DZgEDG+Yln1BOeaBZK0UuuueXbj9WDfpadm4w=
=8UPh
-----END PGP SIGNATURE-----

--c2qyfuanbzwu4v2h--


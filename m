Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE56E7BD8F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 10:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73r6oJYAaTQYUPIRlcSqiRsKUT5t9iC1ySrVJ3cv2PA=; b=nPA1F92EnqqrYn3j2tuaYTEL4G
	jtcFJlW/JEVbzQCv9iH/xXl7osFZpq8Viiq9JxJ4X/pO2h79LCMxptuojgamhFF5YeIq/1JbVRYK1
	/mmOIqbGgBxCzNj4eHbfWjWEpqkOk8BPS988WJ145JAhy0uDtGKxrHlVremX7YGR/pkseBWBq+wAy
	WsNEAWnq9ZPQCgwxoyVAWReA8VjcxEY8QbN6tFPxs5/xvhck0u+hK6EWhPimyEmqF8+WORmZiVo6w
	WJtxaZxK51RaHsLJLbThPTDwM7DpDQ+iKFCWjvNdhX5Re0KKhWE+OxDI1hWRMIbrFFeVd9VfYPnkX
	Zx7GdU/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwEF-00000006Ny0-2ZTJ;
	Mon, 16 Feb 2026 10:53:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwED-00000006NxZ-1ePU;
	Mon, 16 Feb 2026 10:53:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E99F241993;
	Mon, 16 Feb 2026 10:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED90C116C6;
	Mon, 16 Feb 2026 10:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771239199;
	bh=73r6oJYAaTQYUPIRlcSqiRsKUT5t9iC1ySrVJ3cv2PA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OjIK17WmA0PJWl07PJBGiRBzUlffMMg2xOvZiE5oM0n6kc2Vd+/BhKjlBy700yag3
	 YKu3VHDVat4mK4p4XdZOeznRaw3ZDdBlWmCqn85Vso3REjKwvDAdV9ndz3yjccgNJB
	 CjSZh/dQj8kZiwSbwL7VhfyuN22WR0R5pbG5T9k8+xFTh/HtevsNdrGLFNLsxnnORl
	 GVM1WC6D9Klv0Ho2RCijaUoFH3DJ19vJO0W1zBnl6n7JqckbMh3PVT+NoSXw5BBIn2
	 X4Jp+/E72Gi7RxPth6eC8AoYL/FjM4IaJX6uoR5UDo7ptvBHtGml1T08DXaM5ihisa
	 /pVQzuZlUCWvg==
Date: Mon, 16 Feb 2026 11:53:16 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>, 
	Iago Toral Quiroga <itoral@igalia.com>, Chema Casanova <jmcasanova@igalia.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
Subject: Re: [PATCH v5 3/7] clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as
 CLK_IGNORE_UNUSED
Message-ID: <20260216-brave-ara-of-typhoon-cf90ba@houat>
References: <20260213-v3d-power-management-v5-0-7a8b381eb379@igalia.com>
 <20260213-v3d-power-management-v5-3-7a8b381eb379@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="7u5coffnzyskofrz"
Content-Disposition: inline
In-Reply-To: <20260213-v3d-power-management-v5-3-7a8b381eb379@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_025321_460403_A077E41D 
X-CRM114-Status: GOOD (  11.95  )
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


--7u5coffnzyskofrz
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/7] clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as
 CLK_IGNORE_UNUSED
MIME-Version: 1.0

Hi,

On Fri, Feb 13, 2026 at 03:52:56PM -0300, Ma=EDra Canal wrote:
> If PIXEL_CLK or HEVC_CLK is disabled during boot, the firmware will skip
> HSM initialization, which would result in a bus lockup. However, those
> clocks are consumed by drivers (vc4 and HEVC decoder drivers,
> respectively), which means that they can be enabled/disabled by the
> drivers.
>=20
> Mark those clocks as CLK_IGNORE_UNUSED to allow them to be disabled by
> drivers when appropriate.
>=20
> Acked-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>

It looks like sync_state would be a better candidate to handle this?

Maxime

--7u5coffnzyskofrz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZL3HAAKCRAnX84Zoj2+
dohuAYC0vDJ/FuiU+oa1la5DCBEUlwydHTREfOq8Kpked+NeLcX1cm7K6HxdBWAK
w8XBDiYBgPoI8xNj91inpm/hk0GtF3FcEv28ZHvBeTOznX63UWUs6ba5A4/AOq9z
JpUmgE0Glg==
=awDT
-----END PGP SIGNATURE-----

--7u5coffnzyskofrz--


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D814C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 22:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlUzblDYEjYCS98Pl5aItUlNWLm0f3R52njwTiqqC3s=; b=2bmmt3Zg7nz3jWwL7UmopPMVSb
	IfKNIyO8UAR15QZweLSJTi53Nqgae2QurIvXndhHTl4h+NK7RICbXkSOTfAGlDCwf0HI0cvf/6HAl
	cbLauv4lrkO3shgy2GVUDBu109mo1T+m+WCzXNm48QJrRjp41RX1Fye6SGxuzwDiXm8RIk/jGvJlk
	vNWKn6Bo8PGtptk1KhCGTqxwjY60Qn1b/2B4M1JST2Vb7hix/BHz7gzs6i4ANMk0qmqalxxW+tqW2
	Tpb25q7RAzg7f1Xtpq6yvXbuSLraU9xiWbWi74i8FHr1Ymoi6G6Dy9NxGLD3RJLM3S3+H51Q3Rr37
	vtdWyBTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEOu-00000002Tx6-1B5d;
	Mon, 03 Mar 2025 22:36:40 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpENJ-00000002Tip-2RfT;
	Mon, 03 Mar 2025 22:35:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741041289; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GejOG25tOtoCkI+YE4XWkXsIJPTBWqb+UgfAZAhzlcVlFx9TguIJRiy9aXih8TMNzNXFoykF46L1KF5uZzmPH67AFFvZGfVGOyKq9Icxm1FNk9WPJKL42JFMvK1yyKWSfxwhDxSWwGef6Ha5YdFqL7L+H1VF5CHYgB1OBaQgG30=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741041289; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PlUzblDYEjYCS98Pl5aItUlNWLm0f3R52njwTiqqC3s=; 
	b=kLzuwD/FsZ3wdDjrs1pSvD1Fzroo3ViwPQTfll2/3Ks3yAKQqwCqOou5tngdoqL3E6VlfzJ7S4EfIOfTi4Q8i331OGfGoDRiZ4T45XzuIhuKQoyGgwDoxVbUOnri+0cq2YxANGAe9g2+bhHPlvjjSI/vPcsoSP4EGdSQYXwTS9w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741041289;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=PlUzblDYEjYCS98Pl5aItUlNWLm0f3R52njwTiqqC3s=;
	b=QA68lz2y9nqvEmAh+PsVrmbG1C6sVQ9Fr4ZjpmixXoldvaSqhRo2v2gOpq/7iP+M
	rDXhD4MZ8svoTj4rlqTHuSqOneFkzzv3bR5SyG86l2MXv62MffBHzeNr6s30/hZzAij
	YGmZU4qFolK0P1sJv+jRZHVciMzR1j03uEgziYaM=
Received: by mx.zohomail.com with SMTPS id 1741041286829334.02204399221273;
	Mon, 3 Mar 2025 14:34:46 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 1766918065C; Mon, 03 Mar 2025 23:34:42 +0100 (CET)
Date: Mon, 3 Mar 2025 23:34:42 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/rockchip: vop2: add missing bitfield.h include
Message-ID: <quj727pq3oc4xruatx7s5hob7jtcpw6zhe3wv6fhammxhejcem@eois3su6izj7>
References: <20250303182256.1727178-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uxnpfa7xaeh6coyf"
Content-Disposition: inline
In-Reply-To: <20250303182256.1727178-1-heiko@sntech.de>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/241.32.4
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_143501_717071_CA69C108 
X-CRM114-Status: GOOD (  14.79  )
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


--uxnpfa7xaeh6coyf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/rockchip: vop2: add missing bitfield.h include
MIME-Version: 1.0

Hi,

On Mon, Mar 03, 2025 at 07:22:56PM +0100, Heiko Stuebner wrote:
> Commit 328e6885996c ("drm/rockchip: vop2: Add platform specific callback")
> moved per soc configuration code to the other per-soc data into
> rockchip_vop2_reg.c, but forgot to also include bitfield.h for the used
> FIELD_PREP macro. Add this missing include.
>=20
> Fixes: 328e6885996c ("drm/rockchip: vop2: Add platform specific callback")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503040135.fgoyWdLB-lkp@i=
ntel.com/
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/d=
rm/rockchip/rockchip_vop2_reg.c
> index 0afef24db144..f86a30df94aa 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -4,6 +4,7 @@
>   * Author: Andy Yan <andy.yan@rock-chips.com>
>   */
> =20
> +#include <linux/bitfield.h>
>  #include <linux/kernel.h>
>  #include <linux/component.h>
>  #include <linux/mod_devicetable.h>
> --=20
> 2.47.2
>=20

--uxnpfa7xaeh6coyf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmfGLnsACgkQ2O7X88g7
+prXag/+MoxGEPpemJ0hBwdSLvlh08UR3FhUgUQ07dWpX+Jn/qz1RSQi2zxlnFqp
gizw7mzUOFbi0+dXZhXOKCKmTa4jdP+SGujt0DBs4psQHQPMRrtokVb+N4IKKKDd
zH7hfzTI/FFEXjU4ayhYVsezc/5ilTrOcax9WDFuEeFVm8ORr8ntdg+vOYoXEPVa
kADBpAn23oPmHbHZCrtRUCN5eomaWiUxYJAW6vBAZs24D8Ne+JmvC2oekhasY1V+
5S9eVwkDncNSyipWAzFBSV2GM4NLKDXnurNc1GqOFJlH4R6o8dhGpTHxagizkba5
JmYqI8+Kc+FO3NyXL0mSOvMVduXJEqPFetIhn9KC4B0UDPoK63I1bXmAgh0wdyK8
Ge5heyM4TD6/L0Mu57aCZJjAwCyW2+ImB9EyXlN6pG8vyd5K7FDY3nEBPf7Pm+Y4
msgCWZmYeTMPYvKhoY1bvF8io19wFOATKNJZAiyFwGYKea3F53QWF7dSNahmq8Pj
PepbbEE20SxuKfK+ceiOb4KlzsRA2z5lL2+f04rej8AANsU6EPFkhNjRsruy26wL
dXocafGEvZChcpqS8EnJDjwVreEdUjFJbFca9E+LVEI259RAczoiv5fYkZhWuNag
23oy+R6C5o1LqVMmkLc7n0j4hzKNRzpfxDiRc7kzWLLSZb4Q4C4=
=zYzt
-----END PGP SIGNATURE-----

--uxnpfa7xaeh6coyf--


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3C4EF8FE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYFA42ojX02uc6vcNPxxquciL8D8ZUQxPHLK9Ii1tuk=; b=I/QkHDVznPRh/yzYDxbCXg6iGv
	SUql4AEEf6OJqbx9q3N2qp8O+m6JTmZmVR68kLbIHV+v4WzJuPXAzdM09T5RaU5ZLf03TI4ZEubEn
	FnAex3gMfY5qf+BmrYjNu46vGb8B9KU/ouz5CfLCAWO7gYwiSm0XwNZvIbI+gsB8QVuyqEzbXM56z
	g6+ODGIaDbHsvDENv+cCPjMuHBAwR/HkytaFksppZM2+VrMpgQTlXd5k5+SCAbNvqlE/XWH/sIhB2
	tDelNmvNyTeU85Jq7hka7VcDM1/mRYyiPEIYBgkZCXB74jCRUfn0GpqXdwVYpM/QdVzUQWtAX7VcU
	uA8pNB9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn1D-0000000HMhe-1O5W;
	Wed, 04 Mar 2026 14:16:07 +0000
Received: from mx-relay47-hz3.antispameurope.com ([94.100.134.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn19-0000000HMg0-0DWF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 14:16:06 +0000
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=FYFA42ojX02uc6vcNPxxquciL8D8ZUQxPHLK9Ii1tuk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772633704;
 b=jkIQUHz3axM9c9dryrQU5IajIlrBzkaBu+vk/+TS9CT4zybwRTo8GsvV4KVMnda5rfKnRaRt
 idMcK8KzmRGsCSmI/15WB+cgzYCNn3O93X+A08Z4w1rYe1kSuVGwcENkyepqorg6gcKT4v95/j8
 n9hVrFXC6vypVS3KQxT9bXhHv2e+q+YRrLjsMsvtcO6CnKns5fNt53JmVQVYVq1itd34Mz+OZ6A
 /0llCuhrwwjl4bToZ5bxl4szN046S1b0q+2rFH2SMB1Ian6k6fDPX2wKXdV6Y6DQbE1B0qYuTeg
 aYc1aPzwwCSEsjhyW2ZlcDTLctdNZKORTOhIeXxQVk3cA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772633704;
 b=OJFzOFRDnM47BEzr06RFKz6LD1Q6rGOqZzewhukk/CffK+msibl52JurFetlrxqLreVUuaA3
 PX5s4SDLKzJGO4ZdSPbTyetWULMnpxBgExTdZfgPIjqWdknga3MUj5lJvswUoS/0sFWNVDUABKX
 3fuhINxLHcmw0pCs/MI6jVq/j8LeLMU6+T5douFDvCHnWI4S9cwBqaq5Mep3usZoSkPG42EPArO
 5q2AefcSR5bdLKXTaWMJ1Jv1UfHXIY1gqqejNnuEeVyV5T+mxBwdpL9rzK8J2Qw8yd8rblJQbua
 tNaDfjZsmejv5pP5OrkV5X0qmrPlLId02cu6g/crrd7PQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Wed, 04 Mar 2026 15:15:04 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 35234220EC7;
	Wed,  4 Mar 2026 15:14:55 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>,
 Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
 Vinod Koul <vkoul@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Max Zhen <max.zhen@amd.com>, Sonal Santan <sonal.santan@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] dmaengine: xilinx: xdma: Fix regmap init error handling
Date: Wed, 04 Mar 2026 15:14:55 +0100
Message-ID: <3640054.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251014061309.283468-1-alexander.stein@ew.tq-group.com>
References: <20251014061309.283468-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart15345406.uLZWGnKmhe";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4fQvnW5SSxz4Mb6T
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 18b88d27d6f57275e2308e9afc64a81d
X-cloud-security: scantime:2.059
DKIM-Signature: a=rsa-sha256;
 bh=FYFA42ojX02uc6vcNPxxquciL8D8ZUQxPHLK9Ii1tuk=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772633703; v=1;
 b=hhvSD9dx3FTtc+0C5Pin6Z5+jml74pVLHAQZbakF4aoqcsRoE49aJ0XreEgTouBhaZVYCdlp
 ExtNANSixuCYr546JNo1sdC80/dz2N441htk3hfKWH31l//kkbKtUGomYW8KTltJYsRtGKhxUDx
 12kQInlaTB+Mm5J7+4Yi52v02WY7p/1wgbnSlx8/8Kr3sCTbZ9a5EcH9F/VDVIlyxtOBkUTcibW
 jklKttb0hvN4Mf2Jk3G9LMe1u4CWm1+ggY7yb0tgeBsFx81Qpf2AnXzOJlniaptObK27xMPnqV7
 6yhhwjIBbtmciP7f3X9ZYSpsDTkxCTu9MOMB/uJ+jd1Og==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_061603_349025_D7B026BE 
X-CRM114-Status: GOOD (  21.47  )
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

--nextPart15345406.uLZWGnKmhe
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
Date: Wed, 04 Mar 2026 15:14:55 +0100
Message-ID: <3640054.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251014061309.283468-1-alexander.stein@ew.tq-group.com>
References: <20251014061309.283468-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0

Am Dienstag, 14. Oktober 2025, 08:13:08 CET schrieb Alexander Stein:
> devm_regmap_init_mmio returns an ERR_PTR() upon error, not NULL.
> Fix the error check and also fix the error message. Use the error code
> from ERR_PTR() instead of the wrong value in ret.
>=20
> Fixes: 17ce252266c7 ("dmaengine: xilinx: xdma: Add xilinx xdma driver")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Ping,
any feedback?

Thanks
Alexander

> ---
>  drivers/dma/xilinx/xdma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
> index 3d9e92bbc9bb0..c5fe69b98f61d 100644
> --- a/drivers/dma/xilinx/xdma.c
> +++ b/drivers/dma/xilinx/xdma.c
> @@ -1325,8 +1325,8 @@ static int xdma_probe(struct platform_device *pdev)
> =20
>  	xdev->rmap =3D devm_regmap_init_mmio(&pdev->dev, reg_base,
>  					   &xdma_regmap_config);
> -	if (!xdev->rmap) {
> -		xdma_err(xdev, "config regmap failed: %d", ret);
> +	if (IS_ERR(xdev->rmap)) {
> +		xdma_err(xdev, "config regmap failed: %pe", xdev->rmap);
>  		goto failed;
>  	}
>  	INIT_LIST_HEAD(&xdev->dma_dev.channels);
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart15345406.uLZWGnKmhe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmmoPl8ACgkQaS+g2M0Z
/iU+vAgAhVn/PEgWR46nYGIDjXs2WVYaZ0jy+MzJwSpGsh+jaFAzTvUpHE16Uc+1
UYxIMMl0imWI1gGkg1woWnlr/9sHrleN8tAq+cXWZbC7dwaaOonIxJxI5bUvSXPq
+O7zYQmMYhP6JuzCpiM8q5WkbYUX0EanSx/OrSpCdVID6Daw5C/kmEGPdN0YNvMY
fIIE9wijsqrebamhTMsztxaQkBIcZagLCPq7+EfMDlvbKkQnDZdkWqijKqO3HpZe
jOsrYjvi0J7/5gwNl34FHAxYKuxG0YObJLjeGIryMAFGfxppTqmjQNT+XCSIjWX5
pRhqhNyqrTlwekwdXcynMNnVfVEi0w==
=tJUS
-----END PGP SIGNATURE-----

--nextPart15345406.uLZWGnKmhe--





Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23AECC6B2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 19:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSGlkJ/tiRxSKCByNYHm8CeLHYrmmbBMOlrabqcMMZ0=; b=Djwt9VMPBDLkejwzSoCOsHhh+l
	Pq0O0nkH3JEp4QDJvolc/W2arg7c0G8GDMPt7ZRgj7F7OwGXJznBobwN1m38dMyh8OS5PI2JQNcbG
	6Y7wcndxXqOdJNLHDVztXdqnEJRmtPyr5NKZ0O5G1m+6bbyKkeLlWCkb9qUu5sDdVS+FWty3vp7rI
	l0kbravH6KwQW8fuHaKr08hSrRx8L0C9xAnquN2VNTHgsEpZZpQ67Z2kz0woRhOkYqZD9QUTa/4+t
	G9NG+T1SWAcvctsdplzEAefg22lQmoyaLVMVSdU2JzE7C9Rp5eT3z927wlsh5Yt63wrfSDyrVxiAE
	xNteyqLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH4pN-0000000GDRb-2fTr;
	Wed, 14 Oct 2026 19:39:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH4pL-0000000GDRE-2lpQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 19:39:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a02718da81so36444185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 12:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792006790; x=1792611590; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSGlkJ/tiRxSKCByNYHm8CeLHYrmmbBMOlrabqcMMZ0=;
        b=bUoo8DWdVUnskS+nRYZNOC0Ac73Jh1nvJrdbAUbERl0HumKEFzhAC8PUsuVid0DTgH
         A4q32XyZptM4Y5+twFy3+ohNDi+CFwXUqS0LJ1EKhkpPQzmxE1krURevf82ccteHejsG
         5Y32fG/JhAgEz1j2OOmCdXL3BPWdft9s+3pnf13h2RRKXHBkPlNWOnU5ylxLRLQCt2yy
         K3U5Ak220+R/s0wn2AZTA9wbyElw0NEHSiXrC5ZWf88LrXy8e/fEiuVFmsKElabDitt8
         grv5X8uTQtLTHB0giyWG6V2QfUyUw6UGI96BTPcIz87cs7ZyFFxUONHBoOui7FuloWSy
         0V7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792006790; x=1792611590;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qSGlkJ/tiRxSKCByNYHm8CeLHYrmmbBMOlrabqcMMZ0=;
        b=sMwd0jx+zYBlCKcxd7AvPia05gyT9VMamWVhO2yhQ+oxqzJUWS6gR7HNhw3iPkLh4X
         sv2yilviFrmU+QdzD33qMbF4pRlIXZFvasJUBAHMGtFNelx5Kt1C4+c2yzMWo5NauZgU
         5coztnlEDD05BmtpfMWCza3LcVT9YayWCJSBtsvQFMWeQQhAW8rr2cwFD9G2Aa8Hjp7Y
         ihAI6jvr8lMaHpE+HcqwYOgIPZkzFeshXz0hwbeh8GL4I0dmWqaADylAQuRk9YQM9m72
         Mqzma2bBIR/NNyZDvMwmFyL0Rv7rQlPpb/PnbGIV4OQDPNbOXk6r0P46a4blB33T4H1T
         Qx4w==
X-Gm-Message-State: AFq9FYJRi9J5i0ZRBwMeByX48QDtgqI/Zhu+vpS3rgzvJt7iDE0n27Tp
	UagQbn+cxB5C7Ewc12jlxFuAHOTDV2W32BbUk//UpgHYF6HiXzzZUc/9WQ+ZsYX3
X-Gm-Gg: AYBFou1JrenkwsQpmwWiSH9WxFAXWkT71P4Q2dj/iLcl/EB3PQ+vqkMoMsecnK3OWa2
	oL+Vha+a2be4hLciIvyt8kTjrK6IJ8MiK1cX9WVm+azBWx/jZA+4F7/EdVB52LVa8OpY7SBaHdx
	RjsbOe5ykoJAQyGUrFhTArwrrgrhUQudLk+xnZL2LAcr0anhkaEPNenuvQXh/M9+yIOdRr9AncB
	UGr6EsD+UUqommFtCoiGKX3zNfj4uMoBt1Fs1u7jmA8RWyTJj2Ybu1gWorIVAtxiqm2nSJOONVt
	6xijy7PllYsvyj5mizaYTWIaJcuzICxCJa9/w00vC9Ba/mO/9NgwShD5b4DWhKwMIedY+ldKaWw
	jFgjU36WCxvOQq/3Vf0gUlBRopZ06/9tGEaYUMaHuBNz0uHT82x/ORWfzXI2DrfmUawI/tEu7Kc
	SIxSFHfQvGg/iDwl0AyA8VDTg0utE3EtoudiV1+0tqnsKaL0k8hAAbBktHG6xmtqSWnTYCdx+j9
	AiF246J+MqQCaYcHpi9nlB2BqxCV1OU0IcbT+Gy1vU3F1FKTOdU
X-Received: by 2002:a05:600c:34d4:b0:4a0:108:3b54 with SMTP id 5b1f17b1804b1-4a18e4d67d6mr324712255e9.32.1792006789573;
        Wed, 14 Oct 2026 12:39:49 -0700 (PDT)
Received: from silicon.doe.home (91.141.74.240.wireless.dyn.drei.com. [91.141.74.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd67b125sm10387095e9.3.2026.10.14.12.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 12:39:48 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: arnd@arndb.de, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 06/24] clk: zte: Add ZX279128S CRM clock and reset driver
Date: Wed, 14 Oct 2026 21:39:42 +0200
Message-ID: <86bpNzKYRniAzc8v_5Lpqg@gmail.com>
In-Reply-To: <20261014072109.1759502-7-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-7-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart0ktEb2oPSPiRPHnKcsrTTw";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_123951_753775_270C8C54 
X-CRM114-Status: GOOD (  12.16  )
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

--nextPart0ktEb2oPSPiRPHnKcsrTTw
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Wed, 14 Oct 2026 21:39:42 +0200
Message-ID: <86bpNzKYRniAzc8v_5Lpqg@gmail.com>
In-Reply-To: <20261014072109.1759502-7-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Hi,

Am Mittwoch, 14. Oktober 2026, 09:20:46 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb=20
Navid Ghahremani:
> Support the top CRM and low-speed peripheral clock controllers of the
> ZTE ZX279128S SoC. Implement custom reset controller ops mapping
> logical reset IDs to internal hardware register offsets, and provide
> CRM2 clock gating and reset controller support for PCIe.
>=20
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>

The comments I sent for v1 still apply to v2 I think.

Please try to reuse the infrastructure in place for zx29. Ideally clk-
zx279128s.c should be just static data and a minimalistic _probe function t=
hat=20
invokes zx_clk_common_probe().

The drivers/clk/zte code is upstream in linux-next already. The MFD and res=
et=20
parts are still missing though.

--nextPart0ktEb2oPSPiRPHnKcsrTTw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrP2n4bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiBHoP/1/qah26RVyfGWoIo5XU
a6m6WDESfjpMjuAWlMdAaFxD3xPutu+BcnejO8nU8S3CdKLnNWsPSD13zwk7ZvMS
HsNdJaATkvR148jd3JdikQsrg6X9GIm9OISzJY2aL+wbABR3eR3OeL9Yfe6O8oer
J7hteZN+T7YrhJbrfUtJ67wnfQyzrT0U4asJM1ieL7/wqX8tcu0ATRm/h/dg95Rt
Eku6mMHUTqq8dt9+p0wxYFD6F62iI+6x/f0Ka2I0Ywewd5g5SD5aODyMHf9R96mc
Ps1dE1quyR+FrmT2Pi9H5efSftynT+96E0y8Uwtj9l86DPvSVJ6DYluyE0ARPdpY
OMSJt2X2WSAaY0rz9MMUTy9/qLGk7w/VB4Jdkhrc9CNk5cB1r3Z0fWRG9s2xrJIP
UszhDfMwrYRUapevh6YMMSedDOP4SGF4d/HNQhf2ihgx1fT8npIAB2QnRhBmf0Hp
wTp82GN/2FzU9NCtOqpqxStEQJgBMIi8+JlD5SrixgbU6MTzvw4ZQaIXWKAknIGu
rIlKqu9JHYDhTKPGS6tNLwMJ8Xv0EXVRXQlHzNlUDFdDQIV2DIUQr7XU3C1B1rzK
vq2zCuf7xEsTxe3WbMh3OEgGl5LhApkkPG3ehDf7qL87DWw8ES9gVc8dnamjvy07
Cp5RQIo+S9rHalad5WqiGt6+
=93mx
-----END PGP SIGNATURE-----

--nextPart0ktEb2oPSPiRPHnKcsrTTw--





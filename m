Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D28D711D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oc7It17KeilgegxeNRo1i/RHu/E39oXWX/QlQF0RCQ=; b=nkAD8rHrPGJbEKM4o0/2ob+tNl
	gDzcloCGqFEFLxvG7Ir5rBfOgWBfJ148KJ8p26JlUa9oiX59PeGo6t6iYNu4odn+72pxOpP0ae3VQ
	6qSN/3x6DeBxt2Db7Nj5mQAyu878KkJ7Is9Jn3VyVLyIoISHvqCc4E81+yDl09Lgi18tQkzg2Qq7Q
	tCTeeU4I20hWb5Z48XSjfylSt5oQuDQ86+NtTBI4ydShpLLJ9S5iQDR04GiF3wZr4JsMk2ooij0Xk
	ShTBoMt4zgNuLGYNhtkkvbtOP/epGwcPnPx8m1j5t9+Y09PWPftYsL2CsOHGZCWV99K8DjxyBbeu2
	9Ig3YhRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWEq-00000009tRf-1oHy;
	Fri, 19 Dec 2025 08:53:28 +0000
Received: from mx-relay59-hz1.antispameurope.com ([94.100.132.230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWEm-00000009tQm-3buD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 08:53:27 +0000
ARC-Authentication-Results: i=1; mx-gate59-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=6oc7It17KeilgegxeNRo1i/RHu/E39oXWX/QlQF0RCQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766134378;
 b=MPBot093hirLrpLFQ8QTSFemMw7n1vi7Y5dFkSXwxYh2Ic1ytvxcMjhddQ6ZxILJQD/uKt4L
 YffbDwZinZ1e1qnZVxZ2kJaO7/G296oG5q1y7teOGcOLjQwBKVHOQeeNet6o97BFpGt2+mkU3G6
 vCTACsqzni4mdR+q3N4jIQpkJ8nYko1DOM2ZnWVIuxS8c/9FRVUPov7FBwNJgI8nH+cIkW4tauc
 xrM5k2bxzz6qbakierh2PUnDiM9dJt2Ndl735aTOLYwj7WXlmLMMesWd82iSdcIiH2txs4tfxGQ
 OCyiL7rw+jKFsUh8QMyH1ApOLdah96jQV2xNlkK0PLPKA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766134378;
 b=JPsy6vu6lHh/BhHtmDlZ5I4jA+DmwpMokVL9AYFJ6NmbvYugFlqak67PBgglVRLTfiEhs2xt
 Ke3Tg2whn9NF/N6JLneCDHKQ+vF4OWFIRo8v4nvuoghjCqmJYn1JXa+sdU4tGx2hRVmXg/PRjkg
 ZoM+Rh5BaigwaLbn3LqkSKsQHu9wpqw5Adu4KujxqnsrW6bLxkM1X6HD/H0aS9mg40cNgbSHQuC
 ugqf830UouvHuTb17KfNZ+crwaa/ZZmOI/oq7yTyQHcUXpCU+MyBuNO7X+4bSKxh2z7xFVEhyHl
 QQ77kJylrTwgiQsxoo2lsubuc7aGWQIQO986ubYjHl/Uw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay59-hz1.antispameurope.com;
 Fri, 19 Dec 2025 09:52:57 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 2A461CC0DFA;
	Fri, 19 Dec 2025 09:52:41 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-usb@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH 5/6] arm64: dts: Add TQ imx8qm based board
Date: Fri, 19 Dec 2025 09:52:40 +0100
Message-ID: <5334958.kQq0lBPeGt@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAOMZO5CmP_rdFA=PqGSmKDU+ObzifHFDjwYMD3J67bjs0h_sfw@mail.gmail.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218154412.1524249-1-alexander.stein@ew.tq-group.com>
 <CAOMZO5CmP_rdFA=PqGSmKDU+ObzifHFDjwYMD3J67bjs0h_sfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5083097.iIbC2pHGDl";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay59-hz1.antispameurope.com with 4dXhBL1g4tz2H3m
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: ec9600c3e752c55b521189496a3b09b6
X-cloud-security: scantime:2.013
DKIM-Signature: a=rsa-sha256;
 bh=6oc7It17KeilgegxeNRo1i/RHu/E39oXWX/QlQF0RCQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766134377; v=1;
 b=WbpAvVVzhueSSr/Cp5VrAXK4iGyYJtTLGKsIUE027xzqHi9aT4vrGVz7HH5vaRVKaWvISDP3
 0kGw+7QisLpZ4K8baohKun/KfV+CDQp5UBrX86Wln2wbnYw+cmNQ31jihc+93N36ap0jusPNUr1
 GKc77auIEqaoPH86uGB151x0nZL9dHY5QLebj8q3Vl+b2Vj997SLekZ3/gXHC9FE4dga8+5lRkd
 qUr3LQO+kLr0O0m+ksHXQ1Y+uAuBDhx27Bd/kCXYBOZG35f4hVRycB8lAH6dfYxc+oDDkz3zazc
 Q/d1M0Ss0QlcR8/8K7xGFAttqYvhTKSjLQzPj1mx9o9rw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_005325_822643_E87F3FD4 
X-CRM114-Status: GOOD (  14.12  )
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

--nextPart5083097.iIbC2pHGDl
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: Add TQ imx8qm based board
Date: Fri, 19 Dec 2025 09:52:40 +0100
Message-ID: <5334958.kQq0lBPeGt@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0

Hi Fabio,

Am Donnerstag, 18. Dezember 2025, 16:47:33 CET schrieb Fabio Estevam:
> On Thu, Dec 18, 2025 at 12:45=E2=80=AFPM Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> >
> > * TQMa8QM on MBa8x
>=20
> This commit log should be improved by explaining the SoM and base
> board in more detail, providing a URL, etc.
>=20

Will do, thanks.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/
--nextPart5083097.iIbC2pHGDl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmlFElgACgkQaS+g2M0Z
/iUH1Qf+IxHFSR95T2hBQwwM9IgO1Inlb91z7oiYIXySTXPCEjG6Av5RtEuSZl2e
O+dt4h1CE9XXqLEY2DVjSvlFAWEx/L5EUisdPyJ2tXGliCgeVwF3XZW+C/ovnfdO
7jhXmGvdD2mFi3CO/wVemv1ppF7bMUby3dnyTDOjXVOfEf3a2hmT31pMqWgYzhCE
dEriyn7CXcQo1ZnNKjApIPZBVIaIhjkEXeghiUl1rTOzg/UHKF4vDfxXKyPqvDVV
RadFi1ad3RPyf72KEX3v6++BU5qn0jEjemNtK7XNRqfGZtPVUhT0N0fDiy5hAjIl
prnxK1jJb+NOc19mnDS82JD0ru0lOA==
=Q+zr
-----END PGP SIGNATURE-----

--nextPart5083097.iIbC2pHGDl--





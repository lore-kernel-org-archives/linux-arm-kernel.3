Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C332D1951B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 20:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ais5eYTz0FEi4g7TDPCp4ZvDHB2QcWvVDHizRUb54QY=; b=X6bfuDbiyHVgkuTVkLVrIOXspx
	w7lRf8SXDuO+0YCYeLfdyf9UUdOlo2lR2Mz5Mndy0hRwvGzfMuB8BfYkvJjuug3LiAX5Rp1eMwuaY
	EbFWW9kPpw5fZ2Kd7Qfv1f14JXArdcP07X0yEMSbcgUwieudZUH6wVeDOYubKg8HM+lLincS6AvAQ
	82V3DSjPmCOPMA6FsAJZUCUdQvF3bMUnwxMVecL/1bocN0moG5LAPavChS76uXl8WKad1BhYl1FbY
	PhNPMxOc1SmEF3VQr7+yz+f3YFVDT0DMAqj8aH1eFmZYaliNWQu5yp9odMb3P36SY/8qYOqIz1GBK
	xUWK9B4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTYp-0000000DERE-0wsU;
	Mon, 26 Jan 2026 20:51:47 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTYm-0000000DEQl-3iGT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 20:51:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B50F710DE37;
	Mon, 26 Jan 2026 21:51:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769460702;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ais5eYTz0FEi4g7TDPCp4ZvDHB2QcWvVDHizRUb54QY=;
	b=XOxuYDiGvcqMOW/E7Noo5Lvjsb5ixgU7wvCfIyaTR6SPE6tjRdsX5oTW1FIb0Ck1eAaW3x
	U0BxklQgpYosP6GAlcC9ZhmyygmtsIHoT5gzGYSclaIymmiY67NjL9Wa2/dYMSOJryKYVB
	dH91XMYPLuH7Ez+JbG8V2Sf0f7n+qu79lpxJEAj9+cAZYwm6CMtIxBLS6jCGTiGHX9zxXw
	8FqCw28u1t/NzMgiDU56KTH8/QJ641XWIlyz8yvIK6Cb0GI576X7g2B4756QDuyZqWfM/d
	5N21V6b/TE/KdyWisEgC8q7F3VOF74qVJvpMbduoPoFdSOVTIGKXxK5W1iIIDQ==
Date: Mon, 26 Jan 2026 21:51:34 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Abel
 Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] clk: vf610: Add support for the Ethernet switch
 clocks
Message-ID: <20260126215134.25814c5a@wsk>
In-Reply-To: <CAOMZO5C2Hg06wb08cRDLCXGDS_rmUAq3fC7Jm++kSumjukyuXA@mail.gmail.com>
References: <20260126115349.1750578-1-lukma@nabladev.com>
	<7671b833-f823-44cd-b5af-0b473a8ae23e@lunn.ch>
	<20260126203307.6076ba9c@wsk>
	<CAOMZO5C2Hg06wb08cRDLCXGDS_rmUAq3fC7Jm++kSumjukyuXA@mail.gmail.com>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_125145_135985_60B0F296 
X-CRM114-Status: GOOD (  17.48  )
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

Hi Fabio,

> Hi =C5=81ukasz,
>=20
> On Mon, Jan 26, 2026 at 4:33=E2=80=AFPM =C5=81ukasz Majewski <lukma@nabla=
dev.com>
> wrote:
>=20
> > Conor (on CC) explicitly asked to remove VF610_CLK_END:
> > "[PATCH] dt-bindings: clock: vf610: Add definitions for MTIP L2
> > switch"=20
> > ------>8------------
> > > -#define VF610_CLK_END                        191 =20
> >
> > If end is modifiable, it is removable. If you need the define for
> > the driver, please move it there.
> > ------8<------------
> >
> > I just follow what he asked. =20
>=20
> You should still use VF610_CLK_END. Just define it inside the clk
> driver instead of in the dt-bindings.
>=20
> Please check these two i.MX93 patches that explain the rationale:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?h=3Dv6.19-rc7&id=3Dc0813ce2e5b0d1174782aff30d366509377abc7b
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?h=3Dv6.19-rc7&id=3D0af18ba60752e8a4ba34404c1d9a4a799da690f5

Ok, if this is the agreed approach, I'm going to use it.

Thanks for pointing this out.

--=20
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic


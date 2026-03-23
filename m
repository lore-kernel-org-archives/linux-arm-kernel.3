Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB72F483EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/AltQxVMRaDiZn/otYACU056eFGHpp8ohsXtQFKkbMg=; b=G0YP82BzYe3JqxTOPj4hJj5XLj
	vbEDKwwpIfhFN/EahbJ+ELBWxg7cd9OSTq4WjxWQsgKuV/2LM8fcMmiT+2rekxR5QCDRF+yCooN3I
	IhJv6b6ySSjE9g3WAtnGIUrTk2AhHoDrqQM+nsrgGwfkYsSGqBNmu+E/u1n78ys4tm4Cbpl1O6z7I
	eTElsnmm8/sblfIVXMzStqLWbmTxeafJqR5Uv+MZNQ9QsJ/HvJ1IdrYqDMdR0gVGTZVe67ExagDUG
	4Q+IWbpNOEp+J/6bkEuhMyGKRr6koKUpsC82pYEjIgzpIhf5aazenlz/0RsGQLp1EsyIfOvmobWa/
	YuY50DTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4l3e-0000000HSFS-3sEO;
	Mon, 23 Mar 2026 19:35:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4l3b-0000000HSEc-2xeP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 19:35:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A59B443B6;
	Mon, 23 Mar 2026 19:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB6FC4CEF7;
	Mon, 23 Mar 2026 19:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774294522;
	bh=/AltQxVMRaDiZn/otYACU056eFGHpp8ohsXtQFKkbMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mw723Ji8ItqQwUkwxJcN/Lz9ZCPbLplRhgd+/HWLjYYhaaJLwqAchXAPVB8RAhCA2
	 RJQ4xB1wv9PE8mYmtagQpq6CD2sp5GucDxge8kwOFo7DLsxOwa3Ol/DUDgI+3GpH2W
	 UryNApEJlAgmW9xEL6N/ptwGGPL/omQbNMntwtTeXGBJt5lnc4AxwrpWBdYQOAm7DU
	 KUWKu/LxUSCOfgJvc/8yCR9S4R2sQermq2LugTuYmsGfIFXpKjUpoZFLUwx8IVUC/h
	 9DwUAdT4XaHKI21LeFuhUCfdYjrgLaj4We1bDNeGvs+jL1zvmNsRKC7YWtP8uOmqyj
	 WbtjNoqX0a+xA==
Date: Mon, 23 Mar 2026 19:35:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-can@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Andra-Teodora Ilie <andra.ilie@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: can: fsl,flexcan: add NXP S32N79 SoC
 support
Message-ID: <20260323-treadmill-enactment-2aa03aaf785d@spud>
References: <20260323135827.2129371-1-ciprianmarian.costea@oss.nxp.com>
 <20260323135827.2129371-3-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8gizptVAuJfhu7Yo"
Content-Disposition: inline
In-Reply-To: <20260323135827.2129371-3-ciprianmarian.costea@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_123523_762952_487DE0EF 
X-CRM114-Status: UNSURE (   6.67  )
X-CRM114-Notice: Please train this message.
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


--8gizptVAuJfhu7Yo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--8gizptVAuJfhu7Yo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacGV8wAKCRB4tDGHoIJi
0vsFAP0btJesQ6LLyqyvxF+cJfSUf05z8QVlm4W0g7uyZH6qDQD/QhkoMM9OvPji
TI2/IY8edpfBbuYsdSQVYhOjy7CapgI=
=rX6j
-----END PGP SIGNATURE-----

--8gizptVAuJfhu7Yo--


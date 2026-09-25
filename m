Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBDEC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 16:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0VoGDzcMAmv6Or+++plvdMsJr8cWNXzmxPzoPDA5cs=; b=RpdxxGV0N+hgvue8URRauCpRlx
	AXjUZPWZJ3FVGBJ0G21hDGIbDC3c0TSRjxv1vlaDwoUWPRJGP6ai4e2zZtWv2aeDlC7If5mk8QQ0E
	Rr08Yk4UBE3YXq1z8dRMIm7RQTzVl0GhgAjm6n7fMUO9TSCdbT7XYX3CjXZr+ieP0LR4ACXN4zEMc
	wPDrdS9gWr0bPjWdXoV83UU2r2mfZzehzZ9K2pLchOwvRNcfi+hzE0AmDtXPDcrlmLMZsmuRzASLy
	csiMStw0ilHs3q/RhqH46u34qDYKbRuEbsKC1HGSdIiwC/SnZsCJO9BjW6YVB0FRZdGA+SQkwFg0M
	toPj5c3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA910-0000000Dz5z-38aN;
	Fri, 25 Sep 2026 16:43:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA90z-0000000Dz5l-3oZp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 16:43:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 41B3B6025F;
	Fri, 25 Sep 2026 16:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8697B1F00893;
	Fri, 25 Sep 2026 16:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354593;
	bh=C0VoGDzcMAmv6Or+++plvdMsJr8cWNXzmxPzoPDA5cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZC9r9L3ipKqdS4ni6DqvA4ARifkGSw3WL51f2A9NTR8yWW3oXp7kmpJ+2TUce3Uj7
	 7xo4sU9RrDyA5uUkuJi3bTrxMUrh0ygYjCX8UVIUwC6TOj1uk2fLT5Vtf8BrJtiI6I
	 HnZQZk0dN8jJJMZRQtPMc4aXQyd6h+j2jDZiJMQH4aqmdpayDnYfWHczqPw9RpyYr3
	 3KVRGwckY9cwViH9/0ZAJgJbvQdSuYLjWxuf6aR1CUelxCzwzd3Wurkpefw0jHxECU
	 sHT4X60LzL+/eDFST9Nxpe4mtszcg4jPEBcSLrjp55c7JeGsfBld+PNflsCTVCJSeD
	 57aXjMA9rW1mA==
Date: Fri, 25 Sep 2026 17:43:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>
Cc: NXP S32 Linux Team <s32@nxp.com>, Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Ajay Neeli <ajay.neeli@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Pedro Sousa <pedrom.sousa@synopsys.com>,
	Joao Pinto <Joao.Pinto@synopsys.com>,
	Hannes Reinicke <hare@suse.de>, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, clizzi@redhat.com,
	aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com
Subject: Re: [PATCH v6 07/12] dt-bindings: ufs: Add NXP S32N79 UFS host
 controller
Message-ID: <20260925-afoot-tinsel-096f8efd16d3@spud>
References: <20260925143534.3298540-1-larisa.grigore@oss.nxp.com>
 <20260925143534.3298540-8-larisa.grigore@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dh1WmLbrcdsVY8Bn"
Content-Disposition: inline
In-Reply-To: <20260925143534.3298540-8-larisa.grigore@oss.nxp.com>
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

--Dh1WmLbrcdsVY8Bn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Dh1WmLbrcdsVY8Bn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarakmQAKCRB4tDGHoIJi
0rwoAP0dM83jHfdNPJ071+EP930GYRzZ/9MxGHj9aiDL/l2yaAEA72eN8EreupVH
+nObbELyyrwyJ6xSnymW3QYolOyVhAk=
=8Spa
-----END PGP SIGNATURE-----

--Dh1WmLbrcdsVY8Bn--


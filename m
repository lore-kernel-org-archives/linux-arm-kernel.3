Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1785C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 20:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgcXqzsJ35C/PK4z8Fxizm06bZbpDKFlJX69a+ddZIw=; b=MCMu5bNwz9lhrhpl5iTw5pV1IP
	4yFZ/GgUEq1J6QKyJgvGcuynjNPNlQ752BUWKYbu0WsQTmXyI1fF52UDmdpst6xqN3HwkHKhtgNTI
	JrHvBVdCNnFZiyHv1h5MiDbOnY+ko1Aj+TpMylKrHSq4gOBcRQ60qL4biTh9TyQlcmAoIWpm0m18c
	hpTW1iPPBRdHY4njHxA+wQq7FTVWxXp/02XOZ8m/C/vgosB+38buDkZWeR+WGPGh2i2kPLkPjZwcr
	Vpo3VIXDorAhLQU+Px3M032xtVryIc09cpiwtJ96a1xkMZYDIxt1ktWVuBcQmqXQFuN/SqFW/U0uL
	287pWfOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrLMX-00000002k8T-1t8H;
	Tue, 04 Aug 2026 20:03:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrLMW-00000002k8F-1JuP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 20:03:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B6F2A60A64;
	Tue,  4 Aug 2026 20:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4F61F000E9;
	Tue,  4 Aug 2026 20:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785873821;
	bh=hgcXqzsJ35C/PK4z8Fxizm06bZbpDKFlJX69a+ddZIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DHBLK4/fuO9IlkUVgoLTEUFYY0EEsosgnKWNZgajxagXKV0C69A6E1Dk/KEnkKsvB
	 hb/xEtUZOJqQI9iN+3rtVMCzXGUm207bf2zKfDWy+mb0X7IYl5iWRlOYonWcj4jHMH
	 9ksSI0CT4r7l80SIR7+WbZbGU40Z2YpmIxpQBI19J6oBFJiGRmAGMTvgqvRt5ZCr4e
	 Cd6ChwfTIfotm+anL5l852DkrLL9s2aFi/vdUXP3r3WgTZ3wiX21Z7QfWooEGWY0u+
	 GIkbAdZ1YgmQu/MOeGFcpepjT9pBd7LekLWh0rrpLBIaqcsSkPWs1PzWYSxaCZH/di
	 yEDgu0Kl73djg==
Date: Tue, 4 Aug 2026 21:03:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	mukesh.savaliya@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 5/7] spi: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
Message-ID: <25dd7d3d-1952-49a7-aad7-f6aceb449644@sirena.org.uk>
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-5-61171ab1cdce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VJ4LQaWdyGBuT9Nv"
Content-Disposition: inline
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-5-61171ab1cdce@oss.qualcomm.com>
X-Cookie: Biz is better.
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


--VJ4LQaWdyGBuT9Nv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 05, 2026 at 01:27:43AM +0530, Praveen Talari wrote:
> On the SA8255P platform there is no Linux clock handler for the SE
> source clock, so the driver has no way to look up the source clock
> index and divider needed to fill the GSI CONFIG0 TRE for a requested
> transfer frequency. To work around this, firmware instead exposes the
> SE HW supported source clock frequencies as OPPs on the perf domain
> device.

Acked-by: Mark Brown <broonie@kernel.org>

--VJ4LQaWdyGBuT9Nv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpyRZYACgkQJNaLcl1U
h9Cr7Qf+Ks5KKIkvEQ3YWLWthzIWu5dk3eSUCxEcpQds1fMTo/GgyfdJuSMYi29V
eFjXiDcd5AfZuf5f0F/80wgxPQvs+18S1+8KcXwwvqMF8Rex9NrBAwepNYo6QpI/
B+doiAZ1mjnKIxdrJpDGm+wxdYvTK3Tks36I8bNQ1RfJDE+tT9eClXfrMLuZJrE0
/26N3ja+vxPacl1TK+X5iYFkkF+GSxtrxB3/i+HcPZFvED5MYu9jdogGw90Rzn+U
hVlrEOsoZhAbeT1GCElJNNxVAq98HLMoiVegBb75+eqMEZpVi0HUiz5URL+zPZsZ
cx7q/e1NdI1TM4Rc/N41V1MX3N84Xw==
=yX68
-----END PGP SIGNATURE-----

--VJ4LQaWdyGBuT9Nv--


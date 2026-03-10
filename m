Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A458EB106D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 15:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDNookU0hrIPHrvSVbsYWuvBbqDJuN6Bhrtvi7qyIQ8=; b=GvJqPmVmwYXRtBNwjGn63y0SOl
	Bxn+0DoMjhOd+AddlDpK5YG3+pmkrzvtaYihfwNPyVXjBd0/2hgqBJXb/pOf7uUXPXP0tmLf7MdyZ
	gTU0EoSrLdXGDlIwY2ZZahAYNx/CIaZS3WCS1zoi59YU6igyCzMA9AEU5pDudeNh3i/OBqOSpQoGy
	uWOfO+CyTVaiwH38UwVP+SvLE6CfocR76X0Rtn9UCg5nc77J33xJrkBHxnkpaf0T/XPr134a3MEBO
	xvIGBXFEEvN9Ag9kb3aAu6tJ+0Marj00/rvwEoA//+4D+gGU8lsH9/TVF7COwejAevuWUnK26RyBL
	UvFkjiwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyqa-00000009mXT-2Wgw;
	Tue, 10 Mar 2026 15:18:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyqY-00000009mWV-1Yic;
	Tue, 10 Mar 2026 15:18:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A1FD241AD1;
	Tue, 10 Mar 2026 15:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08DA7C2BC86;
	Tue, 10 Mar 2026 15:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773155889;
	bh=XIw9pqpUWIeq3yDxTXxxYJ6+f/jDlw5eFm/WTH3oCiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R0MFyXz93cEAEqNTcTWR1jqicCK8xxXJZN/8WYq3aghC5ct8IymPbzVMSTP9uJnW5
	 F7LM0XooUEucp6mXLB10WGmvUIiShNRf9IxqITR3ljeeBnhcJ7fdsPXX42z+5DI/mH
	 iXXTJYQr90ModKovVwBI8HlAOWFRzf4TBHAV//p4DJ1TlXg5lP+lAcIf6agkFRlTb3
	 V0/UADtXeeLftUPpnvIetO1+CFGYTx3QvGGfLFe0UhrkMA33egvcGLjjTf2RkVzvcm
	 gbpS6kODF96S4GKmNi+g80yBaWqs+9mdddhAJBY/sgzo6dR1XvSPEVlQJaz0+bxjEP
	 JfRnmZH65rloA==
Date: Tue, 10 Mar 2026 15:18:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
	Mathieu Poirier <mathieuu.poirier@linaro.org>
Subject: Re: [PATCH v2 4/5] ASoC: qcom:: Constify GPR packet being send over
 GPR interface
Message-ID: <8499f2ba-f382-4cc8-bd27-b775219bded8@sirena.org.uk>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
 <20260310-rpmsg-send-const-v2-4-0e94c5db9bf4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AS+M3oS+e+7iUDOB"
Content-Disposition: inline
In-Reply-To: <20260310-rpmsg-send-const-v2-4-0e94c5db9bf4@oss.qualcomm.com>
X-Cookie: A fool and his honey are soon parted.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_081810_431984_E98E4A75 
X-CRM114-Status: GOOD (  10.50  )
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


--AS+M3oS+e+7iUDOB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 10, 2026 at 12:22:38PM +0100, Krzysztof Kozlowski wrote:
> gpr_send_pkt() and pkt_router_send_svc_pkt() only send the GPR packet
> they receive, without any need to actually modify it, so mark the
> pointer to GPR packet as pointer to const for code safety and code
> self-documentation.  Several usersof this interface can follow up and
> also operate on pointer to const.

Acked-by: Mark Brown <broonie@kernel.org>

--AS+M3oS+e+7iUDOB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmwNioACgkQJNaLcl1U
h9A6IAgAhm8FHbxPDGSY7xlMzneUZ56MJqJMAxai8u7h2VB+HRv7t/osrrSgs+eV
IOJM5ZSrW5Ayh1fQB6oJR22Mf5XLgxWFceEgQST5ZLepvrRacQg1sXGjnEh6p0yF
mux1im7ljE0arSzYV2kgYaOxwHRPRiz62g7yBDd8eweU2NpQqCV+d80wJ3YgQI4A
7M/CC5jZY6s/gCOuNySpsp0Z6nnlyDvDP5htfud/brHnj+bb5LsSS6+KAM7uYPwv
sN7Ywkq68wsEVI+O5bBtwXGvW1C6Ucga9IqbX7N1ZgPpYObwQCChJq27ekcw/SAE
WFepehfDBjcnivcMjQl9HBc5xRdxQQ==
=9edh
-----END PGP SIGNATURE-----

--AS+M3oS+e+7iUDOB--


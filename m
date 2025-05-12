Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5240C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 06:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YA3dyA7fc/Ouhhp+VM8Zd1IJ48oa+kRBjWppAACdkQ=; b=fdljmyxlY9E4c8s21B/UeS8G+w
	3ZS7ILLiRZiFc4xPBWBygkqgyGVA5OXM9Zva/bF8U19Xh47Opmsdioh56NRfjEBq7FjgLMOz1yezF
	o9PfoE9mYgtO1cN1p/emKId96b0afxU1D4B0r4xAE7nbDWExpN+VXufGp6ESyYLW4GeOxZRZb7HIS
	NPQNvZuSYSfPCkeho1ViX9Ii7NsJQLyhHQmkI8Pjj1/76ZOJID0aRCuM9SuQ51CK7yhMikuiWUXD2
	aBj/tLKM9DTgWYNsAWmNQ/4oCvfzSsQt2VsN1LtHcpTROCTQA2P5UPw0uuM9xSCI6o+HOtfGuZOCx
	PjM58PFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEN1p-00000008Z8m-1qFm;
	Mon, 12 May 2025 06:52:45 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEMpv-00000008WpT-0su7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 06:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747032022;
	bh=3YA3dyA7fc/Ouhhp+VM8Zd1IJ48oa+kRBjWppAACdkQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZQSAymog4yTGdUmTPYv5NA2Lls2DaVwWQ0mZK37+lOXJJaEq6jt+f59bAqI7Ka6j6
	 n0vFhBRTSgcNhq79s7VdaPHNkJsXmHTKx/V6JlGbRxugXgFq9ppiRTQmNN1WN6WjGy
	 bsNt2mOTsrxz5ko5qHA5zxHtVX4tddP5mpkPbUzzhqsYlMZo7xlqhzG1z5rU1iANfB
	 WBxFz02MfjnO6yv1WdsUWh3coxNhQ917lqIsIRi7bYnOpViCt5ZSWQz52tsd9qnmpN
	 XOAXAMqRScvYdO/JBC/vTdcsGvJoKy4bIehDRA8b8EEj6qpaigtENuPLigSBaCCdir
	 OOP4PYcLkirFg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zwqjc6J7lz4wcy;
	Mon, 12 May 2025 16:40:20 +1000 (AEST)
Date: Mon, 12 May 2025 16:40:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, bpf
 <bpf@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK"
 <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com, Linux-Next Mailing List
 <linux-next@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Hari
 Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Mykola Lysenko <mykolal@fb.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Greg KH <greg@kroah.com>
Subject: Re: [PATCH] selftests/bpf: Fix bpf selftest build error
Message-ID: <20250512164020.55eb30f7@canb.auug.org.au>
In-Reply-To: <aCGGZ9gApo+QwSMD@linux.ibm.com>
References: <20250509122348.649064-1-skb99@linux.ibm.com>
	<CAADnVQKBQqur68RdwbDVpRuAZE=8Y=_JaTFo-36d_4vr2DNVyw@mail.gmail.com>
	<20250510110455.10c72257@canb.auug.org.au>
	<aCGGZ9gApo+QwSMD@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nLXLLJNx8i0XWRzr=BN1g7o";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_234027_572479_31374A39 
X-CRM114-Status: UNSURE (   8.95  )
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

--Sig_/nLXLLJNx8i0XWRzr=BN1g7o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Saket,

On Mon, 12 May 2025 10:55:59 +0530 Saket Kumar Bhaskar <skb99@linux.ibm.com=
> wrote:
>=20
> Apologies for missing the Fixes tag. Would you like me to resend the patc=
h with the=20
> Fixes tag included?

Yes, please, but send it to Greg (keeping the ccs) so that he can apply
it to the driver-core tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/nLXLLJNx8i0XWRzr=BN1g7o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmghl9QACgkQAVBC80lX
0Gxjogf8CwRo3iw1LLROG/ll6OqsWmpdaFegvG57rScdZeaWHH1xMCOl/GmBTJu2
gp1/6uX5sx7/87CFLgEWAIjT6h7ijKj5V5d4F3wM6HHR04BC0lzUWtO99rn20FMU
Mxg1/jTzDcHqsMmakFCiFPkxQQmcuy7+TMY+1UsC2ouyvdsOgtE4wf7YSmiTRJLl
Q2tlLWAYHIZTsDUxng2h4eq9d19f1QZvlfntpAfvfblkKuaM/gzEiQcJnC2iG159
RZyQCPMEbySj2XUJqx8slBUvS853/uTL9Ms2ggrt1t2pf7uKdcCRNtHF+pFxJPbm
6jOW5Bu8Ncm0+xSJaiFB+z29byxL2A==
=xLJ7
-----END PGP SIGNATURE-----

--Sig_/nLXLLJNx8i0XWRzr=BN1g7o--


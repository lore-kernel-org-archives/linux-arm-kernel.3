Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF51EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRTAn8EMHBd2hfR7Y/FJYkcHDF1vc5TPWd5vqlVAC6A=; b=017AKN3+N68jSd8+mzFT6HH/vf
	eyfoXkIleit4SQ/wJEw2/xqYg8OHY+WFAoShAMZFK0Pg1OLCCKUNyV8UdsMS8ttO5ms9vvBW3sWWT
	NgW/N6q0tj1FAL52FqnfvdcrxlT7DHrgSQTKQ9YgUVkbnfrazkpyWhG09T9BaWXGEHWlJT4QX5Gd/
	NBfcTkt+LsVOfQ8Q9KDeBVZF6hGTTk7tnaf3k3TuP9xBkGy28XyYBxv4+ELeTJKMlcrQcZXHqj8Vw
	LsFqTxx2RxmfjQ3bTC8OfQ8r78EPtivZm2yd8Zq5uKXXJ98GsPheWTy2yZbNt6jjPOt1Offmhvh4a
	1wcDhHJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2Kh-00000001WFV-2Oxn;
	Tue, 25 Feb 2025 21:19:15 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1en-00000001OLW-39AO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 20:35:59 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38f2f391864so3473403f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 12:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740515756; x=1741120556; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yRTAn8EMHBd2hfR7Y/FJYkcHDF1vc5TPWd5vqlVAC6A=;
        b=enP0ozETBMXstDkDok4k9SKcPMJwQXYrSbJngLda4KwNIzmj0ExddsAOswsiAWEfiE
         +1YKDVBwkP/PZc9dfWVny2DckLsxGBcGTh2YfNmviiPwcW4djSbNvICXW0SlgdhcyFir
         5A8pyyzacS3AR2n9eKtmjTNU1tePVcjiKZ48r2+POxv0j7cP3tuVbYDWdAc0MB4kBCF4
         Pss6ty25JGmv81Hqxv7xdG9iUVWat+/1PGC4wal8PQNNs39VIbfOiPJxD6g+jlrV//vS
         ocboP+3foiA4jgd1OjZ/bI7MHmOLlcwwOy+bmB7LP6I88Mcf3bj8MSHmzGMMBM1ULt78
         MemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740515756; x=1741120556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRTAn8EMHBd2hfR7Y/FJYkcHDF1vc5TPWd5vqlVAC6A=;
        b=vUZlcZ30Hl3o7H4+ZQN08xFljZA02W5eWL3m9FGrAFwTaXWjRwX29hA8UDKRtCDvT1
         zVvxfiuoiDAFKTlhZ74FtGnVcynRYLjDgatmxfZk/oDpWtONkdvJxPovop6aZEouoY26
         b5d7LNUVxl1R/PGPKc3NcU6lvuCTVP2ZnCCN1NJIfFgoan9B0uPQ3sFkK8GQCgmmjDM0
         /Z1Y1A0VTeF28dbhLp88oVPPIKBXRQPOlC/uGowf09n/aarX/Se05OsIe8gnzmE42HzU
         rlPu6TnMnGoY8bbQ/3bAf3LYBVkrHkVPvQHNSoiyLunWmpwK5AEzg4ygxKObc6DmY/3F
         /+dA==
X-Forwarded-Encrypted: i=1; AJvYcCV5QKbUUBTVO6lC9bnFqjqhAtwmbjRgwjIlrnCC0yIa25f/h99geufrveoCwBA26lZ8ZXQVmpsO+EGVnhzoi+db@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ3YrYdJykPinkLCyavIT13J3HIWV/67Aom+u7ozyaVAqBnWuV
	byRKHS/h1wsRA2jIguOxrCeZov2fjNgma9beu30CQ49VCmFbzMLj
X-Gm-Gg: ASbGnctmS7ueoojTXbKiDG6eIJ7y+BtDRncBSpyz8POaDdsHI1hzxsS4WgophdipgTu
	dfg+XUCXx9IFORwZZfi9wohnizd21MxEnSvQMmQkFcYSeUCw05E/OQT4S1vW3DnfVCSHI7Drqvx
	dhWaSdAxmhch97DwI6hYMMoWK4fzFcStqLgHhMNPCCkHO6w9Trwzw/XyFAP2XGKzTtTZFL0xVy2
	0Pa2MTChTc3YYgLVKY4G6QDntUeD7esyaCm/bVUc0Er8gF+lV2pOx0DmCusrcsnbLotAgdH/CVH
	1PYNGKH/ep8gw4mzD6UHYZC2na2r7YzhVhOigrgf6nS3n0ib7q05wLfZmmY0ZQyxdq2lmB73Ofp
	k7LQESV7MN+ab
X-Google-Smtp-Source: AGHT+IHo6pk8C69B1kkZHL451iXWYmac+j4FDXKYrUt1Xc82AEnjWCz9kj00St6aZ3ajRNdoQCt+Tg==
X-Received: by 2002:a05:6000:1563:b0:38f:3b41:c952 with SMTP id ffacd0b85a97d-390d4f36811mr510967f8f.4.1740515756017;
        Tue, 25 Feb 2025 12:35:56 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fcfc6sm3466016f8f.94.2025.02.25.12.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:35:54 -0800 (PST)
Date: Tue, 25 Feb 2025 21:35:52 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Emil Renner Berthing <kernel@esmil.dk>, 
	Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	Inochi Amaoto <inochiama@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, Jon Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org, 
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 3/7] net: stmmac: dwc-qos-eth: use generic
 stmmac_set_clk_tx_rate()
Message-ID: <qcarhmsd6u33ij4kupaiyxvyr7jxxv2uxvr6jsnhxjd3o3axkt@z4m3zvdpxogb>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLYv-004RZ7-Ot@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vvcz2h4v3lcdr4gs"
Content-Disposition: inline
In-Reply-To: <E1tkLYv-004RZ7-Ot@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_123557_788297_03537014 
X-CRM114-Status: GOOD (  13.31  )
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


--vvcz2h4v3lcdr4gs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 3/7] net: stmmac: dwc-qos-eth: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:14:49AM +0000, Russell King (Oracle) wrote:
> Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> clock.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--vvcz2h4v3lcdr4gs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+KagACgkQ3SOs138+
s6GtyhAAwRIkaF1uLIs1z5IXu/G9vXd74IqnK4JNtzGrGKi7NS+cgEqC7yfhY27w
G7nD6STOdAxZbhcGZfvkiSmrRNBmcmrs2nUBr+dM0BVtgpe/vfwOPbFRWd8Xpqt4
6LYaRSYNIsaY3nAXP4+oa3LXly0Fe4axipwapPJGjl9vCnHE30kMULHJ9MhLlbAu
VZzMketr5oN/usTXWFs1gsYk1Xw1wTabBQGENezBr0+H6Pq7BLDcuWPeEV5ie46r
xTlPD/E1rNepOCxmN6uvJSnz/1ei791h7OAK9n/OMZXKSI0XsgkMresehTC2jIFG
CwG03bepYX+Y64iJejVhCgxU2g8Ji8sv0tmTY7vsCFSa98ngzKWAQK/R6H/V6xMK
vNL83T8No6JOneia+ylM4i2ESXII8LmguwJGY9mbRqqS9dmP52HZig7eww/80MFB
g6yx6n6q4Us/vFJuLgnULe8gLcTMCMiCfAtk+MMdJUqb+eQGLPqXwxsIH5106zmF
ZyRVftW1WAa3Yc8cNF43w7IBR4RDIHm8MBUI9ESyL34P7gobx/5Z0C/DudsmnuV9
4ZJO+x5JUTs/P2yCg5VfB4ERHwfPUSf8LrYEJaVY5f4M+kchTApRjyf6v8oF9add
zMdor2E+S+g69+tn77HhPDvuJzTrOnbaIxQsoIwGEIJ1IpnOBUQ=
=aWdb
-----END PGP SIGNATURE-----

--vvcz2h4v3lcdr4gs--


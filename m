Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780DFC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E918OTHi2yvVgDkqR2WK0eqY1K7lmB4Humnmkm0YU/k=; b=czsnoMM62EqNBG/2bc2Z9267BY
	h94GOhyku9Nr7+gIj1uGRk1RwEn6GxYLb9FmkEsKV3sIv8VPqBYCEa2fmsq4az+Dlw3jmqQFztLvg
	gga55IxTLC6rMI1+VbG3wHEDdCSDuiYL/xq9Ri7mfpyn9mkfx0pJV63b5CKpfeNm6MBv1l7gSt9LU
	5ORAXNYTfEzd+mNPMiaSeyl6UPXXRbGcfWyMqZN5tYTLUFrmoP5FJPdE3jVaZOxPhomuUe9ychN17
	ySOYNyLc/dzh4I8DkJJ08ptcuzZW/ITszsrGBSr3lvEeVUnHyfcg3178JHgNvjC/XeDRCBh1SS3Ph
	aYgU4LuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2Ql-00000001XXx-1nsb;
	Tue, 25 Feb 2025 21:25:31 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1pV-00000001Qh2-47Ih
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 20:47:03 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38f2b7ce2f3so4368747f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 12:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740516420; x=1741121220; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E918OTHi2yvVgDkqR2WK0eqY1K7lmB4Humnmkm0YU/k=;
        b=TGUaDPf3t7P43trhOUY3TKkA0Ff2jIU7OTYaNqX1dwls92bWxdBxh0Ut9wDq2rgDRo
         SBbXEcqKC09Nyw2unPRt+WecoHwwI9cj20RAA6MVYi27R9Ln4aCksPFCX+yZ2MikbfZT
         +VCwHEtBTzzRKwXEWq6YdPzwdniS38N0ya4vQKmALNqUniLYq4y0H1daG492Q1Dqe+Jk
         pq8oL+/Gkixkdp8tNyoqU2QUcJWlteyOnActInrpCNs1QjMerfNvL1k0Dc9mjEOhs2DZ
         pd9ZUEAOfdnQwzI9Yu+caGIHgVHQ6EGj2n4uVghBF/lIZPghYEXMvAx4kJppz4GncEtW
         Obew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740516420; x=1741121220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E918OTHi2yvVgDkqR2WK0eqY1K7lmB4Humnmkm0YU/k=;
        b=nK8sa9IM5bkkBZYsbT7aLQgfK+IyOzw8VW3N23L3yKBYjkN8Eag0QPCPHTF8gMcw1u
         uzJHIe9PpNvbkIa0l568IfpRj2wzFJugapqwXY7BjL8oYB/imuFxLY7i74eEGyOXG7b4
         wZvhFxFB9l84ICNfujjGSHh4PkrQH8Q3//lnEmyOslTC4DjAxzWj5B0OQKpMwyAbOb+H
         VNYwtEke0U2OogLv8d+8rJyKmD4qka+beHcwxUWh4EY5lam4g6iGzL7rzQY3yADV0qM+
         gsBbvFDlVCUTUhCNTBjWxVyvlylJblCyS4x461+JLc2DyI/WRPueCkJRXjT1nU6P6gck
         VxHA==
X-Forwarded-Encrypted: i=1; AJvYcCX+ma3mMukkTVwIvYgt5PJlfXUrbdWuTJxRtkH+i8K+pBo/C/JKymKs7/bd9NnAdQqoO2QTZU8ecpAfkLt+qCEb@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr4cQ12uB+HMIv1P6EWtj66jkufQ5rXWsM/buxgvFOsSzRsk6G
	iz0TISarF3oinHOUTtYUVi0pnHaI4U+L/N4F5TFG7Khypwi9XtBm
X-Gm-Gg: ASbGncuN9j+KVTTdmb8RUO0eNpNbOMdowQ+7kcsWvzLnpg6x7qN+7k1on1hJSSt8PpG
	OgijEtv9SlIl85fMUrgKKUTv4K9jVydr0E36jrPYh3yQ/HM5qzZVBWt5LGcgGdgW6Rzumpjq3am
	xgNPGpT7Cf2O7VDW0cOMAT8P7RZZIPr0htW1vItnKtaVb+jutXhKaLShGozhVLUIlSWPjYfN3M7
	maPrRcgJU6EyED9mtcsVIcilA17LqI6LBfQX3hVayKYCAnYCJkApOsmwKqhsovI+WgmOtVturq9
	VymvSQiRNrTUnEngfuIviiYwWTsaR7r5hIVN5d3qhIGio6j55h9BeDq+QJ2yLhSw1fGtcY337+a
	5hztldXzGw9KE
X-Google-Smtp-Source: AGHT+IEmw7lSBpfSNj3LhieZeCNYI4bj4PCJf7zwnwb1ygbIuUippUUYOdeYMqmm611SGM3iLvGYVw==
X-Received: by 2002:a05:6000:4010:b0:38f:6697:af6e with SMTP id ffacd0b85a97d-38f7077dc73mr14301433f8f.1.1740516419999;
        Tue, 25 Feb 2025 12:46:59 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab156a11bsm38026395e9.36.2025.02.25.12.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:46:58 -0800 (PST)
Date: Tue, 25 Feb 2025 21:46:56 +0100
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
Subject: Re: [PATCH RFC net-next 6/7] net: stmmac: intel: use generic
 stmmac_set_clk_tx_rate()
Message-ID: <n67c4bq7n7ejakmqmglve3os6vqvm57umysjjzexxkygvusnoo@ndee4gfnmsst>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLZB-004RZU-4A@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4kydm3gogek2i4nx"
Content-Disposition: inline
In-Reply-To: <E1tkLZB-004RZU-4A@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_124702_017164_891A5BEC 
X-CRM114-Status: GOOD (  14.93  )
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


--4kydm3gogek2i4nx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 6/7] net: stmmac: intel: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:15:05AM +0000, Russell King (Oracle) wrote:
> Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> clock.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-intel-plat.c         | 24 +++----------------
>  1 file changed, 3 insertions(+), 21 deletions(-)

This isn't quite the same code, but the result should be the same since
clk_set_rate() will be ignored if the clock is NULL, which would be the
case for !dwmac->data->tx_clk_en.

Reviewed-by: Thierry Reding <treding@nvidia.com>

--4kydm3gogek2i4nx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+LEAACgkQ3SOs138+
s6FCDhAAscpV7eVp/AZQnvvZ4nw0Ad/YhFSj9yZtfDGHgapuDwrpMtuoI8uo9AXY
D8+01yo35J7QfixSJ8u9vwrs2sZQLQsWQ1a90UudQueW5LuaW+Mjp7ErJgrh4B4C
lsm3cUuv+/GblfCX4FgnceY9YHJGqoZNDzYAb+e6xmZCgFzRpT4emSCYCyVHnyS8
sELpHrLTdgJlso7x8hWn3GsSgG6te0ToqLcru4HZ+gl4zRjh8ljfx+5tUkiCSdIf
53t4tdRo/qhu/4EurhryxxJEsXSju1iYV57knOQp0QsplHARC7c4D10xVHFiYi4j
M3mTMnRYGY/d9MMsd0pr193DktSogHur2k7zUdccpE7X34CPZcmfg5wLPO/qYK0S
rJvto6QcJqqB4XagVfuoXoANvAOzlMXUviQBUHFFSumHmnwerkU0ntPzQdk5oQqt
7I+TFMNlEiKA1VpLGbTWw8cEbvj7ZPGHnVd3EQIQp24lYqK/6IZiNB5ZOC0Q9ayk
ydkm9PWQzIdlL3MFh/nho8iZ43nJF3rkTsML1leqt1/CdjHPHi+csCYATi2TqGEp
GhcrScX9mxWkBZ7xWzFfETX610z1DwlzZDuZSlLtc1ZbyxLacU8EDIqY8bha661b
8Irrrgzw/UAFApkCGAQxQ3NsIsc87T+t10FfEW8cdTCjolZd+hU=
=eyD5
-----END PGP SIGNATURE-----

--4kydm3gogek2i4nx--


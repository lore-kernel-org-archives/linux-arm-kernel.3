Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56635C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 16:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FoBb+MCNrssOL4O5BLzYqYW9vzpXkaseLuESacaKWDE=; b=qDpXw/1+a42LLPktgD3W3mI5TW
	GYxoxF9w9MHCsN/CI15jJ+RDVwxWNbSMSf4mczV7Kp4+wwvp7LiD7WlppXCXGySdF9YujCTcc2ZWp
	gJpPui2P3tCDV+yc8FTrIRkHDMojJlUJHBBrwM7Auixt4kbTrV5VuAkpWtnRencKr3M/NxvqD2ga6
	M5k0K2SJ/bYMd3Oq5fSedeXjzTT8jifwtghIoAv1ChIgbNddQ9C47JUzvNZy6vlG+HHrNBYYD5oBK
	CFhyJJwS4Z0J9W2ZACC3lQmtAeSpBAE1LxvvPsDc1LjnJwAzOcvOyYaCV/n5YOlEPhpXsfzaY4bJh
	luzcBTmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7xyi-0000000GWCp-3fYz;
	Sat, 19 Sep 2026 16:31:52 +0000
Received: from mail-ej2-x02.google.com ([2a00:1450:4864:34::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7xyf-0000000GWBV-2JLF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 16:31:51 +0000
Received: by mail-ej2-x02.google.com with SMTP id a640c23a62f3a-c29d14021b9so18862166b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 09:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789835507; cv=none;
        d=google.com; s=arc-20260327;
        b=F4lDP8kmJ449Yz8rwJW2fSASBire7sPfS7OKVVmrzpLsdpVf6djINfcI5x4+slc/wj
         Brji9VMKc6iCe4QTht5jpmV1Do0IZEfrzdxnc/8l/rV8rpK6CHbderFczFdq1NKL8aw1
         Av53rjBQ1c2lomIwFO6KA984nyqyy83ozcfpHSFnoniv/Axiq0T6IfhTkpWbb4gKwC9R
         eaOZPOdMKbb3KUVz1MEEonbmscxGT5p56GKj76qqnQIOL+GkCHReC37tOCL22HkAscEs
         z+wNb88AtdnqV35lEuv6WbEzpok703SeMj8+VlDnXVRBlxR8+KuQT8JlX4dzmXQ/nl0X
         oOGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FoBb+MCNrssOL4O5BLzYqYW9vzpXkaseLuESacaKWDE=;
        fh=YOzS2QdxAr9+5snrwqZlQ3ct5dKBVdY458ybdEv2jeI=;
        b=Xwphfc4bHteZQYCT+yobtVDAut7Bi33x6VxuJAQzdtLEvXwjpgdR7ZHRTC1se2bvH/
         6vQX0iC3nBGvR92R2VjA1rhHe+JGZEAn1xqC2aycxltV6w/RMJBYhP+K+IKWafyUftER
         cEjPdbGvlxNwIbg5xfm+e/lmjYrOdQA8sy8MIp2y4CW1haDxCoR5SGCkMT7uKBEnITHa
         5s4et7YWoW5NZPRKbyUOJxs6y77FJ5c6QsVYJNEPe8P1e5fQzz8z9/pxbPrtJ4AtIKx4
         AAdFsL079AWA7mAWrLI3OUORKDq8vabjuBjHaxQi0Ni7xh0BppcRuz0VJbjbfRziIO7G
         z6Cw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789835507; x=1790440307; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FoBb+MCNrssOL4O5BLzYqYW9vzpXkaseLuESacaKWDE=;
        b=l/hkDLOJawpX/bBJ/akkBtLvMwmiV+R/0DQ8H6MnE3/9VtD1WONCVY4RuxAq/ZNuAq
         hqRvD751/Z+dW0WfXs2l18KS+jWxxqcxZiGlkwos3dKRtpm4MUkqFenW/tqkCSXdTB2K
         wsuOizwTQjVjwtlP3bvnlNZWGwSG+s2fNStTJriCvyFHjlIKStQD6x2ak5681ot3XBMG
         MrfytvF5+DEiOkfXa9mT91tq96oyDBMUuiJUuYyeIDP5LnvWa8JldNAjUCDjQw+x4C8t
         KE3btVeR8DBp9nC/YA3Zjgb98jKmxf62tTdJFBLN1EtNrLfM3NMv0NMeaQ85BjJpRaVP
         K7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789835507; x=1790440307;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FoBb+MCNrssOL4O5BLzYqYW9vzpXkaseLuESacaKWDE=;
        b=2K8dB73PEGNSVh/KRuKXyYk1NGM7gpJsViMoLZXZwzr/8wahoOmzkQkz2HVMDMvV2+
         II545awaN19t7yqk7UMVt9PraJC1A2m5Pbo5kBksmH5q5fqrP+b4yknpbwPBBFudYITs
         zuRVIU8nu0Ys5vUpeRp2A6iUgklZwkxw6MqChhACT0eSd4Ww9q+LeVmr+OqNuztQ+SQj
         qtVkgx4k5JAeB1joHp0DjvT+/A62cYmUoIcdP3YMXmylvYQ20WeietoJgYibD9/1eNYL
         rGVdFiLKNl+6eCv+lN/eHJQzKhbZBFBvlG+4iXGP3L8LgqnF98JYH8kb+1T7mfGdUF7q
         m0bA==
X-Forwarded-Encrypted: i=1; AKwUvByzDLcpEUJnx4LzJ4iK9c1cqZiMmwHI45RmIL8BUEfuwUzOA/GAwuNizPYw7T5F3uyc/Lmk4iuoSp8MIAzfbMx6@lists.infradead.org
X-Gm-Message-State: AFuF++nwTE8OtnGSYs63ktERH9bSBhe8P+vpuWEtrj5AYWwr243n3sZc
	ULn5YmjlSaQD4nyoIDC3EGPQ5e9/5nUt1LUMBMXR8AqTFJobpVeXHmCcK/Bus3gbjUA5IeQJYWf
	yMBH98Fac6Yfx9joJEChxM8l2aQNpHYc=
X-Gm-Gg: AYBFou2R0Ye7ACIK0CExfM1QtsafN6zL4C9PADv37Vi3wphGim6YM23MxqMyIq1D3m6
	H1k2Ju+UifShlFAUXkm9QVHPT00YXud8eoB0E1VYkp1lvGfoXb4vQASQFG1udozKYjsqGdrMdq7
	dQhJIB/3oo2rD/j9aVio3k83++0tukhUcLfCp9RUYIS4QA7gUNuEoKVqM3yo5rjhEJF4NSW1twO
	Lwl2E/rLmrcIK5/kgwdozE098OL2ePEU5hW8QDb3+yMZ1yy+L8wwxwbBlfGPEsirRxyypdGRqRh
	awLCfNaLd7vIRG0I2n21aDN0jBOyD3nnOPGr/AYSIPwG5griUYqduDILtA==
X-Received: by 2002:a17:906:2099:b0:c29:c575:de84 with SMTP id
 a640c23a62f3a-c2a164422b2mr337838566b.8.1789835507327; Sat, 19 Sep 2026
 09:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260919-s32g_serdes-v3-0-9d68868c1e89@oss.nxp.com>
 <20260919-s32g_serdes-v3-4-9d68868c1e89@oss.nxp.com> <6aabb56e-406f-4d13-9fd8-54822202039f@bootlin.com>
In-Reply-To: <6aabb56e-406f-4d13-9fd8-54822202039f@bootlin.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 20 Sep 2026 00:31:35 +0800
X-Gm-Features: AcwNN1VbQyHS1-cJU3SdJ4oOQkYk_cjiBlklhRFTetXHOgzYOSwzbp6stXuvGvc
Message-ID: <CALj3r0g2FtxRRUDnG80SZJGSbpyBekTkd0R1ek-z-1h-d830ig@mail.gmail.com>
Subject: Re: [PATCH RFC v3 04/12] net: pcs: add NXP SerDes XPCS shared core
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: jan.petrous@oss.nxp.com, 
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Bogdan Hamciuc <bogdan.hamciuc@nxp.com>, 
	Ionut Vicovan <ionut.vicovan@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Clark Wang <xiaoning.wang@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	imx@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_093149_617160_4E137D25 
X-CRM114-Status: GOOD (  24.59  )
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

Maxime Chevallier <maxime.chevallier@bootlin.com> =E4=BA=8E2026=E5=B9=B49=
=E6=9C=8819=E6=97=A5=E5=91=A8=E5=85=AD 23:31=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Jan,
>
> On 9/19/26 08:54, Jan Petrous via B4 Relay wrote:
> > From: Clark Wang <xiaoning.wang@nxp.com>
> >
> > The SerDes subsystems found on NXP S32G and i.MX SoCs integrate a
> > Synopsys DesignWare Ethernet XPCS and an Ethernet PHY (PMA) with an
> > identical register layout. Only the register transport differs: indirec=
t
> > memory mapped access on S32G, Clause 45 MDIO on i.MX.
> >
> > Add a transport agnostic phylink PCS core which operates on regmaps
> > provided by the platform glue. It implements the phylink PCS operations=
,
> > the Clause 37 SGMII / 2500BASE-X / USXGMII / 10GBASE-R configuration an=
d
> > link state handling, soft reset and polling helpers, and the common
> > feature sets. The platform specific register sequences, compatibility
> > tables and quirks are supplied through a per revision descriptor by the
> > platform drivers selecting this core.
> >
> > The register sequences and the feature lists are derived from the
> > Synopsys pcs-xpcs driver, so its copyright is retained. A separate driv=
er
> > is needed because struct dw_xpcs is built around an mdio_device and own=
s
> > the transport, the reset and the identification of a standalone PCS,
> > while here the PMA can be shared with a PCIe controller, the bring-up i=
s
> > sequenced across both XPCS instances by the SerDes PHY driver, and the
> > transport is not always MDIO.
>
> Is there a way to avoid code duplication by wrapping the accesses into
> a mii_bus ?
>
> This is what the Rockchip submission does :
>
> https://lore.kernel.org/r/20260919125119.2107089-8-coiaprant@gmail.com
>
> Maxime

Hi Maxime,

The Rockchip approach (wrapping MMIO into a virtual mii_bus and reusing
pcs-xpcs.c) is indeed relevant here. Alex Elder's pcs-xpcs-regmap does
exactly that for the TC956x: it registers the XPCS through a regmap and
creates the virtual MDIO bus internally, with both direct and indirect
(page viewport) access modes.

https://lore.kernel.org/all/20260605010022.968612-4-elder@riscstar.com/

The indirect mode is very close to what S32G needs. For i.MX the C45
MDIO transport is different, but the bus wrapper could still be shared.

That said, I think there is a broader gap in pcs-xpcs.c: it hardcodes
behaviors that vary between integrations. RK3568 cannot use out-of-band
SGMII (fixed 125 MHz MAC clock), so its in-band caps should be
LINK_INBAND_ENABLE only. Today that means editing xpcs_inband_caps() or
duplicating it. NXP is hitting the same kind of problem with soft reset,
poll and EEE quirks.

A callback in dw_xpcs would let platform glues express those differences wi=
thout
copying the register sequences. That's the same pattern stmmac uses with
plat->pcs_init/pcs_exit.

Once that callback mechanism lands, I'll send a separate patch to wire
it up in pcs-xpcs-rk.c. Since the Rockchip driver is not even merged
yet, there is nothing to change there for now.

Coia


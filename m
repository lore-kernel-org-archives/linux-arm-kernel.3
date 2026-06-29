Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B888CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrtvzAHL3u6/v5L5E9Co3P0QE5xowtwOQFIomSwMWjk=; b=NTJuGNTb/e0DxTsoCSzjt1Nt4h
	E3X5v5+LMhVQAUqKcJpliJ5gspdsPjZSiQdlfIMGPMb6dWuvLyMsF7eNZByygsw3rGH1EBjgVYAgI
	5DiUi0lpGUb2WR741OJ7vgoZXhspjRNPHUG+ityUWNfBeAuqQZh7bXs27TNEgyUfAmAlbN0Y9U0eJ
	ngqGNb3A22rZKoPfc6fcPPtOvq4QLMdOuP4Idnz3J3PcpJqMXx7RvfbfjhmwHbNoIU9C783HpdUX6
	FuihyTIlW3lmq7BA50KZffhblwdHfgLzJI1ydwlsqeMX+NWq9crdHFsXiMXNEzKLsILVq2PdQuMSZ
	7s0ZZCfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFFU-0000000FGAg-3XIW;
	Mon, 29 Jun 2026 16:54:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFFS-0000000FG9N-3UDW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:54:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22ECC43E04
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 16:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA541F0155C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 16:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782752058;
	bh=nrtvzAHL3u6/v5L5E9Co3P0QE5xowtwOQFIomSwMWjk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UtH5gwa+U1zvJ6MiDKihq7fz1abrI92vBGcYoq95X9rWwvz5W22oGlu4vG8sTBX+v
	 lZvuZzP6DS79zjdwBazFvkl6XvoQbUodjizsh/Y5t56PyS2oiOkfYCx7wkLk7cdr+q
	 2NhTOPmDU9hdWHEJWT+FaK8smDYBGn2B+2GOFurQSd53ujUwxlBKe0UjPhBCgGA3QX
	 k22qz2Jmw2cBhPjOS+8yx0ottM8TY6XGd5Ka/4VbWDj5PV4d5a2kNIQXOJuCPPFOrx
	 MdEVXZTxj/5NUCsyS7s46Ae8fQuMQf8DXRbIUUrciT9U9mcW4df21f2qy+RvS22A4/
	 JmKSNxfAR6eag==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeb36ed873so1401244e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 09:54:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrkeD/jZdBLoKxGmXvkrc+VI7i3X6FH9UCoL35rwJKNYnr4KJ1laIC1wd7azhl4jEsDv3sF66AlI9XBj2gMdFol@lists.infradead.org
X-Gm-Message-State: AOJu0YxxX2Oxr4NnvMaUxrJIBqYFSE9hiESuz0yvfGBi51qMWy44Rofb
	4TUuvpBIyQtXs1ucTzWl5Q7OQuI5RPrATKU7lgk3Ru4EgzopnmPDweyNrePfCvGA8DLlOUmB+Y6
	0f5HmPQ5n9RADK+F/JETvDPbI0cz+a7rtWTcHCGjkmg==
X-Received: by 2002:a05:6512:3d19:b0:5ae:b97b:f75a with SMTP id
 2adb3069b0e04-5aebdbbc205mr24885e87.55.1782752056582; Mon, 29 Jun 2026
 09:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com> <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 29 Jun 2026 18:54:04 +0200
X-Gmail-Original-Message-ID: <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
X-Gm-Features: AVVi8CdXDDErrbJGCmrBnsO12t_UfV9Z0jI02dBWCQjihPCNNCZY7ROJGiFNTUI
Message-ID: <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jun 29, 2026 at 4:58=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Bartosz,
>
> On Mon, 29 Jun 2026 at 16:07, Bartosz Golaszewski <brgl@kernel.org> wrote=
:
> > On Mon, 29 Jun 2026 15:51:31 +0200, Geert Uytterhoeven
> > <geert@linux-m68k.org> said:
> > > On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
> > > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > >> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platfo=
rms.
> > >> This is essentially the same hardware as sa8775p rev3 but the PHY is
> > >> managed by firmware over SCMI.
> > >
> > > So why can't it be reuse the DT bindings, and be compatible with
> > > qcom,sa8775p-dwmac-sgmii-phy?
> > >
> > >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm=
.com>
> > >
> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii=
-phy.yaml
> > >
> > >> +  power-domains:
> > >> +    maxItems: 1
> > >> +
> > >> +  power-domain-names:
> > >> +    items:
> > >> +      - const: serdes
> > >
> > >> +examples:
> > >> +  - |
> > >> +    phy@8901000 {
> > >> +        compatible =3D "qcom,sa8255p-dwmac-sgmii-phy";
> > >> +        reg =3D <0x08901000 0xe10>;
> > >> +        #phy-cells =3D <0>;
> > >> +        power-domains =3D <&scmi7_dvfs 0>;
> > >> +        power-domain-names =3D "serdes";
> > >
> > > Ah, this uses power-domains, while the existing bindings for
> > > qcom,sa8775p-dwmac-sgmii-phy use a clock.
> > > I guess the clock is the correct hardware description?
> > >
> > > Adding to my list of examples for backing a hardware-to-SCMI remappin=
g
> > > driver...
> > >
> >
> > Russell King asked me to put the PHY logic for SCMI pm domains into the=
 PHY
> > driver instead of the MAC driver where it was previously. Instead of cr=
amming
> > both HLOS and firmware handling into the same driver, I figured it make=
s more
> > sense to have a dedicated, cleaner driver as the two share very little =
code (if
> > any).
>
> I think you are mixing up DT bindings and driver implementation?
>

Ah indeed, but the bindings don't share a lot of content either.

Bartosz


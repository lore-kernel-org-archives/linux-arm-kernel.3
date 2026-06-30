Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035D7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+1GiMffsMJvBdu44BU50jfVnBubjZ5dimn//DJ5+Rg=; b=xdjBuB72wXmR8ilWCxMBxjHmFR
	YDGtyRU9Q6trmqO4wNokdAY32K2covFgaYvUajr1SwZzlxUbf81f2gV2oZ2WNQsuDil1hMAJ4XOLF
	6V+CmgypPeLorLdkBR2FFODXoZV0GJD67k74cgiC02OTL1QmCzau2wjrZwVerhfz6/IPqp//b/gOL
	ht4fPeV2J9BqHGNT5oX1kv5sFLYZuBBIgj7C7Ph6jbDKovjgwd1RJ6ljy5NZ7tIjDmAa+GdIoG593
	Z6/UEM9gpnv7MYu946ofNVjvaqHWNZzSYFLT/SRnayUfdo8rHZMRTcqZV95nYik8dJ/BJYVV1Bvi6
	Ui23o67Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVdH-0000000GdIV-3cVy;
	Tue, 30 Jun 2026 10:23:59 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVdF-0000000GdHR-0hXc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:23:58 +0000
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb6d00883so1506777e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815035; x=1783419835;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+1GiMffsMJvBdu44BU50jfVnBubjZ5dimn//DJ5+Rg=;
        b=HTMCKrC63Rx7DHJvzPLKWfUnQjiEgAd3mros+b9xvu4SP7Nc2BSVXGVulcBHqwkjAe
         DyctmxTOd+b/aS8aWn+kwjhu+vglQRcCgeuscMc51/v45535+oTrg3N2yNy9hBQBLGZb
         3rhVa8I21y2WQWiKvmlbKVRyvaTyrglsSdsFhWjjmR2VGrxwRvQiKwaR5O+O/LMlg6Wf
         Wjbe+hGNmbbHf2FY7foH+7dI7iqIIY12iw67EEH1vKL9ztadpTl3BOnvHDvY7Uh96OoA
         trcNTIOzfDvMN4luySTiCqKrrOrDjgM4LziTdUotmgKTbFDC7N6LInvE5dylNtnbdJ3Q
         TLWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrt/Zs6SoC4RWBB9JNpcoqMqfhEWvZf2t1Vl4NF4KYTxE+0dhAOtqOxMgsRXyU4bNQHKcFtmS71eMlufuxbIfJ+@lists.infradead.org
X-Gm-Message-State: AOJu0YyB3wnOv9wk2pnTuROu3M1S6nX7VnNF6vUeIl4gI0oscOPMbiD2
	jPZsE8oplA67yS3CG98Y2seMzy3SS7dxLBq7ClZ3HDHGUY97JuCI2urjsHg4LEn6BrI=
X-Gm-Gg: AfdE7ck8RtROq7RoJ18vaKz3KLMTmUmS6N9/Ki2qbOWcAbBjzatmaNpqUXpNSc+Y3WV
	A0iWMflyCua8tz873Ww0uTLg6qA9NjxQKUZ3ENPHouBRVhh+2oVXTYmsgC8HF6Clb3StBXiQfKh
	hgSkoCsKTBWtXgbv2MJxkV3/RNXhQo64biNecpKg42lzhuRqdoCfvnBO0cnXpKvZCxEXXSUaZhz
	mF7pTBkZ4FCd3nhneNdNiSRvHKJQX3n3n9Ztvi/o+QIzxleTiNubnvmx9ny414IsI8OKwVW3fim
	7rSDsdV+ed9NsIwZbKtNlcP1EOHS+5dhBTwIYgxpLV3coT7o3irWvkraPmoo4F/Aluc7gTLIG9J
	XKmU6LHdJyRaGUNIT0zzQtlh8Wiorq291P0UHMyeGMWoIHfuAUylDJFRi7y9jetnzfnq3IAx8LW
	kYBIVw+bLxquBbMHQBfZR6s6Uu+HdP9LAKPHqndC5jPGEASeisEQo/iw==
X-Received: by 2002:a05:6512:640e:b0:5ae:b6cf:2869 with SMTP id 2adb3069b0e04-5aebdb9485emr698658e87.23.1782815034977;
        Tue, 30 Jun 2026 03:23:54 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe4a85d1sm439359e87.65.2026.06.30.03.23.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:23:54 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39af6402933so29657961fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:23:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqy3oBzzeJF/0UmDXIjv1hR5debDifGLCFe2eAktsxYgZiUg569iDby3zzvlUs/ZDH1HygaPUG4ifwcBNfAvH8b@lists.infradead.org
X-Received: by 2002:a05:6402:3223:b0:695:f580:a66f with SMTP id
 4fb4d7f45d1cf-69879e3e43bmr1292708a12.21.1782814728107; Tue, 30 Jun 2026
 03:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com> <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
In-Reply-To: <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 12:18:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAPesQWMR4F_dx5axi6EwL+KfwLUmAyctLuYicaGHrkQ@mail.gmail.com>
X-Gm-Features: AVVi8CfDZI-66BCdudtb8k9h_4xIWUPsPqj5BKaSPsoCDQPTdsJgDTc_K9d7_9w
Message-ID: <CAMuHMdWAPesQWMR4F_dx5axi6EwL+KfwLUmAyctLuYicaGHrkQ@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <brgl@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_032357_232972_CFB4E17D 
X-CRM114-Status: GOOD (  31.70  )
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

Hi Bartosz,

On Mon, 29 Jun 2026 at 18:54, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Mon, Jun 29, 2026 at 4:58=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Mon, 29 Jun 2026 at 16:07, Bartosz Golaszewski <brgl@kernel.org> wro=
te:
> > > On Mon, 29 Jun 2026 15:51:31 +0200, Geert Uytterhoeven
> > > <geert@linux-m68k.org> said:
> > > > On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
> > > > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > > >> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p plat=
forms.
> > > >> This is essentially the same hardware as sa8775p rev3 but the PHY =
is
> > > >> managed by firmware over SCMI.
> > > >
> > > > So why can't it be reuse the DT bindings, and be compatible with
> > > > qcom,sa8775p-dwmac-sgmii-phy?
> > > >
> > > >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualco=
mm.com>
> > > >
> > > >> --- /dev/null
> > > >> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgm=
ii-phy.yaml
> > > >
> > > >> +  power-domains:
> > > >> +    maxItems: 1
> > > >> +
> > > >> +  power-domain-names:
> > > >> +    items:
> > > >> +      - const: serdes
> > > >
> > > >> +examples:
> > > >> +  - |
> > > >> +    phy@8901000 {
> > > >> +        compatible =3D "qcom,sa8255p-dwmac-sgmii-phy";
> > > >> +        reg =3D <0x08901000 0xe10>;
> > > >> +        #phy-cells =3D <0>;
> > > >> +        power-domains =3D <&scmi7_dvfs 0>;
> > > >> +        power-domain-names =3D "serdes";
> > > >
> > > > Ah, this uses power-domains, while the existing bindings for
> > > > qcom,sa8775p-dwmac-sgmii-phy use a clock.
> > > > I guess the clock is the correct hardware description?
> > > >
> > > > Adding to my list of examples for backing a hardware-to-SCMI remapp=
ing
> > > > driver...
> > > >
> > >
> > > Russell King asked me to put the PHY logic for SCMI pm domains into t=
he PHY
> > > driver instead of the MAC driver where it was previously. Instead of =
cramming
> > > both HLOS and firmware handling into the same driver, I figured it ma=
kes more
> > > sense to have a dedicated, cleaner driver as the two share very littl=
e code (if
> > > any).
> >
> > I think you are mixing up DT bindings and driver implementation?
>
> Ah indeed, but the bindings don't share a lot of content either.

That's the (maintenance) problem: it is essentially the same hardware,
but the DT bindings (and driver) are different. Does this scale?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


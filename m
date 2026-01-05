Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD911C2A072
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 08:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/f+veUt3J3okQzihXETeLooJr7pDBz9djjxauU3Umo=; b=b6t5ln3Ku/CDYXyWCNAtzi5s4j
	GQBDMqLa3fA2NrTdWiinkTVp6El6ASOtWW8mw9+KKzMvbpTpOLBfNpHsY2HuTeQWBPKwH/wCJH3Eh
	eArImcub6uz3fliYKFbbqp9htWrqOBQHHxkI/7WPIiZFa+yzEvWPJD20i/iXRdDFdHBPjQh7SWoRM
	7ro0bnJxSKuamWh1CIglqdHmqK1+zT1s7Wxaqod6MEBh7TuuIhqCj1fePWlf2xUvJ8lOpKuu/19Xu
	ZDjgwumvQ4D3NSQLvZaH6rwA1cy/2KcwvB49LJHeahnk5AafjNJpTBifr3QpDUKMxrmWrgyfmHU//
	gnycOvCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfW5-0000000AwZC-0mmy;
	Mon, 05 Jan 2026 08:00:41 +0000
Received: from sender4-pp-e109.zoho.com ([136.143.188.109])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfW2-0000000AwYh-12Rx;
	Mon, 05 Jan 2026 08:00:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767600025; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ibuz+XI96p0dL6YG9tCRZJijKOMJSmdrqDKmq72IPKCADR6Ia9PTAWWgGDl86nqNrVkpxxxtnvFg3pLa7mOzOv2KWdBVzSfAOolPMO9gDUuKi2FkP5FH/OnjH4XXd4WYACZPCZfLIdqBb80wepPSeSvl0oJuRC0PUVIGO9fYImA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767600025; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=R/f+veUt3J3okQzihXETeLooJr7pDBz9djjxauU3Umo=; 
	b=mmB9CgS4V9ulMDf9jpcLGyhqZElSBPXxCuZfLcqMho4gc/L5p/Ue6+VWgKAsn5yEXs2e0toP5+WJ214wEW3pCBuqIHlbqr8J7djxIN61mUaXg0VasKOS5+8AYxeR4pR370ziQjwmyS0SdzQ5GVvUxrd4xTWWtA2ECfL6iHXwGYY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767600025;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=R/f+veUt3J3okQzihXETeLooJr7pDBz9djjxauU3Umo=;
	b=GjMQkuLjb9RNIKlKPG7YjOLWe31FcLeyCP6HuzwA+sa73zyUH1dO1RnQlivxO6bq
	adi80Bw1h0UpcFRMI/JTxvG/vC7kLwmD4lHTR9M2Z39gcp/h5ueNaipz71KzlrcC578
	8XdmjeBK7nB5OH+69xOGibk1NTc5uNWLDT5iiXWk=
Received: by mx.zohomail.com with SMTPS id 1767600023562551.5910287978659;
	Mon, 5 Jan 2026 00:00:23 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Peter Wang =?UTF-8?B?KOeOi+S/oeWPiyk=?= <peter.wang@mediatek.com>,
 Chunfeng Yun =?UTF-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>,
 "kishon@kernel.org" <kishon@kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "robh@kernel.org" <robh@kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@hansenpartnership.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chaotian Jing =?UTF-8?B?KOS6leacneWkqSk=?= <Chaotian.Jing@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>
Subject: Re: [PATCH v4 02/25] dt-bindings: ufs: mediatek,ufs: Complete the binding
Date: Mon, 05 Jan 2026 09:00:17 +0100
Message-ID: <5067251.31r3eYUQgx@workhorse>
In-Reply-To: <e30abc4cbda3d655d9e0ef2beeac1456b93febb5.camel@mediatek.com>
References: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
 <20251218-mt8196-ufs-v4-2-ddec7a369dd2@collabora.com>
 <e30abc4cbda3d655d9e0ef2beeac1456b93febb5.camel@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_000038_427956_872CEBD7 
X-CRM114-Status: GOOD (  39.04  )
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

On Wednesday, 24 December 2025 06:33:42 Central European Standard Time Chao=
tian Jing (=E4=BA=95=E6=9C=9D=E5=A4=A9) wrote:
> On Thu, 2025-12-18 at 13:54 +0100, Nicolas Frattaroli wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >=20
> >=20
> > As it stands, the mediatek,ufs.yaml binding is startlingly
> > incomplete.
> > Its one example, which is the only real "user" of this binding in
> > mainline, uses the deprecated freq-table-hz property.
> >=20
> > The resets, of which there are three optional ones, are completely
> > absent.
> >=20
> > The clock description for MT8195 is incomplete, as is the one for
> > MT8192. It's not known if the one clock binding for MT8183 is even
> > correct, but I do not have access to the necessary code and
> > documentation to find this out myself.
> >=20
> > The power supply situation is not much better; the binding describes
> > one
> > required power supply, but it's the UFS card supply, not any of the
> > supplies feeding the controller silicon.
> >=20
> > No second example is present in the binding, making verification
> > difficult.
> >=20
> > Disallow freq-table-hz and move to operating-points-v2. It's fine to
> > break compatibility here, as the binding is currently unused and
> > would
> > be impossible to correctly use in its current state.
> >=20
> > Add the three resets and the corresponding reset-names property.
> > These
> > resets appear to be optional, i.e. not required for the functioning
> > of
> > the device.
> >=20
> > Move the list of clock names out of the if condition, and expand it
> > for
> > the confirmed clocks I could find by cross-referencing several clock
> > drivers. For MT8195, increase the minimum number of clocks to include
> > the crypt and rx_symbol ones, as they're internal to the SoC and
> > should
> > always be present, and should therefore not be omitted.
> >=20
> > MT8192 gets to have at least 3 clocks, as these were the ones I could
> > quickly confirm from a glance at various trees. I can't say this was
> > an
> > exhaustive search though, but it's better than the current situation.
> >=20
> > Properly document all supplies, with which pin name on the SoCs they
> > supply. Complete the example with them.
> >=20
> > Also add a MT8195 example to the binding, using supply labels that I
> > am
> > pretty sure would be the right ones for e.g. the Radxa NIO 12L.
> >=20
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  .../devicetree/bindings/ufs/mediatek,ufs.yaml      | 117
> > ++++++++++++++++++---
> >  1 file changed, 100 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> > b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> > index 15c347f5e660..e0aef3e5f56b 100644
> > --- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> > +++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> > @@ -19,11 +19,28 @@ properties:
> >=20
> >    clocks:
> >      minItems: 1
> > -    maxItems: 8
> > +    maxItems: 13
> >=20
> >    clock-names:
> >      minItems: 1
> > -    maxItems: 8
> > +    items:
> > +      - const: ufs
> > +      - const: ufs_aes
> > +      - const: ufs_tick
> > +      - const: unipro_sysclk
> > +      - const: unipro_tick
> > +      - const: unipro_mp_bclk
> > +      - const: ufs_tx_symbol
> > +      - const: ufs_mem_sub
> > +      - const: crypt_mux
> > +      - const: crypt_lp
> > +      - const: crypt_perf
> > +      - const: ufs_rx_symbol0
> > +      - const: ufs_rx_symbol1
> > +
> > +  operating-points-v2: true
> > +
> > +  freq-table-hz: false
> >=20
> >    phys:
> >      maxItems: 1
> > @@ -31,8 +48,36 @@ properties:
> >    reg:
> >      maxItems: 1
> >=20
> > +  resets:
> > +    items:
> > +      - description: reset for the UniPro layer
> > +      - description: reset for the cryptography engine
> > +      - description: reset for the host controller
> > +
> > +  reset-names:
> > +    items:
> > +      - const: unipro
> > +      - const: crypto
> > +      - const: hci
> > +
> > +  avdd09-supply:
> > +    description: Phandle to the 0.9V supply powering the AVDD09_UFS
> > pin
> > +
> > +  avdd12-supply:
> > +    description: Phandle to the 1.2V supply powering the AVDD12_UFS
> > pin
> > +
> > +  avdd12-ckbuf-supply:
> > +    description: Phandle to the 1.2V supply powering the
> > AVDD12_CKBUF_UFS pin
> > +
> > +  avdd18-supply:
> > +    description: Phandle to the 1.8V supply powering the AVDD18_UFS
> > pin
> > +
> >    vcc-supply: true
> >=20
> > +  vccq-supply: true
> > +
> > +  vccq2-supply: true
> > +
> >    mediatek,ufs-disable-mcq:
> >      $ref: /schemas/types.yaml#/definitions/flag
> >      description: The mask to disable MCQ (Multi-Circular Queue) for
> > UFS host.
> > @@ -54,29 +99,41 @@ allOf:
> >        properties:
> >          compatible:
> >            contains:
> > -            enum:
> > -              - mediatek,mt8195-ufshci
> > +            const: mediatek,mt8183-ufshci
> >      then:
> >        properties:
> >          clocks:
> > -          minItems: 8
> > +          maxItems: 1
> >          clock-names:
> >            items:
> >              - const: ufs
> > -            - const: ufs_aes
> > -            - const: ufs_tick
> > -            - const: unipro_sysclk
> > -            - const: unipro_tick
> > -            - const: unipro_mp_bclk
> > -            - const: ufs_tx_symbol
> > -            - const: ufs_mem_sub
> > -    else:
> > +        avdd12-ckbuf-supply: false
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: mediatek,mt8192-ufshci
> > +    then:
> >        properties:
> >          clocks:
> > -          maxItems: 1
> > +          minItems: 3
> > +          maxItems: 3
> > +        clocks-names:
> > +          minItems: 3
> > +          maxItems: 3
> > +        avdd09-supply: false
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: mediatek,mt8195-ufshci
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 13
> >          clock-names:
> > -          items:
> > -            - const: ufs
> > +          minItems: 13
> > +        avdd09-supply: false
> >=20
> >  examples:
> >    - |
> > @@ -95,8 +152,34 @@ examples:
> >=20
> >              clocks =3D <&infracfg_ao CLK_INFRA_UFS>;
> >              clock-names =3D "ufs";
> > -            freq-table-hz =3D <0 0>;
> >=20
> >              vcc-supply =3D <&mt_pmic_vemc_ldo_reg>;
> >          };
> >      };
> > +  - |
> > +    ufshci@11270000 {
> > +        compatible =3D "mediatek,mt8195-ufshci";
> > +        reg =3D <0x11270000 0x2300>;
> > +        interrupts =3D <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
> > +        phys =3D <&ufsphy>;
> > +        clocks =3D <&infracfg_ao 63>, <&infracfg_ao 64>, <&infracfg_ao
> > 65>,
> > +                 <&infracfg_ao 54>, <&infracfg_ao 55>,
> > +                 <&infracfg_ao 56>, <&infracfg_ao 90>,
> > +                 <&infracfg_ao 93>, <&topckgen 60>, <&topckgen 152>,
> > +                 <&topckgen 125>, <&topckgen 212>, <&topckgen 215>;
> > +        clock-names =3D "ufs", "ufs_aes", "ufs_tick",
> > +                      "unipro_sysclk", "unipro_tick",
> > +                      "unipro_mp_bclk", "ufs_tx_symbol",
> > +                      "ufs_mem_sub", "crypt_mux", "crypt_lp",
> > +                      "crypt_perf", "ufs_rx_symbol0",
> > "ufs_rx_symbol1";
> > +
> > +        operating-points-v2 =3D <&ufs_opp_table>;
> > +
> > +        avdd12-supply =3D <&mt6359_vrf12_ldo_reg>;
> > +        avdd12-ckbuf-supply =3D <&mt6359_vbbck_ldo_reg>;
> > +        avdd18-supply =3D <&mt6359_vio18_ldo_reg>;
> Do not add the avdd12/avdd12-clkbuf/avdd18! these analog power cannot
> be power off. even that the system is in suspend state!

That does not matter. If a supply cannot be powered off, it should
have the regulator-always-on property in the DTS. The relationship
still needs to be properly described in the binding. If you want the
driver to not do those calls, then please comment this on the driver
series.

> > +        vcc-supply =3D <&mt6359_vemc_1_ldo_reg>;
> > +        vccq2-supply =3D <&mt6359_vufs_ldo_reg>;
> > +
> > +        mediatek,ufs-disable-mcq;
> > +    };
> >=20
> > --
> > 2.52.0
> >=20
>=20






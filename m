Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E657C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 16:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JT7BltXK/O+RVr7HZDUyFWjcaSBcl/b5sxD3x657pVM=; b=Rc1Sp/2rEGmFd3DIvAa4XIjiRi
	E6tIWkENd/ykh6BoUb8E9CHspkzk0Zdqp4eIBOn+37iKTAS/Q769svdQ42kdjeTIgzhcbzZjab5wk
	2IT1LkLBigHOHsyEjloonD8B5uHQU8o+IxGohJ+jqykNYtYg4pc+BPn6U/RCVWTk2tt55dxpRCzuh
	ipPJ89HM/xa3SHQSvplX2IJG6kRWuLYvdzTNnlC+//uktjsRt8dLRTJt7HNih/taJmKZwZKkl8QqY
	wyfo3Cviq//5sX1K/MDq9HY7Vnc78F0cAIJuwkbuw8PlU71DzxgONrxfl0JytDkVIUn5scY74BIFr
	F245JajA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sAT-00000009gyQ-362Q;
	Wed, 16 Sep 2026 16:07:29 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sAQ-00000009gx3-2qmf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 16:07:28 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so4562225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789574845; x=1790179645; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JT7BltXK/O+RVr7HZDUyFWjcaSBcl/b5sxD3x657pVM=;
        b=D16b0LjX7mdeHmWJaEaYzpRFqmx786pgKwUroPOcgJz42MBSnIkpKRCgTNvEmZp5E8
         +h+a9a5AGfc66ObCR8FOYdpVHL7Or3xlMMy4pyxTU+Q/k/b+IYgXoQkyrmHZk21RT9aQ
         qQZtquoQj45NciAyEfG3TijXilZcj2b/ptzBE9vWcLWjjyw44m24kDi0+AIBJgJ4iJYN
         aMjyctr2eI4YCaFz6lTwiVgkhGBgML9wHrcT1PTsyILzsGcX4A4nH0PejjgST9/r5XMr
         o/+f2A/Tn1ibO5SNMLfoFeA02gGauOjyWH9bED5j7wdgbruOECaxujWLr9DtWN5BQ6Rv
         Ttnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574845; x=1790179645;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JT7BltXK/O+RVr7HZDUyFWjcaSBcl/b5sxD3x657pVM=;
        b=2VU5Kh+O/j2iVAdad/em/9nfeJs7JIATh46nc+H6G16fgQLifF6e2134Tv5GL+Whyk
         uXPfDLO5KYx97Eq0G4Rx5vfLxdGiHdL5tLo9I3ALVeev5jMUM1SzqIsfoa/KCY67JXiY
         /x5RjgkhUv4EEFcpt2ltP7TFMTcJWIlF6qTf6rxwJf3ov8oIxFmc3gjIcNL+HoAiaauM
         4jMviKcpsHc1A0zU9eIifjjqSK5uoDfVnmLi7zFuK89U9toegZV9xVJlVGYdjK2rhuI9
         WeENRhWPnfkTfn9N4owxDTWTORIGWNjHKwFq9VCMqld37IUuKnnnlmyOrHQq/byvAa2i
         6Q4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxmFqwJEj9voYN/bZh0s2lpUDHFcmESIeDXAjjWw1EkTn+nOlc9eFrSNErqUQElCf/h/PP1o2kNqvMxZH4SM6Bf@lists.infradead.org
X-Gm-Message-State: AFuF++nsAcyBjn8FuVCRV5BOTM4QpL1ZNmKEd+GNozGBNQqCAmRUcJsL
	q2jp1JKIY6XsZzzxC9lq0nSLNh8Yt53kSw+M1aNp2SgJmRhG0a/o+b55ZYFUyNeDK5c=
X-Gm-Gg: AYBFou1KA6CUoibSpbNC0pP6WuEAJQcLQFtQbFgTZlBoSvKa0oSKASMqEg59gFaVs5w
	B3YcAFH3iWu5sRrouUgYnjEw+M525f+1OR3XpH8/qfMOO076yA9vgwnm6/0rWE+brXQp6WukAIE
	hjjFOqOSV23Mur/eVailMnp40SRiU0uaA/FSVza+aYtnwJrCx2XOnb3CfH4hNVORrkjz1qbmBQF
	cqVbhZMfIwCnLkD17hqKZMWYJ99KjbUPIdYnG+IwSFvw09ePQNe0/UPcmWtYfwU89uThHXYBxhE
	6XSFRcYp9mdIF0iNLIEIjrSVDD3VWcQzsOLOoNl95D8sa/4vXkisDoh9tnfAa4Vu2Z/Z7IU43EU
	97q31ZKILLP1dcYlG5q5ur5X0l2xb4Z6ojmzCrerg3PC2gIj36YCcrw0cUkQfFVNgZ7CyYq6saw
	khKDYeZkeHKlwZII6B31j9OO2dFB707s+WFHgZXUtPdFMdmxYbmCkAGZr5ede3z2/KHA==
X-Received: by 2002:a05:600c:1992:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fbd1af43dmr2094185e9.3.1789574844730;
        Wed, 16 Sep 2026 09:07:24 -0700 (PDT)
Received: from localhost ([2001:4091:a245:8029:665d:b7b:5fa4:7ad0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd232b25sm1173905e9.4.2026.09.16.09.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:07:24 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=efd0b5b3ebc06a57040b85351ecf90f4d001a63d5dfa687974f195763dd4;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 16 Sep 2026 18:07:16 +0200
Message-Id: <DLGVC2B0B20H.12SWQB4JAGCJ0@baylibre.com>
Subject: Re: [PATCH v8 9/9] arm64: dts: ti: Add wkup R5F nodes to pre-ram
 bootphase
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Francesco Dolcini" <francesco@dolcini.it>, "Markus Schneider-Pargmann"
 <msp@baylibre.com>
Cc: "Nishanth Menon" <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Tero Kristo" <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>, "Judith
 Mendez" <jm@ti.com>, "Daniel Schultz" <d.schultz@phytec.de>, "Andrew Davis"
 <afd@ti.com>, "Siddharth Vadapalli" <s-vadapalli@ti.com>, "Paresh Bhagat"
 <p-bhagat@ti.com>, "Bryan Brattlof" <bb@ti.com>, "Jai Luthra"
 <jai.luthra@ideasonboard.com>, "Devarsh Thakkar" <devarsht@ti.com>,
 "Beleswar Padhi" <b-padhi@ti.com>, "Francesco Dolcini"
 <francesco.dolcini@toradex.com>, "Stefano Radaelli"
 <stefano.radaelli21@gmail.com>, "Nick Desaulniers"
 <ndesaulniers@google.com>, "Vishal Mahaveer" <vishalm@ti.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Sebin Francis" <sebin.francis@ti.com>,
 "Kendall Willis" <k-willis@ti.com>, "Akashdeep Kaur" <a-kaur@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, "Hari Nagalla"
 <hnagalla@ti.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com> <20260903-topic-am62a-ioddr-dt-v6-19-v8-9-74c650dfdea6@baylibre.com> <20260911052428.GB5377@francesco-nb> <DLGNWF2DSXZI.7WRJZRZLGW8@baylibre.com> <20260916104017.GA284106@francesco-nb>
In-Reply-To: <20260916104017.GA284106@francesco-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_090726_742188_25FC6433 
X-CRM114-Status: GOOD (  24.41  )
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

--efd0b5b3ebc06a57040b85351ecf90f4d001a63d5dfa687974f195763dd4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Francesco,

On Wed Sep 16, 2026 at 12:40 PM CEST, Francesco Dolcini wrote:
> On Wed, Sep 16, 2026 at 12:17:42PM +0200, Markus Schneider-Pargmann wrote=
:
>> Hi Francesco,
>>=20
>> On Fri Sep 11, 2026 at 7:24 AM CEST, Francesco Dolcini wrote:
>> > Hello Markus
>> >
>> > On Thu, Sep 03, 2026 at 02:39:30PM +0200, Markus Schneider-Pargmann (T=
I) wrote:
>> >> For IO+DDR the wkup_r5fss0_core0 and the
>> >> wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
>> >> setup is done. These are used to read the lpm metadata region in
>> >> which data is stored to resume. This needs to be done before RAM is
>> >> in use to avoid overwriting data.
>> >>=20
>> >> Add the bootph-pre-ram flag to the wkup_r5fss0_core0 node in both
>> >> ipc-firmware dtsi files and to the lpm metadata region nodes of the
>> >> AM62A and AM62P boards.
>> >>=20
>> >> The board level bootph-pre-ram flag of k3-am62d2-evm.dts becomes
>> >> redundant with the dtsi-wide flag and is dropped.
>> >>=20
>> >> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
>> > ...
>> >
>> >> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64=
/boot/dts/ti/k3-am62p-verdin.dtsi
>> >> index 45ab9d947b3a..8976c0424cd1 100644
>> >> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
>> >> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
>> >> @@ -184,6 +184,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca=
08000 {
>> >>  			compatible =3D "shared-dma-pool";
>> >>  			reg =3D <0x00 0x9ca08000 0x00 0x1000>;
>> >>  			no-map;
>> >> +			bootph-pre-ram;
>> >>  		};
>> >
>> > verdin-am62p has the various bootph tags only in the U-Boot dtsi
>> > (k3-am62p5-verdin-wifi-dev-u-boot.dtsi) as of now, I am not convinced =
it
>> > is a good idea to just add this single one here.
>>=20
>> I don't see any bootph-* flags for any of the related memory regions in
>> k3-am62p5-verdin-wifi-dev-u-boot.dtsi. Is it in a different dtsi?
>
> What I meant is that any bootph- property is in
> arch/arm/dts/k3-am6p25-verdin-wifi-dev-u-boot.dtsi=20
>
> And I would not start adding spreading this in 2 different places.

As I said, there are 72 bootph- properties in am62p related devicetrees
in the kernel devicetrees. For k3-am62p-verdin*.dts the relevant ones
are probably:

      3 arch/arm64/boot/dts/ti/k3-am62p.dtsi
     14 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
      2 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
      2 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi

Also if I understand correctly, it is preferred to get these bootph-
tags into the upstream devicetree:

  https://lore.kernel.org/u-boot/20260903144032.GI1764417@bill-the-cat/

Best
Markus

--efd0b5b3ebc06a57040b85351ecf90f4d001a63d5dfa687974f195763dd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaqq+tBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlMa
CwD/UzU/bEn+SvEhbYhrvo356ps/AZUBbSCU7LIcWlv3E5YBAJxIt80j3RbsiuhH
LWCPbjxjKVKr3P1SKVvEXWAyHpEF
=8soS
-----END PGP SIGNATURE-----

--efd0b5b3ebc06a57040b85351ecf90f4d001a63d5dfa687974f195763dd4--


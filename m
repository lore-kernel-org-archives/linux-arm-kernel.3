Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E5CC83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 10:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0T5ERNEDk8sZhawQuX8JVZNNOUKlYRbaNNvCcLZi7To=; b=wR/ZqcnamjBRfDkjQOym2FPvtL
	wqs0MMq8EDaV987JemaTjcgU3aKq6+D2EV0g9nN5gTTNFFuI4WURg7yKkhmHiAwC0uPIHbrF3Au4o
	TKatyZw7gunez4gt17Nvp76GfuQRfivq4m5o2AZNR9LvUzXE8kZkRiGU4gAGQxEk7UnYMWTbSuJT5
	PV95z0TmUM0PgidWOWGgankcy7nfiaSSbh4CsDPlERqGRYkyiFEAu3BMBO6c5KQQZ7Gscvq98dmVz
	mC7y6CUFVvq2Dc+YbpipxSkIhE5VXykBqQNTZSaJ1K3OuIx2MRrLyvvu6mzN4Xh3YMGglEgKiJzxw
	hihivkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYMNb-00000000797-1Yni;
	Sun, 06 Jul 2025 10:13:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYMIi-000000006kX-3gZr;
	Sun, 06 Jul 2025 10:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0T5ERNEDk8sZhawQuX8JVZNNOUKlYRbaNNvCcLZi7To=; b=cJf4gUb0j4HN6Gi1YGlxiSNtg7
	aqAUDfSFSugOQdP7/ktU7AiJg449gGSzc+RkBVSZ86fEYpMot+zVliGBZs/PbwEKT/psV4E6mberE
	G+DpUzqgOZQYH2FhuKXnc0hsJ1UL0EfJVwd2saW//SyDrHM2H7wzda2ZgShBbWBSF3FzC6/+BEUcF
	OYRkZm3f9iJsR13yKLTH2XvDojQmqFX73mT2N7i8CTi9HkCT1w0lc/5Ec9fnSHUo+paSmuyViwW1w
	52cxT+Mrl5lKLOpQL0GGQAQ4NMdoyFAZSKjZ3ICqaGWnVEPsVPFnsifWjRlLACr5KT741p01tgYLa
	Nnmhz7bw==;
Received: from mail.netcube.li ([173.249.15.149])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYMIf-00000008IkV-2LpU;
	Sun, 06 Jul 2025 10:08:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:In-Reply-To:References;
	bh=0T5ERNEDk8sZhawQuX8JVZNNOUKlYRbaNNvCcLZi7To=;
	b=oyYJcxdvi2HSsrtA0NRNLP07hI9ZWZIgqk6i56SdDxhuilLTawGFGOSVJC912TFRMLct63t8lLnzoG7oTvvmDgV4EQBeh92HD+Ur9BHzL4r4O2nzndjBg/jeI4je5pMqv0FgdW6s+GlBpLEj4MSjeLNSdZYVlPYau+ThN9Towh0=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Sun, 6 Jul 2025 12:08:20 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 3/7] dt-bindings: arm: sunxi: Add NetCube Systems Nagami Keypad
 Carrier Board
Date: Sun, 06 Jul 2025 12:08:18 +0200
Message-ID: <22754446.EfDdHjke4D@lukas-hpz440workstation>
In-Reply-To: <8549188.T7Z3S40VBb@lukas-hpz440workstation>
References: <20250705213900.3614963-1-lukas.schmid@netcube.li>
 <4648f0bf-2957-45bf-a6c1-01787e5d3e88@kernel.org>
 <8549188.T7Z3S40VBb@lukas-hpz440workstation>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7824363.EvYhyI6sBW";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_110845_820695_995483C3 
X-CRM114-Status: GOOD (  26.79  )
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

--nextPart7824363.EvYhyI6sBW
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
Date: Sun, 06 Jul 2025 12:08:18 +0200
Message-ID: <22754446.EfDdHjke4D@lukas-hpz440workstation>
In-Reply-To: <8549188.T7Z3S40VBb@lukas-hpz440workstation>
MIME-Version: 1.0

On Sonntag, 6. Juli 2025 11:58:16 CEST Lukas Schmid wrote:
> On Sonntag, 6. Juli 2025 11:46:46 CEST Krzysztof Kozlowski wrote:
> > On 06/07/2025 11:41, Lukas Schmid wrote:
> > > On Sonntag, 6. Juli 2025 11:36:34 CEST Krzysztof Kozlowski wrote:
> > >> On 06/07/2025 11:07, Lukas Schmid wrote:
> > >>> On Sonntag, 6. Juli 2025 09:49:58 CEST Krzysztof Kozlowski wrote:
> > >>>> On 05/07/2025 23:38, Lukas Schmid wrote:
> > >>>>> The NetCube Systems Nagami Keypad Carrier is a custom board intended
> > >>>>> to
> > >>>>> fit a standard Ritto Intercom enclosure and provides a Keypad,
> > >>>>> NFC-Reader
> > >>>>> and Status-LED all controllable over Ethernet with PoE support.
> > >>>>> 
> > >>>>> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> > >>>>> ---
> > >>>>> 
> > >>>>>  Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
> > >>>>>  1 file changed, 6 insertions(+)
> > >>>>> 
> > >>>>> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > >>>>> b/Documentation/devicetree/bindings/arm/sunxi.yaml index
> > >>>>> 7919b5bf5..a2f16d064 100644
> > >>>>> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > >>>>> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > >>>>> 
> > >>>>> @@ -610,6 +610,12 @@ properties:
> > >>>>>            - const: netcube,nagami
> > >>>>>            - const: allwinner,sun8i-t113s
> > >>>>> 
> > >>>>> +      - description: NetCube Systems Nagami Keypad Carrier Board
> > >>>>> +        items:
> > >>>>> +          - const: netcube,nagami-keypad-carrier
> > >>>> 
> > >>>> That's just enum with previous entry. Don't make it over-complicated.
> > >>>> 
> > >>>> Best regards,
> > >>>> Krzysztof
> > >>> 
> > >>> Just making sure here. The actual bindings are fine, but I should
> > >>> merge
> > >>> them into one patch, correct?
> > >> 
> > >> No, you got two comments what should be changed in the binding.
> > >> 
> > >> Best regards,
> > >> Krzysztof
> > > 
> > > So if I understand correctly you want me to remove the
> > > "allwinner,sun8i-t113s" from the carrier boards and keep it for the SoM?
> > 
> > No, I spoke nothing about that compatible. My comment is EXACTLY under
> > the line being incorrect. That entry should have been made enum with
> > previous board compatible. Look at other vendors, because this file
> > repeats that pattern for some reason, eh...
> > 
> > Best regards,
> > Krzysztof
> 
> Ah sorry. I think i understand now. You want the carrier boards in a single
> entry with the different compatibles as the enum like:
> 
>       - description: NetCube Systems Nagami SoM
>         items:
>           - const: netcube,nagami
>           - const: allwinner,sun8i-t113s
> 
>       - description: NetCube Systems Nagami SoM based boards
>         items:
>           - enum:
>               - netcube,nagami-basic-carrier
>               - netcube,nagami-keypad-carrier
>           - const: netcube,nagami
>           - const: allwinner,sun8i-t113s
> 
> Best regards,
> Lukas

Oh, I will then drop the SoM's entry as well since the SoM is already defined 
in the carrier boards then. So only

      - description: NetCube Systems Nagami SoM based boards
        items:
          - enum:
              - netcube,nagami-basic-carrier
              - netcube,nagami-keypad-carrier
          - const: netcube,nagami
          - const: allwinner,sun8i-t113s

correct?

Sorry for the back-and-forth, and thanks for your patience.

Best regards,
Lukas
--nextPart7824363.EvYhyI6sBW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmhqSxMACgkQJnN+drMV
RthYPgf7B7hvP/DGLODPXJ1qjUQvXaRZGtuTOiaLfm61dhyn2IsydYUhpwhhMViQ
z6T4DAm9Eg8CcJqiTb1kckKS/dheJ+eom2IBK9LLb2JHbXaetlXlSvDfbWlTS1I2
ofG6QKBDYHccjJiejjI2uEIAYALwCMjqxudUUCoMN2hz8euzwKx8dzEXfdWZmcRj
OzeZsdwQkv8RvP+eiii1xdu/GbnMGKixs75n40v535LOdVWD/hptkJKMPW0fNe8A
4Hd6uhLD7lZ3qIuEMZfvcCjOF/iCKafXpjCuK6CdFwfC5j+Sgrr3Z5zMAIJ3WRbr
qCBfoSswKd8fkF5d6rVpVOBcBOPa5g==
=JbSx
-----END PGP SIGNATURE-----

--nextPart7824363.EvYhyI6sBW--






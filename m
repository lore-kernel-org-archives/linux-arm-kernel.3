Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CB6C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hGVZh4PoHLjhUPeUZDk7YT9r2Csoy+q60RG1t1sPcs=; b=2yfAApyKmi1bVyDIO6K5MgRSmL
	dFMMSYsuGlRxEFrkF6/qM49K+NSs86Sg9x6f8PYATMoUc/diklS2dDryJMCKxll+E+9qFRxH4Yb4k
	RiVquq1qpPKMsVUAkwIzwuzFHEEkF7oR11pZWEZMEweGyql1+IQFkIwKS4bS+4EZmrscm6l6In2Cf
	dEoUtqUBk3A+4tnZ0yQ/tJzzMjUVyHrxlpstdHAr8skglBaq3Q5KsY1MAX5lN6BPdWtFS37ZtOquz
	lO9ncETwUOuSv2tdCUSDZQSRmcC53bS1lvr73e0XR2lixS5cL/UeRbWRuxPNZpJXPAlCZlQ23+uI0
	pObdgaHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjupM-0000000E96W-34R8;
	Wed, 15 Jul 2026 08:18:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjupL-0000000E96N-3yNj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:18:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E86740D7D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 08:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B051F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 08:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784103525;
	bh=8hGVZh4PoHLjhUPeUZDk7YT9r2Csoy+q60RG1t1sPcs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Y+vkypAFF2VaKmeNBsJM168DosyIXULOV/1fpLuzsTul1sgGvXaBR4KZ6xOeIC+2j
	 Ci+eiuoe5uMuHswoUkQiT4cMDUrKyJHoTFFQmF37me/jk2bry6CyrZbFe4/+NfwFcX
	 SG7ighaYJUwUSjtA22Qc2YIC4pFU+ExRU41dvQRVxxFMEEaWzAjIETlABGoFhH67vD
	 hcmZwvOC5bee6CUqAe029xw9LtrSlXAKvUsDYQycVXhHx0+E6TaxSvcfjZ5xskzofp
	 L3QcfMeKA0I8rSRy0J4LVEzwZYEL7usUigDcxEmdjKlPkyB9vRYGbpTIPLxVrXraLs
	 6i7e19kgfMjHw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39b3931e259so46870561fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:18:45 -0700 (PDT)
X-Gm-Message-State: AOJu0YzABb6MsljntEBBo74KpRpdxCAF/p4momfvUNF60e3ilckiZaTF
	Kn5SBMX0HqJAWbBCUdNSzAHSbAquiIt9sMH0htZDDzu/IPRE+L6lyeIOjB7w44BgUBh4PLywcZi
	vFvJknS9pQOsZocbjhucg3mieCsIQNGI/ZMsv1/poWw==
X-Received: by 2002:a2e:a58f:0:b0:39c:7919:fcf1 with SMTP id
 38308e7fff4ca-39db6d81975mr4644921fa.33.1784103523816; Wed, 15 Jul 2026
 01:18:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 01:18:41 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 01:18:41 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260711210131.236025-3-marex@nabladev.com>
MIME-Version: 1.0
References: <20260711210131.236025-1-marex@nabladev.com> <20260711210131.236025-3-marex@nabladev.com>
Date: Wed, 15 Jul 2026 01:18:41 -0700
X-Gmail-Original-Message-ID: <CAMRc=McWngnxX1TE7jj+4hr25PN6o4rZGW+Jm2CivXtzA53CwA@mail.gmail.com>
X-Gm-Features: AUfX_mwKBsfMiGTO8O5kdCZA1clS20B1ees3zGV3oL0u74_c0uWhHuUReKtAFA8
Message-ID: <CAMRc=McWngnxX1TE7jj+4hr25PN6o4rZGW+Jm2CivXtzA53CwA@mail.gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: gpio: pca95xx: Document Kinetic KTS1622
To: Marek Vasut <marex@nabladev.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 11 Jul 2026 22:59:31 +0200, Marek Vasut <marex@nabladev.com> said:
> The Kinetic Technologies KTS1622 is a 16-bit general-purpose I/O
> expander via the I2C bus for microcontrollers when additional I/Os
> are needed while keeping interconnections to the minimum. Datasheet
> comparison suggests that it is compatible with TCAL6416, add the
> compatible string and TCAL6416 as a fallback compatible.
>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> index 4f955f855e1ab..4631388a7d914 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> @@ -22,6 +22,9 @@ properties:
>        - items:
>            - const: diodes,pi4ioe5v6534q
>            - const: nxp,pcal6534
> +      - items:
> +          - const: kinetic,kts1622
> +          - const: ti,tcal6416
>        - items:
>            - enum:
>                - exar,xra1202
> --
> 2.53.0
>
>

Hi Konstantin!

I applied this patch with b4 and tried to generate the .thanks email. It failed
like so:

$ b4 ty -all
Auto-thankanating commits in gpio/for-next
Found 9 of your commits since 1.week
Calculating patch hashes, may take a moment...
  Located: [PATCH 00/10] arm64: dts: st: Add support for DH
electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and
DHSBC
---
Generating 1 thank-you letters
  Writing: ./marex_nabladev_com_patch_00_10_arm64_dts_st_add_support_for_dh_electronics_stm32mp23xx_stm32mp25xx_dhcos_som_and_breakout_board_and_dhsbc.thanks
Traceback (most recent call last):
  File "/usr/bin/b4", line 8, in <module>
    sys.exit(cmd())
             ~~~^^
  File "/usr/lib/python3/dist-packages/b4/command.py", line 417, in cmd
    cmdargs.func(cmdargs)
    ~~~~~~~~~~~~^^^^^^^^^
  File "/usr/lib/python3/dist-packages/b4/command.py", line 113, in cmd_ty
    b4.ty.main(cmdargs)
    ~~~~~~~~~~^^^^^^^^^
  File "/usr/lib/python3/dist-packages/b4/ty.py", line 681, in main
    auto_thankanator(cmdargs)
    ~~~~~~~~~~~~~~~~^^^^^^^^^
  File "/usr/lib/python3/dist-packages/b4/ty.py", line 386, in auto_thankanator
    send_messages(applied, wantbranch, cmdargs)
    ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3/dist-packages/b4/ty.py", line 452, in send_messages
    with open(outfile, 'wb') as fh:
         ~~~~^^^^^^^^^^^^^^^
OSError: [Errno 36] File name too long:
'./marex_nabladev_com_patch_00_10_arm64_dts_st_add_support_for_dh_electronics_stm32mp23xx_stm32mp25xx_dhcos_som_and_breakout_board_and_dhsbc.thanks'

The name is under the 255 byte limit, is this a b4 bug/limitation?

Thanks,
Bart


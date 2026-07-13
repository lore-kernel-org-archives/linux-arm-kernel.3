Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FDFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBeUwJIXJms3/6Tic9aQZqS3Njj0/svqOV1cGNy95II=; b=dx2EMcTcSBElyxh2xMrY6fr8Ae
	d8Pu5tKyJ8VQqd11H3bU1Ksn7UYex+5WMfHkTHAuMf1KmLlpfoNIdPnVr9SDbUcqdhkvubnwkL48l
	079hJKAnsJRho6T8rftgX5wfqP8zdiO59UwcTM9aBfsVuaPriDkysywPgB5FE5xaD+Alqk0nj2Ck7
	b/QAO/qzdi797wCAcG3rTIAtQfYQcZyqQ0yp9tKS+PgY/FQFvOV4ZaYnBBe7PHYfEHUu3NjQJ14OR
	/wQi5/YapzUfVsOGqdgLCheSdCSLtaajtPNf384jUZg2rsF988Tep0smV7B1w8l8nkEYlxc+UmCfG
	kWri0UbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjC9f-00000008baL-2xBA;
	Mon, 13 Jul 2026 08:36:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjC9f-00000008baE-1rzp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:36:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF21143779
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 08:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22841F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 08:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783931806;
	bh=QBeUwJIXJms3/6Tic9aQZqS3Njj0/svqOV1cGNy95II=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=K3Hr9zRMcNTI5GjZ6L5a+cFlj1T79JGXmuZhghDtZz1YX2Kjd9j4LLCbJucd+qW4d
	 +m3Y4Vp1p8diMdQ5Vl/sKFGNomnYNJSFGf6F6+YrXs7jDmvLE2DA3XTVdrXbCJnvLO
	 MbE/s0YO/xAuZZiVobtI/6Q2LHAMS6k4TbSNH98rGL0/8CM5sW1LBn9e5DMqpMTogj
	 VntKmvGKI3EQLLqmopls/eDDjzX7WaM0pttTLxLLr2+H627GNunRSkG6kZLuja5lhM
	 uRYIe3rg4rCrlGIA764FX3le5ZuGsPVWEmxExJDcq7rC+mVjYMfVtkZigwy3e9Ainv
	 UAvxi1xb5WazQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c74c469e8so21863631fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 01:36:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrgsp5GKvvxb/1NHoKBVZXptQsy6WBnLak1pTtHZWtD4MwhIsdqsBqeMOfURGiRrwTmY7SVZv9uOfD9/ICGDL2P@lists.infradead.org
X-Gm-Message-State: AOJu0YwrulRhtrH1z3ONcDQV/bD7KvsOAOFWZd7CIBVs6YqrtgMZY9J1
	FQ1t8wJs5TWdOgtEJxzeefqf2EmlY85/kuaxz1igSqQsealUMSk5f0V7N1Bq053YAsKtuFdFyNA
	N1XySLqXZ1LfCg/EO5vXZPQwloHt1fE2u1R/vCMCZ6Q==
X-Received: by 2002:a05:651c:154d:b0:391:1570:b6c6 with SMTP id
 38308e7fff4ca-39ca78e3b6dmr17345291fa.2.1783931805473; Mon, 13 Jul 2026
 01:36:45 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 01:36:44 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 01:36:44 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260711210131.236025-3-marex@nabladev.com>
MIME-Version: 1.0
References: <20260711210131.236025-1-marex@nabladev.com> <20260711210131.236025-3-marex@nabladev.com>
Date: Mon, 13 Jul 2026 01:36:44 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mds7FAg=e-JGWxK=9vn5A0sdYDhpZ7Wvo3eCKV1tyNpKw@mail.gmail.com>
X-Gm-Features: AVVi8Cfsa0ItDBiNodG26S3_9jGGx3yuP-hiAD8ff_raWb2IPrBsLFiM5IVJVOQ
Message-ID: <CAMRc=Mds7FAg=e-JGWxK=9vn5A0sdYDhpZ7Wvo3eCKV1tyNpKw@mail.gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: gpio: pca95xx: Document Kinetic KTS1622
To: Marek Vasut <marex@nabladev.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
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

I applied this. I would have sent a b4 notification but got this instead:

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

Bart


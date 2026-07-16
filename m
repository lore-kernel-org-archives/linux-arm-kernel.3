Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0346DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NR3lXQ4dlpKV3WszMatO8sscZD/DgmWD4Yj1aUtkeU=; b=4imF4e4CzKe3gfxKRM9mPkXP9a
	86WMPG+NHcws5vVrG8zcwiin6BCJl9AaTJGMsTxRgbmo2FoNtUht8bEhogAECdpcLpdhk/OdJswxm
	3q8b+vAQ+poU7kK70xoS3O01Izfv0c7Lh8DmrJvFwsw+TsIJRj4tRAGv36hKSKLLVGwhoPCdC472h
	s+O+gONUl0uzM7dRsc0aCk05lOCiwR4ElTLclxlca+ypVwcQuUFnA9PwlN7N4fb2gLR1N0XRwK+rK
	ZTHFU6Vblq5zz/tpMV3nBF29C/Ii3VxOWfkOb5qXbsuEY6GrqCNMn2jYuOC3NI47pRuOChCRiRwIJ
	9yBN3UMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHzk-0000000GnrY-3wMT;
	Thu, 16 Jul 2026 09:03:04 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHzh-0000000Gno7-0HBJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:03:03 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8485ef63b68so5935039b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 02:03:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784192580; cv=none;
        d=google.com; s=arc-20260327;
        b=J/8sDLc+t4+pqwstAiLCJmEE5a+OVPM7oFWtxmcYxGBgRWYExhgQbZBjWxlahr3XdY
         ASWero823RnfgzPjRfGoCo9rCr1KOZdoULVejX19iPNyfAgFnE5bJ8gUeM1ah25x7pQ7
         8s0+IMn6DrWAWLbuzmuoNQhAASsd7+e7v2lXMAD7j4Q1N/MnIRH1dyTkst45FuKIZOcU
         GECtjJvKsrVNUOkGnPqC2Az1ogalNfclkIPgLpj5gKCkCRSbnrneo8jsneZ62IzUnuFm
         +QpcbDcZ8f/AtW6wfjdfXVvpZ87L1VpKUhqKKngw3ZwxxH9Z/+n/Xp9y11jNcik8EctC
         AvFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7NR3lXQ4dlpKV3WszMatO8sscZD/DgmWD4Yj1aUtkeU=;
        fh=7BuftYOBxccrFkL57PFDPUq9w/NexWiTa3lsotOjFAs=;
        b=cnJTOiIl4E6NXJTfGPslYbYfRuhrT0hu4TgZky53IYZkF9CZ2xCwFJtS0PqG62oS50
         +GA/GLnKYO4TokTCNYzweCshKsDspjrwxsZwjw+Y+2nI/F+oJVZVvF0OMV+Wxa/95iwW
         0K2CVLmqZouhBBVENlHbFHBh7siDKGlv/TOb3XqDq9Uvb+MURUHXUOihrTy2WcW1QH7X
         5dwqsk7ofQTY0ilYUSndnf+to07Z7s8LazBW+OAVQIz7iH9JkGXvp7jQ+PWsMcMXKjt4
         1wKnQuDqeAcKT+y/HxmXZ5VhS+3IoirSjJK6+0IBmeOORffLwzFRpyD7+4h0xUe4SQZN
         WVpA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784192580; x=1784797380; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NR3lXQ4dlpKV3WszMatO8sscZD/DgmWD4Yj1aUtkeU=;
        b=IGc0Ds7QA9zwP/EoZXLxe1VrkljTfPB6mRnouer1oq+l1CWie0ErKMFZdB+OjVlVCx
         sNIXCIFVAJPhBPuotobVI97UH29qNlRSQ/ZZ3ia4638h5FaXhU6vzawuhoRZlZzCZ7BJ
         EpqOcWGnMpb4Z6/I3EOVh6x28dh+EMzEB8xqKmudYrrgYA56TZ1ImYQaOmkLvBgBXXhR
         FnAT/xzHIjzRAs1hN/PdKhEqTxyGKj61zElas9yIe+T/l64SS+TuQbKOhX0t+YCH59Zv
         zMEsq9xmFjSHEI1rDZslKmJtnekFyP3+5ESfWYQPbQOubvHFr/GSUXa3oBzc/GOjxld0
         Z9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192580; x=1784797380;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7NR3lXQ4dlpKV3WszMatO8sscZD/DgmWD4Yj1aUtkeU=;
        b=KYbIEntbkBFX+KXAUrhELweldkKWRO0ykOBKTz63R18EmFxXcBxWAWcL6LN9vDkCvj
         0K3nhJcjZTpuU/SkxdlsRo+qJB+mdL9IYqkR2Z5Fd9b3xwkp9ctXXCnVZHfQMZdrrxvk
         Brk3fZKQKVh6R0Ya84W+zpg4wMSl4GadpJtNOZ6SFX7yayhVc7icjMLqv5tZ/Q3cQA3k
         AXG6TKnFBKxBp7fqalI7WIiZaTP87kbQBRZdLHOUwXmG8Yzia7JDmGzcJ4JmaUsfGspS
         7DedEW1pYbNmvUv2fmllrQpRpU8L1p5zJv8l452smlixvuga6UgLI8pMTo6PYx5AMPH9
         a0Uw==
X-Forwarded-Encrypted: i=1; AHgh+RoPbh+yVv81ad3itsAl3+Ngc26tO+jyT3d0FwUx4cv3Jc37uLofs4vNh7ALNAlDZ3N/p49kxvUKZ6kfPphb01m9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8gDv/RQc0NhlknEGCPFzIvZU5PsI0qQBpX5Qc/exEssGlqp5l
	ObpIOFhNl8joTMPj9pmCwXePf2VhA6hu1EG0L9N0EEVfYGNC/5zF/ckLlDVpHu93Mkl0nvLcIg6
	rcFTgRPzKWddfwP9BG/kVQmLWiEBFxlQ=
X-Gm-Gg: AfdE7cmVNRjN0siJ+f9FatRvDYb60DX9UvvBaY/IIEeFJ3/0FDmz4jcxFXJKnjkpFPH
	InO3oyjUMrgA556xTSGHW+u1GwvGcTMo+GcTxoJhxo668nBv74stI7zPmlfzSztnD9TYRVLrTNA
	Euw2b7EdrcOf7D0ZBXZSSEHcvQ7h7K32FTebAlLEFbOLfP1hKQMahVW8kjwbPqB1QR/k5ckvnNq
	w7fhNR1JoOdW7m52ScsApJxLHI1h7X11kvuy0Jnxm0HdNbZohwjknInwr5I5FCcSibGCpf8RaqT
	SJTzw0sgaB6ORkCH+NCHrdA02y+EggNSv5vDH1oYtjs=
X-Received: by 2002:a05:6a00:8006:b0:848:4424:2b83 with SMTP id
 d2e1a72fcca58-84a5598fd50mr8757328b3a.77.1784192579663; Thu, 16 Jul 2026
 02:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
 <20260713-nanopi-m6-v3-3-227567ffc5dc@gmail.com> <DJYBBXE6SAG2.20OEJI5K6JIVM@cknow-tech.com>
In-Reply-To: <DJYBBXE6SAG2.20OEJI5K6JIVM@cknow-tech.com>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Thu, 16 Jul 2026 11:02:47 +0200
X-Gm-Features: AUfX_mycY6mvMh4gra26LhowY8uyLV9WWyka95Odu6j7B7QABexJfnpfhGVC45U
Message-ID: <CAPSPb=tTbdzBZFq9NE0PCiD8+7pbWhErauhOfjjkp0DnhDwvRA@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] arm64: dts: rockchip: rk3588s-nanopi-r6: fix
 missing pcie rst pinctrl
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	jonas@kwiboo.se
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_020301_109659_C54657EA 
X-CRM114-Status: GOOD (  18.69  )
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

Hi Diederik,

On Tue, 14 Jul 2026 at 15:02, Diederik de Haas <diederik@cknow-tech.com> wrote:
>
> Hi Joachim,
>
> On Mon Jul 13, 2026 at 10:30 PM CEST, Joachim Eastwood via B4 Relay wrote:
> > From: Joachim Eastwood <joachim.eastwood@gmail.com>
> >
> > The pins are used as reset-gpios but not reserved through pinctrl.
> >
> > Fixes: f3c6526d6fb2 ("arm64: dts: rockchip: Convert dts files used as parents to dtsi files")
> > Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
> > index 67e284a15c35..8df6e1a21180 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
> > @@ -360,12 +360,16 @@ rgmii_phy1: ethernet-phy@1 {
> >  };
> >
> >  &pcie2x1l1 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pcie2_1_rst>;
> >       reset-gpios = <&gpio1 RK_PA7 GPIO_ACTIVE_HIGH>;
> >       vpcie3v3-supply = <&vcc_3v3_pcie20>;
> >       status = "okay";
> >  };
> >
> >  &pcie2x1l2 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pcie2_2_rst>;
> >       reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
> >       vpcie3v3-supply = <&vcc_3v3_pcie20>;
> >       status = "okay";
> > @@ -420,6 +424,16 @@ rtc_int: rtc-int {
> >               };
> >       };
> >
> > +     pcie {
> > +             pcie2_1_rst: pcie2-1-rst {
>
> ``pcie20x1_1_perstn_m2`` to match the schematic name?
>
> > +                     rockchip,pins = <1 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>;
> > +             };
> > +
> > +             pcie2_2_rst: pcie2-2-rst {
>
> And ``pcie20x1_2_perstn_m0`` here?

Can do.
I see this used on a couple of other boards as well.

Thanks for the feedback.


best regards,
Joachim Eastwood


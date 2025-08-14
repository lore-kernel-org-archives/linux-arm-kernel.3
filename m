Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0039ACA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 09:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpEu3YjSYoh7r4VO0s5m1PdSv0aUP+n6hdz3pBdusjA=; b=aitwPKa88SSN6DfgIfg5fcI3o9
	+UYxgzCa8Ww1DytkBWZBc1o7xuFz5COJlJECI4Vlw5zN3k3jEcmdC2fHt+/iJx1UxjKyNgqVgK838
	Kv6nHiRP02YHwna6OegGI27LrXUH0OuszFwQIA0Tdj1Mqkf8oTUrDq6iBdelgWAkyE1P0YN56wKJR
	MbHXh5wJ6PHQvMNgpXo6ev9AQVuXhOBNgCahdy4SG3pxPoS3flEBOj27ReFpTQnOxbpWOpIkvMHpe
	1iGGiGY3S5vedY0fOtY233laKEVpMg+Ijh3KYUDTL1cfRx8p0GGK9Qxc4oci2NdQq7J+WYAORta8B
	Lpw/62WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUed-0000000GUjR-0Wer;
	Thu, 14 Aug 2025 09:53:51 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUBD-0000000GOOj-2PHx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:23:29 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55ce50946e2so750418e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 02:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755163406; x=1755768206; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpEu3YjSYoh7r4VO0s5m1PdSv0aUP+n6hdz3pBdusjA=;
        b=nsMHrCH4CfD3nRhMcyrCOa25GwGSPytUYjQahWNiDkWPNd3YsNs2WFbPObiAVYZdbY
         uIFW1JN0ZzjKDuYG78A9Nw0zqIsdQx9skyIfx/92FXfHLxXZhqeREsuRvP7bEO3HeZtS
         qPQtuQrsqcrv4cjoy2cr6DNxCtuEwBpO7Y7dY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163406; x=1755768206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpEu3YjSYoh7r4VO0s5m1PdSv0aUP+n6hdz3pBdusjA=;
        b=swic/YunPYm+roJCQ3eZ/X6TWMTW+feqqVWtrhS24hkqkaxtrm1gNHr+nhKT6x+DkB
         WPDskaHwMKTgJmbXupHin1xBXv0yH1GoeZnrc+r/wJq9W0NuPeeb+T+GpI1JmGMd8zt3
         tuwyVWYBklZEA4yOQPp3408H3Matso6IqBauTscdwLkn2MA8QXBy9FuBI0OhlG791h+H
         C18F0p33Vf/VUZP8sdZBT3m8vJx3oEY7OV2oBIaPLgY+DOpZdCvpitvQ2ZB5byP/I54F
         Fria4fB9V7tzQsoFlJZCnY98HZJmo+Xj6z9AlSjGQ0Ao3AEhitdpwlc8qL+4payLYlsN
         FUVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhgjCRwoCe0jCIH2/nqko40Ryc7kaVMp3+MPQLB0Iy349LhZtHk8JuY1n7am0LybbT5lPVygwyta4+I8Qb9igD@lists.infradead.org
X-Gm-Message-State: AOJu0YxjXVwULc+bVowC3hD4E4CqeX5pKDor8hM6YqouCsImVf4uUweA
	UQOMEI3HMJkiiwg3MFEtavRRgj1PVXaC+JRu/hm6UrE2jvMlUkDXdKi1voMbxtsY5Aj+q4KIaFh
	lo53T4Bx6hVxWps524lKYr8Lh7zIxKexzcOlbr4mm
X-Gm-Gg: ASbGncub0kuxv9i7YFRRMBpe+JcGSNW5sDx7HeTXyX/jM0RWBMZlBEY+/nVaq8K9Vw3
	Al4KU0CBDlrOyl8Wyt6FOmrqiqzYxt609yJV+KeVVdaCaknv7pNNM96UJp8FxlAaePVChJPvKmI
	Y5UOFZnLvVs41KYN+TEO+Zprc4YN3SulMJmLqcpSbkYJ8TZi837EBwWdLGNTWT01oE9chit1RBQ
	cdzk1iakhCbmKRRZfftU49yHW36iqNm/go=
X-Google-Smtp-Source: AGHT+IGpKciwODEZc1IhhzYqeOLMaszqjmQ++VhTEo22Iom9UGzpsRrcz90fbohkGI5byeGYbxmvyFlt9Y3WLL1B2b0=
X-Received: by 2002:a05:6512:6d3:b0:55b:8f02:c9e1 with SMTP id
 2adb3069b0e04-55ce50739efmr676632e87.27.1755163405566; Thu, 14 Aug 2025
 02:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250812085902.3309160-1-wenst@chromium.org> <CAC=S1nhG_ExACJRpJoqmO7nn+P24uiaha21SFEyR3aoKL-Pjgw@mail.gmail.com>
In-Reply-To: <CAC=S1nhG_ExACJRpJoqmO7nn+P24uiaha21SFEyR3aoKL-Pjgw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 14 Aug 2025 17:23:14 +0800
X-Gm-Features: Ac12FXxQGyeanDOqLQ_pP2in2SjWgkqtc8UcLGeK7yro90D1xizR-yjtyHCuvWc
Message-ID: <CAGXv+5FF5ZfOVP1qQh7s0sw9z4SXY6Rh8kS+8HcTxNY1gQ_kJg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Enable first SCP core
To: Fei Shao <fshao@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_022327_646465_EF90BE86 
X-CRM114-Status: GOOD (  18.39  )
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

On Wed, Aug 13, 2025 at 6:03=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> On Tue, Aug 12, 2025 at 8:39=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > The first SCP core is used to drive the video decoder and encoders.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm=
64/boot/dts/mediatek/mt8188-geralt.dtsi
> > index c5254ae0bb99..10764786bc21 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > @@ -164,6 +164,12 @@ reserved_memory: reserved-memory {
> >                 #size-cells =3D <2>;
> >                 ranges;
> >
> > +               scp_mem_reserved: memory@50000000 {
> > +                       compatible =3D "shared-dma-pool";
> > +                       reg =3D <0 0x50000000 0 0x800000>;
> > +                       no-map;
> > +               };
> > +
> >                 apu_mem: memory@55000000 {
> >                         compatible =3D "shared-dma-pool";
> >                         reg =3D <0 0x55000000 0 0x1400000>;
> > @@ -1146,6 +1152,16 @@ &postmask0_out {
> >         remote-endpoint =3D <&dither0_in>;
> >  };
> >
> > +&scp_cluster {
> > +       status =3D "okay";
> > +};
> > +
> > +&scp_c0 {
> > +       firmware-name =3D "mediatek/mt8188/scp.img";
> > +       memory-region =3D <&scp_mem_reserved>;
>
> It looks like a pinctrl for SCP_VREQ_VAO (GPIO 98) is missing?
> Datasheet says it's for "SCP to PMIC normal voltage request", and
> MT8195 and MT8192 also have that configured.

You are right. Will send v2.

> Regards,
> Fei
>
> > +       status =3D "okay";
> > +};
> > +
> >  &sound {
> >         pinctrl-names =3D "aud_etdm_hp_on", "aud_etdm_hp_off",
> >                         "aud_etdm_spk_on", "aud_etdm_spk_off",
> > --
> > 2.51.0.rc0.215.g125493bb4a-goog
> >
> >


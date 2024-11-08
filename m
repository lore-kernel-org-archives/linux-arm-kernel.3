Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830C6D5E12B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 04:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQMqtLphVcnPY0+PnZHagIpPa7d9fieRvTBwtPiHmJ8=; b=H8kVFudMG6qtZ+G/vyZvtpCpXb
	tGaAYA3D2EoEhjxBLqPo07t++DY7vH+VS06ZDQRvR8aGJ7eWhYX1owh1gsS7jwOyGFmRGzQmRteqC
	2q+/e03HdhVfx5EwHAuMGMhHtEPGozf035p7JjSMfgcgcI+5LOWbW8oaV4dLhYpf4tzCp2ohCQ0dR
	fEIOo8LZgqVzi5E2rLZbBqAHZicJfxX7MkLht6XEadRvMHJnhucCrahLzZzZxBBd2P8zemQKIAf5q
	LDGUY0+t7WMELonXSRM70UEBeWOcTnNaAkrQUMH1vZu8sig1ZKCTTNwu4jlVZbil+yiuTSi5PlggC
	4FKBzaIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Gor-00000009IUI-2riO;
	Fri, 08 Nov 2024 04:42:01 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9GMO-00000009EYW-3rkK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 04:12:39 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-50fc0345155so1308863e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 20:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731039155; x=1731643955; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQMqtLphVcnPY0+PnZHagIpPa7d9fieRvTBwtPiHmJ8=;
        b=VBs7Cr9hnlug2aW+Du0Xbzqp5K9En6d68xXJfX1GVEDzzCt/bpDSjDvV3nF+MeZSSQ
         Htn8/eP3h2O2UXLVbrJ974+EvackOI04v/i1cG4ejIaNxOQBhnBv+3hMT1CBuaz4e4Ri
         NARS45DUOlkhfrhllj5Y5KNiEDfmLpfSk7Fso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731039155; x=1731643955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQMqtLphVcnPY0+PnZHagIpPa7d9fieRvTBwtPiHmJ8=;
        b=AkNGPNexh0ZJqLImk7rvurzQtZoD5cu0lD3jwNc9wy9EgX+La3RF52b2IBdCGa5GAn
         bqJeosiKP7N0ZXGwtqwiGwpFTA6uMrdTP2NI0lJPtnZEUPyTJZgiq3snV4cG+h4xO1B3
         UdX+jmHndgohzVrmuV+LiktMYgAB5naiZWDU0abE/CepVo76dlzBM4EQgAhmM6FPaWRP
         fxU6mwOiCbdga9W1VRSXEyJTaqfFZEEjMsk9v/BBORNyB4R02itTEtVuf/8DgiduEjQs
         X1YbHlrOmnoyY0EmaYJJ6cHA0zDK3t0KSzhxd5SRRznTW+z6dpW11bx8+y/NO3k/5kNw
         5eLw==
X-Forwarded-Encrypted: i=1; AJvYcCX7PD38MmKyuuq5Zjv/qpbQoc2W5yYlFIUgATtZb09XvA3QoLqFLYs0u772I+igVi2RMauCPFe49tkuiFV3CpWu@lists.infradead.org
X-Gm-Message-State: AOJu0YztORRG//fNyEc+buDSjsBAr0ZuCiaooryhalxXpKquwq/t37Y4
	sCilTJOf6hSGrjgKTJDwIpHvD+IJAYYSad57NwDsGmDrcPUhFFbcD83k2MSq7AcQNkZgB9U6L1U
	=
X-Google-Smtp-Source: AGHT+IEmUsTFhoEUTDoCl6nUXXpqh/cLdk+MdSc3ak1a0oNVzRJ6U7njH1sc4QKV+ViV+bZiILp9Kw==
X-Received: by 2002:a05:6122:925:b0:50d:4f96:507 with SMTP id 71dfb90a1353d-513ffff7810mr3244319e0c.6.1731039155037;
        Thu, 07 Nov 2024 20:12:35 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-513f315fdd8sm578311e0c.1.2024.11.07.20.12.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 20:12:34 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-84fd764f6ddso1317074241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 20:12:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU5y28ns10pEVItNvz2gyjPH22WhDeKWfzECTHKjPv2eZL4fFrdan4Dk1bd0B85abJ2nafQRQr6Y0jJ6rOtVunZ@lists.infradead.org
X-Received: by 2002:a67:ad07:0:b0:4a5:b1f5:ba93 with SMTP id
 ada2fe7eead31-4aadfdcbb33mr2266607137.6.1731039153643; Thu, 07 Nov 2024
 20:12:33 -0800 (PST)
MIME-Version: 1.0
References: <20241105093222.4055774-1-fshao@chromium.org> <20241105093222.4055774-3-fshao@chromium.org>
 <b66dbf9e-b35b-482c-9eb7-112ef1f398d6@collabora.com> <CAC=S1ngozo11g1vF2jnHjTLcNmP8tOMsQhK+LR0QWqoeXwSJjg@mail.gmail.com>
 <59f4bcc1-c752-4f2f-8e55-349cc2432b8a@collabora.com>
In-Reply-To: <59f4bcc1-c752-4f2f-8e55-349cc2432b8a@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 8 Nov 2024 12:11:57 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhhfwHU5K5ZyUhZBhvz38LOZGLnGN-Rc1ZAup_VTfkpvA@mail.gmail.com>
Message-ID: <CAC=S1nhhfwHU5K5ZyUhZBhvz38LOZGLnGN-Rc1ZAup_VTfkpvA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: Introduce MT8188 Geralt
 platform based Ciri
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_201237_100800_30DFE6FB 
X-CRM114-Status: GOOD (  41.48  )
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

On Thu, Nov 7, 2024 at 6:37=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/11/24 07:58, Fei Shao ha scritto:
> > On Wed, Nov 6, 2024 at 9:19=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 05/11/24 10:30, Fei Shao ha scritto:
> >>> Introduce MT8188-based Chromebook Ciri, also known commercially as
> >>> Lenovo Chromebook Duet (11", 9).
> >>>
> >>> Ciri is a detachable device based on the Geralt design, where Geralt =
is
> >>> the codename for the MT8188 platform. Ciri offers 8 SKUs to accommoda=
te
> >>> different combinations of second-source components, including:
> >>> - audio codecs (RT5682S and ES8326)
> >>> - speaker amps (TAS2563 and MAX98390)
> >>> - MIPI-DSI panels (BOE nv110wum-l60 and IVO t109nw41)
> >>>
> >>> Signed-off-by: Fei Shao <fshao@chromium.org>
> >>> ---
> >>>
> >>> Changes in v2:
> >>> - remove invalid or undocumented properties
> >>>       e.g. mediatek,dai-link, maxim,dsm_param_name etc.
> >>> - remove touchscreen as the driver is not yet accepted in upstream
> >>> - update sound DAI link node name to match the binding
> >>> - add missing pinctrls in audio codec nodes
> >>>
> >>>    arch/arm64/boot/dts/mediatek/Makefile         |    8 +
> >>>    .../dts/mediatek/mt8188-geralt-ciri-sku0.dts  |   11 +
> >>>    .../dts/mediatek/mt8188-geralt-ciri-sku1.dts  |   60 +
> >>>    .../dts/mediatek/mt8188-geralt-ciri-sku2.dts  |   56 +
> >>>    .../dts/mediatek/mt8188-geralt-ciri-sku3.dts  |   15 +
> >>>    .../dts/mediatek/mt8188-geralt-ciri-sku4.dts  |   43 +
> >>>    .../dts/mediatek/mt8188-geralt-ciri-sku5.dts  |   73 +
> >>>    .../dts/mediatek/mt8188-geralt-ciri-sku6.dts  |   69 +
> >>>    .../dts/mediatek/mt8188-geralt-ciri-sku7.dts  |   47 +
> >>>    .../boot/dts/mediatek/mt8188-geralt-ciri.dtsi |  397 +++++
> >>>    .../boot/dts/mediatek/mt8188-geralt.dtsi      | 1492 +++++++++++++=
++++
> >>>    11 files changed, 2271 insertions(+)
> >>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri=
-sku0.dts
> >>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri=
-sku1.dts
> >>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri=
-sku2.dts
> >>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri=
-sku3.dts
> >>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri=
-sku4.dts
> >>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri=
-sku5.dts
> >>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri=
-sku6.dts
> >>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri=
-sku7.dts
> >>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri=
.dtsi
> >>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >>>
> > [...]
> >
>
> [...]
>
> >>> +&pmic {
> >>> +     interrupts-extended =3D <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
> >>> +};
> >>> +
> >>> +&scp {
> >>
> >> Is this SCP-dual or SCP?
> >> I see SCP, but I also see a SCP-Dual memory region... what's going on =
here?
> >>
> >> Of course, the SCP-Dual won't work if you don't override the compatibl=
e string...
> >
> > To clarify, the second SCP core is used for MIPI camera in downstream,
> > and I deliberately only describe the first SCP core here since the MTK
> > camera ISP driver isn't in upstream at the moment.
> > I had a fixup patch for removing the scp-dual reserved memory region,
> > but likely it was missing during the rebase... let me check again if
> > it can be removed, just in case there's firmware protecting the region
> > and the kernel shouldn't access it.
> >
>
> Hmm... but the second SCP core can still be brought up, even if the MIPI =
Camera
> driver is not upstreamed yet, right?

Well, that's true... and it should pave the way for validating the
driver with the upstreamed DT whenever that becomes available.

>
> That shouldn't cause lockups and/or other kinds of bad behavior, and shou=
ld
> bring up a core and just never use it, without any particular issues.
>
> If we can enable the secondary core, let's just go for it.. as that will =
help
> specifying the exact memory layout of this board (and failing to do that =
may
> create some other issues, that's why I'm proposing to enable that even if=
 it
> is not really used in this case).
>
> What do you think? :-)
>

Sure, that sounds good to me, too.
I started only with the essential DT bits to ensure the device can
boot, which it does, so I guess it's time to bring that back. I'll
incorporate that in v3.
I plan to fix up the single SCP core node to SCP-dual directly, so
please let me know if you prefer seeing that as an individual patch on
top (either option works for me).

Regards,
Fei


> >>
> >>> +     firmware-name =3D "mediatek/mt8188/scp.img";
> >>> +     memory-region =3D <&scp_mem>;
> >>> +     pinctrl-names =3D "default";
> >>> +     pinctrl-0 =3D <&scp_pins>;
> >>> +     status =3D "okay";
> >>> +
> >>> +     cros-ec-rpmsg {
> >>> +             compatible =3D "google,cros-ec-rpmsg";
> >>> +             mediatek,rpmsg-name =3D "cros-ec-rpmsg";
> >>> +     };
> >>> +};
> >>> +
> >>> +&sound {
> >>> +     compatible =3D "mediatek,mt8188-nau8825";
> >>> +     model =3D "mt8188_m98390_8825";
> >>> +     pinctrl-names =3D "aud_etdm_hp_on",
> >>> +                     "aud_etdm_hp_off",
> >>> +                     "aud_etdm_spk_on",
> >>> +                     "aud_etdm_spk_off",
> >>> +                     "aud_mtkaif_on",
> >>> +                     "aud_mtkaif_off";
> >>
> >>          pinctrl-names =3D "aud_etdm_hp_on", "aud_etdm_hp_off",
> >>                          "aud_etdm_spk_on", "aud_etdm_spk_off",
> >>                          "aud_mtkaif_on", "aud_mtkaif_off";
> >
> > Acked.
> >
> >>
> >>> +     pinctrl-0 =3D <&aud_etdm_hp_on>;
> >>> +     pinctrl-1 =3D <&aud_etdm_hp_off>;
> >>> +     pinctrl-2 =3D <&aud_etdm_spk_on>;
> >>> +     pinctrl-3 =3D <&aud_etdm_spk_off>;
> >>> +     pinctrl-4 =3D <&aud_mtkaif_on>;
> >>> +     pinctrl-5 =3D <&aud_mtkaif_off>;
> >>
> >> Add a comment:
> >>
> >>          /* The audio-routing is defined in each board dts */
> >>
> >>> +     audio-routing =3D "ETDM1_OUT", "ETDM_SPK_PIN",
> >>> +                     "ETDM2_OUT", "ETDM_HP_PIN",
> >>> +                     "ETDM1_IN", "ETDM_SPK_PIN",
> >>> +                     "ETDM2_IN", "ETDM_HP_PIN",
> >>> +                     "ADDA Capture", "MTKAIF_PIN",
> >>> +                     "Headphone Jack", "HPOL",
> >>> +                     "Headphone Jack", "HPOR",
> >>> +                     "MIC", "Headset Mic",
> >>> +                     "Left Spk", "Front Left BE_OUT",
> >>> +                     "Right Spk", "Front Right BE_OUT",
> >>> +                     "Rear Left Spk", "Rear Left BE_OUT",
> >>> +                     "Rear Right Spk", "Rear Right BE_OUT";
> >>> +
> >>
> >> ...and remove the audio-routing from this dtsi; it's anyway being
> >> overridden by the -ciri.dtsi devicetree...
> >
> > Acknowledged, and thanks for all the feedback here.
> >
>
> You're welcome :-)
>
> Cheers,
> Angelo
>


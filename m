Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F06C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 09:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvqFvLihDh/0pOLv9eRfMmIbmTTMjctegUodYgsIBs0=; b=nznvdIhbbaAtT0tr/o/H4gnn/C
	ZiTmv7KyEjkzMW0t51ZQDKRPUlabVrK2qoZV5mb43huNM7RLwotrVBzcoF5oVWMOIjf7Z0AlwQ3pl
	OUSxyO8iftB7VXj7cxp1fYBxPNWE2BpAYcsT+WpqsmgyMwzWTCLzMDzwzPc+B6pRmYniVcujgzOmw
	AXVtOm1jhyctsOc5MMUAWvVGMxhzu7pb8u3g/U+bP9p2xIl+eEk1xaCvxnH0fIUUu7CkbeaCI7qry
	fcqm2ikCjPn80xBYzON7jxC5Jnu/IyDkol+NiYRrUruikKLNDF4PhysJRQJIAXTtIdz09+FoeEwH6
	fRLDE/ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuYe-00000005i6C-2dEv;
	Wed, 02 Apr 2025 09:38:52 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuV5-00000005hby-2Tm9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 09:35:12 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5497590ffbbso7773222e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 02:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743586510; x=1744191310; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvqFvLihDh/0pOLv9eRfMmIbmTTMjctegUodYgsIBs0=;
        b=IUkm+yEQklMtfaHcqUf54644DcAgzHK++99ieqznBlMYMRn69PuirNnysyKV34VhHZ
         cayYCHWhu95f2FGDImWcMds7NE0boq+SbuDcTPy+amrMPyphL6jS+rOOl94oa6FbQRmJ
         9JKZFbaCLrw47/vLf8ArJFf8OYwqgL2RAeffQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743586510; x=1744191310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvqFvLihDh/0pOLv9eRfMmIbmTTMjctegUodYgsIBs0=;
        b=oFFs0uztV1w7Tdnc+aNaRM1VaAQ12wzWuZ1xsTapS07CnNYEyvGD/IX9srROc7GtCj
         shxWARmV3DAnsCLaBnIdVB4Mc2p0c4clSFx22dvOTyqETLZ2/npSyGGe44/tjuNZ1Jlw
         X+Q9nX8oDLEaf7Yqm4qCAnPcT+gblEHenQfN7sJzd7aQ9Q5vz8LVXUViDpmlztjLcJW6
         OIJCLS6h8g8oCV23IRQldIgsMw5uBwAqug2yXi0xNin9Ag2X2y6NTIj0wSGQV6zX0qRK
         ud8Tib2QOn8TogHp9tkTBbOnM8sEmlRvM0EhHvZ4EQY/qQfhQp2TxVC2WwwuABHl0xPa
         L+Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWvkvZPQ3MdRHCJwdHYdDuQ+yI9B2IOAwlaFmX74wrxZQSeTrJOndVoRkjnjwnCSwUe5V74Or9e54Qp4XvXx7Ju@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6kKufce/bG1gsjCrrCmN9InsCk7AXLXXtrTUXR9wTgRwiK4LB
	shjQ3DT0ACqMP05QNGtGnJQ4zh/0GedKkW944pfLmFCPmRAzdRhXzdSRVzqDoHjDqIdxSg1qLYi
	eU3doHPlgsDTEcboTDis4PlIn2Zu69bW4ZTPr
X-Gm-Gg: ASbGncscSL+I4vi32nBLH55hb3liQzNreyK6mQIadPyPGvtyenzauQX8tKxvr9+UTw/
	rzo0m53JcOJk4OdJ6fhlJxx0sHgPWynMBX9WhYe4mHGoHg95TADjRstyZ3G6spZDQgIskKAaUEI
	Fu65g/dgRnWHU6Up28DFdc5PePD0llR5uodrJu0N1Ms1au3O6IJ8GG
X-Google-Smtp-Source: AGHT+IHolYjToDJLO0MSTMBrUHXLrPk3zfgJ0HVwalaG7YqgYjm+NUtBLWq6MDeTZX2/PLh7y+9Yuwp9U64qQgsq58c=
X-Received: by 2002:a05:6512:3ca4:b0:54a:fa5a:e9b3 with SMTP id
 2adb3069b0e04-54b111401fdmr5382707e87.52.1743586509850; Wed, 02 Apr 2025
 02:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com> <20250402090615.25871-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402090615.25871-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 17:34:58 +0800
X-Gm-Features: AQ5f1JqvPNDibEnWSVdu_841YWdl7OuqFaP96Ge_W58uChccFThN9Of9ZLYLgag
Message-ID: <CAGXv+5GHf5D3JDh+OZ-Cxf91PTAGYk2+jvuwK1gymy=k1YOo_A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: mediatek: mt8195: Add subsys clks for
 PCIe power domains
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, weiyi.lu@mediatek.com, 
	tinghan.shen@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_023511_634322_2313143E 
X-CRM114-Status: GOOD (  18.04  )
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

On Wed, Apr 2, 2025 at 5:10=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The PCIe MAC needs the sram to be powered on for internal IP
> access and it has always worked before because the bootloader
> on Chromebooks was leaving the PCIe PERI_AO MEM clocks on
> before booting the kernel.
> Add the SRAM (mem) clock as a subsystem clock on the PCIe MAC
> P0 and P1 to correctly describe the hardware and to avoid any
> issue with bootloaders behaving differently.
>
> Fixes: 2b515194bf0c ("arm64: dts: mt8195: Add power domains controller")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8195.dtsi
> index b33726da900b..0cb96cba727a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -792,12 +792,16 @@ power-domain@MT8195_POWER_DOMAIN_CAM_MRAW {
>
>                                 power-domain@MT8195_POWER_DOMAIN_PCIE_MAC=
_P0 {
>                                         reg =3D <MT8195_POWER_DOMAIN_PCIE=
_MAC_P0>;
> +                                       clocks =3D <&pericfg_ao CLK_PERI_=
AO_PCIE_P0_MEM>;
> +                                       clock-names =3D "ss-pextp0-mem";

Doesn't the PCIe host controller already reference this clock?

>                                         mediatek,infracfg =3D <&infracfg_=
ao>;
>                                         #power-domain-cells =3D <0>;
>                                 };
>
>                                 power-domain@MT8195_POWER_DOMAIN_PCIE_MAC=
_P1 {
>                                         reg =3D <MT8195_POWER_DOMAIN_PCIE=
_MAC_P1>;
> +                                       clocks =3D <&pericfg_ao CLK_PERI_=
AO_PCIE_P1_MEM>;
> +                                       clock-names =3D "ss-pextp1-mem";

Not this one though, since:

         /* Designer has connect pcie1 with peri_mem_p0 clock */
         <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;


ChenYu

>                                         mediatek,infracfg =3D <&infracfg_=
ao>;
>                                         #power-domain-cells =3D <0>;
>                                 };
> --
> 2.48.1
>
>


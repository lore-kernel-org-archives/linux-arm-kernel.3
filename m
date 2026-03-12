Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BC4FED2D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 06:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wR3lTNQ8vtyMXtspr3IFVrmuZOG8EcAD0Ru8ues67mI=; b=t4ne7tq3xF+u1BvmimvytZPC/T
	wGLYu002IqRDgmne/o8Ze53VHiXWwTt8+zscxp1Od1gUSXzxcg1xi36QHm0gT+0gGootR9c9iSQ78
	5fVLUFZZovsDvl76b1NWOIDuvgDzXC7IHH0BlUlwOY1rdWrvFAgxaNo669hPXtFK7eyN717L0pJ/t
	Gs0NPXPzM5h1SnyrzNgOQpDqbSjY0hb6AQHST+CXsAsD5Wk3IDkx9nyznipaH20erP3DzKRBgMemX
	Y2rm1wfjjJw8yXL0f4oEzm56/yH+mFdsMpcOzo4jchovFVQPkvRW3omcuhEPa8hOmzrZc0IW1ObvD
	DwFRfwgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ZwT-0000000DUuX-33Fu;
	Thu, 12 Mar 2026 06:54:45 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ZwR-0000000DUtF-1LVa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 06:54:44 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ae505619baso4964335ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773298482; cv=none;
        d=google.com; s=arc-20240605;
        b=iVIv/hZfu6DdKnqbA9ZoazNTiqz0AxgFttLDm2Bt9h9mcVyGD7ksR6XAKuV6pjaOPJ
         INiaALP4NzlADv2yrTJfm6exOCS5zvI+W9tQZbePBfmXMq86AiAOT3VfAvFUNED4gDlW
         axb2cxpR/45yZWmUu7YEolmo00BOqcfKFwNXSBPejKChPSp/U5Bf5pZQQy4LODVzMsbJ
         uW4gHiwqgQ/kLOA5bred/2laK1Tl6lM8h8PXQgETa7Axk0f8SDH7qaj9RcKimy441Y/7
         R9Hkcg72qNDiVqg8HXItU4EmyfNOCb73lTJ5JBzvvtbFKHDwIqDqnmKC0SkgIIVW7alK
         YbOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wR3lTNQ8vtyMXtspr3IFVrmuZOG8EcAD0Ru8ues67mI=;
        fh=ETL2DhL/NDrHewWBnhp7UakMhluyAORU7Qqw3iey3mA=;
        b=fFZ+YrrAkmkUx2pcCCznDxY7b8zxtiy9kQw7GBJ7BY+P3nojQT8kV8my0tLXUYyx3j
         skRkwin8eFbqzNMESG0wjywj4otIeVSoGzMPcJtyW8lyw1Scb+D64+FEOJRYdb3VXXeY
         fs28Kqpy5KwLeUSxmm2iEdSilSCIyIGOEtXOBXj5nUqqZfDgHF3gc4xLx/N1k7xBG6qs
         HsY0IaYt4Ko/jsgCjfBWMCRzCoJZt6ofDtJvep4JPi4mEcB66rMqUe20QxtrDcyc7vE3
         6Unq1ZumGNsdb7DvaW2F7urqXBLTAL8xDAvlCRb+UPTcEZSbAS6xTmpTXrKFfQASGsHr
         TPUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773298482; x=1773903282; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wR3lTNQ8vtyMXtspr3IFVrmuZOG8EcAD0Ru8ues67mI=;
        b=GB7O2HpPU0M7orHABEAz/s0xx/aubnsC9w4BobVSWglgez+XOqcrPZXGHQX40LNENo
         K1CLO5YYpAPKc3uisjohvqyDsjyHoNN4/nQ5lGsxBYQd5Y1pm8g3ip5fwqiNfZ7z9Ngm
         Kz6DceRIA/ND6wumNiY5NEmdmO4Qm44KqKt5rI9ss+S0tTlZB7GRFcM87041hjCVRF6j
         wo6aMqFzuxlS9rPkIBQJusx/o1YjFcxKlrSWN8p4uImZ8EAd+1plsV5UROXR7u3CAmzw
         xJWOQaf8bTPXI4Ku/Q1bFtHGN+3OZrFpQ2ccwdnKgrzuKC9JNti9R3xaNxjAD0xTGGes
         3iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773298482; x=1773903282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wR3lTNQ8vtyMXtspr3IFVrmuZOG8EcAD0Ru8ues67mI=;
        b=e4RtR9MUP9SO2Ph3NpAoMz/cvoIFIFai+0MbQqJx5eBeI1mxNpewe0BuOd61fTbAAT
         LDllDerNS2hTb1RKxvxb7VhmWH5+EVMCe9GUI3JUSPLb6hRtAF9jPjNF7sdES+cRzTwK
         gxKpbpYGVf6SZ2vGDebwnlXntUNS9kV/ifGL7hb5VXQJ0vl95Auc50K3XoS2dmqdqqra
         JrsdZ8krxx7aWZTBx6EqJZcbmLHGx1WT29j9WuhALAOBsXu9Yz2ElrwjJppMoxxYSWq5
         k8hmMe2XPOreW/gCnTEBvWwBeI25/3Jn9Mi7E1NLXa+eMSzdgOY10IHUgSKwtTKJc+Jd
         9BOg==
X-Forwarded-Encrypted: i=1; AJvYcCV9CZBX/s1oVKYUqsmjgU75Lx4/wF/zv2H584GYjv/WaK1QAvHUQ8GSigYJPs9uHTXoA07rdZTVcUf8zctB3iNh@lists.infradead.org
X-Gm-Message-State: AOJu0YyK3M1gEyiwNvSwIrKWj2rnmPB8hBHNmntrzK7XXlN1471ALKws
	G1cM03XPUuMLDfLdCu7tcssQFakb0arNLuDwBa1wIt6am89hp+4GJ+p87vzeCeKU4w4g7VNCT8n
	XayPqF2t5/o3o+qHjdi2XEPxZX0z71o4=
X-Gm-Gg: ATEYQzy//oz1wJABhXl+MbGlAr0zlFhAwEjWD2UI6dEKuCDOaLOm6WyaSNRfpHofEeo
	XkzoZzwLTlbKjyCYA6/p4dKCp34TG9QejSFy0s4fp3oW3R4CiLRTGjII6WrQzx1fFW6cVA9x478
	N5mtepgzbxsHggvYB4/u2CPqUPDe8WHgcVSm4cFvxEeFcDlIJC5lpgzyNJiBMJzPUjg7tNt+uUQ
	/iwruWme3RxyNGyCwFklkRW8M4g3cBDyZZirViafnu7iZdnDGnHuR2Pc4K7d0QXN2FsixPACO0W
	MBGuXk4=
X-Received: by 2002:a17:902:d50a:b0:2ae:5426:da49 with SMTP id
 d9443c01a7336-2aeae88defcmr55291865ad.34.1773298481850; Wed, 11 Mar 2026
 23:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
 <20260312034912.4007057-2-shengjiu.wang@nxp.com> <af948fb4-4f63-4276-9368-9d41e80c3e7c@oss.nxp.com>
In-Reply-To: <af948fb4-4f63-4276-9368-9d41e80c3e7c@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 12 Mar 2026 14:54:24 +0800
X-Gm-Features: AaiRm51CB2PtkWtwvXXWHfX6nfM3hu2hh6z8jZbSHIx7_tLXIh1Snw9k9jw4XlQ
Message-ID: <CAA+D8AO2-C8kRiF3ymYd7fvAL_Op5ohwk=m8ZbfjHUWXCSn_3g@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: imx952: Add audio device nodes
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_235443_366094_98DFD9A4 
X-CRM114-Status: GOOD (  18.07  )
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

On Thu, Mar 12, 2026 at 2:40=E2=80=AFPM Daniel Baluta <daniel.baluta@oss.nx=
p.com> wrote:
>
> On 3/12/26 05:49, Shengjiu Wang wrote:
> > Add audio device nodes, include SAI, MICFIL, ASRC, Audio Mixer.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx952.dtsi | 199 ++++++++++++++++++++++
> >  1 file changed, 199 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boo=
t/dts/freescale/imx952.dtsi
> > index 0f86b5626cdd..5787c12e788f 100644
> > --- a/arch/arm64/boot/dts/freescale/imx952.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
> > @@ -823,6 +823,156 @@ usdhc3: mmc@42c40000 {
> >                       };
> >               };
> >
> > +             aips5: bus@43000000 {
> > +                     compatible =3D "fsl,aips-bus", "simple-bus";
> > +                     reg =3D <0 0x43000000 0 0x800000>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <1>;
> > +                     ranges =3D <0x43000000 0x0 0x43000000 0x800000>;
> > +
> > +                     asrc1: asrc@43000000 {
> > +                             compatible =3D "fsl,imx952-asrc";
> > +                             reg =3D <0x43000000 0x10000>;
> > +                             interrupts =3D <GIC_SPI 376 IRQ_TYPE_LEVE=
L_HIGH>;
> > +                             clocks =3D <&scmi_clk IMX952_CLK_BUSWAKEU=
P>,
> > +                                      <&scmi_clk IMX952_CLK_BUSWAKEUP>=
,
> > +                                      <&scmi_clk IMX952_CLK_ASRC1>,
> > +                                      <&scmi_clk IMX952_CLK_ASRC2>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>,
> > +                                      <&clk_dummy>;
> > +                             clock-names =3D "mem", "ipg",
> > +                                           "asrck_0", "asrck_1", "asrc=
k_2", "asrck_3",
> > +                                           "asrck_4", "asrck_5", "asrc=
k_6", "asrck_7",
> > +                                           "asrck_8", "asrck_9", "asrc=
k_a", "asrck_b",
> > +                                           "asrck_c", "asrck_d", "asrc=
k_e", "asrck_f",
> > +                                           "spba";
> > +                             dmas =3D <&edma2 97 0 0>, <&edma2 98 0 0>=
, <&edma2 99 0 0>,
> > +                                    <&edma2 100 0 1>, <&edma2 101 0 1>=
, <&edma2 102 0 1>;
>
> For consistency we should use symbolic macros for directions like you did=
 below.
> Use FSL_EDMA_RX for rx direction and also introduce FSL_EDMA_TX for tx di=
rection.

Yes, should use FSL_EDMA_RX.

But introduce FSL_EDMA_TX, it should be zero,  FSL_EDMA_TX =3D 0.
is it necessary to add it in include/dt-bindings/dma/fsl-edma.h?

Best regards
Shengjiu Wang

>
>
> > +                             dma-names =3D "rxa", "rxb", "rxc",
> > +                                         "txa", "txb", "txc";
> > +                             #sound-dai-cells =3D <0>;
> > +                             fsl,asrc-rate  =3D <8000>;
> > +                             fsl,asrc-width =3D <16>;
> > +                             status =3D "disabled";
> > +                     };
>
>
> [...]
>
> > +                     sai3: sai@433e0000 {
> > +                             compatible =3D "fsl,imx952-sai", "fsl,imx=
95-sai";
> > +                             reg =3D <0x433e0000 0x10000>;
> > +                             interrupts =3D <GIC_SPI 170 IRQ_TYPE_LEVE=
L_HIGH>;
> > +                             clocks =3D <&scmi_clk IMX952_CLK_BUSWAKEU=
P>, <&clk_dummy>,
> > +                                      <&scmi_clk IMX952_CLK_SAI3>, <&c=
lk_dummy>,
> > +                                      <&clk_dummy>;
> > +                             clock-names =3D "bus", "mclk0", "mclk1", =
"mclk2", "mclk3";
> > +                             dmas =3D <&edma2 61 0 FSL_EDMA_RX>, <&edm=
a2 60 0 0>;
> As I said we should introduce FSL_EDMA_TX and this will read as:
>
> dmas =3D <&edma2 61 0 FSL_EDMA_RX>, <&edma2 60 0 FSL_EDMA_TX>;
>
> Otherwise, looks good to me.
>
>
>
>


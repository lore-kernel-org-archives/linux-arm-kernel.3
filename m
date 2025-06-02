Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B47C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 08:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IX5KaHY06tu+FKC0bEyE1X52oSF5H+UGj7sz8V9wh8Q=; b=vehHK/reQPBJim/NedDTfgqF9n
	8lTto5d2wH5j9MwzcBnaK6KJzj+sFi0UYBrzpjPCircYAwWWIpbna/NmkehbONtBBbzQyjR9OTfpM
	lz/N4acZT+/SRgfn59MIR0UQvbWe3CQWKCfSLKJgyODjtYLulRMdg3foMhxs1wAx+7xv6Q0TxVixe
	3s36MwOGwB9zzPs4BSV11xmapYlefPv+OZzxxXQ5wExYIFXwoPMHeecg9yLo6uEI+Wi9pyngvTR8n
	zil//z3S0OjQwX1fpdcAar4tIkU/ef97iMlkowlyLUs9axLg4zbBXV2L7dY/xgPoggIO1ZAWPreLa
	bWUtdlmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM0MV-00000006yUR-3iPr;
	Mon, 02 Jun 2025 08:17:39 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM0KH-00000006yJr-3TXI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 08:15:23 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e7dc4e44b47so3647060276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 01:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1748852119; x=1749456919; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IX5KaHY06tu+FKC0bEyE1X52oSF5H+UGj7sz8V9wh8Q=;
        b=FBi4bn1fqsgI8uZb3dN+01/gNbPXGPOaMC2k19HIQ1H6OEKYYmzgPmBFx6b3YzXTKZ
         d19peQW9tqmHMbekYJoUNo9NQYTod73AoBU7xvronlphYajXHXPotQor4JmTZuzi9on4
         iwtHwLXkGOVRODONrhbH3x4184V61JM5OCtWKSlDoOinSyzKrT/87RBALB8/k0JKphxh
         BQqMysQR+t+tHSle01sIY2DNGLimRfPs+rpWaBWTEQSOqP+ef+Q6C0JTT8IeoVNDYdVw
         Y7HaZrF+RtEaIV11+Y9c1bGT0QrPLeawBBZuZUT+io4zMqPGZ/p8JasuUlmftXwn2b08
         u2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748852119; x=1749456919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IX5KaHY06tu+FKC0bEyE1X52oSF5H+UGj7sz8V9wh8Q=;
        b=h19UHx9qoyX27vLRy39qeJwuO5LrhpooQPsFPCC3zXLSeA/b6kX64D3jnokBnwFEb+
         vehPTacDV2oPXWsI4haaLP0kldjhuOTPJmIHKc864a3THPrBxFNIzN4vYoi5aoz0TjCt
         xLbHENy9+kc/4Tf+0iQccuNdxY8vwMKh0kxpZ0xgLdcPjTxUkR5fQpoRrryyndTPoODL
         kpZJvplCoeATJQLiSSVUOf0x/mgSlgZKmjF1tJz82dXkxIXyyg9yorQUYmKJr+bHCybx
         hd20wCs4SJWdtyJWICz6TtEq1MMcVG9E1WPsPyT5J9xMqlmJcut1D7OYGO75lRO4MGUc
         sB6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUma8xzK2pXnBV3mIAomYrMIJ4e5Oz9b1mv2senCRf+ci5Ri9gw5E4Hbvc9LtOEAPee1mhEBpXtWN8kG6P2AeaK@lists.infradead.org
X-Gm-Message-State: AOJu0YzN+Favy9+V5Mti5WLv4oGaw9ErQxApSPItz7pPyurs/NbWvqtN
	G5VAzq/1voYH5WqZfd5nfN61HQlhIpY0BDY9cb2FsBRjWHRNJhVUF8mYyUQH6L+TpsOFscmbZEP
	iY9PiVP4=
X-Gm-Gg: ASbGnctvK+YLwCWZ7PXMe84/+H3osSE/5O/vDEcxj9FdgFZXkpSKtfbVPC8gGv3FzI6
	QrfhB8h9BEmwE0h4m7OLu0+5UduIQaKgmXHCIeXfpUI05zntLxDkQapRP76DcgelYBv4zlIltnI
	KV+m7Ff4BsKu1mjFuOPtHT94oqvUWhvdluzrxZ/GDP09CtKxG0hNqIZeNIGaUtcpENWur41d9wa
	fVSP7NrGyXX81KKdCPJu3d3Jkf7lnc1V7rRbNlLeS+TWxNmgbMqPhObp3FpRdOC5saLTk1GB55v
	jQ12DyM7tW20EdO92G9/VpA4B2+n3V2IwsQBl/8/+231tZerUUGpTCm4xaurRNPvUXh1rspsv6C
	ojL9ZtGv0xLh2MYteuEQaNTrXIV6W1Q==
X-Google-Smtp-Source: AGHT+IEVoFPwGlpzmW72mTt3jvucmDVjzRo0NEMQel7zn2As3eZHTXxQaA/OWPvstjvj+YfAu6dqkA==
X-Received: by 2002:a05:6902:727:b0:e7d:cfd0:957f with SMTP id 3f1490d57ef6-e7f81dffd18mr16162789276.11.1748852119316;
        Mon, 02 Jun 2025 01:15:19 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7f733c9f9csm2127052276.17.2025.06.02.01.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 01:15:19 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e7dc4e44b47so3647045276.3;
        Mon, 02 Jun 2025 01:15:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWEsGBRe2Qsnnf4cKrz7IqGjeuliWUbzK0osoWCVwWbijkkgO+EOn2fvs4O8UVNOG2rjFTPlX1DW3E+uiz4Uof@lists.infradead.org, AJvYcCVvPDU5nO9KeUKJT4hCM1DKjkVA4L4Ty41TQVlSwisznlJAeCMaOmldffm2QbedrjjjznfEX0bsvHJ1bxCdI7w=@lists.infradead.org
X-Received: by 2002:a05:6902:723:b0:e7d:d830:41e0 with SMTP id
 3f1490d57ef6-e7f81e05026mr18622596276.12.1748852118798; Mon, 02 Jun 2025
 01:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net> <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 2 Jun 2025 10:15:07 +0200
X-Gmail-Original-Message-ID: <CAAObsKBPywWbe43AeY24P_13zH5m_BCb9arAhf+FVq+w=Z3j6A@mail.gmail.com>
X-Gm-Features: AX0GCFvNhfOr4abfwc18aAyYDuAfUB75c0n6dwgqbzT_BxLwdikrZIB5A8pfreA
Message-ID: <CAAObsKBPywWbe43AeY24P_13zH5m_BCb9arAhf+FVq+w=Z3j6A@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	Kever Yang <kever.yang@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_011522_112237_7CF4BB64 
X-CRM114-Status: GOOD (  35.58  )
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

Hi Rob,

[adding Kever to CC]

On Wed, May 28, 2025 at 3:41=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, May 20, 2025 at 5:27=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.n=
et> wrote:
> >
> > Add the bindings for the Neural Processing Unit IP from Rockchip.
> >
> > v2:
> > - Adapt to new node structure (one node per core, each with its own
> >   IOMMU)
> > - Several misc. fixes from Sebastian Reichel
> >
> > v3:
> > - Split register block in its constituent subblocks, and only require
> >   the ones that the kernel would ever use (Nicolas Frattaroli)
> > - Group supplies (Rob Herring)
> > - Explain the way in which the top core is special (Rob Herring)
> >
> > v4:
> > - Change required node name to npu@ (Rob Herring and Krzysztof Kozlowsk=
i)
> > - Remove unneeded items: (Krzysztof Kozlowski)
> > - Fix use of minItems/maxItems (Krzysztof Kozlowski)
> > - Add reg-names to list of required properties (Krzysztof Kozlowski)
> > - Fix example (Krzysztof Kozlowski)
> >
> > v5:
> > - Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
> > - Streamline compatible property (Krzysztof Kozlowski)
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
> >  .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 147 +++++++++++++=
++++++++
> >  1 file changed, 147 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn=
-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-cor=
e.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..9eb426367afcbc03c387d43=
c4b8250cdd1b9ee86
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.y=
aml
> > @@ -0,0 +1,147 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Neural Processing Unit IP from Rockchip
> > +
> > +maintainers:
> > +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > +
> > +description:
> > +  Rockchip IP for accelerating inference of neural networks, based on =
NVIDIA's
> > +  open source NVDLA IP.
> > +
> > +  There is to be a node per each core in the NPU. In Rockchip's design=
 there
> > +  will be one core that is special and needs to be powered on before a=
ny of the
> > +  other cores can be used. This special core is called the top core an=
d should
> > +  have the compatible string that corresponds to top cores.
>
> Is this really a distinction in the h/w? If you change which core is
> the top one in the DT, does it still work?
>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^npu@[a-f0-9]+$'
> > +
> > +  compatible:
> > +    enum:
> > +      - rockchip,rk3588-rknn-core-top
> > +      - rockchip,rk3588-rknn-core
> > +
> > +  reg:
> > +    maxItems: 3
> > +
> > +  reg-names:
> > +    items:
> > +      - const: pc
> > +      - const: cna
> > +      - const: core
> > +
> > +  clocks:
> > +    minItems: 2
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: hclk
> > +      - const: npu
> > +      - const: pclk
> > +    minItems: 2
>
> It is odd that the non-top cores only have bus clocks and no module
> clock.

I'm not sure I get what you mean by module clock, but the TRM says this:

"36.5.2 Clock and Reset
1.5.2.1 Clock Domains
RKNN has two clock domains, one is AHB clock, the other is AXI clock.
AHB clock, which is
the clock for AHB interface, while AXI clock, which is the clock for
AXI interface. AXI clock
also used for core clock for every Calculate Core and Control Core.
Clock frequency can be
controlled by CRU, please refer to the relevant sections. Automatic
localized clock gating is
employed throughout the design in order to minimize the dynamic power
consumption.
Almost all of the flip-flops are clock gated in the design. Block
level clock gating also
implemented in every separate block. If a block and the interface to
the block are both idle,
then the clock of that block will be gated automatically. This feature
can be disabled by
software."

So maybe the AXI (aclk?) clock is being used as what you called the
module clock?

> But based on the clock names, I'm guessing the aclk/hclk are
> not shared, but the npu and pclk are shared. Since you make the top
> core probe first, then it will enable the shared clocks and the
> non-top cores don't have to worry about them. If so, that is wrong as
> it is letting the software design define the bindings.

I don't really know what the pclk and npu clk are needed for, but in
the TRM I'm seeing references to the pclk being related to the core 0
(TOP):

pclk_nputop_root_sel
pclk_nputop_biu_en

Couldn't find similar references to the "npu" clock though.

Cheers,

Tomeu


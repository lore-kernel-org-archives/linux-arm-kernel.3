Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4349BC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 11:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPDFO6KuBc5ez4kafCcPtzLE3emZL3oCUAM81ZWzwGA=; b=Y6Fs62WucKAbuXcJomGDkmAuO1
	w1+Kl0E7+bBmkjx12oT0ycth8p//57bUyGytUFs8wLknhuJfYPchr2MFAfY7Shi9MY9nif3E1Tuck
	DGYJejvj3U1pRRA4SDKdtxm+0M+sSvmWEmPzrmsivX8FEgtXER6JsdjOEfszAkISjmg+qcFf9kDl0
	0OHH5nBYTId791HHoESYp0EL988VSkydwXkC+8XyuDyJt38pzAdfZ4DkyXAmEKQhl9qa3abpKhOQP
	nn8Y3I2vKjkWWw+jw5wCfyZCkSBWlsYqx501lzfmyABsJX1Ady/jD2qkgpTQE6Illq4d0+ZnqaNtl
	mxSLbWvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVm8-00000008gQJ-1tNO;
	Mon, 26 May 2025 11:13:48 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVfr-00000008fuC-3ZXT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 11:07:21 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-23461842024so7215475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 04:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748257639; x=1748862439; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPDFO6KuBc5ez4kafCcPtzLE3emZL3oCUAM81ZWzwGA=;
        b=H6RkfrWNpTYjSUxJeDa0vDEwqwvMSxpDZPZW7noNwTcPf+s/Ca4UjGuicFPY3Ob67M
         rmCY688FGHn5BN1b5Gu4LNXfowvXZrar/VwjV8Y1GSwu3yboPLfet7W1R2vV8knwo/8R
         rIjfGnVPXglKiwULoA+o6tUx8acmTBE8j/b1zV4JMdHIdSNsKychpHXNl4pg3xSBJvH6
         e0luriPPBuF9qSiYCn+yF5yN3pdObNeuqWAA8hBlmoQNkZ1Iw7ssHkLTQ2AjQV53ykBV
         pgusNhhSH7nytMoOYPrEc5ItoTdlq3SL87O/xRK0P7yA1M9Y+O1QqZ6qiG/EGEi//mwg
         692A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748257639; x=1748862439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPDFO6KuBc5ez4kafCcPtzLE3emZL3oCUAM81ZWzwGA=;
        b=GcvjGwn1FlZTJwMRyfcyMP1Lg+4bCDbpFQ+7RTWWC5Flk/1HQS4Ky3uWYNviXqt6h3
         Pyc1E+UFsjDZkKQ6yiSSLdzhyPcC6jOHUnkGRJCQgOnaRtHu+6a5eHuxuVVi7jih6rMw
         4P7P/9cqHgrlY7mqcbJS/d2TQDvGJTsXP4o1m0mFquS9MK0Rhuopbq3XesJs2NPCYkcA
         Cz2fueHs9mW/tFGg7uosv9xaPOLlpgr1owyVlIK2+w2MV6dEcc4h1tUIP0iULrv6qWsU
         n/8722Uvw+evdReTk4SnmoeiW04q0lRPZ0PoX8Eo3Ynwcd8Vtd7+APybdgsvrMyYvx6M
         XcBA==
X-Forwarded-Encrypted: i=1; AJvYcCUMzv6l+G+aB5fbiPCS+FfAFpaTMWls/VzmNuVCQeWiKDlwbtaBeINpPz03N9vSUYrEPq/NqwAr6ltbXL0cG8Jr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz64aLF+OjqFOIkB9OCiEVgDTOB7aPhfbG66DvnSTZrfP+QMFkU
	sty9+woH2WeS+uRWzTwlKkKOJOeAIf7EcEA56kduPorG3EJCouW7VP4/spbwoVBv3z1EnAVmHTf
	FCKMizcuwNAl7h97lXV7LWD5+NSLGLhI=
X-Gm-Gg: ASbGnct9cUbuELyJtqqXmqyl7EiJWy4IDZkljcrM2Waaqa44EkQtm5ROW3HUI7kP50g
	PBtf/23yDtlRNPzX75dA3Ecse57UGyaoAc0mSZ+vLdT5ufXavlUkKLFozran7ei/SD6trQkOQBK
	+lpW7rg1C8LamSTU3RAt4T21PaL/yh4g==
X-Google-Smtp-Source: AGHT+IFNUkARStkUU0yA3GEirT+p8/UabY84M61srXw809EWJlrTdy0hxaH1tDIgKxVdp+S1wPaDN/JBZ+LBbWYliac=
X-Received: by 2002:a17:902:cf03:b0:231:f5a8:174d with SMTP id
 d9443c01a7336-23414fc0745mr113084145ad.44.1748257638727; Mon, 26 May 2025
 04:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 26 May 2025 14:09:00 +0300
X-Gm-Features: AX0GCFvFAHKTv9eLfMcc2ymFlTkdSDqneLYcacXjWWR2TG_Yd0O5c-iBoyzpmKk
Message-ID: <CAEnQRZC27dgATvvALcEq+8t4PrqkHJSrnThT9P58idnn3bve0Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] imx8mp: add support for the IMX AIPSTZ bridge
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_040719_894629_B56D0272 
X-CRM114-Status: GOOD (  35.89  )
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

Hi Shawn,

Gentle ping.

On Tue, Apr 15, 2025 at 8:21=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The AIPSTZ bridge offers some security-related configurations which can
> be used to restrict master access to certain peripherals on the bridge.
>
> Normally, this could be done from a secure environment such as ATF before
> Linux boots but the configuration of AIPSTZ5 is lost each time the power
> domain is powered off and then powered on. Because of this, it has to be
> configured each time the power domain is turned on and before any master
> tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).
>
> The child-parent relationship between the bridge and its peripherals
> should guarantee that the bridge is configured before the AP attempts
> to access the IPs.
>
> Other masters should use the 'access-controllers' property to enforce
> a dependency between their device and the bridge device (see the DSP,
> for example).
>
> The initial version of the series can be found at [1]. The new version
> should provide better management of the device dependencies.
>
> [1]: https://lore.kernel.org/linux-arm-kernel/20241119130726.2761726-1-da=
niel.baluta@nxp.com/
>
> ---
> Changes in v6:
> * drop the 'IMX8MP_AIPSTZ_HIFI4_T_RW_PL' macro. Its whole point was to
> help with making the DTS more readable but if it makes it look worse
> then there's no point in keeping it.
> * use consumer ID as first AC cell and consumer type as the second cell.
> Better to go with a format that more people are used to as long as it
> still makes sense.
> * pick up Rob's R-b
> * link to v5: https://lore.kernel.org/lkml/20250408154236.49421-1-laurent=
iumihalcea111@gmail.com/
>
> Changes in v5:
> * merge imx-aipstz.h into imx8mp-aipstz.h. imx-aipstz.h is
> currently only used in the DTS so it can't be added as a binding.
> * place 'ranges' property just after 'reg' in the binding DT example
> as Frank suggested.
> * use the  (1 << x) notation for the configuration bits. Previously,
> hex values were used which didn't make it very clear that the
> configuration options are bits.
> * shorten the description of the bridge's AC cells.
> * shorten the message of the commit introducing the bridge's binding.
> * pick up some more R-b's on patches that remained untouched since V4.
> * link to v4: https://lore.kernel.org/lkml/20250401154404.45932-1-laurent=
iumihalcea111@gmail.com/
>
> Changes in v4:
> * AIPS5 node now only contains a single memory region: that of the AC
> (just like in V2). 'reg-names' property is dropped.
> * AIPS5 node now uses 'ranges' property to restrict the size of the bus
> (1:1 mapping)
> * change the number of AC cells from 0 to 3
> * add binding headers
> * link to v3: https://lore.kernel.org/lkml/20250324162556.30972-1-laurent=
iumihalcea111@gmail.com/
>
> Changes in v3:
> * make '#address-cells' and '#size-cells' constants and equal to 1 in the
> binding. The bus is 32-bit.
> * add child node in the example DT snippet.
> * the 'aips5' DT node now contains 2 memory regions: that of the
> peripherals accessible via this bridge and that of the access controller.
> * link to v2: https://lore.kernel.org/lkml/20250226165314.34205-1-laurent=
iumihalcea111@gmail.com/
>
> Changes in v2:
> * adress Frank Li's comments
> * pick up some A-b/R-b's
> * don't use "simple-bus" as the second compatible. As per Krzysztof's
> comment, AIPSTZ is not a "simple-bus".
> * link to v1: https://lore.kernel.org/lkml/20250221191909.31874-1-laurent=
iumihalcea111@gmail.com/
> ---
>
> Laurentiu Mihalcea (6):
>   dt-bindings: bus: document the IMX AIPSTZ bridge
>   dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
>   bus: add driver for IMX AIPSTZ bridge
>   arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
>   arm64: dts: imx8mp: add aipstz-related definitions
>   arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
>
>  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      |   3 +
>  arch/arm64/boot/dts/freescale/imx8mp-aipstz.h |  33 ++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  16 ++-
>  drivers/bus/Kconfig                           |   6 +
>  drivers/bus/Makefile                          |   1 +
>  drivers/bus/imx-aipstz.c                      |  92 ++++++++++++++++
>  7 files changed, 251 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aips=
tz.yaml
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
>  create mode 100644 drivers/bus/imx-aipstz.c
>
> --
> 2.34.1
>
>


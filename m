Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A43CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 23:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pelQApbcBsrUZTE2lQtmnFfkKMi2RYMScySj6MYqs/o=; b=Q79T8jg+rPK6k5PK3er+6ROe/g
	OzB1gIMUbLVRFcAdv9O4mxCcsxcqL00IVJGtpdZCHUq7Rg2k8OJ7TqWc1EsFn3wJDJ/ZBY9sVNhWH
	mPPffVEIKldxk7ZSKuCFS/l+CemY19u630gdoCrBs9H4+QiRa7saVn9z46XQM9ZxW40AOyF+gv8if
	9WMjZiCFvT85yXzyAB4BKbZbN/hc5zBETn1BbNN7kNBs0OD1oOuY0ldYXW7mq7BvkKL2QhhtoVA7o
	7SCPlrSPV7GuBq1WkpcmRyv1TpC+xBCWzPgyspgqoc2G3nIuR2esosWB/QcT1cX2+FCxWEeUMGIf0
	C7XixmtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL8M4-00000005Ab5-0XjG;
	Thu, 07 May 2026 23:42:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL8M1-00000005AaW-2j2U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 23:42:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E61FD4455A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 May 2026 23:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9C1C2BD00
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 May 2026 23:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778197324;
	bh=p7Rx6qNuAwgaIK8zmFad1PXiQo0SfDFYMCJz06kHD8g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XVSXDHrpJKD3xum7FnwZCCrA8iQEYbbX5GpPhqtER+Kb6ORUOY3o6PbYdaH27ErrQ
	 kOT8v1aEKkqxk3pXWvcFlkpl9WqFtXYrCXYyzwY9QlBKenIv8N4ArqaqEbDr34fGlc
	 v6s6uH/QYfdQQkmL6JKXVMxYqW1O2LOnJAsCod7JH6RB4mWoJSrBAIcwEzGXRaVPa6
	 9V2lo8OCSID8OvbS0r0xvh7WvOtEv0WIpowa09YfkGNLYVEfEfbosRNN2LybFa7EfU
	 UsV+GtnDWNlb2e/HbImt4blT9TVNkcaoufYLk3uCSmoQJLcp/3Fwxc2xjxD0jGNocb
	 Tq1eNGpBaQ4ZA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67e9e343b22so760279a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 16:42:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+RyCmgiAUgGZA2eEG/chWcLVpdJOnRWmlMFOVGQ1CaZPfl0lMAo+uHckgulm3XC0B/vghOXWHUyk/M1ISbXeLW@lists.infradead.org
X-Gm-Message-State: AOJu0YysLvYYDqpH+AZrMjKm+nijDqNYNa0a0FUeTpU4k8G9cxV7c0iC
	xzxIhl5ArYuK1Kkr0o0mxGVlssMqanLPxe2hMP75DiOuzAv4igKWERgyaTheTMEFPVsJ/M4xCuD
	XzA9sPuSjyckmeSku4syqfRFpYNex2A==
X-Received: by 2002:aa7:da02:0:b0:66e:e024:1a08 with SMTP id
 4fb4d7f45d1cf-67d646b082bmr4114635a12.24.1778197322778; Thu, 07 May 2026
 16:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260501155421.3329862-1-elder@riscstar.com> <20260501155421.3329862-9-elder@riscstar.com>
In-Reply-To: <20260501155421.3329862-9-elder@riscstar.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 7 May 2026 18:41:49 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+GY5O-ygTHDOA8pVBDi_aKcmcJ0yt-3Rv4a4=Ygk66uQ@mail.gmail.com>
X-Gm-Features: AVHnY4JOM9jN3mcHfPknCHd75ZrjDOMLe5cKzgxlMhp-0Ek9NIaM4mPgQRK3hWI
Message-ID: <CAL_Jsq+GY5O-ygTHDOA8pVBDi_aKcmcJ0yt-3Rv4a4=Ygk66uQ@mail.gmail.com>
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com, 
	rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, 
	arnd@arndb.de, gregkh@linuxfoundation.org, 
	Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com, 
	alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com, 
	chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net, 
	hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com, 
	john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com, 
	matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com, 
	rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn, 
	weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_164205_732884_60BF2CBC 
X-CRM114-Status: GOOD (  20.78  )
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

On Fri, May 1, 2026 at 10:55=E2=80=AFAM Alex Elder <elder@riscstar.com> wro=
te:
>
> From: Daniel Thompson <daniel@riscstar.com>
>
> Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
> bridges.
>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../bindings/net/toshiba,tc956x-dwmac.yaml    | 111 ++++++++++++++++++
>  1 file changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc956x-=
dwmac.yaml
>
> diff --git a/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.y=
aml b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> new file mode 100644
> index 0000000000000..d95d22a3761da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/toshiba,tc956x-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba TC956x Ethernet-AVB/TSN Controller
> +
> +maintainers:
> +  - Alex Elder <elder@riscstar.com>
> +  - Daniel Thompson <daniel@riscstar.com>
> +
> +description: |
> +  This node provides properties for configuring the Ethernet PCI functio=
ns
> +  that are attached to the internal downstream port of the TC956x's PCIe
> +  switch.
> +
> +  TC956x are a family of Ethernet-AVB/TSN bridge chips that combine a PC=
Ie
> +  switch together with a number of Ethernet controllers. These bindings
> +  cover only the Ethernet functions of these devices.
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-bus-common.yaml#
> +  - $ref: /schemas/pci/pci-device.yaml#
> +
> +unevaluatedProperties: false
> +
> +properties:
> +  compatible:
> +    enum:
> +      - pci1179,0220 # Toshiba TC9564 (a.k.a. Qualcomm QPS615)
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  # We can't allOf reference Ethernet-controller.yaml because we end up =
with
> +  # contradictory $nodename rules (`ethernet@` versus `pci@`). Happily o=
nly a
> +  # small number of the properties are useful on TC956x so we can just r=
eference
> +  # what we need.

That would be due to the error sashiko pointed out. 'pci' is for PCI
bridges (host or PCI-PCI).

Rob


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165BDC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 15:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBjTi1B9hV8EDP4qeKjKLlNHxO+R3STx7X3P7zX2p60=; b=yxznmirS2WuXqO63oobmduShz4
	aYImuMmtZhOgM0JvlQsKJ1jUdu1AZRaefi9u5eDTadhK7+mHToclyvIsT3IcmSNQmCoNHPZmfoYbK
	lvN989oA6NSrwzOyeAMZUIBl2awWnXHCPt/t4PQZEiCeVg2MjHzu7HF1A1EjGkPqysnEeHX0TXLoY
	AAYVpP02pVwff3A5b2S5WicsxrXOhJ6m5E5uNBz75IAohrMvmmMO7odq0tTzKAjaGSuvGxA38bYSi
	1ocbj7abnnQ4Tjcxii1bI6372+D2yqYe8EzNm+oVe+Wo7p4BGRlgfICFprswRPD9LWEO6hT0fCmHT
	O7yrSQZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVBj-00000009tDK-3dpi;
	Mon, 12 May 2025 15:35:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUeN-00000009pMR-2Ggy;
	Mon, 12 May 2025 15:01:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7D6365C6677;
	Mon, 12 May 2025 14:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCD5C4CEEE;
	Mon, 12 May 2025 15:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747062062;
	bh=5C7uw2IAzf+0ahfXX4uyiw4RInjyFvh4Zkir6Ku/wHo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gYvK4ft2GqhQv20+FT1wp5aUuEc6T1B9JqsClPd9XNOJneKgc1yFmDSf23LIZyAbw
	 2X4Bdb+dAvMrvelWtS4qmVUkXAHIqHrlMo/XelGJmbk/jHgiXfxgve41fE3vHkN3Ie
	 9PduUHH2Rv1ycZsMB7rLXT5O/SVYAk3ma1/ZqwKBJf8KNKAT1QC5dFEXtjVxRMthtc
	 U7LV5qSbK1I4eYHvdFqEmvM13kTSuC1xSeabn7mX/J3x7V8VNL6gB0hRRrFZ6HHsbv
	 8Pgw6s+yK8EOa8ZHIqjVJBMp1ugHny5zvwWfkdnZTpMZeZz83MMdSN6xD03y7iDNiC
	 bcGm0et8s6h7A==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so10753841a12.0;
        Mon, 12 May 2025 08:01:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUnwPxxXSbV5Nvj8+zAe2+0KVSA5bygdDyu09jvZeW0W9Sl3mV3tWnC4Wl/F/+VYW+/RuQvaGfZhZ28MO++jzgR@lists.infradead.org, AJvYcCWkOJNlhUdyfb1RT+ybP262EgwOdOtx2LQV725npEDlphRp/Km4LIbcng39Jdv6uPZKNnab1KXANYgAKpTOkzIvZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQw6TmkyRdOHbYlncJA9sHpX4UFE0y3TmscTR5SbMjjNGjK1lb
	YQv8jWn+WHz5wvEE86igcPZaHiKNx972vQCUfP9pZ4EVJbwr35zLDsEDL1tCbUyczAGQ9KtozMQ
	XPfbZWIs2+Vk+mNK6bkWx+xolkA==
X-Google-Smtp-Source: AGHT+IFZbfWKF0hU1sr3jQtNq4U5pRwRKJjmtoMDmn21t01KNRswIOplfLvn34abEZt/poBPFf25QG0+oFit4G41q2A=
X-Received: by 2002:a17:906:f142:b0:ad2:1255:d95a with SMTP id
 a640c23a62f3a-ad21255f466mr1132229266b.30.1747062061044; Mon, 12 May 2025
 08:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250509222815.7082-1-james.quinlan@broadcom.com> <20250509222815.7082-2-james.quinlan@broadcom.com>
In-Reply-To: <20250509222815.7082-2-james.quinlan@broadcom.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 12 May 2025 10:00:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKrbCtiMdxCusBwX8-xewQbi1_X6V8rTN+2vfxh4e=Hjw@mail.gmail.com>
X-Gm-Features: AX0GCFuumEiFtgCX1SqyapCoe6c8e5kN11_tTXkwoByqbbccTk1WS35qw-28a4Y
Message-ID: <CAL_JsqKrbCtiMdxCusBwX8-xewQbi1_X6V8rTN+2vfxh4e=Hjw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: PCI: brcm,stb-pcie: Add num-lanes property
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_080103_671241_3F1C0BD6 
X-CRM114-Status: GOOD (  11.93  )
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

On Fri, May 9, 2025 at 5:28=E2=80=AFPM Jim Quinlan <james.quinlan@broadcom.=
com> wrote:
>
> Add optional num-lanes property Broadcom STB PCIe host controllers.
>
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>  Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/D=
ocumentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> index 29f0e1eb5096..f31d654ac3a0 100644
> --- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> @@ -107,6 +107,8 @@ properties:
>        - const: bridge
>        - const: swinit
>
> +  num-lanes: true

Why do you need this? It is already allowed by the referenced schemas.
Though maybe you don't support 16 lanes and need to limit this to
something less? I would also set 'default' if you do that.

Rob


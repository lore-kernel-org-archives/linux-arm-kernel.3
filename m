Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A4ACA6011
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 17:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5i+jUBNJvJIFB5HiIYZuQDmQj7HbLmugYNNn4gZkj88=; b=UyT3baVuy5S8w0/mqIDURsLFcE
	lUKiTEEfemUIXiySl6R9vAs34LpZy2+JeOD/JHN5Y4kX4hSgxBm6S/JA3uAN6fbva10zgddbtunuk
	a28Cn3s0uLopZE/Cvn9t7sXESxBLxNLW1aURErA/rFrz7KmiFHAT+4DCw4VpDI2AtYpOOXfCO63MR
	mM49qD2SJ2rL8LI2EmntvDCzl7LSrN3mLae0nPp0q0syYRGCadTKwP7cKF73zzuf/x6K6ERmrSZFb
	xycQMD74unuVgEHGjsz3kVn1A3HvJroCjDAxs8VTeu2BboZ6tWZTQ6n9utb1jmaxc5Uth95Zovhl5
	72gevOYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEs7d-00000004nrN-47MA;
	Thu, 08 Oct 2026 17:41:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEs7b-00000004nr9-2g50
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 17:41:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9567C44779
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Oct 2026 17:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F681F0089E
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Oct 2026 17:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791481294;
	bh=5i+jUBNJvJIFB5HiIYZuQDmQj7HbLmugYNNn4gZkj88=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QfpLiDo+ScFtGJGP/5JODLI0pv8v5KZVTe3aJRCgmwNneXmkgfhJBnTBTYaSE+lTT
	 +nZwnnkZq3F682cP6EqkDvLOAmz6rEvskLWzPF+Qz6cUZHR0oqmArJVkOL8+ypYJBJ
	 tEksKTJ7nr5OGgwE6kEJKpEbyJsSfseOrtKGq+gqPa9EanBqd8g0deddbYDuBD2Vpw
	 2B2piO9VomrzAyAoubg5+a+CsmEO/iy++UgxqNVbbWCyoDlpbRyUxxgi0pepT48rF0
	 ve7ESnP+YoqLfYBd8ZdS7lxCAlp4v+SEG48ztNI+pTxA0/FHwnqlItwIJ3uXrn452X
	 pcIwYkuYyQ83w==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2e5e090746so324942466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 10:41:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwZbm3drFyHXEin5JHHnQuyC5e90uc1NN4zeWWf5ULCgLRbPJP9gDQ7kmipIpUw7bNhgNNKoYg6LCOATOnRkhJ1@lists.infradead.org
X-Gm-Message-State: AFuF++l7IXDPCw1s7iZOEhjYS9w+6zjn8g3bKm7I3gRrSzxD1k32hQdF
	MSNKJiqbpzuxTn0p3VQdchNewgHoSmOY8Fi+aXb36Vqeonljb2rCtvUTqFcAoFffMHSoIjs82FM
	us4f5vhLWpWOWObpz5xtMZr0btkcN6A==
X-Received: by 2002:a17:907:961e:b0:c2a:34fe:ea4d with SMTP id
 a640c23a62f3a-c317c0b85e3mr582174866b.25.1791481292967; Thu, 08 Oct 2026
 10:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org> <20260921-ux500-power-domains-v7-1-v3-5-9352be6b86b1@kernel.org>
In-Reply-To: <20260921-ux500-power-domains-v7-1-v3-5-9352be6b86b1@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 8 Oct 2026 12:41:21 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+1O+os8=YGUoKg6zCm-r0gQ35baKX=z65uTQNB0i=RVQ@mail.gmail.com>
X-Gm-Features: AclHuK9f1ZliBZPCj2LPLQU47t9EaM2IftpsDD1GQ_Z1aWMRTo5dRurMLb5PWy0
Message-ID: <CAL_Jsq+1O+os8=YGUoKg6zCm-r0gQ35baKX=z65uTQNB0i=RVQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/18] dt-bindings: display: ste,mcde: Allow power domains
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Lee Jones <lee@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dmaengine@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Sep 20, 2026 at 5:48=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Document the MCDE power domain.
>
> Keep the legacy EPOD regulator binding unchanged for now.
>
> Assisted-by: LLM
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/ste,mcde.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/ste,mcde.yaml b/Do=
cumentation/devicetree/bindings/display/ste,mcde.yaml
> index 7a12d0b817e6..05e7e4ebc882 100644
> --- a/Documentation/devicetree/bindings/display/ste,mcde.yaml
> +++ b/Documentation/devicetree/bindings/display/ste,mcde.yaml
> @@ -35,6 +35,9 @@ properties:
>    resets:
>      maxItems: 1
>
> +  power-domains:
> +    maxItems: 1
> +
>    epod-supply:
>      description: a phandle to the EPOD regulator
>
> @@ -109,6 +112,7 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/arm/ux500_pm_domains.h>
>      #include <dt-bindings/mfd/dbx500-prcmu.h>
>      #include <dt-bindings/gpio/gpio.h>
>
> @@ -116,6 +120,7 @@ examples:
>        compatible =3D "ste,mcde";
>        reg =3D <0xa0350000 0x1000>;
>        interrupts =3D <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +      power-domains =3D <&pm_domains DOMAIN_B2R2_MCDE>;

This patch is in next, but the define is not breaking dt_binding_check.

Rob


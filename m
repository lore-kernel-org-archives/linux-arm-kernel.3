Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B4210AB807
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 19:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2L+Vs7mVYCzhrXUxw8GaDgMJ/2hVygwUL053NmwNEc=; b=c9iIY2/O7P1nJu6UmOZQWChiDj
	aDK8sGb5Wu4Z9ZuBPvGaYbGw/vghITJfw0YVo2aA+oJaOZwBifAEOsD5JL0xIL84JxKxOllLdfQXn
	ZKbW4vEHxPpYvoqdQrRu3FXu4kPjR8Uh4n+R33GHKG1kVjU4iij4hzINBo52WbyiN/MAht1VndC7g
	hQfk+STHIZkqgDREu1eipAkoJq5dYRy3Mgv5nRvJcXyjLhN93hbxawegaW4iTWEVMvgGc2gEI8qST
	HL3VqxP1aKIQTfXdKVp7oKXTTErOluMBx4/iCh60vvq1zeTmWfmxkXVcyEn5hohyOBZxb/M6QfJ4L
	x+AMSu0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qbK-000000068L9-2aXs;
	Thu, 26 Mar 2026 19:42:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qbH-000000068KL-3rlZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 19:42:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 59D51443FA
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 19:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369FEC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 19:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774554159;
	bh=Y2ZHozORnLfqvKi2dwhQTPb5sPuBtjKNxVIRQIiOzsg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZLbLVLgvUsqHZKVA1+e3imKCmqIoVEkun5ZRNqM7lbL1EeK45BJ63eP/YP64X0gBA
	 0fbGQKnS/h8sMuT0HSsszhRY3fO/xwDo3yGNxd9wqqBupGAqjPDOYWM4JO+5VkKrY2
	 rbk7a+2hjn6RrquDffH43lFRwFN+wS56GYGSqgLM9PzRj1BvplJw5gUEj2llY8NyrT
	 QhIOGjjRGTOB1FcuuZRqvmv0/4SOEbv+7hi834VtTaKeQx1nkElKWQE37ZwApuN/IR
	 t3ah8M72NV4upm4AJ95KO7OtNI8Myy1O1sklmXIbTZ3v81aHnBEFNjZpS+RaV2DStW
	 3g8GOFo1OspQw==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9358bc9c50so197745866b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 12:42:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWzYw2CJNYnO2J8sJOyczLCBwguWsRkfRsm0qMmmnZpdIq89RVL39ejmuDCKZQc602e1R/Bdj4Yv15+WxHafK++@lists.infradead.org
X-Gm-Message-State: AOJu0YwI/mgX26K4RuRhKmVAXpAPzbpuR6uCW4hK4KFZKDx3DUDinWjC
	Q0ys84AY9cF+R5KpBuuQK2FZAL5iIaJSjE/pZPmQfCdNyrC8mM7fk3sYFO61HZuXRbJ7mUohrz7
	jDIid7I9SyGMRcREe0cT4L/RvvHxI7A==
X-Received: by 2002:a17:907:3c96:b0:b98:49d:7e37 with SMTP id
 a640c23a62f3a-b9a5427e5a8mr665511866b.44.1774554157684; Thu, 26 Mar 2026
 12:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260305-rk3588-csi2rx-v3-0-754473981f39@collabora.com>
 <20260305-rk3588-csi2rx-v3-1-754473981f39@collabora.com> <20260325210634.GA3963190-robh@kernel.org>
 <703bcf13-ab45-4e9a-b80c-80911d85d819@collabora.com>
In-Reply-To: <703bcf13-ab45-4e9a-b80c-80911d85d819@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 26 Mar 2026 14:42:26 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLy4=z24-RrJWLp3hPpTwYLJ8=ehRw8cRdhZiW-eAsYCA@mail.gmail.com>
X-Gm-Features: AQROBzAHITEw9UIh2Vq6i4lzrBpyx12hq94f54-wyHg8H8rls8eAXLegvhqv8Gk
Message-ID: <CAL_JsqLy4=z24-RrJWLp3hPpTwYLJ8=ehRw8cRdhZiW-eAsYCA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3588 compatible
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Frank Li <Frank.li@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Collabora Kernel Team <kernel@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_124239_995995_D6BB55B8 
X-CRM114-Status: GOOD (  23.36  )
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

On Wed, Mar 25, 2026 at 4:34=E2=80=AFPM Michael Riesch
<michael.riesch@collabora.com> wrote:
>
> Hi Rob,
>
> On 3/25/26 22:06, Rob Herring wrote:
> > On Wed, Mar 25, 2026 at 11:25:34AM +0100, Michael Riesch wrote:
> >> The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
> >> the RK3568.
> >> Introduce a list of compatible variants and add the RK3588 variant to
> >> it.
> >>
> >> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>
> First of all, apologies for applying your Acked-by tag. I figured
> resolving the merged conflict was trivial and impossible to screw up, but=
...

No worries. I would have kept it too.

> >> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> >> ---
> >>  .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml   | 10 +=
++++++---
> >>  1 file changed, 7 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-m=
ipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mip=
i-csi2.yaml
> >> index 4ac4a3b6f406..3d3b3cd78884 100644
> >> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi=
2.yaml
> >> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi=
2.yaml
> >> @@ -16,9 +16,13 @@ description:
> >>
> >>  properties:
> >>    compatible:
> >> -    enum:
> >> -      - fsl,imx93-mipi-csi2
> >> -      - rockchip,rk3568-mipi-csi2
> >> +    oneOf:
> >> +      - const: fsl,imx93-mipi-csi2
> >> +      - const: rockchip,rk3568-mipi-csi2
> >
> > These 2 should be a single enum as they were before.
>
> ... hm. Well.
>
> First, do you mean
>
> properties:
>   compatible:
>     oneOf:
>       - enum:
>          - fsl,imx93-mipi-csi2
>          - rockchip,rk3568-mipi-csi2
>       - items:
>          - enum:
>             - rockchip,rk3588-mipi-csi2
>          - const: rockchip,rk3568-mipi-csi2
> ?

Yes.

> If so, what is the practical difference?

First, then you aren't changing what's already there. For validation,
there is no difference other than failures with 'oneOf' give poor
error messages. It wouldn't be much better, just one less oneOf entry.

Rob


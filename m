Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C68CC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 07:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+nHXGLB1NoYThzl7RUIYtz2LHj026ykSFmZ3xBykhI=; b=ikTgSWh3HqPlkUpiX0DzLBGBa6
	PAOmYqlQz+mZNBKJpkj81Kd1o4JrVFJihxwsbULCajWYPE1fNHYERgC200lO2JIM2voJtXwYA8bAp
	wpQny1INgQlsLuHA0SRi1iwfenMLoU/vMJCoh0fW1JatKTfa6EWdoZACcWueAgmGQDETv+A9+1gFe
	zECUHyWh1RQCLHEboEs/LsDkuqPVV+cqizLJliGCW4CD7GfqISUbgMs7ipWFdcczyAoNz/A6aB291
	76mJrJ2GNMzkBjIhnGUxAJobGXIkkwKyVg6AJAy0tkF/DIvYxvN8zLtHVhVeEvocP0COMwVf5eQ1+
	YSk9q8Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMiJr-0000000CkBA-48Bs;
	Wed, 04 Jun 2025 07:13:51 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMiHj-0000000Ck06-0eMP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 07:11:41 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-70e1d8c2dc2so57522427b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 00:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1749021097; x=1749625897; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+nHXGLB1NoYThzl7RUIYtz2LHj026ykSFmZ3xBykhI=;
        b=H50u3hqrUjGEtcC4UR27YfCgGel9fQDm7zl5DU4Q7BeeqnIY3clnXDoBA79XIT7ejg
         IgxFNdCM7omcY2Zc9PJJwdsHj1JZgbi8VJMJyJNcgatAZOgMCHfQPQbZF0Te/Zjr6Y3F
         cvfjFpyjYYE+9n5U0sG218aWy8KNNJfhnBbourUPAyUrLNaBUMxeGJDAIqVoHQbP4UZQ
         k7TKoNRqaGJj9Y/QbAgX3FIr/ulU/5HbDAJjBNAICXr9Da62Vgv9k9yuvm8xbUf7uV7b
         iCnayFMyfv8VGQd6fJfW7fLohB0J3Iz2mTJbiMPdfS85KZxuHN7VJUKHF27BaVxXIArp
         1HFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749021097; x=1749625897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+nHXGLB1NoYThzl7RUIYtz2LHj026ykSFmZ3xBykhI=;
        b=tdMqI2/DRjGFRoVgBbBnTQBuZ1RRzDxMzS1Ca1X+yeN9mehRq7hpSAG1jmpOUdtCPS
         4hhWzVpZaAluebuDVc+Fu0DicjCApsozVkSg45vC7iGdtUeDLDgEvCZRgudoqMl0Blrw
         aiYPqf4SMhbP6xpM1nOUm9dENUxryeq3m/AxhdnPMpnj4UuL/P05JhPwyJAt4q7DSBr/
         Za7PFIqPfQxPMAX54XvrzRYEe6xMEAkFEKsXRvYTAnpJVPV5brobF5ETsA+qZGUV2Ctt
         P6HThT3qmSpzyN93I4nFHO6wBHCwIXfB9qrpjT0yPs+MaH+1FDLc1eei3RKP2jea/5sJ
         ivQw==
X-Forwarded-Encrypted: i=1; AJvYcCWFg9FZg1VLXqH7Im2Q3gzOX8m1as4GhSji+betiOuhADJ8KQtkQXLniIA9oBPuUjp8jxjKfo2GE0vxHU6HgmKa@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9IUxj4TXkgmwZ6fmW5sBHM3XUyYsX2BLtxfMCZvvgpRNJfcsr
	PVEiD0byiNTtqEaScjD8ul0fbBr3aljggZFX6qVlIIgccDzqKXiWDwHTCgMRtQV6AsL8yDdi+Yj
	2OiEhdgBf9w==
X-Gm-Gg: ASbGncukZdH86I6sGtGvrNkOxl7IBKE8Of8HYtbmfLm3fOKLNwDqHMBH24usW+Zy8gl
	0knJCX2JZqZtihEIIa2KpwPdcEckrkBIzuuG6x5G3/MfsCa3kokWTZvnp9x9bU55ntMk4NlKSzq
	WJsJ2D8VwOQXGHq3/9vvflBgP9wGysZfsMC8anJAmtoKc1Ol765MCVgZ1ZAsvPAaqUiV7taD9x3
	FhlyvVojUMdJdM9J70leBMpWxZ/zsLdiFr+heQ9c5+HF85qwqEreIvrwBvtctuEgk2bm+6HRziO
	mm15B4ojl8XjcL9ofAdGGNoailZWDyHAFtxRAgnw5OVNrVgRsbRtTf+48wa1Y7uE8Fo+9Mpab8v
	nqfm8HEvtcRBrhRJB7jg=
X-Google-Smtp-Source: AGHT+IFYAW1fOW49LTI/rUHj+zaq0Fj8rjNOgqTK+AthSVX8L+DR65dMj4itF7WVA0wwXhNYvrb1xw==
X-Received: by 2002:a05:690c:62c5:b0:709:6f9d:b566 with SMTP id 00721157ae682-710d9ea2342mr21210717b3.36.1749021097506;
        Wed, 04 Jun 2025 00:11:37 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8abce561sm28873067b3.17.2025.06.04.00.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 00:11:36 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e812c817de0so3663600276.0;
        Wed, 04 Jun 2025 00:11:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSlZ2CiSNoye++xW1o5CgzprH9hv2Rm7Q8AjtXZu3mkwge/4rcdtk7ccVmTnbw+MEXrkr5iIEqO+KG1ppl8UIa@lists.infradead.org, AJvYcCUV5rEsExz1Irvl09/ihQYq7DQO2cAshR3LzZShwNp/9fqHBwOaefBpOAOeCs6paHKnHM9bh9FdEjdn3FJdUSQ=@lists.infradead.org
X-Received: by 2002:a05:6902:6c12:b0:e81:4200:e227 with SMTP id
 3f1490d57ef6-e8179ef4b9amr1895455276.40.1749021096375; Wed, 04 Jun 2025
 00:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net> <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
 <CAAObsKDE33kZ27XbgeWBqQzrZXDHwHzp2Q6A7y_osC50UG-n7g@mail.gmail.com>
In-Reply-To: <CAAObsKDE33kZ27XbgeWBqQzrZXDHwHzp2Q6A7y_osC50UG-n7g@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 4 Jun 2025 09:11:25 +0200
X-Gmail-Original-Message-ID: <CAAObsKCZiBmy2kBm76V0cWfsLBbHnKzG4CS-bRUBc25k22K20A@mail.gmail.com>
X-Gm-Features: AX0GCFuzVw9QOJbPU8rAaiE__0pakSdSWD2x8uriT207nU1DMDYnxHzJRzNlcz4
Message-ID: <CAAObsKCZiBmy2kBm76V0cWfsLBbHnKzG4CS-bRUBc25k22K20A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250604_001139_437542_6086A643 
X-CRM114-Status: GOOD (  36.44  )
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

On Wed, May 28, 2025 at 5:34=E2=80=AFPM Tomeu Vizoso <tomeu@tomeuvizoso.net=
> wrote:
>
> On Wed, May 28, 2025 at 3:41=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Tue, May 20, 2025 at 5:27=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso=
.net> wrote:
> > >
> > > Add the bindings for the Neural Processing Unit IP from Rockchip.
> > >
> > > v2:
> > > - Adapt to new node structure (one node per core, each with its own
> > >   IOMMU)
> > > - Several misc. fixes from Sebastian Reichel
> > >
> > > v3:
> > > - Split register block in its constituent subblocks, and only require
> > >   the ones that the kernel would ever use (Nicolas Frattaroli)
> > > - Group supplies (Rob Herring)
> > > - Explain the way in which the top core is special (Rob Herring)
> > >
> > > v4:
> > > - Change required node name to npu@ (Rob Herring and Krzysztof Kozlow=
ski)
> > > - Remove unneeded items: (Krzysztof Kozlowski)
> > > - Fix use of minItems/maxItems (Krzysztof Kozlowski)
> > > - Add reg-names to list of required properties (Krzysztof Kozlowski)
> > > - Fix example (Krzysztof Kozlowski)
> > >
> > > v5:
> > > - Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
> > > - Streamline compatible property (Krzysztof Kozlowski)
> > >
> > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > ---
> > >  .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 147 +++++++++++=
++++++++++
> > >  1 file changed, 147 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rk=
nn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-c=
ore.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..9eb426367afcbc03c387d=
43c4b8250cdd1b9ee86
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core=
.yaml
> > > @@ -0,0 +1,147 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yam=
l#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Neural Processing Unit IP from Rockchip
> > > +
> > > +maintainers:
> > > +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > +
> > > +description:
> > > +  Rockchip IP for accelerating inference of neural networks, based o=
n NVIDIA's
> > > +  open source NVDLA IP.
> > > +
> > > +  There is to be a node per each core in the NPU. In Rockchip's desi=
gn there
> > > +  will be one core that is special and needs to be powered on before=
 any of the
> > > +  other cores can be used. This special core is called the top core =
and should
> > > +  have the compatible string that corresponds to top cores.
> >
> > Is this really a distinction in the h/w? If you change which core is
> > the top one in the DT, does it still work?
>
> No, I really need to power on that one before the others can work (the
> first core is also marked as special in a diagram in the TRM).
>
> > > +
> > > +properties:
> > > +  $nodename:
> > > +    pattern: '^npu@[a-f0-9]+$'
> > > +
> > > +  compatible:
> > > +    enum:
> > > +      - rockchip,rk3588-rknn-core-top
> > > +      - rockchip,rk3588-rknn-core
> > > +
> > > +  reg:
> > > +    maxItems: 3
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: pc
> > > +      - const: cna
> > > +      - const: core
> > > +
> > > +  clocks:
> > > +    minItems: 2
> > > +    maxItems: 4
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: aclk
> > > +      - const: hclk
> > > +      - const: npu
> > > +      - const: pclk
> > > +    minItems: 2
> >
> > It is odd that the non-top cores only have bus clocks and no module
> > clock. But based on the clock names, I'm guessing the aclk/hclk are
> > not shared, but the npu and pclk are shared. Since you make the top
> > core probe first, then it will enable the shared clocks and the
> > non-top cores don't have to worry about them. If so, that is wrong as
> > it is letting the software design define the bindings.
>
> Yes, I think it's probably as you say, but I don't know how I could
> check. Maybe Kever, Heiko or Sebastian would have any ideas?

So I talked with Kever and Heiko about this, and the npu and pclk
clocks are indeed shared among cores.

Regards,

Tomeu


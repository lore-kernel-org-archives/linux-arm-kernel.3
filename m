Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C11C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48XNN4g07zjeNMh2MkAdOMxyZFFb3QLQsG3AajgwEVQ=; b=wfH9zFfqobCqx+uOQNBaevDur9
	n4A6CQ0mLA2sWj244mVpreXw0GtNjgr0BO/EL8fCkGDn9OkkkOE3dtS2QQFSnjajHx0TY1vS8+XIG
	s4n6vAk9GpNYZ0vmk6Lv2SsNQzl47KmPxJdgwOR5IKR1go4BNW71JUfjTA7NormuQ+kFHEVNfvHLo
	xGB71OOHOpmgY5dcRwPhoGzXW0vKg40qmxkqmyqyaJ5NF9aiuZkylK2j2/OVLa36rV+teaqqMK124
	TosLNodIyjhIkyO86eAibr/M1qIS/7m0VoK/jfLHf9PAG2UF4x/3iZMrJP0XgFB4L7crS4eMoKQVB
	OhJXhN4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4AW-000000083vU-3L5W;
	Wed, 29 Jul 2026 13:17:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4AV-000000083vF-1bKd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:17:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B58E2600AE
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 13:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0191F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 13:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785331074;
	bh=48XNN4g07zjeNMh2MkAdOMxyZFFb3QLQsG3AajgwEVQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XiIVs3ljKBeYOc0ZMoiSxhQkAZjjVAcV9Fv/7jfb2vSpD9P7AFExLWU25uFfal5Ai
	 hWwwIsIJeqJMO/bL/d3R7N/0jWLawV9O7UXaUp2/viGl4zbtQ2m0DAAiw5gHdQU7Fh
	 dgj6ynWZiBMzmZC7+YM7lYWkzh6b0lXOTT/Vo3vwy2Gj48YRITx5j9uW73jVDGApyd
	 I/wgfB2txyke83hX9zr8+WpXTHSQ3cQhMrnyMd4YCxEYjQptp68aL4/+ucQF81kfnH
	 5TH/ndZqA6tzSH7d2pWfgiKw/ltI/NmzTPduDLhShnVHoJ3TEzVRXcONPDwYzD5UXN
	 zlzuv26VnHYSA==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1c4c7ddaf6so141854566b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 06:17:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp86c0gSYKcrY86lUsQML2cUlona4Y87gw4kQyWt8Fmen7vD2o1xIf/Csw/DN5vTj30NvhcA/rqD2oi7dHzr27R@lists.infradead.org
X-Gm-Message-State: AOJu0YwuEj+AGYhSH33x0wNylXXwHdXWNDtc7TeI65z2mXGytXiI7kES
	e4GjynvPJYGKG1zGXORmUAiHIxWDTNRdUSvxzaYp1l9/8tz2BcGT6p0NwiKiyRwWPqKV2QpuEZT
	4ppWyBMSqNesoo5S6a+7JvfpnaRF0GA==
X-Received: by 2002:a17:907:3f83:b0:c15:f65a:43a8 with SMTP id
 a640c23a62f3a-c1f71e917aemr350404966b.12.1785331073073; Wed, 29 Jul 2026
 06:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260728085640.1001890-1-jackyhuang@nvidia.com>
 <20260728085640.1001890-3-jackyhuang@nvidia.com> <20260728143952.GA2121505-robh@kernel.org>
 <20260729060612.1085870-1-jackyhuang@nvidia.com>
In-Reply-To: <20260729060612.1085870-1-jackyhuang@nvidia.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Jul 2026 08:17:40 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKx4OEM-asdvs1wUiP3FFObzJHZtNTtqiwtcRhJ5CPRyQ@mail.gmail.com>
X-Gm-Features: AUfX_mz9kVcB2p0XmnaO_w47PYg5nxBKrgQw2D-RxR5WDjCFz7aeXdayL1fqqeI
Message-ID: <CAL_JsqKx4OEM-asdvs1wUiP3FFObzJHZtNTtqiwtcRhJ5CPRyQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, 
	krzysztof.kozlowski@oss.qualcomm.com, conor+dt@kernel.org, andrew@lunn.ch, 
	devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
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

On Wed, Jul 29, 2026 at 1:06=E2=80=AFAM Jacky Huang <jackyhuang@nvidia.com>=
 wrote:
>
> Hi Rob,
>
> Thank you very much for the review.
>
> On Tue, Jul 28, 2026 at 09:39:52AM -0500, Rob Herring wrote:
> > > +                           cp2112g: device@2 {
> >
> > This and other devices should have a compatible string and associated
> > schema. The hub probably should too.
>
> Will fix in v5.
>
> > > +   flash@0 {
> >
> > Needs a compatible.
>
> The flash@0 node augments the corresponding node defined in
> aspeed-g6.dtsi, which already carries compatible =3D "jedec,spi-nor",
> so the compatible is inherited. The same applies to the flash@0
> under &spi2.

Is the flash part of the SoC package? A board level component
shouldn't be in the SoC .dtsi file. If there's some components that
all/most boards happen to use, then those should be a common board
.dtsi file.

Rob


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1CACCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 14:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfgYFNTqOYa8NAxPLZPVhWUvOB20sAQXRAOszr0q/VQ=; b=4XqiUARhvoep7/N46EePNNpVpH
	R/tQIdZRvbcPjPdxKtM7EfEqZ7ZdzT3vxyNXmDJoMUbG14ccJGC4h/Oe+ZpJ+vtqQUytcoRRayqro
	SfAHR5HhOwt1MPgVBwv9d2T4tzflSy9IhsmdYd3J2dTqwJzY01dyf2NAtUI1S1iQ7eC0Xqz9MXm7K
	E+g1mHrSdP+n2vFunqmTy8QMbVy+WXgpeQzIsHkiI8O/cDsfTZio3nX3Khv9CjtZnwqRPDQYo1in4
	MZBrkjCh7bTQZlKYWACxgu2lf/G7bSVk0DL8gO1GvziQHs0M+lNgFHSzyyvNmmVT+9bS3ZnKhsA1X
	4XB130vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInxQ-00000007ekJ-3av9;
	Mon, 19 Oct 2026 14:03:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInxP-00000007eiy-16wQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 14:03:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B36744811
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 14:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78191F000CE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 14:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792418598;
	bh=xfgYFNTqOYa8NAxPLZPVhWUvOB20sAQXRAOszr0q/VQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jXnyMGRAlDjr6zRCDBdzkvoeuKZgCnmWpbL1kiPytyJlyP1LbZi/Utp1jHgWqbkFH
	 KxaSejYZbUSYs/WRpkVn2MjWkQ34tZzi3Pxqh2UmUUjXzt4dPYrWMIaOhHBxBr9Yle
	 pLc5YXgcKOh1i+xgDvhbi7CQMsiM3P66qmOZ4r+/UVwmylegOdz0iTvNzjOts1HUqe
	 D2vpVVYqHSsyiEqycblNxq4HPwCp4eXK/HrE/8bx1I/Wjmqk0CN4d8icxlcwycv3g9
	 5dfOKn+jX+l9lFtr7Vxem2zizx7cNvjOffMr3dPeeEfbtiIRms34Q0xAhhzt0Gvyui
	 FCMz2oQ9TfxeQ==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-43bf9548df4so1971833fac.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 07:03:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzRUfG/zyQkfYt3eOgbMcuUhFO2WlBJDKL7ZJaw261LKLhOrqSjmVDX/duVy1h+W3YqZnJbDisNzFV57Ph5is+G@lists.infradead.org
X-Gm-Message-State: AFq9FYKEZnRzfoC0a1gg7JG9bTWCXj9zjDk4XIOmirlomyNj4xyZmu53
	WtsXhdNeRSp9qROC1nrA24k0DePpSRaSuinjUJz6ydBuAAXXswZWHMLznss/1o+kT+7toFdktMo
	x4ZOE2wBF70vBYwFgWFtTbcbtWbSAj1U=
X-Received: by 2002:a05:6871:2e89:b0:48f:e0e5:a1e8 with SMTP id
 586e51a60fabf-4a757a1408amr5342765fac.45.1792418598137; Mon, 19 Oct 2026
 07:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
 <20261014-xg6846b-bcmbca-xrdp-reset-v1-2-daf5d177e113@kernel.org> <9ee8a8f1-5e32-4ecc-80dd-027f0424fda4@kernel.org>
In-Reply-To: <9ee8a8f1-5e32-4ecc-80dd-027f0424fda4@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Oct 2026 16:03:04 +0200
X-Gmail-Original-Message-ID: <CAD++jL=_FhbjBCAZKTa_sBLT6UX+xL4kaHmTCE5GAOJf__2tnQ@mail.gmail.com>
X-Gm-Features: AclHuK-CrXHR_ECn6jU2pZ0tG1afGY2U1A37vPXP2XK7b3-I69SZV02e8oV3Oa4
Message-ID: <CAD++jL=_FhbjBCAZKTa_sBLT6UX+xL4kaHmTCE5GAOJf__2tnQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/5] dt-bindings: soc: Describe the BCM6846 Processor
 Monitor Bus
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
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

On Fri, Oct 16, 2026 at 4:20=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> > +    /* Called PMB Processor Monitor Bus in vendor tree */
> > +    bus@ffb20100 {
> > +        compatible =3D "brcm,bcm6846-pmb";
> > +        reg =3D <0xffb20100 0x200>;
> > +
> > +        reset-controller {
> > +            compatible =3D "brcm,bcm6846-pmb-reset";
> > +            #reset-cells =3D <1>;
>
> Anyway this tells - no resources here. This must be part of the parent
> node, not a separate device.

It so happens that this bus (PMB) has several children just not defined
in this series. (thermal, clocks, power domains).

One of the children is the thermal monitor, which in turn is using a
reset from the reset-controller node, to reset just that hardware
which is under the PMB.

At this point if we put both #reset-cells and #thernal-sensor-cells
in the same PMB root node, the reset resource would come from
one part of the PMB to another part.

They really are different devices under PMB bus, but I'll just go
and implement thermal sensing in the same patch series so
that it becomes obvious what is going on, why not.

Yours,
Linus Walleij


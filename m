Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43681C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UhFyOhKx+jT3HPS8ykasYawrPgWFTlQSXn9dqJwRwc=; b=QFu4eWrJitzTmdy68ntr2tE3Fc
	mzbHbZ7SfusnfAWdC49EouwUCBCZgmEbxvubIpYxPGsISNyERI600EH2z2ECbdyCR/HzbySY5bSqF
	wVi3Qh9GF4H09VHj/WZGbJPUEgarZYfkKibGHX9fv8wdLaaGH1RLe/oOU2zv9pDz+K0n7gT/bt2E9
	M0B4tmv6hTabRsjrlN2Rw33FA7AN7l7s3Dhv3ez4fPXHJNTvugKQiINSSodVvc+TtU9cnEszDzjDH
	6GI9NNdZI6CwgNQGQgCmxNUeROm1CO5cmldLn88yb6FUvl6rTUha0RvmvLqJEimbcoCXpkQ5GC7+C
	F3635GhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRhD-0000000B9BE-4A3S;
	Wed, 22 Jul 2026 07:48:51 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRhA-0000000B9A8-3FZb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:48:50 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-471eeac43bfso11420161f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 00:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784706526; cv=none;
        d=google.com; s=arc-20260327;
        b=OMYMGRDYeLfHT6RIvpPQjL7Ehgfkdw5Pr0WmCz+CxZp/o0NJ62XOWuxZD6CzQyhYxP
         WVl9M9W72bQWGdvBr1UCeCQE29kVJBN96dUvBgR79B9YqMvMQUWS3iqXw//W7ZxlD5ES
         sBelY3fzOm3KqqYW/LhYFOMx5q7pYEbFoF9BxO9aKmnNerYgWR9zb6hKXG11JLhoO/6l
         AiBTvMDPQXQ22LdoQgEjWPgKOHr58TbnRAdI6YO9dg15gZmOPAc/ixf4163gW1sGy65v
         euGeRJx+bndoKcwM+pthlykZ1mvbQcrau64bYM6iWBfd90k2sauI2J/PN3/Dx8Ms09rv
         ONZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6UhFyOhKx+jT3HPS8ykasYawrPgWFTlQSXn9dqJwRwc=;
        fh=bR5WEtCwrmdwgIyKMbkqNchk4aMtdEP8BRcKOAI9ZgE=;
        b=GUVdbx34W7q2ilKGz0vmnGRUExAHfIZ2RG+95+uDrT41KrlWrcsLaKl1Nr77VGlupa
         pFcH8ybociW8XwkmP2TfqCkJ7A6rY1oC7ul9z16prfPLTe9e0rkZ4/6PsdTiNlWlKjf4
         uZbz6Z9rIopKnKCNRrU7KSyHn+HdSQr+qbA94FkMVCTdDAqCE905nU8IzuOXOHjd0Ko2
         NABlQ4ZIHnvlz0hP5RFOJZApzd/QQxrc+65H0XJFVPb0fwNGFTfSxyjw0PsbvAGZV2+m
         BUjNNT72RGlgldgaeAD2Lef4B9pi7GA8zKuFjuIziOMEa4dKOJqznZwXVt4+EdBp5vA+
         /tUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784706526; x=1785311326; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6UhFyOhKx+jT3HPS8ykasYawrPgWFTlQSXn9dqJwRwc=;
        b=DAGF7z8spiotkF1eidRJHlm62e5In/GRGtO2NnrwbkkTea7UyAqlq/6dSvhSLsW3Lv
         AapspVULreO8mPScL2Cta8DOcgW3xzRTfV14W5aNa0fsy+3nzuVlCClE55CbHy6LESmL
         0mLAePwNDaiJzmJ4RjxZl2AsIpISYTTYblh9jYGkecpHnHQavy4RWB36BiLYlTA5HVxb
         oRuCd1vFGhl+PDJm5DpQUMz7gwc/HE09JdTaOqAIktRLHRje9XL3wlYSPvYaX5qqD0eL
         ni6LHS6H9pbKG/3SXZ5tCwbQk9DLFj3wW4Dyk53hBBk3hI8LbpYiiWgbidhjx+xkEdWI
         nQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784706526; x=1785311326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UhFyOhKx+jT3HPS8ykasYawrPgWFTlQSXn9dqJwRwc=;
        b=PqjF7RDx7Z0U9+eVJZN9DwF/u75o3k1OvWJ92ljJhiI3xQjE2nOaYDm/lBzSLEofNG
         kXAANrCp1nG3GFtKIDwtaWr+C7QQtcyHoz/hQkjvkQTN8TIC1ReiDG5+tWhrpO8UbVV1
         GJZ40KEEwXm5fbz0x/I9mVHDenpbNij8+8+owGAA6jvj7S5OceSmuBtJewZ3ymySHSNH
         Blp/GBrhkUyvC4MOiEapnyQWddnk9wQol2mvMC8PZUp18ZQ3onz34iUNwoSpORV+9tOc
         nHMMkNUXs19afMLrZDMFoK7lGgE/XHIk7Xl0ZmnaMkd/l8dA6K2HvfaQorXP8nerJI+J
         V5Og==
X-Forwarded-Encrypted: i=1; AHgh+RqjIKDfsF2VM55nV5gyulkDc4XNwjiHTVe0ay6RyvHVYe6owMZ9lOoUxub3AUmJ7iJHQlzgRXukZKRT3YclDGgo@lists.infradead.org
X-Gm-Message-State: AOJu0YyIs1kPGgwcoyzLasDiNWt/wBgdl/uNNAesVckZFrSz//aGX20P
	yUkWB2sWw5NK2wRDH5IULydDqjKrmTYdy6jk4WTqaMG/8RIlexD2D8KRBq9EWZqyow5BxDxJ5KI
	6xqRqoUNh8Jxq4uhFeoW8BiYfThwmSfafEw80MWJrFw==
X-Gm-Gg: AR+sD12PQwHU3WnzeTuEyI72l/NNSBrySdyLvCVIx+UdnVuVLZG2s0JjxOdooIB8Idd
	Sesvwa2bnvodPBUuZOqw457rRdIsC7OkCmx/Uy4mVU/Fz64ST1ej0aqD16o9NnyHhme6M91RZSn
	tsusygcF7iStUVS04Q3zizupnyiMdtr7Jb6n7OjvC0asAELNFCJ/Aoqj2T9BB/CMb3ublwNebGD
	qwuXzyh/4km/O1FF7d3ZVh1isPBOty42/TlWHxBUFHoMnz0cBhb46/l2oX3xoqFaxIa67k1q7s/
	5IGxpAdoCUvYRq4K5uGAsDwFQJYBlPmyPIK431Z3y941z6k=
X-Received: by 2002:a05:6000:1785:b0:47f:7b75:61a with SMTP id
 ffacd0b85a97d-47f7b75083amr12134285f8f.15.1784706526183; Wed, 22 Jul 2026
 00:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <de49f2032f5b1f170161dcd6191c0daa48f0b0c2.1784117715.git.gregoire.layet@9elements.com>
 <178412588365.243141.16731478852761544781.b4-review@b4> <CAFi2wKZrya6aHAN9Wtwk43gqQTMPp1BamM9VKKQ+iH1UPzr4HA@mail.gmail.com>
 <793ccb3b7af22f6f38ff6544ed633b7800ea68b6.camel@codeconstruct.com.au>
In-Reply-To: <793ccb3b7af22f6f38ff6544ed633b7800ea68b6.camel@codeconstruct.com.au>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Wed, 22 Jul 2026 09:48:33 +0200
X-Gm-Features: AUfX_mznQxf2UYusZQbYzHcCnp0qGiF5STuXfQoGRl4lbxGWdovDVg2XFHP_Lfs
Message-ID: <CAFi2wKaWiE61y_rUr_2UNN2_fSAEswG7CXQrPMWT0NiSVBcBVg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed-g6: add pcie-lpc and pcie-kcs4
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Tan Siewert <tan.siewert@9elements.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_004848_931472_554F761B 
X-CRM114-Status: GOOD (  24.90  )
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

> > > so you're describing a second `ast2600-lpc-v2` node which is unnecess=
ary.
> > >
> > > Suggestion: Merge pcie_kcs4 into lpc@1e789000 and use 914 as offset. =
That way
> > > you don't accidentally cause an overlap for the devices if you descri=
be more in
> > > the future.
> >
> > The 'kcs_bmc_aspeed' driver has the kcs channels address hard-coded.
> > If the 'reg' property does not contain the three addresses used by one
> > of the four channels, the driver returns -EINVAL.
> > So having a pcie-kcs4 with regs 0x914, 0x918 and 0x91c doesn't work.
>
> It does work if you fix the driver to allow it.
>
> >
> > This is why a second LPC node was added, for the pcie-kcs4 to have
> > regs 0x114, 0x118 and 0x11c;
> >
> > I know we should write device tree sources based on hardware rather
> > than around driver limitations.
> > Changing how the driver behaves seems excessive for supporting KCS over=
 PCIe.
>
> I don't think this is true.
>
> > I think a point can be made that the LPC over PCIe is a different LPC b=
us.
>
> In my opinion it's most helpful if Table 8 in the datasheet is used as
> the reference for address ranges in the devicetree. With that in mind,
> I don't intend to apply a patch adding a new node as you've proposed. I
> suggest adjusting the driver to identify the X{{I,O}D,ST}R4 addresses
> as channel 4, under the existing LPC node as Tan suggested.

Sure, thanks for the clear details.
With the Table 8 in mind, I agree and I was wrong.
I'll work on that.

Regards,
Gr=C3=A9goire


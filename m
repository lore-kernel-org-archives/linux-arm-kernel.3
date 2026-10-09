Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA757CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 05:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9YO0eJYB2iuGA2U/VJdUhkPCHtdLj+gjfpQldoRh8o=; b=kzkUjZ9UxhZtaL6R5HSFos4db/
	RRqZc4HHpOxyVBhKdLbro/+G3UFZzhBmAxPE6FtF0oySphk0FWQbct1wUuRoyPrKD9sBb9oMt21mG
	vm4L6O3FcLpg19umUNZlMz0TmLn2VmCzeWp+0Pzt36mkPS29yWHC+eAO2AnlWWJVqYN1ZGjtPAKen
	9SEUsqJAfnXyUED0GG/LTocg9C2N/af7FqIx14vytaetyWn9h04pEEySp9zWyiFj8FCmwVciB6L1y
	c5fr5yDXta3x753oo5hskx11siz9KBWRGery5uCV/YmAG8/OenHDjyfo5FJoN63PJvvIleHyHBQpo
	GOnUrlvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF2nx-00000005VL1-3tPH;
	Fri, 09 Oct 2026 05:06:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF2nw-00000005VKZ-1fXO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 05:06:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BFEA143965
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 05:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960DA1F0089E
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 05:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791522359;
	bh=I9YO0eJYB2iuGA2U/VJdUhkPCHtdLj+gjfpQldoRh8o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CChd7zzJcSynPfXkJUfzvxWOXcF/ySNL5XLqIhF7VLTfAK7P3aIpLnm+B46PQeoU8
	 OZjRgCzQ+tYcXIfYiAAgYjz19+3/yg15qtTHp5L3BaiXWrYb86nld+0jZodxPrY5NZ
	 7428JZRZUy6Wdp4CaOEkfcDqHUtvBSqewIqBF0hUISdx0Y3T7bPA7U/Qn7ovgrg4CH
	 nxIvUKtw/DWAXeK1pGG9NprsuRdn64u9pw19YsclC2bhoEcty/jxOe2Mtfe/CoS6Ul
	 LHKR/bAgAfWLLB+IZoPsSho4UyzRdVWIsrrL14Ld8SnH2Cp1G2FfkB9yz0yV73+QxG
	 PXJB1ozmuLebg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a98fcbfb1dso34716051fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 22:05:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzW5hFkzWosTPVZMbcCOTjIxhhOfU7Gmf4PBQIxPIps6BFrEvCisupOJHbP5f1Rg3InQdWbOngo+UFP1GGRRJus@lists.infradead.org
X-Gm-Message-State: AFq9FYJQgFMhhOm75Znr3ePgKUYA8rXQOzzNUQwhO8V60lLHsm6RbRLo
	cGK/hzbPldth56yv77VmARhuIu0GSSsSR5trg7IiVzXw4NHxJQmfi+DNbw2qQe7ZQJJtHKEnfoR
	hViJle+Ge3zwVhHa9P4kOOi69tMNnSa8=
X-Received: by 2002:a05:651c:a204:20b0:3a7:812b:cfc with SMTP id
 38308e7fff4ca-3a9c5362e82mr1036541fa.14.1791522358331; Thu, 08 Oct 2026
 22:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
 <20260921-ux500-power-domains-v7-1-v3-5-9352be6b86b1@kernel.org> <CAL_Jsq+1O+os8=YGUoKg6zCm-r0gQ35baKX=z65uTQNB0i=RVQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+1O+os8=YGUoKg6zCm-r0gQ35baKX=z65uTQNB0i=RVQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Oct 2026 07:05:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLm+yRo9e1UDhnaYrdPq28mdyYKQZ6tdKuUa3UG85imkNA@mail.gmail.com>
X-Gm-Features: AclHuK-Ex5IjXhkbtgEhkucoevwygfmCnjR6ilMQmzKovj4MIFQJsLkwQxsWcf8
Message-ID: <CAD++jLm+yRo9e1UDhnaYrdPq28mdyYKQZ6tdKuUa3UG85imkNA@mail.gmail.com>
Subject: Re: [PATCH v3 05/18] dt-bindings: display: ste,mcde: Allow power domains
To: Rob Herring <robh@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Lee Jones <lee@kernel.org>, 
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

On Thu, Oct 8, 2026 at 7:41=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:

> > +      power-domains =3D <&pm_domains DOMAIN_B2R2_MCDE>;
>
> This patch is in next, but the define is not breaking dt_binding_check.

I screwed up, I forgot the dependency on the new define :(

I asked Ulf to merge the prerequisite which would resolve it:
https://lore.kernel.org/linux-pm/CAD++jL=3DgFt9kKZH9T-m8B_pbwRvzc35tTrMn5V2=
38d3528DpUg@mail.gmail.com/

Is it very urgent so I should just revert it? I could also just merge
the single patch adding the defines into the drm-misc tree if
Ulf is OK with that.

Yours,
Linus Walleij


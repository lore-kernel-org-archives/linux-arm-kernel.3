Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E649FC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 17:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q85OFS0/wcmxsg3cy/PCsW6K+vmLUTrQvpSWJO/mpH4=; b=gTlo6AT4ZzaS5rhbV6Q8vpyUNN
	KURIExoB/cBQj0dpoibPdXYe8igUVzWS9s+zBgc3QB9j83/hMQPhleVB/okV6ln6/q0T+ELQeBfn2
	Gp8khz1DpuTWCQ8apBmKm5VoKW9H1y83Nq05g+wpDNrU1huab2vaVbeQ7AamndTg5YB0XAh4gf+HJ
	vVhnfRkR9ywaUf3JR39by3PnwfqDqViqCSRrB5CtatGVjIf+s/n5Tn9P7r51Xoy6lAwFaY/FeIXtd
	2qyuNiildJ/UTyi3lHwWyCrKpuK4OWMk0Xb0Y46R6Qze/jBgJKqRUwc24T+xWQUgP1LLWKd/QQ4NQ
	vzLRxSSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Qep-000000090s3-0Eth;
	Wed, 23 Sep 2026 17:21:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Qem-000000090qK-21X4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 17:21:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EB1B060DA9
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 17:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49081F008A4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 17:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790184079;
	bh=q85OFS0/wcmxsg3cy/PCsW6K+vmLUTrQvpSWJO/mpH4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ooOIG0ZfNOU4hcI/I0WM2jG6AjFEXMtGvioBZyC8o5eD+6I3jqkT1RdDYPu3dg45w
	 H4SlISHNfqnrbDsZ9yQuoBX1YuNztPBnKk8DhsypnRg19I1kBZie8uHr6arYAtVIav
	 getEYnTmH4y+kww2cHGGTHTq7aa/7m2obuZCKQzRIahoq4qJ7fe+5YFaKqvRfLPomw
	 VN1HsmBxZnOw6kUNpUSR8MlFQxrfRuq6DtiUlD/mk9vZYVpJcRxO6umE6IsC4N8/za
	 XgGzr+nVXoEw0lASaRqTcHbct9NzYzzBqsF0W2v9oEJP9TQuXDfwjIlA0DHOkGbq7q
	 ebiZ7rYVvDQ1Q==
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccbd4773so391652fac.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 10:21:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzInvYZyZ7SgzKCe2XyGc4fD/nYOLYmS/3HEnhKJ0/fmq6bfE/atuqXgMIsgIlk69ypv1O0+cjjQOj7uvTlAQxx@lists.infradead.org
X-Gm-Message-State: AFuF++l/dsYokkvpnvtGX+5K3RxY7mlOEZBGye2Q/glkfF/NFtsvXgur
	p/OXCmsZouYcKp7Ec0T42e4r8JowOxgWhs8FtlKwvfpBA1mZ0I23p2RF5fIXoT4QIjG3fRmo1zK
	kKArnA+xzkymMtmZmcc1j3bz825faXBI=
X-Received: by 2002:a05:6870:d62c:b0:481:7027:16f3 with SMTP id
 586e51a60fabf-4908b1aa7f3mr3359673fac.30.1790184078838; Wed, 23 Sep 2026
 10:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
 <20260914-ux500-power-domains-v7-1-v2-18-9d0c17e1f816@kernel.org> <20260923152034.GI3864833@google.com>
In-Reply-To: <20260923152034.GI3864833@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 19:21:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLk+uqjOoJ8EgRYr2fyM1aXLjyJWMBS-d0TAOTFBQuNV+A@mail.gmail.com>
X-Gm-Features: AclHuK9itPFOvp6R2-cC4u0O4UlC0wT8IFEhaoWAUi8CY_OZQDIKlQwDDa6vJaE
Message-ID: <CAD++jLk+uqjOoJ8EgRYr2fyM1aXLjyJWMBS-d0TAOTFBQuNV+A@mail.gmail.com>
Subject: Re: [PATCH v2 18/20] mfd/regulator: db8500-prcmu: Remove EPOD regulators
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dmaengine@vger.kernel.org
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

On Wed, Sep 23, 2026 at 5:20=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> Looks good.  What's the plan?

I need to address some binding issues, then I'll send out a v3
which I think can be applied.

If you could just apply this one at that point I thin the rest will
trickle in nicely through the Power Domain and SoC trees.

I'll add a blurb to the patch to this effect in v3.

Yours,
Linus Walleij


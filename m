Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DC4CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 20:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCgSqVGjXBaxfcapf/nqx7C7CnofVHmzcTzARfODWNM=; b=e1/FhIxQYAU8/I
	aXdZuIudRf/gxp9BCRYqWWohP9k0SdAwopr/BopXk2gN+DL7YEOnXXZ+88NHHz5n97ZiVaMOrdDue
	7NHN2N9OJd3CwnrNgB5z+HZbSjQQCsr7rPrYo6yvNo2Sqf3aubWSjImUHc9u0tCfObwhSwCrwDMJn
	ilJPM3MfP4WcCxuWe6Bj6PT1ewhOH9FSrOrGJDOiiBBpBQWKf4GdFc0XzzUSishqwuTRy7vj6aW2N
	e2gzWhXnFfCxFnA0xIB5ITLmNHZDKe7FImjZypGab/2/XhWXLcp+Ni2qH3hQaew8XmdMGTrA9y+8L
	IZgn9VLSbn69hLA3i1ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1Kq-00000007Cp9-39Pz;
	Wed, 30 Sep 2026 20:55:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1Kp-00000007Cp0-0Wnc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 20:55:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC52C437B8
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DE41F0089D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790801726;
	bh=HCgSqVGjXBaxfcapf/nqx7C7CnofVHmzcTzARfODWNM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jyuAAozm2SlG/3yaJzwaRF0564cBU2dNOYce6HgXWn8I0yYASB7aK7sdAw5+8ol5A
	 3MjxwTDKq8AgC0UNgXiEP7CVvNKsaLLPEY5eWixPJzFx07GU5n5u+uTIgzgXt15w8L
	 VCKu9ZBGrJ0S/xtEVtar44q1OUG2/lebF5fSZE/8opypl136+zUh/kWpMbmYPnbUn6
	 J/eZhWf0JJZ6ZjjHS/noRGToKk6hDAaqo2MHEFBekvH7K4YOiOhxURVGC4KHayBg03
	 wvIe3WCgxByeHqwAtGcxNomjS3vJX9BKigqCucHHvK6JOW3KxVjyeJW0hDntnJS1fK
	 Zi+xxkiUSyWQA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8eacb7c8fso5152653e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:55:26 -0700 (PDT)
X-Gm-Message-State: AFq9FYLgYlEHtGmTZ3MtIAQEUcwOgIdNtmBwt396RMQoD3Rc/lNRnA5H
	wS6UukUtRXASrRU7kIkqPHDcB2gU2yxB4n42WLQHbzx3EO5IVewHCu3Nh/jci3Syddo9qnfSlQE
	fbK248VaaS8U51/ZfiMok+C8sq1ELlAE=
X-Received: by 2002:ac2:4a70:0:b0:5b8:f0a9:8acd with SMTP id
 2adb3069b0e04-5ba402b86bcmr792389e87.4.1790801725523; Wed, 30 Sep 2026
 13:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-6-will@kernel.org>
In-Reply-To: <20260918161407.2300-6-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 22:55:12 +0200
X-Gmail-Original-Message-ID: <CAD++jL=5uk-iSHO4hjbnJJVZy5pTJgGA_82XVK9z8pe_DkqdLg@mail.gmail.com>
X-Gm-Features: AclHuK-aQw1JEMiKBlcrYG_6zaRzd-8YwVY1-spj-5xQF9lhNQZtAGIMC8Pjo7U
Message-ID: <CAD++jL=5uk-iSHO4hjbnJJVZy5pTJgGA_82XVK9z8pe_DkqdLg@mail.gmail.com>
Subject: Re: [PATCH v2 05/21] KVM: arm64: Protect TPIDRRO_EL0 across guest entry/exit
To: Will Deacon <will@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 6:14=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> From: Mostafa Saleh <smostafa@google.com>
>
> To prepare for using TPIDRRO_EL0 to hold 'current' and repurposing
> SP_EL0 as an overflow stack pointer, eagerly switch both registers when
> entering and exiting the guest.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


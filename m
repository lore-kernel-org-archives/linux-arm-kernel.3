Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05F9CA5FCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kP2Hc0xVxHp38/pOSmhAb4V3iGOUVb5jZAxSa8LNMDo=; b=hzDxIzaJV3VyI9
	JHE0xsIvTnYxLx1TarkDufoTIX4NVMEk8jtLtcBkAhGVQvnsFwZSclGJcuJgGsRQgvlRjUHzMv6H4
	SN/gNejl860PmMgikwkyC6eMXJ/h6CDq6xjnnysX+zcJmbLt0fOx7XtGJ1V+grM92S+koUVKh6+Px
	gnxQi++Hl82Z1Mo5dyciedauagVFvpRIFTO05vv6KZzTGaoLhG753as+Uf3hp9TapN4gLHtKubGua
	GWCS2jZX3/XHF4GQEUqC5P5rSkX4hap2anOAai9DsSR6vXjEcePT7keUb7w3mxUpzT1Vdppd/Rw87
	XQXgZf0myOzInGuSVUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC255-00000007H9F-1T0S;
	Wed, 30 Sep 2026 21:43:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC24v-00000007H7Q-30Ac
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:43:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D4AE36021A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F441F0089F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790804584;
	bh=kP2Hc0xVxHp38/pOSmhAb4V3iGOUVb5jZAxSa8LNMDo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jFHGvzW0d5XOYcFhKadHZWWVSm7jpwI0YuWUXBX2LbXTQsdwPiqKRpWeymsacUxbJ
	 Nl55Hak93RxBiw3IXEJ9rPlTeL6H58yK0yToOzdkOWt69KyqgeBd8+hxiiuMLojQdS
	 kpFPaPCZKPQIgc8r8ymxA4jdXOjNMNKLycFX1U7INUJgy48alP5+yIcmDhxO0CVgXe
	 wJdbrOkRJPA6Sjn7D9mgsIuBWy25l7E31gEr5S0u6hAU1SZLZCcMusieCA0wY39i/q
	 kaW6DhB4SV3Nmy9ONOEH1vmjhXk2wPRJqjVz5NoBmWt1FtMDYCAxTnJVWMDCBrbQJl
	 0Zo6XnDSIkM1Q==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a779b23f05so8948461fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 14:43:04 -0700 (PDT)
X-Gm-Message-State: AFq9FYJB51L2A+0koXdUh/8k7dyJp2XgOYY2CRex04Wbk8u5mHmZ2liS
	5+FLbvW9sYcH+/P7kPTYLGBCNG1cDpePmpzaHHNhfHaRjsOIyRsv7yO8d8UZIz5ZxHv0sIQrBsC
	uOyfYS2s54ozKy6RCSLWJXZWsaJ3JYyE=
X-Received: by 2002:a2e:b8d2:0:b0:3a5:b524:e28c with SMTP id
 38308e7fff4ca-3a7791af9a8mr9222391fa.11.1790804583296; Wed, 30 Sep 2026
 14:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org>
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:42:51 +0200
X-Gmail-Original-Message-ID: <CAD++jL=O30YiraMzpe=wd-s-ZHoiMWkXcr3B_qb_dp3TUk2A7g@mail.gmail.com>
X-Gm-Features: AclHuK_u2Nc1iLerOHkQ6hvbUCBpiEkacWiDJM0sMa6PBj21Y5wcS7mqWJaIpQs
Message-ID: <CAD++jL=O30YiraMzpe=wd-s-ZHoiMWkXcr3B_qb_dp3TUk2A7g@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] arm64: Move overflow sp into SP_EL1 and kernel
 sp into SP_EL0
To: Will Deacon <will@kernel.org>, Usama Anjum <usama.anjum@arm.com>
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

> This is version two of the kernel stack juggling patches I previously
> posted here:
>
>   https://lore.kernel.org/r/20260907164247.17223-1-will@kernel.org
>
> Changes since v1 include:
>   * Fixed suspend/resume paths to handle the stack pointers properly
>   * Fixed restoration of ptrauth keys on resume
>   * Added tags

Overall I like what I see, but can we split it in two... like first the pat=
ches
up to fixing the overflow handling using SP_EL0 and finalize that?

Hopefully Usama can test just that part and see if it has a lesser
performance impact as well.

Then we can think about the rest once that is merged and works.

Yours,
Linus Walleij


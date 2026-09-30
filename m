Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5EBCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 20:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x2xDoi432TpdS/q9V1G7eQayt3YVdg1enz2iU5BviuI=; b=hZjPI+H/q77gUJ
	AhnxJoagwRRoK41EcpngB53HsqyfQglKqVjsZbwPNpVRFZyuuYSLC1yhGiHqrHDLc95slxRUDcsIl
	HobNxqvMrM3qpvm9sXSu6/RQfoNVHjzhymxfgg0LnSwa1/p5R6QStYiwlpSHwwGbRijvDYX80jM8I
	QCdezaPHTup2s9gCfID18FFRSmhB4pN/Z24FBBKuSsOUZzObnkyBE1u48UsHjWcxmjxm4cmuP9B2l
	W9XLSZt04CA/9NW8kOQCZm6xTmhHBzGzG96brCWiM0GXbQwSfaqY8KUMe0W8WVEIou/KiiADYjoml
	t+46N5AtH2Agmcq5omhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1Ok-00000007DPI-3eD4;
	Wed, 30 Sep 2026 20:59:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1Ok-00000007DP9-1ftH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 20:59:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 00A33417E4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF7E1F008A1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790801969;
	bh=x2xDoi432TpdS/q9V1G7eQayt3YVdg1enz2iU5BviuI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=T81mUW/hw9yHMlbon3JBub2tX+pVw8QbZdtVbmDn0vR43Xjt2VemsTg4o1f5tW3Pm
	 WEqH5dlsf4bfnQQZ0QvMkRjZbGSisiumU03R6WRWtxV1l8jhZFJHlMAnec8D3A/ody
	 6MMVT7x8s0bfoBUDGPWDaUK9JH0Y54tJo+lae8y3NLu1IgvPJ6prveTXGQeFjp0K4U
	 IHxh2K4p3ZInzKjnpi6wQ5BSWxrqVlOVL7ZYsKZ9ke0Udiet0x3OZM433+woNhGVnv
	 uGdCMz51/L7v8BnzgCvEYPdIZc1IIo40olrp7U0vYk49pNDgeqwwd+N/T4dHC2vaRA
	 BcqJhtJ2SiFpQ==
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a7847d8aadso835191fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:59:29 -0700 (PDT)
X-Gm-Message-State: AFq9FYILNOc45TLhZWyt1aaXEqqM3x1qFtifgwbB23z0IdzhOIIEDEh+
	7MAnVnBV2yALgTYkNvWAR7Uvlaele4wsJi6t1UI7ARvxziAUeq4JklLHNqZTRdmh0LXIC+GyljB
	JX20FtkUOu+Jvbb9ZPVquaLVcpAr9BXo=
X-Received: by 2002:a2e:be07:0:b0:3a6:3074:1213 with SMTP id
 38308e7fff4ca-3a7791f6853mr8204661fa.10.1790801968394; Wed, 30 Sep 2026
 13:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-9-will@kernel.org>
In-Reply-To: <20260918161407.2300-9-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 22:59:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLmasCTjrOhoh2adbcJOoUp3tpyKRoW0sQ208Yu+gmASyA@mail.gmail.com>
X-Gm-Features: AclHuK-WMilLduU0SJSUy6DYdYt0XQQZ-96_5ql4TiYDpBI59IN3Gx8NkrGan-w
Message-ID: <CAD++jLmasCTjrOhoh2adbcJOoUp3tpyKRoW0sQ208Yu+gmASyA@mail.gmail.com>
Subject: Re: [PATCH v2 08/21] scripts/gdb: arm64: Use TPIDRRO_EL0 instead of
 SP_EL0 for 'current'
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

> The current task pointer now lives in TPIDRRO_EL0 instead of SP_EL0, so
> update the gdb 'cpus.py' helper script with the new register allocation.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


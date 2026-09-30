Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55AECA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXcmhxRFPyDo7G0VXnE8mGBcLQuaaxOtjql+bmbJJmM=; b=nEtjngPw+7s0cG
	KJLf30FP10FNVfXQHTDyU4XtLSdEgsMCWKT9nzTGMyc4KrCv8rns9k8w0vulUfKsWzm1kX9um2Fvm
	JTf8t1iwmWAcTGB3BxLhDvN2Ftj4x88hE4FA2fhi9ZTA2Z0fu6e1TC4w6Sxa5kEUypl3XfgVxqd2a
	gZfsktGHgSk5RfwAUaVf/W5NSc2wERYZ8bqwIYcdwGOMwPSeVoKkydUrT0oxvtgZyJrTDVJ7USyh1
	F67xsh7KSEzm7/liikWmod+y1RfgSgoJ57er2TWXngHDIqRksQWxAjE4u2vr4bTaQ2WuIHYSpvax1
	skCaWU/J9u2CeJKsshvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1SB-00000007E38-3hhI;
	Wed, 30 Sep 2026 21:03:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1S9-00000007E31-3AG6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:03:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0ABA6601FF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B28BD1F008A2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790802180;
	bh=VXcmhxRFPyDo7G0VXnE8mGBcLQuaaxOtjql+bmbJJmM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iXdsSByDSKVDFBcxz6x99Ctyn1fwlU+AQesbyfbti47+pCthiWG9wLdIykTBlCKOE
	 SaoHwAQn1sg/ERmXOtxcTH26DgafFnr7cUmQgP0hNniXwDuXzvFmTo8Wg7s/csnqWd
	 OjL3fDG2vyQTcZbF4sOks3cZtRuvQ3Ht+u74Sk5aXaXYuDzY7WzrW/cP2keoOQMgG1
	 IZlXkqc5tcgGNEj8zgBXGF5cIECh5E1aCH8hBSZRaTh81JxeDRfyg/Y4GPrDn1LsVB
	 G6xkV8LjnWJioy29uuFh9WNMh8PT9NFFHH3tgD+QW4r3O0YNw1U0HSwePH5pCx428M
	 g8r3/p8TlF3jw==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a3156692c6so47094201fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 14:03:00 -0700 (PDT)
X-Gm-Message-State: AFq9FYLV3pnx2D2qbqb9BAA3UJfPIuyjgw+wthFz8u6UDPT6PVJKEgAQ
	Q2t8S5IbtD3DnvL/L5pG0WeIdyouv92MscexccnuSnbsR1ByonaGy/S8YEt8EQiHfgz8Rp5eMQZ
	mlRKgxL4tibbqZZ3P7hHygFDRM8irD0M=
X-Received: by 2002:a05:651c:1991:b0:3a6:6ecf:77fc with SMTP id
 38308e7fff4ca-3a779239069mr7881541fa.20.1790802179476; Wed, 30 Sep 2026
 14:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-11-will@kernel.org>
In-Reply-To: <20260918161407.2300-11-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:02:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLnraiZ_=3sBxCRZZRO4sYNukggksvzGMrJwVmLw5Q-bmQ@mail.gmail.com>
X-Gm-Features: AclHuK8lqw0xClayS2juku6qh8ThyYVtjid64ZdANDn9WV2EDJehSkAIocbI1Oo
Message-ID: <CAD++jLnraiZ_=3sBxCRZZRO4sYNukggksvzGMrJwVmLw5Q-bmQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/21] arm64: percpu: Specialise set_my_cpu_offset()
 for the primary CPU
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

> set_my_cpu_offset() is only called from smp_prepare_boot_cpu() which
> runs once on the primary CPU and before alternatives have been applied.
>
> Rework the function so that it operates only on the boot CPU offset,
> drop the unused alternative code sequence and internalise it into smp.c
> alongside its only caller.
>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


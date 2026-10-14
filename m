Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C387CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnC5HCu6Fv9bI+FYECKXEgB2Jb++sTIm82VofegOFek=; b=r4Wf+KqAWyHirg04+BsN2Bg29W
	lghmCO1PF0iX1W0kkdLZJ0bc1mqkCPUklQ4EXGj5wI/we0xid5HtKNZMWxDsTNH8gui3uPjV3Bwx2
	0EiN676wh6ZjI2+tEPd4REZFVie4OHn6g0W7aXsvHLd6MZgt2KXA07l7bJsmE2/HEPXJOKZcumhZG
	ZqW6QuSDtqgxJreEa4qNCWiCYguxjRXDRytFmacf0A24DmEb90YX6xorzRbCk5xbFk/B5Du2+NhOJ
	2BpD2rKSmx/MvLBfpT3wncSkQl06ew9KH3AlQ6qwhBkK71F/r19DiqSjnzUnCnbKNTcmdhQwstJdY
	jD1dcuSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvk0-0000000F8ya-3lkl;
	Wed, 14 Oct 2026 09:57:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvjx-0000000F8xp-02DI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:57:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 29AFA6022C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 09:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74FA1F0089A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 09:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791971859;
	bh=bnC5HCu6Fv9bI+FYECKXEgB2Jb++sTIm82VofegOFek=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WhGYToyp7quWbsAOAQJtsKXFIbz79+wVriYt5Zi5GdmnbpfzyCbwWsag+QSNOVVi4
	 37hBe7akAFxgm1T2ZFd+7AxrfQROIJZjW1mnrV7wZAzwuvPg7RuRJZJDN3ziVsVkqa
	 JHRKDI1CvOywcka8xgG2utdaXq+Os/3FK6pgnQJEnTgvNIXzcX/odWDkW/lGhEUUKi
	 UF/Ex7bPlNWdU66iuGqdoJAAmf+RaRmcIRjAZsiHsNI4FiuH0N9tPZqM5xCYwy2mo8
	 OCLbb1gNuBt8F8CQt5NawZ5AH4PFqNDQUYAXXmVf4UojJj3F5g1t2YhQwYb7VoHk+B
	 jo0i8iMGe7VWw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bad794b197so4186830e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 02:57:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxYFp8nMS+jY1Bg0od0DOYN9A8Z54auB9ttDMTGU+mqUYrkF2gaLyXW2d3IYNhRuOAtOdB7xoBlW1ckFS0rtRf0@lists.infradead.org
X-Gm-Message-State: AFq9FYLJoS2Xk/LtSL/jGgsEq0xtvtWdue9YTeVjEOJRiyU+fLqYI0Gi
	SejntIDRZnfa+91G2H306cCmQEEZtrAXnAVdFZViQktnLq8XTleddKv6oTFRBiC5PuqX/oj43JA
	yvUlVHnKzu4o/xi3upAfyjr5b5lOzoaI=
X-Received: by 2002:a05:6512:3e22:b0:5b8:f1d8:7ce4 with SMTP id
 2adb3069b0e04-5bcde6bb58fmr5113230e87.12.1791971858651; Wed, 14 Oct 2026
 02:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260916-aarch64-clear-pages-c-v2-1-0393769f7912@kernel.org>
 <aqq1sxdQNZ93oV9A@LeoBrasDK> <aqq7oZzutLP82WYB@LeoBrasDK> <arP619hd9Rx8Vlrx@arm.com>
 <ec298ee5-5080-494d-b735-7ba7bd20cdf0@arm.com> <as4sY3Eq-B_59lW9@arm.com>
 <CAD++jLmMoD_FPno2Q47WyWicpRaf8x46YREt0eyUzAXkOU5cFA@mail.gmail.com> <as9FRpnL7851aTVj@arm.com>
In-Reply-To: <as9FRpnL7851aTVj@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 11:57:25 +0200
X-Gmail-Original-Message-ID: <CAD++jLk3k9WErpwOC7c654nieSOVaawNKUxRWtu2wbHz-J943w@mail.gmail.com>
X-Gm-Features: AclHuK-o28Ze4TG6AkXgZ438sQ2zDkoV31u7LInsppRnghwUH_vXr243YJqhsko
Message-ID: <CAD++jLk3k9WErpwOC7c654nieSOVaawNKUxRWtu2wbHz-J943w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: clear_page[s] using memset
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>, Leonardo Bras <leo.bras@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
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

On Wed, Oct 14, 2026 at 11:03=E2=80=AFAM Catalin Marinas
<catalin.marinas@arm.com> wrote:
> On Tue, Oct 13, 2026 at 06:28:54PM +0200, Linus Walleij wrote:

> > That almost sounds like an Acked-by if Usama can confirm your
> > assumptions above!
>
> It's queued but we can revert it if it shows real regression.

Thanks Catalin, holding my breath that this will work,
once it is solid I will do arch generalization.

Yours,
Linus Walleij


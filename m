Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D62CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fl5I1QV2eV1xWfYcij/eLCiR69UEs6OwINAi4wPHZ40=; b=Xa174ZWCDlSGuw
	tgMAUpAeHYlkIeZHE0A36BKljTAoSyRYf4yKE4yeAl/Gp2YhpONBucrjv93wtFFXaG379x6E+T6k4
	aFZCEG5lJbSTXyWL8K7XwePrNhgj7+tVSYAmmhH4CVLCliOk1CRUyQXPJg0cVDpwxzrCe5hXbKe5S
	rzt0uDAFYICESXeTAd13DHzH/Us1q1ijWK+7fRWMgcfr/wrt5eq6TmcgQiw8KqyUXdy8ONx4tfqie
	R75p3qwZQ2V0bTRTewuqyGhwgtSYlGeWkVe8ofzgrsaZrFxepruVNXKaGZrJxjgDyJGvdTbg6kIKa
	5F1YUnbhXKAPSbML7vkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1gY-00000007Ehc-1T96;
	Wed, 30 Sep 2026 21:17:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1gX-00000007EhV-1Fe6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:17:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F28960219
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216231F0089E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790803072;
	bh=fl5I1QV2eV1xWfYcij/eLCiR69UEs6OwINAi4wPHZ40=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MMXfO6BWn8bUWVdo0p3wi5ktdVKnFBqkJG/xMETceD1Ee58UNPFbHOodgJQo0JdQ7
	 i02bUnW/+FTf9s05fgxGwILL8QJtDwZmiCwAGkmzi9b/iZ+5kQPJxBsVGMYdHvHdOj
	 9fqG50EUA/44HThnQy6BX2F+xNsV0igLE+P6gbhIDxP56pTFptPqHmCp5wvOkqykoq
	 Emq+wP3ATXstsoayyVNjFZwAJEy1pCRBe9gzIFIZOio7LffvLhQXw4Ke4itdTzp/Fq
	 LZdGocmzEqYa1D/KEWZe0SchgBLyS2gL8+4X8whKrvj02n62N7vF0uXSIkRdsLHmDe
	 ApeXqVqVPo+qg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8ea203e5bso4980989e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 14:17:52 -0700 (PDT)
X-Gm-Message-State: AFq9FYI0+47LJXHwwBHPEo0A0dXwvQPd7mseagEBACrPDc7VcwpnFElg
	ROiLBH3jXYMXxZlSNCHbX8uS87qJfW2warfhOwwYxJmiEnuslaBzAkqyDTBfL/TQ1w4VzNoW3g8
	g0S8z49kcXHefLXC2vc0UqGnlUy7oiKM=
X-Received: by 2002:a05:6512:2553:b0:5ba:3339:6f6b with SMTP id
 2adb3069b0e04-5ba405ea599mr830481e87.20.1790803070880; Wed, 30 Sep 2026
 14:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-17-will@kernel.org>
In-Reply-To: <20260918161407.2300-17-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:17:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLmyeK_ofduD6fTqSDxBMn6Uw4RcqLzWrVAxHBFfrNi89A@mail.gmail.com>
X-Gm-Features: AclHuK-Ykzjqcpqr2_CBUXShzMhAuD7nlzJPuK2IKAyiJBm7WI7lbLkuW_lz0QA
Message-ID: <CAD++jLmyeK_ofduD6fTqSDxBMn6Uw4RcqLzWrVAxHBFfrNi89A@mail.gmail.com>
Subject: Re: [PATCH v2 16/21] arm64: entry: Implement EL1t exception handlers
 for overflow stack
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

On Fri, Sep 18, 2026 at 6:15=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> In preparation for using EL1t to handle exceptions taken whilst running
> on the overflow stack, implement some simple wrappers around the EL1h
> handlers which perform a best-effort stack overflow check before
> proceeding.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

In the commit message, say something about the fact that EL1t handlers
architecturally use the stack pointer from SP_EL0 which we
have now started to repurpose for the kernel-internal overflow stack
and not EL0 (as the name says) at all, and handlers here will
by definition be running on the kernel overflow stack, so people
understand what is going on here.

If I understood it right:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


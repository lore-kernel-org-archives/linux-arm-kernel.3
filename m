Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677A8CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VMKZt394y8sP1XgH0k84NUhUZKk8kLGCbV/208seKvk=; b=Qtqsg8zqTF1AWf
	uIQo8oPESK9JVT6x9Cys7wiyRvW6/dS1zgvrxGdYJLERCK+epKpiu3ZVsIrLKmKpmqGEa2owDqsx/
	ZvDI6PkxR3Hv8bZos2SesDeuKfbpA/Fgfy0sXatGG9ZboXcwtSl6D3l+6DvSbPqEdD6031nf71tkl
	fKKYRUG/RkLuK58R9Taxgt8X57htv+aZfp5EaTB9jn42NHQZzPBWRALveuU88J3f4MxOxewGnElEt
	apAvvzW9xlQ0xrRM67pVZLVoqw7sihibl7qTXBo/K6HWvv3UxI0JZ+bildKLmtr91dZi4WAJq0A1K
	PPj9KlUUxduQBoHBILfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1pM-00000007Fdx-2mSI;
	Wed, 30 Sep 2026 21:27:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1pL-00000007Fdq-2bh3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:26:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B35086021A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4491F008A0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790803618;
	bh=VMKZt394y8sP1XgH0k84NUhUZKk8kLGCbV/208seKvk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EfO4pXsSxl5zQ3uCou04oyizWVBuJikn3CALCL/Sj5ocpFMiFJg7PqM+IYZV25ceA
	 UiCCvJ7kghaZWUNN5iuFI9cyXK4znmZk1nOWkFN0cK5HdbwO9qpzY2ERggSAO88cnm
	 vhI/lhlLsUcFgxXTePMOwE8LHGs1jDIG1WEYbv8UfRciFlpBlR+vPE4awQ0ZJk4mPS
	 gREIXc4X8pwCy0Pf2Cz+eE+cLUgYJOcfpWUk+ypYssumVoiWEOStgp2xSwldBOsWWt
	 z3H/T0MxOicHsueFLTWwk7p5vqNPxJRvldLqpSLHACvsBudRZlzvm5nYywgWAVoscA
	 oEpGAA19Q/fNg==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a76cedd9baso18503411fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 14:26:58 -0700 (PDT)
X-Gm-Message-State: AFq9FYJB98VLxzqTUljc798o18EPF8nh4zLAX1IzvHmpQHJQo4NNv8in
	qOrQ1JTt61wxgyZOEyEbKflB6dzUgKDBaPPACKF7CZ2sreVpvZDATiktPE/gyZ8vhgjRsG4Ek1Y
	HIfpLw2emWmj+S5pzZpxhdeMKozMfkrI=
X-Received: by 2002:a2e:be8c:0:b0:3a4:9e40:d7fb with SMTP id
 38308e7fff4ca-3a7791db80emr8128511fa.7.1790803617088; Wed, 30 Sep 2026
 14:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-19-will@kernel.org>
In-Reply-To: <20260918161407.2300-19-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:26:45 +0200
X-Gmail-Original-Message-ID: <CAD++jL=fFuH9dihJemKbD3b3ePbskAzMOjveAXvU-+F76hG35A@mail.gmail.com>
X-Gm-Features: AclHuK_U3gm46pGm8iBpRhWkJLq4kh7lrH5qaZAMF8hLT7PfyguaNDEGWOLAB7I
Message-ID: <CAD++jL=fFuH9dihJemKbD3b3ePbskAzMOjveAXvU-+F76hG35A@mail.gmail.com>
Subject: Re: [PATCH v2 18/21] arm64: entry: Split up kernel_ventry macro into
 separate helper macros
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

> Handling entry from EL0, EL1h and EL1t in the 'kernel_ventry' assembly
> macro is getting a bit unwieldy as the control flow becomes increasingly
> dependent on the macro arguments.
>
> Split 'kernel_ventry' into three leaf helper macros for EL0, EL1h and
> EL1t, which are then dispatched by simple wrappers.
>
> Signed-off-by: Will Deacon <will@kernel.org>

I agree with this change, this is easier to read and understand.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


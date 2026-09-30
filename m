Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C8BCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NnElHm8Q6l/bSL8TEHAw6Ax2AIHtYbElSbr4X4CfGgE=; b=V2lsjpRsU5YxnJ
	eiA4i7qNafvh2JckeMb8TWzHzrEaVqADGfw+AJmYpDDD5d5wdFgLUfePGeI45hga4yiMFcuG3y3bN
	3lJb/fS9HCGt0lBThpqKTdE0JUbv3gU8XUgHmx3utpNGh9yu0iM87NkqG5aQrVV8pP7QxWXp7pKmk
	fONfR5OprEVj3l4xDqRINP6N4++nebMukPRhM4HwuTbc5D3XqI9CrYBDRIZ6+EuhudJdOW1fBdL98
	MtrN7j/ebYNhI0/ghmqN1uPgvI2lCC5IzgoGjmiUsEIYXM7wOnn+AZHtxZNPDPUnWUabGRYu98r0y
	9165+d1pl9p/WotkyCfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1Ua-00000007EBQ-1Bkk;
	Wed, 30 Sep 2026 21:05:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1UZ-00000007EBJ-2eRw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:05:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B1A144247
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1E61F008A2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790802330;
	bh=NnElHm8Q6l/bSL8TEHAw6Ax2AIHtYbElSbr4X4CfGgE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cbXsixIz22YnxWg62ghrtkjUOdJLcgXnVpmTb8z8xTtrRaGU0y8whehPZXe8vj6X+
	 h2xrH3L5dnfvooQGig+P+kWLSYPD0JABXTcQePkc4P/DyMZdccK54iAC3blvx9yk/B
	 4sogQcidA1KhHDlnvcw6Rk5jsUdiJGE9rTktUXcVl0Dx5DakSwF5oKNpIlayGT6kwL
	 qPALo/Sj7rOktyRrSHneGTHi6meezj13osm4SX325c7HrNzHMWKZreVT9C5p52Qjw8
	 QmHm5qo6ty2MnpuxxqVoi5T++9LUhjtnWEYwulsGO3mJXDVPf+AqK9ASPFlio3a92d
	 EsBOvbRPRUAcw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba379d8804so1865675e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 14:05:30 -0700 (PDT)
X-Gm-Message-State: AFq9FYKOTWKQj2oaFq3byg9j7JFzJAi2FdwgSg1iVW/83EsWPkLQiyhg
	MtdJM3UOaRXV6N16dG4vLwjj6JkM4PRT++QizrsHQGy3euOE/mds5lP0jqv7cDUJRVXp4MOU8yn
	B95suxXQDetlQ6aaDKmhEDuxBkgYkL/U=
X-Received: by 2002:a05:6512:244f:b0:5ba:4372:9250 with SMTP id
 2adb3069b0e04-5ba4372938emr211234e87.4.1790802329621; Wed, 30 Sep 2026
 14:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-12-will@kernel.org>
In-Reply-To: <20260918161407.2300-12-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:05:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLn4Wr+WqQkRweiVa-w-P_U0pMUeQznDWy_h=62FhOJXag@mail.gmail.com>
X-Gm-Features: AclHuK_03X4xHg6tnkdKzchIyjnd1uMf9JvGEWQecl5CNy_dFoxGynGup1si1S0
Message-ID: <CAD++jLn4Wr+WqQkRweiVa-w-P_U0pMUeQznDWy_h=62FhOJXag@mail.gmail.com>
Subject: Re: [PATCH v2 11/21] arm64: percpu: Annotate __kern_my_cpu_offset()
 as '__always_inline'
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

> Allow the use of per-cpu variables from noinstr functions by marking
> __kern_my_cpu_offset() as '__always_inline'. This will later be relied
> upon to detect stack overflow of the overflow stack from noinstr C code.
>
> Signed-off-by: Will Deacon <will@kernel.org>


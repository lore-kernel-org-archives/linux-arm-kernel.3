Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC70CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 20:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AlJQFznlbkoz2NB5Wpaexda128WQ5QBQu/v0eHnZs6Y=; b=vWKXfik+ttQsOZ
	pwG1Zxwu9z2gJoaMmWFUM7cw4l7PjH0deEZI5FpVrPurU3Eig60617kADPcfP1S1kztNDaLWUBhzD
	SR/m1y+6NuErIqJtZajjX/nbQ2ykXTFmaONkh4mRHPdDDNGVOYo4gEzIQf9g4vyU+ZKSCpc/h6hqD
	1B3nWPbxXfMwVldNoCjUd+XDPESnu20ZwDGfEYafKShNe+vS/0OL96TPMnpdMuAyhtc1MUDscySb+
	zaLSzb3AVLLWHnIAgoJzpBagrlcTnGqg2d+ti6dF2ItnZXzAjWagLn4YeAnd221RCBIfMIFHdyA6k
	hHY8XscRXKwNAxjAtjPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1Io-00000007Chq-2s9c;
	Wed, 30 Sep 2026 20:53:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1Im-00000007Chf-2oEY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 20:53:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A42043FB4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0841F008A2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790801600;
	bh=AlJQFznlbkoz2NB5Wpaexda128WQ5QBQu/v0eHnZs6Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZtBEvKwmUn7TWxMEhqhvRdN32tdEy9lXnwGqrfnK03VuNd0qRy6HtGXUp+u29j2Fc
	 rApN+rKS/oajeXn3zQOy9u8keQ0xrZFCh7oQGVmSaPlpSQle4DBXNGk/BUNdAJuH4d
	 ejQ9yY6LVRt0+QjfwuHlvvj7Y+1yie1DAXmMUoVKmoUgAUNkR1m3bPW5IMK/I/AYcG
	 MjMFspD5I747wR7+/T6p6nwmLTA9wZOVsdo4pBJlJp45MmyNXVle4Wb2cnQR2hbr6r
	 d8YCIvrkVNiOuL5Ho+YTL+4Pn3xKOyjgKR8e6C4BeNfleRAJMppZ+RW5ri3j9d9MCg
	 whnVI9i1M/+UQ==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a75ff20a6eso28113991fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:53:19 -0700 (PDT)
X-Gm-Message-State: AFq9FYLJa8UXYYQ9iZwkNZzf5G2Hd2psaohaRLSdXH4h7sJnW90HwtvK
	j2FfZUy3fNlVPoogxOH5U37tdhdYbPI1ivKbzNsLvUI7M1sLkHshClEILCe5U8B2nTMmff+8KdN
	ndLSxVO+iHk87FEhQ9AqjxB817EdZy5Q=
X-Received: by 2002:a05:6512:3090:b0:5ba:4185:4bf9 with SMTP id
 2adb3069b0e04-5ba41854c7emr882318e87.27.1790801598673; Wed, 30 Sep 2026
 13:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-5-will@kernel.org>
In-Reply-To: <20260918161407.2300-5-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 22:53:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLn2oBCCaL_g2kMBC95eakycqqVhUbgPRBDjfFOqQuWgOQ@mail.gmail.com>
X-Gm-Features: AclHuK9IG9N4XO277gRjxi0xMHrF-zX5RSGpnkGUAhr9NCtSwx9DQDyHNN47ev8
Message-ID: <CAD++jLn2oBCCaL_g2kMBC95eakycqqVhUbgPRBDjfFOqQuWgOQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/21] arm64: bpf: Add support for generating reads of TPIDRRO_EL0
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

> In preparation for storing 'current' in TPIDRRO_EL0, add support for the
> instruction encoding of "MRS Rt, TPIDRRO_EL0" to the BPF JIT.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Add to the commit message something like, "so that BPF programs
can get a pointer to current."?
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


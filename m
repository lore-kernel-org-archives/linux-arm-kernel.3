Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE1DCC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 16:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2U9zEpn0AXs6lLEm2UZzitB8Wqsn/VzGaFG21nyW/jM=; b=k7vkBFeG7Fr8WdvW7+/VSDcXXS
	4t/YrP8eoddPmrbNu65Nv7Z5NjuAIrJl88VA8LPQ4SbP5ebfYbfE6UXcgYDOQ86EcfuCeNkTg4qIu
	MTh641JfBKWbY+ttbFY70IMmMOOEV3DHwrG47VYGncxEZ2Fk5s5Tqm1Q9ZTrb33ramc8nTkE/d4yU
	qeBaFAY07zinoc+5L9jlgEgwmAqb87BdXW4yni4eJ6A68a3/HSTKZBqtLz0oxpJHsZFwU4bX7JOhk
	Asa+MHzWh6r6vUEtn4jArFV4ZnkWBCOXKsqya3/6BJkH8/gy80swUq3saHgO/u/TFCtmUtAC3xVT8
	2TJwWGUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfNI-0000000DVgn-2iBl;
	Tue, 13 Oct 2026 16:29:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfNE-0000000DVg6-1D8h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 16:29:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 11D5943B16
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 16:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEAE1F0089B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791908948;
	bh=2U9zEpn0AXs6lLEm2UZzitB8Wqsn/VzGaFG21nyW/jM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=G88GzSsSLiWNKquPlzAHeFBjBy2NR5FgCHZF+eAh/FPkIbMI/QXISs24N11QXg4cx
	 R05Lr/fW5YgI22LtJIRFEQ2qMhjOSAawm6E+dlxLwTHcGgrKwh/WDavmWlUSL9Edhs
	 T4tz0aCxvL3SdAt/rUFwW+V2hMedq/CnKM55J8AKlqdk6NUOVqvQhiHT8SV1CBFYPf
	 0ZlQdnmidPLol2kXg1FxfP7AXNHaNt0Ed5xLmC4nfndeZI9ZlB6Ad32P6Yez769S0j
	 gwebXvukwV+iZ58qfWUJByZVG1U2JIlZgrrg50yuavQhlebgJVGlcVNCh4Hwh95uBO
	 UHW64i38EPdHQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso69531e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:29:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByQEOPZlFAKz055pT0Iw6WY7UREMhiFGtBrgVSlfmzMnwi2s7ZFc4EqMjz9oCbpAnpFWhBSXiYiz8hVsaL7XdVR@lists.infradead.org
X-Gm-Message-State: AFq9FYJVRyOJQj/d3I7WTKNFWAvaAVSttL5YBdzH+eQw4cNYqdIntuM0
	qCSMmJQwb5q09rcnsl3a6GIepy5yVf8w28abcFMvJIUxhQSNShIIizMk12q6nlCpoOwOis3VwiP
	Hk+ASJiBFFQ0rIglHQq/y8j0p9QBNitU=
X-Received: by 2002:a05:6512:3d94:b0:5b4:af24:3612 with SMTP id
 2adb3069b0e04-5bcdd509e2bmr4521635e87.20.1791908946678; Tue, 13 Oct 2026
 09:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260916-aarch64-clear-pages-c-v2-1-0393769f7912@kernel.org>
 <aqq1sxdQNZ93oV9A@LeoBrasDK> <aqq7oZzutLP82WYB@LeoBrasDK> <arP619hd9Rx8Vlrx@arm.com>
 <ec298ee5-5080-494d-b735-7ba7bd20cdf0@arm.com> <as4sY3Eq-B_59lW9@arm.com>
In-Reply-To: <as4sY3Eq-B_59lW9@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 13 Oct 2026 18:28:54 +0200
X-Gmail-Original-Message-ID: <CAD++jLmMoD_FPno2Q47WyWicpRaf8x46YREt0eyUzAXkOU5cFA@mail.gmail.com>
X-Gm-Features: AclHuK_FYdXBkzOaQUWuxycJBffBsmxf6yQ-hSZTX0gPejiYwMWk2Xc7z3lDJUY
Message-ID: <CAD++jLmMoD_FPno2Q47WyWicpRaf8x46YREt0eyUzAXkOU5cFA@mail.gmail.com>
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

On Tue, Oct 13, 2026 at 3:04=E2=80=AFPM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:

> Trying to make sense of the above. So based on -next of 22nd of
> September, the table means:
>
> vanilla         - next/master on that day (current clear_page())
> patch           - memset()-based clear_page() patch (Linus's patch)
> stnp            - vanilla clear_page() without DC ZVA
> patch_stp       - memset()-based clear_page() patch without DC ZVA
>
> I assume the vanilla vs patch columns are just noise. Well, there's a
> -1.17% regression (not flagged) on Ampere but what's the standard
> deviation for this column? Similarly for the -1.15% on the AWS patch_stp
> test (vs stnp in the same test, it's no worse).
>
> Vanilla vs stnp shows a regression on Ampere, however that's expected as
> we no longer do the DC ZVA. Interestingly, the patch_stp result doesn't h=
ave
> this regression, so I reckon DC ZVA behaves mostly in line with STP on
> this hardware.
>
> Basically I was looking for the stnp vs patch_stp results. If I read it
> correctly, there's no significant change going from non-temporal to
> temporal stores (and a small improvement for Ampere). Assuming future
> FEAT_MOPS will have similar behaviour, moving clear_page() to memset()
> shouldn't cause any regressions. Before FEAT_MOPS, we'll use DC ZVA here
> anyway.

That almost sounds like an Acked-by if Usama can confirm your
assumptions above!

Yours,
Linus Walleij


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE7BCC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 05:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCA5ygrhxhhkIA05plaRNBxJfo5PazKMU7keUhXUWVQ=; b=16KJc+LXPwv8HgRaS54wJjf1Hl
	btYV7szD3vwVne5yqFOoZ7+PapUW23e3/+HvGee8NNqLr5qEtZtK4D09POdjg/EioK4GYVPEk9n0m
	S7tquXkV7crH/TFadXqWiUh5fLtqUhfhmFoYGfGBYFeUz+tevJEO8noEvytpj7djgIeM4gCzsRfLH
	U0U3PeGzZjWYwzgVm39hxyptt4OaILHUxeGgBVN482PlTuXH6vsOHWNFjaFvot9CBQAYhZZBZGG56
	zWF+vuw6FcjVI0vmBQLMLtZ1EK99jzPEZtnB7LLiZ12x+2XDPOU6StMrNxqf97g8R3bNhREudDllk
	Qautf3vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHDus-0000000Gqu7-39Pn;
	Thu, 15 Oct 2026 05:22:10 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHDur-0000000Gqtl-0Jym
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 05:22:10 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-81ba09a5d23so1212320a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 22:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792041728; cv=none;
        d=google.com; s=arc-20260327;
        b=T+DLLn3bFXzHgvL3kb33SsHE+wPeC46bFUHgD6qOI7ryKpYmtI+IRQey8J8FSafRcv
         wu8z+Eyg8NGL5mow6n0QWH1w840YKXcuRbA8KHNIRVZaBIaN92VqzkcCAXz3rIYGuZ+a
         gxLJHylAro2SROCHyP2G76Ec7YWzCo0Zqyn35BTNFUS0vwx0xWCh+oV727SfNffnSa+M
         juQ7lul+A5Jwx2AQgRBFsDPMnyMFxnWACT47lqUDUH/VzeoQyyQxN3XCOGxvUGRwHX49
         Ef8isTmEmFbLfgQ4bzZ/KfRE57z4uSXtQsE5OemMf4LH7s6rrEhpbPOcHA+uUqyYTImA
         VaIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=LCA5ygrhxhhkIA05plaRNBxJfo5PazKMU7keUhXUWVQ=;
        fh=L9ZTefxKXux88NsmXzHnHMYhB4P6QxvibajSHYNnRK0=;
        b=pqt/LYqhsbrNYXKGhrht2fDdVI9p0LEsV+24Y3nUum/WCoJUC+2VyJWUo9arAHLCZu
         BKjjnvP2p59RLSzdHO4gyz9fusklS+IaDwgnBxoctGePYJBffhp0HBBHTtujF5DJBCVs
         /ccfWe9/w0UgD85J5o5aoERrD6+V2cGoDFaCqXh3rhsZq4aFmY880p7QMD9bvVVZYI9Q
         OO8q8U6RPfoB8VYB+nfx0mIjoCT+2z5pAcJISOwfhbH9TbTX5wlLAJxgj2eFrPpBSWqV
         8/dLHrnH4B6G8LSNtHk1NEqN2RuQtiZU6FTU3Z/87x26hR8BXPhjUVDeWRQnw5F5u8zQ
         AUBQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trukhin.com; s=google; t=1792041728; x=1792646528; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCA5ygrhxhhkIA05plaRNBxJfo5PazKMU7keUhXUWVQ=;
        b=fuRF+BeHKlW5ihXu1++5f0Htly4Na0JzVue2SIVsg8MvZJOSYT5WLCFjyX5zAQ1g0k
         XYHRbxJG0qe9uswyDgMJgFM6s6I9JPzKrPVkP7eCDXMTLrbDqWkxCa2dHSyYseiOwUWu
         Jd6qRf7Llu7dcVebkGbzi9YNQAdMMl+DP7XsW8wmtBDrd0G9GQ+OLZu+fpgVsKPi4VgJ
         vM+aIyF3FDb9qB3EYYTKj+McHUJFbuhge9PGymH0HvGrUGxlBAZsdK2UmZeMDMc/dqeG
         Tu3QgYbHZgjBuSadTFAwRBsTEUmOmEqXpVNaqUIyg0peEWAHM0A/RBYh2Q6Tnn7UJVLI
         PC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041728; x=1792646528;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCA5ygrhxhhkIA05plaRNBxJfo5PazKMU7keUhXUWVQ=;
        b=xKWYerqem4PsfxlrocSqY56vRGkISCtAki8dTztdQR/6Tqdloif0wngR2z3Llc8o/B
         fYa/9khWq/3PoX+piQY9mZSgV+eiOyRWfqtF7AFtYXC5ZX8c0FfqhiqyZCRNvFV0nTEC
         E2zcxOMMokWa9HSjnidE9lyhaDerCHlZPMQPZKKHmRi9QldDaz+Qq3/x1/wN+yrbhwRP
         6Vdf5dSCSqstDbYg2N6Bn8JLJFXX+JwB17LLl4yu2+l1oSr+pA9VhBwEhErdepCH46ma
         szQUgb1dCBd9vVk0IhEmmJVx5WQjw0+5AoUcUOxSt0uc+vmSV3uMfLebp9UgxFEdpt0h
         b/GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJWwrBv1mMK9OWiwzEyrFDqRN1BTFCc4CuGBjd2HN/K5oui8GpxHob2LxPr2MzBOyV9xgZIwpG1zKmw4T5Rkd8@lists.infradead.org
X-Gm-Message-State: AFq9FYJhVzv4rVo85fLhkpIPEiob7pVM6KO0CY/+kxSSFgdH+BMvsTcN
	632H0UF1g4s4tBf0+lZmcoYedkDj4GoRcPH0PwC72rM+DZG1lVNs/HxkRxJz4psZswEgljPSOqq
	FxEqAVlsAFml4Xl3AehOsJMlnPwvFOiISpqhFznTEkg==
X-Gm-Gg: AYBFou302ehymC2ZIMWjxE90nlPIItE8hgKSp6wxO5FznCh8lUuWKs4J/YWqWoa+PJh
	lMGPfYc82b9yA3IJjrQKUy3jqq5nytmNKmtDwJob2P7vUmi21UyXQSf4H5Pv68exLuWL40NLaMh
	0cwxZbDboohz9kVqGZb57xLFANWuwZWj4WDEK+RjcVuGcG1Y72gGX/XsRhcLPXYZ0NM27YZPa9d
	B8b7QpAfwymQuul5UHeLQidsZeDIaPxuS2BRhGBFutBX9WQDSf9AMmRmUcgLaAclGHPMsFolK6J
	bsf98Wqukp2a68hIJLfdL6pm/AODVd2pEOQr0wErL+MKt3qsyOUWPrT3LZHY3f6eDzyY3t1apFh
	jJMte1uj6l27VuvqNAh+Zz6A=
X-Received: by 2002:a05:6808:50a3:b0:4e6:a21a:8c38 with SMTP id
 5614622812f47-50c53c90338mr16422275b6e.39.1792041727716; Wed, 14 Oct 2026
 22:22:07 -0700 (PDT)
Received: from 121308794542 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 22:22:07 -0700
Received: from 121308794542 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 22:22:07 -0700
From: Iurii Trukhin <yuri@trukhin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <x4iu6sii7fsxksdfur3wcpu4kb63eubsp5d6pzklxuhta7xtj7@rskyoy7ajncj>
References: <CAOx7e9Jm0N9O_ndL1UApMPrXUN=P4RiptSNibdDP+9prUsNPOw@mail.gmail.com>
 <x4iu6sii7fsxksdfur3wcpu4kb63eubsp5d6pzklxuhta7xtj7@rskyoy7ajncj>
MIME-Version: 1.0
Date: Wed, 14 Oct 2026 22:22:07 -0700
X-Gm-Features: AclHuK_bFzbfGIRxfiHxQRAWNh28jgXvMZCZ8XCr7vR2oiT7mhNNzw5OJD91xM8
Message-ID: <CAOx7e9LcNFVS8K4bBngeYEpJTXFwADA+xgw6f8r6Lh2ms-3u=A@mail.gmail.com>
Subject: Re: [PATCH] arm64: raise default ARCH_MMAP_RND_BITS for 48-bit and
 52-bit VA
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Kees Cook <kees@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Iurii Trukhin <yuri@trukhin.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_222209_135282_5002A98F 
X-CRM114-Status: UNSURE (   6.61  )
X-CRM114-Notice: Please train this message.
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

On Thu, Oct 15, 2026 at 10:25:49AM +0530, Anshuman Khandual wrote:
> ARCH_MMAP_RND_BITS_MIN still gets used when VA_BITS != 48 or 52. But this seems
> like a subtle detail. Just wondering - should a comment explaining this default
> random bits fallback sequence be added here as well ?

Agreed, since arch/Kconfig includes arch/$(SRCARCH)/Kconfig before
defining the generic config ARCH_MMAP_RND_BITS entry, the fallback to
default ARCH_MMAP_RND_BITS_MIN in arch/Kconfig is not obvious when
reading arch/arm64/Kconfig on its own.

I will send a v2 adding a comment right above config ARCH_MMAP_RND_BITS
to make that fallback sequence explicit.

Thanks,
Iurii


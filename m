Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3041AE82CDE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 06:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9RHKB2GEF2U8oI5vAdfaKS+jel0CVbWQwZfBlzoOfk=; b=Ew3oAjHMwOjK2f/sHW+LBlLaVm
	ylcf7GBn+Hlifx/1InjDe4emloAxg3R/UrZibTPEC7ljoFFlLkSEMMsUuqLmhQ0B07DDJqgOiyXUG
	IE1Spgs9Q+tOr6RTRluEXeWKcotxvuk30OfO9h73G3hOWVEi9FFdC0ag4pgh6FtYwr9dok3ARnGYz
	2pw8Ya1ltNFQ6eWWsNVNKFZ/YCDqUYaWdnDe7fwyhgepqlwwMZBlXg5x2f6hSAdK1kiCDR27SfYcE
	LfhPwwggNiXRTVH2GnSFZJD7PJU0yXvughLbxcXhu4TdxuJxV9q0ZN2vjX5ERuDWkCQdsvE2wGs1B
	+h+zxoYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ1h6-00000000yNX-1x70;
	Fri, 26 Dec 2025 06:53:00 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ1h3-00000000yN8-2wKC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 06:52:59 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-8888546d570so100699196d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 22:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766731976; x=1767336776; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9RHKB2GEF2U8oI5vAdfaKS+jel0CVbWQwZfBlzoOfk=;
        b=g1ELrNb9U3mOlFFRJGZ9nr900SMs2ITckJQSSpxUr2PE6BZcg8c98BdzMW2PkSqqqu
         FLjbf3F6fRTORL9KFv2gES72WdG04MlN7j197HrcIt97d8UvTnhnoXIWwWCRrCPTh5Xx
         aBnsKEpy9E/2zkv9aNeG0HFXNixe65YESgy90904zZptE75GzrRIw3nCg4tW4rBvwu79
         UddPn86NLoO7zEjq7CRYM/Bn7fMkhrQUgDDeeKDzMBVC88f2gv+AvtTIAUkDQMkyvxFy
         WLtmPXRNMQANXavawieRdzjdqKdE1ZD5J/RDAkFVCtC7a78koum5dlLEvImGbSLUeU0w
         6qZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766731976; x=1767336776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i9RHKB2GEF2U8oI5vAdfaKS+jel0CVbWQwZfBlzoOfk=;
        b=L08fCFfK3fhBF+bnhp/5yXqOrg2AqBvzOsTZ1anrRBqM1sHaewK78vpMIuKnerSO9U
         m1iX1xE6wGgxfLK96VdI7rixmCD6VgucbXpNsEn3uyYYEf8g4voXChmfUApig1L3yAOq
         bRlcTD+rMyib0VkQGA04oSfMdN/iTdmYz3k0b0BNKrjQwLX/MPg5egvlvn+B8MYMHtmx
         kg1i1ioc8vuOaCkwCAtnBcNSB/QSiSDT3kkRmumso5myghpP7PgNXEpDi8yPSnDNE8s3
         qs7wxNM14cUMx6fWhn3mD1nckJPN7HnsSInurjQX2gFa72XBBICV1KcL3C5DVwtjrMLR
         ohDA==
X-Forwarded-Encrypted: i=1; AJvYcCWu0RzxCNn/OfB1fh4LdG4viFdFrfxdUCjg3RAumtXZGmPTcHQODIEg9SKQByU+NII9jxQNU098oBqIx9waX72/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0mU7qj97Bg4U/Y/Wh7teV7iTGim2jFKNrC36WLPsQWn28EuPQ
	S26It2f5jRe4Gl6KMYSif+VzkVAqQmWdObJpMJTI5KxIt9XMW0IawpJfjYvsVmL8g96iN1ZIItJ
	GqU9cg5UgtOYZBVq0bURSYR4lZwWeF+4=
X-Gm-Gg: AY/fxX6rdxdPhYe7YdayNveAGlKnc5aZCChbSeZWPkJeZnaZM5fp8XkMvGThFMO1qgq
	Pl0dWNVdvGwqbcgyVK5WaTjUFP9PmElsl5gE7N/6BhU908phqdgj9BjpVg3oBoTxAMkzI+ehUIG
	GfWmqBTYu/wwFwQ7vZw5XV2p4zgZOviesdp+zK68MERqnnwQMdF9UslNOXadnPnuIgp8zmFmakC
	XDm9hjnEqcii3njy8H4oM1mHhRfSp5S7LjmYqg5oe/W+mJ1y9RbiIW0yaM9WLVLaJIcig==
X-Google-Smtp-Source: AGHT+IFlDNqlJeNNAKZJAHSPiv4dP0kX9mjlvFiLZnXpE4KiIeonx6Z/sxYtzN3esDafV7KJ0AIulTx3pnE1sviSYKI=
X-Received: by 2002:a05:6214:428e:b0:88a:3681:1d96 with SMTP id
 6a1803df08f44-88d881b984fmr335128226d6.63.1766731975810; Thu, 25 Dec 2025
 22:52:55 -0800 (PST)
MIME-Version: 1.0
References: <20251226063759.4020782-2-tongweilin@linux.alibaba.com>
In-Reply-To: <20251226063759.4020782-2-tongweilin@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 26 Dec 2025 19:52:44 +1300
X-Gm-Features: AQt7F2p_ZT6nhNcinPsVmT3d3EsF1wn1Bi7NYd_DWCOEpxgN0Li4iC6ciNGQu1A
Message-ID: <CAGsJ_4zd+SMa4Mj23tjF5OwsP3LQyvYTrwN4y81=k8FSFgbH3Q@mail.gmail.com>
Subject: Re: [RFC PATCH] arm64: Kconfig: enable ARCH_WANTS_THP_SWAP for all pagesizes
To: Weilin Tong <tongweilin@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, 
	baolin.wang@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_225257_764987_B3DBDD84 
X-CRM114-Status: GOOD (  17.21  )
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

On Fri, Dec 26, 2025 at 7:39=E2=80=AFPM Weilin Tong
<tongweilin@linux.alibaba.com> wrote:
>
> Currently, ARCH_WANTS_THP_SWAP was limited to 4K page size ARM64 kernels,=
 but
> large folios requiring swapping also exist in other page size configurati=
ons
> (e.g. 64K). Without this config, large folios in these kernels cannot be =
swapped
> out.
>
> Here we enable ARCH_WANTS_THP_SWAP for all ARM64 page sizes.

I no longer recall why this was not enabled for sizes other than
4 KB in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64"), but
it appears to be fine, and the swap cluster size should also be
more friendly to PMD alignment.


#ifdef CONFIG_THP_SWAP
#define SWAPFILE_CLUSTER        HPAGE_PMD_NR
#define swap_entry_order(order) (order)
#else
#define SWAPFILE_CLUSTER        256
#define swap_entry_order(order) 0
#endif

>
> Signed-off-by: Weilin Tong <tongweilin@linux.alibaba.com>
> ---
>  arch/arm64/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 93173f0a09c7..58f7b4405f81 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -120,7 +120,7 @@ config ARM64
>         select ARCH_WANT_LD_ORPHAN_WARN
>         select ARCH_WANTS_EXECMEM_LATE
>         select ARCH_WANTS_NO_INSTR
> -       select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
> +       select ARCH_WANTS_THP_SWAP
>         select ARCH_HAS_UBSAN
>         select ARM_AMBA
>         select ARM_ARCH_TIMER
> --
> 2.43.7

Thanks
Barry


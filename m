Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD778CA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 21:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKyjO6uz5lI4nCNYOIuplPGihZ8U3rsq+3xZ/QD0AP8=; b=L6YWAZfueHAWJehd+eZmHkPKXn
	sA6ozeTyTcKleGUTwgneEuytNTZfhaRGR//FcZENI11G+ICTIuIfESiQxS6Hsk9poBmjiXhuMRxkc
	0r2Tav3vU/gRXkhGEvP+VMsZOzdkTwPLirUS8LB/Ar+2nZzw6Lx+8PbystDAoVQT8yCXnzgENhmiu
	KW8qxCUEH1yxfza+3Uwfduy3wGvyUeznuq1QSud3sSq7mIwOOpKRpiyhAPfEcfFQhh9xq2DMFtJvN
	1jLlx5Ez1ybbaxssLKyrIllxOFv9QEoYYW34j8Zxm9m+l4iLuehkWAypFCHJQ5tXL9eSjQh5ql9Ks
	odC+FVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqCX-0000000HC6r-0ZYL;
	Mon, 05 Oct 2026 21:26:25 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqCU-0000000HC6G-2HEl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 21:26:23 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-533202fe429so59731cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 14:26:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791235580; cv=none;
        d=google.com; s=arc-20260327;
        b=sl8WggV0Dne5ozP1xxVdcqi7NglgKjHKv0UTwUoouiqVp97A1ajkC25zsvWFNPFlKV
         ezAUL0qBF+sHT0TphWiiHyPIhtANdbcUOh2wLzui67IabmLNSMqSoQO1P3yqMCjyG2Gt
         WQFpayarOqx6jDZTyAt2GBDkfgDvVsQ3bSvKk6ILDPWc/vO4Q3a66fhpVWE6EI0MkPJ2
         quaXV8Qo5njO0DOgzewrFgmze3Ygh9N1Bh81MInk8XaUHVM6B5pUWqXj90blSgb6H4Uj
         sXUhiBxu7XBW6/WXLeFuOQm5Obor/9qyYzbd07nty9d7nIYfe+6KkozWrZNpXxy2SZo+
         y8mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WKyjO6uz5lI4nCNYOIuplPGihZ8U3rsq+3xZ/QD0AP8=;
        fh=Q+HELB/vbjiS5dpWbzGA9RSJF7Wa/80OeHx9Agt2g5M=;
        b=ISzv6Jho8JHQLmtRv4tXueRj0bqifRHIQzW8y14qnWvWkrjoj4aEAb+wnOq70FnbdP
         it+z85RZZ17+9HttfxdUQmYWL/aOkCUYUF13R0ARubQ0iBPTi8/JNRz/3IGvD42y4iE+
         Wqjl0x5M2x1oLpAIjiEc4u0QZtzdcY3ZVLguaxkEvD1oQ29fShzhMswus99SJ/L0EY0r
         oMT/oAu28NoLIDo7jNGXcWiA6WIbnAudkVm5oPUpFIe76l+hOeN497/NQ03gxJ1gVoZD
         KdTCYdjVUy0oQvUgnB2CKeLAe+4NysGDu+v3/kBkZ+NBEDHhL7RnR2BCEEzwTVHn+8Ah
         DMHA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791235580; x=1791840380; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WKyjO6uz5lI4nCNYOIuplPGihZ8U3rsq+3xZ/QD0AP8=;
        b=VkTjZuW9nBBPhqTWesd4F/vmxPXtQ5ca74LmjTB8KPASlGR9YKcH+2PbK1hQ8H/XgF
         8ND6ZezIPgQZTNHykcUc45xE+L88yiW2D/15J/SOCkhp+RPWDdC+SjTvqphSvnkY7PEC
         s58gD5C3FTqeP7NO/++LGD1oEQu9pdJw5l/x7DnNS3XSx19QAPo/VMvZ4XQF2wJY5/hb
         AAxo0vKbGicZ4POUzZuQj9oHOmnHyzX1wjVXYNy+T5dzknhfGZQjh/CN7tcl3VlLzlb0
         c/oFEiUpsvD19JXeWsfAfMIvWAX8V3EW4EGZss+u+yd0zLM0w534Etl4n6k5UczWFQer
         Xbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791235580; x=1791840380;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WKyjO6uz5lI4nCNYOIuplPGihZ8U3rsq+3xZ/QD0AP8=;
        b=Wa0nPJUe+XNmGVgE/sYHg3yEJlB7qWnGfzKKkdXlvBqFxgb4PGIysyDMBf+BzSQw2I
         MpAwjLNbRxDz8Gr4sWMRvCwAxD465keY6vsfAy23nlGBUlhSO9zkn3mgRnS2pixPPFur
         fS7W3DaaxnYl0wdqZRvkDrwQ3EE2RbtEMFJpjO8BxslvXF2FvumGMUzEF4ppW0UDoHiR
         zCZftjDjJdFr+KlgZ4Sq1N5Kf576XatVc7GdMv3B4leu62l21yKRxs173HIxKHXvqX0y
         rwqlTbdFDmxUqVTb/w9ljYO4uCuNAXqgJB6KUAp7KIIW5DMmzduyLOyXEOo1Ckwp619A
         BkEg==
X-Forwarded-Encrypted: i=1; AKwUvBygQCA8KOrFJB3mpm2A1bK//9GHJeJVtzSpmPwrIgxpmMOqRtHOwuHx3eCYw83qDg7B1GI8oO25w8HWDcA16cS0@lists.infradead.org
X-Gm-Message-State: AFuF++loNtPOeIGGJ8vRIGvMcubtZw6U695+KG5wfj2OWAppfilXb2sE
	UTrsTCRz1xVnet8qp/7wcSFOgiu7EdxFmP+DV12yreAq1Yagx2xcTKt7sFydDs5DlKDiDc/7Ry6
	Bx8ypTPD2PJG8ypZYOxSgTu5Fr5aZbrc6sWsyL5un
X-Gm-Gg: AYBFou1fRhnJpp9IhovjZGVOpXB498Odre9REEKqVYbuZBcgQp26zt8H8U9RRkmly7U
	NOzP5Fn6QrVSkJS5LrkNYkOwvxx6pmbhZ4wCXO9bMj1che6meKlInTkU4zH19KpZCJ1EBqIFZE+
	1yMjGChApA5bGM6F7HDs0gbLua5nNIaJFDg5xJNE19sIAR02LfBpM4u5vPeqll1uYiznP7qmsK2
	5iB0AYmtlBkY/hw8pcbQayIc3SLh3kM0NIP2lTBvu+OIH9eS2pAs1sAY0B/KcUXMJQxs4FrYGs2
	LD93Bn9LVUpRwmCB9qOYcKHqJojvmBCYywqVd8bo4CxVfnT1Imlyd2Q+B60bC5WE
X-Received: by 2002:a05:622a:118f:b0:531:d8:e437 with SMTP id
 d75a77b69052e-5354229a448mr834721cf.7.1791235579527; Mon, 05 Oct 2026
 14:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20261004195027.227748-1-danielmentz@google.com> <92758f79-d5b7-4c15-a55d-6bea5f84a028@arm.com>
In-Reply-To: <92758f79-d5b7-4c15-a55d-6bea5f84a028@arm.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Mon, 5 Oct 2026 14:26:08 -0700
X-Gm-Features: AclHuK8Ya4qZUHEU4y2SIFN99XMdQR1xv1nuJUxB3fTt2xE4zcFS3toMd_5km7k
Message-ID: <CAE2F3rAJdC9pAqMKcXhxpw1keGzH_kQUNBoPHXjTP8+7TOhfwQ@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu-v3: Align memory attributes for
 SMMU-originated accesses
To: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, will@kernel.org, joro@8bytes.org, 
	nicolinc@nvidia.com, smostafa@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dawei.li@linux.dev, jgg@ziepe.ca, praan@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_142622_597999_57D93AE6 
X-CRM114-Status: GOOD (  12.72  )
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

On Mon, Oct 5, 2026 at 9:42=E2=80=AFAM Robin Murphy <robin.murphy@arm.com> =
wrote:
> This still isn't answering the question of "why?" though. Yes the
> architecture says some things, but if we were strict about avoiding
> mismatched attributes then Linux couldn't ever support non-coherent DMA
> at all! Similarly while the architecture does permit SMMU
> implementations to be picky about their output attributes, does any such
> implementation actually exist at all, let alone in a system capable of
> running mainline Linux?

Fair point that existing implementations have been forgiving in
practice. My thinking here is simply that a small, self-contained
cleanup that brings the driver into line with the architecture spec is
worthwhile on its own merits, even without a known implementation where
this currently causes problems.

This is really in the same spirit as your commit 7618e4790982
("iommu/io-pgtable-arm: Improve attribute handling"), which aligned the
attribute handling with the architecture specification on the basis
that:

  "Although the SMMU architectures seem to give some slightly stronger
   guarantees of Non-Cacheable output types becoming implicitly Outer
   Shareable in most cases, we may as well be explicit and not take any
   chances."

As I noted in my reply on the v1 thread [1], under ARM IHI 0070
(sections 3.15, 6.3.11, and 13.1.2), a non-coherent SMMUv3
implementation (SMMU_IDR0.COHACC =3D=3D 0) in which every SMMU-originated
access configured with Normal Write-Back, Inner Shareable attributes
fails and records an External Abort (F_STE_FETCH, F_CD_FETCH,
CERROR_ABT, etc.) is completely architecturally compliant, yet wouldn't
work with the current arm-smmu-v3 driver.

It seems reasonable to be explicit here too and program attributes that
are valid per the spec, rather than relying on the interconnect to
silently degrade Write-Back attributes to Non-Cacheable.

[1] https://lore.kernel.org/linux-iommu/CAE2F3rACz6Z7X3NNfLWEfjTD9K9YJyYHHy=
GzcBafEemTFGhgqQ@mail.gmail.com/

Thanks,
Daniel


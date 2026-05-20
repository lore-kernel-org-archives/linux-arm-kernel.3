Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E26CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 11:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9XOX2F++5Jy6GzgJFgn3hfr14wEnUQqIZdtQ1XgXtY=; b=svW9B8O6yUQnOsyF2H7f7cWmK5
	nNY6rs3XdCAKmEzFBL4js41rW9U8nErWI9Z4gNzLgqrrzHFdPvsUXPdOT7mwo6Yl+0QVXnPn7x9FR
	FyIDeYUFTLFJkyrgLVqeh8tcB21kux8sT8adPC8Nx9Fw7GhfEItl6D+qtWsXyw7v3sQP1QoUJZ82B
	qwUiWXACEnrwHL0PLjsHnw3e2gQZWREPG8NB/mZ31S8JzJOUz2Q2QOLktwUNHxWslXEiZI9Mussq5
	mPiMSIozhUH8hVUdikWws/ZMS1IfLF2GjSipk9qSVYfoC+OD5FHHJRcKaKqJYUrHlFPrt6ObRaZ7W
	JGmFtMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfUV-00000004UNm-3VnA;
	Wed, 20 May 2026 11:53:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfUT-00000004UMt-1aOm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 11:53:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45E7940E12;
	Wed, 20 May 2026 11:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798391F000E9;
	Wed, 20 May 2026 11:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779278012;
	bh=j9XOX2F++5Jy6GzgJFgn3hfr14wEnUQqIZdtQ1XgXtY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=S3qna9hOPwZdjH4QtJO2kgB1qbUJ4wj1oeonxPxui8dl3Fx9in7i0o1YfNDywTuPQ
	 kfidCEzlcl8wW+NLjEc3FzA6YNREIXrfJLl5qopM8yE7UQ0kVCkWdGZmax8/pFpCb9
	 t42z4SqwJPmEw1bnUWn0eahENt0X5q2P3opBiJyvvuKeSM0fn86fOLfQya62aW3FgC
	 MedAp+RnfnvN/inXhpODfFzCbhdZAPG1+GVAJplqW+quv7lWuii65ck3a2/u6aaH3S
	 IlrS6PlXOyuR4nKlOnDUVQ0GfUGl+nvVRFrgjfT+2bzeV0sUXTAxcvWAEW2BpsoHHB
	 4zTGISwQhpgfg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 4/7] mm/vmalloc: Extend page table walk to support
 larger page_shift sizes and eliminate page table rewalk
From: Mike Rapoport <rppt@kernel.org>
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
 urezki@gmail.com, baohua@kernel.org, Xueyuan.chen21@gmail.com, 
 dev.jain@arm.com, rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com, 
 anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org, 
 Wen Jiang <jiangwen6@xiaomi.com>
In-Reply-To: <20260514094108.2016201-5-jiangwen6@xiaomi.com>
References: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
 <20260514094108.2016201-5-jiangwen6@xiaomi.com>
Date: Wed, 20 May 2026 14:53:16 +0300
Message-Id: <177927799624.3551615.1232032128494296554.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1373; i=rppt@kernel.org;
 h=from:subject:message-id; bh=bCtY3KU6h249ANRsmgcaVTs6KjwNWS62y3TRFsQSYpI=;
 b=owGbwMvMwMVoydymdprv70TG02pJDFm8CzbuT6zdfuz7T7nMN6UzLVpXdu/99mXvTSHNnT0pu
 yb8tTh8tZPRmIWBkYtBVkyRpeJpROjSmfrzSy6ufwkziJUJZAoDF6cATOTjQQ6G7l/GBmWGC9Nk
 rrsvqM2R+7X4scUHboapzkcuM2X0d2ueOFdz041piaGC0fz5u3YuOlx9+uOciDOn+//5ZZ8KZNz
 dw/Dtdb+u/J/iDk5hxrXfbbcllt46/cbXy5epb+3+R9vPr6+K4ZmtmvhfmKHcJWdql92aJ7sFOX
 4oRJdYb35cI6drvCmikKMqhrHtOu9xxkC/GCVX2R1cwayR541NJir6/mXNi71zLOOybJ07R/W+j
 pzeVBMhxTkSYYtF6ra3Pi+6/SHUztxE0ymZZ/k8W0c98ZPRG5Yb/M84qPrt3/5T1Ts489QbfeNy
 y+USrMJcTv/hk/b+HG3M+TN+vXrol13eArnFiW1d52N7AA==
X-Developer-Key: i=rppt@kernel.org; a=openpgp;
 fpr=B8E96E880C4A40C3C1255AA8C532392DE6DA7CE9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_045333_442559_ACA73908 
X-CRM114-Status: GOOD (  12.77  )
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

On Thu, 14 May 2026 17:41:05 +0800, Wen Jiang <jiangwenxiaomi@gmail.com> wrote:

Hi,

> vmap_pages_range_noflush_walk() (formerly vmap_small_pages_range_noflush())
> provides a clean interface by taking struct page **pages and mapping them
> via direct PTE iteration. This avoids the page table rewalk seen when
> using vmap_range_noflush() for page_shift values other than PAGE_SHIFT.
> 
> Extend it to support larger page_shift values, and add PMD- and
> contiguous-PTE mappings as well. Rename it to vmap_pages_range_noflush_walk()
> since it now handles more than just small pages.
> 
> For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer need to
> iterate over pages one by one via vmap_range_noflush(), which would
> otherwise lead to page table rewalk. The code is now unified with the
> PAGE_SHIFT case by simply calling vmap_pages_range_noflush_walk().

After this patch we have two very simalar page table walkers:
vmap_pages_range_noflush_walk() and vmap_range_noflush().

The subtly differ at what levels they try huge mappings, how they
account page table modifucations and, at last vmap_range_noflush() is
left without support for contiguous mappings.

Is there a fundamental reason to have two page walkers?
Is there a reason not to support contiguous mappings in
vmap_range_noflush()?

-- 
Sincerely yours,
Mike.



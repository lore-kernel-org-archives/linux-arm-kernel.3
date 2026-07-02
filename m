Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E68C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 00:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpRDP2ezaOKhK6W6X5fU8vOvQc+ihhDBQ+gm9ShOsoo=; b=pWQgp3zW1vQ+F2Sv4Bwh3oKWY1
	1BOrJYiwAGldjnoCCmGzSflciwz8s5xljs++VaJuiP9Umy0/5rcr7R45y2j8sX7i7vj+WfGenEb7l
	0xH2F+ru8T9bDG/7kfIJKFniMBJRTUTymb0A/vovtO29JAoUeAIv6D/CDf5k6Ky+LKJgTOZ8Ud5Gs
	mVZgHWjNDXIT6mYHrbGxGVzFQLf4f6OLgUv4TbQqRR+0Msyo5ZJ/2f+V1Vd2CsH+2UFnm3JgHVR2O
	o0az63igkppPdP4Xh7oCR0u/RyiHR/6i688VIZjo7inFmFW95V4+M0i97JQVK1GnTwc1M5VzHFF+U
	MuHRJo5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf568-00000003HF6-3Rx5;
	Thu, 02 Jul 2026 00:16:08 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf566-00000003HES-3jI9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 00:16:08 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-92e53581361so70423585a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 17:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1782951365; x=1783556165; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SpRDP2ezaOKhK6W6X5fU8vOvQc+ihhDBQ+gm9ShOsoo=;
        b=JFx192Gs5DUILvsWNer380PT1JqtLQ4XLK/OxDTZ254J7rK1/mp/udvRZaptZwRt0F
         cKGD7+EuXr0nagRZnd8EXe7ajFppvzx6E0wEJER/BMdsy32Pmz9pkfrIOXOUYeg7z66Z
         bkmevSd1eJpVAnZfcl/lNy4ieTTOGFE2t3RnA0+nNJ3tdQQ2UCThGFxpUNA30Jo0aIXY
         kjBQdjFX5AMVSraTcZJpTUEgkrXuHX+fJYLsO5zIMZaqyxP4Dz/e6ESdImsQAJ/7cyyZ
         eQMEqZJNzMlShO6hdymPmLMTMMTW3OXRNmq7HokZsvw2PBwwmECHGTXH0WWylTRZumPu
         bl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782951365; x=1783556165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpRDP2ezaOKhK6W6X5fU8vOvQc+ihhDBQ+gm9ShOsoo=;
        b=KlGQeJu/M+aziM64Q+BATiUYYSOkTVoDVu5tpeWiwJN666lrXMNe9QE9o27MAM3OUR
         gIrzFK5Hjp7C1DvIcK0xjYUBYn9Z2+JZWoF3CmrEn0JBdv6/ZBZr/tVq6Z8EI0mumLl1
         bDHaxuPXJVV2B85ytzWmcOATw/ylX5B4F5YwNrYIW5exl5dwAOjlOWitSorAfjJYCjPB
         UYaLd1lVEGh2gPvj6PI0AKgR5szGIMu5Qm2ZQo0pidMi76NrW85K9YFppQA0glRsfDfJ
         X3UYz1XQ60cSYSTe8ukKn19IMV3wUjuqjClnB2jzD2hIwssr/bhgJd47FpuJktm1VqEX
         zvpQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eUVIzgCSis9+KLQGvYuzaWxLM9ylhgDenFy95qt/fjH+xVDBwEZEF2WWwej58DfFRNGCSSthFyO55LVLCep6A@lists.infradead.org
X-Gm-Message-State: AOJu0YzHXeNUbXzPRQMWF9bz2Gi0c8V+63VpCY1X9DbWdvO+6xltL7KL
	kXfZ/ResyKL8beqpOEVjc6bsETlTnXxByoiIqfTEG0T7S+0ZeD2EH2rNKVdIl5axlfQ=
X-Gm-Gg: AfdE7cnxRP/3rUMJVjYTyO9hJWVYsZ9sEzp5DILWicBCkEYPdnTUoAWjwkpa43Gbkr9
	IhPNaWRcBmjEVrTQWkBhxtztsKzJZjfWwXkX3yS0KpVJj1BPXxX7avTXNndDnleKPLN6ouk7bFx
	W3uaSWt4AcQCX/Q41OUaLTyZ6oBWcSRtopoT8FmZGrNDvPlsGSzXZ1Q9m0GIs8qVEHM/hMRhP9G
	GHCd1nFPDzbut3pbRdbxjX6AiDBh2qkYzZQYgWeguJvwKFILUwUm24ZXHykmw61q2WCq3s2T/Ks
	D3xpdt0niveckJEPch5tYX8V6d/To9Rjl1Z208hx0R+b75gvkYR0eTGlphV2pDgEqJLgdKTt91u
	CG3F+ny932JtVRa3SLN6AzrN/3Wd/lEz++yLJ1pq3QQTs1xHobMwCEySMzLtjJwjZiTkp9zzrKR
	SvDEFnNDIFXl7J3ntCYQQMbDz13HTA8cQpZMZmeymXWr4r7oQrVNntCZxPyoPNnW+5sA4=
X-Received: by 2002:a05:620a:4016:b0:915:8f76:7ffa with SMTP id af79cd13be357-92e782c6315mr515090585a.45.1782951365126;
        Wed, 01 Jul 2026 17:16:05 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e80040ff1sm81033885a.21.2026.07.01.17.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 17:16:04 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wf563-00000004cjY-2WuA;
	Wed, 01 Jul 2026 21:16:03 -0300
Date: Wed, 1 Jul 2026 21:16:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Nicolin Chen <nicolinc@nvidia.com>,
	Kyle McMartin <jkkm@meta.com>, Breno Leitao <leitao@debian.org>,
	Usama Arif <usama.arif@linux.dev>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Shrink command/event/PRI queues in
 kdump kernel
Message-ID: <20260702001603.GN7525@ziepe.ca>
References: <20260701154528.768976-1-kas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701154528.768976-1-kas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_171607_095039_96D52542 
X-CRM114-Status: GOOD (  18.63  )
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

On Wed, Jul 01, 2026 at 04:45:28PM +0100, Kiryl Shutsemau (Meta) wrote:
> The command, event and PRI queues are sized from the maxima the hardware
> advertises in IDR1, which can be several megabytes each. On systems with
> many SMMUv3 instances that cost is paid per instance and adds up to tens
> of megabytes of coherent DMA in the capture kernel.
> 
> A kdump capture kernel runs from a small crashkernel reservation and only
> has to drive the few devices used to save the dump, so deep queues serve
> no purpose. The queues carry invalidation commands and fault records, not
> DMA data, so dump throughput is unaffected; a shallower queue only bounds
> how many commands may be in flight before a sync, which does not matter for
> the capture kernel's small device count and modest I/O.
> 
> Clamp every queue to a single page when is_kdump_kernel() is true. Doing
> it in arm_smmu_init_one_queue() covers the command, event and PRI queues
> in one place. The command queue still holds at least one batch plus a sync
> (256 entries on a 4K-page kernel, well above CMDQ_BATCH_ENTRIES), so
> command batching keeps working.
> 
> Suggested-by: Kyle McMartin <jkkm@meta.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Make sense to me

> +	if (is_kdump_kernel()) {
> +		u32 ent_sz_shift = ilog2(dwords) + 3;
> +
> +		q->llq.max_n_shift = min_t(u32, q->llq.max_n_shift,
> +					   PAGE_SHIFT - ent_sz_shift);

I saw lately many people saying you should not use min_t, why is it
needed here?

Jason


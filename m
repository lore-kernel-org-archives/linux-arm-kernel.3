Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933D6C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSio1tefA8hn2ItHYltO++r3B3H0zvF625Ng9n3K4Tk=; b=3CwqqEjrNEBao9bdtqeGXqABuV
	Gu2x4TDaTy2uVc+y/0vPbGtAcQShXtixlHm/h4MgEYgbOptYsKkjLTEAYUBW5PZQyFw+O257SlK7K
	7P/F/4/hYlDXszliPmOJsOlTJ8wXM7fh6WgeA+0/awwJUbAVND08M2j6nnFzrQWUFSoUCl0MgLzKa
	UV8ekrOaQ4rbL2RIqKqkp9SVWCdQKt0PdL5ohWXiu+GsOLL79wYKreNySM3nHVuFfipAHpEBX69Xf
	49NAo90xKTVbm2LNpm++g5MwvS/jF6mycegtfb12qkiWaePd1b6Zpp7luIaPTJdwUdEE5cTq6fJks
	nn+4o2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIyp-00000004l2R-0YIs;
	Thu, 02 Jul 2026 15:05:31 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIym-00000004l1m-0XWs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 15:05:30 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-51c15a5b265so608871cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 08:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783004725; x=1783609525; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XSio1tefA8hn2ItHYltO++r3B3H0zvF625Ng9n3K4Tk=;
        b=iuCG0IGxym0pBK6HQGk13rKHJLMPXed3uT1XpIvvT4hWa7824swGIfSnj0/T/nlFe2
         eAGNeeeDj8SLFtIvqZdUojvz55+usgeoK1kGPZPvp8UnmW897RV5enP9QTU1cqLvWqc1
         GbQYIs6TTiABTBXt6rpDVRpKc34ifh5AqOXcJ+H5IiSroQYPQCxD06GwXkbG1t3lbPZs
         6TZyXNEuwsWLd93D0AFuo54lNNsjsZdn0iMxMOXXgCbzdy0yFZaVCTPocxyo1O9Ki7bd
         a7siq1on/7YcU1PnXC1oQ3S+Ty9Vuhyk7A+/EUXmTrI9Fr+zVGSnAuoZafbsLDAt10zQ
         hCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783004725; x=1783609525;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XSio1tefA8hn2ItHYltO++r3B3H0zvF625Ng9n3K4Tk=;
        b=tDMnrokwJwKgfgkIhPEa1bnCb97PgoRJSwR2OcDLxIwnm4R0EYdHS1MalRr/V76UVR
         4PfhXJf4MTi1f/ybbiSyh/GURkGskxm9S/19CKbMCEz/NLWwV5s3YkzK6l0VjkSoDQsB
         beG+F84xnsz3lEES0kxhhdCy0giEv/tdSneTg84fGsxI9rrrFNWC8CQ4YWsfjRmwLma9
         QGLa+pIkE8KcZgssSqBeJj03nafYsmALm3Mzx3DrpRrErMxJ6Zl0LpOTTXyfBqbOVgIg
         l3LLU0UUXsvaLxrN2Qn+6LNWWyoZd0Sol3tzY6hu9ZYZ48zQ4vpPsTvVnZHVmOb4M/Pv
         bMdg==
X-Forwarded-Encrypted: i=1; AFNElJ+QZCVY3athJHjBW4OldKHXtOMhmZzLYPDMyiqln8mfw34VNAZ5scxiFRdv3oBUOyQlXEat2hWa1pSiVs6h2Hzm@lists.infradead.org
X-Gm-Message-State: AOJu0Yzalt1q1xcbXdbGmDURLzcW3wXpYM/1l6DNyDMlnui5CYY0n3/q
	iZqn+zTA3aNWzNvDK7UfVQqEK8PCJyBp6OwMGFwqiE283uavaGASLXY21Esq5FGzag==
X-Gm-Gg: AfdE7ckDYC/U06J4GR3IYpkcPENy2NS233w8Np/n5FWdUiIrMzcEdFFivVyOU3xYAqh
	0sVBtidtrlnKYF0V4FBL7nXp1JVdCGa3lzkm88rsS/LJqbu/dWr4pxbuQRUzQFpveiCuROzn8OQ
	JBpwj8xrTfn657dMvSjqPsggTABCoBKTGubhzXJyqINlOfYJooGP5z459PTKH0iN9xHuiV6f9VG
	JCV2A4qWlioQYQE1l414yWrwOLgNTJhySUKEMEX+muK067o4IC4GNE+Vkn5PX2qPg1N3U6zGwsw
	tOg2AsgV6ibSUj4tjpUuHWtog+gMBc5KSOMZRWVd+4OfH03oBGXATwuARv66U5fVAsjDq4b/MT/
	qOJ7Ryoc7NJjqEp9Nig4uDrn+yOxt16uzbnCORNAvij7NaH+5DIrrUXu49E8kDe988Eg7HDYGLg
	Xw6HZeJ2yLoJ83QnqTez+gRyhCEZTCfv3exMFhjLLI4qMqunM=
X-Received: by 2002:a05:622a:1811:b0:51c:d16:b48e with SMTP id d75a77b69052e-51c3191132amr7766811cf.22.1783004720401;
        Thu, 02 Jul 2026 08:05:20 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cbec93a70sm3241630fac.11.2026.07.02.08.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 08:05:19 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:05:12 +0000
From: Pranjal Shrivastava <praan@google.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>, Kyle McMartin <jkkm@meta.com>,
	Breno Leitao <leitao@debian.org>, Usama Arif <usama.arif@linux.dev>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iommu/arm-smmu-v3: Shrink command/event/PRI queues in
 kdump kernel
Message-ID: <akZ-KIVJlmP4LEcQ@google.com>
References: <20260702112825.781750-1-kas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702112825.781750-1-kas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_080528_210023_85E708E5 
X-CRM114-Status: GOOD (  16.69  )
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

On Thu, Jul 02, 2026 at 12:28:25PM +0100, Kiryl Shutsemau (Meta) wrote:
> The command, event and PRI queues are sized from the maxima the hardware

A minor note here is PRI & EVT queues are disabled for the kdump kernel
(see arm_smmu_device_reset). We could just mention all SMMU queues are
sized [...] in the commit message. 

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
> Reviewed-by: Breno Leitao <leitao@debian.org>
> ---

Apart from that.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan


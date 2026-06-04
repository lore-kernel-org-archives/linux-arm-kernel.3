Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DD4CD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 07:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SoO6lBeFYolYcKoclvlxOZ0nr1TAmQMvAGC/ju1rkIc=; b=mifyG9kY+vvtab7jmKkT8BPEKV
	2cZor5QayjVKtOtSmF0EGnV4NIfaFRfyx/mlbog/DAqi65GleVzR2l7a/YRYkC+6MBbwAgQ+o9v41
	xbVIOLMBKdDHZC+C8/x0Mm5KzdSx5yAXZWyKkl/jk9Psc7FLgvidkn9DY/vy4zGyndlO6R2j3flZ3
	lhbKipM1ShZQEacbeMtVubKkUIV6wzPjkWl5/lpx13YEMWn9RxVCaVad8c6WqkPtI/OP3qYa+tocK
	o7EObnnoj+Dq0QEIYzIpvfpCYas94voeGwKLVAiRNRouF1Src6S3PMKWw6j+G40p2+Sem7gVI9MN4
	8/1eQTxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2Lt-0000000GIQv-2B68;
	Thu, 04 Jun 2026 07:18:53 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2Lq-0000000GIQY-3RiH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 07:18:51 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2bf2d865383so60185ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 00:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780557530; x=1781162330; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SoO6lBeFYolYcKoclvlxOZ0nr1TAmQMvAGC/ju1rkIc=;
        b=eihN3hue2VO+a2qE0jwzInTaM+PRx3JjUeQW4wGtEhLMPQxL2CfllhWFYvF/PBpEF6
         2XpIR1jA5y0SIUclpMcQbPgYKD1RGPXfymbVcnTJeZmvveFOIm6rtFjX6BW5KostQuNd
         +sJwoGtm4lFoyHpKagmwYenzH+SnFM4PYnx9X0VT0+gaR9m7udaChdIKNXYyV1ZaFNML
         6aL+SNytkjl4qerIWnLYJYr52/ev5R21ogvUkajSTY0mwl4HKmYljumKUY1EWNgvM8PP
         zaYyr4GgBPTwxraAvWM4/qhZ+Vd75sxfKBCPS4+QCJRYHGN6AhTHKeFos1YdaEsSXX3q
         pU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780557530; x=1781162330;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SoO6lBeFYolYcKoclvlxOZ0nr1TAmQMvAGC/ju1rkIc=;
        b=JYyAW/d64d1XBPj3ctTd8+9f3BPyNuO8G2JbqOYWO6mLJIBYmD7dU6WXMxVy+MtOqK
         zCS2Q/2RaLHmKJHlRdm4dvKai+xJkvLOrdxw0Ft6CiZGQbR3SBWNI5q3l6HoZYpujwJl
         29pi91kwLPYC3Hx18/Vto3mU6kGLeag+v6WeXqMDTxzD85xsFmrhsmzEZYwU0IV1yAEN
         vPj3K3dL2xGpcrdwDVg+RMw5Xpn7xFTAgNdBVn8oyxmASo/U/snzunuoW2IC+DMRdQB6
         LFAd8A+l0Fzt9s9Br2VklcNRusUDIiL8vErqSObuOAS3Cp2uo+8F8ycqiEcDX84pxlLQ
         BRnw==
X-Forwarded-Encrypted: i=1; AFNElJ/rhvQhhQmn0RqqCUdEU1eiErxKLRxzjtUbLSRFCf0A1YIL84ounSUN1vJ7+JCl0EJIIDR44GSDdTT5br/wtDEj@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgl+OpQ9rNTW2DciLhLxJWTEuyPmStlVIlx380HbVhI6mdDWwr
	dmGSzGVxVttdR1CWWIbBcMDwb604wsB8+Xcg+HU7r70Va9TM229kPxMAqVlxYo3UGw==
X-Gm-Gg: Acq92OGqXxCv5zSWrEY59+A4unY4ITctWMAPIBfa3xe0+7GJqf3L2Kbal4SR7SAeInR
	A3AVvwZYReqthAWdSxT1UE7aN30NQP+YIgXZFgUXh3/pY75OX2FX7ge5W8UFtoWC4goTYGkvPAI
	nl+huC+DLejh8F/C9N3TfOBUZ6VGducqpVC8p9Hvb2oMjx3DnfnENqdBls3TkcXZlp2uLse5//x
	wx/4NW9i6unuJvNexQ7zW7xgw5rvdypdqGlFvSXQH8NnXgSP50o+O+uJSZa8OSlrWkZLOtCzUnX
	BfEa2Ozw3NAvffz+KnHA323/eM6O0ShmM5va4Ke1/g++ciIzBrqCPqcj90XqoL4ceaOE76mt4HB
	CDZhT1vfmdxC0aqCITF1UjJH1x6BxcAstVh5/9iwFTblSl2daTIbhMzwUol0yBg0tsLMMfwFOKB
	DEpnHvKZfo9Hc+cUqzpVMfT9y0FG95ufF1BTCGglPVozXifX415c4HTaSaKnQEjMBk4mc5eTdga
	fcslzkEFg==
X-Received: by 2002:a17:902:e5ca:b0:2b9:a39a:e5db with SMTP id d9443c01a7336-2c1a1a84726mr1636465ad.7.1780557529331;
        Thu, 04 Jun 2026 00:18:49 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a61b3sm4268319a12.17.2026.06.04.00.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:18:48 -0700 (PDT)
Date: Thu, 4 Jun 2026 07:18:43 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Daniel Mentz <danielmentz@google.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, iommu@lists.linux.dev,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 10/11] iommu/arm-smmu-v3: Invoke pm_runtime before hw
 access
Message-ID: <aiEm0yuNtG3PGJ4D@google.com>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-11-praan@google.com>
 <ahilX8Za1NRCH3ik@Asurada-Nvidia>
 <ahi3uY9YZZtR1Lq5@google.com>
 <CAE2F3rDeZe+w7-V6hyJtSOwCj619E5SNtjJjZ1-yu1sVdf=35A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rDeZe+w7-V6hyJtSOwCj619E5SNtjJjZ1-yu1sVdf=35A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_001850_867739_E0571311 
X-CRM114-Status: GOOD (  22.92  )
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

On Wed, Jun 03, 2026 at 03:18:32PM -0700, Daniel Mentz wrote:
> On Thu, May 28, 2026 at 2:46 PM Pranjal Shrivastava <praan@google.com> wrote:
> >
> > On Thu, May 28, 2026 at 01:28:15PM -0700, Nicolin Chen wrote:
> > > On Wed, May 27, 2026 at 10:14:06PM +0000, Pranjal Shrivastava wrote:
> > > > TLB and CFG invalidations are
> > > > elided if the SMMU is suspended by observing the CMDQ_PROD_STOP_FLAG via
> > > > the arm_smmu_can_elide() helper.
> > >
> > > All the arm_smmu_can_elide() call sites here would eventually elide
> > > the commands in arm_smmu_cmdq_issue_cmdlist() that is already gated
> > > by CMDQ_PROD_STOP_FLAG? It doesn't seem necessary to gate again?
> >
> > While issue_cmdlist() would eventually elide these commands, the
> > can_elide() check is necessary to return early during suspension.
> >
> > This avoids unnecessary stack allocation, cmd building, and spinlock
> > contention on the cmdq->lock for threads that are anyway about to be
> > elided.
> >
> > By dropping these requests immediately, we significantly reduce cacheline
> > bouncing and contention during unmap storms. Furthermore, the early check
> > also allows us to specifically trigger the WARN_ON_ONCE() for broken
> > devlinks.
> 
> Hi Pranjal,
> 
> Have you observed unmap storms in a real-world use case, or is this a
> preemptive optimization? I would not expect a high rate of map/unmap
> operations while the SMMU is suspended. If a client device calls
> iommu_map/iommu_unmap (directly or indirectly), it suggests the client
> device is RPM_ACTIVE, meaning the SMMU should be active as well.
> 
> I am in favor of removing arm_smmu_can_elide().

I saw some with DMA_FQ (fq_timer does batched async invalidations) but
the early ellision doesn't really help with perf which I agreed to in my
reply to Nicolin as well. 

The early checks were dropped in v8 (except for invs_array and for the 
WARN_ON in inv_master).

Thanks,
Praan


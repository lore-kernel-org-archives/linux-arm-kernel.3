Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231DBEA810F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 13:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RX56B6Pzw6O0Q1rKBSh+0V8lVIPD4tWbCrOnzMgOsgU=; b=qddji8yFWPOgk6iVI5sy9FqMtI
	EdvYqXFuZEUFmLbFb0MGnwt1D6tkDKqc3qvBbCf+Xcxr6O5vi8bbu/BeErDpZpefJ7WB8jFY29JLO
	tuN/2myspOZjxKzse3umfxykg+qIqX0/OWBvln2v7Q6CS6GNUanNyJHFH8PqhrS1azk4781FfBMgj
	fkk+FsWMp4MkCNAYTfIvx55f4qiCpZ7O4dr9nEFB7cieXFWIn2uS4RJ2orXr15S15RGT+tphknsHd
	5fIRdTDFSoJNhG8q6wUpdquL0+3/tyLrZpccutgVdl4bgtSk98lQ6QLhA5haHnDq1J1NHEo/atPLz
	OCV1sI1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpnaW-0000000GyxH-0SKE;
	Tue, 10 Feb 2026 13:15:32 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpnaT-0000000Gywt-1kqf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 13:15:31 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a885af8ee7so59335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 05:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770729327; x=1771334127; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RX56B6Pzw6O0Q1rKBSh+0V8lVIPD4tWbCrOnzMgOsgU=;
        b=u6kpK9On9jsd3gb6rsdPB0o/U6d65tgvON9K2i6i3flXW4ktLrSSW3/W8DfDlwVr88
         ihxbfL6QsQmJygrePRWHH9bzqJWopBEbGXxkFQgD3QM5i1hqu0BOF8FLRfmqNTC8cB5O
         2fh+S5OLfhYS3MEo1jUv9E4yYj1LXiLpODsLXU2UXvsDeWNSTCxMrJF5MsnDtCD+Wy/4
         6hdtPHK3F3SQESPmVsJvCw2OQPhTvdeMkbJKWLL+LJ6ylgWJHn7sbO0FyUjyd4o1rvFQ
         KZBXSxMBCo9vQaZ01iDkyY6OSnCYo3H3WkaKXlZcYwhS+9MFW+++PsqTVwsCkhoSPJfw
         rhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770729327; x=1771334127;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RX56B6Pzw6O0Q1rKBSh+0V8lVIPD4tWbCrOnzMgOsgU=;
        b=Jh40BYBwBUWYXSmIBWAJO2fragjkM3YE/h07rVrXw8tMKzzDajvTXog8hH3nWOLP9T
         3wucPvd2KB0KfPAdeAL9R+jE85oBT/MyKjuBZ3Xz3kh+YxQDxaMwn25Mg/nf8jpkSWvc
         NRTX/UubS0DoCKGxBpecWSUCn6Q6h6Xnorj2comhHjUGUehLVBd2F+0Drr8MykVpsAc7
         JrASYVh6EIndmGLjzNhJBX32EhU+0OINBrlWIdtYwiUB1hJlliomjAbHtfD1Y6aqtRAf
         tIsIqkFjQflURvs7FGOeycmbQAIxEMBpAZ8zlU5flGjSBFwCYSuzuynifUA8m3fT+0I6
         IGfw==
X-Forwarded-Encrypted: i=1; AJvYcCUEcre+IyP3HSjZRnocxjGtrtPykDi+Tpv8rW/lHhm9zFsT2tIbaba6gmd50WUMhUfkQ16RlUe8S2Lh0NP5pSDI@lists.infradead.org
X-Gm-Message-State: AOJu0YzqJzjG2qH/hUNLX3Ia3QuhjwdW102OEBmtH6EAx1OL1ga3RX+X
	a2fAvW+b1OoIfp0ikeecB22GnU7ht8NXNG3LcNnfo1spKuoP3ED7iIb4lyCGgTxgQg==
X-Gm-Gg: AZuq6aIU9bSnSZUFEB3BEqH8zbl9DP/OzRQVH620/lhXUOu5TNI6PO+xFnt7+rN7JnT
	Isukbm3zFUiCu2LJ/e+AukhfFEvkKn4ZG4RqbFr8hVrLJgdw189pCjUwwuKp1d+ARm9HjrAv1xV
	vSB4DG57rqR+QCKoaUArba4lXxBkuN9Qr7SwWL0RFl4ojt8avq1W/FmZSE9TWehN3EOnDCnCr2n
	14rECngJIjTVOYGErvtDqKOCt8IsEg/bHZRWAhGRcoLmgvyw2yY3vL3w2ercrfc7fxMxycBXCPw
	ZHfkvoIkjCRnTj9gYMLl2gozHVLf0ex5eKgj4JJiaeNRhErDBD3zZjCJvgISXocF9IePTfBdT/M
	kcdtU9TscfC8rqD9xVxbr6rNRcPtg9v5Fo1qE8BTY1g8VBmrlAucpQNri8pmZB4JLFwkdEeDeFe
	GQvlua0MzTu+2CLlIonj7CO94GwH5MsO6yLQUTL9DfYwyzB+SK3qB4+uqX4vHU
X-Received: by 2002:a17:903:32cf:b0:2a7:d266:d84a with SMTP id d9443c01a7336-2ab10104509mr2092735ad.17.1770729327080;
        Tue, 10 Feb 2026 05:15:27 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418dd7a2sm13128886b3a.59.2026.02.10.05.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 05:15:26 -0800 (PST)
Date: Tue, 10 Feb 2026 13:15:21 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Subject: Re: [PATCH] iommu/arm-smmu: Use pm_runtime in fault handlers
Message-ID: <aYsvacmKoLroXlrZ@google.com>
References: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
 <9fb8f661-a235-4f86-bc10-f80a21a8fa9d@arm.com>
 <00fcbcf2-3f48-410d-88a3-88dc834c1ed7@oss.qualcomm.com>
 <d6bc7f38-b41d-4e89-b484-0e699981b8b4@arm.com>
 <aYEFop8CJiLYzhLw@google.com>
 <7720d215-9f92-4f0f-83af-c992e1cbe531@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7720d215-9f92-4f0f-83af-c992e1cbe531@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_051529_858936_397DEDD1 
X-CRM114-Status: GOOD (  21.98  )
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

On Tue, Feb 10, 2026 at 04:39:56PM +0530, Prakash Gupta wrote:
> 
> 
> On 2/3/2026 1:44 AM, Pranjal Shrivastava wrote:
> > On Wed, Jan 28, 2026 at 06:44:35PM +0000, Robin Murphy wrote:
> >> [ +Pranjal as this might matter for v3 too... ]
> >>
> > 
> > Hi Robin,
> > 
> > To weigh in from the arm-smmu-v3 side, we’ve attempted to address the
> > "can of worms" regarding power races by leaning on these differences:
> > 
> >  - Threaded IRQs for PRI/Events: In the recent series[1], the PRI and
> >    event handlers are fully threaded. This allows us to call 
> >    arm_smmu_rpm_get() safely, as the handler can sleep while waiting for
> >    the hardware to resume.
> > 
> >  - GERROR Handling: Since GERROR remains a hard IRQ, we handle any
> >    pending gerrors in the suspend callback before the SMMU actually
> >    powers down. Any GERROR interrupts received while the device was
> >    suspended are treated as spurious and ignored.
> > 
> > Thanks,
> > Praan
> 
> [1] refer to case where SMMU state is not retained during smmu device
> power down, this I think is equally applicable for both context and
> global faults.
> 
> Since the ARM SMMU runtime resume triggers a device reset, any pending
> faults would be cleared during resume. Here the solution can be to
> handle both global and context faults before allowing the SMMU device to
> suspend.
> With this approach, any hard or threaded IRQ scheduled after the SMMU
> device has suspended can be safely ignored.
> One concern I see is iommu fault reporting to clients while handling
> fault during smmu device suspend.

I believe by the time we've reached suspend it's safe to assume that all
clients have been suspended. Thus, we could simply not report the error
and instead scream by having a dev_warn_ratelimited about the situation.

Thanks,
Praan

> 
> Thanks,
> Prakash
> 
> [1] https://lore.kernel.org/all/20260126151157.3418145-9-praan@google.com/
> 


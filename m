Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D33ECD6C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 16:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAMSBrvK4JW2RP64mGnR+pd6rmCnSQHvODMr9ePslO4=; b=hpI6d0Ag1F3/u1c6MegvvKjnQR
	HcYX6QCzQ+5s1964xCmGku9Bb9k3ouhMJwxcTep82T4D6TdiO5Ui05KyTk5aPoh2o5j/Ch6zwrJo7
	VjB1jtxRO/Q+54WZsj7ceKaWUVafcsnIAwbiJW7fkEWki935gGtzE4jDs48zs4P7Oyixn3rUofU0t
	DibpGFQ7al/1fHhDa/Tn3uTDWZ087k98yvunJZJ/Uj73HrYPKX5JLQhnBSo9rF8eOxtD23zMQiKUr
	9u3d8Pas3acKd1kBERTBSoTeJu77Z3b8BkH7vDhwlwvIvhJ+pgWnauhwVJtApPJrYWce6+CgVvLEE
	Edw/0y6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDYt-00000000rhW-48H7;
	Wed, 11 Feb 2026 16:59:35 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDYs-00000000rgi-0iEZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 16:59:35 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2aad8123335so102665ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 08:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770829172; x=1771433972; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bAMSBrvK4JW2RP64mGnR+pd6rmCnSQHvODMr9ePslO4=;
        b=CbCpURwygP2k4FTDZ1pNs1m1oHwxIVFOU8yYkRL1Piu8Xl4AnA1xUl/exaOiDU4F20
         gL+liO587hwGQ9GR/+3R9EbVDK3P2/OyYrNQS8PHdceDoqpq7xO4/1EMKBP0lPRY3XaZ
         FoNXuuj3pn3Wuf52AYKf48Gs5qPWhQROKpQXK60e07kHR90NpIrGbGooDAv1IVDBEEz0
         lerp/fNLuUV6fn/lYkNvtrs+WrGOGXZAn7w/ELY97wAOKfyYQworMip9sPNCIToqOjLm
         EMK6ztfXy2/UPtISiFix+TDYt6UfrC9ooU5X7R7qCs5WgNdEr5Bga/TYzUEeOZoKColA
         XVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770829172; x=1771433972;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAMSBrvK4JW2RP64mGnR+pd6rmCnSQHvODMr9ePslO4=;
        b=bZc6pExxxXURL34GCPqvVhuJP18yyrewuaqgx7mb+sKChJXIzUa6Dtdr46XPoPjTha
         qQVH3ld6M3kNCXtFAAyqyMms4ghxK7gF9YsXIqlzUkQAaPL7igi+uQrXTlETyifSZND1
         AdZPDuzpkQKBQBAaOFWwS7sefL81OxnKA80rssic57FcXuHosdHjGJDIrBCG8NHXTflk
         B+3gDVOuw36+NbRE905oGWeAlRJ6ubCJb46QCURaeTCytxD0DOp6m1PBPf2reDjo36wi
         RO/cCEqLSz2VYIygC+v9GItorJcrytTR6sUJui6YgDar5wwHsmWSzFrvUcyFBHLdrs43
         HRLA==
X-Forwarded-Encrypted: i=1; AJvYcCV6JTOz97P2lbXAiSSpfARHOzXuUR5lnuW873TeA0oAiu5XZyhC2NLc3hrVAmuHf7cyx1p+xy+U2S3Eaekr98mV@lists.infradead.org
X-Gm-Message-State: AOJu0YxbB0avRunRzrzGIlrhTl8OZ+lxnpaMnYpURloHJTNrGln/29XU
	6ZkXHOEhy3lPydqM4LJz7RUfAwxGifzjqPy/qJrGOdjnmdO1KPmxx1/PFCdCppb5Kg==
X-Gm-Gg: AZuq6aK4ib8I934LMvKpJndxNCp5MGr3fRkWJc7Hwf8hpj4RjOcYYYEpkCZbLKJiIa4
	PQfoJt5fCWuVAJ7u39FIiYGqPKrN6hqVNrSa9vsuZM/pPgVXSWApOoe4QV9RedrA5a24apACQQN
	JFMA0QDc+pXSIvqNDFb5SAsEpYzaV4o1y5TCyyw1G3z60QIe3OoqnYJI+BAy96cXBvr8JOXaIEY
	Ul14PmlhMdcLZvKbReOkTygZ1w3OPhsGTBwQ4Qb8zIJrgl7ZePSvHU+ofXVsfinGbGFmvqjelY/
	H9/S4jYbC38N3Bj5ae/N/K8tuE5N6ut/lJZ3p33EDANYmWD3NScj14vj6VoWZpLSvE+gZ+MqdNk
	oXBGh1hmVeafpdvoXxtn0yHGxmBr0uK8Q0ZkpaaXC42emuk8+BCvFTdfwfuOWlNzJ229Gn8qai5
	BTsGF2bzOtN1JuC3ussIsrTBKpK4kIETWFCoKLqRukkc5HI1NLANVHPL+y3bJd
X-Received: by 2002:a17:903:4765:b0:2a7:7ca1:8622 with SMTP id d9443c01a7336-2ab2967a7camr2352955ad.11.1770829171698;
        Wed, 11 Feb 2026 08:59:31 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e197d63besm2542439a12.16.2026.02.11.08.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 08:59:31 -0800 (PST)
Date: Wed, 11 Feb 2026 16:59:26 +0000
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
Message-ID: <aYy1bmorEGWhduHU@google.com>
References: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
 <9fb8f661-a235-4f86-bc10-f80a21a8fa9d@arm.com>
 <00fcbcf2-3f48-410d-88a3-88dc834c1ed7@oss.qualcomm.com>
 <d6bc7f38-b41d-4e89-b484-0e699981b8b4@arm.com>
 <aYEFop8CJiLYzhLw@google.com>
 <7720d215-9f92-4f0f-83af-c992e1cbe531@oss.qualcomm.com>
 <aYsvacmKoLroXlrZ@google.com>
 <53c051f3-3a72-4d8d-917e-3b9d1537443e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53c051f3-3a72-4d8d-917e-3b9d1537443e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_085934_232480_36CC756D 
X-CRM114-Status: GOOD (  28.97  )
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

On Wed, Feb 11, 2026 at 09:40:29PM +0530, Prakash Gupta wrote:
> 
> 
> On 2/10/2026 6:45 PM, Pranjal Shrivastava wrote:
> > On Tue, Feb 10, 2026 at 04:39:56PM +0530, Prakash Gupta wrote:
> >>
> >>
> >> On 2/3/2026 1:44 AM, Pranjal Shrivastava wrote:
> >>> On Wed, Jan 28, 2026 at 06:44:35PM +0000, Robin Murphy wrote:
> >>>> [ +Pranjal as this might matter for v3 too... ]
> >>>>
> >>>
> >>> Hi Robin,
> >>>
> >>> To weigh in from the arm-smmu-v3 side, we’ve attempted to address the
> >>> "can of worms" regarding power races by leaning on these differences:
> >>>
> >>>  - Threaded IRQs for PRI/Events: In the recent series[1], the PRI and
> >>>    event handlers are fully threaded. This allows us to call 
> >>>    arm_smmu_rpm_get() safely, as the handler can sleep while waiting for
> >>>    the hardware to resume.
> >>>
> >>>  - GERROR Handling: Since GERROR remains a hard IRQ, we handle any
> >>>    pending gerrors in the suspend callback before the SMMU actually
> >>>    powers down. Any GERROR interrupts received while the device was
> >>>    suspended are treated as spurious and ignored.
> >>>
> >>> Thanks,
> >>> Praan
> >>
> >> [1] refer to case where SMMU state is not retained during smmu device
> >> power down, this I think is equally applicable for both context and
> >> global faults.
> >>
> >> Since the ARM SMMU runtime resume triggers a device reset, any pending
> >> faults would be cleared during resume. Here the solution can be to
> >> handle both global and context faults before allowing the SMMU device to
> >> suspend.
> >> With this approach, any hard or threaded IRQ scheduled after the SMMU
> >> device has suspended can be safely ignored.
> >> One concern I see is iommu fault reporting to clients while handling
> >> fault during smmu device suspend.
> > 
> > I believe by the time we've reached suspend it's safe to assume that all
> > clients have been suspended. Thus, we could simply not report the error
> > and instead scream by having a dev_warn_ratelimited about the situation.
> > 
> 
> By reporting error I meant reporting the error to client with
> report_iommu_fault(). I agree that if smmu device is being suspended the
> dma devices should have suspended by now. If so, it should be safe to
> just handle the fault excluding report_iommu_fault() in suspend path and
> complete smmu device suspend. Will update in next patchset.
> 

Yes, that's what I meant, since the client is likely suspended, we can't
call report_iommu_fault() because the client might've registered a
handler which touches some MMIO (accesses registers) while the client
is suspended. Thus, if we see a fault during suspend, we could
potentially log it at an appropriate level and not call
report_iommu_fault()..

Thanks,
Praan

> > 
> >>
> >> Thanks,
> >> Prakash
> >>
> >> [1] https://lore.kernel.org/all/20260126151157.3418145-9-praan@google.com/
> >>
> 


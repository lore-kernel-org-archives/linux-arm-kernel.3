Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0695FCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jkQyUrfkqfz8XQIv/dWok02t1PybehRH8tb5fDYY/+I=; b=1vfYJhtXyYsQyQclKmcAzZ+vy4
	UseT+1ntnXrzBBgPHdRz7NgGzA1hxvMYUMDC2+phna40YWi6SntHGV3OjO9ni+ulxuYPAngv31CEL
	5iKopXPK+yufrTg4meJNLCEvslHJXIRu0PlkNKDZOwR7O528cUHCHFYH/Qm1gPcx3WSCeY/vFSf6P
	WB54tEUC0dcIlcYjyj3LrzKpqP2xUVQsT+8pJHjALwMJoPX1iTwiFkOKPDen5QgsdolQtD+wonBe+
	xOHByvmYUMPcgfN23T8u8pjKQhZmnTt4N3g/nIOPBb1sARqIegQAgMoJI/1u8/pO4wUa7PqCp1HHJ
	5YUKzDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRYb-0000000Du66-23NQ;
	Mon, 11 May 2026 14:24:29 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRYZ-0000000Du5S-1xdk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:24:28 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8cb5c9ba82bso641511385a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778509466; x=1779114266; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jkQyUrfkqfz8XQIv/dWok02t1PybehRH8tb5fDYY/+I=;
        b=kHoH2EARNNbSUPvT0YKcmRlQnJOFEABp7VeKTLvuLuSXHtxGKHhDJghu7CtWMFdksZ
         23ds+KBKuXd3WeI2P4VRRL/COmUkKiQqPFjmhKKuVYluqIpaQl1iioWN1qCgwx+93L/6
         Hry31YCxYV8QSuQeRQBmR6G4m3wCpyVEHxrPs/Chrs4JBdJO3VCLrTzPR6vm/e5PWxHA
         JmGg4OojMPukFriHaHnKI8roThEZ3C5/nbEmkWpiuOZ23Tl5HN5htCRop8YThFA1pGuP
         Ew52Of6bJc0zO+G7PhZ4xev724eWFJNRm+S3gbGSsWbzFESdPeb0XiCy7Rn0uMkvER5Q
         VKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778509466; x=1779114266;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jkQyUrfkqfz8XQIv/dWok02t1PybehRH8tb5fDYY/+I=;
        b=DLsb3KkI6OEyVSzpwk73sEp0/K+IOsTMp+PEoZYVEefqFNW/O0NWSYZuKc2/cepsJr
         jFIcuXRMoJ/j5ArbpFgjslODxYq5j6vamB0gDIHRzKw1k8N7hogjeS8O9wPj5vUp+OYG
         DmqodPmoKSO8EVj8BK2hPwiQeniw1cHzeGDtmsJEhGcgrQwA4+fa0J8CC/TvAbbOiqsT
         ZHdmYZPVVDgOXKGcqXpKjhJslgM2gTu1c+OpipHRK5sMg6YD8bMwk1aCioOogXxjU/l9
         fYQdfe3t7Kvh9VDOQqR9NFfFzQDEYbzX41yP+/CcDYcxb8FGWx4MJaNIHXdn3kBnMlFh
         /Sag==
X-Gm-Message-State: AOJu0YzclVd1cT+7VY/zreIw8uso1knSeSFWZJi/hr8giQzcffHBSQQX
	CPcsXwGATOXlJF/2nKuTW46B0WJZL4Ij5BvYdlh+/uqDBmMcJXvW2rIOcVUwIFIuntg=
X-Gm-Gg: Acq92OGQEvlTgnPz9lekq3TfilfmzxgMTzoK3x4xDf82LmFPh8E8UUh1XQTFmXkCXTJ
	o55Tqw+BNGlvsyZ10Emq8yUDBYPXGpkr01+siOY/eMf/e+sH2pfFCPtZHUlrbXQdZGc1HbQeK0f
	ysRuQzz/Wu9i7Jk00qKVrLo62FuByN5Kwb70TR9568LX0ngShWo50afr260H8DWeDjbgeNi94Zf
	OdELY85oVFYQTZ7YTXWltiQ7hmxmF6Axq7fHyWyo5j//nUMio8WqP4H39x9/G1SrfINjqY6kNp2
	PlJ0OYI8v1IGksUsl7m0Z7iHGKgOtC4G25zzPPD9vkp53G+RXBcgDNkCik8h2QyON5a6gwgUiqJ
	D489C03crMCVdMZvuj1job02QrnTznxfriRDGZhvg4IclDw4+j3MZQtLC1lAx6wzAVykgO2FrU6
	IbupVciB8FXPRK1VlvuAcKIrygwk17E+zESg+EqHbrY2MXvCkS8mK09PkMgvnlIBjXdSA9gpjti
	4fgAw==
X-Received: by 2002:a05:620a:19a0:b0:8ef:6b87:5c5b with SMTP id af79cd13be357-904d3eafa08mr3652391585a.9.1778509466038;
        Mon, 11 May 2026 07:24:26 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91cd89sm3166863085a.35.2026.05.11.07.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:24:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wMRYX-00000004oFc-0DRM;
	Mon, 11 May 2026 11:24:25 -0300
Date: Mon, 11 May 2026 11:24:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 04/25] iommu/arm-smmu-v3: Move TLB range invalidation
 into common code
Message-ID: <20260511142425.GQ9285@ziepe.ca>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-5-smostafa@google.com>
 <20260501124143.GB6912@ziepe.ca>
 <afiN1UwS9q6F6A_v@google.com>
 <afoYBYIJOTClsdLS@ziepe.ca>
 <afoeIVIGE-JjYy22@google.com>
 <afsPfEzgGtAFrN5P@ziepe.ca>
 <afxd8Km40A5ulZvd@google.com>
 <20260509232931.GJ9285@ziepe.ca>
 <agHBby1qBvR6cmJY@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agHBby1qBvR6cmJY@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_072427_518216_9A9FE363 
X-CRM114-Status: GOOD (  23.72  )
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

On Mon, May 11, 2026 at 11:45:51AM +0000, Mostafa Saleh wrote:
> On Sat, May 09, 2026 at 08:29:31PM -0300, Jason Gunthorpe wrote:
> > On Thu, May 07, 2026 at 09:40:00AM +0000, Mostafa Saleh wrote:
> > > But that doesn’t solve the problem, which is: At some point, whether
> > > eagerly from the page table code, through gather sync or a fancy
> > > invalidation array, the driver will need to populate a range
> > > invalidation command (tg, ttl, scale...) and this logic is better
> > > shared with the main driver which is this patch does.
> > 
> > My point is this patch doesn't share enough. If you do need to issue
> > invalidations then share everything below the top level tlbi entry
> > point and don't try to make a pkvm version of the entire logic just by
> > ripping out the range logic.
> > 
> > There is no reason for pkvm to need a different algorithm
> > here. Especially when you get to supporting ATS and multiple devices
> > and smmus you may as well just use the whole thing.
> > 
> > Which is why I suggested to copy the entire call chain into a shared
> > file
> 
> Agh, actually this seires doesn't deal with ATS, which I think is
> wrong, propably we have to issue CMDQ_OP_ATC_INV for the whole
> space on every S2 invalidation which has to be done per-SID and
> as it can't be done by VMID :/ or just hide ATS support from host for
> now, I will look into more for v7.

Hiding from the host is a fine solution to start with.

> But anyway, we don’t have to share any logic, the kernel driver
> is quite complicated as it is designed for a different use-case.
> Doing that makes the hypervisor unnecessary complicated and
> oversharing this logic makes the kernel driver less maintainable IMO.

invalidation is complicated, you should not try to open code your own
version. You really cannot make it any simpler than what is in the
driver, just use the code it is already decently modular.

Jason


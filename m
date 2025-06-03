Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C53DC5B555
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 14:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2tOvYIRYhJ3zgazeT9iy9SxHIfkqCxujQJZWAlLZ4g=; b=G8cu6ARl4B8/y1srb+BjjUB2iQ
	QhgTi2o8A2k2IEBKarnwoWLHC9FCanUfZseqEOMoxmmfzN8nZEJZOritqSSyZNJsjCKuON7hcZEm9
	AkSP/BPF7ycNscSEsqnQUScCnAxs/CdmEv3ezkUXnWi8gyfRPaE6WFE+irvUaeW0hS+oTHaigykzW
	AXLrlmbUuwTjwsBGSpwdMhK3olSk9tf7qXWTasy1mQ2t0nSaSDUIZiXOzh+xfIbwVgcAo92QNNJ9E
	kyc9H/jSq97xxDjYTda7wOSjP19LoEL+nL0JNoU8QMb4eE4Q+MLV5auJnQJEl8kdP/Qh7MmC+kvzl
	pIlFxXvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSrS-0000000BBXe-3WKC;
	Tue, 03 Jun 2025 14:43:30 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRp8-0000000B3Tn-0jtQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:37:03 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7d0a47f6692so416882285a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 06:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957821; x=1749562621; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M2tOvYIRYhJ3zgazeT9iy9SxHIfkqCxujQJZWAlLZ4g=;
        b=Dfc6GmWeVqUzMUenKrxDoOheptcWrT5Fa4zfwXVK6FcaTCGvNWlCuQ7OwCKk4f2lch
         jo3mcPypzBEetBifwg/ABFWmp2dRpYOH8pltTQWG3dF/pJ5gH8LUgMhz1PjKS98POvq8
         CRK1mmZ1068vQ2pNEwlFW9IKv2btUVCH1l+7je8mKM7oWGAZtYklZ0/WDsnxTvAM7Lrf
         gpVMqEvscM7LcCs3zvpKSNM++YyQvmP1sDK9BLibmIUvzntbyHHdzAloV5gIrdNL8un8
         QNAXJqbvU4lp05GaAYh44l032HjHYZE/4Eu5DCN2OO/vIV68emyt69gX5NE1OOuepw1G
         o/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957821; x=1749562621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2tOvYIRYhJ3zgazeT9iy9SxHIfkqCxujQJZWAlLZ4g=;
        b=pXeyUo1kqXpy5zVLZ2HtpJMWMirXqF8yIczUjsXbrTSi1r1n8p5JC3DWgZXUmVXhE5
         itcURSgnMzWAiVQCt3n/gsrmJQRmQ/IyEJ0pK5uMkeW6pI0owfX2r9pviy+SX17LZIQa
         6BeShXCvNuxVG/DKBpebYCFJxCx+GktgXiplPjUmCw0Xwb2iX6eMKZcw+lxhnFHyUBxM
         htFxe2wLMjfXSjJWrenYt7jFyRw/1qHcYc5HfHgH/b3IkAN2At7I+fR4qSm7vBXM8lus
         RM0qyXc/ErkdTVvFj8e5qRTXAyLinnPff0+cDqf234w2noCSYFNue3wX1Xv7by8avNnh
         JtQA==
X-Forwarded-Encrypted: i=1; AJvYcCXBw7yro8zeKJkewVRvMUJ2i/NV7UwA+NoOgCabS0hEdvn876/3qZgL6h2WzxnOWx8mPwuU1IYnKFxx9oPrXnA8@lists.infradead.org
X-Gm-Message-State: AOJu0YwVI3FtjAFaFm+pDcqMXEJ8mfIT732eLcPcOIyPzzXGXGEKlR7p
	EDiRamr2JFXGuVMhDXfIdxyzjdfLd19EWI4RJOS4asiNmPIdKMHpK9q0B7qx8lyHq0A=
X-Gm-Gg: ASbGncsABk0Q6vwOLuv+wtck+5qLo6CVIlATELbeIia+ZNeWTRs3oyN+QALw47c6t02
	CFIzBrUkQCGJ/KZnGq2hFYvex8ygdLI618EPMlW9Iruje5PZKvIVzx4v3oxVG2KbUor32FXEzwq
	Iu5bKWF52a95M1cq1n2X+RqLJ8J5bY2vMFJJ/SMYDaHIhK7IWKFaVs6mgwwWNchXPaSRm9g6dGw
	jdVu9aTacQWgiYzK60PalLOiczGI2lXVupTmDCa7RlVuR0GTgJ4VfJENeird/KSW9Vh89dAhN+u
	KYBQiLg4nvA+GTHgdF5o2FalLfwX++jluA8vIQYC8dipXRMCS6wTa4vw/13G7qhufHdOZLqh0U9
	De3iMu1pLfiZ7lYdt0SrfHo4VE+g=
X-Google-Smtp-Source: AGHT+IF/1nQKKWghBymIv6kapapYp3T/T+mDb2uBcjAQYD1rkFwd/p2CMx7wy82AG8RXeUKzw729SQ==
X-Received: by 2002:a05:620a:4408:b0:7c5:3d60:7f8d with SMTP id af79cd13be357-7d0a1fb91a0mr2626422385a.19.1748957820692;
        Tue, 03 Jun 2025 06:37:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0fa38fsm842635185a.35.2025.06.03.06.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:37:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRp5-00000001h5Y-2rWO;
	Tue, 03 Jun 2025 10:36:59 -0300
Date: Tue, 3 Jun 2025 10:36:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 03/12] mm/pagewalk: Skip dax pages in pagewalk
Message-ID: <20250603133659.GD386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_063702_219019_E370DBED 
X-CRM114-Status: GOOD (  14.03  )
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

On Thu, May 29, 2025 at 04:32:04PM +1000, Alistair Popple wrote:
> Previously dax pages were skipped by the pagewalk code as pud_special() or
> vm_normal_page{_pmd}() would be false for DAX pages. Now that dax pages are
> refcounted normally that is no longer the case, so add explicit checks to
> skip them.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/memremap.h | 11 +++++++++++
>  mm/pagewalk.c            | 12 ++++++++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)

But why do we want to skip them?

Like hmm uses pagewalk and it would like to see DAX pages?

I guess it makes sense from the perspective of not changing things,
but it seems like a comment should be left behind explaining that this
is just for legacy reasons until someone audits the callers.

Jason


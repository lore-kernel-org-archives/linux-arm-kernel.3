Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB36FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 12:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MdnKaX0TB6YagnPneZAL0SbiGRfNhnRbVRU61aMvP8=; b=OJ1dUzEIo2VP2txkMHPu50PVLY
	gL4+gc4wtVpcN3txm/zHjVEbdnZkSIZ3oRgpTuuO/pD3v6WZSgr5SJ2cTOj4mzxPT3Hgozxv7wt8D
	/FqPczhaMUGwNXjlYz6D97HQXoLgoUrcB5PAiPa1gRqJoSAkBR9tpUAb1CB+//CxtXsZUDpFETMoh
	5EB6nqqPESUiyW4CVCvVwnxqzascftEAGBb+ERuzYcKImsw+doYiGsUrcEHHdiCQnftkDGapJAf30
	Nh26gECvo8XPLwW8FmzH2I8f4Jqs6o3FXpfxJ1MEiHvlkfsIEzR4hO1Mw2hdwveMJ4VP4v+vW5Aaz
	AXH4ouxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJsAk-0000000D7ts-2wd6;
	Mon, 04 May 2026 12:13:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJsAi-0000000D7tD-0D1d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 12:13:13 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so170525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 05:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777896789; x=1778501589; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7MdnKaX0TB6YagnPneZAL0SbiGRfNhnRbVRU61aMvP8=;
        b=L5VzDaukZC+qpJi9CW664zdRyEe6NrFOFSLI9mFD9FqEwcxIGkBLqBmP20yMJ0fQd9
         4bHuiJOwNds1B4QLMdcoObpPc5YnF6gR0MoxJt+aqvHRFvoOt8TDSIUUSUb5uZEwEFjP
         Go4sSCU3vquGMFeQASDqifqb8ReHN4CXuoV3fh2urAZjCZDhG3AzJIz/WfXhC/duaBsm
         NuIMJmRO28TmFcZgczdUlb6rCd+kyHV4fJjalEHUe/g+XGFyh8lAH7ZxjEvIwd7OkfCb
         bopeGLAL/6O7kBcPQWrKqRCUwBQoaMsXbSk9g2GSvyBrIdlXWYlnu3GvHavRgnKBEZgX
         vJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777896789; x=1778501589;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7MdnKaX0TB6YagnPneZAL0SbiGRfNhnRbVRU61aMvP8=;
        b=fj2yj8wlN9l+XkiydWDS4EsoidFCfjO8FjfIBDwZ7Rnc1TzUyOJy0eu/+hU/HKj3kD
         Y7UltXJhi2ov1IhrGBdRzALwQe7HB4JFIGYLrDrPL47vLlPi2XVIDFnS3UT5yZitsXyE
         krqUeI0pqTl2GHFHQCu8a8fT4j5Me56o152zGzj514Lkhyk5PhDX1cq3CLfSqtJXUZ22
         zXuGxlM2gDIQWaaSuaUDbCK5PJPwIAGCm5AXzQA/9LJv8hFFNadhJqjUrZfiC6ELUHOR
         LU/M1y5pUBnbqZScj6GIN1j/6Q5X8wKKSD98G9T4fR2TXL97Wwny0myPEkSSPOiIP0Dr
         ni+Q==
X-Gm-Message-State: AOJu0Yxd6Q93kxUt+94q3gL7S0WzyjcLpjUyCUggAX9vWLMf1BnJFT8G
	Z7MaWWZA309b9JqhnLi5PUqIUjSrvK5wxNMlXHVuUV7PePWl/U7UexRjBs7BkPg39g==
X-Gm-Gg: AeBDieuM7PjZcp+o8gGY3+T1PkY0J94C5f+Km+NXD5CdvSREJeImU7cXibBBl8Vmj6B
	Ah6gB8DufY2868nT821H/BeDORvnuSh6AyXjsFXc1AhGbzMFdMCdkRPLdH3/D58QKh8wGV6Eglr
	Q6rro/RM3nufYPm1+gP25sYQyA8QcnK1rY9eqeww70zdadLVIDRKkBkpN7+gtXUczPLb54z5jLu
	8MNjpyqrZZRaIjQ4vdU0saQiMsFDmTVH/pmzvpIYYthZ0Lcu14D0QlCFM82nxLw0QZVtf+usBzy
	ZxpIUWwPI1+xcA5xrLqnsP4+SytvjocWoLO0VLONL54ZL6O7rWMfQT2jAm1j0T3BpbW+rbj04M8
	wruL5SCEhoKhN+wKp+OMgMVsBAgAlFHfImx0xhXibm1TLCWtKAFGefXs8xuIOAMM6+B1M7m4OC5
	E+3ahrAhym1O1nwRW5zblX06gnr5BVhnKs9JfMEBdOcArU97tt5A5XsatWnngO84iusKWAEdXCb
	0U1Kg==
X-Received: by 2002:a05:600c:c3cf:10b0:485:1a54:9407 with SMTP id 5b1f17b1804b1-48a97f9d4cbmr1615265e9.0.1777896788643;
        Mon, 04 May 2026 05:13:08 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8bf18c9bsm25362412f8f.0.2026.05.04.05.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 05:13:07 -0700 (PDT)
Date: Mon, 4 May 2026 12:13:04 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 03/25] iommu/arm-smmu-v3: Split code with hyp
Message-ID: <afiNUBlnTGNzXIan@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-4-smostafa@google.com>
 <20260501124445.GC6912@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260501124445.GC6912@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_051312_096451_2C7E16B3 
X-CRM114-Status: GOOD (  13.04  )
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

On Fri, May 01, 2026 at 09:44:45AM -0300, Jason Gunthorpe wrote:
> On Fri, May 01, 2026 at 11:19:05AM +0000, Mostafa Saleh wrote:
> > +int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
> > +{
> > +	memset(cmd, 0, 1 << CMDQ_ENT_SZ_SHIFT);
> > +	cmd[0] |= FIELD_PREP(CMDQ_0_OP, ent->opcode);
> 
> Hopefully I get to it today, but I am going to post a series that will
> move this logic into the headers while deleting arm_smmu_cmdq_ent. It
> should be directly usable for pkvm as well to achieve this same split
> without having to shove a giant inline into a header file.
> 
> https://github.com/jgunthorpe/linux/commits/iommu_pt_arm64/
> 
> cover-letter: Remove SMMUv3 struct arm_smmu_cmdq_ent

I see it’s already posted, I will go through it and provide feedback there.

Thanks,
Mostafa

> 
> Jason


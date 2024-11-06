Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5567CD59F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 16:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nSgGdK6NvqqFV9LyhiXVQ/e823UrG8JIi5eQbgWpwM=; b=tNPUjo7pVzcM5EJIRzG6cRjRvz
	AVcUsy4XJNPU2Qp3YR1945jXa3Hg53xEy/ZCYwnYbnqJG1eW9OxDnbPBANDwmVxl8Bx847EZA+9XB
	K8wKqwt/3ylWkJj/eiiDY01MZeGe4NAix8DC710ZHNR995yfV5N3WUJ8QiCanYZ25fsYghS1c7SdY
	wva+OQkr6rQugr5xleIPdfZq9CWF9neGSO4lXUmGvGqDmaqpB5Xz/vQbr3KAfN1VlM7r0+KVZ2YJ8
	u+Fyj9Q+PPq+Na3DhQY0Pdbd7H6EfFCAR1t1Z/wlepRQoyW35Yeb9Gup5s/uBRmGtTFbw8CowneR8
	Y67AWXxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ik7-000000040Ie-1QWZ;
	Wed, 06 Nov 2024 16:18:51 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8igm-00000003zkH-1avL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 16:15:26 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6cbf2fc28feso44528996d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 08:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1730909722; x=1731514522; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6nSgGdK6NvqqFV9LyhiXVQ/e823UrG8JIi5eQbgWpwM=;
        b=MKnImOnlcw3qWY9lIUnfvm7dKjKyZX956nHr301AAfdWjKI5eljcVBLXZ9Jh/riPFi
         qzMBDF8MmH3D93yDgOpMhJC1UE8E7UnDA3J5T9OPve3U6YL4dr79uQYUnaflSrni7bBV
         agYhma9Zwf+oHjx/4bBuogN8oDCe4ZiA0qilRCL59XKKhU6r0SLUNzvEqi0WfCbL97pv
         UD1aIAdTMX5oXpei+L0vbmB7592F1yL6S1Xy2Mvgx/zMyG0ta6HDAg21bHKw9zGlyqUt
         uTLLoRQ0FsC5E/7jQ0LQKPwhNP3MXdb1GspvUA6MP6nftoy0Q66gHyC4PNuRO8d0NZZh
         Wj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730909722; x=1731514522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nSgGdK6NvqqFV9LyhiXVQ/e823UrG8JIi5eQbgWpwM=;
        b=LWz894nnVwwRexWXVrUlus3k3OXBuKCyzMlvIe9Kaxs1WJtFli5LG3mjAkr+H90sLK
         Bzny0VbAXtAuMS1nY+NLHosC2CvZL8locft159lA7fYujD7N36C6UH0B5HG2oVnDw3Wg
         LuY68uxl3j1hc3PCrmS7nGkx471M0PYThq4cAeeJsIEzed1USWP2M6EdTNh3/HBdwvFD
         feq72Uul02AGwQRRPXMVloCBjVSwSvUTpAydNWSFQIORcvN7gcaHWkA4dB6g4uRRpX0M
         RnnuHxDyraeZjpGbURCigqSX2FFzy+MWklJ1UNfg3nNmjgG30BAVOZsgFnDLW6oYFXSa
         ATHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDonV7EJrDyQnv4++wiyM4BNzYeeDPTYkcli7hwPFEnH87hC1vyoMKjVn5FRh5cmYZgzcOEzlLccuhbSOviI63@lists.infradead.org
X-Gm-Message-State: AOJu0YyLRpmM8n4f0xxQ1oVnY43Wror1cHqP79f3f7hX7RxQXY5U6+Sf
	JZO0VvQLeIZQ0sjPNak+DVD2iSAW7GtgjBPDyskxBcgP1x8pWIoFXG7J2x2B4HQ=
X-Google-Smtp-Source: AGHT+IEwombH/Npcr6xgQKI4hUOBNWDndBBc7puCreP3V/CqgxTRomKyutXho3m/FUi9CO1Dgd2M5Q==
X-Received: by 2002:a05:6214:2c13:b0:6cb:f654:55ac with SMTP id 6a1803df08f44-6d185683569mr561328396d6.11.1730909722261;
        Wed, 06 Nov 2024 08:15:22 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f39ebaadsm644777685a.2.2024.11.06.08.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 08:15:21 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1t8igi-00000002BDj-3v7y;
	Wed, 06 Nov 2024 12:15:20 -0400
Date: Wed, 6 Nov 2024 12:15:20 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, catalin.marinas@arm.com,
	kernel-team@android.com,
	Boris Brezillon <boris.brezillon@collabora.com>,
	dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
	patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 0/3] Remove split on unmap behavior
Message-ID: <20241106161520.GJ35848@ziepe.ca>
References: <0-v3-b3a5b5937f56+7bb-arm_no_split_jgg@nvidia.com>
 <173090505900.4167208.10850898110820689849.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173090505900.4167208.10850898110820689849.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_081524_612780_77910E71 
X-CRM114-Status: GOOD (  18.79  )
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

On Wed, Nov 06, 2024 at 03:53:23PM +0000, Will Deacon wrote:
> On Tue, 05 Nov 2024 14:14:23 -0400, Jason Gunthorpe wrote:
> > This is the result of the discussion on removing split. We agreed that
> > split is not required, and no application should ask for anything that
> > would not unmap a full large IOPTE.
> > 
> > Instead of split the two ARM drivers will now WARN_ON and return 0. This
> > is in contrast to what several other drivers do of removing the whole
> > IOPTE and returning 0.
> > 
> > [...]
> 
> Applied to iommu (arm/smmu), thanks!
> 
> [1/3] iommu/io-pgtable-arm: Remove split on unmap behavior
>       https://git.kernel.org/iommu/c/33729a5fc0ca
> [2/3] iommu/io-pgtable-arm-v7s: Remove split on unmap behavior
>       https://git.kernel.org/iommu/c/fd50651636fb
> [3/3] iommu: Add a kdoc to iommu_unmap()
>       https://git.kernel.org/iommu/c/6ac7dffe7cca

Thanks, can you add this hunk to fix the W=1 warning?

--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -820,7 +820,7 @@ static int __init arm_v7s_do_selftests(void)
                .pgsize_bitmap = SZ_4K | SZ_64K | SZ_1M | SZ_16M,
        };
        unsigned int iova, size;
-       unsigned int i, loopnr = 0;
+       unsigned int i;
        size_t mapped;
 
        selftest_running = true;
@@ -868,7 +868,6 @@ static int __init arm_v7s_do_selftests(void)
                        return __FAIL(ops);
 
                iova += SZ_16M;
-               loopnr++;
        }
 
        /* Full unmap */


Jason


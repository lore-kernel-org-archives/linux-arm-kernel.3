Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF57CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 21:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koV0ihSYfTL2npSJwGSG73dkvB4FHzU70amYo7Uj8bs=; b=42sqsfnUvH/+VwINtvMkt5Wau8
	XApCqwImu7ZgRHjeANRHaeT9EwW+rXLdibcVV3/k86rfyHqwXXyGVSIgjZ8qlcWjU4iuE6/4azeTi
	/Gmij4FmXTwVZyUjyaQI6up9MWTG0QDkTz6ytI6fmYTFAoWYjbtdV0WABDzJsksy9Myu5QIwKwSq6
	ErvFX68SW/DlUP6kkxNwajlJ6Zzb59S1GHuABF9jPhLkdfSTDvrHMVyd2wFoqqJbAePzX3zmTWCed
	8pYCrItyek0byCjybm2575eWzwHssuPRjkE8HQ85COEn0wsZBgZampFYbRM7ArC4I08F186K7HMsc
	2BhwKtaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSiYt-00000006QDU-12Ap;
	Thu, 28 May 2026 21:46:43 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSiYr-00000006QD8-0MsL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 21:46:42 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ba180a022dso1515ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 14:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780004800; x=1780609600; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=koV0ihSYfTL2npSJwGSG73dkvB4FHzU70amYo7Uj8bs=;
        b=diccYQBQXkEgd/c6FgXJnlPJM7/R18co1baWCGasBxYCbq4gLjfKvAFVFICjw6PpP6
         RRFLShmbhfpWdBaYvG+rqdrk5h2pKWBng+eO+kaqrl7SQ36xUFSuURwjfqbev13recF/
         YPFUu3DEDzcw2jt2r8SkA8iSH1M4zZLqHPHAaCenZpPJUcCtHnuvyzgJyJ79gyevvjis
         NwPhX2ZxsdFPhHWjMDXzK6vg1tgON8m4C9rhUoE1kVORihOmQLz94GOb5UhgWuozernF
         ucTRjP3U3OWSaK8mXQ2jhLwB3NVgeWMVLrhAW1Fqe2+wjna2AkEJEyo335eUjagkLNu6
         zJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780004800; x=1780609600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koV0ihSYfTL2npSJwGSG73dkvB4FHzU70amYo7Uj8bs=;
        b=Qy1DPj1Auzs8cqpgOdkusmc8GeJQt6uTYKHZ3kJr3SMgGfX3PYxP9siu4OSe9GdgNX
         kKZ1MKBVZFy5fw3u3LdLUqXuwzQsEmiUvdc36RjyCELftY0Czr1iVezx5TGcKF/qCT4m
         Fzp+mLGBy8SQByIY6W4Z/RrW/VG3Q5Ue3erUKxdWixCMKsMJexL45b5K0+oIZrUMeOQA
         RaqQMAcFDe3xLbx7FsG9LMsTIgJ5Vsnnh1+4+0nBEQutii3eBgUxccIQDhmp9tXWWOcP
         cIdQ71OrVHsmEZvYShVXkiudx6DEaQuGelklY7hA6KRVCvXclmXMqZv8dUuqEF5MHKf3
         GVyA==
X-Forwarded-Encrypted: i=1; AFNElJ8Z+UH0YifyqwTub45rhAApe3IHJlZ1HOHjV0tuAMKut6JQghnbPcKXyJoE7pOgy9d4NqBTgzuNrMQ+o+scR5qt@lists.infradead.org
X-Gm-Message-State: AOJu0YxlWwrvocB6NHEN4pwWnWEs9GR6/P4GZg/A6Cba0FSYpC00h9Wq
	uRkHzHEEHXQXIAHBfgGS4c03SBMoWugXKl2LzXT4hZcoXc0ecddHlIwebHK11Ry2tQ==
X-Gm-Gg: Acq92OFO2/nNhYoz8X8d4RTf+tmk/mSsxyddQ140JHQOxmxNaGezaPYqsNUT2sz1zHd
	i1xd1W05SfdRfIdOtWZ54OKpvK38O8k3DZxieOYfzExBaDcK5W3n2SN/GAZKMANNANGYxBSRsm2
	rMEGwsA0DFYbmS1GuyJDOcyv65YZ7NFf++I12gyka+nZ49CJslCV+IJbR4TnZq1/zO61UHY0lOa
	3yD0TETzsFzfksYLYN4yYg20ChsaMSMqzTiT5stqH+T7ImVLcmyxhKGcWio61Y0jwmSyPpTsP5w
	OtjF5kAGLCTOddu9GiLFpnUbYAlBDJmj9W8/ZHMtrjNbn2Po3nBFBz3XBGJiAyKU4u5aZuUa1ae
	QbXimV7+xaCr2lZsknQceanjJ2pf9fdBp4biar+WnsNi4MFdnh0e/AZMXf+jy/u+hLsWnzhwNIb
	7iQh5vIIbynf/KFJ4xKUmVNm1bub3Y9ixTwGUFjC/FfstJgojTw4G+XnWo+mQB1rU8PD35
X-Received: by 2002:a17:903:3d06:b0:2b4:6529:7bae with SMTP id d9443c01a7336-2bf20d40768mr208615ad.17.1780004799794;
        Thu, 28 May 2026 14:46:39 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8575db0c37sm2454a12.31.2026.05.28.14.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 14:46:39 -0700 (PDT)
Date: Thu, 28 May 2026 21:46:33 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 10/11] iommu/arm-smmu-v3: Invoke pm_runtime before hw
 access
Message-ID: <ahi3uY9YZZtR1Lq5@google.com>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-11-praan@google.com>
 <ahilX8Za1NRCH3ik@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahilX8Za1NRCH3ik@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_144641_152221_B0F55282 
X-CRM114-Status: GOOD (  12.50  )
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

On Thu, May 28, 2026 at 01:28:15PM -0700, Nicolin Chen wrote:
> On Wed, May 27, 2026 at 10:14:06PM +0000, Pranjal Shrivastava wrote:
> > TLB and CFG invalidations are
> > elided if the SMMU is suspended by observing the CMDQ_PROD_STOP_FLAG via
> > the arm_smmu_can_elide() helper.
> 
> All the arm_smmu_can_elide() call sites here would eventually elide
> the commands in arm_smmu_cmdq_issue_cmdlist() that is already gated
> by CMDQ_PROD_STOP_FLAG? It doesn't seem necessary to gate again?

While issue_cmdlist() would eventually elide these commands, the 
can_elide() check is necessary to return early during suspension. 

This avoids unnecessary stack allocation, cmd building, and spinlock
contention on the cmdq->lock for threads that are anyway about to be 
elided. 

By dropping these requests immediately, we significantly reduce cacheline
bouncing and contention during unmap storms. Furthermore, the early check
also allows us to specifically trigger the WARN_ON_ONCE() for broken
devlinks.

Thanks,
Praan


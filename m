Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE495D72365
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyWsTfJZcYK//5wQfcKhofWEgkaqMSSIFZwYXzEmD0A=; b=DYY9D5kWw+qUbOFNQSQYx/YUVZ
	khRiplzHn/nZ4yfi4RIp8jPFpkh3aCU8vs2nf7ziSstYpTUhze1/spMmQaOIU6A4O0xjshp6YooGW
	XX+6vKo56KWKl0t+yu9VerOPGZ7t0kCUnBsmPRUctOmVb6AcFQ9qATI2oDXznJWkImqOUsBhxNUlR
	QFl1y3Z+A559eEWh+xgjRd+o50+Okbh2cfIOhLOfRTFsyA6QJksVqICKn9y0DeIuJZk1nsYePp8Em
	YG2qsQ1NW5oZ8nvHWicIBz+1NXtIqixcfeoJpfTWV4kMQYUBrpFsZ5tM0Jkp8tUzQ2wb4bGmv+nN+
	D5uh79ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDnk-00000008cHx-19hc;
	Fri, 23 Jan 2026 09:50:00 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDnh-00000008cHR-2OOs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:49:58 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a35ae38bdfso99105ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 01:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769161796; x=1769766596; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xyWsTfJZcYK//5wQfcKhofWEgkaqMSSIFZwYXzEmD0A=;
        b=Y0I1qWHz5ZuRSqL7ev3gETQ6mw+KiROFaRJNnzDaPi3Bi9XKGWQKxn/3jEf1VzxgKn
         ldD5CX7ufZ40F6zj9bSJlHUF8nYO+y+KeVYSBUM1AZ8dRvoPxsH+r3K9n7QE66A7HTpG
         phyHWPWDVwQgE5tFCLwjIPoi46YUuBGB3K7zvUQqHzIaaOg0cBd0S4X5q8rkgwcVW7x5
         TGFfsh1YzFfcFUx5KGaZRReZnFgi8gdN2DlUk66wjUeDrlURGe0ws6FHAEobfW2scFNF
         Me/83E5e+cIEABzF2bq8d1B3rXwqe7ubGX+O8hPy/GmYTbWY2ZsjqJ98BRuWNZNEpSeA
         T3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769161796; x=1769766596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xyWsTfJZcYK//5wQfcKhofWEgkaqMSSIFZwYXzEmD0A=;
        b=eIa3jXwQqSVU4bpVEB12QQxnRRBek0dTXRkkNiR+cW8qRyw+uGypEeMIDN/Lu8eCrb
         RNpOItL5uXxVRtV7ScvnwEr8OygMfqZCS3Hh9MZPnfrPg360/oFgHQRjw2Av5Szlz6/n
         m6spCmJ+Xn8YWRD0CEXgfusge+cC0tZF2A5Z6B5vER357MhMrNv5cqMhRtqYHlu4ISml
         2sH039qwHdfrxtcpKgYZCSWd2ManOF8DEI7/u1z5lzVRQMHo4sEEK88+I2eDMgReRO0I
         StwFFS156vil/2fK7VjorQ4z01rAShtyA5HgJjKBnX+Mlf7g2afh9vJeIEDZEXAGP7zT
         TKSw==
X-Forwarded-Encrypted: i=1; AJvYcCUyuygJnEVhC/cUDp/tXcKEEO8hE5asEGx75QMeYzlSPVYlToGArWeMyEybsE4kaGTC3u2uLOlRgtf3848l5NhR@lists.infradead.org
X-Gm-Message-State: AOJu0Yymf2zcn88hqkrlycw7/5g1+14Bkb9UaTx2o/2FMamUkhMqpBK2
	BsFIYK4ghV74Vd9l/vC2lOlRlpnPNUVOz2PXIrNFXlytYq/zzua7ztzJpJYT+DmiWA==
X-Gm-Gg: AZuq6aKUqaZfFRLC5yed5WdPm+c0uW/JLw6XNMX5Wadq3Us0CiCh9G6OpguyEUwwC26
	NOgyrE3tyQHGN+7A/ab5wbTdfuFM8nrFhozKjhpO4p1VgExhBVI5yD28TacLfydN4PIHVHCvtKn
	OQ6lAgL1V8XifaXjvZV+NswFEhdJEHpitaE6Z89Emb2hHWoEYR3g2I0+OFKMWUvZipBvj2QwBiy
	QNQN5opJAOvcUKSmxYHi6PDMx6X3qX9XOsi6uw/OOMgS8tITBgEz5Upp/96iUANKdDM1Wwgatlz
	sWKtuu3n+1DyNkIzwVuUuWopa0ONpmR3foO1zgHkh9T7IZh7gI9TwWgDjIw39Ez3Zww4ncvRMbA
	j5mZe3Wn/JitPwsDlL0DHWTqyApDZlnQ9b+bMgT5Dy9mYx8D5N58y0NGltaaDAHjc9aoLdtqG75
	m/g2yAp3U5PNvnsv9lYmdrqwfSOLB1HW9zV9h2P42iw1t49zTZ
X-Received: by 2002:a17:902:cf01:b0:2a1:3cda:8e99 with SMTP id d9443c01a7336-2a805d45517mr1730985ad.21.1769161795998;
        Fri, 23 Jan 2026 01:49:55 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fd929asm15517935ad.90.2026.01.23.01.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:49:55 -0800 (PST)
Date: Fri, 23 Jan 2026 09:49:49 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, jean-philippe@linaro.org, robin.murphy@arm.com,
	joro@8bytes.org, jgg@nvidia.com, balbirs@nvidia.com,
	miko.lenczewski@arm.com, peterz@infradead.org, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/7] iommu/arm-smmu-v3: Explicitly set
 smmu_domain->stage for SVA
Message-ID: <aXNEPTBNGq7sK9Bz@google.com>
References: <cover.1766174731.git.nicolinc@nvidia.com>
 <df4b8cbc0d67a0bfcccb09be868e0da5f0cbb743.1766174731.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df4b8cbc0d67a0bfcccb09be868e0da5f0cbb743.1766174731.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_014957_608351_AD2798A9 
X-CRM114-Status: GOOD (  12.91  )
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

On Fri, Dec 19, 2025 at 12:11:23PM -0800, Nicolin Chen wrote:
> Both the ARM_SMMU_DOMAIN_S1 case and the SVA case use ASID, requiring ASID
> based invalidation commands to flush the TLB.
> 
> Define an ARM_SMMU_DOMAIN_SVA to make the SVA case clear to share the same
> path with the ARM_SMMU_DOMAIN_S1 case, which will be a part of the routine
> to build a new per-domain invalidation array.
> 
> There is no function change.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Acked-by: Balbir Singh <balbirs@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     | 1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 3 +++
>  3 files changed, 5 insertions(+)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan


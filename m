Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D3DC9831E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 22:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIp+aiyQTzTnGdKMDtuefZl/ywWVdEoeMd4a05iequo=; b=nSDLVufIxPuNyYO5lsxGjaLe82
	FVc/WwJ0Yj9je/KnAQZE8AZfPZ4PFKqlYS3AlV9B26yvoYLaWXBSFN/sSwKMeiorK2h08qaq9O6bm
	jXbAjrlP1Fz6ow/AhF7Ml3084bjZ/cJD10dL1YLqiRI2fBywrzYXvCfsFVCZd9ZTJA5RDif2EJgtP
	ZutBkT0QBiQrIYUvp2FzydtuzM9tXsD7xERLO8uv/T0B2gBT3ESuqhpjtn1b56dXEZez+vjxxToGD
	enr01pJrXCAa2F1IsmZpjmWcV7PaT8g3ZQS3vkImtE9uymtIx1RxGspfcjW7yghl6bfmH1IwmHlOS
	pWwFORnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sLq-0000000CKsR-2px3;
	Thu, 24 Sep 2026 22:55:38 +0000
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sLo-0000000CKs6-3XYG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 22:55:38 +0000
Received: by mail-dy2-x0e.google.com with SMTP id 5a478bee46e88-34182b58c7eso85998eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 15:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790290536; x=1790895336; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tIp+aiyQTzTnGdKMDtuefZl/ywWVdEoeMd4a05iequo=;
        b=LGnSKgcSo3y8RXklRWRLKSGPf1NXqNykTFrcPe3Wya6bU9QI8EFgkr3xy38vTN+rfz
         3792lWHJd5TDcD7PyE7T6tBPRgcKC6IvdZicBIhz2GFW3tC0H2W3FvtNDR9UEu52eF3F
         l6qRVNQSw1cJKO7nhLxbWisX7heG4ajcm6CFZ7xbvngJZmHDpolBQoIoqC/JM4tnSE+M
         nysce8dw1muLqmbnpGAIA5Lu+H0LC5j7oe63fhTEHGeJYQ895UVeo/hZM4v4EY++HtE4
         ++H16PNpqWuoua8h/2wwIueM1g3cyhp7TTBrVcv6lvEloA0+dBdbdq6ho6LIOBejgE9h
         Ay7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290536; x=1790895336;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tIp+aiyQTzTnGdKMDtuefZl/ywWVdEoeMd4a05iequo=;
        b=gDt/6XArCX/QiVgh/j9g9t3eOT/35oFU2qExJQx9bsqO6+uIDj9C8ciwXif3w03OfT
         0rDkblN1xmWMOlpN/fDhMKet8eAvB43ccKLF++yPbiMg4b5QkxThDgTynEYCVUTpou63
         B8J/5CtZtH1HTBLl/YAajykWnN5dnAWY6ilOC/kn9dIMlCtXZqkrMzG8IK+aCMNvffVP
         ra4GjbsF0+VaUvwH2JOBPCsyuRrwdpq65f7/5npRb3TUQBQtV1CbL6ixFFHA1sjBA75z
         CGInvfSmBTnOomuOA/PGQT2B4XWn40J07+pWETWW2zslVaJoI9ivcpZLk6R8I8iKzBJo
         MdCw==
X-Forwarded-Encrypted: i=1; AKwUvBzwTlhUc1CYsDEuFGCQgerlnLtCuhfzkuTzMdZN6PTzd5hpCYBnPdAvXgtrh1A1tQhRA+IKsT3yyRbWnfuS7Doo@lists.infradead.org
X-Gm-Message-State: AFuF++krypqSwP9beEvq9JyQ6nyEczlB2aXLWlqDXeEioW9sGtYHjzCL
	WPvJY8iHH0yHhQwqqiG6zSjHRoBv8mD5rYunp/x6JifmJXgj9IdMbnU4iWN4OLyYseo=
X-Gm-Gg: AYBFou18Yw8TaGXn+ZINpDvRu7edbMxDbx3LWV0InOvhbjOvWMhcBiWlSRrLZTUKVly
	OghRVSsBl5KVmsBFGEZ2WQoZqknqIhriLEdQh5/1WyaeU6SG/DyJYTQ9K0DpM/QmSdyUq3dzQl0
	xJsjsB9jZRwS012Iz9ZZNc3RSaiBohoKgRDxFZb2dALlz27CXJP3p4wOQtntG+NQ+Uu9/R7Udj8
	Ry3azOiaGK39+yW9MdrdUSvPbtiWgSfcMTZjumE7zdnQlaWRJjWiVFMDTgjGy944nUAiW/C5/uL
	oSLCWenyyd6+KXjHXklN3b/FVmB9J3hgGE0SRl1XiHRmbbOmb2mjUTLTxaW8OxQ2E1tj6x3hPNH
	oCkitCkh3fS6ExAvp86w071+tDhUnvHp578DDRjyPH0cya6vf3FnjO8is1FtA96+CHrnqYyGGmt
	QAH0kbuliZm5Bh1Rl6KYbwU8U2vlIoxGi9sbWsj2qfMyjj
X-Received: by 2002:a05:7300:7312:b0:33b:dd45:716c with SMTP id 5a478bee46e88-340cc11f887mr2763537eec.13.1790290535581;
        Thu, 24 Sep 2026 15:55:35 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141d2fe4bsm1639551eec.4.2026.09.24.15.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:55:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9sLm-00000000elU-0EsA;
	Thu, 24 Sep 2026 19:55:34 -0300
Date: Thu, 24 Sep 2026 19:55:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Mentz <danielmentz@google.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
Message-ID: <20260924225534.GD16465@ziepe.ca>
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
 <CAE2F3rAMAnV9+WNLZtGQX6cHPsZ6wbfRJ1Z3d5mF1+8WHL-uMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE2F3rAMAnV9+WNLZtGQX6cHPsZ6wbfRJ1Z3d5mF1+8WHL-uMA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_155536_898529_AF7C000A 
X-CRM114-Status: GOOD (  13.29  )
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

On Thu, Sep 24, 2026 at 01:36:12PM -0700, Daniel Mentz wrote:

> Interaction with Hardware Dirty Tracking (IO_PGTABLE_QUIRK_ARM_HD)
> 
> When Hardware Dirty Tracking (ARM_LPAE_PTE_DBM) is enabled on Stage-1 tables:
>  * In visit_dirty() / arm_lpae_read_and_clear_dirty(), dirty bits are
> queried and cleared on a page-by-page granularity
> (iopte_set_writeable_clean(ptep)).
>  * If a single 4KB page within a 64KB CONT group is marked clean while
> neighboring pages remain marked dirty/writeable, the descriptors in
> that group will differ in access permissions (AP[2]).
>  * According to Arm ARM D8.3.1, all descriptors in a contiguous block
> must share identical permissions and attributes. If dirty tracking is
> active on a domain, consider whether IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT
> should be set or whether CONT sizes should be suppressed when
> IO_PGTABLE_QUIRK_ARM_HD is active.

This is right, handling dirty and CONT together is a PITA. You should
probably make them exclusive for this simplified implementation.

SMMUv3 is the only user of dirty and it will switch to iommupt which
does all this right.

Jason


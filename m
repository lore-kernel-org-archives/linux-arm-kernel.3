Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE791C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 18:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjn+XNWiK56tmINhkcWxojIKugJpXGM2NaDQl0J3MLw=; b=UX1z6ywI0PZveclsrlcYvVtOV4
	DpdP7BLcxXYTTqX8Pfg8Oe83LebzS8OzYKz8Rr5O2Ar6lrvPllOJpO1SvlWJ0AZbN6V89cnOrfWug
	pNG6Ot4GCrsoYJ8YfjFM4Avhu50dLHy6EC5nTcL96j/1U+41b8G/jRiLICVjlhWAzFInFl917MOgI
	cy9dBarAWhPAQKmClprTVzBybyTspKRMl6ZjEAgcizwzUnkNHXzdfRF6SbzYpwrPw/N1LFo0cUk5+
	DsbK1MvDg44L/XdjUBQrObEwyc+ip3zs8KNXANrWKdbKn/+Cp5f7NjVtawUn72Dk9L/0bC8gKdLh1
	bLPR1zbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3eLH-00000007bYs-3sD5;
	Mon, 07 Sep 2026 18:45:19 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3eLD-00000007bWy-2l8p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 18:45:17 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-92f0b5ed131so463030585a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 11:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788806714; x=1789411514; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sjn+XNWiK56tmINhkcWxojIKugJpXGM2NaDQl0J3MLw=;
        b=S0fxUNfd+SKa7wTwLBgfoXTQBj25pCTjLji5N1YK+/mo/jXgWFkbRk6aV0P6tNgMvE
         fPj4LVw/iNTab62VzSY2DNaTFRMGhmdKBoIaeXdBzju9Z+AANerFbCjJ4uTBPHVAwOzx
         0NhgT1sDoJ36DFqBzJP4e2H/xMswaEYUDGP7B4tk7YJ0qswMnjFTK9meSD3+xBtLF6t/
         ix6U7P0pbDpZlOnQebS5W9OGJHjKpohy3++I9rHl2U2Sl602UPJrzoUJ4+QxjnMqQWZD
         jkHR6FkZyOqgeq0QwSCzGQkEOWWXfKivm14tGGcJToKzw670/iUSsekhwWrCe7pxXRLj
         gOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788806714; x=1789411514;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sjn+XNWiK56tmINhkcWxojIKugJpXGM2NaDQl0J3MLw=;
        b=myjHwCe+MuTW4vBffXuG2r+RIvl9oEmW7T9JNHPLQjgyo5xa0+llFpIcBov9TbH3vv
         tySwdtZoswEQlaFK3cdHvi8nW5jGHI0S7Jo9EWUXgjINCjYl07TgTwYiZqgl0Ln/8v0a
         mfeAatQPLTM9dSPLFmhHWFdkpB/YMIjsbEP2khGV4B+Pz0noUnQLtZk63vVHm7uPSEkS
         2EBtLnwLjc8E0UW9zer8JJtRV09tt0R6cjwW5B56+hRAnMmMU5kDk1NKQ9AziWkisb9H
         JhD8hxsdBjmhCkrTWlX5MRUW0aKmTgTd3ceOjzLMuxQByAGRzHVVVDY0GxCXIygzsgXC
         sshA==
X-Forwarded-Encrypted: i=1; AKwUvBwJgQdzQi6TzOuhjl49T/lNi4593cMH48RRoHzpN5dpGnH3mv9HHRV4/ehke+F/EJ4aMkdHA6OllU4a38PMPyU4@lists.infradead.org
X-Gm-Message-State: AFuF++ltZScGWaxhbVhxLFdvjfAZvko7m7RfylTXPYy+jarV1yx+/HI5
	QKeu8D7F0my2C6gDQHND5ix1+ZZgesOgpcmCPpTAla8VVp7c0Dlu1q5CQiOoCCl9Yqw=
X-Gm-Gg: AYBFou0XK5H6q3j1XbAePotdI6OaON6xVp5eg9Lp3NFzIFMutg2w54zP634JN9Ppd41
	merLK5oZLz7oTkQe/1+iZZFnNl82Ib0DLpodfCRzCFfDDPC9Xrw97L9+jfntphb2pBfZg32FAfN
	iQzTmPxkXVesS3YezQW4o/hLLEioPHo8nTni7vWdr6x7xw3pYZ2OXjwpka42odpGde/zrF7tHmZ
	oxNq277wNCq28Yf3svGvmHI19dgcGYQi6NN9qoWp7NcLuorocBho+rvhZvnxSMNdRzkqtEX5Jrn
	xsjR3ww0DkgGWLe+usobxbpB1zjL1rOunQf3XJWL08bCOgvkZ1KhuQJ4TKmZ2DYvwEydP1WvqL4
	66YeqcNrujLqTBRsvTFxqgX6mNk/z6CId4Bnq8B6xWwzYlg8MJmHSLjYa0FQ4LaFWPomI03nrfv
	isXR2nNJA00VGnEnOasr5jZvgRN9zkOCTGSxvwDnqGHz+YOADYU0Z+yuL10Fg7an22O72701fr7
	haashHgIhih+5clF2T0rkN86FIGSNNsKr88Enks1mbIXmArgLuAhU07
X-Received: by 2002:a05:620a:690e:b0:939:6de8:43de with SMTP id af79cd13be357-939804e9754mr2480105785a.50.1788806714194;
        Mon, 07 Sep 2026 11:45:14 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397f9f151esm943101985a.6.2026.09.07.11.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:45:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x3eLB-0000000BMS0-0MGY;
	Mon, 07 Sep 2026 15:45:13 -0300
Date: Mon, 7 Sep 2026 15:45:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jpb@kernel.org,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, praan@google.com
Subject: Re: [PATCH] iommu/arm-smmu-v3-sva: Relax ASID requirements
Message-ID: <20260907184513.GA2543240@ziepe.ca>
References: <20260907154928.4012151-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907154928.4012151-1-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_114515_768666_CCC52004 
X-CRM114-Status: GOOD (  14.47  )
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

On Mon, Sep 07, 2026 at 03:49:28PM +0000, Mostafa Saleh wrote:
> arm_smmu_sva_supported() have some residual checks for ASID from the
> original commit d744f9e6c222 ("iommu/arm-smmu-v3: Check for SVA features")
> 
> As DVM was used for TLB invalidation and the ASID of the domain was shared
> with the CPU process.
> 
> However, the commit
> d38c28dbefee ("iommu/arm-smmu-v3: Put the SVA mmu notifier in the smmu_domain")
> removed that support.
> 
> So matching the SMMU ASID space to the CPU is unnecessary and can be
> relaxed.
> 
> Remove the CPU ASID related code, and update the print for the SMMUv3.

It is OK, but maybe this could also be but under an if
ARM_SMMU_FEAT_BTM?  That is never enabled and is a placeholder to for
eventual BTM support.

Once we get the last part of the invs code the BTM support can come
back in.

Jasson


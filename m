Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3742AC53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 05:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oi3z5OGmFTcAu6ua8IwxSpW3BCYGUVzFL1IOvsxUp2E=; b=gQT48ya8TCXTuW/GIH3UiRVDju
	cBIJ0jEflAI4SCAFaIwsC6ygEJwJhdRSu71SbK+kqof7RuvKHmOVJfUW25dB3+OsNgkjGwFwQvc7V
	1FYIf5p8HMLg+CIfpsp5N3of/8zbVjQ3Hs7qxdMazwiCDf9LnHWb3ieoieFB/EgRfjSZ/FrGyeHt5
	1ezl42fUvrsHPHG5wU2ES81x59bR4PE31EmSls1ay3Y9q2nXiAfB3Lh9rcy7kE/UdfDBeMjqMdMGo
	dT+mjzouvvodceiRYqJk8px+CgtRFWzn+bVn/42arLNxdO+9IqStY1tyc2R9wR2nCs1uGo6+IWmDA
	ywqdZviQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wowe5-00000006v0m-0rPi;
	Wed, 29 Jul 2026 05:15:57 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wowe0-00000006v0Q-40lW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 05:15:54 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cab97c86bdso42525ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 22:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785302152; x=1785906952; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oi3z5OGmFTcAu6ua8IwxSpW3BCYGUVzFL1IOvsxUp2E=;
        b=aNtdW2+sbup12AKWTqOQiOzUGjKNRCJGD+mTFilECQiWMnBCUDC7LFqH8Gr9/6RIkZ
         T7LfLOW89jPyJokdpx8j2OPImTMl48aQSKaLGVqxcdk4oQ9EmzpjzMnf+NONYDnhV4uD
         uNz7v7J3nEtG5OyrgXNAfgzCktP5ioZ+YMvtxdLyrAlRIWr/tEmKF4zEhblWzTP+/IKi
         bf0zDKExk9O1T4eAiVPzpOXo5PZ2OJCOJGnhl/X+eUQRL9dH2frUcGX4jxAIXzWTwvnx
         ABHAnAmO8OWjF0/8FGNcaMNJG6PUQy7zksADvtxFdf4qi0g3Z5F1Wj6nLLTLeY51DEoS
         zOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785302152; x=1785906952;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oi3z5OGmFTcAu6ua8IwxSpW3BCYGUVzFL1IOvsxUp2E=;
        b=pUHqYlIFHI296nbGW+VNgYYcMzgev9wBPWcmCEFGsP0KW/FU2ToczcbRcg13uTJoz0
         wOEU4dxcsvS5OrmJHXT9DlbmTG7JjdJsSq5pj4LeyxLLlz4zPxzG5RP9zdjuchEqXQH/
         iwZ9xO7myI+uuVgjbpubc/WBVbh250QQpccR4aKc7UYGTLeK/VmSEeyjo5nHzeMh8Y9B
         R64Eg1ONJBkS64YdLuosQKuf1hV4cbt23e4LYCpd9T3egWCTjNtc4cMAuE5NkioE0e+z
         IGFEGD+BXL5ZSyd1TxlDA+JHyJpf25CiJWiKIB9q8lm6accpsuDDjpOkJrQQEMcdxcP1
         8Y8w==
X-Forwarded-Encrypted: i=1; AHgh+Rq54PZquHRXD/Hsz4iWCp/aWehg2OVZE+0OsyT3uUvGYksEfRrH+kDj0jQY5qHUSAae99c8gKYrFkjOfCriYx0k@lists.infradead.org
X-Gm-Message-State: AOJu0YzbZDWkkWsZafqyAVzlgt3KnSTYV1BNXyL5icRUpo2hohVKZqmD
	0eyvsbUK1zjYsbVPo4F2yJzIbXJ8zkkUvn47A26EbS9onU9ePYEEmxFhOVukDs6mqA==
X-Gm-Gg: AR+sD12XZaJfBvux4rOMuW07oocXFue1RYF59RwVO1slvM+ECUV/MJ1PJQtu9ax8RyB
	xcG6Jz8Jpe6NHk1xN6Ghsg0zkzNGXS1Ah1yrJd1/XjaEAmavF035cEALIBFSaIff27cfOBsyLVJ
	whEW0kYDCAhtsViRbQyI/GWCpuJXezNWq/RJO6SXHUL0QepB9HdbSLCZfaInvbk9nOfwfSv+ORd
	JTdFf3T6FlKcAXMM5ISKje1O/4XQhWApQr/2dKzK9AC6z8VvlSLnR4qnUI3+QSPtZXOm9kNlalb
	m5cvHnwtF2/EPUNkacBeUCwILC1uWhW2nY6LC9u/J4yJA7e8ig9h1pAr162AZ0Lkem1zwBV1XF8
	9/Yg2HyVlm6lnPjxUYqZ/OoRzn9YuU1oBgBzelyvYhdt/YK3u0fC7i87at6cDlndhYF01LyQGjy
	Zt6evIQvYZeSxpSpHVo2OXLo0mFjpHN9asUzXib6YvuDQ5bYBhXjzjN4DNZtC/mYqwzvCYakF47
	bX1JmWAYJPyDrZQTBV0rr4=
X-Received: by 2002:a17:902:e014:b0:2cf:4353:f117 with SMTP id d9443c01a7336-2d026c5c8c4mr1262155ad.0.1785302151338;
        Tue, 28 Jul 2026 22:15:51 -0700 (PDT)
Received: from google.com (21.168.124.34.bc.googleusercontent.com. [34.124.168.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0051591sm789220b3a.19.2026.07.28.22.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 22:15:50 -0700 (PDT)
Date: Wed, 29 Jul 2026 05:15:43 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	bhelgaas@google.com, kevin.tian@intel.com, kees@kernel.org,
	smostafa@google.com, baolu.lu@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	skaestle@nvidia.com, mmarrid@nvidia.com, skolothumtho@nvidia.com,
	bbiber@nvidia.com
Subject: Re: [PATCH v2 03/11] iommu/arm-smmu-v3: Add
 arm_smmu_drain_queue_for_iopf() helper
Message-ID: <ammMf5z-Gl-Wygk6@google.com>
References: <cover.1779944354.git.nicolinc@nvidia.com>
 <a62db13ab63916e9a62cddeec41a74a98cdf6a8f.1779944354.git.nicolinc@nvidia.com>
 <amkcQRVylEe_t-yP@google.com>
 <amkqZbPJs9qly4pH@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amkqZbPJs9qly4pH@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_221553_002323_9CC4C9FD 
X-CRM114-Status: GOOD (  21.05  )
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

On Tue, Jul 28, 2026 at 03:17:09PM -0700, Nicolin Chen wrote:
> On Tue, Jul 28, 2026 at 09:16:49PM +0000, Pranjal Shrivastava wrote:
> > The following is a unified drain_queue helper, that also attempts to
> > address Sashiko's concerns. This applies on top of my runtime PM v9
> > series [1], please see if it works for you:
> > 
> > Subject: [PATCH] iommu/arm-smmu-v3: Add a unified arm_smmu_drain_queue()  helper
> > 
> > Introduce a unified arm_smmu_drain_queue() helper to replace queue
> > specific polling loops. The helper handles both snapshot-based cohort
> > draining (for IOPF) and full queue draining (required for Runtime PM).
> > 
> > The Runtime PM explicitly gates the CMDQ (via CMDQ_PROD_STOP_FLAG) prior
> > to draining, this allows a single, snapshot-based target to natively
> > handle all drain scenarios.
> 
> [..] 
> >  	queue_poll_init(smmu, &qp);
> > +	qp.wfe = is_cmdq;
> 
> The callers of this drain() will be RPM and PRI, either of which
> needs busy-waiting. So, I have added a different drain() helper.
> I run Sashiko locally; it also gives a clean result.
> 

Ahh my bad. I meant to set qp.wfe = false, is_cmdq is a rebase remnant...

> Commit:
> https://github.com/nicolinc/iommufd/commit/d10325ff40fd45c476bc98d484d8dd2cdc7fdf95
> 

Thanks for sharing this, looks good from the CMDQ side (since we call
this when new CMDQ submissions are gated).

For PRIQ/EVTQ, my only worry was the HW producing more events,
say Device A is detached (we call drain from attach_release) but Device B
(still attached) starts an agressive DMA with multiple PRI requests/evts.

Maybe we should go back to snapshot based polling for that?
Anyway, we can discuss this when the series is posted.

> This will be in my pri-v3 series:
> https://github.com/nicolinc/iommufd/commits/smmuv3_pri-v3
> 
> We have too many SMMUv3 under review now. So, I will post it once
> some of them are merged.
> 
> Nicolin

Thanks,
Praan


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8633CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 16:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQDjqbiT9oGuFNrzjLvyS3Lnpn5E/CxPnw6kf2pPIuk=; b=GOzhaqTomIhdWNQYFn/byE63SB
	BzJOOdVlvEEXxP6V1rL5dWkVx85VwDJRSnX0+MYxg/cGRpjZBEobeYkyz0PHn/Z8FN0BxwHHTNLzy
	izqn3neywNdmj+1yUTXaCWQioHAY1rkwuy5A0Hw1FCnKp9c3rmA7DYWS0RsH7KJYrkHmZJGcz33Kq
	JpmR86qCzFly9aRyZI+2NQGSpiannhyFQaXhBi200nEXFZUBDN6+SjdRwD4oZ8sEVGmdcc7R+U1G5
	fZtF2y6H+BVM9VeSRJ2pZaBr0mIIzzFzpIr89CFH9PZXrd2ySwnizD37zc8jMvf1ncrj4Rqa5P5/W
	mQm1x4Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCKQ-000000059i5-1qU0;
	Mon, 15 Sep 2025 16:45:22 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCKO-000000059gf-00jS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 16:45:21 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-32e3726e2bbso1589721a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 09:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1757954719; x=1758559519; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MQDjqbiT9oGuFNrzjLvyS3Lnpn5E/CxPnw6kf2pPIuk=;
        b=beqRB0MVhzlT16QHur40g726ZWElQGYjrTcfifvxlkNSbXAVccyGqgz4dBTg3ZBVxz
         5aBqvFTDe0a411bnDk1w+OJB3XibN/pPQT40KvfbkBhvq4iM4rNk6D3mZHYLoZjiFYvw
         imGCpF3ziID+xZokDItR59tHhrGX6nPJ3DmLo73dfEhfuLjSApm+c7O3YfUYK1SqyVou
         LSYn0Fv9joxMsoR/KRr1ZC454VaBHCgk2CM+BkaCe/ECW2Jb8TXg3l+ZJUbLUIvcfgyA
         JnkTZC7oPimy+uF4rJnRuyzdtyDJLTnwJrOxbe+F3fx1HjyaKg/bEyLa1o+mbDgg3Va1
         8FoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757954719; x=1758559519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQDjqbiT9oGuFNrzjLvyS3Lnpn5E/CxPnw6kf2pPIuk=;
        b=c4fjosDhoUbAVMdh2FwLM7QWLJBtH5l6Y2NKY07GhgH0hxyNMNwm4m101TnUuMl7UV
         Ly+T0aCSg1TxS4RGNJ6WZELNIhcWUl1J1dnwLv90AYxpcJj1ORpBA3+52+dxFsxN5vfe
         Hfl3Er/zQyLq481gr4Y29R8kJQdntgHYKJjoLv4YSLQLXRZtlbjoAzVRFUc2Zg5xLbPI
         45NCPo4PO5/mi4fTyQbMb9VldWfXWhQKwmgZpiOD+kj3T1aaJAd3Q3eDC83EEiksoJ+q
         ZsfV5ujJfNx2GaaiZN6FZfebG09XuqGNoERicGkyIH577/BlQRarG6A9bBfGdDHkohB0
         G18g==
X-Forwarded-Encrypted: i=1; AJvYcCUnz7tMCnKKTF6QGPMY67Vl41j0ZQF/h/YxXmJNCp+LIDD8y6f39pO9EJ+uRJyeSXrcCDfULBdabyWBKiYT2JcS@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2gbJO8ugS7D++CHXNXvwYE89DbUM+kkN7jA4or75NaWENKwnf
	0Mbbgds/itnK22Fkv9twsdVfd0W+CIsxfX0qVC/j/6/juX8JP/sDdp+rKPnTDQfRqF0=
X-Gm-Gg: ASbGncu/Z96UcNX4zczi1bb8IZkVznfvJXlzBubYTV0WqUzKJjExsN1Ok0R6bglB859
	yUQt6Y08gj1MWbvb77riJK91g+dyUcpwHNd9Z+6ZgXAm9w6Od4rkm+VeHmwiFYsfRZF2JshM7d6
	7tuA2IfxEscTjCl9v76u0gOiNwMqYtAJSm8XBELodpQuRlF9qMht425lcl6hEt9KPvDOTEPi0U1
	UcRs+aDwUiriT7zNoZ5v8ciRLT45fomPaR9gJKjXonc53Vi+Gz7CNRjUjbV7eB1oq0Jl2nCluL/
	vQjrMOk0TTHIckuQ9sewuqVfDVZGsZuhwGIHNzYOG4GQdIdaZZvnJeNhJPpZcGbmGHty9DXp
X-Google-Smtp-Source: AGHT+IEueZRPYz6Ovwnbpjg7oIfp7yjCHZ9L0M0q/iZt1RonHcNLG+PurDsqJLquezOzfjlKgS1iDA==
X-Received: by 2002:a17:90b:3d0e:b0:32b:ab1f:5113 with SMTP id 98e67ed59e1d1-32de4f7ee8fmr16124999a91.28.1757954719094;
        Mon, 15 Sep 2025 09:45:19 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a3aa1a22sm12075579a12.52.2025.09.15.09.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 09:45:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uyCKL-00000004TKd-1naj;
	Mon, 15 Sep 2025 13:45:17 -0300
Date: Mon, 15 Sep 2025 13:45:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 04/28] iommu/io-pgtable-arm: Move selftests to a
 separate file
Message-ID: <20250915164517.GL882933@ziepe.ca>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-5-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819215156.2494305-5-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_094520_042680_F074B5FF 
X-CRM114-Status: GOOD (  16.14  )
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

On Tue, Aug 19, 2025 at 09:51:32PM +0000, Mostafa Saleh wrote:
> Soon, io-pgtable-arm.c will be compiled as part of the KVM/arm64
> in the hypervisor object, which doesn't have many of the kernel APIs,
> as faux devices, printk...
> 
> We would need to factor this things outside of this file, this patch
> moves the selftests outside, which remove many of the kernel
> dependencies, which also is not needed by the hypervisor.
> Create io-pgtable-arm-kernel.c for that, and in the next patch
> the rest of the code is factored out.

Please send this as a stand alone patch, it looks like a good idea.

Also please add the boiler plate to wrap the selftest into a kunit and
use the usual kunit machinery. We alredy have an kunit for
smmuv3, it can just add another file to that.

Jason


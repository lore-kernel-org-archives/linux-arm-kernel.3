Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A466E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 20:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4e1IdUvGapScSUpgK7R6llp+8eAfEdh0yOfh5Obu5/E=; b=BCYKHmLDM6mHLxf7yh2fpsLPiI
	5Lqq6tRs3s706M6dlEhWeEByAJQulQ3cNNBoE3+JuiNAaoVaOz/zH4w2PjfkQtc6BHXgAb8LvjPRp
	tPIZZxwh8dAVp57Z9mQSb/zdurRQ+UogoGd33FfGxRUOp504Xn59C7oZcL20Emq17uDJaOC6gz8cn
	JRAGLAf+sFodn9Ov41wdnRuTvo+ewkyzwRtIKRx0q9qb3odNZ9jUN3rfcoIwXY3ccUlb5nZ3TSfkZ
	n4CFNs2YgW5YZKBjHkGtZakvP0K/RKZX532nQEfjoDJ+pBP6R3YJR6sGl0yVbIxCkj6pZPS9d8qX5
	kt4H5iTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTRfV-0000000BNOb-3fzm;
	Thu, 02 Jan 2025 20:19:45 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTReM-0000000BNBR-019x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 20:18:35 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4678664e22fso103763711cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 12:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1735849112; x=1736453912; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4e1IdUvGapScSUpgK7R6llp+8eAfEdh0yOfh5Obu5/E=;
        b=lVYxdtg/a5iCr7X6KopxKIMIEoZLa7Wtd5jcrS/W3Wz8p4F4ONhUGymhpxxh3e2Vhl
         PPUn/i+JmJ47Pcf2Jr4MwqQ969F4sAhkgePR91gPRTP3D2SZuexR5ObJcnHm7o4ksEuo
         BWPiTpqhovP6JDy8jq5F4u9CSzlJsD9hjk7biMZXY+kXrPYWLlgELTExv0KIKyJWvg1W
         Y4w+ao7rE74yqLR/KDn9yePh1m7Nw3NntV3/VGetTi0CjSxbbuByG3ueuvFxQepwZaMU
         U9slN+ueIm7jDX9SeV+aCSdNPhga1fCBLv4NssakER55t/8Se5sozXz48nNA+SeYFlWI
         QQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735849112; x=1736453912;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4e1IdUvGapScSUpgK7R6llp+8eAfEdh0yOfh5Obu5/E=;
        b=hs59Se3OcQOUSrzjIFdp8cRQyRnX1GCdDhU/ukW+gBVEIaumCHSLHWEDJ12gwua3aS
         OdAJnId+JvXJMXghy4WDJ4+EIvVV4qH3vwDQRJt7u6bVLq0lk4tW3IQHjCf3kjbXITRE
         srOJoJOdav2RYSnC0UnSRjdN03W3YKhEu1FPb476OXq8XZjCvcf4KnfDGgjB68v43mtg
         yNVjeGRihaAh7D1yqTHcyUT450/M4sy+eh26gLlxzT8o9ZGLuazK36dN0n/93T9iPopK
         6xgx+D8Z9yoUC2hr4bzHeLxOxpI7XQtlEza5k6vI08SCBJ5Fyx+clrGkODbr5ioBovPZ
         nifA==
X-Forwarded-Encrypted: i=1; AJvYcCURGYHFEpLQdhsYVL3Yc1mSA/N7Fro8Vr6rk4blVd6U3CwoR1+jj1yXH0zNYvSQrw9E/ygLI+6Lp4gBdvPkzH0a@lists.infradead.org
X-Gm-Message-State: AOJu0YymVWRCeCQJcssJX3sPJHkBHuKQ7JqwoLBorh4uMcCRLdJ5UOcT
	Z4NdrczAd9Y2pvuTuLN0OiPoANbOXh7pN2W+cl4SsOXbOzEF8vBTcVUz292BlZk=
X-Gm-Gg: ASbGncsWzV0K9ZK9Csszb2OodBpiNK7wmoG0T32ShkEXiBWqarjxO6nH/z/3nuX3OpT
	P1OTa5CBlvQEUWaiKovoQSs7Gf3uvZ5Go2b6R6QUeB7NWInKZYu88tCLUT9LYAka2tdFK1GRfZe
	62w+0+V/s11RCpv0IJJ5onAsp3nAxNvVrUMbQ7FqmvDUIKvJ/TUrHsp3dmyE1FXD9+j/+LVcBQr
	0n3yWDtNmwmr5itTN5BTsHUCceo6H651bEv7ezxvk+rhiKkS5HgbHoz2mFVulcd3NrCI6DRmG8F
	+secfuVLnTH/oantYajobsrqKG9+yA==
X-Google-Smtp-Source: AGHT+IEubZlgbIa9gMEMKah3ttFKamsGoFQpk1RjIrpqZNlNGIW4EdOxYKL1s14UXV0ZPoQHIA67hQ==
X-Received: by 2002:ac8:5d02:0:b0:467:6461:e143 with SMTP id d75a77b69052e-46a4a8efe3bmr794078931cf.33.1735849112516;
        Thu, 02 Jan 2025 12:18:32 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46afc4597d3sm21460311cf.50.2025.01.02.12.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 12:18:31 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tTReJ-00000000MFl-10vf;
	Thu, 02 Jan 2025 16:18:31 -0400
Date: Thu, 2 Jan 2025 16:18:31 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	robdclark@gmail.com, joro@8bytes.org, jean-philippe@linaro.org,
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com,
	tabba@google.com, danielmentz@google.com, tzukui@google.com
Subject: Re: [RFC PATCH v2 55/58] drivers/iommu: Add deferred map_sg
 operations
Message-ID: <20250102201831.GB26854@ziepe.ca>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212180423.1578358-56-smostafa@google.com>
 <ce4c8db4-4895-426b-8d9d-97dc5d74fbc4@arm.com>
 <Z2Qshft8lQjI-x7c@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2Qshft8lQjI-x7c@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_121834_040715_325E1A8B 
X-CRM114-Status: GOOD (  10.82  )
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

On Thu, Dec 19, 2024 at 02:24:05PM +0000, Mostafa Saleh wrote:
> I had a quick look now at s390, and it seems a bit different as they only
> notify the hypervisor about the iova range being changed, and don’t need
> to provide iova->paddr mapping which pKVM does.

Can you explain this statement some more. It seems strange to me, why
would the pkvm side, which has it's own page table, need to be be told
about the iova->paddr during range unmapping requests - and why would
the host/guest side have to unnecessarily store this information?

Jason


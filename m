Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B201C83030
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 20:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9z08aVLb91ru0Ot02TohgmJftasWTWVr+dxaYwP4DqM=; b=zcBRXyfcpNDxh/2SBS9JOnWWOF
	18yLsRohRGsRErBhaIV2z+ygLG5yOxwX4ULhOvU6WRlHv4haZ08qGZpKsAqwv9FK3uvng2dIMK8+y
	kic6/rLi+ZAeZyDKsn4ubOzpKp/EsGj4MvrPABaSKJ2PlUt0LM56GvaL+b+yAfae+1xtZ4MgRS6tx
	qlnVclZf9NhctfJl+aSL0nBlNDRxmKwO29Y+iEYibt3JOW+cxw3Vti95ZAyQISVpz+Qu6NOWpXBE2
	QR2hf+uL+cT3vkwasbL7+2JsmAruls7aEWSmYJbAFKhcFQ7H4/VYIm/hilMHR5Qamdm+QuqXZSZWz
	ZB0SlFKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY9Ha-0000000Gx9a-36KB;
	Sat, 05 Jul 2025 20:14:46 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY9FH-0000000Gx24-10aO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 20:12:24 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6098ef283f0so31093a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 13:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751746341; x=1752351141; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9z08aVLb91ru0Ot02TohgmJftasWTWVr+dxaYwP4DqM=;
        b=oqPWyYswjguatysnRoxJ1Sge7dLfi1EJh7BMag8JmqrosOhQQkSWe+Vbh1kv0sNSjI
         kQVMOHx628m7x/T4TLh9ppVOycHhV6VRwL7tOc5KFlC3btb1E2thLmP4z3hHYlLmqV4S
         uVnyJeU0dqPvoAnuqR6TFR2Xv8w9CkHFLX3JReVd5+/wR9VhwdKFipN5SCWHCZNjWJvQ
         QRGFlxchcDNoUa9xjez5bRwl2cmUXQmP0wNBGa5or6hqlA6PeFfhU3cNjAZnmLfS6LhP
         J4crKUA3Bc6xZI7PwaYr9eHhbMNIIu6Bw9ltfwip+vy4FSTykek1iV3LOg81pnCsFzLt
         0y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751746341; x=1752351141;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9z08aVLb91ru0Ot02TohgmJftasWTWVr+dxaYwP4DqM=;
        b=EW0HW/FyztLuL8dVraIDp4YBFfFYkmPJk0qf/H26f4PSMhARCln/dwrijebx+e3wxY
         5Zr8P37rxx5xHmXDs1o7qxxRzDgUCvS13y/ItzfGXHuziy2tyMIw5shtFlEfClt0DrFx
         yuo5NOkTKB24MEj/cPTDr16rDVvnF1rq+mwLkgNhxLDDt5280+DdiA3ThbHv2Wd4M1t8
         c2nJS+izvzbYcYq332eShwwmZn/EysITaLpvCJ6DEHZCnMlgfN9Umgx5wqGdZMV0Krzv
         bdEd+qCntVjQ2LiPM+DAG700p38PYy1mv/HulXU9Q+AFEvWLSE2+hlYTe7o74ZV/DsdY
         u6pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbpm1q+raamI+kYpjKHjoKJmiHi/4Ozx7ShGeUpI6bIKhxbUuq+00vVA9PIAcJ2YL1gQuPTEy5SaWYSkOZgD8O@lists.infradead.org
X-Gm-Message-State: AOJu0YyRuP31ZyGlpIUM9i29/wJpQmUfWZT1mR9QhGyBadX+ydAgiPUg
	Qwf3qOCz2f36VQn00s4WVG9NsNLwU/hvSjcTiz0/wHqqWB/bWJSelUXEbSnRihXLkscVjuPq4eK
	KNWojAm4oWJn18hQz+d8f6Aj1KmYINoa5Ye4YM16p
X-Gm-Gg: ASbGncuZLITDoErsMMZ4ZyW1FZrtLmBg7ylPeECu31LR85Ku35yh7Az1VoQBxjPczu9
	n9D8xR+WlbFFrg9pl+fEb1vHuzlP6OQuvpSrchVmQbBK3IALpvVrFq0s6xQOyEPLP0D1+38+z9d
	+Kx6JY/+Jz1wyaCbzqRRZBroCXFZkxDR6HccTeFFux
X-Google-Smtp-Source: AGHT+IGJer1bSae1hTy+VdVDgBmIxrnrLy6/1vEbuh3ihuiTHeYj5NRruSmZ30W23oHspApAquJQsquajOdAT1S7J30=
X-Received: by 2002:a05:6402:5107:b0:60c:bf83:65fd with SMTP id
 4fb4d7f45d1cf-60e73d1b918mr259571a12.7.1751746340448; Sat, 05 Jul 2025
 13:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <0-v1-8c5f369ec2e5+75-arm_no_split_jgg@nvidia.com>
 <20241101134005.GA109739@nvidia.com> <20241104113237.GA11481@willie-the-truck>
In-Reply-To: <20241104113237.GA11481@willie-the-truck>
From: Daniel Mentz <danielmentz@google.com>
Date: Sat, 5 Jul 2025 13:12:09 -0700
X-Gm-Features: Ac12FXzjkeaKni9wvVsiCi9BzDFbIznXFt9RbbGeY2UoHjBPMAYPOLioSuEBQ6M
Message-ID: <CAE2F3rDcq-BQYM1yYq6RNSYSOovdoyRcbYw8Jy+BXCHLkrWN3g@mail.gmail.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Remove split on unmap behavior
To: Will Deacon <will@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>, 
	linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, dri-devel@lists.freedesktop.org, 
	Liviu Dudau <liviu.dudau@arm.com>, patches@lists.linux.dev, 
	Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_131223_302304_62579E02 
X-CRM114-Status: UNSURE (   6.96  )
X-CRM114-Notice: Please train this message.
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

With the removal of arm_lpae_split_blk_unmap, I believe the following
macros are now unused. Is there any interest in removing those as
well? If so, I can draft a patch.

#define ARM_LPAE_PTE_ATTR_LO_MASK (((arm_lpae_iopte)0x3ff) << 2)
/* Ignore the contiguous bit for block splitting */
#define ARM_LPAE_PTE_ATTR_HI_MASK (ARM_LPAE_PTE_XN | ARM_LPAE_PTE_DBM)
#define ARM_LPAE_PTE_ATTR_MASK (ARM_LPAE_PTE_ATTR_LO_MASK | \
ARM_LPAE_PTE_ATTR_HI_MASK)
#define iopte_prot(pte) ((pte) & ARM_LPAE_PTE_ATTR_MASK)


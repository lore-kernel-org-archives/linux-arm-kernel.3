Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EB5CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 16:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQXaLb9WZj3JY/dEJGlzcheRpxj78yrhQDEcCPB8cc4=; b=3DglHA3vctDNqwwFIy47g+h6w+
	r5oU/YZHS9W6/e+x36xDHiiZrA2I10fyla1C8LVu3QdPDnQ/JuhwxcdZ/JwC6DWqZ3nSxLceGo5NC
	Wca5KBrf070ul4YMR1U24Xk9ECjW+ArK8S2F9/nSatf6SMg9/xYpYGzVCoH569AOaSvbapcLVrTsN
	SxixmfslQ9yCEeeEAg5w083liw/p6WHJJtSdXyMssplIHNuM4uPD1MucmpBKXUw5ZwN5xRLZJ9tCP
	bK/iajNBKlDl9mFMPJrPQoQAzsldQiqoTBmGjxt3Iez/dHFmcAbqJEjqY6dXaW0LWbj9d96OB5oKQ
	1ktThjmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdet-000000060aO-1RRx;
	Thu, 28 May 2026 16:32:35 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdeq-000000060Zr-0iAP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 16:32:33 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2b46da8c48eso1645ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 09:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779985951; x=1780590751; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lQXaLb9WZj3JY/dEJGlzcheRpxj78yrhQDEcCPB8cc4=;
        b=XJ5Q3lqHmMzmcO///nwfyibJCLVw//8qKmsojOJ5IvrY431iAt9gNpJLsfpKv0+cyr
         3iLFb7cHSlbfhnT/xvh91eHB19T4ig7brnL9MBY7KzBZmOpyobHXpnCLZo2UHRntQl5b
         0ZctmXtOZ1Hmt68AH4qDGjcZyUF/tfAYu8OMSo3Sa2oqxaRnptOr6O6YN57cVkNDYXJR
         EjQ6ERb0oT94tyQGDqWsP85Kcy9Xu51Gzulh8lk1Pr3JgMqfWIjhMG25NLpVDtgUDDLY
         tQ3PIpbEnaKlszkeLCWN7uvV1qEjVhTy/k8a2uYs1EbXhScBKfqIOc5T+lo3h0p12kg2
         0XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779985951; x=1780590751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQXaLb9WZj3JY/dEJGlzcheRpxj78yrhQDEcCPB8cc4=;
        b=D/2Rxfs3s534fK4xtJbJhR4NzM+QQPgBri475C8pi9BpkBVX8zEaV1PsZ9G1QLjTfa
         64he7T8nTZhNCfqKnamngv3KzgrlVrQiHl13FOTIpX8V0MEKJgKytkb1GT048xOLXqIY
         SrBBmW9/zDmu0pHsEhP91gpgtAZp345gHFk5oV5ZDR+xnrrWtzJRmX3m7a0sYBrZtmvJ
         MKe+zCZLV6MBigvKpdT54oXF0V85umfEj1zofX3/tD9OhXa+7mN/zaY+CTm5YUo5lER6
         w5l8ztxEh8Ndkh4qQm/tvr3jwdueNIKInD+vg4i07t0OWvnguv2KoYpzesAMo1GqKec0
         et6g==
X-Forwarded-Encrypted: i=1; AFNElJ+OB97ULsn5U1vkxXjvnruke9pCeM9/GHGGzFIwcgYFa8pjsjAPSGJXpMvwdp0Hrjec/0Vx3hGUUurkSb+gK7qT@lists.infradead.org
X-Gm-Message-State: AOJu0YwStAQOzQDYAPx5MpqNgSukgIaxZTY83j9uyhZhQSZh729eRNrG
	9E5/sdRwqujqaxuCfNXVgDzjiuyof/I94YmpbQsyfR4Lz1+ae70XuXRU6U737j3KYA==
X-Gm-Gg: Acq92OHDMlmtY1R2NR5HYEPtR2qD1P6pdrYWBARg1ZRR37mluBash0hyCwvi6OhcAhC
	wOHMV0N0ed8j0irMaCMraQoGfn2kADAH90Nw07tdnziN49iq/9lIiTWOYhPcrXoVfvIn9dgJUiY
	mCh9uGQH+Sil7r/5eD28XDYhdIzZLohbMmvG1hztKSgHM/TBgnBRRPF8pDd1hMrI1k1E6NBC0TG
	AuGKN/Xv/eFmgU/zlD00EdNBcgbsisRa6a/KulLZTc12p68ys2GAIBvzN1YXE5X54HdnL+xcwGl
	B0PYS9ES6AUHHwOdoiCilJ81jkEUDiDu/XdzxB8g27hxB7jLNdW1P3v+1M5qsot2kqIvyqyFBdH
	U3EDr/VXMjXptqZCigdbVxnd5YKTfAe1KkLBsPN5GXTDyvklvxQ9MsFueRcJn1ejfh5QYgxt0Vw
	Yj9zn5yDSGq7Ypeokz2j1ING2uF6Got0D1bxZ+3PY/exXzi+SSrAMddZhn+72sX/VzQAq8GDv10
	9BZKLI=
X-Received: by 2002:a17:902:d50f:b0:2bc:dc0b:ab29 with SMTP id d9443c01a7336-2bf0bb6f798mr1542415ad.0.1779985950617;
        Thu, 28 May 2026 09:32:30 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b90c032fasm2002365a91.15.2026.05.28.09.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 09:32:29 -0700 (PDT)
Date: Thu, 28 May 2026 16:32:23 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, bhelgaas@google.com,
	baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, dan.j.williams@intel.com,
	jonathan.cameron@huawei.com, vsethi@nvidia.com,
	linux-cxl@vger.kernel.org, nirmoyd@nvidia.com
Subject: Re: [PATCH v6 3/3] iommu/arm-smmu-v3: Allow ATS to be always on
Message-ID: <ahhuFw3ZJpy48xkH@google.com>
References: <cover.1779392420.git.nicolinc@nvidia.com>
 <18bb6f421b3be891caa8f1fb50f3a4d56b52d5be.1779392420.git.nicolinc@nvidia.com>
 <ahheOF8L0aGMttcI@google.com>
 <20260528152930.GA3195266@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528152930.GA3195266@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_093232_208416_7BDE6D35 
X-CRM114-Status: GOOD (  13.74  )
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

On Thu, May 28, 2026 at 12:29:30PM -0300, Jason Gunthorpe wrote:
> On Thu, May 28, 2026 at 03:24:40PM +0000, Pranjal Shrivastava wrote:
> 
> > > +	master->ats_always_on = true;
> > > +
> > > +	return arm_smmu_alloc_cd_tables(master);
> > 
> > Nit: I'm not sure if I'm getting this right, are we saying we *need* to
> > allocate CDs for CXL.cache cases in the probe itself because STE.EATS
> > requires Config=Translate with S1DSS in bypass?
> 
> Yeah, basically.
> 
> Effectively the ARM rules for enabling ATS and Bypass together require
> a valid CD table pointer.

Ack. But do we expect transactions before attach_dev? What'd happen if
we don't allocate CDs here? Am I missing the fact that CXL hardware
could be already active and using ATS after the device_probe succeeds?

Thanks,
Praan


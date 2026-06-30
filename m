Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA03C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 15:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7y23lwVc1qU9pQQZzwFQKSERGQYoPnAW1oWXpZxS+y4=; b=boFYDJQBcBJShXQDS3c/wK9Ihl
	MPgsVDZK2o65yLt8zo+PlBPtFmQ9eMD2oTwPdRwMsX55MZpo4I2skC9Q/Vj61xH+My5g4r11AfLmK
	lJgLswoOQeW/QEw8NHv75gfkoFeAw+Bgzq1zv/llhQbP+EKrPWZ6AxEW8IJGmZZH1PMtPGfvupTad
	oborkSXpzzM2XziXHP6upngbFHsdL1AqECDfJNS9FoBSgyzhN1J9ysEkKDLgzQxNQcvhYTbvxGN6k
	HxDQVI+Vf7Rt7pq5ATMRbn3KcjD8QgZtCprob5W3AaIm+dQgulYdaexVKcyVWMuWV2nf//WcLTcND
	2roS6/uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaSf-0000000HNjn-2jgt;
	Tue, 30 Jun 2026 15:33:21 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaSd-0000000HNj3-3B2g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 15:33:20 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49242f97da7so63375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 08:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782833598; x=1783438398; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7y23lwVc1qU9pQQZzwFQKSERGQYoPnAW1oWXpZxS+y4=;
        b=aMIAtQnG2CTaWbm4lmeSpyzKUW4YGS8igOkl5ofl8PCqLaqjGf8NQRmZVFiCGWx5gT
         gbcwD6ELuOvyx3Y+b2agA3cFWnWttEw1FqwIyQtgiuwZE+gpv9t+XAj/s169MVwNhDwl
         aq7N+ev1Z5ypM/2PcK3EQ2Lqu40asRDsScRi+VhNGbjJexgeAs4mmBJkzEXjn8qwyNlc
         AhgJVqmrXUCku/NhUtsh7hmaKdniAq6/irE36ofAw3wVrHXEHl8hBwzD7cXAcS5FRTuC
         EifjnAYucI3uNsqPSjfR5WRnpMKA57w/UiZ9JF93QTFYsfLyLiFqKpAReyQicLyn9Ybw
         uH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782833598; x=1783438398;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7y23lwVc1qU9pQQZzwFQKSERGQYoPnAW1oWXpZxS+y4=;
        b=B+3mn90RIrVNyqvb7jn7jzvPou0EAfy4jxzNVdUk0HBdt4HBqNT8a2OibkY/lidqBN
         +Bj4HyW8mbsCvGg97ALTrw3NdzkP7qlWy5NgJJ92uNNE8m5e5o3Bfrw5RuRIcFLNfuhY
         OCH0JLjUmLV+j0zZq2RmKqkIcO8V+7zoqi2O2xjPtVXk9bNLfJbZZIZwYA4yyzNa/SXQ
         7plQzMXyoKOfav0dibpkiheEmfvCdK0QCKR6auFjUbDVJqQkPrV172364qMbGFJwkke+
         vW2EJP3FafDtgeXFc7NJ4U5ZzvXeM5y0dqYb9wli8S9RKhxmzktE9oKwv1rv5XQhmMgE
         0liw==
X-Forwarded-Encrypted: i=1; AFNElJ9GexJM3SjWGRf6jp/yCH1gGyElWkRiUSZcrWt/MbwZgyyrfrSGpe/cKx6uMYyTjdAUuR5YnlWVkMiaY9po3O6Y@lists.infradead.org
X-Gm-Message-State: AOJu0YyVCPw2atNRinwL0Wvtnk3WSIT62yPyH8tjIaSaZePk3XffOIId
	Gd6ZGpt7Bmb0eUvHONdO+MJL2Y9NkrffW3Qizj4r1M/iZ7qHXjnGlB8ed0kcw/KU7w==
X-Gm-Gg: AfdE7cnPVDaI6S+Klxr3mcZygCV3V8PmwvnbCw7VY5moS7HyhvEPguuktdvRdpyrAcv
	WZQgycS+iUydOHRcV5vsLyryMxmndnNwgzLNGgK7DPN+7K4lOwSIcAkAR4IYI+bqzrzFdtDzbxU
	8DqDAhy6/8XUiryGmrnj0Fwglklj6tc1yjF3FXGRulWajLNdfHM8iYXvfDVAyFW9M1NQloX4wKZ
	F5QJLD40ImsrEFHynuGqVjNhr1fg85pK6NnLj3gjNNv/UT+qB88xSuW/kiV+nYMgdqD6OYwcw12
	ICjrACPZYsO043QGUL14NUjIhCc+8Mvzh59/6AAAexsNsrQnQB4EkK0H1XLyKJMdHHZdPQEgRVo
	C0RCZ2I9veepXDaPp7nctyM2nmuAOc6OfomCgRXECB10riDBpAPMkjoO9Jm+x26ns5k4lX6StLP
	hZPCATb6AGLnFQkHLlIZbJgv011F5cs2dZSKVp1h5dDBsAsu0iNGthsBBuKJnfjQ==
X-Received: by 2002:a05:600c:5290:b0:48a:5d55:c194 with SMTP id 5b1f17b1804b1-493bde1e099mr224345e9.7.1782833597416;
        Tue, 30 Jun 2026 08:33:17 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4c9f78sm3528615e9.5.2026.06.30.08.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:33:16 -0700 (PDT)
Date: Tue, 30 Jun 2026 15:33:12 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	kees@kernel.org, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, jamien@nvidia.com
Subject: Re: [PATCH rc v7 0/7] iommu/arm-smmu-v3: Fix device crash on kdump
 kernel
Message-ID: <akPhuF9pAWaBXzpi@google.com>
References: <cover.1782799827.git.nicolinc@nvidia.com>
 <akPB6l-fuJUcg4a2@google.com>
 <akPX_N0P2EcI_jbV@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akPX_N0P2EcI_jbV@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_083319_815807_04F57763 
X-CRM114-Status: GOOD (  33.43  )
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

On Tue, Jun 30, 2026 at 02:51:40PM +0000, Pranjal Shrivastava wrote:
> On Tue, Jun 30, 2026 at 01:17:30PM +0000, Mostafa Saleh wrote:
> > On Mon, Jun 29, 2026 at 11:15:33PM -0700, Nicolin Chen wrote:
> > > When transitioning to a kdump kernel, the primary kernel might have crashed
> > > while endpoint devices were actively bus-mastering DMA. Currently, the SMMU
> > > driver aggressively resets the hardware during probe by clearing CR0_SMMUEN
> > > and setting the Global Bypass Attribute (GBPA) to ABORT.
> > > 
> > > In a kdump scenario, this aggressive reset is highly destructive:
> > > a) If GBPA is set to ABORT, in-flight DMA will be aborted, generating fatal
> > >    PCIe AER or SErrors that may panic the kdump kernel
> > 
> > Can you please clarify more on those errors, what conditions will
> > trigger that?
> > For example, patch 4 disables the EVTQ to avoid events as there might
> > be a lot, why are they not fatal also?
> > 
> > > b) If GBPA is set to BYPASS, in-flight DMA targeting some IOVAs will bypass
> > >    the SMMU and corrupt the physical memory at those 1:1 mapped IOVAs.
> > > 
> > > To safely absorb in-flight DMA, the kdump kernel must leave SMMUEN=1 intact
> > > and avoid modifying STRTAB_BASE. This allows HW to continue translating in-
> > > flight DMA using the crashed kernel's page tables until the endpoint device
> > > drivers probe and quiesce their respective hardware.
> > > 
> > > However, the ARM SMMUv3 architecture specification states that updating the
> > > SMMU_STRTAB_BASE register while SMMUEN == 1 is UNPREDICTABLE or ignored.
> > > 
> > > This leaves a kdump kernel no choice but to adopt the stream table from the
> > > crashed kernel.
> > 
> > In many cases the patches assume that the CDs/STE might be corrupted,
> > but still attempt to retrieve them with some validation
> > (log2size/split...)
> > However, the base address might be broken, TLBs state is unknown...
> > 
> > IMO, although that might improve the status quo, there are still
> > heuristics, in addition to noticeable complexity to transition the
> > stream tables. I wonder if FW can deal with AER in that case before
> > booting the kdump kernel.
> 
> I guess we're reading the base address from the HW register itself so
> that should be fine? CDs are in-memory so that's why they could be
> corrupted?

For example patch#1 verifies log2size and split and both are read
from HW registers. Same for the base address or other addresses as
the page tables, they  might be corrupted due to a buggy driver.
My point is that, it is really hard to assume that the previous state
of registers/STE/page-tables were valid or even consistent, when the
kernel crashed and did not transition the state gracefully.

> 
> About the TLB state, I'm not sure what might pollute it, since this is a
> kexec, I don't expect any non-kernel entity to gain program control
> before the kdump kernel.. Hence, IMO, we can't configure FW to deal with
> AER here..

Similarly for TLBs, the kernel might have panicked in the middle of an
unmap or free domain. (not to mention what that means for RPM where
a device reset with unknown TLBs)

Why can't the FW deal with it? As I mentioned above in the previous
reply I am not sure I understand what situation leads into this, when
does a device trigger SError to the system vs when not which is observed
as an event in that case.

Thanks,
Mostafa

> 
> Thanks,
> Praan


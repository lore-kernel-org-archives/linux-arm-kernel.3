Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70E1CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U96zIc88mN0rNQvIVq2ht+DBQv4Z66PcnccoKG6Xats=; b=3IINll526eAEIFLTlS8qsD8Tdy
	pGvrPxfM8Ef0fFbd0/6NGWIgVZs7/cTEBr6OR+tqWvg6MqUpKZOMXMq5VIuCE4flUEVwi/uq8+yax
	KvBitcky4X60YgJfuxld0JXMVCLcSo6CYdYsjGFHiRbzw+wJxL8SsAqilHYHl0a7moyx+M/Ja4xuZ
	vK4YsiS6Wum+bG/IYejoVuvPeWi91VdDBS66xh2Ngc7xLdnhc49sviqJWSk5N9i/lGemqwx9fqtxq
	CDh0bSnCeUpVpPd45AwZNgNWuRqEVC8LujRcIHW1xhY+mPHFKXceBkuRX/WiuQzFv5d2cKFbXoY3Q
	NDl2qwJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiKT-00000006osL-1hRK;
	Mon, 19 Oct 2026 08:02:45 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiKQ-00000006orl-35Wa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:02:43 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2e9f6a16afcso16735ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 01:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792396961; x=1793001761; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U96zIc88mN0rNQvIVq2ht+DBQv4Z66PcnccoKG6Xats=;
        b=iqvgaa1BGQy16hzsLvk+E5hmrGRueuhvQBgExULEjPNaZMBKtNVFE+UBDToD0xfjuA
         VHZoW+txVwjLJwlaIQSmnOXJ/XSVmbpFJbhsvyKJL6k0Ht9zpkFZ+w/xR5ziWZsmax0j
         /hlnv62SLJ/h7+oddJmtXu/R/ZjkZ9WSzNP0OtwVBvN3xUox6VKCx30Pqd80UOi8jiu+
         sHHdrDC5qjPkCwvWc/y4Zt3cMPePgn4E8Y8cxaZIe7W5/s8/9fPG7ufGvsgXmhmwX+ok
         7isK3a4Gq/ktBA3BmsM+oVcRlCHmZ7kgWPTcUZmK3sxMC+PvXk1Z4q5v0DSIDcEZC1nT
         YEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396961; x=1793001761;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U96zIc88mN0rNQvIVq2ht+DBQv4Z66PcnccoKG6Xats=;
        b=S4e+9nnIxdrXYI6C+6zNJOOm0aIP1AoN28pvq6/zD73TuYEumzWU4Z4Sji6/nVT4Q5
         1MKDVE3DP4akr12fiBIl1lydsYWRxkdOV6qmzyQGQijWCvSeRK3+NrJJrJznNdxp6gLJ
         /LXHKbJ7c2hYCd38IrnjE7E82ZBUe8vho/sMSFEVSfQZ7Yd9v2yzxh4+9wVjIzjS4stw
         OLXFPPxOwRcOEC9tLAePQzL5R0IZy9Ph0hGyBO0goPjl8xzytp9J1WVhVPzvgq5znvsI
         GhqSaWUxrtNCxyoU4qUidi25QzmInRxklxWQsrbkliyeuA8wEXyiPl0I/dWzH4j69cT0
         PqEw==
X-Forwarded-Encrypted: i=1; AKwUvByijr5bNGrBH2si565LDdHKittfm3zyDTBZyXcGKpMM/BOt0KUA6gksxK+TZsUrtcnycQ7MEWr0mw/Wen3wGXBa@lists.infradead.org
X-Gm-Message-State: AFq9FYIpJGieCnkDUMJBh2t1QWwoK4LDZcnucqnfTwv83PpenzuFvXa+
	ceHQaaYCUXWbeEO4yEypR93p+qutKj0CPPzNBxy+SVuwFnozKphnPWvxYn+unGI6+Q==
X-Gm-Gg: AYBFou3Qkw3vb/2kjxfUZDpDSSCsUG6GK5OehYeYZT1+xV67vvn7uYqLj/CXf+zmL+S
	/OmsJ3iy4I7idL/44V8S9OPMjZyMki2OvO2bTRd2yyza7x18TMu2NFC1CUejYtG8o7di6LYQoNi
	lqz0y43Op18opT2MeW1r919mODXvxtaXVQgC/cbo/1/qzBAoux1ZRTqJmw9f2MKtpla9/Gbx4yL
	QYRMU3vz3LUVLMr52W9+PrPjU6ZwVaAb4CZmMgjot87zBejbtx/ZkLBLCnmrwC/9f3zC0NgfX3A
	O2OvJbI7Ug+nPqx8N85k1oh2kaomd48ni/W1hrsp1w0A91/rbGBqryAEIWIxvhl/S2qe71XcOlb
	SvQNGEcafBIyIHSfJRBhD7IOtonGfZON7n4MKI9TQ7icFRyI3hFTBlW076gsW0KYi8tVPI7g/KZ
	LzobJ2oXKaQ1JXuOpS+oNe5u6datXoJKmaRKIH/O55k+1TEnYgTwMsdH14pokJ7ypcs2okLyYD2
	DQablswe6zQ38F4IFohOxnrY1L5Kaa6SNPKBg==
X-Received: by 2002:a17:903:388d:b0:2df:96ca:d7c7 with SMTP id d9443c01a7336-2e9b324cc9dmr6595855ad.10.1792396960066;
        Mon, 19 Oct 2026 01:02:40 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8353b1sm35762345ad.39.2026.10.19.01.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:02:39 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:02:31 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux.dev,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <atXOl-9C_HNvDT1E@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <ar1yNtr7Kp2OTcDd@nvidia.com>
 <ar3yWUmi8E0k37Ml@google.com>
 <ar6gY9grmdMZcN/M@nvidia.com>
 <20261002164748.GD3481470@ziepe.ca>
 <asAeCz_rmpe5hbsh@google.com>
 <asUvUf4PZJ7JCLXp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asUvUf4PZJ7JCLXp@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_010242_807438_8423FB58 
X-CRM114-Status: GOOD (  38.54  )
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

On Tue, Oct 06, 2026 at 10:26:41AM -0700, Nicolin Chen wrote:
> On Fri, Oct 02, 2026 at 09:11:39PM +0000, Pranjal Shrivastava wrote:
> > On Fri, Oct 02, 2026 at 01:47:48PM -0300, Jason Gunthorpe wrote:
> > > On Thu, Oct 01, 2026 at 11:03:15AM -0700, Nicolin Chen wrote:
> > > 
> > > > > So we can't issue ATC_INVs during suspend (the EP is already down), nor
> > > > > during resume (the SMMU resumes *before* the EP is made active). The EP
> > > > > can't use its ATC while suspended, and if it loses power/resets on the
> > > > > way back to D0 (from D3cold, or D3hot with No_Soft_Reset=0), it comes 
> > > > > back with an empty ATC.. same assumption the PCI reset path makes today
> > > > > (pci_dev_reset_iommu_prepare()).
> > > > 
> > > > In that case, would the STOP flag be too late? It's only set in
> > > > the middle of the SMMU suspend. So, an ATC command (via doamin
> > > > invalidation) might be issued prior to the Point of Commitment,
> > > > which will be timed out due to the unresponding EP?
> > > 
> > > How can you ever fix that?
> > 
> > The unfortunate reality is that this gap exists in the kernel even
> > today.. upstream SMMUv3 has no RPM, so it's always on, while the EPs can
> > runtime suspend independently. So an ATC_INV can already be issued to
> > an EP that has suspended. I'd argue RPM improves this slightly, since
> > once the STOP flag is set everything is elided, so the window closes at
> > SMMU suspend instead of never.
> 
> That doesn't sound very convincing though...
>

All I'm saying is that today, EPs can get suspended without the SMMU
ever knowing, making the SMMU aware of it helps with that.. although I
agree we need a policy here.

> > > How does power management really work, is it expected that the end
> > > device is already quieted by its driver?
> > > 
> > 
> > Yes, power management would topo-sort all dependencies and invoke
> > suspend callbacks accordingly, i.e. in our case the suspend callbacks of
> > all SMMU clients would be called before the SMMU's suspend callback.
> 
> If that's guaranteed, we should probably -EBUSY the suspend if one
> STE isn't aborted.
> 

That'd only work for (ATS-enabled) PCI devices.. for platform devices,
the STE stays as is across RPM by design (no ATC, and the TLB/CFG state
is covered by the invalidate-all on resume).

> > > Could the first step in power management install a blocked STE? Then
> > > we don't have to worry about ATC desync and that automatically stops
> > > generating new ATC invalidations if we go and detact the domains too
> > > 
> > 
> > Partially.. at SMMU suspend we set GBPA to abort and clear SMMUEN, so
> > nothing gets through while the SMMU is off. But that's global and only
> > happens after all EPs are down, it doesn't stop ATC_INVs in the window
> > Nicolin pointed out.
> > 
> > One way to ensure the ATC state is relying on the PCIe spec to lose ATC
> > content during D0 entry from D3cold, or D3hot with No_Soft_Reset=0). 
> > 
> > Another way to enforce this, is to *somehow* ask the endpoint drivers
> > disable ATS during *their* suspend, i.e. in the EP's driver's suspend
> > they could call pci_disable_ats or a better suited helper from pci core
> > and the in the pm_resume / rpm_resume they could call it's equivalent 
> > pci_enable_ats, counterpart ensuring a clean ATS state. Or maybe the
> 
> pci_enable/disable_ats is used by IOMMU drivers only.
> 

Can't the PCI core call it too? I agree the endpoint drivers may not be
aware of ATS, but there should be some way for us to flush + disable the
ATC after the EP driver's suspend & before the EP sleeps (and so before
the SMMU's suspend is called)?

> > pci_dev_reset_iommu_prepare/done() pair (with slight refactoring) in EP's
> > suspend/resume?
> 
> That sounds right to me, though a different API for suspend/resume
> will be required. And call them in pci_pm_runtime_suspend/resume()
> maybe.
> 

Ack.

Praan


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E25C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 21:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+xpyLgkx3NxlBQZizLlW9t13l6riTws+UBfMfvteTQ=; b=39W5fu9DarkwJ4zht7NR4U+yxy
	3FFqcLuDffHUDP9C2CHZV8BhfuMjXedGaRZPiN0qLEjEBDFzLCFRSy65zW3sO0o/yDHcKotLuCEKG
	gWXoixJIs3OiK4oCzkY51CwJUZl81P8GLPvhXPWG1kVJNaCwCZmJQxTT6ZbZkrndpSK6vq1X0Ku1v
	gW4LXMOHPbi8zjj4GfSVm2+SePUXlVokG5jXA+p0j16OLqs5AbjNrQF9qZHRgoPsv/4RdKck54S9q
	hUhDsu1jGANZKf1/Wnq0YHFRg9Sa1EiSxINyGID3lyef88zTJyZMDnkUZOIN+p79D66+KIdNvn8n0
	9eNfsrzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL7La-00000001wRL-0c49;
	Fri, 30 May 2025 21:33:02 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL7JP-00000001vvE-2yDk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 21:30:49 +0000
Received: by linux.microsoft.com (Postfix, from userid 1152)
	id 366942113A61; Fri, 30 May 2025 14:30:46 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 366942113A61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1748640646;
	bh=P+xpyLgkx3NxlBQZizLlW9t13l6riTws+UBfMfvteTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWRQTxL6E48CZlvqdoqH+qgYZTbGwXOTN7cb8ZfJ/gHqlckSdz5BYGGewCF0rYGUF
	 h4TDa4EDlcI59i+dC3XP5YcclkB1yNJ2GQeZC/t49MJVU07DMmWxcJ950iKxT+uNcv
	 42tq9Q4U+P0uAiGNxMkDQXxmVQCIMIpBcaxJqf7o=
Date: Fri, 30 May 2025 14:30:46 -0700
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, Jacob Pan <jacob.pan@linux.microsoft.com>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	will@kernel.org, eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com
Subject: Re: [PATCH v2 0/3] arm-smmu: select suitable IOVA
Message-ID: <20250530213046.GA27644@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <67fff12d.650a0220.208c7c.d69dSMTPIN_ADDED_BROKEN@mx.google.com>
 <20250416181759.GF493866@ziepe.ca>
 <20250520224224.GA16365@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250525190703.GD12328@ziepe.ca>
 <20250527205428.GA14019@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250528000425.GC146260@ziepe.ca>
 <20250529182219.GA20289@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250529183815.GA236098@ziepe.ca>
 <20250529220839.GA9911@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250530131328.GB236098@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530131328.GB236098@ziepe.ca>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_143047_770904_83FBC1EE 
X-CRM114-Status: GOOD (  11.70  )
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

Hi Jason,

On Fri, May 30, 2025 at 10:13:28AM -0300, Jason Gunthorpe wrote:
> On Thu, May 29, 2025 at 03:08:39PM -0700, Shyam Saini wrote:
> > > How does your platform work at all? Isn't 0x08000000 physical memory in
> > > your address map? 
> > 
> > unfornately, this 0x08000000 physical address is not in our address map
> 
> Is your issue PCI related, do you have a PCI switch without ACS mapped
> here?

this platform that we are discussing doesn't have ACS caps, it relies on pci
ACS quirk.

Thanks,
Shyam


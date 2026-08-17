Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD466C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 11:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+l+UxdGP4xSYpq+snL3DrvZxjB7YwI2tVyA/dO6w4c=; b=vwKbunYf8clu4crXea496I4GgQ
	JLZFWGwPTFJX8PzMZKhTx5UW1TDQ0tPPL2wwJ6xEjlzQvVD2i6wBxyKRNixiYWjvrd0f9EFM34ccZ
	+YIYO0mSLAPQ5hKrQYRV0HaI3PfxQb5xNQ2VIkePhrN6rCVx/cEoXEPAmTl5nqdrQDWEkycz2hPTb
	UMPx4gY8LCPBfBJ7T7idWbMzvRfXNlR890sX5GgVXD+GNXFCJhJtYO04OkqFSu8d+O4Evs7Hcoll8
	AF2U2VkkBTOxdGe8Fir0LFTZkfm25fHyVnVwnBCxOc5bPusXNwQMBxhNZd6vzSSADSqQWrHHhWzuQ
	URwa/X5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvKP-000000060lw-0Pl4;
	Mon, 17 Aug 2026 11:16:29 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvKN-000000060lT-0yOT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 11:16:28 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ccdf36f63dso246575ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 04:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786965385; x=1787570185; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R+l+UxdGP4xSYpq+snL3DrvZxjB7YwI2tVyA/dO6w4c=;
        b=D0BP8wy+VXLquW529txP8tzuZ2gPEVy265xNMC/6/r07EjuI3N4B+cbJtfwlsPNLyp
         u+fixgPGVJejaBboqZC9FbRZLuxL0dY8ZG4Nvb9PchOiRfLN+mAj8LISYdTyqHvTin8b
         BNnfSPN3GN79v72kLC5gmRDNVAcKNH3ntGArCreeh9QLOTv0II0NU44yw9ERP8olF00W
         9nLyNCF0ORwxwzn6tdbrg4y4lZJ5F3g99+/qA5+sHqIUHJdVTtK/k31VtP+MgREBu4Wj
         efOr5ov/UsbnBHh9Fr99wJYCP1Hn28I06WQpRNzX6LoE4X2SzvDNuKb0eS7wgscHlQHv
         +JtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786965385; x=1787570185;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+l+UxdGP4xSYpq+snL3DrvZxjB7YwI2tVyA/dO6w4c=;
        b=NyhbC1BU7IPS/TB07UBll9YGW9wp+XRsaUVdsQs4EbWxD545/62vt7vC7BZ/Hoi2DJ
         R9fkvTK6aBIIFl6tOh5w5voSzOjPyA8Wt4LNksFWnB6SvIClxwoRYrUfMdgtpapqvtXp
         fdNpUWOeWzf0qRY451Sh4ACGTxJgeblveOnpcf6bcL0LuLNuadTSZU5h4CEyXuAyrB4h
         s67LJz+GJgR6JJ1iERqZRoaFhEDjEcTR0aZJ+0aRzoPjcPfS9FtnYB2mxnJMaFow4aXB
         pmU0rFvYtZ+c7+j4MlSSEjlJoIpcFJ9R7prPtuEfHjcUAFWkmHF8ex5bGCf+J9itbAvm
         NPig==
X-Forwarded-Encrypted: i=1; AHgh+RoKU+yMUdqK9QQc30tn+9ZcEtVsgTAuGWU2wicwBFP116bPDQHiiTjalgZPd8M8ee2zUdFCpb+rf1l9otCX4IC3@lists.infradead.org
X-Gm-Message-State: AOJu0YzcWpv1UOn1ZirlJKFZ4Ca/ZicNsjjp5IsNNlKj8L5tt+mA6Ylq
	KsMQb0M9ch80nrXKYXOYIiX7V7cD37aoafacxnd+85jZtaaCb1YYbntJJccKVpfMBw==
X-Gm-Gg: AR+sD11e4WNGjoH1iRHDep3qgS9/HQ6PItAiNBPUGdpMNUklx5ruc/RF+Oy8BforMo+
	qqc7pOXod/VMfHGfpaHDRI8ZyMbMDku2AqwkabEJUnm1m4sLsztlVb0wp4inOTZc8avBPR8bbCB
	9LpFYL1hJs92Fg6dSOo5Rs7StSzAXbmLUa/imOs6AZ+txgByUsU/LExhVVLdTum9HWFL6iNifD8
	fjTBoiQN1/1NxHnYwQzf3vBgmn+JylEQ4fptmMGxSx0zTDF+4DV6z+nK6i0Y4mlOp1ZWnk3dMA0
	NIiZZ6gtx8OdHIgd2X41ZBuP2BWyMG88I06w4akpYWx+4S0+1jBOD9UOHERmptuhCHW5rwL6/L3
	f2lhVLPPGQKydqSDV5yeacdEkIBgvbwVSYElnnx4gpEyWQro9vc8QbSHuvyVdZS6VnhFbeIetCj
	iiogcLCFkKQumsSwuy8xHUh16rST8OIp70TtLY0gxbhF5q3Ev2BMmgcaD2jw1MteeWBB12/o8Og
	hfdJRs/SeDOL6weq7Fq+sQ=
X-Received: by 2002:a17:903:2b0c:b0:2bf:1000:d3ac with SMTP id d9443c01a7336-2d596cfb925mr4566865ad.11.1786965384912;
        Mon, 17 Aug 2026 04:16:24 -0700 (PDT)
Received: from google.com (21.168.124.34.bc.googleusercontent.com. [34.124.168.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb499e8csm3975245ad.2.2026.08.17.04.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:16:24 -0700 (PDT)
Date: Mon, 17 Aug 2026 11:16:17 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Dmitry Malkin <dma@nebius.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	NB-Core Team <NB-CoreTeam@nebius.com>
Subject: Re: [RFC PATCH] iommu/arm-smmu-v3: Allow nested attach for PCI
 bridges without vDEVICE
Message-ID: <aoLtgeYLpYobpyKN@google.com>
References: <PA1P190MB25578C482C8A3B06A4DCC6FDDBDA2@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
 <20260814174825.GC510472@nvidia.com>
 <PA1P190MB25573D7CFE42EF7DD2A8CDE8DBDA2@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
 <20260814221103.GE510472@nvidia.com>
 <PA1P190MB2557D53CB7FCB70EB8F79D09DBA72@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PA1P190MB2557D53CB7FCB70EB8F79D09DBA72@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_041627_277097_C80C27B6 
X-CRM114-Status: GOOD (  14.08  )
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

On Mon, Aug 17, 2026 at 09:29:10AM +0000, Dmitry Malkin wrote:
> > Don't use it that way?
> 
> Why not? We use pci=config_acs to configure ACS at kernel startup and
> enable direct PCIe peer-to-peer traffic between GPUs and NICs. All 
> affected devices are assigned to the same VM and IOMMU domain, which 
> also reduces the memory footprint by reducing the number of page tables
> and lowers IOTLB pressure.
> 

I'll defer the debate of enabling ACS or not OR supporting multi-device
groups for vIOMMU for a moment.

But, regarding PCI P2PDMA, you can still enable it with ACS enabled in
the upstream kernel *IF* your hardware supports TLP forwarding between
root ports.

When ACS is enabled, all TLPs get forwarded to the host's Root Ports
instead of getting routed directly through the switch. All that needs to
be done is to add an entry of your hardware to the whitelist in p2pdma.c
(pci_p2pdma_whitelist). Are you aware if your HW supports this? If yes,
then a simple addition like [1] should work.

Thanks,
Praan

[1] https://lore.kernel.org/all/20260409150123.3538444-2-jmoroni@google.com/


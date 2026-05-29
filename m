Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD88BCD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 06:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJNLXa3BfaEXEVwdCwb7m/oHGIf45L7rXQiO/qEiadE=; b=abqWss9qrlqxvuK2B2qCimbOxT
	UtJVQVlqLolNIVTonq9Ec12OHviQsiEgEm+MwS5oC6WbtYYk/kNmLNFkkB0RsDZaEkXlimD0HdRuX
	cnNxwme6bul/3e8y4DEzTfCPjTh9Uu/xS2yuMQAQs6Qm4MajwObAy8VIzklU7n47hKZ2UFeUTK+AW
	aR0F8bRqSzEm2cOzarC95fYzswADF4hTGmBzF2emjx+Mmx9LSDwNiednzmKBSNQDocOSgRgo/vNGd
	ElX3NjAMwFWu0LuQfw7/fmJXLkZMYuywrYezy5E3f9Nh5vaw6G/fZfBhuiKHOrYHtXaFjNf2J/u+d
	jPE+fJjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqMg-00000006n2R-2JGz;
	Fri, 29 May 2026 06:06:38 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqMd-00000006n21-4AVC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 06:06:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780034797; x=1811570797;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7FKQBFom695XlbislUzI5qJwnCNNRPQzbQJhpamz8JA=;
  b=ForA8a1Mxawsk/KuEERUqY5baOw7JBokIYSQTGLDcwNfoHajYQ3Dxrej
   KG0ZTvv7gqDrDdL5CGlEJ7VzFKi1zGeO79f48vbmYA8vxQDxIZ/Pv9q9R
   Dmmh9HmYUt12x/09FvxCi0If6rm7ddKMgucAqqV4Wuo43F32rf8xicNHh
   oHRHCMTqp54GLevkTpfRSMDSdVYeFkHXrdiKiymBET6EYiXaALqJ//rEM
   UYLETrqFnR6NDvE7j+rKW8w1xBlYXQQ2h/vS+9EVV5lzPMcNQTAHS/0Ih
   PJfO3NqXwoECtkFfqnGYb8vTXcZGtdP3xKF6rujHn1Wnw1axTZPBoy9dx
   w==;
X-CSE-ConnectionGUID: OqjINCMbSXGUwhfclyf+cA==
X-CSE-MsgGUID: zZOKaGAjSPu/A0wkyhMu+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="103556798"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="103556798"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 23:06:36 -0700
X-CSE-ConnectionGUID: zxb2NGzVQH+4L9h83fDUcg==
X-CSE-MsgGUID: uQpplt+BQkqwHt0j4JhNPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="242864626"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 23:06:31 -0700
Message-ID: <691d3688-df39-40f6-88b5-2f62d9a94bc1@linux.intel.com>
Date: Fri, 29 May 2026 14:05:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] PCI/ATS: Validate STU for VFs in pci_prepare_ats()
To: Pranjal Shrivastava <praan@google.com>, iommu@lists.linux.dev,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, David Woodhouse <dwmw2@infradead.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
 David Matlack <dmatlack@google.com>, Samiullah Khawaja
 <skhawaja@google.com>, Daniel Mentz <danielmentz@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20260528202353.3422206-1-praan@google.com>
 <20260528202353.3422206-3-praan@google.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20260528202353.3422206-3-praan@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_230636_108624_C027BD3B 
X-CRM114-Status: GOOD (  12.58  )
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

On 5/29/26 04:23, Pranjal Shrivastava wrote:
> While every PCI Function that implements ATS has an independent ATS
> Extended Capability structure with a Read/Write Smallest Translation
> Unit (STU) field, the kernel manages SR-IOV ATS by requiring the IOMMU
> driver to configure the STU on the Physical Function (PF) before any
> any Virtual Functions (VFs) are created.
> 
> Currently, pci_prepare_ats() bails out early for VFs, assuming that the
> PF has already been correctly prepared. However, this creates a potential
> mismatch if a VF is subsequently prepared with a different page shift.
> 
> Update pci_prepare_ats() to validate that the requested page shift (ps)
> matches the STU already configured in the associated PF. This ensures
> early detection of incompatible configurations and maintains the kernel's
> policy of consistent STU sizing across all functions associated with a
> given SMMU.
> 
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Reviewed-by: Samiullah Khawaja<skhawaja@google.com>
> Reviewed-by: Nicolin Chen<nicolinc@nvidia.com>
> Signed-off-by: Pranjal Shrivastava<praan@google.com>
> ---
>   drivers/pci/ats.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>


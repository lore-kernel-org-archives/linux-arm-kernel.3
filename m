Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA10CD6E62
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 10:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDUgrIyB02FM5mea3gf7dEX+Hdw7+v6D42bl2KCdIiE=; b=2qgHjqRIrtEuM0TBNTBSHOfXVf
	9l7vGZas5UL3UUMMEbeXkwkdyYhlfnu/ohjf8okQxUTACuT6cDkcWXjPHHkYGRJf+w8mBuH19hK4g
	eINBLewb8zz8ZsnEfd2FOkC6Qgp2XF0sUpELMdghlVmi8lOWYsZkRpqVSDmfyfJOLjcrsWHsu8Aas
	J/8p9lvY2X70dz6JS8p/NbaKtldUkPjz6tq4CoYlidqHRIh/uurzyNuxdfC5Dy4LnJ2kWGC7kNvGv
	c023ClJEMnYYKHDR6LgVxvrCXljWgUAsyuDkcRgnf27/36j72hGs2VYzR5R4ZcL2cFUqgaMBjpC7e
	aDqv+Qsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzzN-0000000AdJy-1Obm;
	Mon, 01 Jun 2026 10:35:21 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzzL-0000000AdJT-36P7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 10:35:20 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2bf2911f93cso535ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 03:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780310119; x=1780914919; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oDUgrIyB02FM5mea3gf7dEX+Hdw7+v6D42bl2KCdIiE=;
        b=cHBEVXgfKbZ3iXot4As6Z2YnyJ7jvE/mbuzKSwsaZi8paEJkUI8jBbxnxu2xj2GEmG
         wx/5cjOoI7l6KDM6Acnv3A6FO6/uXqM3Aqy1+6fU7fxrIo82PYzPWUIiptwt98f26rkD
         KcuUFqzJZTTeWXd6nTtRhE0SNCybgVrfQecxnY0uzCU9aZxpSTS9G5yRADRXJ/qMAreO
         s4W97hwjUppM+M/TNEVP2e9h0RcvO9FcOkWAuCdZ7LNxrgo5G9SxHw9zp+G84qRf84eJ
         bR03adswCsCyKqwHscf/V5xhdsen8nDMqq+/Dx+7RIiNndpb49eEGtHf8MvM8lRBEJpw
         zT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780310119; x=1780914919;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDUgrIyB02FM5mea3gf7dEX+Hdw7+v6D42bl2KCdIiE=;
        b=Hwj152OaemNvu89kJWCCzIjgxUNL/SGlz2EAClBN1FmNbOAq1KxZI5+HseLWE9Xpa9
         Yod7ait3TLjjcDJU+88xgGnhGtM20MbCKmrHXLhAVvNciCd39G3cNxjX6i2+ZnioUDls
         hEUXFov1UELYUlRy+zXBQb8Qj/5eaF9jh8DiC6glTojYAlwp4EpWjDMcW3Z8h+kuxInZ
         0MrH2U+MKwZ7lKJm1rzpbjMbZd9yaCJr98OQyFrJWoYY1b2W6Gz1rm1ztnY9TSbB+Rdw
         gEqCPBImEA006PjkEbX0OI9uI8tEd0uzEE+DRSd6VTxrCm0pA5E5HHrqB0X8nGwxHU+j
         Otmw==
X-Forwarded-Encrypted: i=1; AFNElJ/xK06PtVuvUvOuPriW+yZ143AfbHASxvFsQtaNIRqq6yR9MXBrLZiIB9Qn/S/WwHJWFdozkx+xEWOaBP/hyzBv@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr698or36zoMcfflI+KyzEoFk0u/CEgyzJ+fTAwOjwf+Ye+i39
	r0bbK0ZiGyCSiPgnRn13pv0HO/g+RVMpkp6lahTUj2IEKAMT1yk9OJvJj7eL8/rNTA==
X-Gm-Gg: Acq92OFitkKLoQojg/s3JLTRdX+D4sJ2SBrcV/KFhNFe/wDFY6cfrUZfTBKSsQf7Gf2
	wF6GwQsQ2MBJiTr6LeS/s7dhaK42upQPuqlu7MXq0/0aaeO2sRQyQ9k22HgCPNOf9kk4HgZsj4s
	Air34Fc5lWFXvtSRx5UGzQQe/ADYl07dhEWMhKgS0k31YtV2MARIIjXJsuSnpbGgLsAZ2AwvAbR
	ojf1e2ELv7+cHLRSfBUmVuSpb7BM6g8ITB+6VPjvtTaoGg1Amvzq9wh+NBR01Fv287fdyWnVyws
	f4JxwFn2VH4uPUMDj1aW6rv4fJY3odGc40YILvHvQVCHtkH9QX2d0tHWzAWS1FS1vInKogmTf5H
	8NCoRHpvizXOaJmw8gtoOUlz/Q+yplVmCnkdK+NXzykDvReamq2ZV+6eXYecV3ghoKHkJ8tKYPx
	VY4V/TrYONSbwkefKGqtOPuM+HsItkFskFRahR3NCTcUnLvZ97k+LVihF+e1lalwIi9lz608Q=
X-Received: by 2002:a17:903:15c8:b0:2b4:58ad:e987 with SMTP id d9443c01a7336-2c07cb4cf8dmr4904775ad.17.1780310118403;
        Mon, 01 Jun 2026 03:35:18 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214affe29sm9720174b3a.3.2026.06.01.03.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 03:35:17 -0700 (PDT)
Date: Mon, 1 Jun 2026 10:35:10 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Ankit Soni <Ankit.Soni@amd.com>
Cc: Vasant Hegde <vasant.hegde@amd.com>, iommu@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
	David Matlack <dmatlack@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v6 6/6] iommu/amd: Fail probe on ATS configuration failure
Message-ID: <ah1gXgPIdVXBzo_w@google.com>
References: <20260529111208.387412-1-praan@google.com>
 <20260529111208.387412-7-praan@google.com>
 <unqzyef2n26wdf6tmc6vvwvpsgv244uvz7cxji4scymqmoofyb@trkzr7ix5bog>
 <ah0kyi5asHpnrpgC@google.com>
 <drmnqcya6v6wtcazil4wojno2crp4obywudycl45uvqszp66ms@5t5uj2624dor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <drmnqcya6v6wtcazil4wojno2crp4obywudycl45uvqszp66ms@5t5uj2624dor>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_033519_779346_D50893A9 
X-CRM114-Status: GOOD (  16.79  )
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

On Mon, Jun 01, 2026 at 08:17:23AM +0000, Ankit Soni wrote:
> 
> Hi Pranjal,
> 
> Plan looks good. One pushback: I don't think you need the
> amd_iommu_restore_msi_domain() helper.
> 
> If point 1 preserves rlookup_table on the PD_MODE_NONE and
> pci_prepare_ats() failure paths, dev->msi_domain pointing at
> iommu->ir_domain stays functional - irq_remapping_alloc() /
> __rlookup_amd_iommu() find the iommu and the chain works.
> So fixing rlookup makes the MSI assignment correct, 
> not dangling - no restore needed.

Ack. That makes sense—if we preserve the rlookup_table entry, the MSI
the MSI domain mapping remains functionally correct and the chain
stays intact. Thank you for clarifying that.

> 
> On splitting: While patches 1-5 are essentially settled. I'd lean 
> toward pulling AMD into a separate follow-up so the rest doesn't wait,
> but defer to Vasant/Suravee on that.

Ack. I agree with the suggestion to pull the AMD-specific work into a
separate follow-up series. 

> 
> +Vasant

Apologies for missing the CC! I thought I had Joerg's latest tree and
get_maintainers would automatically add Vasant.

Thanks,
Praan


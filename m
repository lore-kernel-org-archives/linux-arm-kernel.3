Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED1DFD4F2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 19:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7vY2UrB9SGH6OvdmDiCHyzJiFowvOHfRjqE+9AkweY=; b=V0GAKdQ45HG39cJuRasgQ9RAGY
	aSgQ3kOrR7qUHCaE4BAL8Pi7wn6kkHT2/rVmDnMiKxJSsHEo0dYG0Ytd/lVmbxubEtDWoYoOPBItJ
	NVUiJQHd2QR1S464niYXQVaHQv8ni9bc5D4J5qVO+fB7BeT0JYjBMk5BnpO6POR2UpPstAxovVF3F
	JdVJ/H/ZRbQlmcMZeIayt8VRHikEYYzrI8glvA8GKwyN+64himA89jOf1i42nDtaE+COXwVWYDP9h
	2NslvLN299MUyL4PXUasm4b7z1lWUXq/OAzmKzLPBOj7v20Wm1i5SxMexiN3jjffFZtNGga0Cuquk
	oyFgfFdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02x1-0000000ABZY-0B3c;
	Tue, 10 Mar 2026 19:41:07 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02wy-0000000ABZA-37A4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 19:41:05 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ae3f822163so28815ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 12:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773171664; x=1773776464; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D7vY2UrB9SGH6OvdmDiCHyzJiFowvOHfRjqE+9AkweY=;
        b=4goJQOiju4Sx/QcWCDSzp/s3RMkGvy/vK7dMbJFhoI5gjJfTkAFoosrN347Br+Q4Ib
         3/OZ/ykwKVFJmjAclpabEV9ho6sxiNho55uhsrC6TPbP0L9PLNur3O8U8JO5FZ1+TwXw
         L8I+hKTCZ3bBPaFyS2qkkMEqhH5MrNtaG2yG5nUzwoOBMrJ5JHnMcHyR1DKBZvKwflQ4
         OQLgFDoMsC05+iLu4PwZwUMl4JRhPZTjTVPR93W9EzQQlKPfI3gxXcvtj+9ufjDfWrsp
         ZaCGM3AXTUPYIQegWgYi/KTSlqPKvlbWk6M1v+9epUCkHEbkQl0raqbL3G4jRoiQ4jLW
         h50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773171664; x=1773776464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7vY2UrB9SGH6OvdmDiCHyzJiFowvOHfRjqE+9AkweY=;
        b=kcqjV4utNJMVS4dPxYGXdRQ5l471Wm5TjtI7DLxFJu7zQ65kzLHKMJ20dn9JcM9Thz
         rvCApSz9TBfcdd/AIcFsWHDTa4/Qeu8f6fNe+Fzhb1VUEN9djFYYIH6haK2HBExCTV9g
         oNyc9i2wmiUKOYvfaZfdnOQZxYmGDaosFNxJ3ck3mngYWEwr0RYPGovutaV2N50F6ryN
         beqm4qqnBZmStYfhsiPZxYsT0e8FKbsAFLNlHKn3IWGTvOfRbPMBeb5HdU2BotQAMfIO
         DtJj9ROBYyd4ST3QKAHGBbvej/IomVyLUTA+I/yA51GIjxQtgJRyQP2FvBeoWisF5leR
         3NOA==
X-Forwarded-Encrypted: i=1; AJvYcCUbyuo6tju/H78DzfIEMDYpBXrp9Q/5cSTpXdtbN4O4VloAU1Cq9jzK+wl6Nk6SeqqAr0MbkYAhgzJDVTe8Xnl+@lists.infradead.org
X-Gm-Message-State: AOJu0YwB8HxXhVSHiU1ekvP5WQpuylJTcjrHOhns3iInUTOfitf2pE7m
	OsFHB9ApJkY5Eho5LWWUBzXqNkF6Wpgi6ZLbqPZcjim90Zb3Nff+TSHEd6f7z08+9A==
X-Gm-Gg: ATEYQzy3Nw2CoX9PEL7cjuV0U6DcFknynEZv3YsuBQhPThto3lIk13r8t5wzWR5ON1b
	+3zVEG1MD2Chpj8Eii4DPoW+IXmQqQy7319Vs4GBUDL3+Ba8AxfZ3BmZx2LqcU/yHf2t1W9gDez
	yirLcFTnCzNR7QGlN7Je0rur4tSi71YlBDtnfibis0mHgukrkHlCTnstd9B9nfmGUnjGhZE4n1z
	JVaNx65UKVOFHAgo2U3vhDmN3fuQ3ZMFDUl7oKCHTVKZKK14wHdfcXBqjXBhuSlPoZm7ZT+Sa7p
	1iaQeabYz5CcqCRG5Gtvvf63+4ri1Pcr0cSN2Jz4PTbDCMqWcSxzEdNbkWBK88Jiff7JTFPft+7
	+EhBIUR75lKECYOFf4cf27odqTxJ95jyD7/uFMr7ihWbDjml58fdesx0iLyENxqNHDX8TAA0nCj
	gB6zzdsHkAAom29zL7jj7Pdt3MXQyiuGfLFoEMsjlCpLAr39W3zGHDlICMHw==
X-Received: by 2002:a17:903:191:b0:2ae:44ff:5f42 with SMTP id d9443c01a7336-2aead3e3606mr687905ad.20.1773171663319;
        Tue, 10 Mar 2026 12:41:03 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f05edd69sm3807665a91.1.2026.03.10.12.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 12:41:02 -0700 (PDT)
Date: Tue, 10 Mar 2026 19:40:56 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, bhelgaas@google.com,
	rafael@kernel.org, lenb@kernel.org, kees@kernel.org,
	baolu.lu@linux.intel.com, smostafa@google.com,
	Alexander.Grest@microsoft.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
	vsethi@nvidia.com
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
Message-ID: <abBzyKNZRzRykRV5@google.com>
References: <cover.1772686998.git.nicolinc@nvidia.com>
 <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
 <20260305153911.GT972761@nvidia.com>
 <aanygWWZLA1htDdQ@Asurada-Nvidia>
 <20260305234158.GB1651202@nvidia.com>
 <aaot8uRsli5jNPzH@Asurada-Nvidia>
 <20260306013347.GD1651202@nvidia.com>
 <aapgyXadT1TEz29u@Asurada-Nvidia>
 <20260306130202.GG1651202@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306130202.GG1651202@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_124104_789940_2CA722A8 
X-CRM114-Status: GOOD (  25.96  )
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

On Fri, Mar 06, 2026 at 09:02:02AM -0400, Jason Gunthorpe wrote:
> On Thu, Mar 05, 2026 at 09:06:17PM -0800, Nicolin Chen wrote:
> > On Thu, Mar 05, 2026 at 09:33:47PM -0400, Jason Gunthorpe wrote:
> > > On Thu, Mar 05, 2026 at 05:29:22PM -0800, Nicolin Chen wrote:
> > > 
> > > > But arm_smmu_cmdq_issue_cmdlist() doesn't know when to push another
> > > > CMD. In my case where ATC_INV irq occurs, the return value from the
> > > > arm_smmu_cmdq_poll_until_sync() in the Step 5 is 0, and prods/cons
> > > > are also matched. Actually, at this point that NOP ISR has already
> > > > finished.
> > > 
> > > Yes, you'd need a sneaky way to convay the error from the ISR to the
> > > cmdlist code that didn't harm performance. Maybe we could come up with
> > > something, but if it works replacing the NOP with flush sounds fairly
> > > appealing - though can you do a single WORD edit to the STE that will
> > > block translated requests? Zero EATS?
> > 
> > Yea. I can give that a try.
> 
> This also really needs to go after the invalidation changes because it
> is feasible to also edit the lockless RCU invalidation list from the
> ISR and disable the ATC for the failed device too.
> 
> > > Also, will the SMMU start spamming with blocked translation events or
> > > something that will need suppression too?
> > 
> > CD.R=0 can suppress fault records, but we would need to override
> > that in every CD of the device.
> 
> That's too much to do from ISR, but maybe we can do it from a WQ..
> 

(Skimming through these, apologies if I'm losing context), shouldn't we
do all that (marking it as an inv STE / abort STE, suppressing the
faults) in the worker instead of trying to reset/recover the device?

> Jason

Thanks
Praan


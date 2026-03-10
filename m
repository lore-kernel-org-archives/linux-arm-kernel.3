Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96385FD4F2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 20:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRgrUdtpUgdkaRQjebipTE+C+YCciQQD0TojrtBETB8=; b=B8NpjFG66pKCDAW1TPEY9nkRcb
	pUsPk4K9+abovthc/nVjxtEPm/7y306/382JSQW6lg30Asr8fP5TRe39KKwhQij9OLRC83sXiTIF2
	PKcSwf5tBV+niq365EkkOHq/ZxJTHxeIspHwiC5mC0x+1imi9mtkHU5B5oTA8ey7rXgrGs0sW2NxF
	R1Hy+2bYCcZWnqddTwkCv2XZXvv4OXYX0HrJ64i+FOATaoj6vy0h6xbg8B83pBfavoqIzN+bY0qD/
	T8Xx+p++S6s36ubbMZgpRZQvHtnT46Gpl4UBvw4ItZ3iwDAemYuR8n9m0JTg2P+U4jC0Nv4xkpBOB
	GupmrOpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03GB-0000000AD5o-0jlB;
	Tue, 10 Mar 2026 20:00:55 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03G8-0000000AD5M-27lS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 20:00:53 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2aea4ebb048so6085ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 13:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773172850; x=1773777650; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CRgrUdtpUgdkaRQjebipTE+C+YCciQQD0TojrtBETB8=;
        b=NJeeSzYdvsKNtI9vBG/xZOz0jxEtoJfcLs0Hz88UOtUwNp2+ncZW0Oq2dKptg9c6dl
         5Ol+nU81Zu+CufUjDyO/q+7DVxURT6khQyXHrGq4idABdvf9nB7q9XlUeOBWJ6dsf7Uj
         5fc+tjFDGKUxBIx/bN8cdD8CVQZyI+Tns+9Ws2E2ceS4B2IerltEd+FQ3TGmQlKiJBFl
         XRvQUVfghJdn5Xdnh832Cf2s4YaHb2NzWl1CcVPQJtjZ150VQmb6+LhQNxy3laWpQoIx
         LmtNTsvcsn4ojsyNT0lInZrOPb3cINpo7uNLyVQGDAblZifGIHtLt+3RoXQaZwKWxJJc
         0jdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773172850; x=1773777650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CRgrUdtpUgdkaRQjebipTE+C+YCciQQD0TojrtBETB8=;
        b=kW7G3hOh9o44jpqxe5mzfHNgjf0OAsERAPuksvjrdE7oJVZVFGgiillmU7iSjihQMs
         wRJdYZZV3jcP4NE6EyNNqV+pvvczgoQYTOoXovQ1DM5yILHrquzzcRl93IOsk3yRnNjb
         X5BjWjG+1Uz83fx4R8OHwwiKMbWU387bZoBjz0MVhakw54oBlUqM3IT0iGYQBdkvky7H
         E/mgmI+IWFXAZzBHUEyw/emOvDJmmUCdAvKKnG22s+fL9g8FDjMxunyFAC41Ga6nKRsj
         HW2RS5RQQ6/fwJTRkZbuqUfofI21+Qkx0D3/bxfKWADWqx8pBVQAUyC4q2sAB/QsIs+G
         NFyg==
X-Forwarded-Encrypted: i=1; AJvYcCXAQ45qZ7SyEnTmuU9JCguF0V3v0bn0DjTtJW5v9iCPlrTAGgHh7suKnzY80Y4PXskt4QwhA8uksw74wbLLMitu@lists.infradead.org
X-Gm-Message-State: AOJu0YzgFYBu85kntt4ObrtDXJBatqmI2s/rhVAEp2OkKCtbIcQTsGMU
	Eqm32N8Hyp9wuaX4jLeUdescGNYl817I+8CcV3EVkVFXUzSrbqPC27jMf/WlRbHgxQ==
X-Gm-Gg: ATEYQzzOEmv8Fq+H7XOL1NHFqIIUwnSKUJtT1OJYOoSee00FYSjEE01HFMsiuFIc0pT
	v+Vke+y4SiMmU7WAx1+lMyJYtUgIPot4C0etQqN1aaBocB66OLkwj4v8goRoG72oq/zaSWrSTL1
	tCpgA8KdVGoCrBs3FRKqjS8N1qcwFTmoes9meihvkAivOC04AY7Xw+1JrHgq4AA8JLxJMYUC5X3
	+nHnYQ4053Aps75697jbtfSDtDZeYwkSQZca9OcRT4obLUQ8mYeVo084qwl4KA3e6Q+VCTEN9zK
	YSoe+Fm0tovZmI+5ljuTHRWf703Xvt5f6UT8GNzfuOxyJzfPx8dBrlXBppF0we2YjZsslwSKXJs
	Gwk/+evB4RQFirvdhPcPpiNijD/bfNGTXWMb5XwiOsMYAl3L7OAtGE0yhisQvmSp8piQ/m3TdMd
	X/+Ubcoovxp8PmvWsqBn+ycIhRGX+9x9bHdFNHy5piJyOJoPpjGYkYWRyqZNKJmQ==
X-Received: by 2002:a17:903:234d:b0:2a3:cd98:f07 with SMTP id d9443c01a7336-2aeae708648mr72605ad.3.1773172849749;
        Tue, 10 Mar 2026 13:00:49 -0700 (PDT)
Received: from google.com (168.136.83.34.bc.googleusercontent.com. [34.83.136.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f110991esm3573204a91.13.2026.03.10.13.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:00:49 -0700 (PDT)
Date: Tue, 10 Mar 2026 20:00:45 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	bhelgaas@google.com, rafael@kernel.org, lenb@kernel.org, praan@google.com, 
	kees@kernel.org, smostafa@google.com, Alexander.Grest@microsoft.com, 
	kevin.tian@intel.com, miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pci@vger.kernel.org, vsethi@nvidia.com
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
Message-ID: <abB1VJ5Op24dMIog@google.com>
References: <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
 <20260305153911.GT972761@nvidia.com>
 <6416b7fe-0190-4c7b-9a62-5da7d5eea794@linux.intel.com>
 <20260306130006.GF1651202@nvidia.com>
 <aasmWvA-sqi0KJwO@google.com>
 <20260306194312.GL1651202@nvidia.com>
 <aasv1HYOKuuJyi1k@google.com>
 <20260306200321.GN1651202@nvidia.com>
 <aas0dLwKmZyL_iOL@google.com>
 <20260306202652.GP1651202@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260306202652.GP1651202@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_130052_570910_F7AFE53E 
X-CRM114-Status: GOOD (  18.55  )
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

On Fri, Mar 06, 2026 at 04:26:52PM -0400, Jason Gunthorpe wrote:
>On Fri, Mar 06, 2026 at 08:22:08PM +0000, Samiullah Khawaja wrote:
>
>> But do you think doing the timeout logic without fencing would be good
>> enough?
>
>It is what ARM and AMD do, so I wouldn't object to it.

I think without any back pressure to the caller, a device will be able
to fill the invalidation queue with device IOTLB invalidations that get
stuck until the HW timeout occurs.
>
>> Currently VT-d blocks itself, until it gets an Invalidation Timeout
>> from HW, and system ends up in a hardlockup since interrupts are
>> disabled.
>>
>> Are you concerned that if fencing is done without an RAS flow, the
>> device might not be able to detect the failure (if it really needs ATS
>> to work)?
>
>Yes, and then the device is badly locked because nothing will fix the
>IOMMU fence.
>
>VFIO might fix it if it is restarted, but other approahces like
>rmmod/insmod won't restore the broken device.
>
>So I'd rather see a more complete solution before we add fencing to
>the iommu drivers. Minimally userspace doing a rmmod, flr, insmod
>should be able to restore the device.
>
>Then auto-FLR through RAS could sit on top of that.
>
>> I am thinking, we can do translated fence and timeout change for VT-d.
>> And the device can use existing RAS mechanism to recover itself. This
>> way we atleast make sure that caller of flush can reuse the memory/IOVAs
>> without UAFs.
>
>Without a larger framework to unfence I think this will get devices
>stuck..
>
>Jason


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C36C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 17:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFrAK725pGLGAzrUp2Rsi/GlBUn5vFqjGk9jd1UKZys=; b=cSEF4XbZzIapIoFpkqpd0H2dkO
	BhUCGjVM5gI3BJA8JPVhJvQah0aIVPbb6DOkSSUNcN9FVnL2+jPI7sWIdenU1YB77DohOwefc/28j
	0dRaWtcDR3zSzKEhpBprFGFo8N5G94L922um2E9cAVk34QdZAG0jhEvS88zJJHVqP8MNhqE+vuBnr
	1gKa58aR9H6kdDuPX/W8bHJmP5AM1Q0UMd6Mq+NEAAd/0gWK11oQ2DEN4HyrVVxZCmQ1N5Q1SL98p
	S6gzo9gu0rGyFp5fafk08AuBegH1mni0+16smFWCATgG1rxkccBZIAuNRkTtVMhG0TD+uz1bv7nY3
	jng0fHvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm8x-0000000BxYV-3DsK;
	Thu, 13 Mar 2025 17:14:51 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tslRu-0000000Bq0e-1jPK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 16:30:23 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-54953b2c112so123356e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 09:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741883420; x=1742488220; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:user-agent:mime-version
         :list-unsubscribe:list-subscribe:list-id:precedence:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aFrAK725pGLGAzrUp2Rsi/GlBUn5vFqjGk9jd1UKZys=;
        b=uQ+72iO5zwLdY9ls/tngp0litp0xlb966XPLh2D8xZAM2RnNW3F2ZBy2OMyhTKAkdb
         TuMFM7MNcLv3iiq64lJztnyGzy5tAw58YBHgDvrjsgMZbYLLEzGmA9F9IvDmmHmKZFKR
         XfDfUHuSocKeFDcr0/EMOxrC8EANkgJGAYWCHjXQC+73YYKsmFZJCVkbCt1EEZnAMPVm
         PVEhRc3mONra3JZlRsdC1xwmiBQFuKficBg+4lJddEEQYnS4rouJwawRdnEmq89Jbx8H
         MXvy3Tq6Nmq5K7FTN32NU5F8W1/j9xNaZmPgyXgtSJf0w5sM3zOO+WyKpi53IwHn8ZQW
         7k5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883420; x=1742488220;
        h=content-transfer-encoding:content-language:user-agent:mime-version
         :list-unsubscribe:list-subscribe:list-id:precedence:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aFrAK725pGLGAzrUp2Rsi/GlBUn5vFqjGk9jd1UKZys=;
        b=l2VU3LzWZzXc8F+Zz7wNq0JTCXP9yeit2MHUhxcJ5Bds0tWnGgJ9l6lo0kMH5nGmlv
         tikK6dHEsoeiEK8z1fy7Kbe0tsRVRLKsfO9sul2EumgfGp5XPk5O1TKo3EgvoVRQF9BD
         ILUjF5rb2iAXo7rlGQjrCJiRjqbFqGSSeAPt2TExRPWuafgL8XMGPlcC0CiHBH13RSNN
         FW0r/Vkskhy2qOn/WObImIK1+A+pphLHpKrBS225txGz5pG81r7NERBj1gIpiERsBVhM
         G+6PmhZc6SBQgCwsE+SB22A9jt2IyM9z8PRMZrngGo89yZtoNC4GatK0hkRBQ2gA6r5l
         fIFg==
X-Forwarded-Encrypted: i=1; AJvYcCW+AAuLTqvgS16AyYNSjzXoSNejg7hpUPZEKRQ67Ckn8UBZ+ELRcl8y3qnVtnuSOamBJCucQLb5Mz589MJjYJH0@lists.infradead.org
X-Gm-Message-State: AOJu0YxvqNvY8+oQaUAH3tVysZmY4Fx9V8xi/kbmVwAaGqGxaRRmlG3a
	DiW3t3noDVOkwJVuQXq0yzu9Py/m0+AyXIpzjeSJ1L1BqkGsM2Sez555zsELR6I=
X-Gm-Gg: ASbGncukNcNuMAmrFBmgCJuiYbALSrSZp7aLvHIqopYWHkzrxBYoRuVbwT/+Er0fcDQ
	IrxOcvpabvnufX48ic/S7QK0TTX7+NeaYh4G11pq822FdOp9s1CUqO7VjXYzPcNWWu4t7rPzhd8
	SRvoosVj2cANzaj7ZwZP1nrhxcLHKJlg01EN/rA41HAOqvFCueGFcDyiCgSu5d2SkXSHmB0WtEW
	piCEAJ2eveqrJ6IYhmwTzHQa4raYLRf8YhN96wOfjVefHlq2tN4Siq1Acvrn3ULoDgAre5gJwq/
	Afqhy9NZ6CJT9BioZ86vpECXitxBR7+lYun5XAXyOHvYSQoMojcSsWZ43e89Nt3aBkBCJla7ebU
	kzM3IiLOiEfcfjlogfw==
X-Google-Smtp-Source: AGHT+IGtn9WumNOaMuo9cAzRTdloUKB5tTLRLe9/61uA56u97uNJuHXYLD/mRuofS9RqJFSJqixgYg==
X-Received: by 2002:a05:6512:b0a:b0:549:8f39:3e63 with SMTP id 2adb3069b0e04-549abaea8b6mr1524832e87.9.1741883419995;
        Thu, 13 Mar 2025 09:30:19 -0700 (PDT)
Received: from localhost (c-85-229-14-155.bbcust.telenor.se. [85.229.14.155])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-549ba8851e1sm256528e87.201.2025.03.13.09.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 09:30:18 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: robin.murphy@arm.com,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	quic_charante@quicinc.com,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe path
Date: Thu, 13 Mar 2025 17:30:11 +0100
Message-ID: <417d6f59-0d78-4e81-ad0b-e06846f786b0@arm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <9b358d68-332e-404e-9a75-740297f7b28d@samsung.com>
References: <cover.1740753261.git.robin.murphy@arm.com> <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com> <CGME20250313095633eucas1p29cb55f2504b4bcf67c16b3bd3fa9b8cd@eucas1p2.samsung.com> <9b358d68-332e-404e-9a75-740297f7b28d@samsung.com>
Received: from foss.arm.com (foss.arm.com [217.140.110.172]) by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FBD1EE7A7 for <iommu@lists.linux.dev>; Thu, 13 Mar 2025 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14]) by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21D5E1516; Thu, 13 Mar 2025 04:01:50 -0700 (PDT)
Received: from [10.57.40.246] (unknown [10.57.40.246]) by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C60353F673; Thu, 13 Mar 2025 04:01:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: iommu@lists.linux.dev
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_093022_459351_067BE739 
X-CRM114-Status: GOOD (  22.41  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
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
Message-ID: <20250313163011.R_zhEw_IFbqRtIBQPTudfCj6gGklnTTEC_RMZh6lCNk@z>

From: Robin Murphy <robin.murphy@arm.com>

> On 2025-03-13 9:56 am, Marek Szyprowski wrote:
> [...]
> > This patch landed in yesterday's linux-next as commit bcb81ac6ae3c
> > ("iommu: Get DT/ACPI parsing into the proper probe path"). In my tests I
> > found it breaks booting of ARM64 RK3568-based Odroid-M1 board
> > (arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts). Here is the
> > relevant kernel log:
> 
> ...and the bug-flushing-out begins!
> 
> > Unable to handle kernel NULL pointer dereference at virtual address
> > 00000000000003e8
> > Mem abort info:
> >     ESR = 0x0000000096000004
> >     EC = 0x25: DABT (current EL), IL = 32 bits
> >     SET = 0, FnV = 0
> >     EA = 0, S1PTW = 0
> >     FSC = 0x04: level 0 translation fault
> > Data abort info:
> >     ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> >     CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> >     GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> > [00000000000003e8] user address but active_mm is swapper
> > Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> > Modules linked in:
> > CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0-rc3+ #15533
> > Hardware name: Hardkernel ODROID-M1 (DT)
> > pstate: 00400009 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > pc : devm_kmalloc+0x2c/0x114
> > lr : rk_iommu_of_xlate+0x30/0x90
> > ...
> > Call trace:
> >    devm_kmalloc+0x2c/0x114 (P)
> >    rk_iommu_of_xlate+0x30/0x90
> 
> Yeah, looks like this is doing something a bit questionable which can't
> work properly. TBH the whole dma_dev thing could probably be cleaned up
> now that we have proper instances, but for now does this work?
> 
> (annoyingly none of my Rockchip boards are set up for testing right now, 
> but I might have time to dig one out later)
> 
> Thanks,
> Robin.
> 
> ----->8-----
> 
> Subject: [PATCH] iommu/rockchip: Allocate per-device data sensibly
> 
> Now that DT-based probing is finally happening in the right order again,
> it reveals an issue in Rockchip's of_xlate, which can now be called
> during registration, but is using the global dma_dev which is only
> assigned later. However, this makes little sense when we're already
> looking up the correct IOMMU device, who should logically be the owner
> of the devm allocation anyway.
> 
> Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe 
> path")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

This patch fixed the boot on rockpi4.
Applied it ontop of next-20250313

Tested-by: Anders Roxell <anders.roxell@linaro.org>

Cheers,
Anders


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB66CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44mlWCPvJZE4U/DgdLG8fzSZ4I9bVnYE44SjW9kvLsY=; b=GV43UtoklyrWFfVoZiZ/x3PF8m
	GzOwuXiaQNgODJNoeCT0fBKcDZ2FQE3yKnzDEQCw9qoSpwFxOg4+RbKkFIcjIxAmBLFJ+64bndnqf
	KpdfYv0sk7m0C72pLleVUeclZQkzMqj41UrOioMQlKZtTjBDun3iozDcM197Q6MuGFoibOdHeupkp
	Hz8h3tBSvS9UoZIrlsMM8ciGthFtDcFj4E6v/TgWUNhhwkkQ2sTkyTlnjvt2hAB0ch6rfJ6Qr1XfK
	45GGozWBm1yDe1FShPU/C+o72Cdcq/b9yUM+yhyA/WVtbLRKHSiiO2wS7WiKJcLemhIKBYxU/DrZt
	W3PwAhlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFkP-00000000eu3-1Yxk;
	Tue, 19 May 2026 08:24:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFkM-00000000etA-1Sp5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 08:24:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA7D91CE0;
	Tue, 19 May 2026 01:24:06 -0700 (PDT)
Received: from [10.57.21.217] (unknown [10.57.21.217])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 675043F85F;
	Tue, 19 May 2026 01:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779179051; bh=Y/ur6kXaqyutmulE6ALqWLW6OIukPW3L6JklRGunmRk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mZG8aox/W/e6xzhn5RiTNydJTpx7flfHa/abZ3kd8KTqJJ71HHucb3bQGFflvCn0W
	 HgL59EE2AyG3IVbJqMMEyB0L/E7CCEYcO65lQY1jxB14er0PuDC3w9ukYW34JH66fw
	 YBFFE8XCuROPCyHeY83FCo4XfqVvlp+m8Qn9tncc=
Message-ID: <afca6cdd-f9e3-4b5f-9f70-940c8dbb7a80@arm.com>
Date: Tue, 19 May 2026 09:24:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 00/14] coco/TSM: Host-side Arm CCA IDE setup via
 connect/disconnect callbacks
Content-Language: en-GB
To: Will Deacon <will@kernel.org>,
 "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexey Kardashevskiy <aik@amd.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Dan Williams <dan.j.williams@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Cameron <jic23@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>,
 Steven Price <steven.price@arm.com>, Xu Yilun <yilun.xu@linux.intel.com>
References: <20260427065121.916615-1-aneesh.kumar@kernel.org>
 <agsNO9cc7H-b0H8L@willie-the-truck>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <agsNO9cc7H-b0H8L@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_012414_434774_78A48954 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

On 18/05/2026 13:59, Will Deacon wrote:
> On Mon, Apr 27, 2026 at 12:21:07PM +0530, Aneesh Kumar K.V (Arm) wrote:
>>   arch/arm64/include/asm/rmi_cmds.h         |  85 +++
>>   arch/arm64/include/asm/rmi_smc.h          | 168 +++++
> 
> Curious, but why does this stuff have to live in the arch code? Wouldn't
> it be better off somewhere like drivers/firmware/ or
> include/linux/arm-rmi.h?

Good point. RMI interface is only available for arm64 (not in Arm32). 
That said, it is indeed a firmware ! ;-) interface. The APIs are closely
integrated with the KVM Realm management. If the general consensus is
to move them under drivers/firmware (like PSCI), we could take that
approach.

Suzuki

> 
> Will



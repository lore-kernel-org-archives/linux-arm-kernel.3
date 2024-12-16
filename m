Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFA3E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 16:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZ5fTGNG7nBhiocxaibfSCdd1d8c3UkaZd2PaREWRso=; b=enSyv/Ja3qpI7CM0tU4TSS8LbI
	44BVfNwHuB/D3A+X/0FsKHUGrTeU4U750XbE1GunpxC0mW1blwH+BjAy3/Npn2jX+UVBBEUF1Tj0o
	eDGMKXrg3AG2Fl1DPAto2KqWsXGKJqyPVID7zMSTno1aboJnT9UHGo9HiLVdjuQ3QKD4XOEBNooKK
	SeVKVJeutVV1fXowyTm8KKf60Avwj7TqObKvvCxcVPo9u9mtiKH8EVRmwkDLubGKeNragukfxLU9L
	RLz2kcROUiaWaK+Ys7Hh5yvX42ohmx3OOFkyfSNJ9lmQcJCDgYFFonoKu+gF+xiywbvk0bW7Z/dCK
	QRZ1ZNwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEEu-0000000AeHx-0xhk;
	Mon, 16 Dec 2024 16:46:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEDm-0000000Ae4k-3Jql
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 16:45:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E3F4106F;
	Mon, 16 Dec 2024 08:45:53 -0800 (PST)
Received: from [10.57.71.247] (unknown [10.57.71.247])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2C46B3F58B;
	Mon, 16 Dec 2024 08:45:22 -0800 (PST)
Message-ID: <6036b1a0-608b-4fff-a2f3-63eff2d52338@arm.com>
Date: Mon, 16 Dec 2024 16:45:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/43] arm64: RME: Handle Granule Protection Faults
 (GPFs)
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-4-steven.price@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241212155610.76522-4-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_084526_876021_5F796342 
X-CRM114-Status: UNSURE (   9.21  )
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

On 12/12/2024 15:55, Steven Price wrote:
> If the host attempts to access granules that have been delegated for use
> in a realm these accesses will be caught and will trigger a Granule
> Protection Fault (GPF).
> 
> A fault during a page walk signals a bug in the kernel and is handled by
> oopsing the kernel. A non-page walk fault could be caused by user space
> having access to a page which has been delegated to the kernel and will
> trigger a SIGBUS to allow debugging why user space is trying to access a
> delegated page.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>




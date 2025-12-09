Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2613DD3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 15:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHCeA0TUQ0OqKx1yTCQPtXDQIbXtpVZ9vm6s7aoOqqk=; b=ePOdNno+TrWaopNYCRBOBYmY0O
	ZEXM+jFXewPal8L39i0QCqiItHDyg+n49L8aqV8nLn2Jjzh6neWnY8Yb+MhW21Xh9AyogyGJ7wn0U
	wCqCr77yJwrMwqjE/guSDEUh9/+HAV0lCQTMprM7NYXaTlLkEXj2xlfPwc/ZVQHrQGr+yZ+qsX7fn
	PUGKn7PZRMyv3Zmx3zq6BEiRKVzpzcCdZ/skTMggPPKfsbbfNCvJw4MpoPg2w3SsC/+LEH0ORxva7
	FcQaM7hl0gjeIw7Q8twXuGuN0sLE/8qw1n1gkAshR763rtzZIlPMy6EdRKvgN9UiR7nz1HkNFW0Ms
	bM6iyF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSzhB-0000000ESNv-1yOk;
	Tue, 09 Dec 2025 15:32:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSzh8-0000000ESNa-33Vw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 15:32:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71AF7175D;
	Tue,  9 Dec 2025 07:31:57 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66D443F762;
	Tue,  9 Dec 2025 07:32:01 -0800 (PST)
Message-ID: <f7011785-90df-4355-bc4c-f4be96799015@arm.com>
Date: Tue, 9 Dec 2025 15:32:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/38] KVM: arm64: Force guest EL1 to use user-space's
 partid configuration
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Gavin Shan
 <gshan@redhat.com>, rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-7-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251205215901.17772-7-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_073206_833859_F3CBBD5C 
X-CRM114-Status: GOOD (  16.29  )
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

Hi James,

On 12/5/25 21:58, James Morse wrote:
> While we trap the guest's attempts to read/write the MPAM control
> registers, the hardware continues to use them. Guest-EL0 uses KVM's
> user-space's configuration, as the value is left in the register, and
> guest-EL1 uses either the host kernel's configuration, or in the case of
> VHE, the UNKNOWN reset value of MPAM1_EL1.
> 
> On nVHE systems, EL2 continues to use partid-0 for world-switch, even
> when the host may have configured its kernel threads to use a different
> partid. 0 may have been assigned to another task.
> > We want to force the guest-EL1 to use KVM's user-space's MPAM
> configuration, and EL2s to match the host's EL1 config.
> 
> On a nVHE system, copy the EL1 MPAM register to EL2. This ensures
> world-switch uses the same partid as the kernel thread does on the host.
> 
> When loading the guest's EL1 registers, copy the VMM's EL0 partid to
> the EL1 register.
> 
> For VHE systems, we can skip restoring the EL1 register for the host,
> as it is out-of-context once HCR_EL2.TGE is set.
> 
> This is done outside the usual sysreg save/restore as the values can
> change behind KVMs back, so should not be stored in the guest context.
> 
> Signed-off-by: James Morse <james.morse@arm.com>

One thing that is needed in kvm now that we are changing MPAM for EL1 is
an update to the __*activate_traps_mpam() to not assume partids and pmgs
are 0. I have an existing patch to deal with this.

Thanks,

Ben



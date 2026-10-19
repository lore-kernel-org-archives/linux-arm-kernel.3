Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847A0CCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RA/hcHJY3Xat3tCcIdPXsEW1mdR/MAvb3pTyuaKtH8=; b=rWBybp3PWaRDsBh54i1/LRkJoC
	TjF0G1hZbQPBDzlyxoLAueSPB+NNHdEdrTZ28r0nZx45ugqAmemjDFtAPfI3ZVmM4ykv/Q7J7/DCZ
	SFw+utIxv88UzB3Gdk7KhjB3+8wpOcGP30W7xuu2IIg/60hyKQuSGBFaURbkrPHbWPkiNQSBDVjZm
	2TXPJhjSWFhjFXz5iHEIuMnRNre5KD6Jfs1kIw3GOyRlNdt/4i9E98jAe0oq/uZtruBN2ylMym1kG
	JsFjTe3zcFauZGRin2bH6cOAFN6ipKsAVcbg97IMo40T/pMCKA7HdZRGRihamInk4W1hLOpUwbzxa
	VKHfsOnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIj6Z-00000006uUM-0tSw;
	Mon, 19 Oct 2026 08:52:27 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIj6S-00000006uRu-1KEy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:52:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9RA/hcHJY3Xat3tCcIdPXsEW1mdR/MAvb3pTyuaKtH8=;
	b=GT1bZLoWEeUhVI9pHxVGG5Ih5t07PJ7PhNfPRlbaE6gxZFAUryRnYskkR/n2v4K6+kzhR3gNZ
	GFY97Pdf5N+UsxDTpm2dJa7f5PXuLu/jkhwrISX8RblokF3/07EYt7DotxFJMl8Kpy6VH79B1q0
	qJGqGHYJkgZmEVNFdymwEF4=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4j7TnJ4Sr4z1prlN;
	Mon, 19 Oct 2026 16:52:04 +0800 (CST)
Received: from kwepemk300013.china.huawei.com (unknown [7.202.194.231])
	by mail.maildlp.com (Postfix) with ESMTPS id 47EFD40575;
	Mon, 19 Oct 2026 16:52:07 +0800 (CST)
Received: from [10.67.121.183] (10.67.121.183) by
 kwepemk300013.china.huawei.com (7.202.194.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 19 Oct 2026 16:52:05 +0800
Message-ID: <9eb6e0fe-5d8a-499c-b19b-ce73fe982451@huawei.com>
Date: Mon, 19 Oct 2026 16:52:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/12] arm64: Add support for TLBI domains
To: =?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>,
	<kvmarm@lists.linux.dev>, <linux-efi@vger.kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Linu
 Cherian <linu.cherian@arm.com>, Anshuman Khandual
	<anshuman.khandual@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Fuad Tabba
	<fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden
	<seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
	<yuzenghui@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas
	<ilias.apalodimas@linaro.org>
References: <20261001110655.461473-1-kristina.martsenko@arm.com>
From: Jinqian Yang <yangjinqian1@huawei.com>
In-Reply-To: <20261001110655.461473-1-kristina.martsenko@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.183]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk300013.china.huawei.com (7.202.194.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_015220_822081_62B4FAA6 
X-CRM114-Status: GOOD (  16.22  )
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

Hi,

On 2026/10/1 19:06, Kristina Martšenko wrote:
> Hi,
> 
> This series allows the kernel to use TLBI domains. TLBI domains (FEAT_TLBID) is
> an Arm architecture feature that enables a TLB invalidation to target a subset
> of CPUs instead of the whole system. It can improve performance on systems with
> many CPUs. TLBID is not yet part of the Arm Architecture Reference Manual but
> some of it is described in the latest XML [1].
> 
> The goal of this series is to send TLBI commands only to the CPUs where a
> process has run (i.e. where its page tables have been installed). The last
> patch explains a bit about how it works. This is an RFC since I'm not familiar
> with the kernel's TLB/mm code and I'd like feedback on whether the general
> approach is correct.
> 

Thanks for posting this series.

I'm working on the KVM side of TLBID, and have a series that
virtualizes TLBI domains for guests. It includes:

  - per-vCPU vDomain configuration via a new capability and
    two ioctls
  - VTLBID_EL2 programming at vCPU load/put, mapping vDomains
    to physical domains
  - a guest visible TLBIDIDR_EL1 with virtual domain counts,
    and conditional exposure of ID_AA64MMFR4_EL1.TLBID

You mentioned you planned to look at KVM support in your next
version. Would it be OK for us to post this as an RFC on top
of your series? :)

Thanks,
Jinqian



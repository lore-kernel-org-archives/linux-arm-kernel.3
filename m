Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B007AC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 23:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhR7VQd3Lnap7YrCgJV7cJg4hHHTnDU4T9DOUg42A20=; b=oknpM/dcnpZeefPGIhFX18MSEu
	NfLLfQgOqNKzKNWj3p+3zVsUS/QqMeFjFdy1AdZLIxRJQf369wgxOyi7tJ1+KWkcwG3dWmXZt0j6g
	ku59IlyWtpJiWwZpmPA3wdIm6m1z53DuEAR8WDC2E3DAKI3QmE5jCLges38k9Eo7ugtGlXuGHvAI/
	kkEoIQ2T+TKrNk10ozX//N9h/4pjw8XLacWCHV2YwtHxeYAl89hXy6c5GmHzyBVqb0JFTSi3dLANR
	uQsSHZlkuXINPjKSsC1s7rwSl9TjD4qq63VHf3QcUPqZniwclHY3jz9kSQ/6AHZD3aw4p/wSbwYJp
	M6/qJ1sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws7FT-00000006plv-13vQ;
	Thu, 06 Aug 2026 23:11:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws7FR-00000006plR-2Hx5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Aug 2026 23:11:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HhR7VQd3Lnap7YrCgJV7cJg4hHHTnDU4T9DOUg42A20=; b=A6OshfbMZIDxPOMys8JezjfUgj
	7GsoCnQapa3hDn/eRTmmTbGAgcASderRxPwrI7RAQL3Z5xxxTafHs29D7vqcrvJNOSjSbxKmMf//x
	HK37Ma+dqdtuSgbA7jS/Ft5rg5csQKJKWIk8U02ffdpxEHBV15Ri5Ntjb68mS/PaxMJDJwdIdQsu4
	zDeCUCu/c4OEx8pK+GwQCkJ42ctlpLx1caHTdXiuSf/s6DPX1Niw4azGBHhoU+OT3rA+bcxl4k6pJ
	HqvBgr0/UMLu4YS40XKn5rlKbcOk5wOezIliSMFs4nrD6Pw1ydZ82LC5FvGwiazgjNyN433BwdpCW
	qmIYMnJg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1ws6DZ-0000000BuI0-3BZN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 22:05:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECAAE153B;
	Thu,  6 Aug 2026 15:05:28 -0700 (PDT)
Received: from [10.57.40.157] (unknown [10.57.40.157])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69FC33F86F;
	Thu,  6 Aug 2026 15:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786053932; bh=v/L2HSf1KNTXA1th8L9+b1jkT+PbXLtTdKC9CLCe6aE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ggV3jSsHif6GUt7ygEDwaca9HUMK4dxVMocg6ZDOcSTYTGW7gyBLCn/NxistwWIYY
	 ZhqNSDSTYi7IlWKSmhbKa/WvSzz0YuA93NktJ+rTZauHLz5QABYmi3axkC9VIrLpOC
	 BdR5yVpTOPRmtrPkEza5Ap0eiOFafFv3jBGAadQQ=
Message-ID: <42170467-fe36-4382-867f-49bdc6a7bc9a@arm.com>
Date: Thu, 6 Aug 2026 23:05:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 00/45] arm64: Support for Arm CCA in KVM
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
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260803134403.80630-1-steven.price@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260803134403.80630-1-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_230538_129731_392732A8 
X-CRM114-Status: GOOD (  11.29  )
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

On 03/08/2026 14:43, Steven Price wrote:
> This series adds support for running protected VMs using KVM under the
> Arm Confidential Compute Architecture (CCA), including the firmware
> support needed to communicate with the Realm Management Monitor (RMM).
> 


...

> This series is based on the guest_memfd in-place conversion v9 tree[1],
> which is itself based on kvm-x86/next. It is also available as a git
> repository:
> 
> https://gitlab.arm.com/linux-arm/linux-cca cca-host/v16


> 
> Work in progress changes for kvmtool are available from the git
> repository below:

Here is a cleaned up version, rebased on to Will's kvmtool master
branch:

https://gitlab.arm.com/linux-arm/kvmtool-cca cca/kvm-v16

(This works with the v15 of the KVM series too)
Build on top of Fuad's Guest memfd support patches.

Cheers
Suzuki


> 
> https://gitlab.arm.com/linux-arm/kvmtool-cca cca/v13




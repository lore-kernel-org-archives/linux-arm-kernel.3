Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC72CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 13:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/358z+L8xwq5gaDWLEGO2eUqDsDG4ejHxxtTfmFfFSs=; b=s7anoU4hhEvY7uRELK6nV7BsQQ
	I0ciwCZrNwGIUQanEpHO7Sv1hDGiFQFF8ToUBt13hTJoHm/ZNzVSb5ZRhdsnvFQJAvoe/C6MT/U85
	2PT90TrdUY8qiraTcQjTzEaHXgwYItiCJ/mCugjC/fAS+gElN0Fp3qq+0YGcA0eH1JcFne4WAqLdO
	sAHq65S4xb+R5VnBswHxZTcDS7SYKar/oeHHpS1eJz1t4U3qmOPcM5xiSvgr+mX0k2GCGkfXcivdx
	iVhg7dMoal9foQuAwADvcjGUlcPEnR15cxk8a4ooyo9BLD4RVuGLJlv9RDQmUsfqQgJVwUDBsn2DT
	IgddvqrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCd2C-0000000BdoH-3dg8;
	Fri, 02 Oct 2026 13:10:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCd27-0000000Bdnq-3gRn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 13:10:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52DC2497;
	Fri,  2 Oct 2026 06:10:32 -0700 (PDT)
Received: from [10.57.8.170] (unknown [10.57.8.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A46133F85F;
	Fri,  2 Oct 2026 06:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790946635; bh=O9qAXfSNd9NNc6BfSIg0k7Umhi4nsbNeqt5uiHuVnJo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TvUKc/n0sjb4WDRQ07F+4BkYbOxgyiB2mxnuB8rQI06A3qAbwMiFuyCHfXf+hGr8M
	 n6H+4gjuzlBeOlfDwc06mQ7avohuIYjKggc9aVN3ReSU9UWVISWu/JuGK+DUZEar3R
	 00IYnRRT9wyCBGFAXQ9z+t6CLv8X0M2rcvfOqBYI=
Message-ID: <bda01f30-acd1-4b79-9e15-75e839c198b9@arm.com>
Date: Fri, 2 Oct 2026 14:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 05/23] KVM: arm64: Track the type of VM in kvm_arch
Content-Language: en-GB
To: Fuad Tabba <tabba@google.com>, Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, will@kernel.org,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com,
 jonathan.cameron@oss.qualcomm.com
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
 <20261001210703.1597150-6-suzuki.poulose@arm.com>
 <CA+EHjTxtatPyGcyvEyR129cqUiAYcO_cxRVtwZO0ckZsOnD7TA@mail.gmail.com>
 <86se2o2rbs.wl-maz@kernel.org>
 <CA+EHjTwHuJ0u_TTP46zNFKFmBP124XHHLUVhkAUSyfhe92=41w@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTwHuJ0u_TTP46zNFKFmBP124XHHLUVhkAUSyfhe92=41w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_061039_961764_5D53E2D5 
X-CRM114-Status: UNSURE (   8.08  )
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

On 02/10/2026 14:05, Fuad Tabba wrote:
> Hi Marc,
> 
> On Fri, 02 Oct 2026 13:57:11 +0100, Marc Zyngier <maz@kernel.org> wrote:
> [...]
>> Just to make sure. Is that what you had in mind?
> 
> A diff is worth a thousand words :) Yes, that's it. With that, every
> remaining hyp user of vcpu_is_protected() only runs with pKVM, so the
> kern_hyp_va() case in the macro can go too.

Ack ! That does make things simpler. Marc beat me to it.

Cheers
Suzuki

> 
> Cheers,
> /fuad



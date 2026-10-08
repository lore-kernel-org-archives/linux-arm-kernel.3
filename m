Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C20CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAFP0AVDCh2B4KtGCFjvZQtIzH5gDF6Ae8plAGWRgyM=; b=EsaQrivMULcP5mDjsuycx6n0qT
	WjXriQ0MmL7VdIgIX0G/QNygGf71oswyPYkE4uwRdQl3yIXJ++Qi292FXd2Oe3cJrcF5XLj3Atx9b
	VLN2Q7866xSvLdoaF56QRUCMotAXXLHEi7j5R+VFuGlBslC6B7P81qn7Wg/klYbUhzP/E7mL4HXtS
	xPLZnmfAqHUQCnBXS8LTci2quh9dtTDsjOZhhGKGIKCYiVdzcKaOcJKiQECzTZ5sbnPfXpVWSG0Df
	Dro8Bvu9sgURPnvNGaG48CPKQj7K/qM4MOsbWxxV0UJXGgHzT8sGLSmCq/8wehCFQgvy9hFFz26d9
	UgAIFzpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjrC-00000003vNK-2c9m;
	Thu, 08 Oct 2026 08:52:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjr9-00000003vMj-2X9z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 08:52:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1C051476;
	Thu,  8 Oct 2026 01:51:57 -0700 (PDT)
Received: from [10.57.10.184] (unknown [10.57.10.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD5033F763;
	Thu,  8 Oct 2026 01:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791449520; bh=X072fEuKl2pqebo1yIskiav4B6oQoevvlg9BJsl+1zA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FcFOF6yov50M43gMq00NFQk0QAaBq1r/HTi+aauN8hylw6FtKWQFC3JnYMgpOMxpV
	 p6yq7LD+lUNl//kIVCosM1EI9h1mB7tbiRmwoXAfDuO98j7UfJsSVtejyWHh++dv2v
	 3k6zBLtJOklseD1jlrbck3RHGUGr4ONIezBDHmmM=
Message-ID: <4cdd882b-832f-4968-9838-dcc29a899121@arm.com>
Date: Thu, 8 Oct 2026 09:51:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 13/14] KVM: arm64: Mandate VGIC v3 for pKVM VMs and
 Realms
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com,
 jonathan.cameron@oss.qualcomm.com
References: <20261007073537.2454351-1-suzuki.poulose@arm.com>
 <20261007073537.2454351-14-suzuki.poulose@arm.com>
 <CA+EHjTy_1EekD472UH=CDSpC7oksdy3eS8AP0rPxKkhQ_PyXdg@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTy_1EekD472UH=CDSpC7oksdy3eS8AP0rPxKkhQ_PyXdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_015203_790812_15A2FE5C 
X-CRM114-Status: GOOD (  13.38  )
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

On 07/10/2026 14:45, Fuad Tabba wrote:
> Hi Suzuki,
> 
> On Wed, 07 Oct 2026 08:35:36 +0100, Suzuki K Poulose
> <suzuki.poulose@arm.com> wrote:
>> pKVM does not trust the host. Realm VMs follow a similar trust model, with
>> the Realm Management Monitor owning the protected state instead of the
>> host. Add a helper to identify VMs that run under a host-distrusting
>> hypervisor.
> 
> When I reviewed this in v21, the Realm patches that use this came
> later in the same series. Without them, kvm_vm_hyp_is_distrusting() is
> true exactly when is_protected_kvm_enabled() is, and protected mode
> already doesn't register a GICv2, so this patch doesn't change
> anything on its own. Should it move to the series that adds Realms?

But the second part of the changes are required for pKVM today, right ?
and you requested that here. The check as such is useful, except that
it is using kvm_vm_hyp_is_distrusting() rather than 
is_protected_kvm_enabled(). I don't see this as a problem as this is
not a hotpath anyway.

https://lore.kernel.org/all/CA+EHjTzKjjEuAuoOuzGG0uKyVZE-r+CEreca2H2kEQYuRPpgUw@mail.gmail.com

Cheers
Suzuki>
> Cheers,
> /fuad



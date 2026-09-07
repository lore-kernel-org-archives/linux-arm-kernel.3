Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62A4C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aR9njFV4nCkyIdjkwm6IFgWfoSyokDjNybCY0oMu6b4=; b=aFx0Y3l3ybA2FOeiHdTlCe5GUB
	emUiELIpxDtsfXS+3syRI7YQ3AR27YVVzcPg2sOA03X7rcnzpgLGI721IcpMmYornxMe46w4x/1Jh
	SaWhGOlzyEprukY+7/MZpwK9LvvNKIiR4I8qPYSO1FjUGZkUOol2O3nO3YRnqlcTn65AqzEvWIvS4
	5XNi6RWZD0sH3G9736FMlNzW0OAf/+VM9Vq8GnwYAeA3F6N5SLSVCdQcuFkmdTd7SvzSGJkTjLIS2
	0tD+kNzD9XY/EZbKbGSO+b5GHOzBeBtTKbLEihlMjL1CRFQoH+sg1v6iVEAzmSg6AERw3j5rtFkqD
	HN907EUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Xzc-00000006j9e-1oKc;
	Mon, 07 Sep 2026 11:58:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XzY-00000006j8e-48de
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 11:58:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C60F61476;
	Mon,  7 Sep 2026 04:58:23 -0700 (PDT)
Received: from [10.57.49.168] (unknown [10.57.49.168])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19F283F7D8;
	Mon,  7 Sep 2026 04:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788782307; bh=gHwRph0Z5WbvmGMENEbvpJ0xv8gch4+5KPFj4oIECLs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s0dj+247ZGrYRAJTtXRI8Mg3u9DU79+m+Ys2NgoXAglWLE1feLSkomIwC2zA5A5ge
	 GJPItChzLznQD61LkUo/IXNotgwIpZb3y09ZXWvl3IEnl/PvOECdXuLkcRCKyRf9pa
	 Knr4lxm9X2/ZziKIjE+LsKu7ai1sEcwkMLIHh/1I=
Message-ID: <30b4137b-1445-49c0-bd1c-98dbac5d70f6@arm.com>
Date: Mon, 7 Sep 2026 12:58:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 22/45] KVM: arm64: CCA: Handle RMI_EXIT_RIPAS_CHANGE
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
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
 <20260803134403.80630-23-steven.price@arm.com>
 <ap49Orng5-oehc6J@FCCLS0092175.localdomain> <86fqzl4biu.wl-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <86fqzl4biu.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_045829_067191_045B1A8F 
X-CRM114-Status: GOOD (  12.67  )
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

On 07/09/2026 11:10, Marc Zyngier wrote:
> On Mon, 07 Sep 2026 06:05:29 +0100,
> Kohei Enju <enju.kohei@fujitsu.com> wrote:
> 
> [...]
> 
>> Although the root cause is an RMM bug, should we also guard RIPAS_SET
>> against this no-progress case?
> 
> No. We really should *prevent* the kernel from using a known broken
> RMM. Which brings me to one of my long standing request: how to we
> enforce the minimum version of RMM that KVM is willing to work with?

(1) Do you mean the RMM ABI version ?
(2) Or the particular build version of a given RMM firmware 
implementation ?

As far as (1) is considered, the kernel already sticks to a single
version, v2.0 and doesn't support anything else. And we are fine with
KVM/Linux supporting a single version of RMM and deprecating the
support for older RMM versions as we decide to move on.

As for (2), the RMM ABI doesn't provide any information about the
build/fix version for a given implementation. I will raise this
within Arm.

Suzuki


> 
> We absolutely need to have a hard deprecation mechanism in place
> before day-1.
> 
> 	M.
> 



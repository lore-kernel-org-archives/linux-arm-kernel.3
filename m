Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83EFD11186
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bo1ZNjo3vuHWjn9Dv+71ghKuEaUJKwCPt3V/IGcYfYs=; b=wA13X7T5/qgqNB4mEcbjzRr2g7
	Pegrg4PV0hQTG/QkZoOu/RV6gWa/3BArG5Y/3gbN3ZCIUNMOJuokVSKZhbfLHodHF9esSfqfJoqgn
	tnej/4yN2cHDsmcC1mLjw0HAek0GGj/47VUBoP1IHo1+MzHsrDCvHI0WoiCl/bt+rZSncWKX5bDA8
	N1Of77QpXBzBvdKApVLuVFSNNoUKkxB9pURsbJQe9OgeY+sKrB8+8xWBbWJ4ly5azK82En8zK3XkO
	c19cFMXKobDDWW7krOIkiecUn2x01LAD/B+e4tV5mlkVE5yfKyh682Od6a3tThJDIwNfzpEnhs3hO
	SejII2Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIqh-0000000FL6G-42Uh;
	Wed, 26 Nov 2025 16:58:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIqf-0000000FL5I-1uIx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:58:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 561D8168F;
	Wed, 26 Nov 2025 08:58:22 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA2CA3F66E;
	Wed, 26 Nov 2025 08:58:28 -0800 (PST)
Message-ID: <c5e85f4d-2646-4459-8034-bc9765c8e5da@arm.com>
Date: Wed, 26 Nov 2025 16:58:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] KVM: arm64: Add a generic synchronous exception
 injection primitive
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>
References: <20251126155951.1146317-1-maz@kernel.org>
 <20251126155951.1146317-4-maz@kernel.org>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251126155951.1146317-4-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_085833_548251_6E00675C 
X-CRM114-Status: UNSURE (   9.04  )
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

Hi Marc,

On 11/26/25 15:59, Marc Zyngier wrote:
> Maybe in a surprising way, we don't currently have a generic way
> to inject a synchronous exception at the EL the vcpu is currently
> running at.
> 
> Extract such primitive from the UNDEF injection code.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_emulate.h |  1 +
>  arch/arm64/kvm/inject_fault.c        | 10 +++++++---
>  2 files changed, 8 insertions(+), 3 deletions(-)

LGTM.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben





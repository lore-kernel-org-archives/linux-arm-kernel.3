Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FC5C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 17:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRFGbXIyc3aUkiBjEv2YexG7+I5YM6zSoAWHpKmicEM=; b=roaf9qLvWAIe1a4zKf1iGYdmbw
	FipuBdK9LGyftL0WCccf4GbF/ZQphFlCmst5y7dGpfwCNKVS5+LGqXjmrkIic4Mqv8jU71xkeo5Ea
	Ji6CLWV7CtO2HA33oq/q6hS9txgJ5+2IHb8kqTRbB/+8i5q+PwnNaoZQ3jz8p1ylSvYo6Nv8Ujjng
	WpITm5Vn9ORce/fzaEL2PxZHGVivXSAcajk8X4u0YOp0GHcD0dA2JCWjeVoYPvXUqF1VsBGTNeZMQ
	u5txWzzBgz8cKQhYwXk4X4Pwp3l82ZHv4PTK2MdV+EEAxtJY78iGEd4NXYS2MhyKmqkRUBJ1k5NDv
	2Uc0g/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUe4-00000009Cj0-2hlA;
	Wed, 26 Mar 2025 17:34:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUc7-00000009CNV-1RY3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 17:32:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7BC11424;
	Wed, 26 Mar 2025 10:32:29 -0700 (PDT)
Received: from [10.57.66.235] (unknown [10.57.66.235])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93E8E3F58B;
	Wed, 26 Mar 2025 10:32:22 -0700 (PDT)
Message-ID: <8df29f21-fe0d-4784-84cc-4e20ce19c4bd@arm.com>
Date: Wed, 26 Mar 2025 17:32:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: mops: Do not dereference src reg for a set
 operation
To: Keir Fraser <keirf@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 stable@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250326110448.3792396-1-keirf@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>
In-Reply-To: <20250326110448.3792396-1-keirf@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_103227_426679_602842B8 
X-CRM114-Status: GOOD (  10.05  )
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

On 26/03/2025 11:04, Keir Fraser wrote:
> The source register is not used for SET* and reading it can result in
> a UBSAN out-of-bounds array access error, specifically when the MOPS
> exception is taken from a SET* sequence with XZR (reg 31) as the
> source. Architecturally this is the only case where a src/dst/size
> field in the ESR can be reported as 31.
> 
> Prior to 2de451a329cf662b the code in do_el0_mops() was benign as the
> use of pt_regs_read_reg() prevented the out-of-bounds access.
> 
> Fixes: 2de451a329cf662b ("KVM: arm64: Add handler for MOPS exceptions")
> Cc: Kristina Martsenko <kristina.martsenko@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: stable@vger.kernel.org
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Keir Fraser <keirf@google.com>

FWIW,

Reviewed-by: Kristina Martšenko <kristina.martsenko@arm.com>

Thanks,
Kristina



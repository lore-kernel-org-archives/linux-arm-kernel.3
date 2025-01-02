Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13368E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 19:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUdOeCCuXTYBJa2Y14aYbmR7lqycVvovev0PA0FkkeM=; b=ZujAA018MsCoT5jNrRxf4otNAR
	NN0DeQfDbm291YcwQLlHVUagdbu1d1mOVZ6hDQaxCsWMYlZfY9dSBoSSXOFwt0gIoRsHOz9e5B3b1
	QIb570m1UJ7Sk/Z7faGvAbVk2JmPIJ/+HUaNoYHEsLEzgnTjliYUKFEYwxU9Vxo+1/Y34TlUKQPBL
	htNM6sTFnB0kBfswpYpeyLTtVNxu4HdfuncEQ3bzd9LaU21tTful8ij6tc603Aysa2/L7zBd/2+S5
	NRTe3sgYn8m/RIVzwKgv3geSo/OzYYJvhC4n93jghwRdJpZ9H9PG6mO9UQHMeakSQdy/7duHyC9m7
	1E5/7eiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQgM-0000000BFkj-1gKy;
	Thu, 02 Jan 2025 19:16:34 +0000
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQfB-0000000BFbq-2w9R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 19:15:23 +0000
Date: Thu, 2 Jan 2025 11:15:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1735845314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MUdOeCCuXTYBJa2Y14aYbmR7lqycVvovev0PA0FkkeM=;
	b=PRLFCIVZNJ2TOKznSd93zqgxpqnVt9wA3U7ums0392W1LkplKZ4eJ2vjkNvPK2mrhcQ0Zo
	dsqhqrcpHM36uCRoKEZmwO7hwRb4MGvbdBqU9E/Ho6HvqOL/Eh+3T2FBrvVS9YK6Xaq3Cp
	8BvA1LJ6AZiCVmuvDB2/g5/8Y/9r7Io=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Chase Conklin <chase.conklin@arm.com>,
	Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH v2 00/12] KVM: arm64: Add NV timer support
Message-ID: <Z3blvPxzCxVeCA40@linux.dev>
References: <20241217142321.763801-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217142321.763801-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_111522_017519_7304FA2B 
X-CRM114-Status: GOOD (  11.87  )
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

On Tue, Dec 17, 2024 at 02:23:08PM +0000, Marc Zyngier wrote:
> Here's another version of the series initially posted at [1], which
> implements support for timers in NV context.
> 
> From v1:
> 
> - Repainted EL0->EL1 when rambling about the timers
> 
> - Simplified access to EL1 counters from HYP context
> 
> - Update the status register when handled as an early trap
> 
> - Added some documentation about the default PPI numbers
> 
> The whole thing has been tested with 6.13-rc3 as part of the my NV
> integration branch [2], and is functional enough to run an L3 guest
> with kvmtool as the VMM and EDK2 as the firmware. YMMV.
> 
> [1] https://lore.kernel.org/r/20241202172134.384923-1-maz@kernel.org
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/nv-next

Time to let it rip!

Acked-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver


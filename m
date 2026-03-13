Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAB5106FD9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1D+eNjb1aH+Mf9wRQwgiLe9AWCZFvULZc3D+Z58y1C0=; b=v0RJlnQU9zwGFhssvt5f3jYHg4
	DsMD03SvS2sNHo8k4FISfcug3zLak3eT+m9J0UGGQ6ZnMi8N9nK85aTFOQSsBkYOzBXr3N0n7+BTN
	glW4vZsef9HFy0NKmS3nUZQdlJxruvKtu3f3KYNP/nWyetkU1ohV9ldnAUK9HQaz2t64aZL3nXwLs
	cWnCUwmzZHXhxOyvOmC6kPXwZzYbU0xG8k/6gxcnFYZE4o/sPBhcg/S43ASxVKfp/XtVU4Ue5BfsP
	tmGREcJko0eT49IgzI/5rX5lkMNM3se1tz+FScbF1pzCGW6/oOZv/E5kZBjfm3yPFO4fpfhlUIUrM
	lxzpy3dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xLZ-0000000H828-3kvF;
	Fri, 13 Mar 2026 07:54:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xLX-0000000H80P-0CPY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:54:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A27B71596;
	Fri, 13 Mar 2026 00:54:03 -0700 (PDT)
Received: from [10.164.18.48] (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C2793F73B;
	Fri, 13 Mar 2026 00:54:07 -0700 (PDT)
Message-ID: <edcb9acf-359f-45db-9574-10337c0928fd@arm.com>
Date: Fri, 13 Mar 2026 13:24:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Clear VTCR_EL2 in __init_el2_stage2()
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Oliver Upton <oupton@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-kernel@vger.kernel.org
References: <20260313053857.1277828-1-anshuman.khandual@arm.com>
 <87sea4chrw.wl-maz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <87sea4chrw.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_005411_601508_9F8CD57B 
X-CRM114-Status: GOOD (  10.96  )
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

On 13/03/26 12:55 PM, Marc Zyngier wrote:
> On Fri, 13 Mar 2026 05:38:57 +0000,
> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
>>
>> Clear VTCR_EL2 along with VTTBR_EL2 register in __init_el2_stage2(), which
>> ensures that MMU stage-2 translation remain disabled. Although clearing out
>> VTTBR_EL2 probably should have been sufficient but adding VTCR_EL2 improves
>> overall safety.
> 
> This serves no purpose whatsoever. Even the write to VTTBR_EL2 is
> pointless, and writing 0 is no better than writing *any* other value.
> > The only thing that matters at this stage is HCR_EL2.VM, which
> actually controls stage-2 translation (contrary to your above
> assertion). This of course is not captured by this macro.
> 
> So what are you *really* trying to achieve?

To keep VTTBR_EL2 and VTCR_EL2 cleared (and prepared) if and when
HCR_EL2_VM gets enabled. But it can be argued that these registers
need not have to be cleared now and can just be initialised before
setting up HCR_EL2_VM itself. In which case should we drop
__init_el2_stage2() entirely ?


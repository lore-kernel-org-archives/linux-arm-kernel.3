Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F6D106FD9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 08:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75x0cOz5LC+QtxgcfoWIAQ1VrXTQ7VL+Uhu2mHLweEQ=; b=HwTUE4wtPL5JYi+UeasUWfJVNQ
	fZGPiqdqfWt97QZuwBEWiN6wI65A8mGCIjCMRaGdW1e3st5N22Fq/VnmpcCF77/YcffCd/PaYr5Lh
	iXotTUUwTuiWGi0tzhBgTcGUGWtw4TKdseTsWMC4zZS6rMM+dOqY2d5fAsPgkVfi+3F9/TRt50B1q
	oaCDW/f8cnVO8SR4I/rkObgijb6T/NJjZGFOTZ8VNnyBlosRHbZHy0Wv3vsFegu6KClgvCVxf3mbl
	Bm2EUd7rDhmEvxovcHEFMqYdw9bjcTNcM5mD7L+4JbGnIe3UNFxNsra/vFSnAfB/LguZFo5L4hGua
	pS/MUT0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0y3n-0000000HI4U-2SYR;
	Fri, 13 Mar 2026 08:39:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0y3l-0000000HI3r-16hB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 08:39:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D24F1165C;
	Fri, 13 Mar 2026 01:39:45 -0700 (PDT)
Received: from [10.164.18.48] (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D363D3F7BD;
	Fri, 13 Mar 2026 01:39:49 -0700 (PDT)
Message-ID: <949f02cf-9f26-40ba-9c68-1742e335e2b9@arm.com>
Date: Fri, 13 Mar 2026 14:09:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Clear VTCR_EL2 in __init_el2_stage2()
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Oliver Upton <oupton@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-kernel@vger.kernel.org
References: <20260313053857.1277828-1-anshuman.khandual@arm.com>
 <87sea4chrw.wl-maz@kernel.org> <edcb9acf-359f-45db-9574-10337c0928fd@arm.com>
 <87o6kscfon.wl-maz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <87o6kscfon.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_013953_348897_821FDB33 
X-CRM114-Status: UNSURE (   8.80  )
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



On 13/03/26 1:41 PM, Marc Zyngier wrote:
> On Fri, 13 Mar 2026 07:54:04 +0000,
> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
>>
>> But it can be argued that these registers
>> need not have to be cleared now and can just be initialised before
>> setting up HCR_EL2_VM itself. In which case should we drop
>> __init_el2_stage2() entirely ?
> 
> And something worth thinking of: the role of VTTBR_EL2.VMID when
> HCR_EL2.VM is 0.

Are you suggesting that VTTBR_EL2_VMID needs to be 0 even when
HCR_EL2_VM = 0 because of its corresponding TLB entries ? But
during system boot such possibilities might not really exist ?


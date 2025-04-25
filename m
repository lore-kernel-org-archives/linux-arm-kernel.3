Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B3BC369D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBHUqqpnc/Cg5Q6EfkJ9COcRXyKzspF9b5WjwgUzk3s=; b=Pd46pYtsZVSJXkmPpMNVB2KDj9
	qSMeejST0qrMSCDY3VoiXa/aLFA89q1BfDW+qopKZ00+2f3hX2BGLF+QSHkMW2epsyrZwdHOBk2an
	gtbPzBPcN71sxPH4zWm9yCaN4DHitsjcWlBc3dSA2Sea8eX7Kow11PbGqfEUcw3T2LaQ9TKIWFQD1
	+rV91ZF0idP2erCUmxNIKYgnIkFT/t3N2MpxjnA3cxgshto8zFr38HS/ZGraoi6Hcnz5GCYomZ18d
	eYb8efTSHW1eeoMk/A0Uqg1HU2hjIJbZYAaskU6R8Kv1uCJTaC8asfWl+djqfg+jDFbch+9YK8JDu
	6Pk09CeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MW9-00000000KnA-2mAW;
	Fri, 25 Apr 2025 17:07:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8LNT-000000007Y1-2owq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 15:54:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D937106F;
	Fri, 25 Apr 2025 08:54:05 -0700 (PDT)
Received: from [10.57.45.221] (unknown [10.57.45.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5CED3F66E;
	Fri, 25 Apr 2025 08:54:09 -0700 (PDT)
Message-ID: <5b64eeb2-1f01-48b8-8edf-d883d59f3868@arm.com>
Date: Fri, 25 Apr 2025 16:54:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] arm64: debug: split hardware breakpoint exeception
 entry
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>
References: <20250425153647.438508-1-ada.coupriediaz@arm.com>
 <20250425153647.438508-7-ada.coupriediaz@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250425153647.438508-7-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_085411_756489_CE3B41FE 
X-CRM114-Status: UNSURE (   6.84  )
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

On 25/04/2025 16:36, Ada Couprie Diaz wrote:

> [...]
>
> Duplicate the debug_exception_ entry and exit functions from mm/fault.c,
> as they are needed in the split paths for exceptions other than BKPT32.
> The original will be removed in a cleanup patch.

This is a mistake as those functions are now added to 
`kernel/entry-common.c` in Patch 05, sorry.
This paragraph should not be present.

Thanks,
Ada



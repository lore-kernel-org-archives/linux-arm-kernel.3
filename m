Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10EFC021B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 17:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Er3mDhDWTtjL0j30Se076KygpaL4YhbroEkuzI2h6GE=; b=X32bgSK+Jd+XpXmBVxMHDMfI90
	La5QweMWYuPrJCrw7hyFTCRDqSPA2XU2TZ+Jqf6tYNH6maa1zijsgrCAc/38J4uXOvHOe7QG6AVh/
	CdTKCRjk9F7XmRSkBMTsc5ABVp1liL9YoccNS9QzWjSQ5N76kosJPLgo569crlJyKnmS+JaImoP8J
	8HdJZOej1/67DDg+IUJDMA13kVWlKNw05UKDarHltOOd8C0EuxRIcilqqJox5VpXpXS7CM5OwAToV
	MFWdTyPwCx1bt4UOEoW4WL/zrn7Qoy3LytKHDkByPF5pBm/0KFkIWWF/1t16jvOM6iNB9B3RuiJPi
	tkvs8dpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWz1-00000006OlO-3vnO;
	Fri, 21 Feb 2025 17:38:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWxY-00000006Obh-2WW0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 17:37:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E1151063;
	Fri, 21 Feb 2025 09:37:25 -0800 (PST)
Received: from [10.163.38.241] (unknown [10.163.38.241])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E66F13F5A1;
	Fri, 21 Feb 2025 09:37:04 -0800 (PST)
Message-ID: <0c251bd0-88b7-4df0-bc53-333d16008ab8@arm.com>
Date: Fri, 21 Feb 2025 23:07:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64/mm/hotplug: Drop redundant [pgd|p4d]_present()
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
References: <20250221094449.1188427-1-anshuman.khandual@arm.com>
 <20250221094449.1188427-2-anshuman.khandual@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250221094449.1188427-2-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_093708_688741_5D659C90 
X-CRM114-Status: UNSURE (   4.85  )
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



On 21/02/25 3:14 pm, Anshuman Khandual wrote:
> [pgd|p4d]_present() are inverse to their corresponding [pgd|p4d]_none(). So
> [pgd|p4d]_present() test right after corresponding [pgd|p4d]_none() inverse
> test does not make sense. Hence just drop these redundant checks.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

LGTM

Reviewed-by: Dev Jain <dev.jain@arm.com>



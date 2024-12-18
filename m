Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035C1E77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 07:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvcpnLs6H66VEoenILOmAXM44EvL6xWcnfDN9qjLbPQ=; b=YBSIDBT7qnR0Klat3Lprk9NZ6N
	XNRng5PCZZ52T2T8XhQh6b7+fPncvZM/cvzl2TqUSZZ//NuNiF1Z0OPDczc7MaOSsIixJrIPVFY/k
	STabNRJFktfveYvipSedvWGdIWFbsVayZLGrE4JDDo0CF41MPV3WoP4ykg82YwPaK7ZjswXuoV3yB
	yWcz0G1fsHsZ4GIpSICnUbkWvaG1DpSNhG2KCAtaZlCOq5eQLU5bP0/Z3zvZrYnleDxClKdz25uEa
	btFlEfwxRxtMTxJqHHDR5HayjHEnBfQAgsIvXgbPXZm4Wheu/8koiHxDYStgKz46im/xKyM+zbmHj
	v5D/E10Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNopR-0000000Fr7a-0RJO;
	Wed, 18 Dec 2024 07:50:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNooL-0000000Fr0Y-0dfD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 07:49:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C539FEC;
	Tue, 17 Dec 2024 23:50:04 -0800 (PST)
Received: from [10.163.50.13] (unknown [10.163.50.13])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C86E33F720;
	Tue, 17 Dec 2024 23:49:33 -0800 (PST)
Message-ID: <809ddd0a-3fad-4e3a-a106-070d2235b3dc@arm.com>
Date: Wed, 18 Dec 2024 13:19:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] docs: arm64: Document MDCR_EL3 boot requirements
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241211065425.1106683-1-anshuman.khandual@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20241211065425.1106683-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_234937_237570_EAF9297D 
X-CRM114-Status: UNSURE (   9.80  )
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

On 12/11/24 12:24, Anshuman Khandual wrote:
> This series adds missing MDCR_EL3 boot requirements for debug and pmu
> registers that are currently being accessed in the kernel. Please refer
> the following link for some earlier discussions on this.
> 
> https://lore.kernel.org/all/ZxfOeqyb3RvsdYbU@J2N7QTR9R3/
> 
> This series applies on v6.13-rc1
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> Anshuman Khandual (2):
>   docs: arm64: Document EL3 requirements for cpu debug architecture
>   docs: arm64: Document EL3 requirements for FEAT_PMUv3
> 
>  Documentation/arch/arm64/booting.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Gentle ping, any updates on this.


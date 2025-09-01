Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00FBCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 08:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhB8WeDv969rq0BPBCTCg6VsNaonzWIUuJ0Js3niOjk=; b=sQj27TmZ2AArPJrzHoRRzYEwJU
	/O6yOxLA0q6QJj6advX8+EZp28i/xdq8OlYnh4zjSIzjzaRUDfY+cw20S4FSQV77LFKZRcAoZsBVP
	ZL1N7nbpR0bzzbpb2D9MR773vSbp6Qq+ThOx02UudF8oMzBcUrSqjNrGen6iGJXaiZFx3TNyywOvq
	3ODTlGBYox4WtQwuWtjcSkSsVhtAYWrvsKENCSukDWVRg7ot9tqPmELJ7SjfLZwPVpNB5XYaViK9g
	9b+R4Iq+WuQ9pqS840mO/RSWgyjU+D88abnZCsRvu7jD563bTN1Aqv4u3KQr/oyT1P6QobC6c+M0I
	ZE7KbVqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszur-0000000BZx2-0zGE;
	Mon, 01 Sep 2025 08:29:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usz2r-0000000BRva-3tYu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 07:33:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32F3B1A25;
	Mon,  1 Sep 2025 00:33:31 -0700 (PDT)
Received: from [10.57.57.17] (unknown [10.57.57.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 856B43F63F;
	Mon,  1 Sep 2025 00:33:34 -0700 (PDT)
Message-ID: <ca30a6f6-f636-4d6f-9ec6-d6e02ef70852@arm.com>
Date: Mon, 1 Sep 2025 09:33:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc
 function signature
To: Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yue Haibing <yuehaibing@huawei.com>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Ryan Roberts <ryan.roberts@arm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Joey Gouly <joey.gouly@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
 James Morse <james.morse@arm.com>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Zhenhua Huang <quic_zhenhuah@quicinc.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20250829154913.work.943-kees@kernel.org>
 <aLHP-TG3a1Im3kpa@J2N7QTR9R3>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <aLHP-TG3a1Im3kpa@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_003342_009482_C7433C4C 
X-CRM114-Status: UNSURE (   6.50  )
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

On 29/08/2025 18:06, Mark Rutland wrote:
> The actual fix looks fine, though I suspect we should move more of this
> logic into mmu.c.

Agreed, I'll look into that. Having two separate declarations in
cpufeature.c and mmu.c is ugly and leads to the kind of mistake that I made.

The fix looks perfectly fine FWIW - not adding my Reviewed-by as I saw
Catalin took v2 already :)

- Kevin


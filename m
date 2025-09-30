Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356A8CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 14:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4dd/b+/6yOLvFf4WK45BE0emiL5zwQGwe+gV9seWVQ=; b=smADZjmHddFOz7P7WSnIUu5zYB
	uaWo4l1VtEt5n1KHVCc/I5QmYOllsEDSTen1hNTlpZoLhhiOzMd1vGI2ti/IqXqL4G+pQO2OpAutG
	iUNKQHp79OsCohoilY1Hq1xea/aC0Jt6pfU8EGrl22LAgeMxm8prHwu0qBMGeOmzVWiDHlkqHlI3n
	dXTBBj0nmOP8W21cKw2M2KpkwmxFN/MC6efhex9XAFZiIC9xnEMjHRQM+Aw98y0Dw/Gs1gyE7SCsf
	qASRogsXnVnpAgUjem/LC3OiLLOZHiq3PKSmakBB+hd9nvdVqYYa93y89pmY3q3EiX9PDH5rNDwii
	cCQQhbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3bHg-00000005ULW-3RNY;
	Tue, 30 Sep 2025 14:24:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3bHe-00000005UKw-3pH6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 14:24:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BCE61424;
	Tue, 30 Sep 2025 07:24:36 -0700 (PDT)
Received: from [10.44.160.83] (e126510-lin.lund.arm.com [10.44.160.83])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D938C3F66E;
	Tue, 30 Sep 2025 07:24:41 -0700 (PDT)
Message-ID: <db8b48d3-6885-4d1b-b97b-e2beb23100d4@arm.com>
Date: Tue, 30 Sep 2025 16:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: mm: Move KPTI helpers to mmu.c
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Ryan Roberts <ryan.roberts@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <kees@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>
References: <20250912073908.404924-1-kevin.brodsky@arm.com>
 <175880703970.3419388.13372770098169657486.b4-ty@kernel.org>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <175880703970.3419388.13372770098169657486.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_072450_994268_BF629836 
X-CRM114-Status: UNSURE (   9.22  )
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

On 25/09/2025 17:32, Will Deacon wrote:
> On Fri, 12 Sep 2025 08:39:08 +0100, Kevin Brodsky wrote:
>> create_kpti_ng_temp_pgd() is currently defined (as an alias) in
>> mmu.c without matching declaration in a header; instead cpufeature.c
>> makes its own declaration. This is clearly not pretty, and as commit
>> ceca927c86e6 ("arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc
>> function signature") showed, it also makes it very easy for the
>> prototypes to go out of sync.
>>
>> [...]
> Applied to arm64 (for-next/core), thanks!
>
> Please check that I resolved the conflicts correctly...
>
> [1/1] arm64: mm: Move KPTI helpers to mmu.c
>       https://git.kernel.org/arm64/c/200b0d25084d

Looks good, thanks!

- Kevin


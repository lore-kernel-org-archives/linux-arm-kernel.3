Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D224CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 07:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXtqENYReovGugKYFA3L15SB1Ff+bnxaF44dCm0yNoY=; b=jSkDLmfS9ftJsdWc2HILfcK2f0
	QK/FZWuEUNRp+eB1wJd3kTOh0iiY5L4s7hQcJf+a/I6ZeN5q3NAi8rfdSDdoan5nBGfa9/QaOox97
	/ooO3oODm5ElJSPo+r1fJ+qXjx8l4McrQeJesfNMRH7yNBm/MWuqj9aARAf99uvB4nbzhDCUks3HJ
	Bx3kAAGlzQHbpEArhO5yKeFQxpXzv6tUzIJlD9XZlzSK3VuTnfu1DvCuPka9cD61DpgwiEKydCelm
	AV+WTGrXFrBmym+KpumG3w0sBrOW2zGMD3nsHv1IOdhmUIeoSuDLFMNtPNPcbOx9BdDCBdVqpHs03
	pnxQL58Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvwa-00000005rb4-0vKH;
	Tue, 23 Jun 2026 07:53:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvwY-00000005rak-1Rsg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 07:53:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BA451691;
	Tue, 23 Jun 2026 00:53:08 -0700 (PDT)
Received: from [10.57.81.124] (unknown [10.57.81.124])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 049113F836;
	Tue, 23 Jun 2026 00:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782201192; bh=ZXtqENYReovGugKYFA3L15SB1Ff+bnxaF44dCm0yNoY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B3tH7NoAsYZbSMGgKnGffFnbcRhtvj6lHOVksd+AR+LFK7Q6YbmO0GkuHIrWf2iee
	 5ePgkikuKLdV1g5u/nVKy0MeQbJzlVglm1cFaEPnK1FHW4sssWCjUYfhlyzcP6CEWi
	 KTYVVZgmuoTErfedbhk/WVmPAxs+AwUP6xkdONOs=
Message-ID: <7504f24b-dff7-4aaa-80c7-018b44ecb763@arm.com>
Date: Tue, 23 Jun 2026 09:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Defer read-only remap of data/bss linear alias
To: Ard Biesheuvel <ardb@kernel.org>, Ard Biesheuvel <ardb+git@google.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>
References: <20260619163940.3185308-2-ardb+git@google.com>
 <2deff570-0497-4438-94ba-a9691881a016@arm.com>
 <2d27eaa8-3324-48b3-97b0-aecf63639c18@app.fastmail.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <2d27eaa8-3324-48b3-97b0-aecf63639c18@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_005314_430890_B7364DBB 
X-CRM114-Status: GOOD (  13.36  )
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

On 22/06/2026 18:42, Ard Biesheuvel wrote:
>> It would also be good to explain why we can't do this in
>> mark_linear_text_alias_ro() (presumably because this is too early). I do
>> agree that honouring rodata=off is a good thing, though.
>>
> I didn't consider that tbh - I'll check whether that is a more suitable
> location. But generally, I think doing it later rather than earlier is
> fine because it reduces the likelihood of hidden issues such as the one
> being addressed by this patch, and I don't think doing this very early
> makes a meaningful difference in terms of robustness.

That makes sense, probably not worth the hassle of checking if
mark_linear_text_alias_ro() would work.

>> BTW, if only kvm_arm_init() needs to read the data/bss via the linear
>> map, maybe we can still unmap it later?
>>
> Yes, it is still my intent to bring back the patches that unmap this alias
> entirely, including some additional tweaks for the fixmap PTE level table
> that I dropped after an earlier revision. But that will be 7.3 material,
> whereas this fixes a regression due to the changes that were pulled for 7.2.

Sounds good.

- Kevin


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0232FC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yklku70u8AEdfLgrIe06VUjsn48xfAtvDjV3kRMaOPc=; b=VrKh6ODjTiq28TCpOD/+FzuPH3
	iexvYWYTm4BRL7guSxnypn9U1AZqb16UJvy84y+HAbSwmYVaK1m/8zB/H4yc4jW5YvskMlJVQB4Dh
	l4luCakiSa6OVEiRkekmzrw4XezFX1vudZUx67V50e5Jbf+lWnlhJJrcinny2tCHY+ck6jAJp1mXP
	JhuSVMdlRNYgh1mWNApXWL7xQ3i7DpcaDFb7RwPads0jZ9HCPjSW2dLVnAZFovla0TGLLPzAV10AR
	h5M2fsNcUrrF7koxSHGXQFd3JYtcs38vla+84J4tWoxH3EoQdKdWrPGWKBgyjVL0HCo3Dc/OfTRAb
	522Jm6YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AGf-00000000A8D-4381;
	Thu, 03 Sep 2026 16:26:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AGe-00000000A7z-2sGW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:26:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E1D5B601EF;
	Thu,  3 Sep 2026 16:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 269911F000E9;
	Thu,  3 Sep 2026 16:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788452783;
	bh=Yklku70u8AEdfLgrIe06VUjsn48xfAtvDjV3kRMaOPc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BesfQ5/mUpvGx3f+5eEtnewfGkXq60IW2E7K8lGAqDntWpvphQ+1dpFUL1T4N7ZLw
	 WtmmxSkCKv5vuExm2oFDDjhbgBaBFNGh8Msdb9AwAAl6dz9CNM8wmycJpaCFB2CohK
	 B9/N5m+Ti5EigTEERBbSnH9jqMuwM82/6d7qcxDuUDX9eYOudRJIPzU2c8SVwel+2D
	 0phIgmgO88ljgkKMm2xbXd2DkKS2ROPqORhMlx6xfgUn0q4pAIcNQqWpIEi79K4n1R
	 X/nXhmP9qwHJllhWSBTSTUvREa+Coq8wP6pWSCp8iSybho7RIquD9R2XYNbEJ22Ktm
	 5zU3fmtRl8eDw==
Message-ID: <acdf2acc-a1a7-4a02-8924-4605e0d929b0@kernel.org>
Date: Thu, 3 Sep 2026 18:26:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/6] PSCI-via-EFI to support firmware and kernel
 sharing EL2 for Apple Silicon
To: Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
 asahi@lists.linux.dev
References: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
 <9c53cfd7-e193-4441-83ca-7710060225b7@app.fastmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <9c53cfd7-e193-4441-83ca-7710060225b7@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Ard,

On 03.09.26 13:34, Ard Biesheuvel wrote:
> Hi Sven,
> 
> On Wed, 8 Jul 2026, at 09:15, Sven Peter wrote:
>> Hi,
>>
>> Usually, idle and sleep state are implemented in firmware running in
>> e.g. EL3 with the kernel trapping into that from EL2. Unfortunately,
>> there's no EL3 on Apple Silicon machines and we'd rather not run the
>> kernel in EL1 since this would result in losing KVM support.
>>
>> While the shallower states could be implemented inside a custom cpuidle
>> driver (like we do downstream, see [1]) the deeper states result in a
>> complete loss of state and require bootstraping the cores again which is
>> quite involved. So instead we need some way to call back into our
>> open-source firmware to be able to handle that. This is even more
>> important for M4+ which don't even support the architectural wfi anymore
>> and always lose state when that instruction is executed.
>>
>> Luckily, EFI runtime services provide much of scaffolding we need,
>> namely a way to keep some code and data mapped and the ability to jump
>> into there from inside the kernel.
>>
>> This series adds a custom EFI table that points to a PSCI entry point
>> (plus some other stuff that has to be available before EFI runtime
>> services are set up) and adds support for this new conduit to the psci
>> code. We can't directly use the normal EFI runtime path because that one
>> takes a sleeping lock and we need to be able to call into PSCI from
>> atomic context during e.g. cpu bringup or during idle.
>> It also adds support for specifying the specific MAIR attributes for EFI
>> runtime mappings as defined in the latest UEFI spec since Apple Silicon
>> is rather allergic to using Device-nGnRnE vs. Device-nGnRE for its MMIO.
>>
>> This all results in a surprisingly small diffstat. I believe this
>> approach was originally suggested in some IRC discussion years ago,
>> possibly by Ard, but I can't find the old logs anymore.
>> Happy to add a Suggested-by tag though if anyone remembers.
>>
>> The firmware implementation I used for testing can be found at [2] and
>> the full kernel tree with this series applied at [3].
>>
>> Best,
>>
>> Sven
>>
>> [1]
>> https://github.com/AsahiLinux/linux/blob/asahi/drivers/cpuidle/cpuidle-apple.c
>> [2] https://github.com/AsahiLinux/m1n1/tree/psci-via-efi
>> [3]
>> https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git/log/?h=efi-psci
>>
>> Signed-off-by: Sven Peter <sven@kernel.org>
>> ---
>> Sven Peter (6):
>>        dt-bindings: arm: psci: Add EFI conduit
>>        arm64/efi: Add and parse custom PSCI EFI configuration table
>>        efi: Add EFI_MEMORY_ISA_{MASK,VALID}
>>        arm64/efi: Honor EFI_MEMORY_ISA_MASK for Device-nGnRnE vs -nGnRE
>>        firmware/psci: Add EFI runtime conduit
>>        arm64: dts: apple: t8103: Add PSCI and CPU idle states
>>
> 
> I've picked up patches #3 and #4, which are useful in their own right.

thanks, I think i had a fixup for one of those in my local v2. I'll 
check and send it as a separate patch if it was important.

> 
> I'm not sure if the arm64 maintainers will want to consider this, but
> I think it's a reasonable compromise, as it puts the abstraction in
> the right place.
> 
> I take it this will be contributed to u-boot if it gets accepted here?

Yeah, that was my plan: First agree on something that can be accepted 
into the kernel and then work on the rest of the boot chain. The current 
code in m1n1 that sets up bare bones EFI tables is just a hack to proof 
this all actually works.


Sven




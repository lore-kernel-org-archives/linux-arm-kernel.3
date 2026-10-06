Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254B7CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 17:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Njuqyrf99wxtjz44/kmHglykEMIK7EtyJm1BCz5MtMI=; b=ymsrI+wtpmDiHL
	wtxeoKfxjRiFFGnHC0tzhXHKf08C8civnFNjW82McRnUZL2JlFgNSctD+PZRTjpWxiD2I1l2juVD3
	F+YS7TFGAYJVickIvPO7ZwkznNXSTSc+WrngnKrWoiGk8knPXRf9Xwiyf0UcOFP9Ifor28mxmy3tS
	1Xs6MJrXArDmmicDltaVhJ0Ue+GRN8sy7XAMzzXzH2nsbMeXvdsBp1RK+PO2SaXubh9aInRMrIrQc
	0AKRAeNHtJegdQhpQlkeTsPJS7809XWbrgIVcQM/ezwj9kKa9gyBGJmzqFAQefeaXrYf9qtJBt6tQ
	8KUYg+FZvupDjJHu1aUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE8zl-00000001DHr-1rv1;
	Tue, 06 Oct 2026 17:30:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE8zj-00000001DHJ-06ss
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 17:30:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA4431516;
	Tue,  6 Oct 2026 10:30:21 -0700 (PDT)
Received: from [10.2.213.24] (e137867.arm.com [10.2.213.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C8473F763;
	Tue,  6 Oct 2026 10:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791307825; bh=AoVSE1ahvdGEwSFNF5ElARKWNGbd+8wYT3O8CxpoMys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Td2qu0pWhWApwGzoceFGyF7nAI3Aowo/QvsoSoSwnFpm9lL6FZ0WLkhQNpegCt8yI
	 zWIdbftbmH/oLJsFxn79oWFnG8+3PIR/xOSr8ZzNI3VnDWBoiJL45ZiPqvnsDPscMl
	 SH0GU5pdq2+PkVAUOvM0DIzZFXv9qHuBo9pK4tNU=
Message-ID: <e7838d78-cab8-4a14-a983-f72987a87afc@arm.com>
Date: Tue, 6 Oct 2026 18:30:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: alternatives: switch most used alternatives to
 callbacks
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20260928133034.243541-1-ada.coupriediaz@arm.com>
 <asUhsMhMumCwalZt@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <asUhsMhMumCwalZt@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_103027_117339_2AFFEE6D 
X-CRM114-Status: GOOD (  17.08  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Lucas Wei <lucaswei@google.com>, Barry Song <baohua@kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Andre Przywara <andre.przywara@arm.com>, Shanker Donthineni <sdonthineni@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>, Tejun Heo <tj@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Catalin,

On 06/10/2026 17:28, Catalin Marinas wrote:
> Hi Ada,
>
> On Mon, Sep 28, 2026 at 02:30:28PM +0100, Ada Couprie Diaz wrote:
>> All numbers are on v7.3-rc4 building defconfig with GCC 13.3.0.
>> Only the patches mentioned are applied on each line.
>>
>> |   Patches    |  Size (B) |	|    Patch    | Size (B) |
>> | Base vmlinux | 172826400 |	|  Base Image | 52374016 |
>> |          1-3 |    -71672 |	|         1-3 |   -65536 |
>> |            4 |    -71704 |    |           4 |   -65536 |
>> |          1-4 |    -64712 |	|         1-4 |   -65536 |
>> |          5-6 |    +68008 |	|         5-6 |       -0 |
>> |  All patches |    + 3240 |    | All patches |   -65536 |
>>
>> The impact on alternatives is two-fold :
>> 1. As expected, all alternatives for the two I/O workarounds and
>>     97% of the `ARM64_HAS_VIRT_HOST_EXTN` alternatives are converted to
>>     callbacks, saving 85848 bytes (20 pages).
>> 2. The raw number of alternatives *increases* by about 3% (250 new entries)
> TBH, I don't think the saving is worth the additional complexity.

Fair, I did expect it a bit but wanted to share if it could be useful.

> I wonder, could we instead move the replacement instructions to a
> separate section we can drop after patching? I can see x86 uses a
> separate .altinstr_replacement. Not sure what restrictions we have on
> arm64, e.g. if it's placed too far.

I think given the amount of alternatives we have now, there was some
distance issue, but I don't have the exact details. I can look into it !

> That said, are some of the other patches worth picking up as cleanups?

Mh, I think patches 1 and 5 are nice small cleanups by themselves,
patch 2 is less obviously useful as-is but is a start on making the
insn framework safer to use for patching (which is not really reasonable
to tackle in one go anyway).

Thanks Catalin,
Kind regards
Ada



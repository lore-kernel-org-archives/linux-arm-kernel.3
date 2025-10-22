Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DD0CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 14:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQ7q/4zySaM4MOZEvp5XgJfMQC2PsHs4Sv4JNvspi/g=; b=jIEkKlmawcflp7GUyLE3J2q13k
	BCK7PRBrVJCGjx49rvJ+fmJZM/wye+bTmuzKgWzIoosD4GfmFYay7XlzVWbbhQN5DNDeJ9ybS4tul
	M5dCVHPeyEiJbHVLKwbCZUVVmb9RQOex+xqIq/eVp3cfnSg3mVIh5BKWswOhwtpY+Hm6bXiReikiW
	Dz3Z1dySqiLKYX4n8bcUphHGpeftqot1S2MKPNI52HUxypko0ah6hYxZZzWTwIfXF4w9MM7OG7j9J
	S86dq4adsgDWIF7jwbgbA6LJolJuF6ZwbEOZupP4FdnVvSJMPVdITdMenqjqFCf91V1zX372c2Pru
	i4gKyP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZuY-00000003Erj-372M;
	Wed, 22 Oct 2025 14:33:58 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZuU-00000003Eoa-37Ia
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 14:33:56 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4csBVb60xNz9slv;
	Wed, 22 Oct 2025 16:33:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761143623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SQ7q/4zySaM4MOZEvp5XgJfMQC2PsHs4Sv4JNvspi/g=;
	b=saBzREJLydm0tA2LYr2BcmhoAY+acV8mtBdecGgVwtS5lAD7t7wErTCFt5F0w/c0GiUF2i
	WDrvvwugbxLNoe+ZsurdYiiwWveLQl1EIzx7jDgtuErJXLAjROsilTamuao/whxy2lJ1qW
	iHp24gK+G+gVTZKIYMtH1eLBw5V7UOfWRaNh4pGeYFMmC2HWLSV7YyHGdkUoI4KwnExaJQ
	VxdfBAwafcPvzjMzN6eH21M/KmZ/W6xoQ5h8LWxrIYrusjsU4B+M1Ag1yVBJo+SXTSrWtn
	1jn+vtnFk9w+BpMk48s9cwSw4sf9J4jSlhvQATbNyMNLBhMo84vxzjZv0uvfuw==
Message-ID: <07391913-aab6-4d92-b75f-278506f51397@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761143622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SQ7q/4zySaM4MOZEvp5XgJfMQC2PsHs4Sv4JNvspi/g=;
	b=r4VMeBRi3apHe8m5FEEmVn6aErJV/mNboAPeRwAlhvbJwqmIu7ZAVBGmuPsUtG2lE+ghyN
	XGrxPJrtFpspdNAZQxwsh5lsiwHCar6A0ARJqxPgBefbPpBujTdL9ZaQjPEzzCCG1UUXR6
	O8djyPLNAaV1hD29wHC1tduFzGwCZtDbCZqx8BzFPEen5JZGQxNJuVE6v2PTBovh0xPBv/
	zkWO/QUutbLLd0LuxRQ6mEbtMlM24JbKxr6QlOslEbSsVCVrGJfjj16iUyo4+eFlb4ItGw
	CX2DX2axJ2MzCIkRCiu0v1hV2ysjFbd9IwhTUSXBxB/wS1S6/scdRO1UtdSXpw==
Date: Wed, 22 Oct 2025 16:33:38 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: guard AMU register access with ARM64_HAS_AMU_EXTN
To: Marc Zyngier <maz@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-renesas-soc@vger.kernel.org
References: <20251022133621.178546-1-marek.vasut+renesas@mailbox.org>
 <86347bvx0f.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <86347bvx0f.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: cj3tsrj4fhfswqme59bzu1bbbxce1pa8
X-MBO-RS-ID: 39483152c3182c61913
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_073354_944232_722324E0 
X-CRM114-Status: GOOD (  17.87  )
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

On 10/22/25 4:20 PM, Marc Zyngier wrote:
> On Wed, 22 Oct 2025 14:35:28 +0100,
> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
>>
>> The AMU configuration register access may fault and prevent successful
>> kernel boot. This can occur for example in case the firmware does not
>> allow AMU counter access from EL1. Guard the AMU configuration register
>> access with ARM64_HAS_AMU_EXTN to prevent this fault if ARM64_HAS_AMU_EXTN
>> Kconfig option is explicitly disabled. Other interaction with the AMU is
>> already guarded by similar ifdeffery.
>>
>> Fixes: 87a1f063464a ("arm64: trap to EL1 accesses to AMU counters from EL0")
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Yicong Yang <yangyicong@hisilicon.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>>   arch/arm64/mm/proc.S | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
>> index 86818511962b6..123538ffeda6b 100644
>> --- a/arch/arm64/mm/proc.S
>> +++ b/arch/arm64/mm/proc.S
>> @@ -145,7 +145,9 @@ SYM_FUNC_START(cpu_do_resume)
>>   	ubfx	x11, x11, #1, #1
>>   	msr	oslar_el1, x11
>>   	reset_pmuserenr_el0 x0			// Disable PMU access from EL0
>> +alternative_if ARM64_HAS_AMU_EXTN
>>   	reset_amuserenr_el0 x0			// Disable AMU access from EL0
>> +alternative_else_nop_endif
> 
> Why?
> 
> We ensure that the AMU is available in the macro itself by checking
> for ID_AA64PFR0_EL1.AMU. If the AMu isn't present on this CPU, we skip
> the offending sysreg access. This is similar to what we do for the
> PMU.
> 
> Does your HW advertise an AMU, but doesn't actually have one?
The hardware does have AMU, but it is currently blocked in old TFA 
version and access to this AMU register here causes a fault. That's why 
I have to disable ARM64_HAS_AMU_EXTN until the TFA is updated and the 
AMU access is made available on this hardware. But even if I do disable 
ARM64_HAS_AMU_EXTN=n , I get a fault.

This patch is mainly meant to prevent a surprise in case someone does 
set ARM64_HAS_AMU_EXTN=n , and the system still faults on AMU register 
access.


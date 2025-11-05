Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3EECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 05:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAqN/DnbRe0RFyNpxxcRoQaMRf5VJQpm5qiCdR15c1o=; b=OW80yZ9gHqov73ZpS8xfKMiM3y
	hF9e6fU06AaAWtq28YIXPTtknAI80sJHby5v0DE/J+VXipYQyL/XGYSoHMdWeWq8Mnq3MSdQPCJYv
	hj3BoRpvjBpbdQgcECaDaDM0gDL1euIOeaRFzzEwIfqzoFX2wGTkVY4l/pg72xesW8uTb5OJzPnWD
	naIKPTrdVl44zed4uVnoKmoHgB5RCAe7ijE58rHtXDfLS1ulsNpPq+9xW6Im2fN2MX3bQ60SKZwYz
	PF8+leg3UmBpIC+c0WkwOZOboVBGJ2jEOM0LziIL/KEdNhxLWDS1H7gUBWBgRHtu/Tu2qgVf4OKsg
	Qdn4dpbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGW6k-0000000D2Od-2cQW;
	Wed, 05 Nov 2025 05:30:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGW6i-0000000D2OG-0Wwt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 05:30:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC9E616F2;
	Tue,  4 Nov 2025 21:30:46 -0800 (PST)
Received: from [10.164.18.45] (unknown [10.164.18.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9D8C3F63F;
	Tue,  4 Nov 2025 21:30:52 -0800 (PST)
Message-ID: <f5dbffae-52a5-4992-95a8-d47c925e286f@arm.com>
Date: Wed, 5 Nov 2025 11:00:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Drop redundant extern declaration for
 rodata_full
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 ryan.roberts@arm.com
References: <20251015023609.427911-1-anshuman.khandual@arm.com>
 <aQofCMqxiqujZP-g@willie-the-truck>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aQofCMqxiqujZP-g@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_213056_273715_AC2D6FC8 
X-CRM114-Status: GOOD (  19.87  )
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

On 04/11/25 9:13 PM, Will Deacon wrote:
> On Wed, Oct 15, 2025 at 03:36:09AM +0100, Anshuman Khandual wrote:
>> Drop the redundant extern declaration 'rodata_full' which can be included
>> via the header <asm/setup.h> after moving exiting declaration outside the
>> function arch_parse_debug_rodata(). While here also drop 'rodata_enabled'
>> which is anyways available via the generic header <linux/init.h>.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/include/asm/mmu_context.h | 2 --
>>  arch/arm64/include/asm/setup.h       | 4 +---
>>  2 files changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
>> index 0375ca3162ff..e4b3563e1d96 100644
>> --- a/arch/arm64/include/asm/mmu_context.h
>> +++ b/arch/arm64/include/asm/mmu_context.h
>> @@ -26,8 +26,6 @@
>>  #include <asm/sysreg.h>
>>  #include <asm/tlbflush.h>
>>  
>> -extern bool rodata_full;
>> -
>>  static inline void contextidr_thread_switch(struct task_struct *next)
>>  {
>>  	if (!IS_ENABLED(CONFIG_PID_IN_CONTEXTIDR))
>> diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
>> index 3d96dde4d214..902f1aab520f 100644
>> --- a/arch/arm64/include/asm/setup.h
>> +++ b/arch/arm64/include/asm/setup.h
>> @@ -12,12 +12,10 @@
>>   */
>>  extern phys_addr_t __fdt_pointer __initdata;
>>  extern u64 __cacheline_aligned boot_args[4];
>> +extern bool rodata_full;
>>  
>>  static inline bool arch_parse_debug_rodata(char *arg)
>>  {
>> -	extern bool rodata_enabled;
>> -	extern bool rodata_full;
>> -
>>  	if (!arg)
>>  		return false;
> 
> It would probably be cleaner to make 'rodata_full' static in mm/pageattr.c,
> move the guts of arch_parse_debug_rodata in there and then consolidate
> can_set_direct_map() and force_pte_mapping().
> 
> You need to talk to Ryan for the last part, as David's made some
> suggestions around that too.

Sure will talk to Ryan about this. But for the above suggestion - probably something
like the following (untested) should work.

diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 0dbe3b29049b..ddb964e916e1 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -26,8 +26,6 @@
 #include <asm/sysreg.h>
 #include <asm/tlbflush.h>
 
-extern bool rodata_full;
-
 static inline void contextidr_thread_switch(struct task_struct *next)
 {
 	if (!IS_ENABLED(CONFIG_PID_IN_CONTEXTIDR))
diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
index 3d96dde4d214..fa77a7208826 100644
--- a/arch/arm64/include/asm/setup.h
+++ b/arch/arm64/include/asm/setup.h
@@ -13,32 +13,7 @@
 extern phys_addr_t __fdt_pointer __initdata;
 extern u64 __cacheline_aligned boot_args[4];
 
-static inline bool arch_parse_debug_rodata(char *arg)
-{
-	extern bool rodata_enabled;
-	extern bool rodata_full;
-
-	if (!arg)
-		return false;
-
-	if (!strcmp(arg, "on")) {
-		rodata_enabled = rodata_full = true;
-		return true;
-	}
-
-	if (!strcmp(arg, "off")) {
-		rodata_enabled = rodata_full = false;
-		return true;
-	}
-
-	if (!strcmp(arg, "noalias")) {
-		rodata_enabled = true;
-		rodata_full = false;
-		return true;
-	}
-
-	return false;
-}
+bool arch_parse_debug_rodata(char *arg);
 #define arch_parse_debug_rodata arch_parse_debug_rodata
 
 #endif
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index b8d37eb037fc..030ee4ba8a7a 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1014,9 +1014,7 @@ static inline bool force_pte_mapping(void)
 	bool bbml2 = system_capabilities_finalized() ?
 		system_supports_bbml2_noabort() : cpu_supports_bbml2_noabort();
 
-	return (!bbml2 && (rodata_full || arm64_kfence_can_set_direct_map() ||
-			   is_realm_world())) ||
-		debug_pagealloc_enabled();
+	return debug_pagealloc_enabled() || (!bbml2 && can_set_direct_map());
 }
 
 static void __init map_mem(pgd_t *pgdp)
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 5135f2d66958..60d372c630eb 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -80,7 +80,31 @@ static const struct mm_walk_ops pageattr_ops = {
 	.pte_entry	= pageattr_pte_entry,
 };
 
-bool rodata_full __ro_after_init = true;
+static bool rodata_full __ro_after_init = true;
+
+bool arch_parse_debug_rodata(char *arg)
+{
+	if (!arg)
+		return false;
+
+	if (!strcmp(arg, "on")) {
+		rodata_enabled = rodata_full = true;
+		return true;
+	}
+
+	if (!strcmp(arg, "off")) {
+		rodata_enabled = rodata_full = false;
+		return true;
+	}
+
+	if (!strcmp(arg, "noalias")) {
+		rodata_enabled = true;
+		rodata_full = false;
+		return true;
+	}
+
+	return false;
+}
 
 bool can_set_direct_map(void)
 {
-- 
2.30.2




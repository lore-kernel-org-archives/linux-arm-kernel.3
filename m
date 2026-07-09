Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9C1C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4hgWbehDnZ4BZlMvp/+7ekCJ1HVU2ZKCHsi1MB7Jvfk=; b=x+EN26Xny2wX77
	SsXLFbl03rYZplBXaib+iBTjewRTQMlipa1dhlYBC0gFS8JshdFX+kxzxhlrwQkUwEuuO9blN41IV
	OxXAEygZRq7qRNRTupX4PDW9p4sZzWIDqJAr+TWbZqNWKMF8iNKa6+W+eL/riWcKUh2lW2JdMOuw5
	WIp5oJ+vD+p0zjeGbOj1v5CxGPQvyrYJX/Xqww1jCnZSkCwfqF6raPitJjXY/NVMCD5WODmgPPzU1
	84hFxIApYH/4GA5eGQXkn/SfHGmMdTTRyRLt5Xyqz1Jw1GpnDUyN8E0ekoOef6EJMuWt1Pq5j2SsM
	JiMILBYBpFcSB6Gkgf2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoTZ-00000002VGe-2wjW;
	Thu, 09 Jul 2026 13:07:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoTY-00000002VFr-2CJo
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 09 Jul 2026 13:07:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4hgWbehDnZ4BZlMvp/+7ekCJ1HVU2ZKCHsi1MB7Jvfk=; b=eL5InxNR8qyEh7rMGLSEuq9jDO
	i2F5gGzcvTrrdrmHg9xYTlfi9atehmVI5pMOyN6zwS2PEvZlSqIil7hrUCGXHQ2nP1pTy8Nv7ikiJ
	plbhN3/6tCiaPcMZGppzL0GxLk0FQBdDAaj9HbRTbNnoUjWgU4dhZDhAzRX3eXZcWDpjX6Ab6xsTq
	4ICLtZMpo6HxeKGSDLHII1pLhRVkY81Fy2XMJzptvtfXZOZpPfIQue/5e7PTSNJXL//q8T30CnkN2
	W7FVY4PAwXbkjlqfs8CNuKKo65HPVVqFhSMP57SmFtT063/HkZIkPBle9/4er3kvyRR0eQsN0+iip
	dqD7o65A==;
Received: from [113.46.200.223] (helo=canpmsgout08.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whoTU-00000009ESd-0s9j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 13:07:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4hgWbehDnZ4BZlMvp/+7ekCJ1HVU2ZKCHsi1MB7Jvfk=;
	b=1byi5wm+a0Dm3FVa7kazeTEwp/J46B3GjwaxHMnLCqeSdq5UbpPCkDmjW1wRgm3MW3SMCmumv
	yI68OyUHn0i8sZr7aDmZiAk1qHNHO/3ICGuUDpnn7QTmssXP/QiG2f+h7sKYAhLcEB5ZsSw8jyd
	PDzFOkMEjIzIItN/QDY0GEw=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gww3m3zf7zmVZw;
	Thu,  9 Jul 2026 20:57:40 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7C2474055B;
	Thu,  9 Jul 2026 21:06:55 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 9 Jul 2026 21:06:54 +0800
Message-ID: <1a476e7b-be94-49a3-805a-8935f9f086de@huawei.com>
Date: Thu, 9 Jul 2026 21:06:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/36] arm64: debug: don't mask DAIF for mdscr_write()
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-3-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-3-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_140732_873936_E404F04C 
X-CRM114-Status: GOOD (  16.52  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/9/2026 8:12 PM, Vladimir Murzin wrote:
> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> Masking DAIF around the write to MDSCR_EL1 doesn't do anything: we can
> write to sysregs with interrupts unmasked, and writing to PSTATE is
> not a context synchronization event so it does not synchronize it.
> 
> This is done in the context of a general interrupt handling cleanup,
> so it does not address the missing context synchronization for the
> MDSCR_EL1 write, staying consistent with the current state.  This
> should be addressed in a future patch.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/kernel/debug-monitors.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 29307642f4c9..e271fbac5f82 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -40,10 +40,7 @@ u8 debug_monitors_arch(void)
>   */
>  static void mdscr_write(u64 mdscr)
>  {
> -	unsigned long flags;
> -	flags = local_daif_save();
>  	write_sysreg(mdscr, mdscr_el1);
> -	local_daif_restore(flags);

commit 478fcb2cdb23 ("arm64: Debugging support") used the
local_dbg_save() to set the DAIF.D bit.

In my opinion, this was originally intended to avoid the debug exception
being triggered immediately when the single-step mode is enabled during
the write of MDSCR_EL1.SS?


+ * MDSCR access routines.
+ */
+static void mdscr_write(u32 mdscr)
+{
+       unsigned long flags;
+       local_dbg_save(flags);
+       asm volatile("msr mdscr_el1, %0" :: "r" (mdscr));
+       local_dbg_restore(flags);
+}


+#define local_dbg_save(flags)
       \
+       do {
       \
+               typecheck(unsigned long, flags);
       \
+               asm volatile(
       \
+               "mrs    %0, daif                        //
local_dbg_save\n"    \
+               "msr    daifset, #8"
       \
+               : "=r" (flags) : : "memory");
       \
+       } while (0)


>  }
>  NOKPROBE_SYMBOL(mdscr_write);
>  



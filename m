Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA75C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRU7li37a1r2GsBKMLO6aQNn3T8XMPS8kHDTCD+o0+E=; b=jGJg6fuxp/ZMtHZg7NwFuchLUK
	SGWoJUwmZqyyREcc/2nhzRdVRMip3kMjMibsX/RqvsyeBpNjzuoAzWMzE2QwSdPT4beRH1fh2JvVU
	eJwFWF0IDkEIVeaIW9QS5i3Ro3vHBD4zhr1t9UZtuoRBxEmQsufwgj0krdinCUVhoq2Pl7hbYgH+y
	ocgr1J5uvjCqrnqFzzS9jC54DxQPi9aufNgQLr9eC31KvxSTVpqG6qoIuZbrRw8ieX5EKASEol2gA
	aDA0Ww73vzpu5+38ydK88MZtJgIzPRUcMHq1fKb32OnJ8PuwITcDDK0A7fW4B5joonbJLEYbbRf3W
	6im1ISEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHSM-00000003uJD-1Hyy;
	Wed, 26 Feb 2025 13:28:10 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGrU-00000003k8P-06KI;
	Wed, 26 Feb 2025 12:50:05 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z2v3t6vSKz9sSN;
	Wed, 26 Feb 2025 13:31:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FPLDBYGk5ZSX; Wed, 26 Feb 2025 13:31:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z2v3t62h2z9sSL;
	Wed, 26 Feb 2025 13:31:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BBC958B78B;
	Wed, 26 Feb 2025 13:31:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ep8JbNxoBOZU; Wed, 26 Feb 2025 13:31:54 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 85E558B77C;
	Wed, 26 Feb 2025 13:31:54 +0100 (CET)
Message-ID: <c58f3fef-82a6-43a4-a222-1cc8ab62a93b@csgroup.eu>
Date: Wed, 26 Feb 2025 13:31:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/5] mm: Make DEBUG_WX depdendent on GENERIC_PTDUMP
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Steven Price <steven.price@arm.com>
References: <20250226122404.1927473-1-anshuman.khandual@arm.com>
 <20250226122404.1927473-5-anshuman.khandual@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250226122404.1927473-5-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_045004_213283_16AD00BC 
X-CRM114-Status: GOOD (  10.63  )
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



Le 26/02/2025 à 13:24, Anshuman Khandual a écrit :
> DEBUG_WX selects PTDUMP_CORE without even ensuring that the given platform
> implements GENERIC_PTDUMP. This problem has been latent until now, as all
> the platforms subscribing ARCH_HAS_DEBUG_WX also subscribe GENERIC_PTDUMP.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   mm/Kconfig.debug | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
> index 41a58536531d..a51a1149909a 100644
> --- a/mm/Kconfig.debug
> +++ b/mm/Kconfig.debug
> @@ -186,6 +186,7 @@ config ARCH_HAS_DEBUG_WX
>   config DEBUG_WX
>   	bool "Warn on W+X mappings at boot"
>   	depends on ARCH_HAS_DEBUG_WX
> +	depends on GENERIC_PTDUMP
>   	depends on MMU
>   	select PTDUMP_CORE
>   	help



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0583BD65C6F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 11:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Il6MCIWPQie3YJaODFOx8K/akx4KWy4DGzrSlIIzXQo=; b=wO15BzzFFRTTC1lI/u9OvsmOna
	HnEX1bW7ZwrgZodzbZKZRhH60lRGh7hDs/4lxBdcdfosC8bPOIMAqUGHMgd8A6ZooIKrSDz32aXXk
	RbTyGYxzZ4Y407vIDUyHo9FJxdKQi5uaEiokPaPa20hM3lHbIVTMedUy+/p5WloQ5VHPnEtp221b+
	hh8cRnky6BSh4QEVpGAS/0Cag3B8NaQVDK8RVoXgnWHwKiumSoH4sZr0EfA/n6J31+ycEd6rBSXUz
	CPlxnXhCrkbxrG27umhGG7yL1gV17iPJgdzL1Q+ukVVTCS3aP1jwtoHAm+EIKp0UVre1UhsuQaEX2
	DxWof38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXa2-00000009dbd-2lWc;
	Thu, 14 Nov 2024 11:00:06 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWmw-00000009TWm-3NQU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 10:09:30 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 753E52119F;
	Thu, 14 Nov 2024 10:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1731578960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Il6MCIWPQie3YJaODFOx8K/akx4KWy4DGzrSlIIzXQo=;
	b=H1IDs8ap3R0WhxzhJfAHUhV8nquICuKmn5BuJQnAUKNFH6hm2KdhOqPqQr+gA4lgXT42kl
	+gZj/NWcbBBcPErB7piRzIcSPlQB8UnLhFdXy3NX0M0djJ1WRSzQ0z/dtVh1HKntq23YBi
	Vrs+1m6IdvMbffMB/70fSRZhc+9CLkg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1731578960;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Il6MCIWPQie3YJaODFOx8K/akx4KWy4DGzrSlIIzXQo=;
	b=wUbPSJg7bnBdXNUSJ01COjnVMsD68Mwtcu2s/SzXdEW6KYLyBSgrw6jQXDJH63C7yplZdT
	9ifItblf8gGgiDBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1731578960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Il6MCIWPQie3YJaODFOx8K/akx4KWy4DGzrSlIIzXQo=;
	b=H1IDs8ap3R0WhxzhJfAHUhV8nquICuKmn5BuJQnAUKNFH6hm2KdhOqPqQr+gA4lgXT42kl
	+gZj/NWcbBBcPErB7piRzIcSPlQB8UnLhFdXy3NX0M0djJ1WRSzQ0z/dtVh1HKntq23YBi
	Vrs+1m6IdvMbffMB/70fSRZhc+9CLkg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1731578960;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Il6MCIWPQie3YJaODFOx8K/akx4KWy4DGzrSlIIzXQo=;
	b=wUbPSJg7bnBdXNUSJ01COjnVMsD68Mwtcu2s/SzXdEW6KYLyBSgrw6jQXDJH63C7yplZdT
	9ifItblf8gGgiDBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 66D9C13721;
	Thu, 14 Nov 2024 10:09:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id f/HHGFDMNWc2GwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 14 Nov 2024 10:09:20 +0000
Message-ID: <cb9cabed-0038-42b3-b9fc-c9ba62b12781@suse.cz>
Date: Thu, 14 Nov 2024 11:09:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/slab: Avoid build bug for calls to kmalloc with a
 large constant
Content-Language: en-US
To: Dave Kleikamp <dave.kleikamp@oracle.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <20241014105912.3207374-1-ryan.roberts@arm.com>
 <20241014105912.3207374-6-ryan.roberts@arm.com>
 <44312f4a-8b9c-49ce-9277-5873a94ca1bb@oracle.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <44312f4a-8b9c-49ce-9277-5873a94ca1bb@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[6]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_020923_107990_030E00F5 
X-CRM114-Status: GOOD (  20.47  )
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

On 11/1/24 21:16, Dave Kleikamp wrote:
> When boot-time page size is enabled, the test against KMALLOC_MAX_CACHE_SIZE
> is no longer optimized out with a constant size, so a build bug may
> occur on a path that won't be reached.

That's rather unfortunate, the __builtin_constant_p(size) part of
kmalloc_noprof() really expects things to resolve at compile time and it
would be better to keep it that way.

I think it would be better if we based KMALLOC_MAX_CACHE_SIZE itself on
PAGE_SHIFT_MAX and kept it constant, instead of introducing
KMALLOC_SHIFT_HIGH_MAX only for some sanity checks.

So if the kernel was built to support 4k to 64k, but booted as 4k, it would
still create and use kmalloc caches up to 128k. SLUB should handle that fine
(if not, please report it :)

Maybe we could also stop adding + 1 to PAGE_SHIFT_MAX if it's >=64k, so the
cache size is max 64k and not 128k but that should be probably evaluated
separately from this series.

Vlastimil

> Found compiling drivers/net/ethernet/qlogic/qed/qed_sriov.c
> 
> Signed-off-by: Dave Kleikamp <dave.kleikamp@oracle.com>
> ---
> 
> Ryan,
> 
> Please consider incorporating this fix or something similar into your
> mm patch in the boot-time pages size patches.
> 
>   include/linux/slab.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 9848296ca6ba..a4c7507ab8ec 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -685,7 +685,8 @@ static __always_inline unsigned int __kmalloc_index(size_t size,
>   	if (size <= 1024 * 1024) return 20;
>   	if (size <=  2 * 1024 * 1024) return 21;
>   
> -	if (!IS_ENABLED(CONFIG_PROFILE_ALL_BRANCHES) && size_is_constant)
> +	if (!IS_ENABLED(CONFIG_ARM64_BOOT_TIME_PAGE_SIZE) &&
> +	    !IS_ENABLED(CONFIG_PROFILE_ALL_BRANCHES) && size_is_constant)
>   		BUILD_BUG_ON_MSG(1, "unexpected size in kmalloc_index()");
>   	else
>   		BUG();



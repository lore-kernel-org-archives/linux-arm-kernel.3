Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A926CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 09:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rK7jfs9gqvXaLNimcAlCkzrJKccO+YVTZrJh68Wev+0=; b=ZfyxYKk6n9AemDHf8KSw/Ecs3B
	0nkC5hUoJoGWAbXQiwDRcJY2h4UiSiONu5u2s4p9meHsLKx0G/S8Frk8PjLZSi+GqONNS6f0ZilNq
	3Lz78oX/PozokL93kbF+YXcyl/hq60iDMbL6tMQE3AcI5Vm4mEgsNAcJlO6yXOVbotEr6M17MiQAb
	2TKcli60OvCADwxooL1o6WkGR5i7MMxmXSzHtSxg7+IzXKrGwRg84SDhCMnjs+dndh7jG92iLew8j
	DQ8Z+6SO5GgxFdX4J72mygARwDRk53ke4YgPawxXS2xW3qmGmXvaE5FyWxeUR6EDo6lWEcI59GwVF
	kd/TDiUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINu5-000000053d1-3q7p;
	Mon, 10 Nov 2025 09:09:37 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINu3-000000053ca-2ePL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 09:09:36 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42b31c610fcso1091094f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 01:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762765773; x=1763370573; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rK7jfs9gqvXaLNimcAlCkzrJKccO+YVTZrJh68Wev+0=;
        b=FEIIA1on8CDla1Dc3+Dld133e2Wsk66NJiqscAeCLnbMlYkQXWi8BrAhWlmO1HsVBW
         OkMctLwkvlgIaIdbXNZHo8ro/yvUnoU1mig/5hMEq4fzT8i02uWyKeyp9jGSTCQfCjOf
         iOhBjDFIJgFS92Aiv54eejFrvsCBhmLTV7OdM6Bi+PqO7CmkORgJAFGKRmNDVZPOf6CY
         YOYWblr1xXzPFDcNQfAkAdEkWByan2pR8Oge4uW411O6AYyBIWg2N2mTw3DdIFFHF3kI
         EusmvBWtO5/I/Fv8TDRr/+21N+jhinVwNOTZ5e2i3m7gbt/QvyxzWHMobgEW2MF4Apxf
         Br5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762765773; x=1763370573;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rK7jfs9gqvXaLNimcAlCkzrJKccO+YVTZrJh68Wev+0=;
        b=DqzSzYXZWVFnGYU103vH+VdWvrNVGl17BZUZ58SEX2tZYKgRFGS/9/TtNcYIYZR4S8
         1M089v6ky5eS388lbCQcRIgS9Sof+fCXP+ffRagurdXodZF/8Lwplf7EEuMGUyk8PnRP
         XkxvZV/JBRbQACGB763wjZk9nx/+ATj/pDQ3mjmjy/4eryokiUPUmiw5N8ezUUEiSF2q
         eKcrgVPfBV7ldITxWdtBKUZFQBCTEigcZWz1iXE3/9wpDt/cPD56ku25IHH+v+Syy3Fq
         uKXBwiyANaGi7Jy8UU9cjDeRdnq1exOv4Dw2kHw3KNJ0sIVU27rbWQ/yN38gW8p5nl0W
         PI6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIAxotPj56YqfZVOPNMu0Dg9lHicLo/NpYCIbjSBCniy2mDUpQsen1W4n6SE210nbnEFJV6VZQG5UhMcMcpZhV@lists.infradead.org
X-Gm-Message-State: AOJu0YzVD83WlOXqAhoWeqD4x3WbcbBORnuquCUT5Ts1wGj29VQr8gNp
	YeBT99YMa7xskNWeFcr6HPb1s/oeyzbGPrv7f0xtMrpvaXhuBr5RenyIzR82Vw==
X-Gm-Gg: ASbGncuZ8uLDaj+ZAPvjqXPZw7g8jQmJ6c1CC9cxhtqWQrSAILDi8mYV+5aXBu9yAW8
	1pRkCPmR3ozu6c+J1yqq6g7sOUA7+/goe+BWLn3BFtVDbNrfc61ZqZvbwOtgfGHiD8XuZqGokUe
	VEUvJU6GVJ2Z95HIokNZgtRuACqd+w9dFDX5KJ/KcYmnurOgSJjftvc4pS+FNdF7ar/gTu+4iCe
	BoFEsNzqeDgjgHrfurIUgDAUKCK8rBFD8tY+Ti2dGBngnn40jOcljWy5r2JNXUib3LLn03skCR7
	PS94AEymH8HeOPQHJJbspjx23Npyl8hfy/4QvphLbqzWyHtq2zUQhTFsDYGOIcWk6rd7DlCmqu7
	QM2iz6l3H1DPZRQ7IvRpthC2w6Tt6NQkfmM4sZhPKArspDma0qXenYmxSb1KRf8eI9655ovud56
	mVMeBKxFLmleis1mAhN3nuNYq6bHVYfLyBFOWmoMf8H8idzBnZr5q7WVd6hKjaGfp07IC4g+yCb
	omF1SDLLyvxP+nYZlLEQHKjtv3+y6xEQ5jTwoNfHQzH2M26gj0PU9KJawsT
X-Google-Smtp-Source: AGHT+IE23ygUw1G6qfksLpO5n3+OUhfUG7uTHrVPDbfyBxBi9Rl3+jXpxrwjGQUt9QvW6I+tJFg1qA==
X-Received: by 2002:a05:6000:657:b0:42b:3907:a38b with SMTP id ffacd0b85a97d-42b3907a591mr2583100f8f.44.1762765773183;
        Mon, 10 Nov 2025 01:09:33 -0800 (PST)
Received: from ?IPV6:2003:d8:2f30:b00:cea9:dee:d607:41d? (p200300d82f300b00cea90deed607041d.dip0.t-ipconnect.de. [2003:d8:2f30:b00:cea9:dee:d607:41d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679c5dcsm23727969f8f.44.2025.11.10.01.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 01:09:32 -0800 (PST)
Message-ID: <690ce196-58cb-4252-ab72-967e1e1574cf@gmail.com>
Date: Mon, 10 Nov 2025 10:09:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory: restrict __GFP_ZEROTAGS to HW tagging
 architectures
To: Jan Polensky <japo@linux.ibm.com>, catalin.marinas@arm.com
Cc: akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, will@kernel.org
References: <20251031170133.280742-1-catalin.marinas@arm.com>
 <20251109003613.1461433-1-japo@linux.ibm.com>
From: "David Hildenbrand (Red Hat)" <davidhildenbrandkernel@gmail.com>
Content-Language: en-US
In-Reply-To: <20251109003613.1461433-1-japo@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_010935_693174_1E0C4132 
X-CRM114-Status: GOOD (  22.47  )
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

On 09.11.25 01:36, Jan Polensky wrote:
> The previous change added __GFP_ZEROTAGS when allocating the huge zero
> folio to ensure tag initialization for arm64 with MTE enabled. However,
> on s390 this flag is unnecessary and triggers a regression
> (observed as a crash during repeated 'dnf makecache').
> 
> Restrict the use of __GFP_ZEROTAGS to architectures that support
> hardware memory tagging (currently arm64 with MTE or KASAN HW tags).
> This avoids unintended side effects on other platforms.
> 
> Fixes: 1579227fe0f0 ("mm/huge_memory: initialise the tags of the huge zero folio")
> Link: https://lore.kernel.org/r/20251031170133.280742-1-catalin.marinas@arm.com
> Signed-off-by: Jan Polensky <japo@linux.ibm.com>
> ---
>   mm/huge_memory.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index aae283b00857..0c1794656d7a 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -209,14 +209,15 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
> 
>   static bool get_huge_zero_folio(void)
>   {
> +	gfp_t gfp = (GFP_TRANSHUGE | __GFP_ZERO) & ~__GFP_MOVABLE;
>   	struct folio *zero_folio;
>   retry:
>   	if (likely(atomic_inc_not_zero(&huge_zero_refcount)))
>   		return true;
> -
> -	zero_folio = folio_alloc((GFP_TRANSHUGE | __GFP_ZERO | __GFP_ZEROTAGS) &
> -				 ~__GFP_MOVABLE,
> -			HPAGE_PMD_ORDER);
> +#if IS_ENABLED(CONFIG_KASAN_HW_TAGS) || IS_ENABLED(CONFIG_ARM64_MTE)
> +	gfp |= __GFP_ZEROTAGS;
> +#endif

That looks like the wrong approach. If an architecture does not support
__GFP_ZEROTAGS it should not trigger anything. __GFP_ZEROTAGS should be ignored.

I think the problem is that post_alloc_hook() does

if (zero_tags) {
	/* Initialize both memory and memory tags. */
	for (i = 0; i != 1 << order; ++i)
		tag_clear_highpage(page + i);

	/* Take note that memory was initialized by the loop above. */
	init = false;
}

And tag_clear_highpage() is a NOP on other architectures.

Gah.

I wonder if the following would work:


diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
index 65db9349f9053..56b82e116cb79 100644
--- a/include/linux/gfp_types.h
+++ b/include/linux/gfp_types.h
@@ -47,7 +47,9 @@ enum {
         ___GFP_HARDWALL_BIT,
         ___GFP_THISNODE_BIT,
         ___GFP_ACCOUNT_BIT,
+#ifdef __HAVE_ARCH_TAG_CLEAR_HIGHPAGE
         ___GFP_ZEROTAGS_BIT,
+#endif
  #ifdef CONFIG_KASAN_HW_TAGS
         ___GFP_SKIP_ZERO_BIT,
         ___GFP_SKIP_KASAN_BIT,
@@ -85,7 +87,11 @@ enum {
  #define ___GFP_HARDWALL                BIT(___GFP_HARDWALL_BIT)
  #define ___GFP_THISNODE                BIT(___GFP_THISNODE_BIT)
  #define ___GFP_ACCOUNT         BIT(___GFP_ACCOUNT_BIT)
+#ifdef __HAVE_ARCH_TAG_CLEAR_HIGHPAGE
  #define ___GFP_ZEROTAGS                BIT(___GFP_ZEROTAGS_BIT)
+#else
+#define ___GFP_ZEROTAGS                0
+#endif
  #ifdef CONFIG_KASAN_HW_TAGS
  #define ___GFP_SKIP_ZERO       BIT(___GFP_SKIP_ZERO_BIT)
  #define ___GFP_SKIP_KASAN      BIT(___GFP_SKIP_KASAN_BIT)


Likely we'd have to make __HAVE_ARCH_TAG_CLEAR_HIGHPAGE a proper
kconfig option.


Then we could turn the default implementation of
tag_clear_highpage() into a BUILD_BUG.



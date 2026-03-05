Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E3AF47CB0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 19:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUfdbW7OxfhKiR73pKbZr0uWEl4+qEzhZGOpiUb5qj8=; b=vr55MXKppz6UZ0B6Q87Coojsme
	dLYM9SlBny+K0iHCP3cO3f/XMCXFPfCFum9SJmJY0KD01PTgoK2zbXrmj4IlAmJTfWdaisnE27Arl
	j2h6JoEIw/qIDMzKq2Hf3ykcqQ/eFD8JDPy9CE3XR49pmnFm5b+sVRNwP81U4vhrx77Y+OTtIu3JC
	GiqiDmIZGe79BusPlcjRY6lHacTr9VYs9dgLfao6qOmaHdfGG7qxAWuMhsOl+kA/jaqF//CSN0Doh
	sazFjD5YAsSHCo4CDMGovHdWsWLYyyUPME6dLFS8pUQf2AjobeknIvoopaRpkxbEjBt4nASzCYfVT
	vcrQAkEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyE1I-00000002QLu-031a;
	Thu, 05 Mar 2026 19:06:00 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyE19-00000002QLW-04ob
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 19:05:58 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-79852e01cd1so3780287b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 11:05:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772737549; cv=none;
        d=google.com; s=arc-20240605;
        b=fF8tvjbXnwrWYtAFSKTE9RMSvfSbCVEXIX7uMlUxAuXJAgonIxUsaJEKcQTmPgB7Vo
         m0sksu49TTtOb8GBQCeDhic5N91oiJCZaNPDo6D3TOeZ+4nNjI504/Vtpsa+p9vXjz1u
         dIPChqNx7X3sYXSRhpExbJ95xjTAg5/ruPzB3Qn76e8JpQZF/XHcK1v00PK+FAg2r/Do
         qiHvGsaiBW82fsWbRaMYNnxMoeofeo1PKUNvyOLJdgrAfundOwFlvsbd7/q+/qV0aqaE
         jXFwC2ev3FqAonND2tRY1wgevNG+ySNLt//4d2ysq2Oy0iviqfy9onDRFGMdMr7VGYAn
         ogFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=DUfdbW7OxfhKiR73pKbZr0uWEl4+qEzhZGOpiUb5qj8=;
        fh=GpltoK/FK30qtRwJ0FCc8UvXnYIAnXxKr+xz1DU9tZ8=;
        b=DluDLO5fpNM+k2BY7gWxgKgtPTtaI+QC6ls2JbH6uYGy0dfm4d15x7FatArQdE4tTU
         IIl6j2JZDPYCNelIjppzHcP+dQLLPp7a2wSRROC9vxhHzGn37j5MNHdVqhsXeHbneGMR
         4VQMoPYW+8/P1N51tAl+K6AdRI3QbRNQqBjUTG++zAhUASuS85mAlYhNyUViyhNTzeuK
         f/iNiDhzINIaIHHJrUX595gFE4dG/U/rIKICVO0xcIRjsduMoDXarFpfYT/kD3C+uXGj
         SDoWFY1C0CyX8LgDj4+DRHkt3wQmleEUs8dD+A/vTCtRRn3tCxMieu/ta2FjL3zEyo8I
         1D8A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772737549; x=1773342349; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DUfdbW7OxfhKiR73pKbZr0uWEl4+qEzhZGOpiUb5qj8=;
        b=KbkWMrll7PxCwKU1Kvrr9BCDywOOhiWMrmRcyATJsj/yBaXE9EKjWVcsxTSYZQ24P+
         6NEt6eZX/vNPxosmYVyhwAh5pX8L32RogLUshBT10n4Ca8czKHZbLgTy1QhMmaqj+UOC
         zXj3yg9p4+l4SYU+LoEOZLc117WOJjDi9RgMFxZmamzJ21X4zvCZkVQABZkUaKQOIxEs
         15gK2+MvXkCR4jJoQ/rqcKglhU6i0QB7Zq7GwxlxsW3umcJY4PrPl/wT3sjXDVFjXq9N
         uFs+aIWz4VqC7G+bAjhgHDIu/CgaLGHCgTEowaR4VTkmVHJmWWoU2PfTEs2PeO2/oJEQ
         eLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772737549; x=1773342349;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUfdbW7OxfhKiR73pKbZr0uWEl4+qEzhZGOpiUb5qj8=;
        b=N/HIX3+nuiwFSN87LaQoyELgzvj11yUoX35c53hwJx0TrbfQCDjtoCZxDlygfmDTQ0
         wAVkwAMSJj9UuH2XP0khdHesGi+yaP7vJJk05F9xsBKi0oTtwORlRwKzoOOM0v3jo0kD
         PYCvIpAbw59eX7rvcXdBET4KG2VRu0vOTt4Iv1ObxTwDrXE789zVxeXYie17uAEO3hNh
         1IUTLJNEZniS56aGNzLyNYg6j7Lv2XVfuXYKb7hdmZ0aqvrIQXYLBfw2eEw6S4k3NfYF
         z/M0lb5HUFdwcUdbXMzn6iUPHITR6xpsKZv1oWe2xQha41XDja4ASoOe3U0NL3Bb/OQl
         jfKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcRlVerGfnlqadWQ8QO4lFytYFLHv3xEB8SLkVyjTKBgEc1PYQl4aDUzJKhzSUzLw+gT7Ryf1tFklVZeslmaq3@lists.infradead.org
X-Gm-Message-State: AOJu0YxS0gVLWUs8/VywSDYxYZcYK+8oZel86j50cJrIVMNjVnEMvr/3
	c3puejKGQKZLl04IfZkWvA1xehAk5015WmvwoXyynvYVN4MUo6XMJ/wGFSyu9412RgiinczkdUp
	TDrOzkeYygLneQKyeaF28ZsKwM4qDESQ=
X-Gm-Gg: ATEYQzz9XEzddoCJkR6rm8QZ8g+3U28hIJV7L8UMF7foJ/RyTk8WlYo8hvaz5bBTLzq
	YStTV3DZMtjZATq8Np/9Dpywwc6Yl0cuwnpI+VAWcdR79ILRfMgBJGIie5KsAsD4Xh1p9Tt1fNP
	ch3xF5pd8qYp26e40233GfZGFBw32XhhwXfi9WD/EDYOYyNNKiucR3K56jpih0x8J36t8al9EiF
	p71pkvf8wzVAfUSEBsqf8O+PQejOICkVDRWv/fZBK5xudB3L10dEnJzzWipR/0jlPzvfIRFDWB+
	g+PqzQ==
X-Received: by 2002:a05:690c:e3ca:b0:798:1de:f894 with SMTP id
 00721157ae682-798c6c843e6mr49794737b3.4.1772737548885; Thu, 05 Mar 2026
 11:05:48 -0800 (PST)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Mar 2026 13:05:48 -0600
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Mar 2026 13:05:48 -0600
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <bd935d83b2fe3ddfedff052323a2b84e85061042.1770232424.git.m.wieczorretman@pm.me>
References: <cover.1770232424.git.m.wieczorretman@pm.me> <bd935d83b2fe3ddfedff052323a2b84e85061042.1770232424.git.m.wieczorretman@pm.me>
MIME-Version: 1.0
Date: Thu, 5 Mar 2026 13:05:48 -0600
X-Gm-Features: AaiRm51wLGHSZ9SaMaT4E-JYzg2vW23YHvcBblsyf-Lc9uQK9qhJFdTRUjtyx2g
Message-ID: <CAPAsAGxpHBqzppoKCrqvH0mfhEn6p0aEHR30ZifB3uv81v68EA@mail.gmail.com>
Subject: Re: [PATCH v10 01/13] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, workflows@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_110551_103439_971F990F 
X-CRM114-Status: GOOD (  19.82  )
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

Maciej Wieczor-Retman <m.wieczorretman@pm.me> writes:

> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -558,6 +558,13 @@ static inline bool kasan_arch_is_ready(void)	{ return true; }
>  #error kasan_arch_is_ready only works in KASAN generic outline mode!
>  #endif
>
> +#ifndef arch_kasan_non_canonical_hook
> +static inline bool arch_kasan_non_canonical_hook(unsigned long addr)
> +{
> +	return false;
> +}
> +#endif
> +
>  #if IS_ENABLED(CONFIG_KASAN_KUNIT_TEST)
>
>  void kasan_kunit_test_suite_start(void);
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index 62c01b4527eb..53152d148deb 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -642,10 +642,19 @@ void kasan_non_canonical_hook(unsigned long addr)
>  	const char *bug_type;
>
>  	/*
> -	 * All addresses that came as a result of the memory-to-shadow mapping
> -	 * (even for bogus pointers) must be >= KASAN_SHADOW_OFFSET.
> +	 * For Generic KASAN, kasan_mem_to_shadow() uses the logical right shift
> +	 * and never overflows with the chosen KASAN_SHADOW_OFFSET values. Thus,
> +	 * the possible shadow addresses (even for bogus pointers) belong to a
> +	 * single contiguous region that is the result of kasan_mem_to_shadow()
> +	 * applied to the whole address space.
>  	 */
> -	if (addr < KASAN_SHADOW_OFFSET)
> +	if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
> +		if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0ULL)) ||
> +		    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0ULL)))
> +			return;
> +	}
> +
> +	if (arch_kasan_non_canonical_hook(addr))
>  		return;
>

I've noticed that we currently classify bugs incorrectly in SW_TAGS
mode. I've sent the fix for it [1] :
 [1] https://lkml.kernel.org/r/20260305185659.20807-1-ryabinin.a.a@gmail.com

While at it, I was thinking whether we can make the logic above more
arch/mode agnotstic and without per-arch hooks, so I've ended up with
the following patch (it is on top of [1] fix).
I think it should work with any arch or mode and both with signed or
unsigned shifting.

diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index e804b1e1f886..1e4521b5ef14 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -640,12 +640,20 @@ void kasan_non_canonical_hook(unsigned long addr)
 {
 	unsigned long orig_addr, user_orig_addr;
 	const char *bug_type;
+	void *tagged_null = set_tag(NULL, KASAN_TAG_KERNEL);
+	void *tagged_addr = set_tag((void *)addr, KASAN_TAG_KERNEL);

 	/*
-	 * All addresses that came as a result of the memory-to-shadow mapping
-	 * (even for bogus pointers) must be >= KASAN_SHADOW_OFFSET.
+	 * Filter out addresses that cannot be shadow memory accesses generated
+	 * by the compiler.
+	 *
+	 * In SW_TAGS mode, when computing a shadow address, the compiler always
+	 * sets the kernel tag (some top bits) on the pointer *before* computing
+	 * the memory-to-shadow mapping. As a result, valid shadow addresses
+	 * are derived from tagged kernel pointers.
 	 */
-	if (addr < KASAN_SHADOW_OFFSET)
+	if (tagged_addr < kasan_mem_to_shadow(tagged_null) ||
+	    tagged_addr > kasan_mem_to_shadow((void *)(~0ULL)))
 		return;

 	orig_addr = (unsigned long)kasan_shadow_to_mem((void *)addr);
@@ -670,7 +678,7 @@ void kasan_non_canonical_hook(unsigned long addr)
 	} else if (user_orig_addr < TASK_SIZE) {
 		bug_type = "probably user-memory-access";
 		orig_addr = user_orig_addr;
-	} else if (addr_in_shadow((void *)addr))
+	} else if (addr_in_shadow(tagged_addr))
 		bug_type = "probably wild-memory-access";
 	else
 		bug_type = "maybe wild-memory-access";
-- 
2.52.0


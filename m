Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12631CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWwT9TpVhYF/K0z+rdL3pthvZP+Xb5uL2Tmv/pNJ18E=; b=gTolWfyailIy+yJ8opaFlhTSwf
	U52UlOJDI5K/l2vTO/T7yuqr6kR96On7J2fCv0jcRy1vrCg4T/kzBg0E59DwOINr3SsjRdB/DrQYi
	0mzArSyEIlxFdvXRXWJ3sRov00hN0E5h9TzfJycg4J1NrxVlg+0yDPUymTePTWrYfOWXqFmOxbv/E
	gh3xwNgYMa8Ks/eD9q/ze5ngQxEQARQ1WeAP7ufIXEan6f4osRonqK8RVQgRdE027HtfE6tdlYxex
	JekLl/EPAsDc5Lg7T9txd8ACYk9B8AJmpOME/BfcEkmKGzao+tmjiLvxqp1ySenpxD1oj9OZhF6vV
	Z4fk5Kgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC3W-0000000BnKR-3Dlx;
	Sat, 13 Jun 2026 00:16:58 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC3U-0000000BnK2-3XHf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:16:57 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1380104f31eso3243c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781309815; x=1781914615; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AWwT9TpVhYF/K0z+rdL3pthvZP+Xb5uL2Tmv/pNJ18E=;
        b=WXgoUSLTmPUBYfVfpBPMFnSvTl5DQWv86r892rCJKKXL4ghePBLOLT6/m7vFs0YNx8
         zPcbyuGfV4oKaM9SZ9PG3ME1NVOpsLpK/uF49V0qgy+Sh38069pEYvbbPRc1QZQiubcn
         pEiUwZpBbsbBAXJK7iBVH1SaXKB7Zmrov3Ti2nQKrrZVQ0Oi0oXFR6WcK4VEJ5+B/c8e
         HxEcrVLD+Jn0F2EYcOBTIox+5ZBrvvSHgF854f2WzuF426EufZHQkq73bVtxa9D6n8dE
         9FCQCvcsTUtwtiqddP5htPBfq5JL90zusF2HAbnGGFdR5ddpZbLLupG/WjXTifdw2xQW
         M/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781309815; x=1781914615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWwT9TpVhYF/K0z+rdL3pthvZP+Xb5uL2Tmv/pNJ18E=;
        b=MIf9K7HKEi+c2e3IT5p8u/8xBCuTnUhr2gLF/GypnCuai6yOit1ItvCppuymw2820R
         akxw3cTE/rdu3YSRrZqW5E0lQ3b0Xv0Lg7fZoxl7PcKHoM/NqCFu3s8dNtpWVPZwUMic
         muc03hSn8yoYJirmlvgUo7nFydt6qVXijOwQ1c+zfzscBOdMYZ4WMAqTe4icDt3UpUD9
         TKKGi02NHm1oPiMYtGuY64V56x/cUEIMwOcVCtUl0f/4WN0pp+7ssp/rmmiaPlYx6bKo
         BROljMsJPJNTtR6cbWAzgsT61e3I4lN84A4RNqRH0/RHHQcRyMgtiRgrwGon/K08JabO
         f3tg==
X-Forwarded-Encrypted: i=1; AFNElJ+m1ECXtuboSSOPTOrogbOs1afBCqSvG0sbrOdZodREJICFL7hMKh0ChysDCqTH/tGeFPXqV166RFmD3dXfkrQY@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy2PsOxf3xdDerm6iLrtHn6IIa4+jHK/TR3X9WRVAo809wXpyC
	8mESgOfBkn4S7GweWrZV0U0VD/yGHxhfaeV4lRrHkBxoeuSRD0S65hjVBipHy1geCA==
X-Gm-Gg: Acq92OHlJKXLl65u2vNFuzqslSNRXBSmdd1KQh986bXuxqQKkrDNG1TK3QEgXj6TjuM
	hZxsW0PUL9d9sAAWSgxTQBfN/nUZY0tjYrZtPXlNVHEyQKw6mpGnBv1lulTIAekBeGcaAtkDQTt
	yZgtHYEGDbbqq0XIrkGLRP5CZ1R46qseaqa2WwjJp+BEo+bhG9i7/nHZmc7lRYjPJ9H0P17/xtI
	ZHjxExyu68appKtvRIzzR5YdjuSP+MJv0KSY0x4tODO9+7Gsh75ndETesQS0QmducNlQUNe8K/M
	arqYGBuHkv/OpUrBEVObcPprTnl+6Xn0bUeWxua+NgOeKOQqeXpELoE41ATK/1bXF/IcZPdlnXK
	sVG0nxj3rkhPJRzp63FevsBe7aJlc/IafuONLFWyq6uoR+WiB55mJjr5vtyShpal+OGbwh/AzZw
	2PyZFQwXqBJKr7QSD9v9eyfmDZKriYLTRaNgWEj5zC+VG5W7aatgXAhgDEXLAt1ZO8uRtmgUn0L
	JQ=
X-Received: by 2002:a05:7022:f8c:b0:138:888:32db with SMTP id a92af1059eb24-138fe5a1d90mr28525c88.27.1781309813946;
        Fri, 12 Jun 2026 17:16:53 -0700 (PDT)
Received: from google.com ([2a00:79e0:2e51:8:e362:1a25:b90f:e3ee])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ea43b80sm5190375eec.21.2026.06.12.17.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 17:16:53 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:16:47 -0700
From: Isaac Manjarres <isaacmanjarres@google.com>
To: Dev Jain <dev.jain@arm.com>
Cc: ryabinin.a.a@gmail.com, akpm@linux-foundation.org, corbet@lwn.net,
	glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
	vincenzo.frascino@arm.com, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com, anshuman.khandual@arm.com,
	kaleshsingh@google.com, 21cnbao@gmail.com, david@kernel.org,
	will@kernel.org, catalin.marinas@arm.com
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
Message-ID: <aiyhb2XwMMJE3st7@google.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612044425.763060-1-dev.jain@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_171656_888145_1E71E69D 
X-CRM114-Status: GOOD (  19.11  )
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

On Fri, Jun 12, 2026 at 04:44:22AM +0000, Dev Jain wrote:
> Introduce a boot option to tag only at allocation time of the objects. This
> reduces KASAN MTE overhead, the tradeoff being reduced ability of
> catching bugs.
> 
> Now, when a memory object will be freed, it will retain the random tag it
> had at allocation time. This compromises on catching UAF bugs, till the
> time the object is not reallocated, at which point it will have a new
> random tag.
> 
> Hence, not catching "use-after-free-before-reallocation" and not catching
> "double-free" will be the compromise for reduced KASAN overhead.
> 
> This is an RFC because we are not clear about the performance benefit.
> 
> Android folks, please help with testing!
> 
> ---
> Applies on Linus master (9716c086c8e8).
> 
> Dev Jain (2):
>   kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
>   kasan: hw_tags: Add boot option to elide free time poisoning
> 
>  Documentation/dev-tools/kasan.rst |  4 +++
>  mm/kasan/hw_tags.c                | 45 +++++++++++++++++++++++++++++--
>  mm/kasan/kasan.h                  | 23 +++++++++++++++-
>  3 files changed, 69 insertions(+), 3 deletions(-)
> 
> -- 
> 2.43.0

I tested out this series on one of our devices that has MTE support,
and didn't see any functional issues.

One thing I did notice though, and it's independent of this patch, is
that the vmalloc_oob is failing, but that happens even if these patches
aren't present.

Thanks,
Isaac


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979FACA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIqgkGlhxszd5dv+EEyL+ssQRqACdJfeCT3IkVeMdqo=; b=SftlvB1rgibZxJxGeXq11VZreB
	rskXcKP5/UP2t3HpJT1W086l5gDNfPLBUfA6tRaCu33XcGikQRJsYGrN+AVvvRebBR/atw72ct3fv
	Al2N2x/L2ups/JWKfIBZdc/duQrt9BgWlqbvo1oxRaQQfqiBIGsuH9CK2Hq4dV+/v0WP5s3kTgBCX
	GVhNTrwvGa/4Xm3kQY3SA4YQl+LU5PhB2AQa3SCvjV80J2MHxLb8LvTE0ly/aUPZbO4LYmyvxtRJB
	2glSFQvXrADdEmpEw4YWVMoh2Mm4drM3AB6mZL6CQNf0VgXNlSIdBEKbjg6Jvu/0wdHbpxUa9UxuD
	SqlfmFyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFFw-0000000EY0s-0n9Z;
	Tue, 02 Sep 2025 00:52:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utA7a-0000000DeDH-1iNz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 19:23:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE35140B99;
	Mon,  1 Sep 2025 19:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BD1C4CEF0;
	Mon,  1 Sep 2025 19:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1756754597;
	bh=/4asbQkP1eDqEbveKkGpr0ywUBl4RSN7gR/XJ53xGVw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=waO5M7TU9BYoRGjtorAnNJETXm72HFsA3Y0tFfhW85iW307Pc3Fq86bh7keOgjgLE
	 ktpXe34fCWJ/hIBD3X4zZpOX2irMQA3Ga0Vr8rilIjKxKv0uR7kEYqCu1sIk7u49Cu
	 IOOyVz6paX9t7Kdqkgl01NvAx2e8rkGiaTJ3GKyI=
Date: Mon, 1 Sep 2025 12:23:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, vincenzo.frascino@arm.com, corbet@lwn.net,
 catalin.marinas@arm.com, will@kernel.org, scott@os.amperecomputing.com,
 jhubbard@nvidia.com, pankaj.gupta@amd.com, leitao@debian.org,
 kaleshsingh@google.com, maz@kernel.org, broonie@kernel.org,
 oliver.upton@linux.dev, james.morse@arm.com, ardb@kernel.org,
 hardevsinh.palaniya@siliconsignals.io, david@redhat.com,
 yang@os.amperecomputing.com, kasan-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v6 1/2] kasan/hw-tags: introduce kasan.write_only option
Message-Id: <20250901122316.6b7d8d7fdcf03bdb2aa4960a@linux-foundation.org>
In-Reply-To: <20250901104623.402172-2-yeoreum.yun@arm.com>
References: <20250901104623.402172-1-yeoreum.yun@arm.com>
	<20250901104623.402172-2-yeoreum.yun@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_122318_490709_131B7C31 
X-CRM114-Status: GOOD (  16.16  )
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

On Mon,  1 Sep 2025 11:46:22 +0100 Yeoreum Yun <yeoreum.yun@arm.com> wrote:

> Since Armv8.9, FEATURE_MTE_STORE_ONLY feature is introduced to restrict
> raise of tag check fault on store operation only.
> Introcude KASAN write only mode based on this feature.
> 
> KASAN write only mode restricts KASAN checks operation for write only and
> omits the checks for fetch/read operations when accessing memory.
> So it might be used not only debugging enviroment but also normal
> enviroment to check memory safty.
> 
> This features can be controlled with "kasan.write_only" arguments.
> When "kasan.write_only=on", KASAN checks write operation only otherwise
> KASAN checks all operations.
> 
> This changes the MTE_STORE_ONLY feature as BOOT_CPU_FEATURE like
> ARM64_MTE_ASYMM so that makes it initialise in kasan_init_hw_tags()
> with other function together.
> 
> ...
>
>  
> -	pr_info("KernelAddressSanitizer initialized (hw-tags, mode=%s, vmalloc=%s, stacktrace=%s)\n",
> +	pr_info("KernelAddressSanitizer initialized (hw-tags, mode=%s, vmalloc=%s, stacktrace=%s, write_only=%s\n",
>  		kasan_mode_info(),

This lost the closing ")" in the printk control string.  I fixed that
up while resolving rejects.



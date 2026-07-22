Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3949C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Upjmrh5JJYyxIf1oGA8lLlYd9DJQLFwgC7+8SiJQqeY=; b=J5hGiwbwweCUzjhG7h7NTXtNkT
	sx+L/MtqEgoWhDFjfwUXkeE01SONTYtZn1FG8imjrxnBWeQ1el/zrZuyKE64D7Uc/xY2qi98dDBLX
	NFFejWvPDQfZvPQMvzY2YFiUVMJKMM09bPi0XJvgpTNbm5IyK+iq3a7QcULGDZfTccplaHr0KXV5A
	O5LHE0zLZ+8XJXhV639Sy5cGMe7jCXdgwY3lX00GpbPYZGz9OXwA2qpgWY2UUXMftOSQhONQOdnuM
	WOJIUgtXiU+ZJbKIxQiAiSg0vZCDPFbihQBw3YhCxUFDyqIoASY35rzs6wb+/qDze6KOTzBPs7Nhb
	C9T5x00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYhM-0000000C7qt-35Qn;
	Wed, 22 Jul 2026 15:17:28 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYhK-0000000C7q2-35x0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 15:17:27 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so1215955466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 08:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784733444; x=1785338244; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Upjmrh5JJYyxIf1oGA8lLlYd9DJQLFwgC7+8SiJQqeY=;
        b=LSCJRIofq569MEKPW1Bthg1rqQGJUt9g49lgSqc+DSylZ9VSdSfvWhbNrvfESM8Epe
         NDScLJ7uQAJ/me5M/cgaTbgFvpJX2rPTlPOaXO0OP6jk6h+J7WBUFmjxnd3RPYFyLWQE
         zdoVxbyA3UcbQkIByWIM/XWEw0P6WsuZJTGWmj3nBXE6o2J6Z3kmrEnTKx5xmIc8eccy
         rMBu+M6xOD/pXr7nZLmvgd/95pErq99SyNdQQa5SrOxHPbLe9G/fISLF8kNO6tNpJdBr
         tNNu7x+05GN45IfM3FWxgwNCDFoO9Hlnb/xI4ERhs705lCCxgDBiiP5Q3g1+RHSi3VYS
         dgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784733444; x=1785338244;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Upjmrh5JJYyxIf1oGA8lLlYd9DJQLFwgC7+8SiJQqeY=;
        b=DtRbZms3G4H9azzW9BpQBVGKzVQ+qD2hgJ+PHt5hZVHKU//vE3BDzzkeUS1W9vrlVO
         WBHRIGW2PXvWMCdQrfcksJ29ZvKzfiQfB+DlBNTvZ9szgYrEG94dFFIlj8ehD3NIyMI6
         zYHa+iZxcvLWfj2oXpCRmCq4/D0aV6545TJMFsDMMtS1/hdvXZFYnnkx+IUiKVCQdoaB
         x5IbodQEnIXppaoHaLFy9D9p/Pb3j7wYh2NczXGblTLXq/qqaD1iHrxNvXIQT0yBKmhg
         zoLTetJMsOM1TnUzs055v9KrAXF0aiswYFMyvwZKDCLM9cYb9z1EfGrb4YWBAhy9xEMB
         2oDw==
X-Forwarded-Encrypted: i=1; AHgh+RrtYtzpfBq8Fyxfv8TcNGzWTg+G+pfffrJszGgWWETcC/sm3eGiMD1EkCzu4l3kjG2D36n5+7MIXZ6jZIOwnpEH@lists.infradead.org
X-Gm-Message-State: AOJu0YxF4PHkMQ9sfK2dgsYtLEfwf3j47fevFAnRjWek2B0Rq0p6P20U
	HLJ6DKYbV4Ld/2RUhP/026GA4i9BFsV9iOZpuhq1k1oeCny1EW6Kgq1494Yc3rqNkA==
X-Gm-Gg: AR+sD11BhVK0mWbx8E5H3phWxNwMEs/wihqIQoXZdvMvudWlNOK6nfMUNxdQ/hcuZhF
	BPp3/MYQFgZS6c7iBqbPnxCBcfGLsh10hz2vge4J/G7sJ/Wg7Dh1myTbNEu58MGu/8RS3bBVeru
	dQjqB6mFXc0fZISYCfmk6bgHSvTe3uxkc+1zWNjk3nGtDq6pM9Aok82pWbmxwj15Q/jG+DSxHxH
	7e0M6uQ+3Djndv4MPj8beCui1PD7Ar5K7p1o0zh/mfhvjV3dCc7lPUYQSQlzN4z7K5JY8pcC0Am
	pyFq8GcoVF/7bz+3+OETmq07Bwj14qJgajMi+kbcPovtrLJtRUqDOZMbsM1ZS0HovyDYcHtXWZC
	3ItY6D+6SHY5c5g0WdGiFHeBcfSAqNXH9TLMSK0Rrs8Yue0Vn1mUu075CGVYC7krZg6tEfG9sVY
	W4sYKOM4tLvLPCDOLE0Uo5RgxODGiBrY/t9ikW0HhFp2D9
X-Received: by 2002:a17:907:d5a4:b0:c16:a484:90df with SMTP id a640c23a62f3a-c16b485513emr815970066b.35.1784733443140;
        Wed, 22 Jul 2026 08:17:23 -0700 (PDT)
Received: from google.com (152.118.155.104.bc.googleusercontent.com. [104.155.118.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a78229sm131383566b.1.2026.07.22.08.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 08:17:22 -0700 (PDT)
Date: Wed, 22 Jul 2026 15:17:19 +0000
From: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: linux-mm@kvack.org, Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <jackmanb@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	x86@kernel.org, Dave Hansen <dave.hansen@intel.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 00/18] arch, mm: create a generic
 set_memory/change_page_attr core
Message-ID: <amDe_3KFBc9CcIbo@google.com>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_081726_801279_01B5D19E 
X-CRM114-Status: GOOD (  11.63  )
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

On Tue, Jul 21, 2026 at 07:23:23PM +0300, Mike Rapoport (Microsoft) wrote:

Hi Mike,

>Once this settles, the next step I'm planning is to convert arm64. This
>would be much more involved than loongarch and riscv together, so I
>didn't even aspire to include arm64 in the first RFC. That said, I have
>a very ugly arm64 prototype that rewrites arch/arm64/pageattr.c to use
>the generic CPA infrastructure and replaces the existing implementation
>of page table splits for systems that support bbml2. But there's a lot
>of yak shaving there to get from a PoC to actual patches.

Could you share your PoC for ARM64. I can help you with that and align my 
execmem rox cache for ARM64  changes to the desired shape of this API.    

Best regards,
Adrian


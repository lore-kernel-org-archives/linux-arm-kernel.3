Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF80C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HctaYC25xmi723t9mpPbmCLQP3IBod29aBYdTrLa6xA=; b=m7B+QI9sJXJdfnN/dk7r+w+d9u
	0r57qiLothLj37xnGHIuLLcAlq5t/RNd+kyZTsf8jhE7C4f7793/wDYQI6Q/1gTh2Qlx/OeBvrHU2
	DCA3J1WkK93J0oirPmZnGx4pLvQOfyy0H79svRg6pmS1tV8NNKejZW7hq9HiDYKud5YoqgedtoOTW
	G8bVDuCUw8MjKpMij4PZOTCSynquwemhCQ0MChtG+sIlmFW7EO0Y2j9L2v9372cxkncyrO8MtavFb
	ic1Xg1vXocn3I+5cGpLBC79lSs1GO2XXCZbcY9S9HHKqfIOKbIYCUgUOwR9sSkz6OM1ZVfYOiY90c
	tK4DqEdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZm1-0000000BUyy-1a2X;
	Tue, 14 Jul 2026 09:49:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZm0-0000000BUyh-38CQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:49:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 53BB8417F4;
	Tue, 14 Jul 2026 09:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F87B1F000E9;
	Tue, 14 Jul 2026 09:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784022595;
	bh=HctaYC25xmi723t9mpPbmCLQP3IBod29aBYdTrLa6xA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ZVZmAc6QGPyLQjp4Kd7I0ZXRjuVkK/fsGkjzg7Dr9mX68oMKo9p3bz+tPlc9xds1y
	 UL5BGrb2JOckIQ3juGIhe7VJK+QkjeM6nnsuJYMzZXYtJXKNQ99wMk/eiz7pupxkAQ
	 jIWNA6wpCcUeZdhpNzb3kZeMeNa6FQp7AsWpRzMLvYH+0NX5EVmxxAD3VIaqycp5n/
	 fR8iCRtltXt5S3iLSXOf/lOTBdD8B0DVWq/fclNd47VRzfLxNulbsMTZnWwsk9qtQI
	 MksoMVOSqDFAVPPTUlB7Tza6Oua913SFqFJWY+RR5/0oikgUyWkmQy2X++jb9LUBXd
	 pI9mgDHReg4Zw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH mm-hotfixes v2 3/4] mm/ptdump: always stabilise against
 page table freeing using init_mm
From: Lorenzo Stoakes <ljs@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, David Carlier <devnexen@gmail.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
In-Reply-To: <alUdUKk0zGmskSib@thinkstation>
References: <20260712-series-vmap-race-fix-v2-0-ad134cc3a12a@kernel.org>
 <20260712-series-vmap-race-fix-v2-3-ad134cc3a12a@kernel.org>
 <alUdUKk0zGmskSib@thinkstation>
Date: Tue, 14 Jul 2026 10:49:39 +0100
Message-Id: <178402257936.69739.4642059153515341814.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1203; i=ljs@kernel.org;
 h=from:subject:message-id; bh=ZepVuhzW21/hUCaWiKuOK4e1luh7TWvi44wNV50RL3I=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLLC2Exfud25crSsetf8mCsrnNnW9nV/7tLPT5/09cimd
 V/3ln6W6ChlYRDjYpAVU2R5/kV8f5BI2LzOC/5uMHNYmUCGMHBxCsBEfG8w/Heo1PuZ62TUtlIh
 9PHGKMH9iscZlofvkWJ9l3JPsbM15D4jw7rfdXP/RV1/G7ynQ8DgSIePeCH/0w8C349m1Jy4KKe
 pxQsA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

On 2026-07-13 18:19 +0100, Kiryl Shutsemau wrote:
> On Sun, Jul 12, 2026 at 11:42:26AM +0100, Lorenzo Stoakes wrote:
> > x86 and arm64 invoke ptdump_walk_pgd() with non-init_mm mm whilst still
> > walking kernel page table ranges.
>
> The code looks good to me.

Thanks!

>
> Same comment as on patch 1 about the commit message structure, only
> more so: the race itself is never actually stated -- that these walks
> hold only the walked mm's lock, while the freeing exclusion built by
> patches 1 and 2 hangs off the init_mm lock. The fact that makes it
> possible (x86 shares kernel pgd entries with every mm) is hidden in a
> parenthesis. And the last three paragraphs read like v2 changelog
> rather than commit message material.

OK, will reword.

>
> > We take this after mmap write locking the non-init_mm mm. Nothing acquires
> > the init_mm lock first before locking an arbitrary mm, so no deadlock is
> > possible.
>
> Do we want to document this locking order somewhere?

I guess Documentation/mm/process_addrs.rst is the best place, I'll send that as
a follow-up separately. todo++; :)

>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov
>

Thanks, Lorenzo



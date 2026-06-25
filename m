Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C127ECDB466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 08:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wt19WGGroORa/wioMj0fJmzojKxoKhuinoNaN6kTkuY=; b=aLrR1t8W6fHB7nYvwE3qLa/xUp
	d927Hbi5SV0MWy48naThZ1UAXU0H5RfH3w1sEhJcu4E3tmlWLbyJnPW2bnFhWl2StGCj+vIfq+TrC
	j0yiqVnO5xWILatgHppsaHdML6kdDuE568vV6q1uSKYHMEVMFJvVUVdFBBfeE2tTCA1mQZTSPccnb
	aIyF8HB517wfCGeNk6t+pJzJJQSLCkKFzXTQX9NpKlF4kk63prmSF3n5KPcroT4ujsP77uuLNTkdH
	KDIH+OxR3/QxcW6WgtLFY+Il81ON1j5HX7n3AvawdTKRtzKONvrJgqKLPRT8w3bU1ksan66wPVtTd
	2GtZdXPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcfjk-00000008qbm-0Hac;
	Thu, 25 Jun 2026 08:47:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcfji-00000008qbW-1rDt;
	Thu, 25 Jun 2026 08:47:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B7C9940BDA;
	Thu, 25 Jun 2026 08:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501611F00A3A;
	Thu, 25 Jun 2026 08:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782377221;
	bh=Wt19WGGroORa/wioMj0fJmzojKxoKhuinoNaN6kTkuY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=du4wyvFcpe6h8cJqJ8+wwVFQIsPj3+N4yyrOgN/qduox/8HRpcOdji6jhccFrjrVm
	 fe8cWu0TwoYUMUMvAnwH5ORIIJS4JfTppMLZ25rxdQvGMNgIkYe5fdXI5cjcxjOFOi
	 pIVScnjWjkimeuSoBvuRunDdMYJRg2MNpvUeqdBcAvWj4Ajcj47cEbqJxmHXOXTbrq
	 IEEjEz95TyfdFohXIjCZhgHI2OAqNKZ+Zb8mHmPCjMMrPDDcqgvM3Sqf2cNQbIJnHF
	 SHC6Oq2q9FY3gbYFLnSDpvOpnDb4GmBPDmTyTMv6ojjv53h+5tNtueC1cRFQtHQxHf
	 YQHHT5H1S8rpg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/6] treewide: remove unnecessary invalid range checks
 in memblock iteration loops
From: Mike Rapoport <rppt@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Will Deacon <will@kernel.org>, Alexander Potapenko <glider@google.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrey Konovalov <andreyknvl@gmail.com>, 
 David Hildenbrand <david@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20260621145919.1453-1-ekffu200098@gmail.com>
References: <20260621145919.1453-1-ekffu200098@gmail.com>
Date: Thu, 25 Jun 2026 11:46:51 +0300
Message-Id: <178237721125.146960.11801589845266315987.b4-review@b4>
X-Mailer: b4 0.15.2
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

On Sun, 21 Jun 2026 23:59:10 +0900, Sang-Heon Jeon <ekffu200098@gmail.com> wrote:
> treewide: remove unnecessary invalid range checks in memblock iteration loops
> 
> The memblock API guarantees that for_each_mem_range() and
> for_each_mem_pfn_range() never return an invalid range, meaning start is
> always less than end.
> 
> Several memblock callers still have unnecessary invalid range checks in
> their loop bodies, so remove them.
> 
> [...]

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.



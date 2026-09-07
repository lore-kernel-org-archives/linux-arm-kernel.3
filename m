Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4CCC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 10:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3C3uRSlXJAvrU8CA+JkknXP4ShUi36cTXYIJp4O8Nc=; b=UlYanvgqVeCJMjjZfifWbXeVoT
	+VmS9hM1YY0WVTDdmL0U88SPi47p7NuRVDZ+VaAN/J9zLPHIg1rQA6Dza48A+FJ/A5zPp+2pTdujq
	NZWQgtK06I+J4QJk74tBFfeedjhKs+FZeMVVOgo11pzsI595Kstm4+FAMpzyiN3JPS0/UjHgRnl+e
	22RQQlGqxoRy0HuWilB2NU0Wk1fcaLaffcbkKTfmNj6R4sXPpFupgmPVAwUmrCJt7iLRpWDOCdUuW
	KZa2yf0yGD485AG/Zlb12pHGqCcyj7n5xjMDFpycblk8TZzuqofYQSwoMKvTEFUvO4PZIQjFotGln
	S9qpu6Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Wzk-00000006Zo7-4A1Q;
	Mon, 07 Sep 2026 10:54:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Wzh-00000006Zn1-3EC7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 10:54:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8628541476;
	Mon,  7 Sep 2026 10:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B031F00A3A;
	Mon,  7 Sep 2026 10:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788778473;
	bh=V3C3uRSlXJAvrU8CA+JkknXP4ShUi36cTXYIJp4O8Nc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ZHbFXHXNQiOKEVicWGF68AIi3xG2x4I+cHsg8VqPlCzvv+nZFOAz8sbazJ8oBLnFB
	 ML9MVBegMDsk51RXbXu3JMCcuJZb/ohTBVMqsW0habWrf9MSzwxJjEk/IISSR3SM5+
	 wERS3KXe9I+Qam1+E7DPID9Er5aiyYuvlBxrpSI+Zcn1xmDosCkHdzrLvOXN6De63G
	 qPtKHZuyqCKKa8ls2pYhHzjwY+lSjpLLKfwushmouce8WscmOiCFbQECE/0utjH1dc
	 kk45mPSMKCcteX8yeA4ZmqvmVj241Gezp5GV3cX2trb7b17udLgCy++itmSvBAvbLI
	 BI9MJeJODNKhw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC v9 11/25] mm: kpkeys: Introduce
 kpkeys_hardened_pgtables feature
From: Mike Rapoport <rppt@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 =?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mm@kvack.org, x86@kernel.org, Ira Weiny <iweiny@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
In-Reply-To: <20260818-kpkeys-v9-11-743ad31b2c8f@arm.com>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
 <20260818-kpkeys-v9-11-743ad31b2c8f@arm.com>
Date: Mon, 07 Sep 2026 13:54:14 +0300
Message-Id: <178877845406.3691569.11239630051799000768.b4-review@b4>
X-Mailer: b4 0.17-dev
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

Hi Kevin,

> kpkeys_hardened_pgtables is a hardening feature based on kpkeys. It
> aims to prevent the corruption of page tables by: 1. mapping all
> page table pages, both kernel and user, with a privileged pkey
> (KPKEYS_PKEY_PGTABLES), and 2. granting write access to that pkey
> only when running at in a privileged kpkeys context
> (KPKEYS_CTX_PGTABLES). This patch introduces basic infrastructure;
> the implementation of both aspects will follow.
> 
> The feature is exposed as CONFIG_KPKEYS_HARDENED_PGTABLES; it
> requires explicit architecture opt-in by selecting
> ARCH_HAS_KPKEYS_HARDENED_PGTABLES, since much of the page table
> handling is arch-specific.
> 
> Because this feature relies on kpkeys being supported and modifies
> attributes of the linear map, it must be inactive on boot.
> kpkeys_hardened_pgtables_init() enables it by toggling a static key;
> this function must be called by supported architectures in
> mem_init(), before any call to pagetable_alloc() is made.

Presuming other architecures will use kpkeys framework it's better to
call kpkeys_hardened_pgtables_init() from mm_core_init() rather than
stick into each arch's mem_init().

-- 
Sincerely yours,
Mike.



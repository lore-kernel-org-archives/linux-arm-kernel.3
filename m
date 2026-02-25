Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AEDEFD206
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hcGrB8f3LFV3yEVggniwkqkX4Jmt/LlWOAR6G9rqjM=; b=ZCon7ZMk5aKS/04J/JH7zvbwIB
	xUTczYWFCwAIzFTkVQdEIKXLiyWSi7xplUVuY9uCXoPqa6/NO0vmvkmWnsm2Ph6eFiBlr7IAG6j9+
	tBfuEYUQLzobeVxjnJvBUrTJcu/RzDAzU4JjwYyvnZ6EGlKX5hPvS8AZm5FHxwhhNZPXDak3rY3be
	YmsAj8gEkUiyRs09AQaDWeIqUK0+q1/RHPWGyg91iAkD6ggfaABmNEwJyasNB14xIpenajz+/nM9w
	uP0R1o2xK8BWzweD52Qe1ouSoapDyrRzkwnvLZqj/xc6eNgQDQH14dz4C8gwBgNzyPl1HlqkckXFQ
	w1wbY+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9x3-00000003TAV-3RPb;
	Wed, 25 Feb 2026 08:08:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9wu-00000003T8W-438E;
	Wed, 25 Feb 2026 08:08:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0A4A165C;
	Wed, 25 Feb 2026 00:08:40 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDAFD3F59E;
	Wed, 25 Feb 2026 00:08:43 -0800 (PST)
Date: Wed, 25 Feb 2026 08:08:41 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Jesse Huang <jesse.huang@sifive.com>,
	valentin.haudiquet@canonical.com, heinrich.schuchardt@canonical.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH 0/5] mm: arch/shstk: Common shadow stack mapping helper
 and VM_NOHUGEPAGE
Message-ID: <aZ6uCceePh73wcMP@arm.com>
References: <20260224175800.2500729-1-catalin.marinas@arm.com>
 <aZ489QDHxEZfLydn@debug.ba.rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ489QDHxEZfLydn@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_000849_043213_FE4A2A47 
X-CRM114-Status: GOOD (  11.55  )
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

Hi Deepak,

On Tue, Feb 24, 2026 at 04:06:13PM -0800, Deepak Gupta wrote:
> On Tue, Feb 24, 2026 at 05:57:52PM +0000, Catalin Marinas wrote:
> > arm64, riscv and x86 all implement shadow stack support and use a
> > similar pattern for mapping the user shadow stack (originally cloned
> > from x86). Extract this common pattern into a shared helper -
> > vm_mmap_shadow_stack().
[...]
> FWIW, I applied your patches on v7.0-rc1 and risc-v cfi kselftest passes
[...]
> So you can tag tested by for risc-v.

That's great, thanks!

-- 
Catalin


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550BCCA0EEC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 20:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aFcE/n+jYq3wIvYWDgDgimCNZtY5B4eYaY7TUpTtR0=; b=0PyDy2INsmw1KFR2JE+Lj7yWSL
	Kci/iwDJ71zdAi9w8RgCicPROcYux7wtFzuVflBndDGqtayqKB1929i6trN0AsAiiQgRzLnSlotqI
	XpmZ+tXuVVIEtIjohUt+tpAbJN5AzHbaPnw+b5Q78jmMPxQVkolrdsPbJzHeVk0YoxFa71bNmDATK
	yzv5vAve1N29nToTy7+lDi0lQ7uUiTgH2deXgSTQFG+xUZT8YVp0gn2gqRZmjSjA9y4VCuwXBQBKH
	/Ef3wsQ6NaHQWyauVl6RaGW0cymQ9b0QFufZAxEEWWTklqYE+F1R4T4vFv/hQAtrtBksvj2BHlC9w
	n3lPnUbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0t6-00000003Q3F-20gl;
	Fri, 15 Aug 2025 20:18:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umyU8-00000003A2D-2BYo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 17:45:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A08143EDA;
	Fri, 15 Aug 2025 17:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A235BC4CEF1;
	Fri, 15 Aug 2025 17:44:55 +0000 (UTC)
Date: Fri, 15 Aug 2025 18:44:53 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
	dvyukov@google.com, vincenzo.frascino@arm.com, corbet@lwn.net,
	will@kernel.org, akpm@linux-foundation.org,
	scott@os.amperecomputing.com, jhubbard@nvidia.com,
	pankaj.gupta@amd.com, leitao@debian.org, kaleshsingh@google.com,
	maz@kernel.org, broonie@kernel.org, oliver.upton@linux.dev,
	james.morse@arm.com, ardb@kernel.org,
	hardevsinh.palaniya@siliconsignals.io, david@redhat.com,
	yang@os.amperecomputing.com, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 1/2] kasan/hw-tags: introduce kasan.store_only option
Message-ID: <aJ9yFZ0aobVUPDip@arm.com>
References: <20250813175335.3980268-1-yeoreum.yun@arm.com>
 <20250813175335.3980268-2-yeoreum.yun@arm.com>
 <aJ8WTyRJVznC9v4K@arm.com>
 <aJ87cZC3Cy3JJplT@e129823.arm.com>
 <aJ9OA/cHk1iFUPyH@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJ9OA/cHk1iFUPyH@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_104500_582858_34B0240E 
X-CRM114-Status: GOOD (  27.48  )
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

On Fri, Aug 15, 2025 at 04:10:59PM +0100, Yeoreum Yun wrote:
> > > Like we do in mte_enable_kernel_asymm(), if the feature is not available
> > > just fall back to checking both reads and writes in the chosen
> > > async/sync/asymm way. You can add some pr_info() to inform the user of
> > > the chosen kasan mode. It's really mostly an performance choice.
> >
> > But MTE_STORE_ONLY is defined as a SYSTEM_FEATURE.
> > This means that when it is called from kasan_init_hw_tags_cpu(),
> > the store_only mode is never set in system_capability,
> > so it cannot be checked using cpus_have_cap().
> >
> > Although the MTE_STORE_ONLY capability is verified by
> > directly reading the ID register (seems ugly),
> > my concern is the potential for an inconsistent state across CPUs.
> >
> > For example, in the case of ASYMM, which is a BOOT_CPU_FEATURE,
> > all CPUs operate in the same mode —
> > if ASYMM is not supported, either
> > all CPUs run in synchronous mode, or all run in asymmetric mode.
> >
> > However, for MTE_STORE_ONLY, CPUs that support the feature will run in store-only mode,
> > while those that do not will run with full checking for all operations.
> >
> > If we want to enable MTE_STORE_ONLY in kasan_init_hw_tags_cpu(),
> > I believe it should be reclassified as a BOOT_CPU_FEATURE.x
> > Otherwise, the cpu_enable_mte_store_only() function should still be called
> > as the enable callback for the MTE_STORE_ONLY feature.
> > In that case, kasan_enable_store_only() should be invoked (remove late init),
> > and if it returns an error, stop_machine() should be called to disable
> > the STORE_ONLY feature on all other CPUs
> > if any CPU is found to lack support for MTE_STORE_ONLY.
> >
> > Am I missing something?

Good point.

> So, IMHO like the ASYMM feature, it would be good to change
> MTE_STORE_ONLY as BOOT_CPU_FEATURE.
> That would makes everything as easiler and clear.

Yeah, let's do this. If people mix different features, we'll revisit at
that time. The asymmetric tag checking is also a boot CPU feature.

-- 
Catalin


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39937EFD206
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26Heb3z8+JRGyYR/K9qQ4p1lo9b1s7t7d4idtz27MvU=; b=fMnsVhbi+gt16oYrITEC0+b2Eh
	WWRWxEiZ9jPM/1kAoiDqHrEuU8wsyzdqAV1F2a5NdklVB2LqoFiLfN/PoFmYg6wPoxF3g15ED3ELO
	JdCrA6iLjRWEY7trgJ8zUmKjTqsUQ02XbRAZ1WtX/QbpcrSCeBlZU8e05I5Vq/TledEfdk0tWuCjY
	+vQQemdjSjzFDG9Z3kGv8OB77dbwW04FkfThyDKipNGiB4VblW1a9C03mhsDMgkC64iEdwPhexKwp
	WQfIxw6G4ZmDdh9Phh2LHUYgC75xqE9atsXsq1qi4wqo1PyCVFFZUX1SrW4kCFcsAdpfx8ht0AzIp
	hTpvkyBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA0e-00000003Tkt-0I6V;
	Wed, 25 Feb 2026 08:12:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA0b-00000003Tj3-1HCp;
	Wed, 25 Feb 2026 08:12:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E79E6165C;
	Wed, 25 Feb 2026 00:12:27 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40DC83F59E;
	Wed, 25 Feb 2026 00:12:31 -0800 (PST)
Date: Wed, 25 Feb 2026 08:12:28 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "david@kernel.org" <david@kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"pjw@kernel.org" <pjw@kernel.org>, "alex@ghiti.fr" <alex@ghiti.fr>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"will@kernel.org" <will@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 4/5] x86: shstk: Use the new common
 vm_mmap_shadow_stack() helper
Message-ID: <aZ6u7LMfGmExzhS4@arm.com>
References: <20260224175800.2500729-1-catalin.marinas@arm.com>
 <20260224175800.2500729-5-catalin.marinas@arm.com>
 <eac72941ab8d9520cadc1b98bdcfd7e5d2ef14ca.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eac72941ab8d9520cadc1b98bdcfd7e5d2ef14ca.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_001237_376248_A977991D 
X-CRM114-Status: GOOD (  12.07  )
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

On Tue, Feb 24, 2026 at 07:47:14PM +0000, Edgecombe, Rick P wrote:
> On Tue, 2026-02-24 at 17:57 +0000, Catalin Marinas wrote:
> > Replace part of the x86 alloc_shstk() content with a call to
> > vm_mmap_shadow_stack().
> 
> I ran it through the selftest. It would be nice to have a bit more information
> in the log, like that there is no functional change. Otherwise,

Good point, I'll add this to the other arch patches as well.

> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Thanks.

-- 
Catalin


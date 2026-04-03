Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41849E7E344
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l51i+Q86XZaSND+LCQy3ejLxZmxuUh3n/xH7YF+YpTs=; b=fZ//VpHmLCjjvZaLoqmuM+eI/m
	aJYhNytllUDS7Srjsrg1bwBfURAkl7YqIrMF7q4r229/47vsFbFBE+NlaGHs3siiTxtXNwsJfglPo
	iPeIG6Z8l6PU0z2O6dq3ZwnPE0MurhZZHCAsDRjp1SP4Mbi82HDwUEfuXOyrM01RT4yPLimQw+vdY
	qQmwQn7nPiPVIVhaUibl/EpeZdSrGIja4mFCC/oEkBUIWgwHM2Sgb5dZUk1DT8dRtMivvEfB9kFuJ
	dVdFzXF0qMXoa26Bt9UhoRM9mdV69gchnPq00m16bFzxSjGLGHd21kX6OBKei2O++rj7EJpG7KdgY
	E6oub3aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZzM-00000001ibV-1kgj;
	Fri, 03 Apr 2026 08:34:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZzK-00000001iav-1Pzt;
	Fri, 03 Apr 2026 08:34:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3503760123;
	Fri,  3 Apr 2026 08:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF0B8C4CEF7;
	Fri,  3 Apr 2026 08:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775205284;
	bh=HxmyUkEJdsgiYE7mTiTaJhkgxPe+vdxNd1hQ1Zq9ErQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sVBUQzA2/Y6Ptaodai9+vkxJiQLM5QgMagi2cAQkRttEu7mMdzgSA0wfnq92LGkOD
	 yY9YKUNDHiDuz60uojW/baEFle2jgDJTt8eyhjtSwjTwLNVvbMkKd8UPFaJeUKYm6g
	 MjoR1rKdkSHUtqxoW+jAp+wSMlF0tmi6vS3QLb7vBTmsUMWJKMpwgMaBgjGx9tJpvt
	 TM1B9eZ2llwlhtb6aFj+bL/5NIcwB7oxovjJBNdsvwwlgkUek+wIHCOrNobY2JIeeA
	 +KY2G43yMFMGrvgs3xdwmi9T0tWJrWbLdZY1eykpPyhsvmcljg7dc3lOo/iHiTFB5c
	 l2+oq1RchzHSQ==
Date: Fri, 3 Apr 2026 02:34:42 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
cc: Andrew Morton <akpm@linux-foundation.org>, 
    David Hildenbrand <david@kernel.org>, Mark Brown <broonie@kernel.org>, 
    Deepak Gupta <debug@rivosinc.com>, 
    Rick Edgecombe <rick.p.edgecombe@intel.com>, Will Deacon <will@kernel.org>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    "H. Peter Anvin" <hpa@zytor.com>, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
    linux-mm@kvack.org
Subject: Re: [PATCH v2 3/5] riscv: shstk: Use the new common vm_mmap_shadow_stack()
 helper
In-Reply-To: <20260225161404.3157851-4-catalin.marinas@arm.com>
Message-ID: <f9665842-cc7e-cb9f-680b-3c18d785c218@kernel.org>
References: <20260225161404.3157851-1-catalin.marinas@arm.com> <20260225161404.3157851-4-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 25 Feb 2026, Catalin Marinas wrote:

> Replace part of the allocate_shadow_stack() content with a call to
> vm_mmap_shadow_stack(). There is no functional change.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Tested-by: Deepak Gupta <debug@rivosinc.com>
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Alexandre Ghiti <alex@ghiti.fr>

Acked-by: Paul Walmsley <pjw@kernel.org>


- Paul


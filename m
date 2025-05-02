Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEB2C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 18:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gHPozvcmgyUib8LOM56/DEIGxGT2X8stay/KIRLn9d4=; b=gWzub+OtXtjkXPN8XTUNMGYKp+
	QKKmS1jDNpEGoaY0P3Oiru4NbBHoY0Kgt6ANTBDJ2z2jWyonNZtkmWnrdnFn8SnT3+bHvS77oWAn7
	Qz1QaPiez2OvMgZmpeb4fVP6VrdE1uhcK1zQP3yohcPJzwXz+NPEGPyL7B97VD3D2zHG10BzAoZZ/
	ab+E+YNBd7rsOLv9DyvLNHFZymKYxiLq2U46zVt8cqbyPEv3s4L6PbYaWiC82GTIyBn9Xh0DciCtf
	MMbc0DF0i/D14Z9Lh4tcJ9FKumdTiRQhvRKdrB7K1ayVT4IiFViJQLPbsdHdpfidFJ40qI8fFzwng
	GkiuoYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAuge-00000002jLq-14bi;
	Fri, 02 May 2025 18:00:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAudv-00000002j43-0RMy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 17:57:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FEDC44BA0;
	Fri,  2 May 2025 17:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA0BC4CEE4;
	Fri,  2 May 2025 17:57:42 +0000 (UTC)
Date: Fri, 2 May 2025 18:57:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, will@kernel.org, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org, joey.gouly@arm.com,
	james.morse@arm.com, hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, ryan.roberts@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] arm64/cpufeature: annotate arm64_use_ng_mappings with
 ro_after_init to prevent wrong idmap generation
Message-ID: <aBUHlGvZuI2O0bbs@arm.com>
References: <20250502145755.3751405-1-yeoreum.yun@arm.com>
 <CAMj1kXEoYcS6YPU0mBdvijDRK6ZVB7mPYZsCVpz7sYotabrxtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEoYcS6YPU0mBdvijDRK6ZVB7mPYZsCVpz7sYotabrxtQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_105747_158509_14D25084 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

On Fri, May 02, 2025 at 06:41:33PM +0200, Ard Biesheuvel wrote:
> Making arm64_use_ng_mappings __ro_after_init seems like a useful
> change by itself, so I am not objecting to that. But we don't solve it
> more fundamentally, please at least add a big fat comment why it is
> important that the variable remains there.

Maybe something like the section reference checker we use for __init -
verify that the early C code does not refer anything in the BSS section.

-- 
Catalin


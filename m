Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614C4D5E15A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 11:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DXW8bQNRO3gkOocX4PzYycpgsaN/ESTmINgiHlDVd4=; b=lkELyaH4mlOvTo1WxEdSlxuj+P
	zRo12GviPh4pQ3WejVL/3SzlF2/XY1ZHdG/RPDSRI3DSpj287wjs4qI5WDfJHk1M/N4d1/PgHCuIt
	RVAuYEvnJWE5LO/ex0d7DfHKAx0BDWZl8C5PS+zSe0j+tyLqfudbDj6fmh3uqEuMz4nNAOcdYQsL0
	Pgaa2xyknPqcPl8W9cOpFxWmu746gIuIvePqIP2Lu9mK4M0b09JicweTk4pWU62aVD3+njCY6JGDx
	s7Wp8sQR0k0BJu2l5MtO1CTbagitoKPt+8gwPJPWloSce3DULHlgrruitob76cUSH8soxwCIlcUbp
	kE+IWMsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NU6-0000000AP5N-0r95;
	Fri, 08 Nov 2024 11:49:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9MqE-0000000AHa8-2fAH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 11:07:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E65CAA41E7F;
	Fri,  8 Nov 2024 11:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE4AC4CECD;
	Fri,  8 Nov 2024 11:07:47 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Will Deacon <will@kernel.org>,
	dave.hansen@linux.intel.com,
	yury.khrustalev@arm.com,
	linux-kselftest@vger.kernel.org,
	Aishwarya TCV <aishwarya.tcv@arm.com>
Subject: Re: [PATCH] selftests/mm: Define PKEY_UNRESTRICTED for pkey_sighandler_tests
Date: Fri,  8 Nov 2024 11:07:45 +0000
Message-Id: <173106404267.1187252.14105809855861854022.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241107131640.650703-1-kevin.brodsky@arm.com>
References: <20241107131640.650703-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_030750_768227_9A899B13 
X-CRM114-Status: UNSURE (   8.69  )
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

On Thu, 07 Nov 2024 13:16:40 +0000, Kevin Brodsky wrote:
> Commit 6e182dc9f268 ("selftests/mm: Use generic pkey register
> manipulation") makes use of PKEY_UNRESTRICTED in
> pkey_sighandler_tests. The macro has been proposed for addition to
> uapi headers [1], but the patch hasn't landed yet.
> 
> Define PKEY_UNRESTRICTED in pkey-helpers.h for the time being to fix
> the build.
> 
> [...]

Applied to arm64 (for-next/pkey-signal), thanks!

I also added a FIXME comment to remove this macro once the generic
definition lands upstream.

[1/1] selftests/mm: Define PKEY_UNRESTRICTED for pkey_sighandler_tests
      https://git.kernel.org/arm64/c/db64dfffcad2

-- 
Catalin



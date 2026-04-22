Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E3FFA1FDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 17:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kN+tAggoE7dJdrwXpPqTNVRawWy/Q4THmUwn6LZT55Q=; b=OzwKPXvmuC7tuCRDYGu+wvIHpz
	Cb7bPdWovjWlirPdvdlHCWx/lr/r7VIO0yHdBOJNIveg52RkQQdoMhhdzt6qNic17yYGaU7meQKmw
	Flj913nH3qjMdnyLZ6bN40GYZPkGTHGoRx42FgaVnAMfNS6pSUkQ1SVPxvqX70Nl+S0hWj97deUWE
	cQU+2Kup2mpVMwnx7ecAiynjfk/9AaRtnNNAWQc5EpwBjdoEJNqSbISskPelCaddpAroROuIkvDkS
	8icBUQbjwgjgybW7zmILt7thLTkGe1LaunPRTSfXq9qK5LWMZw43xLZWJCX3qke0Upebpoc+mhm28
	OXS/cQMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbZc-0000000AaIY-1nIt;
	Wed, 22 Apr 2026 17:41:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbZZ-0000000AaIC-25fu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 17:41:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9FC61E4D;
	Wed, 22 Apr 2026 10:41:05 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81E6A3F641;
	Wed, 22 Apr 2026 10:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776879671; bh=SDXmukG7l7h+xJ1AEJmVhi1UVR+p1wd9EMCwF0OlEAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hfRgKZX3uEiOFEV7kY9Tay4H6mKe7cEnZc+dLtZ17e/cVfUpxNOtyVv5GSaCnhB8/
	 d1830fmzO+7o0rk5z8b/52msFbm7i/EqyrjBrz7PGTAN/lgjNuckZcPh3kYjunr8Sh
	 z2MAZ91z8KEHFYiP5PHsRy1wgqokSUgeT+QyjAnI=
Date: Wed, 22 Apr 2026 18:41:08 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Fix build failure with GCC-15
Message-ID: <20260422174108.GD929984@e132581.arm.com>
References: <20260422-selftests_arm64_gcc15-v1-1-0d919ea5ac5f@arm.com>
 <8690e67b-3637-45de-8956-e27486470866@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8690e67b-3637-45de-8956-e27486470866@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_104113_598016_2D7889C7 
X-CRM114-Status: UNSURE (   8.84  )
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

On Wed, Apr 22, 2026 at 06:20:16PM +0100, Mark Brown wrote:

[...]

> > +++ b/tools/testing/selftests/arm64/gcs/libc-gcs.c
> > @@ -16,6 +16,7 @@
> >  
> >  #include <asm/hwcap.h>
> >  #include <asm/mman.h>
> > +#include <asm/ptrace.h>
> 
> Shouldn't this be in gcs-util.h where the local definition is?

Will update commit log and this one. Thanks for review!

Leo


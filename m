Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D9FCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nm0X7HVhBHi1V4ocPJ8HnheSkGY858C2+8yJ4S9tuFc=; b=gAEHnu53wdLUJWWwSLVOnh9Soo
	xkeZT9dlGvOn/RzgxGMySDxWoK/Sm5822e5BM9twfx2zlMy1wYcB9UN9jUkp8PR2NQKjggvCqB8Di
	6kQvis08/hrrU9TYhPiLpRqOTPjjkAvtD1sdYX2aiz0R5Use/bEXgGYSxzHUhpiLsES7zB0Oa1tX/
	uyDELZx1vKdUvjSkKc7YXnTW8hZ3S/MqgGoK5UEHgz4OLXRo1AyouY8w0cU7UZ8ao0V0AXTUxSF5P
	azjeiELaZkafRb/+mfi7EOxNAbe8SEMrlACnNubclgF1Jht42xms0mIcNchwQY9ygUWtF0fkLHgOD
	sGIkAJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBapl-000000044sx-0btD;
	Tue, 29 Sep 2026 16:37:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBapj-000000044sq-16DQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:37:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AB2D54392A;
	Tue, 29 Sep 2026 16:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C488B1F000FF;
	Tue, 29 Sep 2026 16:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790699854;
	bh=Nm0X7HVhBHi1V4ocPJ8HnheSkGY858C2+8yJ4S9tuFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=enXWmmDjT15YehQixPtN5/s5s4rpKbmg+zfvG8kW6UY3f9aUF+fEb0V86AVKjVdCx
	 CuJLzvFLVG4px5qCn/DIKdTZDpuhHAEc8Q7D4IYd30AOXTSJtMO7czwr+LWksMpq3p
	 bfxNdwRF9+9XihqkFbqTUe8sH+TPN3PrpMFUK8NVnPU6NNJdjVRIB3vfKwulBlkxoe
	 Mv6dHgsu5fanIC1pVpBkQBe+bkLS6midKJ1ySC3ZYiD//bkvKMFxATshb3ZLAJ3dSW
	 VaX9wYv8Oaqtl7DYCIbDs8ZQB7PpWgb6VPoiCKsochcXZXHb2ZlenW2Il00JXOU1QU
	 gSs7wNPYrWlgA==
Date: Tue, 29 Sep 2026 17:37:29 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 05/11] kselftest/arm64: Exit with an error code on data
 mismatches in fp-stress
Message-ID: <arvoLC3LnBbUQ-oe@gremlin>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-5-31bce995b49b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-5-31bce995b49b@kernel.org>
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

On Tue, Sep 01, 2026 at 06:06:45PM +0100, Mark Brown wrote:
> Several of the fp-stress test loads have blocks at the end of their barf
> functions with a range of commented out options for how to exit the program
> after logging an error. Comments indicate that these were intended to
> interact with some long gone debugging code in the kernel. At the minute
> the option selected by all the programs is to delivera SIGABRT to
> themselves but there is no need to do this over a normal exit with a non
> zero status. In order to facilitate running as a KVM guest replace these

Same comment as before re: bare metal. Not sure on nomenclature however!

> Signed-off-by: Mark Brown <broonie@kernel.org>

That was some hairy existing code :)

All seems sensible so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

One nit - there's still a:

function barf
// fpsimd.c acitivty log dump hack
//	ldr	w0, =0xdeadc0de
//	mov	w8, #__NR_exit
//	svc	#0
// end hack

That sticks around in the files, should those be removed also?

--
Cheers, Lorenzo


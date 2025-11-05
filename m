Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B80BCCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 13:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLLjmh7Zi80OTRhBmaeIPk4X4MfnEcR9oOda/GKVfy0=; b=zfCuBrGl9Yy1AWkFzCsFUjRlMJ
	G2fqpJakGq+0X871EO0ISJSAfbp4jQLbl8B4+AZdYlC5fhLLZEENU8BjZTkk6xjK4u1V0kwJnMTdH
	sywuPFOetqbj2zmL5DcCukad2YKH++fp88RUbJ1hy6KCOTDFlMnCTTdtv3fphq3U9rG6qraI+Lby7
	7tovuJDY7Q+nGEvbTqsqVvtSg+4rN+KizbK+1R760ASxnvjGsf4m27ZWjoRCYWY230C8YkDEd+tb/
	oQh3LqMZ9AkY3u6PYWPFeLEx3iXZ7i1l0cJJWnWvxDrttxR5CBPkNB6ZRqlTNYQ3GtBG4owofN2mH
	U07bvKvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdW0-0000000DlNB-2i0d;
	Wed, 05 Nov 2025 13:25:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdVy-0000000DlMj-0t9V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 13:25:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8A40169E;
	Wed,  5 Nov 2025 05:25:20 -0800 (PST)
Received: from arm.com (unknown [10.1.26.217])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CFFF3F63F;
	Wed,  5 Nov 2025 05:25:27 -0800 (PST)
Date: Wed, 5 Nov 2025 13:25:25 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yicong Yang <yangyccccc@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, Willy Tarreau <w@1wt.eu>
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <aQtQRSoL8GGVNrUQ@arm.com>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
 <aQU7l-qMKJTx4znJ@arm.com>
 <5ab48722-8323-45af-b585-23b34af3017e@paulmck-laptop>
 <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
 <aQXtqoUEtDr-xUeS@arm.com>
 <3868c862-cf16-4259-829e-e9004028b3c1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3868c862-cf16-4259-829e-e9004028b3c1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_052530_308911_37C21309 
X-CRM114-Status: GOOD (  10.76  )
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

On Sat, Nov 01, 2025 at 07:41:02PM +0800, Yicong Yang wrote:
> FYI, there's a version to allow prefetech added prior to LSE
> opertaions by one boot option [1], if we want to reconsidered in this
> way, it's more flexible and can be controlled by the OS without
> touching the system configurations (may need to update the firmware).

I'm against adding boot time options for this. We either add them
permanently if beneficial for most microarchitectures or we get back to
the hardware people to ask for improvements (or, potentially, imp def
configurations like we have on a few of the Arm Ltd implementations).

> But need to add the prefetch in per-cpu implementation as you've
> noticed above (didn't add it since no prefetch for LL/SC
> implementation there, maybe a missing?)

Maybe no-one stressed these to notice any difference between LL/SC and
LSE.

-- 
Catalin


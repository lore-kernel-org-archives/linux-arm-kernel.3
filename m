Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C9CCA6CBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 11:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3pQH0+Xvo0atHy8WZVasR3Jkye0kkQ7vRG8byHAC/s=; b=VibJJV/nG5VhNu1gteTc/9qPxS
	mOuwZFz2RY2rxNbB3Uk8tokTXdDdq3F43pv9uQagpkQBAQD9Te5iNkMElw5zCRYQ6TH5wGoPU4JDe
	oU+v6F2GjjrlmtgWCx9tZdJgLHEtN4cljz4+cAHzp6Tl8vSrRYl8uy8b1KBRrRd3MOHBpxerRkyS+
	q0fOYQ6YMs1vhx5f83sQmwg4QdWJppwJJxHOmLVWUoNx27UvtKl58forMgD9u0FMo1Db6s0URe6cw
	p2VRXS6JbA/NZXCbbk0UiVXbHx2iisJYujGy97lE4n55YLBMD9qBUPpbjZpqNNdxnZE9tXbrkwqX0
	HdUQoh8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkh6R-0000000E98g-0aiS;
	Tue, 27 Jan 2026 11:19:23 +0000
Received: from sinmsgout03.his.huawei.com ([119.8.177.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkh6N-0000000E98J-2r6a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 11:19:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=M3pQH0+Xvo0atHy8WZVasR3Jkye0kkQ7vRG8byHAC/s=;
	b=KcpVPhoejq5YwlJtkffRxjpCGbeRESo/KtoPy4AzbHoJmyVpoW5BtpD2jNbPcMBohvyRaXfzv
	J+UD3r8qSSpfcbRiFvhUcy0wtZUJOxdsi/Gj0KYR8foxOYW+Mab0P3P5mJUwJgvXk5CVPRDaMRp
	0NefCupA9wW1OKejGFcEZ7U=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4f0jXR1pR2zN0dp;
	Tue, 27 Jan 2026 19:16:39 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f0jZR6nvyzHnH7h;
	Tue, 27 Jan 2026 19:18:23 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 61B5D40539;
	Tue, 27 Jan 2026 19:19:09 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Jan
 2026 11:19:08 +0000
Date: Tue, 27 Jan 2026 11:19:07 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ryan Roberts <ryan.roberts@arm.com>
CC: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Oliver Upton
	<oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, "Dev Jain"
	<dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 02/13] arm64: mm: Introduce a C wrapper for by-range
 TLB invalidation
Message-ID: <20260127111907.00004a78@huawei.com>
In-Reply-To: <20260119172202.1681510-3-ryan.roberts@arm.com>
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
	<20260119172202.1681510-3-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_031919_946472_3D7B6E67 
X-CRM114-Status: GOOD (  11.40  )
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

On Mon, 19 Jan 2026 17:21:49 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> As part of efforts to reduce our reliance on complex preprocessor macros
> for TLB invalidation routines, introduce a new C wrapper for by-range
> TLB invalidation which can be used instead of the __tlbi() macro and can
> additionally be called from C code.
> 
> Each specific tlbi range op is implemented as a C function and the
> appropriate function pointer is passed to __tlbi_range(). Since
> everything is declared inline and is statically resolvable, the compiler
> will convert the indirect function call to a direct inline execution.
> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

It's a little awkward to have the __flush_tlb_range_op documentation
20 odd lines before the code, but I can see why you want to keep
these new helpers tightly coupled with the macro in which they
are used, so fair enough.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>




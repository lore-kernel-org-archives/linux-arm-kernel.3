Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44130C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 10:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBcGZMP/PH344JaTxjrnS3tu/upG2EbrbigBh0oEiOY=; b=4NLT6e/cPp4tiKnwkd9mIKht70
	Q2Zw580etigZTVv4NLhN/81sDAfAmIiZT10f5XTciPR9uHGvJtoim4TlTea0OFF18LbH5RJClRlkX
	ygaCdVAvGuXzemDNFQ+ZQXNMW1zjgxS8bdYK50iFQNq0KQB+Bgauk9yUtcgbmigCk/mM6FnF6Cm6R
	ZrtNGGH2EDAxaWCb0RV6FPKrWO0zFs12Sfp/AYExALoZbMNwUT97dCD5weTn87Kxt3r1iioFBvP2Y
	K3RWIbpfuGdctzNXo0ms1vbTkB7cJjiCD3dE3B1jSdEFMShSY5QNkqgtI8IIjJOgrZPS55LgleYzU
	WYWXeqdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcmI-00000002uAa-0oic;
	Wed, 05 Feb 2025 10:37:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfckv-00000002u03-1bWb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 10:35:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB31F1C01;
	Wed,  5 Feb 2025 02:35:57 -0800 (PST)
Received: from NH27D9T0LF (unknown [10.57.9.241])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 418663F5A1;
	Wed,  5 Feb 2025 02:35:33 -0800 (PST)
Date: Wed, 5 Feb 2025 11:35:18 +0100
From: Emanuele Rocca <emanuele.rocca@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [BUG] ARM64 regression: NULL pointer dereference in
 arm_smccc_version_init+0x90/0x1ac
Message-ID: <Z6M-5jupnms33ZAZ@NH27D9T0LF>
References: <Z5OpGluX6oX5NLxh@NH27D9T0LF>
 <20250130114332.GA28662@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130114332.GA28662@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_023541_495058_25C30880 
X-CRM114-Status: GOOD (  13.59  )
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

Hello Will and Mark,

On 2025-01-30 11:43, Will Deacon wrote:
> On Fri, Jan 24, 2025 at 03:52:10PM +0100, Emanuele Rocca wrote:
> > This is with kernel 6.1.123. The last known good kernel I have available right
> > now is 6.1.119. In the 6.1.120 changelog I see the following commit which seems
> > potentially related?
> > 
> >  https://lore.kernel.org/all/20241106160448.2712997-1-mark.rutland@arm.com/
> > 
> > That's stable commit [1].
> 
> I can't see anything wrong with that patch but if you have reason to
> suspect that it's broken can you try reverting it to see if the problem
> disappears?

Confirmed: reverting the patch fixes the issue.


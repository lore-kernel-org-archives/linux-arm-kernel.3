Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F26C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3Hy+POSduc71X+W8hWlAuSJjnlkGON1R9mAu4I/VXM=; b=XQuoGtAaoXI4bFtmGo7rWxGauL
	33jfcqm+151W5g/L9UyvD1LxHN5zlDV/TaOugew6EjpnjhymW0Y7JIHBAJOTx0nBmLN7liB/xUSdv
	kjCXBVG5IwtpGDiFme85GkyZ13Zf0NYMr6+bwYPy/dYovr7xlToiCDFL6aaLkdrU1e8bggvc7t9vu
	+7dunAuNVPqUK3rbTgW45wM19dI9oZHAofXwqmNurhtLtYah6nvRXvwIRrp1LJ0GwbUv9Fmt426cl
	oMUHltcjW/rzRJwcuxKOgdFgtRkNkhHR4OMfI7QHMmRPzKfAtYMqi8jQkvUJX4BYvNDnDjZbDzyQK
	g1hDwQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5Di-00000006vGD-3qt5;
	Thu, 06 Feb 2025 16:59:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5CK-00000006v51-3br7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 16:57:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 656A312FC;
	Thu,  6 Feb 2025 08:58:13 -0800 (PST)
Received: from NH27D9T0LF (unknown [10.57.10.111])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 409213F63F;
	Thu,  6 Feb 2025 08:57:49 -0800 (PST)
Date: Thu, 6 Feb 2025 17:57:41 +0100
From: Emanuele Rocca <emanuele.rocca@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [BUG] ARM64 regression: NULL pointer dereference in
 arm_smccc_version_init+0x90/0x1ac
Message-ID: <Z6TqBQKSILZUnYbJ@NH27D9T0LF>
References: <Z5tuaxgDyFJPAvR0@J2N7QTR9R3>
 <Z5uTCnhfKo5D-_bV@NH27D9T0LF>
 <20250131124103.GA29766@willie-the-truck>
 <Z5zWMU4M_L5k6kII@J2N7QTR9R3>
 <20250204100014.GA777@willie-the-truck>
 <Z6OWxUFxkK9plrm0@NH27D9T0LF>
 <20250206131154.GD3204@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206131154.GD3204@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_085752_938564_3BA85C67 
X-CRM114-Status: UNSURE (   6.66  )
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

On 2025-02-06 01:11, Will Deacon wrote:
> In your screenshot, x6 looks like it's retained its poison value, but
> that was the register being corrupted in the initial report. Maybe you
> could share the diff you made?

Sure, please see [1]. A kernel built with that patch crashes and all
registers retain their poison values.

I now also tried moving the poisoning before the smccc_version /
smccc_conduit assignments, and the resulting kernel does *not* crash.
See [2].

[1] https://people.debian.org/~ema/w1-w17-crash.diff
[2] https://people.debian.org/~ema/w1-w17-nocrash.diff


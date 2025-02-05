Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F44C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 16:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpdxZ7AcuPaR4CyRbKybsN5beVNLzUd8cQGZeD6SdaE=; b=uGSWqsmHaOPR32zEjWb/EC8OWd
	lqKRlwZDKHoN4r2pEjNoRb8X15hlat5HtXuRjS7Z6aQlbMG9PgawhZiAQ+q6vO1m3+1yKlurdP3Un
	PXe1qxZBRZETxjYwJ/XWejcnAwSM2kT3Nar98zpGAQaOjz/ELhe2EGwJYCiLnPCzQCDHTG9xaCo/g
	roa5T/2ncGn5EpFNdpBcp4f2srLYfuPshwFfT/mx4n/cPZRf/LggrXJ0pQ6NrFI430wioMZ+n4xqg
	0WDKWexE+F03clNS9VnpySNqNV138yCsuNLNOBlIE4E/wP3vtGEOOU/bj8XF/QHJksS62mUaQB3FL
	9OnkJYsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfiim-000000042KI-16jW;
	Wed, 05 Feb 2025 16:57:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfibX-000000041D6-0nzC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 16:50:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 230481063;
	Wed,  5 Feb 2025 08:50:46 -0800 (PST)
Received: from NH27D9T0LF (unknown [10.57.9.241])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCCE43F58B;
	Wed,  5 Feb 2025 08:50:21 -0800 (PST)
Date: Wed, 5 Feb 2025 17:50:13 +0100
From: Emanuele Rocca <emanuele.rocca@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [BUG] ARM64 regression: NULL pointer dereference in
 arm_smccc_version_init+0x90/0x1ac
Message-ID: <Z6OWxUFxkK9plrm0@NH27D9T0LF>
References: <Z5tuaxgDyFJPAvR0@J2N7QTR9R3>
 <Z5uTCnhfKo5D-_bV@NH27D9T0LF>
 <20250131124103.GA29766@willie-the-truck>
 <Z5zWMU4M_L5k6kII@J2N7QTR9R3>
 <20250204100014.GA777@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204100014.GA777@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_085023_274122_44B9B7A7 
X-CRM114-Status: UNSURE (   8.83  )
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

Hello Will,

On 2025-02-04 10:00, Will Deacon wrote:
> Emanuele -- could you hack the code to poison the other unused result
> registers () and see if they are also cleared? ARM_SMCCC_TRNG_VERSION
> looks like a 32-bit call, so that would be W1-W7 afaict.

Not sure if this is exactly what you are asking for, but right before
the call to smccc_probe_trng():
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/firmware/smccc/smccc.c?h=v6.1.124#n29

I did the following to write to all registers. First I tried W1-W7, then
I went for W1-W17 too:

register unsigned long w1 asm("w1");
[...]
register unsigned long w17 asm("w17");

asm volatile(
  "mov w1, #0x1234\n"
  "mov w2, #0x2234\n"
  [...]
  "mov w16, #0x0234\n"
  "mov w17, #0x1234\n"
);

The values I wrote were not overwritten, see https://people.debian.org/~ema/w1-w17.jpg


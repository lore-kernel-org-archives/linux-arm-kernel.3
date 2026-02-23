Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFC4E98E0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fks6ZYu8+mJdy7SJcMmB/EcECm/NDn0F43wY4JtvKM=; b=hOI2b6UH6NhrA3hPtEAEXReZSk
	ox96TlwkRDxAqE6XZmWUWVf7NqSZkoGjAuDIDPeyfT/WTQkEkYX1usIAw/93WVrLC1D7DAP2/QRhv
	7d/7ay9+RiZljM7Uif2bKnHcS7r/+WO6VNnmyKjf5BSW8yitLBD5P70nrN9I6ODL9+9KOr1DTNOBO
	wxWpEq+5iiIvMTSDtw2uGRY+yUWgXlcHBfJKMd35W4j9sVzIb3wUNgandx7aXmXN3YRY//WG1Wjdo
	PrlutjpUqj3sH7+x3/5oLS5KIBa58H5CJxqsZ3MspyMLsAZA0+DgYrpOyVPjjFZqSXWKecWBmgl0h
	HI50cOzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSpF-000000000nt-1E4S;
	Mon, 23 Feb 2026 10:06:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSpB-000000000i0-1ZHJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:06:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56CE3497;
	Mon, 23 Feb 2026 02:05:47 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7AF23F59E;
	Mon, 23 Feb 2026 02:05:51 -0800 (PST)
Date: Mon, 23 Feb 2026 10:05:46 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <tabba@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: pKVM breakage in mainline on n1sdp
Message-ID: <aZwmevKcvW2HxdJ5@J2N7QTR9R3>
References: <60916cb6-f460-4751-b910-f63c58700ad0@sirena.org.uk>
 <87bjhie67o.wl-maz@kernel.org>
 <87a4x2e60i.wl-maz@kernel.org>
 <aZm2XCZLYxgxL99d@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZm2XCZLYxgxL99d@sirena.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_020557_474146_E6E0FB49 
X-CRM114-Status: GOOD (  13.17  )
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

On Sat, Feb 21, 2026 at 01:42:52PM +0000, Mark Brown wrote:
> On Sat, Feb 21, 2026 at 10:38:05AM +0000, Marc Zyngier wrote:
> 
> > If that's vanilla 6.19, then there is post Feb 8th. Sorry for the
> > unwarranted rant.
> 
> It won't be vanilla v6.19, that specific log will be tip of Linus' tree
> from yesterday morning UK time which should be 8bf22c33e7a1 ("Merge tag
> 'net-7.0-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net"),
> there were a few results for commits over the day prior to that showing
> the same behaviour.

Are you sure? That log says:

  CPU: 1 UID: 0 PID: 1955 Comm: qemu-system-aar Not tainted 6.19.0 #1 PREEMPT   

... where "6.19.0" means that's the 6.19 tag, and "#1" means that's the
first build against that.

Is the build system overriding things such that this is misleading?

Is there potentially a problem with the build system?

Mark.


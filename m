Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7ACACD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 12:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zekQpqKpT4s8RFnUNKGxX5SxB87NjFnJjrLeVc/FR64=; b=sHNOcfy/PqgsaGVv7VaDOk/VBI
	B0JeQX5OY4X5zO/+az7fvuMronpYejsQw30jKKJWipbHRJfF5kK5FP6TRIZGqK2F3SsI0t6EoK137
	T4ZGS3HegI7tsRiFZr4ipKGBhUXrboQVPjPcO9Ur4xLr6EymYWxY8z6HK6L75roXYEHbQhdIWL9eI
	tumJY+6WY9Lb9WkdVTP3o/Qlw09KJoIQyu6dsjGJA0R9GtogEkA8S0y5+s9Wbivd1Zp4xyQFtDaEr
	2iKmEQwClPMUdKd3X4qaXmq3Q8avehXnjoaUuDWpxlGx414mQ3E/LuP5ChvsAslVcRvqN4YxCTm+Y
	JePH5uIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKy0K-00000003nBC-2lZP;
	Thu, 07 May 2026 12:39:00 +0000
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKy0H-00000003nAS-2RZo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 12:38:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1778157537; x=1809693537;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zekQpqKpT4s8RFnUNKGxX5SxB87NjFnJjrLeVc/FR64=;
  b=WhRHeD4cv782QKyQimnLeSvhEmDxG0/8ShLc/aU00hJ5kcl8WdW1H011
   pK8LdH+Rw6VWROQXpdhkCGWkmZ/MnRb9UKRgBFWdA9KSbT8Na7w5KCAoH
   KTABLrR6DnyHuOE0jgqeqViQa5cMSnZwD8czGsDfQR9UTYC6VZPUTuLJ4
   A5anJ0n0muycIo4HvRzt30ymm1wIz6DzWN+uHnbLCxEyXPRsjC+d37kYK
   BTGPGFmwZ1oGYOr/ajs8/wRPq2qV1/ri0qagKlwRsmubUZNnS776GFaq/
   MILyFdVBWAmxsRlkFxC/WtxSHJYJa8a6E6y9eD2h/LjjdIsWB7jRHSB7h
   w==;
X-CSE-ConnectionGUID: 5X2Nbu3aT/u3joJ99P5Bew==
X-CSE-MsgGUID: Ub7javUGSmqdHyK3PyBmMg==
X-IronPort-AV: E=Sophos;i="6.23,221,1770595200"; 
   d="scan'208";a="18889034"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 12:38:51 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:30294]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.37.224:2525] with esmtp (Farcaster)
 id d18333ff-2050-4e63-8c0d-e81be0ca1dec; Thu, 7 May 2026 12:38:51 +0000 (UTC)
X-Farcaster-Flow-ID: d18333ff-2050-4e63-8c0d-e81be0ca1dec
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Thu, 7 May 2026 12:38:50 +0000
Received: from dev-dsk-dssauerw-1b-2c5f429c.eu-west-1.amazon.com
 (10.13.238.31) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Thu, 7 May 2026
 12:38:48 +0000
From: David Sauerwein <dssauerw@amazon.de>
To: Catalin Marinas <catalin.marinas@arm.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<nh-open-source@amazon.com>
Subject: Re: [PATCH] arm64: Fix garbled logs caused by race between multiple stack traces
Date: Thu, 7 May 2026 12:38:46 +0000
Message-ID: <20260507123846.35621-1-dssauerw@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <afse5Ld52p7DmidK@arm.com>
References: <afse5Ld52p7DmidK@arm.com>
MIME-Version: 1.0
X-Originating-IP: [10.13.238.31]
X-ClientProxiedBy: EX19D045UWC004.ant.amazon.com (10.13.139.203) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_053857_697337_9E699130 
X-CRM114-Status: GOOD (  14.07  )
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

On Wed, May 06, 2026 at 11:58:44AM +0100, Catalin Marinas wrote:
> While the above does solve the line splitting, the trace is still not
> that readable as we get line interleaving.
>
> I wonder whether we could do something like dump_stack_lvl() at the
> show_regs() level to synchronise the printing. If that works, we
> wouldn't need the above change (which isn't incorrect but maybe we can
> do better).

I think the change is still needed in either case. Other threads can log
something unrelated to the stack traces which can still cause the
register lines to be broken. After all, use of pr_cont is discouraged.
checkpatch.pl warns saying "Avoid logging continuation uses where
feasible" when adding new callers of pr_cont.

I agree though that forcing stack traces to be printed sequentially
would help with readability. Maybe this can be added as a separate
change.

Thanks,
David



Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597



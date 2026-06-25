Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BA4CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 09:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PyfiN5n7+xowWeEJ+ITQRg10+9LqiOAgwDNp2abj4E=; b=y67gig7nCOckNi+Vb3rPi7z7Ch
	RQaQ19ajylvyDZ7fLdPdhnHo+jAkn+S0eg63WuIZ79eVJpCJmfIV1c/VyfwYDG2CMQLAxpZEQSPsR
	p2qm6K1qkzfA7QmfdojU1CGMLFzpSzGcJAlArp30XWEy3YI6bDLDxqpxahXK8b36QRajStyvMu7Gm
	J4w1eXyMZVX4yIEitcl80n71ArALcEuzMnUYeEbaoN3bzi/OVXTRbY6ggZvmcQVTj+7h5GTRKfViL
	OAjCulRqjxfLJS0YZVTS3GRnvCiNh4GwJLUaPUcfXGZxepsbDBWGM2BTqLQ5gmBrXhLmN3BiXH26Z
	PALO3Vrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgMb-00000008uEr-0eC1;
	Thu, 25 Jun 2026 09:27:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgMa-00000008uEb-1My7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 09:27:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BE74600FC;
	Thu, 25 Jun 2026 09:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F2C51F000E9;
	Thu, 25 Jun 2026 09:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782379631;
	bh=1PyfiN5n7+xowWeEJ+ITQRg10+9LqiOAgwDNp2abj4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AJfhegT9HtqtUTovBmYF62ijjai+YXCB+/AiphPXp6WMIlA0+fxoyKyiLp1gjPYKZ
	 8UBCJ0mV1h7QkJ6q/Oo5tWFhqShVtKWBFHgFzg1Zy+wlI/tstbdXgmPD+31LyTJV/V
	 ZAlZHVpsh/Uczeiw/Aag0XuR6gSYfuhKfe4VtSTMLoyzNUOtohK7PVHo13QfI8LQNy
	 HYXvPR75vHdWbEFK0owLuzM0Sio6i4TOLaEUZa9HrX/SvGBGJTlDcPfwIXzN9Jc3IR
	 GhsLd4YFx2RxER14q+o4HC+5oYPTenM/GWtukDphaB5mvI4QtRhGXZcA7llYH/2owm
	 LqwM5xiAPLPhg==
Date: Thu, 25 Jun 2026 10:27:05 +0100
From: Will Deacon <will@kernel.org>
To: Sayali Kulkarni <sk@gentwo.org>
Cc: Linu Cherian <linu.cherian@arm.com>, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com, yang@os.amperecomputing.com, cl@gentwo.org,
	sskulkarni@amperecomputing.com
Subject: Re: [PATCH v2] arm64: tlbflush: Reset active_cpu on ASID rollover
Message-ID: <ajz0aYfVnzn-V4Ov@willie-the-truck>
References: <airWIxSd_a5kR65-@arm.com>
 <20260612232254.2856649-1-sk@gentwo.org>
 <ajQM4bkKfWdPowpM@a079125.arm.com>
 <2ef3430f-fdea-aff0-b9fb-f4ff2427df93@gentwo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ef3430f-fdea-aff0-b9fb-f4ff2427df93@gentwo.org>
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

On Wed, Jun 24, 2026 at 03:13:12PM -0700, Sayali Kulkarni wrote:
> For v3, I am exploring handling active_cpu together with the generation so
> that the reset can’t open a NONE window. Doing it in the slow path after
> local flush and updating to the current CPU rather than NONE. Does that
> direction seem reasonable or is there a cleaner way to avoid the under-claim
> window? Will follow up with a patch once it’s figured out.

Please don't.

I already reviewed Ryan's v2 and there was some good discussion over
there. Having you send a random other version of it isn't helpful in
the slightest and I won't be applying it.

Will


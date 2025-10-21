Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9EFCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 17:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GiBz0AD+U5higfP54JTIWbURN7LMLdXTQYQaOgJ+Bl0=; b=dYqTcCEqaKyQTZEk0X4/A4OoYJ
	f5BKtmcYJ6Z97irk/b/mJ1TtZYo0jBaOZ5kujeY2WFNNaGg4VplhApD7jzzUVfEMdVj0X2zFsTeTs
	3/ZR+N00f5QvALkYnOC1Y/dFyGMEtFR53Zlmmypbdg2EF7KtOjTHSFalFwp+8xxchvLdg920ZY4oH
	gYRWWVwdPYiqvQbSy0MFkO9Lm6/QAq09c+JaNC9A3IxRotltMj0+qoh1VkPU5NGqNK5qpuJP376yI
	fBSNS9BZKc2BUglIjVGluk+Kv0FRyG0g3ZNx4XaKFTpuec32t2D/guHljE+C05Xaz8lhl8cYH7JjC
	++0g3cGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBG0o-00000000DBz-0DH6;
	Tue, 21 Oct 2025 17:19:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBG0l-00000000DB6-3QHb;
	Tue, 21 Oct 2025 17:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GiBz0AD+U5higfP54JTIWbURN7LMLdXTQYQaOgJ+Bl0=; b=sH0HieRSdZyPzGqjC4vCbXfpKm
	yJYGFutbqau5ccJh8yltYVSlMxcWDKcGbOGU4jJV41RHFabFrviYfBHkfbfgHkEhT65jW/+WtN/BL
	/JZBkhTiW1CQiN61+JYIPfkeX6l7+16NHnxi9t5Stb5JTGZE+MLm2+Spsne7Sf5XZhUrTnDMLwfSB
	ubssjtmD6B6nzIu2WKaMg7Ara+KYNFOyr8oi0Rk2NLElQQamfPbvsKOYiPJIpjTB+WhyawvIwepF1
	MyB4q32gQfgNBHsGLOaN8szWOf/1dB+Wy+JdaoUCsRYypGjKRUX6jnpoN3m9m1Qod3sGovfmn720/
	OZ4MifGg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBG0e-0000000DsZ0-2xKs;
	Tue, 21 Oct 2025 17:18:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F40E13031AF; Tue, 21 Oct 2025 16:44:35 +0200 (CEST)
Date: Tue, 21 Oct 2025 16:44:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: David Laight <david.laight.linux@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access
 regions
Message-ID: <20251021144435.GG4067720@noisy.programming.kicks-ass.net>
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.253004391@linutronix.de>
 <20251020192859.640d7f0a@pumpkin>
 <877bwoz5sp.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877bwoz5sp.ffs@tglx>
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

On Tue, Oct 21, 2025 at 04:29:58PM +0200, Thomas Gleixner wrote:

> So simply naming it scoped_user_$MODE_access() is probably the least
> confusing of all.

Yeah, that makes sense.


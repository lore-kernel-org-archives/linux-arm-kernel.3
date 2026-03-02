Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FF5E9B365
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0fDz0lBXw5R9sgjv0ijWt32KF6cVleQgryMyN+mCVw=; b=x1FmhroxxlT8H4+dxbBxyEQlev
	gAPmMR8dlYDKXmMAlbo8PceQa4pz/6XZjGvP0h1HuHUsUjT8LpCDbN6Gjk5ju07jCDVM8ZYpPkB1h
	17lM90EQsQK1HSTohmp1i7XztQQutaYpmwpDv2Blt6IUPAb2l9/htXoSgLFVj33Uy3YDngatSNBgy
	JdyFfZ7xGfVB2Lv8ea7RX27Mb8kNJV+bTNJTIp5loQadFPm5hgq8R49YG7eJej24T9DWIsUjE1j6c
	ei9pFY/K+dO+S+GC0YVo8rQ4ioF3rAXfB/NiBHAgG744yeFMwu3vdSGi50Leex+0NFxRxowd0gPP5
	RL3Xwfcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0y6-0000000ClVB-0oGa;
	Mon, 02 Mar 2026 10:57:42 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0y2-0000000ClUE-45qY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:57:40 +0000
Date: Mon, 2 Mar 2026 11:57:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772449056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d0fDz0lBXw5R9sgjv0ijWt32KF6cVleQgryMyN+mCVw=;
	b=XcnqmGiUCnqZysSQRAjGu+NL+G2ZFfMZ/4SeF0FOSv7p6czdyTtYLjvNN/WuRXXRdfhsch
	PPSE/gP8VA3b6gYgcAraIy3aZAHHldlQhToSm+Bu8uLgSnTGNXsPJaD9nDjOcHQgks5P2f
	PHKlicrHiDbejgKy0cekdq31120hymzGnF71o+e/MCoatZ65Aj8nZQmdHHUZwoo4pYfI1X
	fI13t0x9rwqDBR4x0M66VlXeBnxg6qWqATC6q1+VzIwS+MOe4AiL2SAhsMVgq/it7ob/iM
	RbhlZhgznV1E/VojxmvT+cWmctrW7Vz11T/NgTXTW1ZXXJ1gTSGlanVC1VLvPA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772449056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d0fDz0lBXw5R9sgjv0ijWt32KF6cVleQgryMyN+mCVw=;
	b=EB1GAL1ufc91SpePDQHdu8vYrJ1e9hx04f8dGn+eEasNYCJ1GOuNOsBRLVEebkUbhe8L0M
	iXeuxPfppNJrRJDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 0/6] ARM: cleanup fault handling
Message-ID: <20260302105735.Roqcqp6h@linutronix.de>
References: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_025739_152990_3788192C 
X-CRM114-Status: UNSURE (   9.19  )
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

On 2026-02-27 15:18:26 [+0000], Russell King (Oracle) wrote:
> Hi,
Hi,

> This series cleans up the 32-bit ARM fault handling:
> 
> 1. ensure a consistent IRQ state in the user fault processing path.
> 2. split vmalloc fault processing in a similar way to x86
> 3. move is_..._fault() to the local fault.h header file
> 4. update the FSR deifnitions using BIT() and GENMASK()
> 5. move LPAE/non-LPAE specific FSR bits/masks along side users
> 6. get rid of #ifdefs within is_..._fault() by providing a LPAE
>    and non-LPAE versions.

Thank you Russell. With this series (notably #1) the PREEMPT_RT support
can be enabled. Would you mind adding "ARM: Allow to enable RT" from
	https://lore.kernel.org/all/20260226111742.3598421-3-bigeasy@linutronix.de/

to the series/ merge it with it? Or should I just send it to your patch
system?

Sebastian


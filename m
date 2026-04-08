Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124F91073C89
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 10:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mIcXthBsC0eVn8jN2fP4DlXTVAhYf+RgUhadOXvF6M=; b=VIEu2nkwTQCCueJUVlpc0BNsa3
	WSb9QM0LM2jStz1QEon6h0oM4bLezwFR09AfGilDX++02yewQHXoDBxffhP5T7IBlZxwj01rNlFpu
	Z/QaUrZLhizESdfiRqSLt3GvoZt6zvVnA+KQQ/YW4P4dLoVx08T/bss9V6keYkV44TDvc5KjMACgO
	xy2brdda6X6v+QBfYc/702pxlC1ibXuKOUVy0QljwsLGdCSakhWK882e1FZXAAqzTdpeUrL0PFfSD
	WWrUQg8qBgS49EhX0G3yrxLu5LI5/W47sPJ9YOiB+2tNxNBaABQjCDTw0Ku9/ZyJfwhW9SAq1Yfns
	SKiDnfuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPw4-00000008fVe-3US2;
	Wed, 08 Apr 2026 10:15:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPw2-00000008fUw-3xfC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 10:14:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5EEB5600AD;
	Wed,  8 Apr 2026 10:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B967C19421;
	Wed,  8 Apr 2026 10:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775643298;
	bh=NEm16KmPFUGWFfXOao12T6KnU43bG6Cxe/Sdn4y7oMI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KXuAv98mQhX4t7Cx7+DcaXR99XOVzLB1Kew9HZql9Y6IsCdC2FZuL4ChPyl9MmVs6
	 owPzUGEpxHxiHPVw8YiwPTQeb3VvREWboBx98dlCJBGSKmkeXMJHQctzqtRA59Pbpw
	 +md7tYlSH6RyMQ5IaKKtyT21USNC3lZe2S9t7+4YWt+IP5tGFim/QGsdSXn3A7IJ1v
	 R9BCyD6hgVgm2zAIdSKoN+dH823S1ufx6ojyJoef7qynYTuNQlzigbLbLscmJchfty
	 4JMVdD5e1Qvpm72kpEgDF+d+o+ppRAF30bC/YWE7IuQvzrBMBLXjA+f+ag5rh59VdC
	 8U5WthMY2Y6XA==
From: Thomas Gleixner <tglx@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland
 <mark.rutland@arm.com>
Subject: Re: [PATCH 00/10] arm64/entry:
In-Reply-To: <adYaj8FX_PVKdkdZ@arm.com>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
 <87cy0a4gx7.ffs@tglx> <adYZpA3-Tx6s1VOp@J2N7QTR9R3>
 <adYaj8FX_PVKdkdZ@arm.com>
Date: Wed, 08 Apr 2026 12:14:54 +0200
Message-ID: <8734154v35.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: vladimir.murzin@arm.com, Peter Zijlstra <peterz@infradead.org>, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Apr 08 2026 at 10:06, Catalin Marinas wrote:
> On Wed, Apr 08, 2026 at 10:02:28AM +0100, Mark Rutland wrote:
>> > Does that work for you?
>> 
>> That sounds good to me.
>> 
>> Catalin, Will, does that work for you?
>
> Yes, it does. Thanks!

Here you go:

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git entry-for-arm64-26-04-08

Thanks,

        tglx


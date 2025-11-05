Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD26CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 20:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGtKX+kQnYgPPm0B/oZUuJgVsr7xVl18n8n8kA+uaNM=; b=KEN6PjbNMgNnavEhYYHqw+dO5t
	J+WOgJ/x/ExAnRvgLwqpfDeZCxxVQoxDb5lhgI5mopbzZ35vt/7DhI9mmHTLz+rc/YasZwsWWpVoJ
	zZl1SRgieSXP6crCEW8zcDPW6U1YtpqNsWz94XYl0WeYLVSV2MoN4S7dfHhkaMV6Ys18Ya7exHrj+
	SRhEk8tgkMhE9RAYYZY5bbmoPqXbNLC3vk2YAJ8jhzjIQ/6Puv3dl774rqvn27UJlBpz4+DWM6IhC
	UJUwk2s4iqf2ddeGEqrlrmoTXvEDqKLFOmRHtJ6XyEE2gE34EcR/6GE4YrZt2iDttobgDKc4L8hnl
	wW1FN6IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjwh-0000000EMZQ-0XWz;
	Wed, 05 Nov 2025 20:17:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjwf-0000000EMZI-2mh1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 20:17:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CC3E601F1;
	Wed,  5 Nov 2025 20:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C32C4CEF5;
	Wed,  5 Nov 2025 20:17:27 +0000 (UTC)
Date: Wed, 5 Nov 2025 20:17:25 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <aQuw1WUZAjWLRgop@arm.com>
References: <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
 <aQoyPox1DjlBT32O@arm.com>
 <d132771d-3a3f-486c-b674-de4ec976e929@paulmck-laptop>
 <174614f9-70f0-440e-ae68-dc5f540b8454@paulmck-laptop>
 <aQtufeFU-PAE6YDk@arm.com>
 <8f7997f5-fdb3-443b-90be-3c68d796b416@paulmck-laptop>
 <aQuGR1fx2qBrJSA-@arm.com>
 <8ef2390c-e805-4b8c-8417-88a6762f9a54@paulmck-laptop>
 <aQuimp4CRywdy97S@arm.com>
 <dd77458f-95f0-4c3f-ae5c-4a09b51e386a@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd77458f-95f0-4c3f-ae5c-4a09b51e386a@paulmck-laptop>
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

On Wed, Nov 05, 2025 at 11:47:07AM -0800, Paul E. McKenney wrote:
> On Wed, Nov 05, 2025 at 07:16:42PM +0000, Catalin Marinas wrote:
> > I think we should change the percpu atomics, it makes more sense to do
> > them near, but I'll keep the others as they are. Planning to post a
> > proper patch tomorrow and see if Will NAKs it ;) (I've been in meetings
> > all day). Something like below but with more comments and a commit log:
> 
> I do like fixing this in the arm64 percpu atomics.  However, this gets
> me assembler errors, perhaps because I am using an old version of gcc
> or perhaps because I am still based off of v6.17-rc1:
> 
> 	/tmp/ccYlMkU1.s: Assembler messages:
> 	/tmp/ccYlMkU1.s:9292: Error: invalid addressing mode at operand 2 -- `stadd x2,x4,[x0]'
> 	/tmp/ccYlMkU1.s:9428: Error: invalid addressing mode at operand 2 -- `stadd x3,x6,[x1]'
> 	/tmp/ccYlMkU1.s:9299: Error: attempt to move .org backwards
> 	/tmp/ccYlMkU1.s:9435: Error: attempt to move .org backwards

Are you sure it is applied correctly? There shouldn't be any trace of
stadd in asm/percpu.h.

-- 
Catalin


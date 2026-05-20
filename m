Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C296CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 07:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCa6eCLoAF2kcTKYfGxshsfglzj8axrQdNDRstg+cpg=; b=1vnL1QAlrcc2hIOQtfhGw8K6vw
	XqL5YST1FKp/2tP6plMBU94rZEbFs9T42hj0YpzGHHtTwT6mkSWpVoLx6eNIngRpuCnn51yIVr3C4
	agdv9TMad7QjCCJbOhpKwGxXjhJyFNVstaXzMWOy36Pn4Vb/QalfS+cOQ9OmzCFtZn4P4Tep+x0f1
	mk1o17uJ/JvvAiDKGsZfOyFmNmoMpLep6n2oiLsfWDQV3XB1RcIhifKKeYV3BxMxjLJhXUUgggzoa
	Xp6bRYx9LtUlWmEHCJfeVQQq860HS/eYLURJ2GtB30snsH1aQZhM0u6efp5WdlRzpOaWtHj+TiI63
	J1osKEeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbTV-00000003ow0-3FSe;
	Wed, 20 May 2026 07:36:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbTR-00000003ot8-07st
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 07:36:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B7412573;
	Wed, 20 May 2026 00:36:04 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF77E3F632;
	Wed, 20 May 2026 00:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779262569; bh=sYdaitZv5dkRp/Ged886p12EW23XCkqhilQuKp2wxV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FsZwkMuYPdJjbd+uWeHrTMuO7KtRfhowNxvGNk2PZMiT/o//ONWk4So2wKny3H+cy
	 /h/vTyLz/YHkC6UqojzNoOKqMpOXu/jg+h6BCLG+Tz/rzVoCAXUgAJC2LIRp/+b73l
	 ZctgPq86gTv7/qmNxGhv2luUNMYvBwIIDaVyIJcg=
Date: Wed, 20 May 2026 08:36:06 +0100
From: Leo Yan <leo.yan@arm.com>
To: Justinien Bouron <jbouron@amazon.com>
Subject: Re: [PATCH] arm64: Add user and kernel page-fault tracepoints
Message-ID: <20260520073606.GA101133@e132581.arm.com>
References: <20260520045524.75670-1-jbouron@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520045524.75670-1-jbouron@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_003613_156460_931F2F90 
X-CRM114-Status: GOOD (  13.34  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Gunnar Kudrjavets <gunnarku@amazon.com>, Ryan Roberts <ryan.roberts@arm.com>, Quentin Perret <qperret@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, May 19, 2026 at 09:55:24PM -0700, Justinien Bouron wrote:

[...]

> @@ -606,6 +609,11 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>  	int si_code;
>  	int pkey = -1;
>  
> +	if (user_mode(regs))
> +		trace_page_fault_user(addr, regs, esr);
> +	else
> +		trace_page_fault_kernel(addr, regs, esr);

Based on the discussion [1], Arm64 has already supported perf sw event
for page-faults:

  perf record -e page-faults ...

Seems there have a plan to consolidate perf event and tracepoints but I
have no idea how it is going. I would leave this to maintainers.

> +
>  	if (kprobe_page_fault(regs, esr))
>  		return 0;

tracepoints should be after kprobe_page_fault(), as explained [2] by Mark.

Thanks,
Leo

[1] https://lore.kernel.org/all/20250520140453.GA18711@willie-the-truck/
[2] https://lore.kernel.org/all/aCtZfiU8bgkSAgLh@J2N7QTR9R3/


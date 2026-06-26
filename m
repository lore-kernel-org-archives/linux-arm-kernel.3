Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA0CCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 08:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dczgg0EG8SzCmQOx10ra7Wu7tyi/QlMQ5W656css9gI=; b=K/h5HP33kMVfw4cGm7u8MeEFTn
	GaraclTNwK8KATdEK4zu+LpvUldSnj9YimUOjAHN6jcMnEEeB1bDfu4IhPchPGhPbgGDxINMRg3Ei
	KcoW46nL+5q205NDhcQyU3sx8HyJP7gmGTzrQ2Yn7MSvlAHqHxwFjgJAi9n25IxST0NlD7Kj/quB2
	vpIrfIQwUuizWQrtSSzrc8JZii8TvPWMihspVh9dtZV9lbG1U/8+agGFzyWi7LjAt8FbMI4MapnL9
	83Ju/8QRxBULR6TfaU83twNKyXfcAQZcLeCDkwb4q+dmmyt2AG8Dlcfmkgdfk9TDD1lc1DvApVonb
	ARrkxZIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2Ha-0000000AupT-0T7X;
	Fri, 26 Jun 2026 08:51:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2HX-0000000Auoh-49WT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 08:51:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E0C03600AE;
	Fri, 26 Jun 2026 08:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C131F000E9;
	Fri, 26 Jun 2026 08:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782463886;
	bh=dczgg0EG8SzCmQOx10ra7Wu7tyi/QlMQ5W656css9gI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZuN86shSSyy0XeJHxDjAleAAh3O8h5DItrYs4TSav34bAuZW0MAx9ZBBE9S3nKp+q
	 JUucAqzuWIOp1XCgdpd9P3oFXnLbWNeWduuAN7d3BLmln+qoARZNZxKF2O06nPeYv4
	 1dAdVGA0JDyuC0sJVCZD2wvL+fK7VqCql7n7upa+dFP/qqyZ8tCeX05jqkcgPFDC5w
	 tFX0+2mg/DvZd1BW9undZCZbfHnid5R0fV0ghRYpjUgkCITPyYbrNbnJWUD3Su88Bu
	 iGHlEwHR4XUomu86ZdOshDLSTLNHrTMNbY7gs9BX+9uYtxaMeTpyySj/HlKZUt2HrK
	 5/RKab/63CQEw==
Date: Fri, 26 Jun 2026 04:51:19 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, John Ogness <john.ogness@linutronix.de>, Thomas
 Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Julia
 Lawall <julia.lawall@inria.fr>, Yury Norov <yury.norov@gmail.com>,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v4 2/2] tracing: Remove trace_printk.h from kernel.h
Message-ID: <20260626045119.659d1e6b@fedora>
In-Reply-To: <20260625234158.GA261868@ax162>
References: <20260625104007.041432666@kernel.org>
	<20260625104402.210473477@kernel.org>
	<20260625234158.GA261868@ax162>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 25 Jun 2026 16:41:58 -0700
Nathan Chancellor <nathan@kernel.org> wrote:


> The following diff resolves it for me, should I send it as a separate
> patch or do you want to just fold it in with a note?
> 
> diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
> index 621566345406..2301a701ffbb 100644
> --- a/include/linux/lockdep.h
> +++ b/include/linux/lockdep.h
> @@ -10,6 +10,7 @@
>  #ifndef __LINUX_LOCKDEP_H
>  #define __LINUX_LOCKDEP_H
>  
> +#include <linux/instruction_pointer.h>

Ah, so the reason for this breakage is because lockdep was relying on
instruction_pointer.h, that just happened to be included in kernel.h
via trace_printk.h.

This is a separate issue, so it should be a separate patch. I'll add it
as patch 1 of this series.

Can you send me the config you used. This didn't trigger in my tests.

Thanks,

-- Steve



>  #include <linux/lockdep_types.h>
>  #include <linux/smp.h>
>  #include <asm/percpu.h>



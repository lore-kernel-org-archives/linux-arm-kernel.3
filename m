Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF8CCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 23:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/HJPNa4Oa5DLM5df/yKw+CscA/qZXvMF0PIQU0JPWg=; b=tuh8xyPUMGUS9WQxlkx5ln6mUx
	1x5K9aZOXFqOXD6qr7/KNq7litUWOLl7I3GXbdD1Cv8iFmoUUccLRVnpqx12lIJHAW7d+81unfBxX
	VNhFKqGxghl5PPwRJp7b0256Yi/KmuenB6L/gnXO04kY1HGfdsAQMfpdVYjQLaTIY59Qib9wJG/9i
	HWT1eHVe0OMixZW/YY9x+8Jtxt6skqvA9nUNAq4zL6rQ2/2hJ0wHniWAmvK3jRxpNwcJr32IxrpPn
	ZsH5pbg0lDjZKGtrtIu6vrhQ/9teqPxI8FRe8sTiomDzXBcBOYSf2FTi/tjRqB8huNPWTtSBxzicT
	dMxm3/WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXSTk-00000008T0V-2uEg;
	Wed, 10 Jun 2026 23:37:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXSTj-00000008T0M-2VSR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 23:36:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B432A417F7;
	Wed, 10 Jun 2026 23:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B633F1F00893;
	Wed, 10 Jun 2026 23:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781134618;
	bh=J/HJPNa4Oa5DLM5df/yKw+CscA/qZXvMF0PIQU0JPWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V9olKbpjJXSmWwsrWI9yU7LD3jo8E4jJVQIa7SKztF8hn+yzrWQ2uIE3jjnxrF7/l
	 w9390+npwpd2GKOVjZe43fglD+CB1VDU7AQznNphuEFHvHXd1lmkX2J6QiPgcMb63a
	 qznCw+fNa81Z1e1sPGInUlG2XFjpVFqmUAlcZp4eIPPTU2fHdDGd8yxk+7jiOnnecc
	 iGmcAWoOvcTDAq9sQq4nxwOMfaagFyrFMADeuCfVTizmmUT6gqLLMqPmAWPtmpqqc5
	 q8ylHsS5PGpOomB8gXS9boORsd2PGZP1X1SjwcPMgDopAd/2W8Jr2lvPrGbdYWl8L0
	 eBO7poY2Twvyg==
Date: Wed, 10 Jun 2026 16:36:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	bpf@vger.kernel.org, Florent Revest <revest@chromium.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huawei.com>
Subject: Re: [PATCH 0/2] arm64: ftrace: support DIRECT_CALLS without CALL_OPS
Message-ID: <20260610233647.GB3099686@ax162>
References: <20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev>
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

Hi Jose,

On Tue, Jun 09, 2026 at 05:19:25AM +0000, Jose Fernandez (Anthropic) wrote:
> Jose Fernandez (Anthropic) (2):
>       arm64: ftrace: prepare ftrace_modify_call() for use without CALL_OPS
>       arm64: ftrace: allow DIRECT_CALLS without CALL_OPS

Thanks, I applied these two changes on -next and it looks like it
resolves the issue I originally noticed with systemd's restrict-fs
program not working on both of my arm64 machines.

Tested-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan


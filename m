Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E34FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=9d6Zjt5w5C2CNQYkhidrtw/dAxt22triOgxrmsVLcQY=; b=Jtl+zj5yhp25HB
	5FOR1MLLdO7nW3X6YLsaHqnOAJSs4eQhBqv2GJkAK2JAHzGCj47b9/WaBxlRFhZjrL2/nt+FYmHm/
	qu0B0juJEewo3Lm5b/V6LS6zlrtj23i+ew57IQrLe8uJgXlgyg7gTwd1lHNlSFg+gOpORYsDi3wrM
	fOBaXt8gX9jRW/5l3QX7tjn6qyFI3bDD+MR84370fx+3qsGsDvtUlsABUfBZeSSpBCMkDV4YwlxXz
	R360Ifh5ozJeRuLRJ4lTxtaGMq42vqtrMORncJ9la5dyv3qB+6KaMc9SKcYioostP7Elz8aRgZJFh
	0+Xlj50wrj7zWgICRpdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBsy-000000053T2-1EyY;
	Fri, 10 Jul 2026 14:07:24 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBsv-000000053SS-2H0E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:07:22 +0000
Date: Fri, 10 Jul 2026 14:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783692436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=9d6Zjt5w5C2CNQYkhidrtw/dAxt22triOgxrmsVLcQY=;
	b=aIOb/cXr5hIM9ODlojpy30vTWNZVMRgLwlvEBiEEG0TBXmAiEd4kKMu+ReoeGUbqh+k/pA
	eqLpT6X1h+pwoGgPkcGBRJTa1SMttpZHWHtf4bGGdpJS+Zsdh3yjyQDxsW+6WOoybHNXlS
	UrHSTfIkWGrozAzPLX7gbuE5FGzLmGQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
To: Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Clayton Craft <clayton@craftyguy.net>, 
	Xu Kuohai <xukuohai@huaweicloud.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, bpf@vger.kernel.org, 
	Florent Revest <revest@chromium.org>, Xu Kuohai <xukuohai@huawei.com>, Ben Cressey <ben@cressey.dev>
Subject: Re: [PATCH 0/2] arm64: ftrace: support DIRECT_CALLS without CALL_OPS
Message-ID: <alD7Rr659mGVznQp@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_070721_719499_45B2E270 
X-CRM114-Status: UNSURE (   6.78  )
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

Hi all,

Just a gentle ping on this series. It has Reviewed-by from Puranjay
Mohan, Acked-by from Xu Kuohai on both patches, and Tested-by from
Clayton Craft and Nathan Chancellor, with no outstanding comments since
Jun 11.

Could you please consider picking this up for the next cycle?

Thanks,
Jose


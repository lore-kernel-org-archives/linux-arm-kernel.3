Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC086C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 16:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b9v2ghu23w6IEvHEzndJ6QZt1BDFQevZAviA6K0gFiU=; b=mNrCCT8j866vXllxH04csbJ6cR
	C8mQEi8VV7YD+bcEH8Ny70TG3PpxkKLWTpF+LPos9X5EcwtUuY3zgZ8VbWhWy7B0fTYZYJV0ufb9J
	OZ946w6gCmqEFgWWD+bzfmhLkN1BpR0rA2jjZqn1UKXIlkKImCnRg9U4cZtxH3bu3xKo3Lva8t4GZ
	h8pBbtH0zqCsJpnFZtEqF5rQGlrkT9rMHK1l4X86LgwrJ+4zS0amQI2Lp+AdxWtKML/41aIo93src
	FqEgOnZjZU0Km9TI5sjwEdBLIINyq+nme9S3w0VEzIcgSNBWHL70QDTidtQr7jkypVjdgGA0ma8p9
	LIwXH/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJoY-0000000A0wB-2zIx;
	Mon, 13 Jul 2026 16:47:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJoV-0000000A0vL-48Wp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 16:47:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B34B1576;
	Mon, 13 Jul 2026 09:47:22 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1EF33F7B4;
	Mon, 13 Jul 2026 09:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783961246; bh=C7m0ay4Wok2aZExypT2fKxodJ0Su4287V+SfZq2ie30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tFthWxMYZoBdRiXm+DKTNJJJ8ueHX6N1C6OLGagBXpDRcCQbEVRkb2LQNyiK/JdZK
	 8SQHnGOQUIUqf1s8HGA1iiDWjhzEI6ya8owNxNlvwxRbJ2GyEyjFSan1P9yJoO1ORN
	 2noH3F3ijOd274JXEQkP1H9P6R+JhL5xvnihHKvc=
Date: Mon, 13 Jul 2026 17:47:18 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Clayton Craft <clayton@craftyguy.net>,
	Xu Kuohai <xukuohai@huaweicloud.com>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	bpf@vger.kernel.org, Florent Revest <revest@chromium.org>,
	Xu Kuohai <xukuohai@huawei.com>, Ben Cressey <ben@cressey.dev>
Subject: Re: [PATCH 0/2] arm64: ftrace: support DIRECT_CALLS without CALL_OPS
Message-ID: <alUWljnhfgLB_4a-@J2N7QTR9R3.cambridge.arm.com>
References: <20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev>
 <alD7Rr659mGVznQp@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alD7Rr659mGVznQp@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_094728_326416_F9642F1A 
X-CRM114-Status: GOOD (  10.38  )
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

On Fri, Jul 10, 2026 at 02:07:01PM +0000, Jose Fernandez (Anthropic) wrote:
> Hi all,
> 
> Just a gentle ping on this series. It has Reviewed-by from Puranjay
> Mohan, Acked-by from Xu Kuohai on both patches, and Tested-by from
> Clayton Craft and Nathan Chancellor, with no outstanding comments since
> Jun 11.
> 
> Could you please consider picking this up for the next cycle?

Sorry, this is on my queue to look at, but I have been busy elsewhere
over the last few weeks.

I'll get to it shortly.

Mark.


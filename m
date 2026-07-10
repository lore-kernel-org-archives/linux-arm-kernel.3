Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4D3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 15:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfdZi5IAsAh/nmQjoUYUGkCmzMNnX1yQRLMIvJ0sJmw=; b=kmMIAuHVwleMGFjOtXpZk8Drdh
	FOA6a+sy+SLJMPEHqQnIXEVd8Q3lmuRGBddR+J8yg7o9iy1JwirG3Fm+qz16ioUAUVMmVsfoj1glx
	Th1NiNegMvcLAj4JMBnpVXQp55g1py1FeVcq8Q91JVvMmEh8Ijv8sIpkLlmWNlrAjeWJ+7J6VyG6D
	YlLeyE9bKDltF0qbAG8L2ufcOxjF3ajU6pU/L4qUQZoleCqYyFlvS8MqJ1B5cCdt+uJgp6pX62FI/
	3aLtFBmlvNqwqwgxWDRIXfch2iU/sj7UTBMqAeXgIUzgEGJ6yDfui6wchz3o9PSYiQBvJob3Fb4BT
	NQ2AHYIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDZj-00000005E5m-3bjs;
	Fri, 10 Jul 2026 15:55:39 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDZc-00000005Dyt-0SKS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 15:55:38 +0000
Received: from omf16.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id EB2BE1C3C34;
	Fri, 10 Jul 2026 15:55:25 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id F41F62000E;
	Fri, 10 Jul 2026 15:55:21 +0000 (UTC)
Date: Fri, 10 Jul 2026 11:55:31 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Puranjay Mohan
 <puranjay@kernel.org>, Clayton Craft <clayton@craftyguy.net>, Xu Kuohai
 <xukuohai@huaweicloud.com>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 llvm@lists.linux.dev, bpf@vger.kernel.org, Florent Revest
 <revest@chromium.org>, Xu Kuohai <xukuohai@huawei.com>, Ben Cressey
 <ben@cressey.dev>
Subject: Re: [PATCH 0/2] arm64: ftrace: support DIRECT_CALLS without
 CALL_OPS
Message-ID: <20260710115531.626f1e09@gandalf.local.home>
In-Reply-To: <alD7Rr659mGVznQp@linux.dev>
References: <20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev>
	<alD7Rr659mGVznQp@linux.dev>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 1b516kuk3c4c1rip1isp7pq1m9efroyd
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: F41F62000E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18VXkSf3RGQ5/OWlm4BQJh8NrDk/AyK9ZA=
X-HE-Tag: 1783698921-218184
X-HE-Meta: U2FsdGVkX1/ARi1Y+mMDcyLyMrsGbKd8T7pdCf3U5E+/bEmvRcWpNpXMmXFAgmgQMwx0coL3oTGo4ESx3LzWsN1pJmM3FEVw1cXW/ZqiiFvJm6lNo4WwQBEjcMMBNGYhriRw/3qCHxJrXwO57UxmANF2ZDarJOslhYoxzt+nKE+Egpr8HTSxXDGHCy6fYPwOT6MLrGRO6VDzD9hgX0Exofx8itHAHSGHRhc9oL/9FOeNb4otrGD6dqzaYuIeMhNuoIMGctXbBVpWkX/CEtLSyx35MgrrZpd3sC/vh8JCgQ7Ar6kabtuYyRvO16SvoSWN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_085532_208662_460D5938 
X-CRM114-Status: GOOD (  11.13  )
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

On Fri, 10 Jul 2026 14:07:01 +0000
"Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev> wrote:

> Hi all,
> 
> Just a gentle ping on this series. It has Reviewed-by from Puranjay
> Mohan, Acked-by from Xu Kuohai on both patches, and Tested-by from
> Clayton Craft and Nathan Chancellor, with no outstanding comments since
> Jun 11.
> 
> Could you please consider picking this up for the next cycle?
> 

As this is arm64 specific, the decision lies with the arm64 maintainers.

-- Steve


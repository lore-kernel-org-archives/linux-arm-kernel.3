Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F321E63FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 02:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Cc:To:Message-ID:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PunSjdqwJyyK8xVRTMZcyWUYUB7330A/X6be6g6ILM4=; b=suyuNqY6zoMQxvV18ZEkmSHPCZ
	1goSsyQIsGmPKenpq5Qa++tslqdHxoe+Bvh6ji31TUjm11hFjgHV1ehTd5qxEe0VCDFGwsU5J4mPP
	e+68UdttrCmVc/VOhvbn/GuBATwZ8djsTv3eS/pxrLJ+w9jXgLM9jyJ8URb2EulaRg2kRY6mXoLaq
	6WjKZugVopPht+SeLf305u7J2dI1NWL9wymrs7aQqmnqnX3FG5UQLrUr5N96Gk2QH9hg1RFNJ3iVT
	147/ZlAtThBAe3Wvx9vtiroOR+gdaKs2xU/siKXbceJdP182keGEmoLDF/4WFISZf/wk9HrFoUteb
	32lsddSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9D0y-00000003tn6-3gdQ;
	Sun, 05 Apr 2026 02:15:04 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9D0u-00000003tlo-2JKv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 02:15:03 +0000
Received: from 0001-arm64-pi-reply.eml (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowADnjGihxdFpPAU5DA--.3581S2;
	Sun, 05 Apr 2026 10:14:57 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Sun, 5 Apr 2026 09:40:00 +0800
Message-ID: <20260405094001.1-reply-arm64-pi-pengpeng@iscas.ac.cn>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
In-Reply-To: <20260403143004.4-arm64-pi-bootargs-pengpeng@iscas.ac.cn>
References: <20260403143004.4-arm64-pi-bootargs-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] arm64: pi: validate bootargs before parsing them
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADnjGihxdFpPAU5DA--.3581S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4Utr4kArW8XFy8JF1rXrb_yoW8Jw4UpF
	WSgan29FsrKFZay3s7ZrW5Aw4Fyr4fArWfGFn8tr1ay3W5GFy7ur43KF4Y9Fy5ur40ka90
	9FW5KF98Aw1UC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUSNtxUUUUU=
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_191500_971979_390EC1E1 
X-CRM114-Status: UNSURE (   4.73  )
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

Hi Will,

Thanks, that's a fair question.

The reason I cared here is not that we can make every malformed FDT survive
cleanly, but that this particular caller turns a raw property into an
unbounded C string immediately:

  fdt_getprop() -> strlen() -> __parse_cmdline()

If `bootargs` is not NUL-terminated within the property bounds, `strlen()`
can walk past the property before the parser even starts. By contrast, a
NUL-terminated but semantically bogus string stays within the property bounds
and is then just handled as bad/ignored command-line content.

So the issue I was trying to harden is specifically “raw FDT property becomes
a C string without a local bound check”, not malformed DT handling in the
broadest sense.

You're also right to ask about scope. I do not think every early
`fdt_getprop()` caller should be converted mechanically; the ones that matter
here are the callers that immediately feed raw properties into unbounded
string helpers or parsers. This arm64 PI bootargs path is one of those.

I will rework this around that boundary instead of pushing this one caller in
isolation. In other words, I will audit the same early-bootargs family of
callers and only convert the ones that have this direct
`raw property -> unbounded C-string helper/parser` shape.

Thanks,
Pengpeng




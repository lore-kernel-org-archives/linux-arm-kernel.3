Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB31E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 08:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IeQj/164SGrmH9lzgL8p5lsNgKqMm7GxQlCG6lh3BS4=; b=eWXBvM5be/cGDQEdXe94xXcnoc
	L8avgOJd0LF0nEqDboaIpn7XLslhEcXXAw0zLmphYKAOMYOBWRabV7LkMcf7aLKkGmJoZbv3P9A4Q
	OYv9LwYZuduo4RIzV8rAqjwXCKMXcBsJZrZkggocrorWcDzwjXHmBoAPKOSWPSuamBCK5chSWb2T4
	TNZOKKW5PazT9AxcwWx09GeE/cOtJXGD3gTw0DbhnArHrwuEaaiBo45CaqjMVuMHN20SvaCwZF0zj
	TMVQMKSglzuhDV/8zs2ZqVKBgWNTmj8kgS0W5T/EYYKJs1TAUlXTimmb0kLTUKFy2QrQsletXaFF6
	FETI2ohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWWbL-00000000Pd9-0kJx;
	Sat, 11 Jan 2025 08:12:11 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWWa6-00000000PY2-1oA0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 08:10:55 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736583049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IeQj/164SGrmH9lzgL8p5lsNgKqMm7GxQlCG6lh3BS4=;
	b=n/VjPBu6RVxY/jd7/8ahukh+XhN8jl0TOU60fQm0lvgPHNpL5UGHyPLCU4qiDpVuz/P/fM
	Baq+YHYooJezQqzqekMCLlKMDROe+sbMilyNnTxxRQaZT1GlIgmmFOssoQKMCxCgPeHpdu
	C2TRtQU+y06mrOz5qDqZFIakhhG8EK6oniyYfefyQ0Qj6ibsdOBPmw0o736XKaWL83RMUG
	MMwg4rR7lsDvJ6EI0tIRjarpIGlnEZct3TDYkfCnEKtNiJxJu0ae1kOpHaD5Bwb/ZlRo4x
	zX5UlKMToWVyF+B/iGJphUlhJm6CItkUEGU2CD4aRwBKTLDFYZYOU2fBcpdItA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736583049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IeQj/164SGrmH9lzgL8p5lsNgKqMm7GxQlCG6lh3BS4=;
	b=U0RLWQenj5Pis/8c/yvegsbHfJFijpGnoXgqcP3V+STKLFb6zDGjAw6m+UkuSPoY2qE5Qj
	/wyWXytrTVwfqOBA==
To: Sean Anderson <sean.anderson@linux.dev>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-serial@vger.kernel.org
Cc: Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Michal
 Simek <michal.simek@amd.com>, Thomas Gleixner <tglx@linutronix.de>, Sean
 Anderson <sean.anderson@linux.dev>, stable@vger.kernel.org
Subject: Re: [PATCH] tty: xilinx_uartps: split sysrq handling
In-Reply-To: <20250110213822.2107462-1-sean.anderson@linux.dev>
References: <20250110213822.2107462-1-sean.anderson@linux.dev>
Date: Sat, 11 Jan 2025 09:16:49 +0106
Message-ID: <841px9u5x2.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_001054_611581_F4B4E9AB 
X-CRM114-Status: UNSURE (   7.06  )
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

On 2025-01-10, Sean Anderson <sean.anderson@linux.dev> wrote:
> Fix this by splitting sysrq handling into two parts. We use the prepare
> helper under the port lock and defer handling until we release the lock.

Note that this fix is only necessary because this console driver is
using the legacy console API. For the NBCON API it is allowed to call
printk() while holding the port lock.

But since code already exists to allow deferring the sysrq execution
until the port lock is not held, this patch is probably a good idea
anyway because it can reduce port lock contention. AFAIK there are no
sysrq actions that require port lock synchronization.

Acked-by: John Ogness <john.ogness@linutronix.de>


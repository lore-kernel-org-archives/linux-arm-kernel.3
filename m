Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D8DC43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 13:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czGvkONbU3gBgqbKsbSlbR1vwEDU0TwjN9yj6UAgoM4=; b=3QXL3C9DUB7JvCatVJVV4ebOVx
	caqXT8JoSVIXuRey6t6CFpoDkBrhIGkJqw6GVQguV+5t7NHYI2nmqgje9VqFEOT0ZRvbn2QUpC5Bi
	lK4rCPe1VXGhi6wTgcDfcQkcc38ZHworbbkfKBqL6cN6IwGhH5xRexmOSF46Sjo8KkJmXr8KtjxcZ
	+8PgLQmxRIhmFLqHn/KfJZdHXsOJt1iMikIDT/4jaljkwwBpFK0Jb7Mg613weLWs+JL/fc+1r3FJD
	vYTkylNNAA8TKanGZY6zFIUiAIRwOHSIaZnQnU0rtlmrIA9Lv6CdGpMNyjuKYW6WEOTlbdZkIHVvD
	DGUJUa/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBoL-0000000Eib8-3hpN;
	Mon, 29 Jun 2026 13:14:05 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBoK-0000000EiZx-0CgZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 13:14:05 +0000
Date: Mon, 29 Jun 2026 15:14:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782738842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=czGvkONbU3gBgqbKsbSlbR1vwEDU0TwjN9yj6UAgoM4=;
	b=k1mT0SygWH9fdcP3ueR9lmCcPcOTsb+gpIuGBeFrjhRP/xvgqs8lT5ZqcSr/vFQjW0qLz4
	GG9JHJwUisPTECmjDRO4adnorpJUNt65Fv6+zvCjAUAbOlATXRk0rlnN+AaCJhugvclxBF
	53jVcHzBGBoHayYOk10B4iFGsHs/FeHTkJgeuFI9ER1O/D1yTU09PLSfri90OkKRhv/xIA
	tcrCw4+FpxWJIEFxkYYO1P+7foHRdq3JJnlOpVdt+g/8jeAsdjG6emFf/YIO1xRaOXPHpi
	lGrkQtTVdgDBxybBWPeyXiWUZ1kxwk2gcp3o5MtJsatPz2JvWDyx0DB5402G3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782738842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=czGvkONbU3gBgqbKsbSlbR1vwEDU0TwjN9yj6UAgoM4=;
	b=Pfl56ZMNZNA2CY1i9zNYEr5B9imW89ugJUC2JwyC4OjxoPmv6WS1e2ZkHVV/eQ0fL7D/kF
	wBv46H5D4AdbkDDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux@armlinux.org.uk, clrkwllms@kernel.org, rostedt@goodmis.org,
	rmk+kernel@armlinux.org.uk, linusw@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, liaohua4@huawei.com,
	lilinjie8@huawei.com
Subject: Re: [PATCH v2] ARM: enable interrupts when unhandled user faults are
 triggered
Message-ID: <20260629131401.tzYFtfKk@linutronix.de>
References: <20260629123349.134224-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629123349.134224-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_061404_237195_CF4BF4AA 
X-CRM114-Status: UNSURE (   9.44  )
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

On 2026-06-29 20:33:49 [+0800], Xie Yuanbin wrote:
> PREEMPT_RT requires interrupts to be enabled when sending signals.
> 
> When do_DataAbort()/do_PrefetchAbort() triggers unhandled user faults,
> that is `inf->fn()` return a non-zero value, and the interrupts are not
> enabled within the hook function, force_sig_fault() will be called
> with interrupts disabled.
> 
> This can be triggered by user programs executing the bkpt instruction,
> with kernel config CONFIG_PERF_EVENTS=n.
> 
> Enable interrupts in do_DataAbort()/do_PrefetchAbort() when unhandled
> user faults are triggered to fix the issue.
> 
> Fixes: c6e61c06d606 ("ARM: 9463/1: Allow to enable RT")
> 
> Suggested-by: Russell King <linux@armlinux.org.uk>
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

This fixes the issue that can be easily triggered.

Sebastian


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3E3C9EC6C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 10:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJ30r4s9JNVDOs08XoItb7A8PBXYBWc6ehBM1OMI0cQ=; b=V4AtWvt98Kb7V4+um6ahyk+Iq7
	UCcMlYgSzMELKp6KSmpcLG+wOmEP39ZD6YH2M2zdioZw/Fc01dOUi+3l3I2e+Uuc+3lEPTt02bL+Y
	wohMHtD8zbxZ0N1ZeqpX3BXFibFdIN0seJgicrEz8S41L96iD9c4gdiNVuKPSArLMq0z6K4053hKP
	SbhqsOx1Z2uMd7MbyA2E8aDn3FaN8vaI+wNUPN23svo8j2advLTmoxpAqWsEuAdxqdDc8YMii9BSg
	oJvezE1yiUmGeXAjF+FJTd+Xrtc7pUElNMJ9slXnKhfNjcNsUmeFAwdkIAJBukkz1jizSDs8i4aBe
	pnJxlx9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFUS-00000005CZW-2MYD;
	Mon, 12 Jan 2026 10:49:40 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFUQ-00000005CYV-32Qv;
	Mon, 12 Jan 2026 10:49:39 +0000
Date: Mon, 12 Jan 2026 11:49:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768214975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PJ30r4s9JNVDOs08XoItb7A8PBXYBWc6ehBM1OMI0cQ=;
	b=pcSudjNSByhfsxPBkFJ8iU8w00OlDeHhGMVQeg3LeLXGYfaDx38ebtd1F6TrmjaDNyga6C
	3dSitcYly5KKUVRqSwcFE2dUG1aGQnFU1j/DHhTGezhx9FWSKbxFNZ/QfVAmbytu7madwW
	WAelKPZNbQc3tctTuq1eerjWtrIjmWoDXWvcZyFfNk/OBoicN4RVmqfWsvTq8s98hqVr3/
	f3vY9hG9y2CLNNnhz8xoiK4Ybpa4OEJMxJmFtDVRsjFrlgagM0MujC2hXEtm4Z/F8GJzBt
	4YiNRXR5DvqZli5DbK2xAHIPO3qI+Cx5uQMldf9DKHsCc96DiaLosz3912At6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768214975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PJ30r4s9JNVDOs08XoItb7A8PBXYBWc6ehBM1OMI0cQ=;
	b=nV+eCtLlgggs3My7oIP0idh01II+8cE0lOu97fWlvyiAvXaT6nyY/UkM96S5w8YzzucY6k
	7JXQ9tOSqYh+WbDQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/5] uapi: fix remaining kconfig leaks in UAPI headers
Message-ID: <20260112114744-21ac730f-68b4-4f92-9ac0-f4dc6c5bb880@linutronix.de>
References: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
 <b78c96d5-bd5e-47b5-86b3-e06855fcd6be@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b78c96d5-bd5e-47b5-86b3-e06855fcd6be@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_024938_899617_977C0292 
X-CRM114-Status: GOOD (  11.10  )
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

On Mon, Jan 12, 2026 at 11:42:55AM +0100, Arnd Bergmann wrote:
> On Mon, Jan 12, 2026, at 08:58, Thomas Weiﬂschuh wrote:
> > A few UAPI headers still contained references to kconfig symbols.
> > Clean them all up and afterwards remove the now useless exception
> > machinery in headers_install.sh.
> >
> > Intended to be routed through the kbuild tree.
> >
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > ---
> 
> Whole series
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Thanks!

(...)

> Should I take the series through the asm-generic tree if there
> are no other concerns, or do you have other plans for merging it?

I had the kbuild tree in mind, but asm-generic sounds equally good.
The asm-generic tree will also be a better fit for my follow-up auxvec.h
series. So let's use that.


Thomas


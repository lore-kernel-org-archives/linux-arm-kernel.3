Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7568E7E0DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 11:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4KhYmKsCBYrTSyS7CCAiq0B/cytaIy8zlbS1/jfm5Uk=; b=H5n12trSoTy/N+36tStv65bQx5
	JQQMNG9nPrH4CjPQiEPUbGJJk9HN2Mg4jMN4qBY/IZ40LaW+85ZoBkFd2n5D4D8y6WqR3AGTaeB2P
	PfguEFVJSZSac2lTgBfZCIFbL1BVb1Zg9hN6hC6NtKsjrF3VM1PXaRCdABb0Oek3OuALgJpUETA87
	9WtvRWueUtIXwvkoIN5XrzvFu2Ok3DWRg+stLV1sHH0IRx+RK/6I1dRjr49XmKJZ/YCpAvoBatKK8
	ecAw8Wp5xBUukw+3wjOgCUP95MbABhqMpzPc2vC4JnTq2Z65QWKdZxH7Ut76B45hh2jccAFgEnhUH
	jg5SotEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpmEF-0000000GtzC-16zx;
	Tue, 10 Feb 2026 11:48:27 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpmEB-0000000GtyN-1OTh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 11:48:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96DEA1480214;
	Tue, 10 Feb 2026 12:48:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1770724097; h=from:subject:date:message-id:to:cc:mime-version:content-type;
	bh=4KhYmKsCBYrTSyS7CCAiq0B/cytaIy8zlbS1/jfm5Uk=;
	b=Egu39vtFNsOSiUiHQmU09Wnihsw1RKE33faVf9rSvFW+UhTK22mzyj0CHIW6Lqd4n5GAU4
	AYDrrFhcULlPKgLs0sj9kI9dSEXSJotAmhUE5Py5tLn/xgpv6FmLGXIsy7xJZtNEm1xdkg
	8ddcIdohds0MR0xK95Gpjh8jfSpZonD9zPA1UvO7K6RZNAGfIlca119J2EA3DZKouDiibw
	RLnEwuNYT0ZU8Mg+UVy3rcWecqGPC9DoM4dY2EXYqd6SACjI24wrwFVKX9iPc1q8rJxiyX
	AHJCIHApuHXmhShlkAEHb3kvoCLSdYD6imDfNqUNSjsMbo42Yy6Lt24v5ancFg==
Date: Tue, 10 Feb 2026 12:48:05 +0100
From: Alexander Dahl <ada@thorsis.com>
To: imx@lists.linux.dev
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Roelf-Erik Carsjens <rca@thorsis.com>,
	Josua Mayer <josua@solid-run.com>
Subject: rts-gpios support in fsl_lpuart driver?
Message-ID: <20260210-rearview-hungrily-536a95fc3385@thorsis.com>
Mail-Followup-To: imx@lists.linux.dev, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Roelf-Erik Carsjens <rca@thorsis.com>,
	Josua Mayer <josua@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_034823_859296_763F58F1 
X-CRM114-Status: GOOD (  15.26  )
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

Hello everyone,

we are currently experimenting with the SolidRun 8XLite SoM featuring
an i.MX 8XLite SoC on a custom base board.  Due to how our peripheral
hardware is connected we need to use rs485 with uart3, which has no
native soc controlled rts line.  On different SoCs you just use
'rts-gpios' in devicetree then, letting the kernel switch this line
through gpio.  Alas it does not work on this SoC, the RTS line is not
switched at all. :-/

According to my analysis the i.MX8 family has different variants using
different uarts with different drivers.  For the variants using the
imx.c driver, you find dts files using rts-gpios, but for variants
using the fsl_lpuart.c driver you find none.

The rts-gpios property is evaluated by the serial core in
`mctrl_gpio_init()` right?  And the actual switching is also done
through that mctrl_gpio interface, right?  As far as I understand the
source code, the serial core calls the .set_mctrl function pointer,
and then it is up to the driver what to do?  Some (like atmel_serial.c
and imx.c) call mctrl_gpio_set() in the function mapped to that
pointer, some (like fsl_lpuart.c) don't.  Correct so far?

Up to this point I'm somewhat confused this is no generic feature in
the core which works for any uart, but there's probably a reason for
that?  Maybe interaction with the actual uart registers in some way?

If it is like described, I'd say the fsl_lpuart driver currently just
does not support this usecase?  Is it possible to implement the
necessary things?  Is anybody already working on that?  I looked in my
mailing list archive and in the imx downstream kernel, but could not
find any hints.

Any advice welcome. :-)

Greets
Alex



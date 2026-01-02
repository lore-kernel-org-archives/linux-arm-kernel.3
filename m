Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBE2E9410B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TbnXFaQL1BHk/nnr/YbkuCM39uw199pGBXZav5QhW0Y=; b=pLmcKeZm/XjkSpxlGION6dn5OV
	/NVPTPcN3mpQOHtiMePhWRqLzerbfRL3L3EaXl7AE9oQtJwgNfuATO2LTH/OOPLiDz+MBbsPFf6UV
	+4nDmluX5zp6ntg5hSS1uv7BhqLdy0Xori72sYctZYi4XdAHRju3KPCmBUvFF40UBvuxGV4fpFZ1B
	Y+NfoFmaEZchlFtiJU53QewtsScJcNxF08UJLutl6dApubWglQ6ExkJhfQqIUx1LAY70W1XTdVys/
	UWGk+oDknXyyGGy9yerAwuhi0zRfdWz1XVfaot0fV7xtNjoePNObuVaSpj6zs/1VMILHthRC4A5aL
	h44Xu3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbbYE-000000081Xf-0Vqj;
	Fri, 02 Jan 2026 09:34:30 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbbYA-000000081XH-44sc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 09:34:28 +0000
Date: Fri, 2 Jan 2026 10:34:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767346464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TbnXFaQL1BHk/nnr/YbkuCM39uw199pGBXZav5QhW0Y=;
	b=KP5DBCqWu3lIBNmEbPnrwXl1Hq3DVJffX8GUaUYHJSMhnq6k0olvVhFI092UJkuLRhnd/3
	noYE0mlvDK4BvW5pjdmyXDX6UcwxEbQR8+61EFCIWp2JeM/hUrc+wpgvUZeXGSNXzE3CjU
	mLGcwOmejSyhrm9isGo7PUDXqRdUsIUaxcFAehI9k7RSKSiQCQSjQGAfNZU4KcP0N1ykoX
	vz+vscW/P7AWZTbTSwSLwDac9HBrJG8MCMBi/PfA8UJGRjtgpqu0zORovVw6GDG8akBjH2
	Wd8oQIm19dWxxQb6H9WhcvDXq0N8gW01SGBqkPaFJPXn2bw62qEDntPMJqB3qQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767346464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TbnXFaQL1BHk/nnr/YbkuCM39uw199pGBXZav5QhW0Y=;
	b=toO6P0/+7eBLhQku5/wCgiMx9NpDABvmuNGfkieHlpRmXq1GnDIeC88PH7ASOb6ec0di71
	ovyy9CXQUs4VbQBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Russell King <rmk+kernel@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: fix memset64() on big-endian
Message-ID: <20260102103055-cbb5af1d-0704-434d-b4b0-648d334c8b6e@linutronix.de>
References: <20260102-armeb-memset64-v1-1-9aa15fb8e820@linutronix.de>
 <bfd7776e-574a-4828-99a2-f70a3b9015e6@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bfd7776e-574a-4828-99a2-f70a3b9015e6@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_013427_188064_DADB3C71 
X-CRM114-Status: GOOD (  13.05  )
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

On Fri, Jan 02, 2026 at 10:24:33AM +0100, Arnd Bergmann wrote:
> On Fri, Jan 2, 2026, at 08:15, Thomas Weiﬂschuh wrote:
> > On big-endian systems the 32-bit low and high halves need to be swapped,
> > for the underlying assembly implemenation to work correctly.
> >
> > Fixes: fd1d362600e2 ("ARM: implement memset32 & memset64")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > ---
> > Found by the string_test_memset64 KUnit test.
> 
> Good catch! I guess that likely means you are the first one to
> run kunit test on armbe since the tests got added. Did you find
> any other differences between BE and LE kernels running kunit?

No other differences with the default set of tests.
There was a failure for both in test_polyval_preparekey_in_irqs, see [0].
To get some more exposure I propose a new kunit QEMU configuration in [1].

> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Thanks!

[0] https://lore.kernel.org/lkml/20260102-kunit-polyval-fix-v1-1-5313b5a65f35@linutronix.de/
[1] https://lore.kernel.org/lkml/20260102-kunit-armeb-v1-1-e8e5475d735c@linutronix.de/


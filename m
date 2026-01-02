Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B03E9410B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 09:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kS11IUBVdxrHLhATkhOXZm6xlvRRsZAYpnTnAo0yD7M=; b=vFoN5xQ/Q45C0Wgi9hg1Zl0oEx
	XelGIhAjw3KsBvT1kOX5qqzYScWPnT81t/tzKUh5f8Y9F+0xCN4Amvz9K7D2rP410eya8/bFDkDEN
	J6dfI9K/lvuLjZqWi3VjUT2D91CtAwTnb8IN05SQH1GwN2/so9l1IjTT9aXG2y4HX+lrLFDQI0tvk
	brZ7xkc4VAIND/37YKeRTt75ENriJE+t6qW6AinLx0HXSG1q5rgMG6Kx4eh5bGNSB/pY8MQDjdCeo
	wuUdeRfJJk3noH1kLBPK/a7WZo2onJBUCwvSXJCSm27hW9S4f/9pHlFf/b9266xzsYlDxVO3LjRYD
	H1BG6OdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbbeN-0000000823G-075Y;
	Fri, 02 Jan 2026 09:40:51 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbbeK-0000000822l-2d8o;
	Fri, 02 Jan 2026 09:40:50 +0000
Date: Fri, 2 Jan 2026 10:40:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767346846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kS11IUBVdxrHLhATkhOXZm6xlvRRsZAYpnTnAo0yD7M=;
	b=dt/1fRoAd6IzelZylMRg+LHKUqWaf+v02F7sJ6wKUYKewjWCwMLBh3FSakH855CMojEN3n
	rHaFul6oQLj1C7RLiqIgu0x9gzPvejH6HMFsUOfj16YZ1Uwr9uiqk4Hiz0x8zmSU1tzBGY
	T9p1zg3uV09amWdXrlE+kXGf4s1ZI5R6oqJFbOznmmD9BbT+qwQKg54RqreVg4j0s0mNtV
	uhuS7DROnZDArGckLp7xbJYR+DY08ZrYgyZRJH6+my9NZlYw6QASM/MEDmxFyZeP/39TDJ
	g7BAdnVi2u+Y9qvtaR4MsQdX41QBIjOz+IIhA7iPJ7HaizkXVdTW8qdU4pIA8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767346846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kS11IUBVdxrHLhATkhOXZm6xlvRRsZAYpnTnAo0yD7M=;
	b=lwVsPOr/ePqTDg9FOhofZxLxyEyOQnWHgYwH41WF4kDdNITi7YwB4qxNsGANpvd4Nfbc4F
	2jGx8UWOsVTmFpAQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] ARC: uapi: Stop leaking CONFIG_ARC_HAS_SWAPE
 reference to userspace
Message-ID: <20260102103913-0420048c-d2f3-431b-8bbb-5962a1553aab@linutronix.de>
References: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
 <20251230-headers_install-config-leak-v1-1-efba5c58073d@linutronix.de>
 <9ecebf46-c230-4074-9001-7ba9d65634f1@app.fastmail.com>
 <20260102085226-c6463fff-042d-4654-8721-27e995f06c7c@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260102085226-c6463fff-042d-4654-8721-27e995f06c7c@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_014048_833927_A511F93D 
X-CRM114-Status: GOOD (  18.54  )
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

On Fri, Jan 02, 2026 at 08:55:10AM +0100, Thomas Weiﬂschuh wrote:
> On Tue, Dec 30, 2025 at 10:23:08PM +0100, Arnd Bergmann wrote:
> > On Tue, Dec 30, 2025, at 08:10, Thomas Weiﬂschuh wrote:
> > > UAPI headers are not supposed to leak references to kconfig symbols.
> > > These won't be set when building userspace. Hide the kconfig reference
> > > behind 'if defined(__KERNEL__)', so it will be stripped by
> > > headers_install.sh. The result for userspace will be the same, but the
> > > exception in headers_install.sh can also be removed.
> > >
> > > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > 
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > 
> > Same as for the nios2 version, I think the nicer solution would
> > be to use the asm-generic header for uapi and move this one
> > to arch/arc/include/asm/swab.h for kernel-internal use.
> 
> Ack. (...)

This doesn't seem to be true. ARC does have a custom C implementation which
according to its comment is supposed to be more efficient than the generic one.
So I'd like to keep this as-is.

(...)

Thomas


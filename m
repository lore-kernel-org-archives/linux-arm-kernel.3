Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1026CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 13:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zw+RT1NKAF0aQaiZlH21SqdyQS0ZhWGU3d3VMX1aeCU=; b=czAt8sFU87Jta0QSnC+S2AvNQd
	xSnZPgJeJTemwapsASIBGF3LVZMGDwKUQ+iI1JksfZ8C4HMSv7rqX2po0+36UBC/U87GMQbnZsXEC
	u5JaszORzYYPtJlCSILwf+Vp7FquIcuPoqtkOebN5iXD3uBXCBXWzGIMB8dt0Dtb9kQIS1WcFHWKD
	yBWVw8lhtBp90Vn/ZguXbuEoTOo5tHrwgsZC2/I46k2ZJm3/GjfiTuwpiFE4sN3L4nwebqbFrbSVA
	9Cs81Sl5yP+gi0fZLIhiIXfPmZp5y50QqPvIJSZLTKrKbN7vfIu5EEt9kgOC5xb7JbZnPfwWIBp4R
	sPEe/p9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBnN-0000000EiHR-30jc;
	Mon, 29 Jun 2026 13:13:05 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBnD-0000000EiCg-401e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 13:12:57 +0000
Date: Mon, 29 Jun 2026 15:12:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782738773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zw+RT1NKAF0aQaiZlH21SqdyQS0ZhWGU3d3VMX1aeCU=;
	b=tcGHSbz6F9WV28RDo6yMc33jFoeHFRxclQbLRtFNJGpZnDuUQHjPW3GDaZorxrvO3DWdk3
	jcbya2ESSg60KejCZJgZwsc3LGZTtbc16peFb/2C1C3yfvXo90YVvhvz9saqDnXTB1j4+I
	Kjb6pOKetBihkbIXOrJzxTy34nG+BRYGAN9ILGCEcTNZ1F+PLBZeq5W4Ay1+aaWn0M/k1d
	L/06YWSEmvFnff7wYohtJOf72qrEJ8HSWXeM+mWAnsFy5tFeNWKhOBTSdwDVpugcLgKgiP
	wuP0jzXl/QwGvyt+1BpskRHlxzi+ofr3V8/ONpAS3pxVxoWHNGQsSV5PRQFCeQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782738773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zw+RT1NKAF0aQaiZlH21SqdyQS0ZhWGU3d3VMX1aeCU=;
	b=D4x+DcX26zcpwPseZ1+GItizECXYop0z6vMgenhXufoZyEqvGtDLzPhn9uIBFjv3v8K+La
	r0E6dDB4wF8v4KBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux@armlinux.org.uk, rmk+kernel@armlinux.org.uk, arnd@arndb.de,
	clrkwllms@kernel.org, liaohua4@huawei.com, lilinjie8@huawei.com,
	linusw@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	rostedt@goodmis.org
Subject: Re: [PATCH v2] ARM: enable interrupts when unhandled user faults are
 triggered
Message-ID: <20260629131251.1odjlGCC@linutronix.de>
References: <20260629123349.134224-1-xieyuanbin1@huawei.com>
 <20260629124816.136079-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629124816.136079-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_061256_152274_0C056258 
X-CRM114-Status: GOOD (  15.74  )
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

On 2026-06-29 20:48:16 [+0800], Xie Yuanbin wrote:
> On Mon, 29 Jun 2026 11:40:22 +0200, Sebastian Andrzej Siewior wrote:
> > If this is moved to the callers of arm_notify_die() then I don't know
> > what to do about baddataabort(). It looks like it gets invoked with
> > disabled interrupts, too but I'm not sure. This looks like pre ARM v7.
> > Is it reasonable to add such a check there?
> 
> Oh, I'm not sure about this place either. Would interrupts here be
> disabled? I'm not familiar with the entry assembly code of v4t, so
> I don't know how to construct a user-space program that can run to
> baddataabort(), and I also don't have a v4t device to test it.

I don't have anything myself but it follows the same pattern.
Sashiko just reported that it is a pre-existing issue :)

Sebastian


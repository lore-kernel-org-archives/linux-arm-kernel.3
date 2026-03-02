Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7D8E9B360
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLZCvpYavonv5dbpKzNlHqyAwQ9wvWP05tDkSZR/dxA=; b=XgqUyaCEYBErIQ8THMnBeNZwjp
	CV8KCXfg6yAUddAvxiO78EotcVZTpDFEXIjgNVQrN2nCpb1xR6U0ol1H08wSyBhgDjZhXZNQwDgt7
	VEQ4SupzBv0ow9ZKNuOjYc9oQij3Pj1RpaGY24IobZc3qoqACqmZJnNaZBR8DqZuvaraVQC1Y8O0a
	CJ/zKypxIxfdDS6D0Gge8LjvFaeN87wxUCJ82JbCmK6WjhHGrIxpbHld1zS1+nHlb/TDpNmjEYIfG
	vjjfzHaWAYXNHdFrezXQBAYBR+6Tkm+z2c7KmJWMSkp8e4CShK4zjDRLpqFqtVlqvURR8i/hACW4U
	63ehaOqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0mb-0000000Cjd2-0Qvd;
	Mon, 02 Mar 2026 10:45:49 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0mY-0000000CjcT-3cYk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:45:48 +0000
Date: Mon, 2 Mar 2026 11:45:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772448344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TLZCvpYavonv5dbpKzNlHqyAwQ9wvWP05tDkSZR/dxA=;
	b=LtXlbdojtrbs0uq6Wwtk9r54gJcT1kbDZSyUNGVh3YGB8JMuBqShdlA9mQZRwP3GAlpwHx
	vYIusT2RodLYDqmlBIIUfUOIa65LsPUGCtm/AcA39nweqRHFZ5ekh8OVGGwQSjmQIcvf0S
	QN8zUWnA3T6z5pXTzql0trmro4NAwSHSHxfSlroC5auaBuWycFQJWzQBOQ5iFDaPZ0GnY1
	jA6HDvtCHiPU7IZU3LQEXvc6NSDk2h5wFtOUA0/K1HbwFS401wo3GWajNGeO00yw78cMV4
	Xhwsm/g35UZicnwzoPmbIe2Q74SVhCuI68NOO1AJVT/CzZ3Ewru9c+mwGuJShw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772448344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TLZCvpYavonv5dbpKzNlHqyAwQ9wvWP05tDkSZR/dxA=;
	b=cJ9om+O8MslXiL0xXq3TaT/BciHGXg4IjBxOhYqWh+R7VAQRdwH3Obhv32bb8sPQh2Gkae
	iYC23uA+FLtTQXCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 3/6] ARM: move is_permission_fault() and
 is_translation_fault() to fault.h
Message-ID: <20260302104543.HGaa4mB9@linutronix.de>
References: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
 <E1vvzcc-0000000Awo6-2oph@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <E1vvzcc-0000000Awo6-2oph@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_024547_043276_F9C2C82E 
X-CRM114-Status: UNSURE (   6.54  )
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

On 2026-02-27 15:19:18 [+0000], Russell King (Oracle) wrote:
> is_permission_fault() and is_translation_fault() are both conditional
> on the FSR encodings, which are dependent on LPAE. We define the
> constants in fault.h. Move these inline functions to fault.h to be
> near the FSR definitions.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian


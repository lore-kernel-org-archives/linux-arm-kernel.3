Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E145CCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 18:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZdhtdKmHa4dcSzhRJFOXRlBZfjh3uIPp6tQ1wYV5bo=; b=WX+AuE7+gQlvggZDwW7K16OcaX
	icpvv2ytNXS8HI8cPqj8UXG1lYJgoQJcelwLW1P8cWJlYArWvBDpCGB635xvLtQrlmjSjAM6xcZIr
	pCVPu7rS9/jqy/HeB4RTohgb7QVEOyRxxHhXf5cKzBfaK3aGgi9MUGaRLhxpU482WifbMH87+H73m
	/VIy2q6tmhC0MuFlSCgNI1NPQPPrPgIQeLZnoVT9yi7URm0g9fhk77u0qsCgSL4I3a+Y9oNroWkPa
	dNMot47p0KUx5iz9JDnD+25QVs4ZE6V6zTfh+VOguhpK9whstXgshx4E4TaXHhyEXl4u5zYdaJXr8
	CVmTLiAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyx8a-0000000E0NL-35eT;
	Wed, 17 Sep 2025 18:44:16 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyx8Y-0000000E0MB-3o1f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 18:44:16 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758134653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QZdhtdKmHa4dcSzhRJFOXRlBZfjh3uIPp6tQ1wYV5bo=;
	b=TXH1VgXhl9TJVLj2OH7Oa+fCy5KEUeSVC6i7C/B3Ch+CUD092lLvRy8+xwQTjJSvI/f5e/
	eCeA/9+a0bV7sx0ApCME8sCLslc16fzzcvXWQZ69KshZDFeqfU75hwHdmZr4qRoDeUJfnV
	9Nvgr5Lv5QN9HIQ2fRBqTfQeGJF+2Gs3D0qJRxGLtoyFEGkhf3MA/PsqA06mrLAr9+AjlH
	Ts7pW6mp6BXFXIy6/0gYGmjzC3OgGy444zbBQKIPt+n8ivbeJN5ObybKfgMwVR4iZez9Ym
	Qw2V7y+ci52ovVJ8vEvO6KZ+He1hJaLHm5MUQ9r1a9TJPSE5WSLv56nl/yZlrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758134653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QZdhtdKmHa4dcSzhRJFOXRlBZfjh3uIPp6tQ1wYV5bo=;
	b=6+8bpede4VR2LubUInjqoSUX1qxsOYmZ26JvPspTyzYGmmDUQGN/m43/bFNknXNpngwOQc
	ccNZYt4Gya//BQCA==
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 kernel test robot <lkp@intel.com>, linux-arm-kernel@lists.infradead.org,
 Nathan Chancellor <nathan@kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, x86@kernel.org, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V2 1/6] ARM: uaccess: Implement missing
 __get_user_asm_dword()
In-Reply-To: <aMrREvFIXlZc1W5k@shell.armlinux.org.uk>
References: <aMnV-hAwRnLJflC7@shell.armlinux.org.uk> <875xdhaaun.ffs@tglx>
 <aMqCPVmOArg8dIqR@shell.armlinux.org.uk> <87y0qd89q9.ffs@tglx>
 <aMrREvFIXlZc1W5k@shell.armlinux.org.uk>
Date: Wed, 17 Sep 2025 20:44:12 +0200
Message-ID: <87plbo9awz.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_114415_082828_925B1A5B 
X-CRM114-Status: GOOD (  12.61  )
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

On Wed, Sep 17 2025 at 16:17, Russell King wrote:
> On Wed, Sep 17, 2025 at 03:55:10PM +0200, Thomas Gleixner wrote:
>> But it actually can be solved solvable by switching the casting to:
>> 
>>     (x) = *(__force __typeof__(*(ptr)) *) &__gu_val;
>> 
>> Not pretty, but after upping the frame size limit it builds an
>> allmodconfig kernel.
>
> For me, this produces:
>
> get-user-test.c:41:16: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
>    41 |         (x) = *(__force __typeof__(*(ptr)) *) &__gu_val;                \
>       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> with arm-linux-gnueabihf-gcc (Debian 14.2.0-19) 14.2.0
>
> Maybe you're using a different compiler that doesn't issue that
> warning?

Yes :)

Was this with the one-line change or with the full conversion?

Thanks,

        tglx


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D7DCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 17:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5N06FHSWHmtGiizyMQkYX82C/GPOmNfgl/ROy/Znpbw=; b=4094xse5kaiDCI1RshDYRb4+lO
	PpboKkX9xLW5wCjNJ3Ar54sOgKrItQelS6oqFsZZJ38Tc8sY2Nuwp/PXGzLF4lLdyzaTmWhtp4Xl9
	enbJczSLQFc7VKXNcxvEnwxaBc/kq+q+4139Bs76tnxHSJcq89yUh7nMxzAawNhxtNGt/0gb2K18S
	NrMGifcXqv2kNKgGkBLghmQtqHK2uGdzmPtJr2ptSrElj9aKxpEInsbtaLOGOJbiey1QGlz0qXViu
	SUVNLdqRIooTzWHBmEYiuwhQwrWMQwYh8CyLPHWbc4nv83nYCfS7y9EaASdAF0C7OgbnkLHcoDq4Z
	BoUNcxwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdVh-00000004A3M-2t06;
	Mon, 08 Jun 2026 17:11:37 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdVe-00000004A2j-2fCT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 17:11:36 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6946814000C1;
	Mon,  8 Jun 2026 13:11:33 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 08 Jun 2026 13:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780938693;
	 x=1781025093; bh=5N06FHSWHmtGiizyMQkYX82C/GPOmNfgl/ROy/Znpbw=; b=
	aI75Wbubs/t9s2AdcK6asF7TCjmopVoC8xjMA8Sf/cSitk/r7/PS3GC1ztR7z+J+
	yZbgA70Dfu2puARZf6v1trh4hyh/58BKCAtpLUBA10/hpee6XtFqmIUiPREc6mOr
	Wd/SDjc7Am6c68uNXel38E16+jaS2QfXWIu98ZPPje8DZegQh6DdseZAvw8JygIC
	REfUZhQBL09AXW3tF1znMjyWEXhDu8wFZCKDi6qqz5rrQpQGALrK39lJ5D8bOBGG
	1zB/SKwnyB/r5u5OBGRI1Q/39V1LI4OaNXTwc1Rygv4Jpi+oSkbKrSrOPRaNIiVq
	LUflBjFvmLe3hLOslUHjJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780938693; x=
	1781025093; bh=5N06FHSWHmtGiizyMQkYX82C/GPOmNfgl/ROy/Znpbw=; b=H
	QqipefS9diXmQkaH2EHQKT+LF8KIU9eXmE/nwY8Un3e1WPZTgTs+PcOI5M9jlrfN
	QRCfIGp5Nch70KP/ti+Lwkl9L24kO/VSUZL0EpBuxEybTXi40CzZFpPCAz66JDoW
	gpc0Fo/QyRSn4KOD8cJU67+Net0WAAcfCtZo/5Vu5AkiP3YqrnuyW7/BtHOs8tPW
	49eiSTgZODBVZ169X7/4f4PrCM1dP63Fh8CBk0IopE5SQRHYNSyv/ZkNG2dwZ5Cj
	/03niV0dyqUfKpx3C1kvmPeJVsLqENYO/TxfiTkF2XSyCr+q2FvOopIPlrGAebwy
	gqqrVFAJ9clZ9wcF+yKiA==
X-ME-Sender: <xms:xPcmave1SFA6qKsFWEN3Ln0ThxoEia1q08W1Zgwl5025NBXqmtJb9g>
    <xme:xPcmagA4tE9vCrNDvEwqKqcIDcI-AtZwNYKJlHE4o80GlZo5oPowCl2eQJ_QU6MA1
    LXlR6lOOthaXdkeDfpSwLBqRQ-mVq0qUsd8e-rGnEdXYsfS48hAUzRk>
X-ME-Proxy-Cause: dmFkZTEBJyaMAP3TDAJtRLMda8+Z1sANpdvgvrXLebNvBI1V1vjsIUCXpuKEnBdpFw6Rl+
    1eK5B74o4h8LLEE+hXdlrYzTTB47NVLAkf8RfkJJ5AfviL7PUNJ+M9W5Xm0RZ0n7Hus6oq
    /fQakMcirP4bqswRgTm+cssfJ66RfKI/2109NMoyaHCYQXv4QSEPwJ0uCWNM+yHBPuiI9K
    S4GZwDQmk9N8WQWz0oN+sfehL/smmk2MoHWgsSqlvLro/BDQO0f+M6Xcq/gsQNReg/dHHE
    Nl7tC00fRXsBQOW2N+wd0+kE+PmTzE2LyePiW3g7xPQkNgoL1t7NM1J6OYN9oo8XqqhEeM
    /1cD7/AqTTnpNs4bvb61dYR3IAuD07hVUTGo9JNB+Ade4Uqn87zLxxoqf+9YwSa748We2J
    DcZGNV0TPtE3dDv1J59JcxaDFD8KgBPodPR8jpJr0l76oCl9V2RzMaRNSZc8fJoFyHrawN
    x8yi6RilGh3X+/F9QxyGKVcqStGsPf9H0KRFu/7696fGFpZKke8u2I7ZpKyBW3A6+28A2E
    L3fc792rp92yKghWWIJ1UFJoThhuu4nqwYQg3Rf+14lR/FthHM/iHg3qY7zuzrEbcbJafv
    K4+fByARvDHgPXPrqbCcEw19PeWU5JHnTA8/s3yQB+TEnOnJIj1QoB7KFZ2A
X-ME-Proxy: <xmx:xPcmainHjZnU5zbipIZxKeIK2negpBIzAM2jffNMAGvKZHHcDBU7SQ>
    <xmx:xPcmaqwgUSYXzpNqshmMNTLu1V8aA9f0phgmvS2j8DBD09WMBv1sxQ>
    <xmx:xPcmag93IlnIpp85IbJ38QU0v48k4uFIPelEJVjWPbAHJ0zyAcweTg>
    <xmx:xPcmalD1-VsZSLQSynhZp2Dy6KNO-AWSDE2qvh09frXROQyYzjHUsg>
    <xmx:xfcmarwUHGkcMFDWkIl6p5Y4UDy3KRtrr0hoGJD9QHFJe8wD8hoLPG6W>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 10A951820082; Mon,  8 Jun 2026 13:11:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AO-lxqPu-pZJ
Date: Mon, 08 Jun 2026 19:11:10 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Ethan Nelson-Moore" <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-serial@vger.kernel.org, "Russell King" <linux@armlinux.org.uk>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>,
 "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Linus Walleij" <linusw@kernel.org>, "Kees Cook" <kees@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Peter Zijlstra" <peterz@infradead.org>
Message-Id: <86765df4-0d2d-435e-85d8-b9bd4f3ea85d@app.fastmail.com>
In-Reply-To: <aibz3auoiq4CFa9l@google.com>
References: <20260510052107.555825-1-enelsonmoore@gmail.com>
 <aibz3auoiq4CFa9l@google.com>
Subject: Re: [PATCH] ARM: footbridge: convert to sparse IRQs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_101134_957520_AC7EDC2A 
X-CRM114-Status: UNSURE (   9.50  )
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

On Mon, Jun 8, 2026, at 18:56, Dmitry Torokhov wrote:
> On Sat, May 09, 2026 at 10:20:49PM -0700, Ethan Nelson-Moore wrote:
>> diff --git a/drivers/input/serio/i8042-io.h b/drivers/input/serio/i8042-io.h
>> index a8f4b2d70e59..cea72bd888af 100644
>>  
>> -#if defined(__arm__)
>> -/* defined in include/asm-arm/arch-xxx/irqs.h */
>> -#include <asm/irq.h>
>> +#ifdef CONFIG_ARCH_FOOTBRIDGE
>> +/* defined in arch/arm/mach-footbridge/include/mach/irqs.h */
>> +#include <mach/irqs.h>
>>  #elif defined(CONFIG_PPC)
>>  extern int of_i8042_kbd_irq;
>>  extern int of_i8042_aux_irq;
>
> This does not look right. Did you mean to drop inclusion of asm/irq.h
> for all other arms?

I think this is correct, as footbridge is the only one that selects
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO and defines I8042_KBD_IRQ on arm.

       Arnd


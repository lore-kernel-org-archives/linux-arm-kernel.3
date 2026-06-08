Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF85CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpwJ9v/AiXpP4VJQJr26kjpknRLuUcx7eSaLf7M6YkA=; b=zkIUMVmJ4C0T6IsgcBbTWM2jgW
	2LFTTJn6sHC8bMXVA7EjSPIX1rgvZSjDZJrK0/+X8lsubozKnv5+n5dSoxGgN/kZgS6MvAAdDk9AO
	BsZMpZZncxrCRMf41Eu2u8oJe76R498QUvl43851p51n13QdgKJlyx7ePfYS+5InRwTIMomrPChBk
	BqP+JXwpkEVK/w+Fig9GuQQpKlVf7QSxIb2yk0r/poLEZ92lwHJw0Fol9M8GcRqslLrwDYXafh9yr
	9VGEXMFl5RybbbRoouTAlrnyhSFZBaBWOGx9Sc29X+XDS9hNUrryJ6VsMNYKqrg40BVZXdTgmVSta
	lXsmEnxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdHR-000000047wp-1CQB;
	Mon, 08 Jun 2026 16:56:53 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdHP-000000047ux-2CUy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:56:52 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso8124213eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780937810; x=1781542610; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YpwJ9v/AiXpP4VJQJr26kjpknRLuUcx7eSaLf7M6YkA=;
        b=hWWXiQAX9NaomMjHwKNQyc8NepYQHG0rnG1UgdAAxoMNAFq9HkJgC2XAdlNbwaKs/T
         Mkmev2q6HDjXn8nzoh3OT/yIw5GuNUmDJxOhTnFiPjtl7WMwfn3WdpVz8ob37V2GBEox
         tmimDWDPC2GPN/n+pmOlUyCb5N1KQF54wSe27sBbrrljNdAFk5xvVIKnlZzfLIbdDPBF
         XYJDpAX9H9zg9ToBU6t+j2lav58HxPYKJYqsUFOED5jlIccQex8dnWKhrmBOmiN4F1gZ
         FLioX7cCkXrZtKfu08TzewpUDbf5AFpYV5T5vjm4WF4cFziBh5NYwODGU9+0NxRZ993w
         2XxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780937810; x=1781542610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpwJ9v/AiXpP4VJQJr26kjpknRLuUcx7eSaLf7M6YkA=;
        b=nAhEith8t28NN6bB1QPeOlL/am+4uuTJF9OSySnEmEZu+GIkMFlFJEEOjkuAfqxRm6
         8CqBrF+Ov3Vp+mmGSy4+sHQEPIUZL5gVUNweGaF1F+Hoac8jNxvZYbDoZSNeJCR8/4lM
         pmWKXLDpggpraXYb4NPxpYeBoSNm+Q5vnNMBQw9X4IbonWGGclZ6MkQTp1RJlo4dtaWQ
         gCmuA56gVMqlaSbdyn+nTE4tr895hQ7WIdpCDg6IUoSQLee1VMMQIgxOopwLI7wlaMs5
         tBVanZFISi5Tod6RjRqMb9gurVBjkwY336rekGb1oVFhXglfxfWf9fqwJONiC1EyHITW
         LViQ==
X-Gm-Message-State: AOJu0Yy0MzTsAWo1lL81CmYzuZMtV6Hag3YOFwZx9GO8D3uEFNVZFKsz
	0xHkeWwP7KICLVYLofhA3Flkim6zgcjwhUF48phN2XO7k+yXGsConMpY
X-Gm-Gg: Acq92OEozeMEFXgSuuGLPT4iDqf2ElpnAtsK8y8eslrama+sBUwUcYyLqTjKkCTkOMj
	zIJsbB//rL2YvGZ809CINwRYt1lFCOqCLRFRAJDXyGrpqKzCJ1j8TRBiOI6PGKWF3KtlPLuZSMJ
	B3Brd3qYXKq/yiZ1Cy2Q6HGmH6X2EErPVNhbz+ZBmRz5HLA3102Fyw7K2Onl6WhfZ81RTWRM2mF
	k5Dz5ryrCbuRjnnFVR8irUqrG/wbzp9MAb1b8rlTHGiDhK3r9ZwA+vuzLqOynY3rovVAhHnakzF
	IQYA2BbgZpQ84dUBcQOoSMM0L2PCTh/RO9HHlpDWU6A9fo0rNFiZNnzZH/OR8zDLMkrmM4yQz1b
	aR+dlX4RWu3xK6tPzU3xAJ/onGW5rV+1gf0Bk5JupKXiepESM3SYe9Inq/1IzObGi+Juvoqz1Jm
	MH+WKKzTEjxWUFPLvm3vzHReWPRBOffs7m0mYhCGH0GvZoX0TISxa1rDJABNnL83ErSCnXVCkvx
	4w=
X-Received: by 2002:a05:7300:7488:b0:304:e566:e000 with SMTP id 5a478bee46e88-3077b2db403mr9281297eec.31.1780937810237;
        Mon, 08 Jun 2026 09:56:50 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:355d:c69b:fe36:8969])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df3b234sm22816203eec.23.2026.06.08.09.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 09:56:49 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:56:46 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	linux-serial@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Linus Walleij <linusw@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Weissschuh <thomas.weissschuh@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] ARM: footbridge: convert to sparse IRQs
Message-ID: <aibz3auoiq4CFa9l@google.com>
References: <20260510052107.555825-1-enelsonmoore@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510052107.555825-1-enelsonmoore@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_095651_562872_2C38320A 
X-CRM114-Status: GOOD (  14.49  )
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

Hi Ethan,

On Sat, May 09, 2026 at 10:20:49PM -0700, Ethan Nelson-Moore wrote:
> diff --git a/drivers/input/serio/i8042-io.h b/drivers/input/serio/i8042-io.h
> index a8f4b2d70e59..cea72bd888af 100644
> --- a/drivers/input/serio/i8042-io.h
> +++ b/drivers/input/serio/i8042-io.h
> @@ -15,9 +15,9 @@
>   * IRQs.
>   */
>  
> -#if defined(__arm__)
> -/* defined in include/asm-arm/arch-xxx/irqs.h */
> -#include <asm/irq.h>
> +#ifdef CONFIG_ARCH_FOOTBRIDGE
> +/* defined in arch/arm/mach-footbridge/include/mach/irqs.h */
> +#include <mach/irqs.h>
>  #elif defined(CONFIG_PPC)
>  extern int of_i8042_kbd_irq;
>  extern int of_i8042_aux_irq;

This does not look right. Did you mean to drop inclusion of asm/irq.h
for all other arms?

Thanks.

-- 
Dmitry


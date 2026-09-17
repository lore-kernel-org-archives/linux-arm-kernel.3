Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956D0C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMoCcH9XiE1LhJF2aQGX5bUN/rkYCmBdzeN2NEvUkW0=; b=Eql2EWD8cwx1WaHCM3YuN1NsBd
	OF50PNV8+qd1tHWlduf7brXkt9UF3B3Lc1IU48pQ+eEmObAAceKJPYNWIcWEivbPwiw6rGqKIhnuY
	ZuEVjrg6ZzWbp+htJqQ0ER99VTLWIrqv7TVkxyHYBKFF82is88iZ9h/wTWVtoRL1oCFA5TIJk2Lv2
	/I3s91OPwB28wD0JF09u35a+hqj/XRSZMZB68Px308HMANFlG4ckIYxhxzqz2U3SishIePSoh5ZFd
	oqZw+Y4ALGuo1+A3AyQsvEJUudCGDu6YvIPCBb6vKcPZrDK/vPuM0GgW12Z++wOguAItDOYuRuSCs
	rFpo/SvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EWY-0000000BnIr-1m83;
	Thu, 17 Sep 2026 15:59:46 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EWV-0000000BnHB-0bjI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:59:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AE492C5CD7B;
	Thu, 17 Sep 2026 16:00:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1ACD360580;
	Thu, 17 Sep 2026 15:59:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 413BC11C7B083;
	Thu, 17 Sep 2026 17:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789660780; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=sMoCcH9XiE1LhJF2aQGX5bUN/rkYCmBdzeN2NEvUkW0=;
	b=JuWSSj4bsBQhnt1XEQqd9FsYL8y4AVSCDWiJfIPQUnkh1euaXiAmZxeVQTWI3CNk07ZEnk
	5A8r8JzsPqYRPfzZhGK3Cln1woutjNsVrh0KElb4Tqsle61ViwhdCHeqE6koBfzqxHpfVO
	e/2VdECtZil5/2jh1jkOwMu98TKWGYJzwBJ4D4L8IwDWOOt+HIEpCh4ytaN12mxD8iejM8
	0gKaJXQc6wfBATr/i/gMfQj4/alZZP6kYc0oHXqf7hv80NpoH5r5+c9x0uuYl4RN4Mi1f4
	+ae7HtzJkiZwj9X+odJ/AK9b0OX7/DCiB6Khara/sOwNUa+T65T+Cnby9Kgbow==
Date: Thu, 17 Sep 2026 17:59:38 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: at91: Replace __ASSEMBLY__ with __ASSEMBLER__
Message-ID: <20260917155938d9150ac2@mail.local>
References: <20260821083645.200344-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821083645.200344-1-thuth@redhat.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_085943_350131_729940C2 
X-CRM114-Status: GOOD (  18.56  )
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

On 21/08/2026 10:36:45+0200, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__ auto-
> matically when compiling assembly code, __ASSEMBLY__ is a macro that
> only gets defined by the Makefiles in the kernel. This can be very
> confusing when switching between userspace and kernelspace coding, or
> when dealing with uapi headers that rather should use __ASSEMBLER__
> instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
> this confusion.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  Note: This has been split from an earlier bigger patch of mine into
>        a separate patch to ease reviewing
> 
>  arch/arm/mach-at91/pm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-at91/pm.h b/arch/arm/mach-at91/pm.h
> index 50c3a425d1400..2193e1ab98476 100644
> --- a/arch/arm/mach-at91/pm.h
> +++ b/arch/arm/mach-at91/pm.h
> @@ -25,7 +25,7 @@
>  #define AT91_PM_ULP1		0x03
>  #define	AT91_PM_BACKUP		0x04
>  
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>  struct at91_pm_data {
>  	void __iomem *pmc;
>  	void __iomem *ramc[2];
> -- 
> 2.55.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


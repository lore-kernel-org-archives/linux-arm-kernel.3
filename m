Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A454D4115F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 10:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwLrvsF0GMvPSCBeAjAWQZcmbWMJVYh05GZu4CqMmyk=; b=Xyld2V2Af9zouqIrHKbRmqnJR4
	3NZJ5adeWOmRlTthysaftH3c6C+vhjX5WDttWW7ztIQbjvrroVys7IlYpH+sZMWU0q6NMXjFyGUxL
	jIZ9iqE68+6N/Cp2inlkHPrwdjWqNgDa6SXtVkA8jren6oSKInuy52S8YLbRJ2q1WlXXXKiUBY7i2
	iqnB7uexE1vGOBjJOWpjVa3wjuFyDwTXkhCNdwbAYRV5jEEUbw5y6e6PPPTgY5wz+3xOLx3bP6Odr
	9FPRE/jKLyiBhgECV/RtGjlSTydsZx2K8jMVZNdg6NXWfwaZZznsDUFDhJZnfGkLAmcVd5SRdOFvy
	nfMLKx0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKPA-0000000C8nt-3v71;
	Thu, 15 Jan 2026 10:16:40 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKP7-0000000C8ms-3OvM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 10:16:39 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso258105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 02:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768472195; x=1769076995; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zwLrvsF0GMvPSCBeAjAWQZcmbWMJVYh05GZu4CqMmyk=;
        b=bG1GGWFCDyu4No2Nx4KquoGWzsTZcqIbRRsiMvRed6ARqy7TTiRFpb0XyhzTY8rpuT
         BWi+YjHOgrhrOJC5eq9k5GyHGzQy9YjDcsGiAK+YmbygtanGBOCnXxIHCskKH/wx5mtz
         i1q8rRk60aDcWaIX5TDH5tRSexQnAnOSmVu87zm7SWDgzGf3j/ERyk32k7VkOSmPxOkT
         iIy0t4f/+UdLc5pXzMq8tXL/2wMvrbm6XJL4JE5EBUgY36uhpcQJn1udGsjfWrUlq9nR
         PwvtLxjEV9N90UqsVOeVWlccYlFZR5q2uWpY/fB0Lr41CxEdLzJ51KIRhby8fsm0BXG8
         C98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472195; x=1769076995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwLrvsF0GMvPSCBeAjAWQZcmbWMJVYh05GZu4CqMmyk=;
        b=EZQxTIoYcfp0sIIsi+plVepoHtrkReJ1wQTb27vDhD39O/v4ej96KrT+tQTFs1LSi3
         tOWnWkac+6MpWMNN5RmPedYwPWwZNv5NNRCzQzS7o2HdCAVC0KTpjlrUPEJFng9B4zZr
         QafousWplbEIPbosvuX+MqDD7ESKyD6magZ5Z1t9cqxZUY+V0vOxT8Qk9p6Q5ng/Kg0C
         FtLCwOv6M3UFQncdZNuCTIPggH8nW1zVYmjLnqPCovTk357XxLtEZEn05AZydDepxcaN
         HLYW7EIfSX9wKr6BFLDMFnOmiPagwEo88aPhwzBw7D/FhV7E/yVnLEi7x/tGA0dJv2KE
         sWoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2HPz+EW92Cr4pEoXmGNfZ3tCjEathY93qvb5FFnfwLzR1/e0wEMKYt8XnALfWDzL70ozhrZvSdPZsHqxzHnUF@lists.infradead.org
X-Gm-Message-State: AOJu0YzTtked9vBlWt2BGZ1NmQPz/ROBx8SgneOW+4AYbq6TDIwGv6B2
	pPE5ubCzj5htffOHddxHQ7FgLFs+eYtBv3Az+IlxKUQPOcmSGnGcKx4ApBRbZAN0qGk=
X-Gm-Gg: AY/fxX5/yllE4iZztgKBHSg+Z4lGbl0p3OPjscKAtrGS3fAzKggSsHHbVbuwGhoboAL
	85b2VsdOpNXMQUU/YAFBrXfzUWtzXe3dwQh/FlyjJSWuRMTTofInLT+NOlU6eXOcbW3AVkIsjW6
	NGEWep4zl2a4eIe/PP7HFShBfQBakXiF8rsRQE9BUQ743gIlX7gvK/Qh5p62bYK5qSFejQVOyPg
	yQk9eZC32ZilR+FeEgsx5+MVRk6PhHwxvRT5izoclpI6Y+TV4y5iywQ4aK327eBuwZ0b2+i8Fj6
	RB3C0FZaaordkaN6Fu/aLMeqHPp2kV209QDV3HjssHX3SSM0kP65z8KUYZd8/4nwYQDn8F97a5+
	Ex+GkzPUI7H44zord6o27wq30zClLeuGz16Px1V/CP2k2nyAfUSuYySKDWpWYbwYiLRTBwSIGPn
	Js1rNau0zrGIPm7QSCPfug1sk6
X-Received: by 2002:a05:600c:608c:b0:477:a246:8398 with SMTP id 5b1f17b1804b1-47ee32e0829mr58296485e9.2.1768472195426;
        Thu, 15 Jan 2026 02:16:35 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee28144aasm39739585e9.11.2026.01.15.02.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:16:34 -0800 (PST)
Date: Thu, 15 Jan 2026 11:16:31 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andreas Larsson <andreas@gaisler.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
	linux-serial@vger.kernel.org, netdev@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-hardening@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 07/19] drivers: netconsole: Migrate to
 register_console_force helper
Message-ID: <aWi-f9LBJtxGWgWs@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-7-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-7-21a291bcf197@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_021637_884529_6CB6FE67 
X-CRM114-Status: GOOD (  10.03  )
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

On Sat 2025-12-27 09:16:14, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.

I would add "No functional changes." like you did in the other
similar patches ;-)

> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

Nice clean up!

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33233D4117D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 12:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ld+As4KXLNBvjLuNePKBkF4h3CZ3gGNkmAsVzP6KebE=; b=5FpTHEevIeJRV72XhuNcONa3VA
	HeU0EWYmjCf5XgZTzz363bfK/9t2ZXnbkIP2xFu/iGrebA+AVPfZAIvMN60VnZJnBKJnsuzUHcrz+
	CGw4anKeduXjwFUu1xXbsrNpEa6fc0OUVvtfLOMpcc4tfjriJqdVLx0OtNPJEdP2XXwvVkZ9n7tIk
	cSZOqzxVzrfCG/IwJs+ozJv3W1Wz7/zvfxoXPk/9DSQ/m2enFAOsHWvvtak30CZt2Vca0gnqJ+8wV
	bEmCibLS8Uc/Vx+Fxi+y9Qprr67+Pu3IfNqRTETVhfHc+ngjG2nRU3++aaN0xie3o1Wxc0kkGI/am
	cJ2WZMjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMTx-0000000CKkC-2C3o;
	Thu, 15 Jan 2026 12:29:45 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMTu-0000000CKjV-2dPO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 12:29:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-431048c4068so468320f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 04:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768480181; x=1769084981; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ld+As4KXLNBvjLuNePKBkF4h3CZ3gGNkmAsVzP6KebE=;
        b=KVeqjiHHh54QX9uZG57LOrC463ScoL4YPVwv0NpK00H1B62FjXIT1QYfrVWY/LrCzF
         fpKiESn7E/m8Qzf3QhGfKMO8PI16hc7AWpK9OlMYwT4DYSyFOJ7q9Hq5gxCTRexS5t71
         2nWXW4gl2E4pzND5AYtZJmKXCx18BrpINw7MovVv0H3qffD/XXY7MJ+z03a10T/M3zyS
         lLtaPJqc7wX3sOboM2j/p5L/tT3xxbyV1VfGL4iwUGkNUTi8tW/ScQKPZt5mqMsYsfOg
         JyzLC94GgB4Sj2Bakua4Q8QSEekcMVEK0/JLElIBJmOkctCH8XQQqpUUF/R/cPNbQLsU
         zZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768480181; x=1769084981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ld+As4KXLNBvjLuNePKBkF4h3CZ3gGNkmAsVzP6KebE=;
        b=LMwd/35Cre/DsRpGNzIkf2HeEpcts7WbWEZ/DYbHsmHnEgkE7T8Wo7tRKXe+rmKree
         zlS9XLJHqDVAtL2Vupyd5o0blvmlNlX2y3/vpVLT4/s+nKvP5+ahVn8rFcDybDuectCB
         vsTZGAmhp4JizEkgirWQazqH0XSVgPXTbXHp3UxMtKK3BuSX9Kp/PMDy+rbTqEIb5CuH
         FSN/RsUTQTOHTHJdtcAKcn8sOxAI+hKw0GLDhSUR3XUlZb3blam4aiYH0NiT68W57WJ4
         fRzyo7d1L/xPonVRH9OiLum2GibRrmItyio72Jft4Nctmi2qfrMWIQY9vazXnkPtBK3a
         ahWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoO89XfyXowaypUcv/Q160tF+0qY1a5GJHJ1X2Ngu8GKTbXRB1+mJ6JgoF7MaWlSsrx8rq9T861i5Tp3om47Wq@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx81XNZrr7CD0uxScNdBgmZM4ewHqBDBagBptEClqPj0rGzzeq
	R4d5V1OT+4ucKNd0nGuC525OAdfqYXAp8CGfCpMj/bQBOvFGBvGfn2QyYs0Q7Ep9FM8=
X-Gm-Gg: AY/fxX5N2MXcwsW+7U7HT6/LO6han+vbvOJq9HC+aTBvpjdEW2We+ie47NvXNue6SP7
	XgPt7Vri7sijfpvOR/nJ9o3FCdoqjRgmQOr7g4v7FhPyppElpXkV5BtFBRI8lGP48jBK5QqDoa4
	FaBIOFKUX78qxMxxfQJp1UaaohZpsfjn7UlqnemLlfOiegeMkDF38T29Fi97RQE1FeFfgrp9SUy
	C/htEAU3c8lS2mPGNZYSETIwysRRAs+3B/PAZ2m5ECq5hsoKokHk5ovF31w31Q/vOb0abrN6KpF
	QRMAGsN9ZMzXYqsEr2hQZK8ktGlf9HAbyNQOtlyAZZYOdtMcqXIIELcn0hQ5HXzo7RXPSjZxTxQ
	jfHXsMX6hqu2gyJAmlWTLnYp/fYeJ+sm7y83IP1KfLbB+P4IqQNmJ7jgZWvmmOqO9WqaZVSSD2c
	iUgGU/u4NUYUNdUw==
X-Received: by 2002:a05:6000:420a:b0:42f:f627:3a88 with SMTP id ffacd0b85a97d-434ce7324b4mr3823468f8f.4.1768480180633;
        Thu, 15 Jan 2026 04:29:40 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af653576sm5965022f8f.17.2026.01.15.04.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 04:29:40 -0800 (PST)
Date: Thu, 15 Jan 2026 13:29:37 +0100
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
Subject: Re: [PATCH 14/19] drivers: hwtracing: stm: console.c: Migrate to
 register_console_force helper
Message-ID: <aWjdsbYev_5zfKEC@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_042942_675511_F76C75E5 
X-CRM114-Status: UNSURE (   9.95  )
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

On Sat 2025-12-27 09:16:21, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> No functional changes.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

LGTM, nice cleanup!

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


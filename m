Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9E2D41161
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 10:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLly7CGERK95lIS5prsdJ95HAbwiiwFAFGJDvTd/YQs=; b=gCdX0EyNJkb7H2f+IyS2ok/bRU
	GSrWVI0dV6gbVD7/9rb6Zzed7AlXkcmG8Ra5h/MgIxxWr5eOrrQJTGqKnbl53JZyb3Rmm27hI9pUf
	YdteFLFrlfFqWD4yoKLjv6v67yEt0qUM+r2waEy/lzMa3jRXs8hS9kBiwcK0Q4X+WlLwmoO5Dp+Yf
	20xky7ctd3S2U3yJ0DncD4kecyFZLSO5FStuIl5AA/6zmBYljJDOWj/NqrIaMrhXXJyd+inhpT/LE
	yhCUOyW0beVTeKLB35u8hbqanO/Pl2ZI909R+Nc1iQEF4gje9TvLMCMwHFuG0xj29J40fyJIcZDXc
	eHAzzE4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKYh-0000000C9qg-3aPS;
	Thu, 15 Jan 2026 10:26:31 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKYf-0000000C9pW-1kqT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 10:26:30 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4801d21c411so233855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 02:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768472787; x=1769077587; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JLly7CGERK95lIS5prsdJ95HAbwiiwFAFGJDvTd/YQs=;
        b=HfEiwY9bQ4lewuIzzLE/sU0ZTSuLYTLLPPyPdN8ZpV/VA/9Va8qQmqcRm+1P0SGoVZ
         gHLb/ixMOyIn7iGI2vCAJKpQ1SJcSuqlg1dJH0K1Ee3lr/7MRDEwV5JKkW32Jmk6xVDc
         bGcHwiumVg53UerZvS2QnR6w/JmCdQx5CnipYGTYAVMHWGusZbRqFy8946nORj5rLBDc
         m/yEGbwcMNd6YM0VSpJrCtZgqthZEOY7RZ+DvkaXWwfuFN27eg5HfQNJeJKUaKHcYw47
         8pMFH9Rjg1ibpAbbdIqOJgq66DFeV7+Iy6f4KVVL/XY2YDAfIP2bj35gXSbKxCZ5f5oY
         r49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472787; x=1769077587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLly7CGERK95lIS5prsdJ95HAbwiiwFAFGJDvTd/YQs=;
        b=HjDUolAF5iODcnA2L0IibgtTkiRbIQr16MorWcL7O8tgEsmMQABNW64BTBnIuIren2
         MeLcojboeUGsVXt6YQV29pxgK4mw/GDZZgQZWsdT8Zr5EVm1EAA+qYOR+/cF++5AureT
         9US/NVa1y1nMdOrkhHBunbXx49oxsJA+pgrRRvQhZAIrKZOqJtKEPdZi+ST1UlorIjUm
         xfmOoV5it7uPXH0fUm30q4GRWAycZfaJTlvD6ntcSNjmcr8M8DnhDOamj/gBtKPgnMSX
         7FTEcVB58H96cdWHIu+v8f3JrDRkFUmo6AffHoZbSCWHT5HruSBGZnywIuBaznYrZKMu
         mTAg==
X-Forwarded-Encrypted: i=1; AJvYcCXppYhGgQ3yXJO9UkEHiaPDkSYnblVDO1m5jwqlPbC4XKq9AWWb76Y5V8K0D/poQKJSbLY4DE/3NkgdFBRNdMUI@lists.infradead.org
X-Gm-Message-State: AOJu0YxzzWIm9fquIBb5E88y4HfciyHCcksFMqh3x2F7c86MejJHV1EI
	1MHb2w30mrssKIKSAArh+JcjF/6Z5MENT8SUlV7K/15DxxkM7111Ky0bZ+qd/iPCMp4=
X-Gm-Gg: AY/fxX743Wq7raOUqBBZqHIw3CW0aktpiaBEWHEm2ARo/5CbBUySA7IPgMCDEmb9Ytb
	hVeVt7+X0/smaSJCNR+zpVArdZ9HDGc6mYa0PW5uxvf2Z5YNunFI9c1YA4IKw/EQj9xsPkfTrqc
	3ABLH0JXA7I9naxWjbVYpKFo6SwtuLFrW73dNhMcBzGpMGj9rQKUqvTtf0L83ZxLxoIUHlAVEdc
	WK2VlGOnOxRaNe4Azq8ZtNTAMDY9wNde0fBH8Bj61j0oMocc+29lJ+cDeih+TCps/kSj+DPqUOU
	SCndMcLoVInZycbK5KloUhT1baItxrxOtDiaeaqe935gRiSR9UnnOg4q0oXon9NW6j3bkcqNYKJ
	c1aQ5Z0aCbQCbw/ZoWcAkBO/NqGpCZbb8wWV3U+1xDyBBqy6jw1MwnGgdujbVa9q7QPLNehYDIB
	HYkbhH9N8QO1vl+Q==
X-Received: by 2002:a05:600c:8b77:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-47ee4819d6emr64067955e9.21.1768472787399;
        Thu, 15 Jan 2026 02:26:27 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6d90aasm4935338f8f.29.2026.01.15.02.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:26:26 -0800 (PST)
Date: Thu, 15 Jan 2026 11:26:18 +0100
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
Subject: Re: [PATCH 09/19] m68k: emu: nfcon.c: Migrate to
 register_console_force helper
Message-ID: <aWjAysWXHUOHSisl@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-9-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-9-21a291bcf197@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_022629_463424_7F8BBC5A 
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

On Sat 2025-12-27 09:16:16, Marcos Paulo de Souza wrote:
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


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F76FD41178
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 12:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tARhp8b6WpUCQdTEvi4pG8l7ncFl190/VBWtO1OWxSE=; b=FG2VxWxM4l9wOFsl7NOvzw54Dw
	iaRls9IZHOy0bjk1eawWX77JvjiUW8wYZ41yYQfWrRpnpoYdgSz8ZTzaiVYenbeJCrhxn395udwI8
	p6B9f4fEy69tNKjUZP4/RmtBzXBTReZk7WEDNZmY0VUbI0aaMTlG6tJ0Q6exIsevTk+v7ZKq11KpR
	bcBXMGKgeffAPEsJxqIXT8jBAfq2I07sih1kQ50NQmRJSb9k/G4n1UP5FRc92p5TLbmaxUph2ysVs
	q33PsLmB82R+muPbBe/ruH7w4jXuUbJLcMwEcqtpKsD+9f1493YAEtZhYL45p2gmCd1+0cgYDuraz
	gX2IMEBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMDu-0000000CJ8a-2qtV;
	Thu, 15 Jan 2026 12:13:10 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMDs-0000000CJ7q-0ehL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 12:13:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so10476935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 04:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768479186; x=1769083986; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tARhp8b6WpUCQdTEvi4pG8l7ncFl190/VBWtO1OWxSE=;
        b=Dlc7o3DERXKmZkKeGLUyBYItd7k/sNcREZhPcVV74osH6HPlkOYkQMCQhtb+hhXh5C
         rgHdCFqkLvphf6yJUS2VOIAOC0ClQtTQhoWR+mvvNoNy8alOwELWThoObDING6Pc9Kpi
         Plf2bHPMwlJi+OcNAZ6K0NQb+/cPWK/NgdAsrmMJ3fFowOUhvPSUpmwfU7fxgT9Uy1Be
         F7A7dTPh0vI6vsXDVGDfm4ASsGWX32KoclyczObxXH4jZACIAEvP2a6vqQVA5pC0qiUt
         zEqCgzQfBp4gq0ZhTHxZCvYcmGT6l35FGug4xUouteInjR4qlno0YAkXmZhweHmZ/PQN
         zKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768479186; x=1769083986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tARhp8b6WpUCQdTEvi4pG8l7ncFl190/VBWtO1OWxSE=;
        b=RFbrXgPm20csp3Ibl8Dn/XLy2Hdz1vD6070VP8z6b7b9fLp0DynBQsK3Zqliq3KKz9
         kDVC9ZIcJA9TLEImqDVkAt8/KZHx2CFoYAVeXxFLbiVWlO018M/4/+qwhWn8l0y0hz+q
         VzVjIEjnOKhUHxZW5gquPHEsdgE3TotNLxezOQ1JRfQE0XDVVEUKrnF2Me0XvZ0ee165
         HFvCyB29hVYRVW7ZxBlPzSDCHglj8TwxfCGVevHoQRN+GYvKLITsmW1oQcFx2KlXpbxi
         /mX2zRpuglxbKTTXb9cLQWlzkB0y2bq3EPlOpBEW7yu/wRgqK93+o+YJ/Z7dQSu0Fr3Q
         M2gA==
X-Forwarded-Encrypted: i=1; AJvYcCVOc+GBG41YW71ZQbbEPZSs+c/6RGE2oteLuUZZmrzSfow0c6ddlEdZ/NzZ++TxWAQL/aVu96qqtmGG4/zD3q7U@lists.infradead.org
X-Gm-Message-State: AOJu0YwJxvNIuOFhWU/PdKKmE44RihR7o7od2E33QECT+CcXh3d4qhjG
	MMyiok+HBdbhi3W8pY0TLs9s7msKwY5P4jTTQilRZfiANivE1SX6lNfZBP0VtZCVL5w=
X-Gm-Gg: AY/fxX7cgOg58D6l92FEgCrfebpYoHVAFtr654pA8MaHgeiv0Hzhl3oSiewCW5sHBxQ
	IEFIi7WyljWWdCwBerCu0ZJ8qInCjzJANE/xyQPX0elsQ3XaHK0GBkpoU2Ix0cbt8aIqrInypNH
	zDZ63hjhSkOYwv9x5cJO51ha9O4VnqSnXG0BcQulSvABCQe8XOOYfTDSaWp4rKUH0pGsDnSoKtK
	asiLnJEM+wPUkEtVJjH3W0M1h4pJGewCZDhgCep8xbDYDng1sg+68Qs8yOtKbZzAi7Y77ITp5BD
	UnRtN+U0pXUHC2id+uTfGOB1nxvNSWs6ala02WcBM57EpErjA/bqPRHGK0ZHrUrbe04hDKe586B
	HmM+xoUIYxqWbhSlu2ts14FtZs/+Fx4CgdUvuT97KdDWj31DHIk/UpgccdFEKXPmUeWpbP+ZcHm
	3esrsVe7x+u7Sg5g==
X-Received: by 2002:a05:600c:1c20:b0:47e:e712:aa88 with SMTP id 5b1f17b1804b1-47ee712ac96mr42613125e9.31.1768479186231;
        Thu, 15 Jan 2026 04:13:06 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801bc3e57fsm22590935e9.5.2026.01.15.04.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 04:13:05 -0800 (PST)
Date: Thu, 15 Jan 2026 13:13:02 +0100
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
Subject: Re: [PATCH 11/19] powerpc: kernel: udbg: Migrate to
 register_console_force helper
Message-ID: <aWjZzuY31bg95jiy@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-11-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-11-21a291bcf197@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_041308_233783_073C5D8E 
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

On Sat 2025-12-27 09:16:18, Marcos Paulo de Souza wrote:
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


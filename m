Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99157D4115E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 10:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Blw9ol92Adxv0ebGIyoRpKSiGhl8JOSAW1An3S4C+Hw=; b=AG3FLSN2qFrhE8Mc340dS+549W
	zrz9WL0+npED9ZbTXOQHTFcBAyXaZY6175ogp+hrPpaKkpEI3LIfdwFyD/kK7q1xab0tOfYWQZvS3
	7DPbcUu6N7g3mjKeqHbA+2HfLmasNHEtfLP/hew5oXBavOMfc8s9R1arE1jNnAu0wOW/ydlA/dL4k
	qSvIBAx+RSnQmnZuprqkpM574l5tWzJ/Np5RulRkVHuFUljn0HBOFy77y6wRWS9AWerB4HDB0FD0x
	/Hb0lAOQm9wCJywh6k6RNY0yHFk5UmHYr+okZk6JB+n3BbIOJYnRMhwtWZIaLwg9wdcwgVzjhmjnK
	kSfkpUNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKSX-0000000C93U-2IDt;
	Thu, 15 Jan 2026 10:20:09 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKST-0000000C90q-3mDK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 10:20:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so381493f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 02:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768472404; x=1769077204; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Blw9ol92Adxv0ebGIyoRpKSiGhl8JOSAW1An3S4C+Hw=;
        b=UFMIHyzm/mf800Jak0zNRj0vP6X0MI0TFuKqT01CTbC6+Xx5GYUy2f9JphAbXSZLYB
         7NVwoXj+kOM6UlfXWmuNqnuhxUS9oPCq8bt79RTFCL92q+BPWFj7S67ogv4QQ52EDM9B
         TiF39Jiel2uT296nK6GMYcPBkgnXtEgxKX4GXBggd2Eq8z3icgurBaUdzQ4EQGYw+PYN
         g19657coTDLDyc3ElfG9JQ0fyi6ZbyGfkNCbkqSpN3JIZ8NzhB4Bv75uLhPUVm1g70Zk
         zB00NLej72oHt8s4GmqGjNM40RRmlIZHifp5PqEX/P1KY3ZApHhIqYuOtkicGkrKPrHs
         5drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472404; x=1769077204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Blw9ol92Adxv0ebGIyoRpKSiGhl8JOSAW1An3S4C+Hw=;
        b=vDoCJsfbNbmhTPunbeTibykWnLPKVVftanir1ej8jMloMPQkc+/w5WX51r8AATp20+
         azjdh4oqJ5BAqyDtSIWtV/OystFqbdZmwU1GuCKZOir97Vlo3kUk/6b/kedd496wJhov
         RnUe8GuG/vwodDzagRCt+O9h3XNnOjNUh6XMSvkgtYpcU/XA0ZOPVjVuEIMSctIWrhm+
         V/EdUFpsXI3fXo1yIbg5+p7JCN/3jcIDCCZeUAZnWeft6qQOo2fb+UrI8Il8sLrUm+Ro
         2k7f5bpFyg8KxCmmdt0idm9FTPRqf6FOAXo0idnih7v54y8gYhsuejYyrYA5E9MxWNFX
         8nKg==
X-Forwarded-Encrypted: i=1; AJvYcCXxpxc4rgvXwgj6HOALXvJA6tBimMEukWcVfCi3YOf/P+2XOpPdKXp5YeqVOP8lVBomI1GIoNhZWBE3RyeUVNVt@lists.infradead.org
X-Gm-Message-State: AOJu0YyX30QEaptrB5ndqroy7/uFZNYSZfdlADHDo1qamvf0wqirKHCu
	OS19qcJA0+Bf89w74QmJIcA8jqMyLyrB8u+7exBqn1u+4oMr9p24KblHI+6HDPYUCPQ=
X-Gm-Gg: AY/fxX5OUYKOaZypp0p5SeTLLfqw1d3DFhdDzZsD6ILXDCQU7sH9RDeEOpTPg6nCHaL
	vwkBx6M38rr79t98H99zGKNG9aJm10M/xxyofwJrycCtl4DBk6mJjhQlIVjBQ5oKxWAxvLPp+yK
	dKd89ctHwjN858oX3YnEaLx/S6i++bPIG1bUUTGBkFp5ABVkovT9uTU2yZOid73rctlvqsgXNUx
	hZOXz77l2tMxo8O5fuf2AWagrQPoLTXi3jt0GCUNJxc+YJGrk6nLyy1zicnoE077n9eC8M/C2wJ
	ldyHnxjaFbTsXC3zGqJ89z708wVJKJWLrwshtcJP3l8OgEp8cRVcTZXgPTzCd9ZBsAfAGZd3gKK
	jVaucmNZ7DT9vbeH5EX9KOSCKWEmxOU9ByghdZhYFSircwqzh1s4XM7B6HGCMtuT4AbmTnDgqtM
	qXyqmUrI6WXAUiMw==
X-Received: by 2002:a5d:6b41:0:b0:432:a9db:f99d with SMTP id ffacd0b85a97d-4342c535db3mr5505744f8f.36.1768472403629;
        Thu, 15 Jan 2026 02:20:03 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af653632sm5139931f8f.11.2026.01.15.02.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:20:02 -0800 (PST)
Date: Thu, 15 Jan 2026 11:20:00 +0100
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
	Shan-Chun Hung <schung@nuvoton.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
	netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 08/19] debug: debug_core: Migrate to
 register_console_force helper
Message-ID: <aWi_UJcrphO9Esxw@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-8-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-8-21a291bcf197@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_022005_971505_DB7C2435 
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

On Sat 2025-12-27 09:16:15, Marcos Paulo de Souza wrote:
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


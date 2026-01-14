Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23571D37E32
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 13:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWiGwjTB0ZEpbDkwRFO+MVJzM9uZpDrSFPQIlzRZfsU=; b=T2DSgbnV6thuq8WLgvprpYnwfC
	hDrzqvwDsUGrEK6nJwIu+Xtm0yhtt2kv04EeVF6hcRZDdWppC4ug2rc+Q2Fd7dsFEVdK4pa0RkNPP
	ANloYpgAD5Lu3fdbUzQ7DHNZBK7lz6coEjqgQDG4A2z6HRGg+ZV2RFiibzd5WdGu1vv5I+XtoDbND
	kmTErWSXXgLiIuhuwlKzEVtJlXEnjMm8hysxrPB6DyC/NPWZUdA3dgksrIdolR+uqnzmysDy6VAMT
	ZjIi7wHVDpyISMbSnxZMjnqH+N5mEzN0en8jzzoJcEtYH3YIR9yUbItT7Gr5nJljjQHnbLWQ7/Yxz
	lk4Kvp1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg0nO-00000009J9q-1bvA;
	Wed, 14 Jan 2026 13:20:22 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg0nL-00000009J8S-2JVE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 13:20:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-432755545fcso5095195f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 05:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768396817; x=1769001617; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sWiGwjTB0ZEpbDkwRFO+MVJzM9uZpDrSFPQIlzRZfsU=;
        b=b572ExB/x727A9YqtI/1tYNHeNm3xL1U7aChGC7H5nyLA2CNd+Yu+90rB5bzVLfxI3
         ymaODXT2y8ceZGDUcKWo7AX38k8reGQod6dYiwDXd3GRjtBH1Ahln/nqCz3Sn79+R6ZK
         7NATuUaUOlUKWdAzN2gXK7spbAGjAnwNpJ1xERsq4f6ElcvPpSrnlKRZpgeDU2FOAclq
         yXDvuS7aKAP6iw77FZdYrHBYe6uWuCz0iD/A8Jzu+4KxB0/dxnwlo73YFL7XBupKsyTv
         RBffnuxrCrjctZMBvcU0F9fXGiBzdFwCJf7vMASljT6cIqSp15S6h5pmXubxKznNmorC
         htsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768396817; x=1769001617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWiGwjTB0ZEpbDkwRFO+MVJzM9uZpDrSFPQIlzRZfsU=;
        b=RoHaRoqYoeOkDXfW3ziUfc/h/nD1n5tyFZ3S7SELkIw3dYkEkl3/mF8Ezgc3GcUqf6
         bgeYNUZCxB3iI0+ENV6ModjPD1AfwMKG/8ggzGdFnbK4X3PpkdRADCHAVevl7MSiupUL
         csJS4YTZlR6VCUpu+jZvcEtEMFhykFWpRNDQMDVfu8lpxCu9kpL43qmr+uLJqE4iKrCz
         tSjhi2xlN7vLGTGgu6hb6xAj2PrQ0ZHvqGZ/Lg+Co/NSxNhIfv2Cz1R4tRM5MxC9g+ID
         C8FavmKVXuoT0BjYNxwwFOGHChrQp9q7A/b1S1C9qhuOsCVOpgR0JbcCWbET3iQIJuzS
         +0KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzQzs9a8l79QGa5PSn8LKpAdO5uSVZv6rE3rChAIPOTnjt61SN/grERSwxZgdiUVM8D0GdiWMzkANAHVaxoTdq@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd6MGhllrjerBHMlhdu6pRnORHn/O5ta4+84CBi4OqhUIdJbat
	7U6WCsonbQ5LsjEo43pXH/iY09LCn18UjadS90x12B4T+98VwdjHGFIK7lI0J+3ngiY=
X-Gm-Gg: AY/fxX6UpPrZCCFaRicnddxVP+Fjh5/CWivEHnsa55z0M3MkA7qG2Ioog7BtmBStUIE
	HoHiDSSFENNJ2P3iKUsG6cTKiaXuSuMDldSHcug8VfWOOE4b6qka8U+VU/1YTXmEVkAeMlMancy
	iAGqG+hrn8gaGcCNKXgNBmXk89k7K0O5XiWK/SSWCubgvgvYSAw1rnkTZ3RDQpeKjOzfSncj7UG
	gKyikbo0R2eJ9GJNPOgLml36lOve7vRvBSJYdMw4Ewj7v74T5RsTktjFNaZ7udY04Jfms+qADIM
	tWgXBZkwu4c+UrWwIvsqSyyriZNOR/XtD8mNVLCli2iwgoJmZf7soGiixoHifjIbQhyQDDzi0N9
	NqqyQ6zxEBcSxre3dcGyg6fFgH9AbKhzcD/TtSK6rlrsKB4HUexFTd8hyeiIjYanKZG/EdAZRSp
	WXB18WPwD3SNBGoA==
X-Received: by 2002:a05:6000:2511:b0:431:9b2:61c0 with SMTP id ffacd0b85a97d-4342d5b2ab9mr2581603f8f.24.1768396817421;
        Wed, 14 Jan 2026 05:20:17 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm49153435f8f.4.2026.01.14.05.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:20:16 -0800 (PST)
Date: Wed, 14 Jan 2026 14:20:14 +0100
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
Subject: Re: [PATCH 05/19] printk: Add more context to suspend/resume
 functions
Message-ID: <aWeYDoMsdBNkJEqO@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-5-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-5-21a291bcf197@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_052019_607533_2FC82888 
X-CRM114-Status: GOOD (  11.81  )
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

On Sat 2025-12-27 09:16:12, Marcos Paulo de Souza wrote:
> The new comments clarifies from where the functions are supposed to be
> called.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

The improved comments would have helped to understand the previous patch.
I would either merge it into the previous patch or switch the
ordering.

If this stays as a separate patch, feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


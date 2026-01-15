Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82000D4117E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jS491F7pY/6VV44vwrzsFaAyA9RjAqjEAkamZCNInAE=; b=IJP93x482g/CUibNsBe4M+nL39
	pzd7vl8VJ5OndfP4G3xYVnN56g3nzO1M4/eKmDi8sK1wMG/IxTqa4Z7hJnEXz5cl9jQb+STDRRqpi
	nF8NoUxHwUFMXFgA3EX09u8K/FQU1tDSNlxZD+XeCSljdtxH+NSOXHRhMx1peiri4D+/vrRvmLef5
	mLwY2+nKoo9R5J3odO2TkOXgLLNISiGISlaO0AJKBTaHd2+4vUYNWK6mBh53m7Dscp9xxtJg2ascH
	5mXPnOkMppojg206cLXmYsdDfp+2HrL3X17B5Ihj781RyocuSp9+hmWo5te2LrfHIY0ICjod2YmX2
	MXha67yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMP9-0000000CKMp-25Gf;
	Thu, 15 Jan 2026 12:24:47 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMP6-0000000CKKq-3YTR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 12:24:46 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so442267f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 04:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768479883; x=1769084683; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jS491F7pY/6VV44vwrzsFaAyA9RjAqjEAkamZCNInAE=;
        b=Zvqsm4brzFzKhacO4vDWySb+gsvNvag5XpVDQwSb4sz8G83F+68LvglYVqMPwRCIag
         rYvSN9FSsVJq0EY2eW9WqJ3bA06d5UfDpw5uy1qmnQqB/FBskGJYGFbRNLs3sV9EHSdB
         YFKAM4R8A5VPo3vRtrAa8rb9qP6yu+RJFSiW87hrJoCdTc0nbphWtWT0dXgwECGhAfVt
         zlK9hS2ghXiE2yhf/sxPGfX9HdcE7HPwptkOH9WOY2t60oo3R+EB7ztFMfD9xTUkV4bF
         i9H3S/ev0TC0ruF0r5OlKGgNapL7XGQ/553om6EZSHQvmxa4omNiLiZZDJP8mJU1wcAi
         Os1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768479883; x=1769084683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jS491F7pY/6VV44vwrzsFaAyA9RjAqjEAkamZCNInAE=;
        b=EIZ4mE5wt6QbW+Nugim42WsqX+zMfcZ2JTBU0puRWBncS4O/Fe+WQ0anuXM2yFOJ8l
         Ts0EkG+hLC330gfrVlIIMdcrILHoYLSMaRaVULPNoodTvN9Y9jj2j/lB362LoSjxFHWE
         NAaZZqN//B2egEJKvHRyWATJq37nfHZhnNlQyRit4bZ4W9tuuzfun9ydPJgRh4tgKn7o
         kkF8RNotZMxSP4KpfS+wezieeNm8Up3zcu2wixpy9lGPkiYqHAYjF8Y0JFJSdL6tdkmW
         ngMJHghpkwidIXkufPBSgiSBKCww1mVoWGmZYIs11HtYQZ7k+qF6QLffDHh0Yw37451D
         5dTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+7Z7BCt0zwGck50eFvfk7+Az0wv4FB51xOrzPm2lwp2zkYjQS5sph6ACeoGV83Hu0mOM9d61PnQz6ysDkW/hn@lists.infradead.org
X-Gm-Message-State: AOJu0YzS+Grdz8sv+JNa1n3Ds0ID10KIWtpiLGlGdtChAp6uAGF3rL12
	TTtgmmXLiMPyOXJsgWLmMqg7PUTDyUG+cHLWEaWkz6x8EO+tMx8brum5hLvrYzw4HSY=
X-Gm-Gg: AY/fxX4a9jCC7z2W21bJvLcEdoeR6zaAWHLbk+DvLVLW5Xt1UpF3pNcZaM/A63JJj9D
	sobzvsiUjhLCGQqYopmh3QiffQ9O54SpXHYHxKvNIvW4dNYq2MgaantMBoLwg4tCHpcsuQVY58s
	P9DABOw0t4iX56NQ0uFOac0MoYWDLijML8o9ylaDdcOs5xDGVtD61Uk5gRtGhIceA8MgMVRAyUS
	z58Nt8TzTPaydFdVrS6RGoi4FEi9NwOFA9OfZNMLNwED2Do0hLpdlsYHpnnX9txVFsgWU/vXmnG
	iz2OxYtOWR+YXcFRpkzOQD0Ss4h4Cn6BRdXwWdjVr/waMdG/4317H9+F5BbNYT/HHT6Vigzby4Z
	v8OzyIT3IDQUkJP0QKWV4tl1LyU8veatxaQSNZwksNl/ndyyFS2AwQjzLvSKuFU58Rn+yXDXFp1
	qVQiaNbGLStE2XpQ==
X-Received: by 2002:a05:6000:1789:b0:432:5c43:64 with SMTP id ffacd0b85a97d-4342c547aa9mr7495008f8f.41.1768479882771;
        Thu, 15 Jan 2026 04:24:42 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af64a650sm5653238f8f.4.2026.01.15.04.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 04:24:42 -0800 (PST)
Date: Thu, 15 Jan 2026 13:24:39 +0100
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
Subject: Re: [PATCH 13/19] um: drivers: mconsole_kern.c: Migrate to
 register_console_force helper
Message-ID: <aWjch-EcYm7tkF0t@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-13-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-13-21a291bcf197@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_042444_898399_E381C920 
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

On Sat 2025-12-27 09:16:20, Marcos Paulo de Souza wrote:
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


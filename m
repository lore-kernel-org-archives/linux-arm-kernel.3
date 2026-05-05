Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4F1FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYyeBIbryO8JN51e301x9bqZZvN4oLOHjzKYFZ6iv5U=; b=azs4PvNiBbxO5BBWSkHkps7y+Q
	aLPFPKo2m+wdjDXhldwcnTLMeh6goTTOtZDedqG4rAsB+iXB+cLpMqIvc04j9V6Ak3yTSV74zy9t3
	qhbhWYTh7ZyFpUyqPB8kYSr8QmUx3XY0Zt+znLKq7/ptIQK3SGnRzitIJIhVpMMLcHiGpEXWARXBj
	FvupxVcAL8e57OutrITMapCobANAf9t0w14X8dM84SH5elMVyr70gGj0bH1d9vAkDRkF5KfMhe4Gp
	McAwiPIhygFuRpxF37uYHt3B4aDST/Sjh3qjLk6rZKckocas66b9HywxUhF5bM5l8cC7cN4M9V1fX
	Z2FeKPsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGjX-0000000GVPO-382K;
	Tue, 05 May 2026 14:26:47 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGjU-0000000GVO9-23Lr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 14:26:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-488d2079582so56739325e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 07:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777991202; x=1778596002; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iYyeBIbryO8JN51e301x9bqZZvN4oLOHjzKYFZ6iv5U=;
        b=fRUCzd/U66BcvhoXe+BUOSfPUrlFfb2T3mhss+Tt5zXpAU72AQ6IsZg6h2WtZ7IQT4
         xlZcMK8ZnwSJXa4OpQURBbFaDeZOGH3YG1pPyil9gLKDCkRB6V/FDdQyCckusvUewwI+
         D+EhFPrEvRD63VcUHxdVfggFiKSrgaF7eaH9leeubF7tVO4jKKHAn5UbblDmhocwgyph
         3bejWaSWWYUHYYBon1oGTWCnD4xS4CIzNphTQHpyDpAvntRvfW+vHn199CPfEnLHeRge
         wm3jsI1DGJ2jsHJcytyLTAGVPWyG1mY+aMn0gchBBl5RnkHTa7Oc/GuWMaREFOkHZUHV
         1r2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777991202; x=1778596002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYyeBIbryO8JN51e301x9bqZZvN4oLOHjzKYFZ6iv5U=;
        b=GOxNgb78jP9YUJQhp7ijSN9kqMAFbqvKu3wF2M/ltmKyrXPk44nGzv12iIxUQNj0mV
         Zeo1KvzX/7DVgOkZ4hSFlZ89ARwTk2DI3tvlnOT948QvTP4To2xXCi8UDKFtc+zAs1tB
         6Q6xlBPxHWsZq+YFPvvcwQv2qwcKeaQ+uKYlZrf0/aEAL7hUloZplTnRuWw3BrwoLl2O
         vTSdG4zxrGKfgSFohwpzLxIGYkHsRafXnpu35vfMozmp6aRk1cJbLijX0s/Jxz+lPaCA
         T+ii0nTigyqmoUQf0hKTAOzmsHzFs9fvmEMr9ts0zLo/KrA4iZRqr6MhY9vyv0To/dV3
         C2CA==
X-Forwarded-Encrypted: i=1; AFNElJ8GIfbiE5rcYPUNx/k6T1blHLy0pl9/PzJgWUbxo2j06kYYlrHQBkXQCcD1SuzdCNEJe1bPys7KeNLGrJJJ/xb4@lists.infradead.org
X-Gm-Message-State: AOJu0YwmCeRbJIA7CdDRf/hrpsuCILzF2wyHwwJOmWT8g8dEmFHKOnNu
	VK0z4WgytVwVIYQcs/aBHVX6djLsX8Yse8ztg+PUjdwEJECFw8OEhdHgLSevyyAQWCo=
X-Gm-Gg: AeBDievELLKDs8oBPw3bFc+n8MoOdV7YrEGkSen/v6aytCC6sNnMJJd+g7L+HJosRIt
	Oz+2LJ7rtnmLohtWJbf/Io4qNsU1GCfa3qhawwdRRiZF6w5Pwwtntp9MQ4/z/fK5ZDMvouD8NXi
	WnFDBKTANTjii6bsq92DLolqoFdefwOiQaEMF05Kk2yREXJ4UOab2Uvl/7KNomiXREEqD679cLs
	mP9+qA+WndUJpXJxyDv+IZRjVQz6cNyPVL9CdMg2sAIIzfFh1p7mq5howCYl7PQXKc+UysH8L6B
	5InS9Y5rZfdfpo5TziGVQgQjEVxgygVzPKyUvy4TN+rdtxdu0EgcoJMeKK6NKoGEp6ZVWGJWzAY
	bZPD6B6d0wgJPfqQfEQcDph2THLD74vIN6aZFYsmI1Zgh1bu/xmqj4PhkP1gw/opVfV2EiT5pdd
	RLb7ToceA/eq758+sGGLVZPubayBcmu47Alzca
X-Received: by 2002:a05:600c:4ed2:b0:488:a639:b772 with SMTP id 5b1f17b1804b1-48a98639ca9mr248173345e9.7.1777991202385;
        Tue, 05 May 2026 07:26:42 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d17ff35eesm19631165e9.14.2026.05.05.07.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:26:41 -0700 (PDT)
Date: Tue, 5 May 2026 16:26:39 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Clark Williams <clrkwllms@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH RFC] printk: remove BOOT_PRINTK_DELAY
Message-ID: <afn-H1EQJxnDs0BZ@pathway.suse.cz>
References: <20260505-printk_delay-v1-1-5dba51d7f17c@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-printk_delay-v1-1-5dba51d7f17c@thegoodpenguin.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_072644_544510_02F239F4 
X-CRM114-Status: GOOD (  24.67  )
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

On Tue 2026-05-05 14:45:00, Andrew Murray wrote:
> The CONFIG_BOOT_PRINTK_DELAY option enables support for the boot_delay
> kernel parameter, this allows for a configurable delay to be added before
> each and every printk is emitted. This is DEBUG_KERNEL option that is
> helpful for debugging as kernel output can be slowed down during boot
> allowing messages to be seen before scrolling off the screen, or to
> correlate timing between some physical event and console output.
> 
> However, since the introduction of nbcon and the legacy printer thread for
> PREEMPT_RT kernels, printk records are now emited to the console
> asynchronously to the caller of printk and its boot_delay. The delay added
> by boot_delay continues to slow down the calling process, but may not have
> any impact to the rate in which records are emited to the console. For
> example, if delay_use is set to 100ms, and the printer thread has a
> backlog of more than 100ms, perhaps due to a slow serial console, then the
> records will appear to be printed without any delay between them.
> 
> It would be unhelpful to add a delay to the printer thread, and it would
> not be possible to disallow selection of CONFIG_BOOT_PRINTK_DELAY at build
> time as it's not possible to detect which consoles are nbcon enabled at
> build time. Therefore, let's remove this feature.

Heh, Randy proposed to remove "boot_delay" few days ago.
This RFC goes even further and remove both "boot_delay" and
"printk_delay".

Honestly, I do not feel comfortable by this. The delay seems to
be handy when there is only graphical console. I would suggest
to do:

   1. Obsolete "boot_delay" with "printk_delay" as
      proposed in Randy's thread, see
      https://lore.kernel.org/all/afn2sYKKsqG4QBVX@pathway.suse.cz/

   2. Move printk_delay() from vprintk_emit() to
      console_emit_next_record() and nbcon_emit_next_record().

      For nbcon console, even better would be to use a sleeping
      wait in nbcon_kthread_func(). But it would need some
      changes to call it only when a record was really emitted.
      Also we would need to use the busy wait in
      __nbcon_atomic_flush_pending_con().

IMHO, the only drawback might be that the delay might be multiplied
when more consoles are registered. But I would ignore it. People
would use this option only when the graphical console is the only
one. It does not make sense for serial or network consoles.

Best Regards,
Petr


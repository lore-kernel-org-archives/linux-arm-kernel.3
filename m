Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E348F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wQZQ5d03;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CRy4jI7x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r5fedtBZtI4w1DXYYWOd9TkcAOuj87FP9VlEYhTELuQ=; b=wQZQ5d03GjBucJ
	p2JGqnSULVYwCZxZxMLR+BvEh9Hr6CYoI6c9W1iK9EQjK2BSIUSoU40dF5WVv3PJWPo5qdC4w+JZ3
	jUjOaLyto/U5nEc7/NlFFLQTlYpdVjTJ8KeYhwqLIhDWmk3Gd6tc25nJPkbgwoco033Bz804bGFUE
	zNUhB0lLuvYNnnKZbAGQ5WC23424vkegN3X/dER6jcRk+6hm7AU6wH1/vOCfSD6vNV8vQAVWImfWv
	e0HcdpNxoUeTWAucu7QZtiDQK/5c73ttrdokKp8mS7UITNcr042qh8r2ZJMzL/iR5nd+Ofxwm0KAo
	IUvLgn9QvBcapiOcsvVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqWw-0000000CFnU-4Bdo;
	Fri, 30 Oct 2026 17:36:43 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqWu-0000000CFmL-1QQQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 17:36:41 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-703be215729so461903eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 10:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793381799; x=1793986599; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r5fedtBZtI4w1DXYYWOd9TkcAOuj87FP9VlEYhTELuQ=;
        b=CRy4jI7xDB48hNdUX6yox7hZoUgUO5RjGBY/UAZ/ulzm4OKJ2fQGqP75I8npea34e0
         6hy/en14EFr1zu5U5RJek46Q0XPzjhyFD+r7Ew6Jkhkz8pPTIKpST+Fk0obrZgDpxpy3
         CDG/rZLh7q1KgBlFy9nE/doo6t8PW06Nwvdek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381799; x=1793986599;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5fedtBZtI4w1DXYYWOd9TkcAOuj87FP9VlEYhTELuQ=;
        b=rNdqNjHJ7nRHaNIJt7WNELWBdV1ISc9I9BFT3GVqta2L54jJxY4CexVRhfsGJvTk5t
         5x/Zx5Ngt/OMu3EOFZMNe7+pgYk8UV43mDtW6jvx7o4L4pDcFyQB54tNlS8RfVtBoZT/
         dldtZgwzZu+3u/3euFOR4yhro+xlC1yEDbBXvU+GDS/dv55nneda4dY8HYHY4/zgcnYQ
         kvuVdCHXMjcaHL4x1B9na6zxcduF0DnmcVK8TLA6Xl8cUPYjRMxNx3J3gFeMEFJgw4ZW
         V6r8tM4+OGdJ+0iSrqh/zJimCKR9ej5tZoZKxfrV+GMUFpWej78CeS6KbN8+FEwzBtww
         K8Vg==
X-Forwarded-Encrypted: i=1; AKwUvBxw5gmychtaO9DcOlPKJ9XRhiGgbJJTuBGZ3VEcDRHZy1ZE/ZLyjmq7Dy70kwu5aqFIb6R/8MayuPDEcuLRFahC@lists.infradead.org
X-Gm-Message-State: AFq9FYJROEcC9inTSaYUOgrn2R95tLfRsZwmiBJ0mSf5r3fQTEyV71bh
	chHo9DcfuRJ7J59VzoPDL4YWx7U/17tSD4Wloe59q9UuOEp1rhxiQdgG4L51fpZA/A==
X-Gm-Gg: AYBFou1ulzVhIgleEDso9cnhrOEcoTOXH4Fwu8D9eDGo58ccUS3Jrte18Roo/obmunX
	1I5++lMwV9TFFF0L3vHaVsHleiyc55w2c4J0hHtN8i7E+XvU6Z3oIDwqs386KTW2ZdLQ+Af0Jt0
	6Xctg6K5/62/49SJGRdW1TYrJJegRf/LIfGxtYl9vVOPzrNjTOnrSUBzxCraYc8ab/S83u+GDVG
	IW0wP37izXnTfZ940cwvFOnIR2B5LLfTAPcj9LFfnJslAuJy7Zw7w6jK7SmUf8DRa85zDjY5+g2
	/L6gHgfcKt4bmRV1wLCAj8ucdGiQJClv7UHb0R11lqj3f+NHlzDqwEJ3Q8vm6D+5u9JoI/Bia27
	wmLnKrjtbRwWj8EW7W3jMqCHKmgAYoGLxebJYASmcKqiPY1OrldBnwcez/QjZvdQgmPDNuqkHvo
	/3v/fOtrqr9KgxnnER+0KpIAr7IcWhLhHo2IZ0zGbIalEyZzMupYn/5zR10n5lY2CX9WVzUK/kR
	SiFBD4To7HtxmkuoOocPGWy+CNx77gCW7B5ycJlLxWkbKP5/nL/qA+yjlfhs0ApAtKCvK9TjHoR
	w7Op0+qx9DYVBYgHlWk58586ukoUjn1QAGNgLGH6GaQfhFmnYCkx8N7OXBPaycbb5JfqAtoo88E
	GZMZvugmFvfdHtp8=
X-Received: by 2002:a05:6820:625:b0:709:529a:4775 with SMTP id 006d021491bc7-714f6e7ffc6mr1212713eaf.50.1793381798577;
        Fri, 30 Oct 2026 10:36:38 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354efebesm2497044a34.19.2026.10.30.10.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:36:37 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?UTF-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Pali =?UTF-8?Q?Roh=C3=A1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 5/6] serial: 8250: retire canceled RX DMA before reusing the receive buffer
Date: Fri, 30 Oct 2026 11:36:34 -0600
Message-ID: <20261030173635.2186490-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <CADvTj4qK-1SX_+YZW1jdW-e5JOZ2iz3vAK_8UvkyZWb0rAeyiQ@mail.gmail.com>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com> <20261029-submit-serial-8250-dma-cancel-v1-v8-5-3fd56ba352ed@gmail.com> <20261029222734.3086943-1-rrangel@chromium.org> <CADvTj4qK-1SX_+YZW1jdW-e5JOZ2iz3vAK_8UvkyZWb0rAeyiQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_103640_419536_504837A0 
X-CRM114-Status: GOOD (  16.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 6:32 PM James Hilliard <james.hilliard1@gmail.com> wrote:
> With a persistent pause failure and an incomplete transfer, the
> worker keeps retrying. RX remains masked and the runtime PM reference
> is held until the condition resolves or shutdown takes over. There
> is no receive-progress guarantee if the peer remains idle and pause
> continues to fail.
...
> A failed pause with an incomplete cookie does not distinguish a
> persistent hardware fault from completion that has not yet been
> published. A fixed retry limit does not resolve that ambiguity.
>
> Terminating after the limit may discard received data, including a
> completed buffer whose completion is still unpublished. Successful
> termination would make subsequent buffer reuse safe, but would not
> recover those bytes. This would therefore be a potentially lossy
> error-recovery policy rather than a lossless timeout flush.

Checking the in-tree dmaengine providers shows why bounding the retry loop
and escalating to recovery is necessary in practice:

1. `serial8250_request_dma()` (`8250_dma.c:428`) checks `caps.cmd_pause`,
   which `dma_get_slave_caps()` (`drivers/dma/dmaengine.c:614`) sets purely
   from `!!device->device_pause`. However, `drivers/dma/tegra186-gpc-dma.c`
   (lines 422-423, 1351, 1521) unconditionally assigns
   `tdma->dma_dev.device_pause = tegra_dma_device_pause` (so
   `caps.cmd_pause == true`), and then returns `-ENOSYS` at runtime on
   Tegra186 where `tdc->tdma->chip_data->hw_support_pause` is false. And on
   Tegra194/234/264 (`tegra186-gpc-dma.c:399-413`) and Tegra210
   (`tegra210-adma.c:574-579`), `.device_pause()` polls a hardware busy bit
   with an atomic timeout and returns `-ETIMEDOUT` or `-EBUSY` if an active
   burst does not pause in time.

2. In the in-tree providers where `.device_pause()` returns an error because
   a transfer already completed—such as `drivers/dma/ti/edma.c:870, 1468-1469`
   (returning `-EINVAL` when `!echan->edesc`) and
   `drivers/dma/stm32/stm32-dma.c:751-753, 836, 1432` (returning `-EPERM`
   when `chan->status != DMA_IN_PROGRESS`)—the DMA hardirq handler calls
   `vchan_cookie_complete()` *before* clearing the active descriptor, so
   `dmaengine_tx_status()` already reports `DMA_COMPLETE` on the very first
   check in `serial8250_rx_dma_try_flush()`.

   Even on a controller where hardware rejects `pause` the instant the 4096th
   byte finishes while its completion hardirq is still masked by `port->lock`,
   the only thing delaying `completed_cookie` publication is local IRQ masking
   under `port->lock`. Once `serial8250_rx_dma_flush_work()` drops `port->lock`
   (enabling local IRQs) and sleeps `usleep_range(1000, 2000)` in process
   context, any pending DMA completion hardirq runs in microseconds. Across
   5 retries (5-10 ms with `port->lock` released on each sleep), a completed
   4 KB transfer will have published `DMA_COMPLETE`.

   By contrast, leaving the `for (;;)` loop unbounded turns any persistent
   `dmaengine_pause()` error (`-ENOSYS`, `-EINVAL`, `-EBUSY`, `-ETIMEDOUT`) on
   a partial transfer into a guaranteed 100% loss of all current and future RX
   data until `close()`, a 500-1000 Hz `system_percpu_wq` spin, a permanent
   runtime-PM leak, and silently aborted `dw8250_set_divisor()` /
   `dw8250_check_lcr()` calls (`-EAGAIN`). Escalating to recovery after a
   bounded retry budget is strictly better than wedging the receiver forever.

> That requires termination to succeed and callbacks to be drained.
> If termination fails, the channel may still access the FIFO, so PIO
> must remain excluded.
>
> The recovery requirements depend on why the provider cannot pause.

Agreed—and `serial8250_rx_dma_flush_work()` in Patch 5/6 already enforces
that when `serial8250_rx_dma_recover(p)` is called (`8250_dma.c:210-216`):

	if (recover) {
		ret = dmaengine_terminate_sync(dma->rxchan);
		if (ret) {
			/* Retain ownership and keep RX masked if DMA cannot be stopped. */
			dev_err(p->port.dev, "failed to stop RX DMA: %d\n", ret);
			return;
		}
	}

When `serial8250_rx_dma_recover(p)` sets `dma->rx_err = true` and
`dma->rx_terminating = true`, the worker exits the retry loop and calls
`dmaengine_terminate_sync(dma->rxchan)`. If `dmaengine_terminate_sync()`
returns non-zero, the worker returns early at line 215 with
`dma->rx_terminating == true` and `dma->rx_running == 1`, keeping RX
interrupts masked in `IER` and keeping PIO excluded (`serial8250_rx_dma_flush()`
continues returning `-EIO`). It only clears `dma->rx_running = 0` and unmasks
`IER` for PIO fallback after `dmaengine_terminate_sync(dma->rxchan)` succeeds
(`ret == 0`).

Thanks,
Raul


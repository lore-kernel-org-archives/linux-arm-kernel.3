Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF0F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 09:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AEa8UbdT;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K1lNtpLJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ve7/ta2qXklayNEaTRWpAyY7NQ5wEHfm2ehfZ70xWKQ=; b=AEa8UbdTnwv2GTl5mtin+8FGMi
	EXAm9F5u/xtRwotUPG/I1tyA1UY0J0koFdhJy/M4qsvH4IrEt+ihdfMdlbCLLySiNifcL1pGN/rr+
	u8URNS910Z6uVBiDXxQ9xgMtLNiowQlYKMr7Qyo15AQYQ2MC8FSg7sQRtoRKKB08mgyEAoFU/GKW5
	tpr4xHhFSXUy3v5QM6ZiiEspSrl9XWLvV/FtZxosmidPyzeNqHeLQ93ZpLQF8HEfaCwFUPJ/D0Z6I
	bFWqyo5Amdx6vOMpANfa96rp+MySp7ymRdkOB3bQG5/Ani8P22WghrGFQOfLp7R9UvJ5MImTZSFfj
	1wSy2UFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKC2e-0000000G6JA-3uKH;
	Fri, 23 Oct 2026 09:58:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKC2d-0000000G6Iw-2vum
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 09:58:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2944940629;
	Fri, 23 Oct 2026 09:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB2F1F01829;
	Fri, 23 Oct 2026 09:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792749507;
	bh=Ve7/ta2qXklayNEaTRWpAyY7NQ5wEHfm2ehfZ70xWKQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=K1lNtpLJ5hGgTEJHSo7X+occejhyWypLrDv/ENmR43gWm4csEY/tDA9KWScEyd4qB
	 hZZ6cqWfRxR934Po00vYpLMEuX4eVbMzEzLRhYLprt2NJNUNyDJ20i6UnnFWRgqjGt
	 1aZeiNgOA+nwkS+fsXOGsIghycIqdsEP5qtlXB64cD3RDYFnUBimIxiDxR0Jyg4bd7
	 ZS4IEB+oii7QSiMCF3uNvF9GiH0I0LjjRe36Anghsu+kwDDV1n1p5n8rIU2PV44kpp
	 vFTf8heq2IL9Zvdj91uxwghENinIbcNR/3uZ8JiGznBQMpGPtkg5Gxs++0Hz7S+svr
	 zk9lRm1VQwgxA==
Subject: Re: [PATCH 3/3] can: ifi_canfd: enable NAPI before starting the controller
From: netdev-bot+sashiko@kernel.org
To: patrzhan@amazon.com
Cc: mkl@pengutronix.de, mailhol@kernel.org, linux-can@vger.kernel.org,
 pisa@cmp.felk.cvut.cz, ondrej.ille@gmail.com, harini.t@amd.com,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org
Date: Fri, 23 Oct 2026 09:58:25 +0000
Message-ID: <179274950592.3130.11275892525697074934@kernel.org>
In-Reply-To: <20261021205924.2538511-4-patrzhan@amazon.com>
References: <20261021205924.2538511-4-patrzhan@amazon.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Because napi_enable() now runs before ifi_canfd_start(),
  ifi_canfd_poll() can run against an IFI CAN FD IP that has not been…

--

can: ifi_canfd: enable NAPI before starting the controller

This patch moves napi_enable() ahead of ifi_canfd_start() in
ifi_canfd_open(). The goal is that an RX interrupt raised right after the
controller is enabled can schedule the poll, instead of being dropped and
leaving the interrupts masked.

> diff --git a/drivers/net/can/ifi_canfd/ifi_canfd.c b/drivers/net/can/ifi_canfd/ifi_canfd.c
> index 0f83335e4d07..feb738eb0c9a 100644
> --- a/drivers/net/can/ifi_canfd/ifi_canfd.c
> +++ b/drivers/net/can/ifi_canfd/ifi_canfd.c
> @@ -846,9 +846,12 @@ static int ifi_canfd_open(struct net_device *ndev)
>  		goto err_irq;
>  	}
>  
> +	/* Keep before ifi_canfd_start(): the ISR masks the interrupts and only
> +	 * the poll unmasks them.
> +	 */
> +	napi_enable(&priv->napi);
>  	ifi_canfd_start(ndev);

[Severity: Medium]
With NAPI enabled before ifi_canfd_start(), can ifi_canfd_poll() now run
against an IP that has not been reset yet? Can it also run alongside the
reset and programming sequence in ifi_canfd_start()?

The handler is installed with IRQF_SHARED just above. So ifi_canfd_isr()
can run because of another device on the line, or because of a line that
is still asserted. The ISR acts on the raw status and does not AND it with
IRQMASK:

ifi_canfd_isr() {
    ...
	isr = readl(priv->base + IFI_CANFD_INTERRUPT);
    ...
	if (isr & rx_irq_mask) {
		ifi_canfd_irq_enable(ndev, 0);
		napi_schedule(&priv->napi);
	}
    ...
}

Before this patch, NAPI was still disabled, so this schedule was dropped.
The ifi_canfd_irq_enable(ndev, 1) inside ifi_canfd_start() then recovered.
Now the schedule succeeds.

ifi_canfd_plat_probe() only reads IP_ID, VER and CANCLOCK, and the driver
has no .shutdown hook. After a kexec or warm boot, could the IP still hold
RX data or error status when the device is first opened?

If so, the poll can run on another CPU, or at irq_exit in the middle of
ifi_canfd_start(). It would then do the following with no lock:

  - read STCMD and RXSTCMD
  - drain the RX FIFO through ifi_canfd_read_fifo()
  - possibly write ERROR_CTR from ifi_canfd_handle_lec_err()
  - call ifi_canfd_irq_enable(ndev, 1)

Each of these could interleave with the HARDRESET, the RX/TX FIFO resets
and the ERROR_CTR unlock/reset/enable writes in ifi_canfd_start().

Possible results:

  - a stale or half-reset FIFO entry delivered as a received frame
  - a spurious ERROR_ACTIVE state-change frame with error_warning++,
    because priv->can.state is still CAN_STATE_STOPPED
  - a stale BUSOFF bit in STCMD, which makes
    ifi_canfd_handle_state_change() do this:

	priv->can.state = CAN_STATE_BUS_OFF;
	ifi_canfd_irq_enable(ndev, 0);
	priv->can.can_stats.bus_off++;
	can_bus_off(ndev);

In the bus-off case, ifi_canfd_start() then overwrites the state:

	priv->can.state = CAN_STATE_ERROR_ACTIVE;

With restart-ms set to 0, can_restart_now() would return -EBUSY, because
the state is no longer CAN_STATE_BUS_OFF. Would the interface then stay
carrier-off until the next down/up?

The commit message says:

  "NAPI can be enabled while the controller is in reset, because nothing
  schedules it until an interrupt arrives."

That seems to hold only after a previous close, where ifi_canfd_stop()
writes HARDRESET, masks IRQMASK and clears INTERRUPT. It does not seem to
hold for the first open after boot or kexec, or for ISR calls coming from
the shared line.

Would it be safer to quiesce the IP first? That would mean HARDRESET,
masking IRQMASK and clearing INTERRUPT, either in probe or before
napi_enable(). Another option is to move napi_enable() into
ifi_canfd_start(), after the reset and interrupt clear and before
ifi_canfd_irq_enable(ndev, 1).

The bus-off restart path, ifi_canfd_set_mode() -> ifi_canfd_start(),
already runs with NAPI enabled, so a similar overlap exists there. This
change extends that existing weakness to the open path.

>  
> -	napi_enable(&priv->napi);
>  	netif_start_queue(ndev);
>  
>  	return 0;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261021205924.2538511-1-patrzhan%40amazon.com


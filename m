Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D505FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 03:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5BgMUGkEMsFG9ZLf3D3wZ4BkF4xp5R206VdwWcIrhk=; b=4a7T6pv9JF1QUSAnFK7n0DQQPj
	iQfB+G5mReJS9IbCkzP8SsZI0QGcaMpzXeIIy5J018iwVZ2Xs1u6O++7N5S+2WIbcB7p5Znl0gBv8
	HSi/waR2IjZfWmyYzYn3EuAahc97v1LNU56WlINLMYKEMnYEN/N59+N/ph4uZN2JPOTTtBUk9p1Xd
	fxsTfTc92b8ppYq43Gkz31XSNb01JqnqcPFDZJMe4POzwRA9vczfYLFHC3bj514Rp9yq9+/nsvcnz
	EtgMtp6+9ELl6SAFpovVhUybyOmJYmjWHpMgDIFIh4GO50LmfrQvuokCoG4ijslKF/1C6OdiZO3fx
	pzdlXnuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvOT-00000002qNa-2JvX;
	Wed, 29 Apr 2026 03:15:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvOS-00000002qNL-087h;
	Wed, 29 Apr 2026 03:15:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 322CE6015B;
	Wed, 29 Apr 2026 03:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757F4C2BCB7;
	Wed, 29 Apr 2026 03:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777432518;
	bh=PqScKcFoPPgpexhKPsSgcvCiB53igOl/DrNGGj6eMVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UyoSKuJPYIHp4A95gcJi+VB1NyBhcON/g+p4FYn3wIZho8+01Wz4iTQokfHMVV/CZ
	 GHMsDPuCBQisRarBORul2isa19te8QbuNqVem/9QZ4y/qRfSQZBu4ayJUEEZnJ1+WG
	 pXndTlo1kvwJ4vScP0dB7/zpRW71iKpkrdV52gFyUQwsRixdaVD9PoLPENcXiTK12e
	 BQz3p6FReX0V1HHUPByxTb559LYC9VKUMPjrP4NBHkFztwEYXXTypUgFtGQ2KRn8a/
	 EDcZ+BJDw5OmkwXm4mjPOkIojnmgEt2qZXiHkoGdBETJAYwJslXffdKJM/JlqRGeNn
	 Aph20qS6mErUQ==
Date: Wed, 29 Apr 2026 03:15:15 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
	YC Hung <yc.hung@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mailbox: mtk-adsp: fix UAF during device teardown
Message-ID: <afF3w2QS8P-8LPMt@google.com>
References: <20260428025614.1094085-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260428025614.1094085-1-senozhatsky@chromium.org>
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

On Tue, Apr 28, 2026 at 11:55:44AM +0900, Sergey Senozhatsky wrote:
> When the SOF audio driver fails to initialize (e.g. firmware boot
> timeout), its devres unwind frees the snd_sof_dev object that the
> mailbox client (mtk-adsp-ipc) reaches via chan->cl->rx_callback.
> The mtk-adsp-mailbox shutdown clears the mailbox command registers
> but leaves the IRQ line unmasked, so a late interrupt can still
> queue a threaded handler after mbox_free_channel() had cleared
> chan->cl, and mbox_chan_received_data() would then trigger UAF:
> 
>   BUG: KASAN: slab-use-after-free in sof_ipc3_validate_fw_version
>    sof_ipc3_validate_fw_version
>    sof_ipc3_do_rx_work
>    sof_ipc3_rx_msg
>    mt8196_dsp_handle_request
>    mtk_adsp_ipc_recv
>    mbox_chan_received_data
>    mtk_adsp_mbox_isr
>    irq_thread_fn
>   Freed by task ...:
>    kfree
>    devres_release_all
>    really_probe
>    ... (sof-audio-of-mt8196 probe failure)
> 
> The crash was observed roughly three seconds after the failed probe.
> 
> disable_irq() in shutdown and enable_irq() in startup. disable_irq()
> also waits for any in-flight interrupts, so by the time
> mbox_free_channel() proceeds to clear chan->cl no rx_callback can run.
> 
> In addition, request the IRQ with IRQF_NO_AUTOEN so it stays masked
> between probe and the first client bind — otherwise an early interrupt
> can crash on chan->cl == NULL in mbox_chan_received_data().
> 
> Fixes: af2dfa96c52d ("mailbox: mediatek: add support for adsp mailbox controller")
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>


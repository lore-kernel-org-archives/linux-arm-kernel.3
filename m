Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AAACD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 13:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXV5sOcPo5EdgGgghpRQ3MuzjSpAQqR7Rz2Uoz+R8h4=; b=Z3TYkprDv8E1Rn8COzlpR9W5eN
	f4Rps/s31i51zAEq7C7JwF1nxhIJSpm3azmV908PtsqWuwbDpk/wL8koQzgFAkEhMpcu33YzWkeMq
	MST8FE5uVKd0D6Icj2Amkcf3XFTUpMKACpu6+Vbo1FFvby1RgcitT564StQZKumUtFXsij3s6tevz
	BL2Es7ckT3elelC8I6kImbg5QNSV3T6vUxbBl1OdCZDV74WX3s6zrdXAY9XAd5xerDw7K2t1WjDkJ
	YaKR/dcHjxwpuvOIq3HX9lAb+B9PeRINp8pvyHUV1uJ17xNSflkqBrzqoSCBVkhVFsx7UZEO8/ZHe
	a0jOSfSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtZP-0000000DL40-3o4K;
	Mon, 04 May 2026 13:42:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtZO-0000000DL3r-3mz2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 13:42:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06A9C600C3;
	Mon,  4 May 2026 13:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59ADDC2BCB8;
	Mon,  4 May 2026 13:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777902165;
	bh=8tSxUuDeUyvAzyJEtbx33GrMXbNrQ8yGPFNRsdz/Gs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zrh5lzVfDhZEsk2qhy4yS5mwhpiYAWQXd41K5Z+bqFwH7Uzmef/Z8XTg/NHKKI0hD
	 TVmdh+yKwg03VNygJ9vobHiCUrYkun7ThShNwwaEs1ATuiAw1F9ggDcNryy26TvPzQ
	 gA5T2CYQE43C+HM2mzetxkuUprqZdZOHII6qR2Y0EUKQJ++T5+knqWzFmwmfMFMkEM
	 VGuzKVCJWuVeo/lbTpKJnLxDV4pz7WDIKI4V1etF4iKaKUBqb+MH+OKHRwvJ8QDfid
	 hQf9kmW4NYN5sJ5qqXcFu8044fZxP1wIuC5rXJ8H1dFkRJ+bif39CBxKiyOs78C8T/
	 DYlhXoJuklPpA==
Date: Mon, 4 May 2026 16:42:41 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
	linux-arm-kernel@lists.infradead.org,
	linux-integrity@vger.kernel.org, kernel@pengutronix.de,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: tpm: spi: do not call blocking ops when !TASK_RUNNING; during
 shutdown
Message-ID: <afiiUdFv7p0fuK-5@kernel.org>
References: <e7974d35-0d50-4742-8747-822f28915e00@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7974d35-0d50-4742-8747-822f28915e00@gmx.net>
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

Hi Stefan,

On Mon, Apr 20, 2026 at 12:25:21PM +0200, Stefan Wahren wrote:
> Hi,
> we use a custom i.MX93 board, which based on Phytec Phycore i.MX93 with a
> TPM connected via SPI. If I enable CONFIG_DEBUG_ATOMIC_SLEEP=y in our kernel
> config with mainline kernel 6.18.23 and reboot our board, I will get the
> following warning:

Please provide results with the latest mainline kernel.

> 
> [   43.287416] do not call blocking ops when !TASK_RUNNING; state=1 set at
> [<000000005a2107f3>] prepare_to_wait_event+0x54/0x14c
> [   43.299009] WARNING: CPU: 0 PID: 1 at kernel/sched/core.c:8857
> __might_sleep+0x74/0x7c
> [   43.306920] Modules linked in: polyval_ce flexcan rtc_rv3028 can_dev
> mse102x phy_can_transceiver fuse autofs4
> [   43.316838] CPU: 0 UID: 0 PID: 1 Comm: systemd-shutdow Not tainted
> 6.18.23-00002-g626a194342f0 #2 PREEMPT
> [   43.326471] Hardware name: chargebyte Charge SOM Evaluation Kit (DT)
> [   43.332807] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS
> BTYPE=--)
> [   43.339757] pc : __might_sleep+0x74/0x7c
> [   43.343675] lr : __might_sleep+0x74/0x7c
> [   43.347592] sp : ffff800081aab720
> [   43.350894] x29: ffff800081aab720 x28: 0000000000000080 x27:
> ffff000000235880
> [   43.358018] x26: ffff800081897000 x25: 0000000000000018 x24:
> 0000000000000000
> [   43.365142] x23: ffff800081aab907 x22: 0000000000000000 x21:
> 0000000000000080
> [   43.372266] x20: 000000000000010f x19: ffff80008131cd00 x18:
> 0000000000000001
> [   43.379390] x17: 0000000000000000 x16: 000000000017d600 x15:
> ffff00003fda4680
> [   43.386514] x14: 0000000000017e01 x13: 0000000000000209 x12:
> 0000000000000000
> [   43.393638] x11: 00000000000000c0 x10: 0000000000000950 x9 :
> ffff800081aab5a0
> [   43.400762] x8 : ffff0000000d89b0 x7 : ffff00003fda3f00 x6 :
> 000000013417d29a
> [   43.407886] x5 : 0000000000000000 x4 : 0000000000000002 x3 :
> 0000000000000010
> [   43.415010] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
> ffff0000000d8000
> [   43.422135] Call trace:
> [   43.424570]  __might_sleep+0x74/0x7c (P)
> [   43.428487]  mutex_lock+0x24/0x80
> [   43.431797]  spi_bus_lock+0x20/0x50
> [   43.435281]  tpm_tis_spi_transfer_full+0x70/0x2c4
> [   43.439979]  tpm_tis_spi_read_bytes+0x3c/0x48
> [   43.444321]  tpm_tis_status+0x58/0xf8
> [   43.447978]  wait_for_tpm_stat_cond+0x30/0x90
> [   43.452329]  wait_for_tpm_stat+0x1cc/0x2e0
> [   43.456419]  tpm_tis_send_data+0xdc/0x334
> [   43.460423]  tpm_tis_send_main+0x74/0x160
> [   43.464427]  tpm_tis_send+0xd4/0x13c
> [   43.467998]  tpm_transmit+0xc4/0x3c4
> [   43.471569]  tpm_transmit_cmd+0x38/0xd4
> [   43.475399]  tpm2_shutdown+0x6c/0xa4
> [   43.478970]  tpm_class_shutdown+0x60/0x88
> [   43.482974]  device_shutdown+0x130/0x25c
> [   43.486891]  kernel_restart+0x44/0xa4
> [   43.490549]  __do_sys_reboot+0x114/0x254
> [   43.494466]  __arm64_sys_reboot+0x24/0x30
> [   43.498470]  invoke_syscall+0x48/0x10c
> [   43.502214]  el0_svc_common.constprop.0+0x40/0xe0
> [   43.506911]  do_el0_svc+0x1c/0x28
> [   43.510222]  el0_svc+0x34/0xec
> [   43.513273]  el0t_64_sync_handler+0xa0/0xe4
> [   43.517441]  el0t_64_sync+0x198/0x19c
> 
> Best regards

BR, Jarkko


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C6FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 13:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nSLP590tH+YrdMCZ3ykFZ5UctbQuGnKXxbm3iof4jgE=; b=DqRKZnI2qA03lnxaF5jQ5izJ7e
	XsvAIfEFPx723nslK6UniX7WEDuEM8GFlASQdwpYZY6m986jPwQqZpECgBvIP8unTtwmrnoYZ8xZ1
	pt5Sta0k+f+czYsJS/OrMS7Z/R2XnG9nZXX7G6XolYnca9GpqCU2481UzZNsHOTpRvoaGOSnm1/QD
	GFqnPONIyumLW49kpUbAonM8artDV9+1n5DbI1BUnBub8ATaxarqJxqvblzS77oEnu7rOyc+LnO9D
	g9a+64gpeZAVy6bBl1e9n+tECfd7dxCKTctcUbA4qDN8rRrU8fo8yAjHF3/fzZdDp0aakZGVmZgGi
	dSfOuWDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVZC-00000000kbS-3PzC;
	Thu, 13 Aug 2026 13:33:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVZB-00000000kb9-2pEy;
	Thu, 13 Aug 2026 13:33:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B863460A72;
	Thu, 13 Aug 2026 13:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C19A1F000E9;
	Thu, 13 Aug 2026 13:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786628032;
	bh=nSLP590tH+YrdMCZ3ykFZ5UctbQuGnKXxbm3iof4jgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=flKOaZplI1eVL+EvOd2ocj5LMKADV1j0JnLCz8Gat5bVdSlkgB2q9ssXUJZizXrXz
	 rrfDBMm/Fs22loTiue3RGUKHjotJtgtXH2gWJgCfluyEnTrLmCtkuk1wCrwNjUp+gk
	 3Oo3OSWQxgxbSVdQuCS+49XHH4bYQ957Wn8+W1KSUHf7kMTUsi4vDJE1n7CweiUiEa
	 Rp+8PtYDCKzarwMz2tka4v1f2zDh5meSrs/J5j7+vGlMWMAykiPvlAhKo29SIjNFe9
	 JwDrKtBw2e0kp5fjKvferDsaEyNU6/jjU01+EnjABnR0HyCVuT3Ywx23imI42sr+Mu
	 c+vfOxSy7wR2g==
Date: Thu, 13 Aug 2026 14:33:48 +0100
From: Simon Horman <horms@kernel.org>
To: Vitaliy Sochnev <sochnev.v.74@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	stable@vger.kernel.org,
	"moderated list:AIROHA ETHERNET DRIVER" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:AIROHA ETHERNET DRIVER" <linux-mediatek@lists.infradead.org>,
	"open list:AIROHA ETHERNET DRIVER" <netdev@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net v2] net: airoha: npu: load the firmware without the
 sysfs fallback
Message-ID: <20260813133348.GB265046@horms.kernel.org>
References: <20260811181717.19339-1-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811181717.19339-1-sochnev.v.74@gmail.com>
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

On Tue, Aug 11, 2026 at 07:16:59PM +0100, Vitaliy Sochnev wrote:
> airoha_npu_load_firmware() maps a missing firmware file to -EPROBE_DEFER
> so that the NPU can be brought up once the rootfs carrying /lib/firmware
> has been mounted. That mapping holds only as long as request_firmware()
> reports -ENOENT.
> 
> It does not when the sysfs fallback is in play. With
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK set, or with the fallback armed at
> runtime through /proc/sys/kernel/firmware_config/force_sysfs_fallback,
> request_firmware() hands the request to a userspace helper, waits out the
> full loading_timeout and returns -ETIMEDOUT. The -ENOENT test no longer
> matches, dev_err_probe() turns the result into a hard failure, and the
> NPU is left unbound after stalling the boot for 60 seconds:
> 
>   airoha-npu 1e900000.npu: Direct firmware load for airoha/en7581_npu_rv32.bin failed with error -2
>   airoha-npu 1e900000.npu: Falling back to sysfs fallback for: airoha/en7581_npu_rv32.bin
>   airoha-npu 1e900000.npu: error -ETIMEDOUT: failed to run npu firmware
>   airoha-npu 1e900000.npu: probe with driver airoha-npu failed with error -110
> 
> Clearing FW_LOADER_USER_HELPER in the configuration is not a dependable
> guard against this, because unrelated drivers select it. On the affected
> build the symbol was turned back on by LEDS_LP55XX_COMMON, even though
> the platform had explicitly disabled it.
> 
> Use request_firmware_direct() instead. It sets FW_OPT_NOFALLBACK_SYSFS,
> so a missing file is reported as -ENOENT whatever the firmware loader is
> configured to do, and the deferred probe path works as intended.
> 
> Two consequences are worth stating plainly.
> 
> The helper is not merely bypassed for the boot-before-rootfs case.
> fw_run_sysfs_fallback() returns early on FW_OPT_NOFALLBACK_SYSFS, so this
> driver's firmware requests can no longer be served by a usermode helper
> at all, including on a system where that is the only delivery route;
> having no second firmware source, the driver would defer forever there.
> That is a deliberate trade-off: the -ENOENT to -EPROBE_DEFER mapping was
> written to wait for a filesystem, and the sysfs helper interface has had
> no in-tree consumer since udev dropped firmware loading.
> 
> request_firmware_direct() also sets FW_OPT_NO_WARN, which drops the only
> message naming the file that failed to load. Report it from the driver
> instead, so the name lands in the deferred probe reason and shows up in
> the "deferred probe pending" line emitted at
> driver_deferred_probe_timeout. The generic report in airoha_npu_probe()
> goes away with it, since it would otherwise overwrite that reason with a
> message naming nothing; of the paths it covered, devm_ioremap_resource()
> reports itself and the malformed firmware-name property now does too.
> 
> Measured on a Nokia XG-040G-MD with FW_LOADER_USER_HELPER=y and
> FW_LOADER_USER_HELPER_FALLBACK=y forced on, two images from the same
> tree differing only by this patch:
> 
>   without:  fallback at 2.477s -> -ETIMEDOUT at 64.555s -> probe failed
>             with -110, preinit at 69.6s, NPU unbound
>   with:     no fallback, NPU fw version 1456.62 at 3.665s, preinit at
>             7.6s
> 
> Fixes: 23290c7bc190 ("net: airoha: Introduce Airoha NPU support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
> ---
> v2:
>  - Keep the file name in the diagnostics. request_firmware_direct() also
>    sets FW_OPT_NO_WARN, which dropped the only message naming the file;
>    report it from airoha_npu_load_firmware() through dev_err_probe() so
>    the name lands in the deferred probe reason. Drop the generic report
>    in airoha_npu_probe(), which would overwrite that reason, and give
>    the malformed firmware-name path a message of its own.
>  - Say in the changelog that the usermode helper path is disabled for
>    this driver's requests rather than merely bypassed, and why that
>    trade-off is acceptable.
>  - Both points raised in review of v1:
>    https://lore.kernel.org/netdev/20260807024125.434055-1-sochnev.v.74@gmail.com/

Reviewed-by: Simon Horman <horms@kernel.org>



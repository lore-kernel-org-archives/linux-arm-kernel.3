Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36182CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 14:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pb/ni9yGHnr9WxRdlwyNVusDKwS3wvu2r4D0LWS3qt4=; b=IS6cLPAdbbqB6/mNzjnAFIacXO
	LVxsNmTHYselDTFIeex3hna/3wX67SRmdxavbhzNKCIuUiHD0zJMsN/O+gYt1v1po0H9VSdPDb5xz
	N8Vb0aa/BAS+0EXQW12EBvfBpQSYuvzkuHj6TmlH5bVFGwtfdjyRcJUXUhs6TZOWFLgdIYw197iTT
	yVdaIl7fqoxJc1nV5DtF/YVhIUxt2uyyLdvVimHoPT7wKdv1DN32Adhh9hhIDIGORWqkWkR1/Ocok
	JzjB2Ya+zAAq+lGPjIlRoa2U4DmjROER9hRd5X5qokxRbDURivz3Mn+wdDrnOkWrQWX4E4k0ZkgRc
	OI1oweIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESnY-00000002dNv-48U7;
	Wed, 07 Oct 2026 14:39:13 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESnU-00000002dNA-42xz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 14:39:11 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3a98f260f85so21839091fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 07:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791383946; cv=none;
        d=google.com; s=arc-20260327;
        b=pEO6v0O6R0i3uC0Ud+uttHklDX1bidPm4pFM/CJ1XMft7InZ6B4TzpY6opfd9jEYnJ
         oeR0ckJDnsK10jO30wd/cr2kt1qb0UIAugcoV3j0BEXfRPzk9CtqwmsGhMC+evoKPaTo
         7e58V8MQZKilVspyde9AWWX9IqAfnE+GBxaAkQuyaFIU5CUUK3odmDkb8UuvqqgS173r
         1FT2mV14kBvLfEEsMYlsNY7UrMJKjtpdAudx7k4BCIYnKg4Ap8einDr+E0OcagSjiB6/
         qoIxq8UxAQs0qDbp97vYlDpkFouPiF7MmUAdXi/VRVZX6Yp+wvhDJ29FUh2PIcgeMJkj
         osnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Pb/ni9yGHnr9WxRdlwyNVusDKwS3wvu2r4D0LWS3qt4=;
        fh=uTj0SGPad6KnHcvRz0CQ24IMxKGW5CZId0F8POzRiLg=;
        b=jybVkKinqAWryAybtsexquh1Dq6a2moVOUvQftYsd1xX2sI1Tce4sTgPZdhv5fxpd9
         TIFaAQPFnRw/6VBEmvtjNLdc/1HtxwwlnoIkN9PBierH1KuMqy82gbsfWIyaMsH3n1fh
         goRQZnQnYZR0XL01IGs+2FVvAbDZUFOlhhoYj8ZoJM/uIGloV+RyykD7YCZon9KgvKpj
         lCLazPTRulSobY15d2HZWDSMder1oLIiG70xQ2NkIseYRc48zjlNLYiWwL2lljzjARlL
         2HmyYJV3ajnCEZhVzo1eoz0S1nUGOUqqRGQOB7jyrD34w1EAczCNN86jKPVnSUkPfaT2
         +vuQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1791383946; x=1791988746; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pb/ni9yGHnr9WxRdlwyNVusDKwS3wvu2r4D0LWS3qt4=;
        b=n7GB0vvML7zTSRQqJ/vK0Yv+Br4Yn4NyVi160ZkxiHSjY/tpe2e6I95fzGwWT7JI7w
         55Qc9TTEFvUxpDm4quwU+1cs+IhMBjB+rhmoGD+ODh5BHIibkZSmjCIlVQsa79LVVwvz
         z4mYYln5Fb5xJgDJ1OwSj17gg1C7qk/hWa1RPOHL7I9LNReoCj2YJ/3ZvvH0Z8pswJpe
         ZXRKtPoMej5YP6Y1ojvNYQP42i9KCYi/Rw4ve5x3ok5onImgQxYYTEwgRf4BMFGTgRzi
         aqmkL7Nfj/rBk/zVFTPUg06mdM4XXNRdZ397JYWVvRmoI/Fc2oz397LlDp1XgUgT1jUf
         052Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383946; x=1791988746;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pb/ni9yGHnr9WxRdlwyNVusDKwS3wvu2r4D0LWS3qt4=;
        b=LkO3vManUZQO46eVW/3D1GNLUtXuMznjSKslodaIGAcFuD7EEiYEmsJSWg8yUOpq+R
         l5ypxnpgDK5KeTjDhmMUTKsV6ETuQ+BczBo8J3b7sDPLDX4cF/jXwfTbAdGDx1JYwCzI
         /SfLGdqYOwv31KfFb8HFZJpLjxmlbeZzFVlLynqrIsNDGE90pK90gwnPshbudhc681iF
         lG9Q4V9XY5jPeNQjQu8lRvhmqfu/3Asrj+7Dc7B6rG6dSXGM7K3ILkk3ac8VTN5U2bIG
         1DZZ5EEiaj6TGi+E2efb4gfH65sjbU42hR36Y5imukbe0hRFyj8CDf3E3sRVqcrP1QeO
         OdhA==
X-Forwarded-Encrypted: i=1; AKwUvBzl/1JoOaJsLDxUiRbe5I3pGLNmHDVTy5ctG1Rq4tEnXeEt2gmg5UARHMFn6IKed2+7Q/oj++bOFgiahchXsyu5@lists.infradead.org
X-Gm-Message-State: AFq9FYI+yFtZdKuIussn6Le9W9bO0LjRtSJKiFWGAWk4vt6sFVNkeDGc
	LzeTfW2UXQZiyu4ZUH774lGYpMcYVWO6lvY/lNQbyB5TOF9MR53qaFo62bl8GkwWpA9VkRJ8LWD
	gZ2bxYSAJP04RaqX/gMXuSoC5mhk/sQ2vPLbL7qM5ZQ==
X-Gm-Gg: AYBFou3E0U7ilulcLueyWAhu+c6J6LcHfxNOq/StN7xjrzowCGI0wL/qH99HqzKIDvM
	4dpd7WNFBvDkNENGsjdFJ0rVo8zBj963ay8Q1/bSsfRdRs9kWYy77ZRMAvrucezsz0vPkhi+JKP
	duu84QqdqNPTeIJ04fZ/iwzKMqBwIpY+VDFnyX7z1LwSbEV6ALxkREzN+lW3fkPj+6e6xGj030I
	WbCJqvF3TlsWH8FzFbDhBJ8nY2T+NxosIp3OMbc0y4obixOYej5Iti6d3qyDtTJ6UA/0NqQn5QF
	dNJxMGEgYq4CTRcWOpVn1ORGskjL0EvbQawcDvqoEmxat2uI50m/vhHSO2xAeRWsVBHAa5wwv7t
	ai8ZgWRSj
X-Received: by 2002:a05:651c:b08:b0:3a7:72ec:81a3 with SMTP id
 38308e7fff4ca-3a9a2c34ecdmr6211391fa.8.1791383945851; Wed, 07 Oct 2026
 07:39:05 -0700 (PDT)
MIME-Version: 1.0
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Wed, 7 Oct 2026 16:38:53 +0200
X-Gm-Features: AclHuK9LjOZDikj3APsjlF2mTduppp_g_q38pi3ZhWs0i5yvsBiQNsj3lRGM9E8
Message-ID: <CAFERDQ3gUav1E7sw7FxsPmmt9GW=tP_Jh=7ufABs9CSaMYK6kQ@mail.gmail.com>
Subject: [RFC] bcm2837 RPi 3B: sdhci-iproc Wi-Fi probe fails without sdhost
 (GPIO48-53 left in alt3 by firmware)
To: florian.fainelli@broadcom.com, robh@kernel.org
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_073909_312899_1C5EF3DB 
X-CRM114-Status: GOOD (  21.30  )
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

Hello,
When building a minimal kernel for the Raspberry Pi 3B which doesn't need
sdcard access at all (root filesystem fully lives in RAM), I noticed that the
Wi-Fi doesn't work (kernel 7.2.6 with bcm2837-rpi-3-b.dts).

With:
> CONFIG_MMC_SDHCI_IPROC=y
> CONFIG_MMC_BCM2835=n
Wi-Fi doesn't work with following messages:

> sdhci-iproc 3f300000.mmc: allocated mmc-pwrseq
> mmc0: SDHCI controller on 3f300000.mmc [3f300000.mmc] using PIO
> mmc0: Failed to initialize a non-removable card

With:
> CONFIG_MMC_SDHCI_IPROC=y
> CONFIG_MMC_BCM2835=y
Wi-Fi works:

> sdhci-iproc 3f300000.mmc: allocated mmc-pwrseq
> mmc1: SDHCI controller on 3f300000.mmc [3f300000.mmc] using PIO
> sdhost-bcm2835 3f202000.mmc: loaded - DMA enabled (>1)
> mmc1: new high speed SDIO card at address 0001
> brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43430-sdio for chip BCM43430/1
> mmc0: host does not support reading read-only switch, assuming write-enable
> mmc0: new high speed SDXC card at address d555
> brcmfmac: brcmf_c_process_txcap_blob: no txcap_blob available (err=-2)
> brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM43430/1 wl0: Mar 30 2021 01:12:21 version 7.45.98.118 (7d96287 CY) FWID 01-32059766

So, just adding CONFIG_MMC_BCM2835 makes Wi-Fi start working.
In my understanding, CONFIG_MMC_BCM2835 should not be needed to use the Wi-Fi.

After analysis, I noticed that the Raspberry Pi firmware leaves GPIO48-53 pins
in the alt3 state when Linux takes over (sdcard pins routed to sdhci-iproc).
When CONFIG_MMC_BCM2835 is not compiled in, the states of those GPIOs won't be
changed by Linux. And we end up with the sdhci-iproc controller electrically
bound to the Wi-Fi chip and the sdcard at the same time, resulting in a probe
error for the Wi-Fi chip.

Here are the states of GPFSEL3 GPFSEL4 and GPFSEL5 tested with devmem:

Register  Address     GPIOs    MMC_BCM2835=y  MMC_BCM2835=n
--------  ----------  -------  -------------  -------------
GPFSEL3   0x3f20000c  30-39    0x3FFFF000     0x3FFFF000
GPFSEL4   0x3f200010  40-49    0x24200924     0x3F200924
GPFSEL5   0x3f200014  50-59    0x00000924     0x00000FFF

3 bits per pin: 4 = ALT0 (sdhost), 7 = ALT3 (sdhci-iproc)

In the MMC_BCM2835=n case, we can see that GPIOs 48-53 are left on alt3.

I would like to be able to compile Linux with CONFIG_MMC_SDHCI_IPROC and
without CONFIG_MMC_BCM2835.
What is the best approach here? Is the kernel expected to rely on the GPIO
state left by the firmware? Or should it configure these pins itself?

I tried to have both sdhost and sdhci-iproc claim GPIO48-53 in the same state
to avoid the double routing, but it's not possible because pins can only be
claimed by 1 owner:
> pinctrl-bcm2835 3f200000.gpio: pin gpio48 already requested by 3f202000.mmc; cannot claim for 3f300000.mmc
> pinctrl-bcm2835 3f200000.gpio: error -22: pin-48 (3f300000.mmc)
> pinctrl-bcm2835 3f200000.gpio: error -22: could not request pin 48 (gpio48) from group gpio48 on device pinctrl-bcm2835
> sdhci-iproc 3f300000.mmc: error -22: Error applying setting, reverse things back

1) A solution could be to let the gpio-controller itself own those pins. I can
propose a patch removing:
> pinctrl-names = "default";
> pinctrl-0 = <&sdhost_gpio48>;

from the node &sdhost in the top level DTSes and make the gpio-controller
itself change those pin states, so that no matter which SD controllers are
compiled in, it will work.
I tested this on a 3B in all four combinations (sdhost and sdhci-iproc each
enabled or not), and it works. It adds one message to the dmesg:
> /soc/gpio@7e200000: Fixed dependency cycle(s) with /soc/gpio@7e200000/sdhost-gpio48

2) Or, if we can't support RPi kernels with CONFIG_MMC_SDHCI_IPROC=y and
CONFIG_MMC_BCM2835=n, we could perhaps add a Kconfig restriction selecting
CONFIG_MMC_BCM2835 automatically if that's really required.

3) Another solution could be to ask for a firmware change, so that the states
are cleaned before booting.

What do you think of those proposals?
Martin


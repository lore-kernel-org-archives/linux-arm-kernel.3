Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDADBC44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 18:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcNBWSk81aXJRf1HEe9CIzvLtrqcVP1uAiQM4+26Yvg=; b=q1WfqJqr08QP5gNtakTfGUbrxe
	mQSFeLdcV61CjtmykSzP/PWNfPTW1wYvCeS9GDukGuefTc/FdlsX7ZZVCoMo1cY5sqUGdG8ZHLkZW
	XNL5310Yu/LcSdM9n+1BXfiCtv0ZSLEzNcLy4rSW5LDds41fRNpte+sznqZHi4JPgmUlnY33R48mY
	7TF8g48ij36bQL+Z1i1WW1EutTHd9LOhdEud5+lvFWgvXSuzdkJbt3NyhOfRoKMPzs3mNP5+vxT/D
	MqmFxoBI+jbXaqu31bON+nVuJ88i5pzDTCA6JhRgrAbK+e2JyVTTCD8c82WUULihjp8b7INeGtBeY
	rWGec6yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiFs-0000000CwIK-36Wr;
	Tue, 14 Jul 2026 18:53:20 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiFi-0000000CwFI-2YPP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 18:53:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so8935675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 11:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784055189; x=1784659989; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pcNBWSk81aXJRf1HEe9CIzvLtrqcVP1uAiQM4+26Yvg=;
        b=PmvzhsFjL52oKPJy3QpedgwzAzAzjrmGL/vEtFuiwe6UGE5LmT/YNo6yvWruL3LZOS
         4gtGRIxn07ioecBakJMgWt0CrNeG0WtsI4NN8cB2lcT6gdgnlkIfc6XF0TcLZ+b0hOT0
         DStoNy4cob2OH5H5RXKc0T8WYCOjbjsXxHX/zLfdV1cRcf4R66l5frq44V7p6cdR/rXD
         npZmyNtxhYTIOXnlIznyEiGeOuiuvu4OiN94e3pfm3nr4jV0Wcu7IyAA+qeqJdM9Glyr
         B4T3suUowZ1J86mIO/zLFytbYGsuQBeBPz2E+ndZx0PUN7WB9flctEKZkwQ0bPR6RsLP
         KEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055189; x=1784659989;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcNBWSk81aXJRf1HEe9CIzvLtrqcVP1uAiQM4+26Yvg=;
        b=ntqqKPNXcinrnTXklcKoy+AG+8/5LLdRS7x8zWinCxiFoJCuqQOd9c6bn7YjeaYwCa
         JlX+8Sj3UEOTQNqeRNDTEUjW07x/tZGnjLH75rTPTZa6Y8cMrIBMlLF8SWBwCNkH/CjR
         WRGtKh7urPwa/AjRypmUKvV+nk2Yb55aQCavY2gByCZM6ZadtIVq9DaoZxfrWoOGp53+
         R/Mq9mhCPim2NkWxXJrcsSqdZ/B0Ufh6aHTAyw+Vkfi/1ghQzTTIa4ASoDKqLCdW1SWP
         zkWsnHH7AWTeuydDXfBRWCjGme+/bEoSP/ifM8WTl/uax6RXPeUXF43f5NHPwm5aND3e
         OyoA==
X-Forwarded-Encrypted: i=1; AHgh+RpsjXapmvoRfA2ueZYQnE7Hri+NTFPi+/cSGGJjz5FTD8csIWkMw3g4O3wjQ2CdmVylYJ0wvmJh7Yz2Y3zLZEYH@lists.infradead.org
X-Gm-Message-State: AOJu0YwPv5U60AY3zOIQ/LLyAb7CEIhlvt515f9L+EB6d8cnrbRK83P7
	2zPBGoKWSxZjaYeM+l2kBvL6gJicj1n0aannmqP+cqdq0i4pPMExM/POvCCDTyxe3uc=
X-Gm-Gg: AfdE7ckn0fdYROV5uAVcLrf7gmwwjkE72io5iMCi85QbUR8gO9JLPX4NKHDxUszDrKq
	7tuMdQvN6QSO+FB/Co/EjAVaDO1D2zf3KzLYRwoDGZPal7jTOB+KtbquY3GUQejQlzJWnD1AJfw
	m31FD9wRpbnbDjqMx2T220aEsIcwabIM6tFhGva0sGRIWZs2OmZWsaQuQobF+dr9YQUFbf+DQ3V
	DWHZhbsMznZ3TmRHwmMWoMTK7qWyegmWRHAq9A3KUOZDRSRk40g3CyrsPpgK/nTMa/b/8jv/o8Y
	Ips6m5+ZLOrYy2vSbIMbaFxJsOWH2Rh5RokxYU8Vb6TqabE3CW/7ee0ePLr+vpquq2mYrnFYjfV
	epQ1d05PZFAya1ynZPUsj93f0RF7qd5Q37PtBEzM3MZq5Pj5LxP6NhclWSzaLfkLVSUTb6g5fMy
	xeBOKPIJECNEljFieNx9A+CvhG96fhxFSYX+ut/z1G
X-Received: by 2002:a05:600c:6749:b0:493:edde:54c8 with SMTP id 5b1f17b1804b1-493f8885b92mr156957465e9.8.1784055188747;
        Tue, 14 Jul 2026 11:53:08 -0700 (PDT)
Received: from [192.168.254.124] ([2001:9e8:2fb:8201:c26a:83ef:161a:409b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49508725c0bsm94908715e9.2.2026.07.14.11.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:53:08 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 5/7] soc: aspeed: add host-side PCIe BMC device
 driver
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <51e455417bdcfe608270c6cb2806b1fd971fb998.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <51e455417bdcfe608270c6cb2806b1fd971fb998.1783524645.git.gregoire.layet@9elements.com>
Date: Tue, 14 Jul 2026 20:53:03 +0200
Message-Id: <178405518338.194693.10884980497331757324.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784055186; l=3719;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=Y9FJBI04v0b5TlI5275Tjuzdsyze3l17kCBKDrC4yME=;
 b=jjkhqaKHO+0KwEYLlPkLAmN+G/4gp2YBj1bgs+ajAChgEUNu9rY2W3prwusboACuGjyMx6z22
 H/kuiBmepnRCk9sHRrP1SCBIKVLrvkpvhwkwVi4bUWnB5HrF/Z7N5kF
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_115310_676182_47E6C0AF 
X-CRM114-Status: GOOD (  31.92  )
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

> Add support for VUART over PCIe between BMC and host.
> Add the host side driver.
> Support only the AST2600.
> 
> Taken from ASPEED 6.18 Kernel SDK and trimmed down.


> 
> The host can't detect the VUART addresses, so force them to
> 0x3f8 and 0x2f8, as in the initial ASPEED driver.
> 
> Change the MSI vector index of VUART2 from 15 to 17.
> The index 15 used in the initial driver was not working.
> 
> Data path in both direction is tested on both VUART.
> 
> This module is added in soc/aspeed as it's very soc specific.
> This is not added as a PCI 8250 UART device as this host module can
> be expanded upon for IPMI over KCS. It can also be used in the
> future for custom BMC<->host communication with shared memory and doorbell.

While I understand that this driver could be expanded with more features, it is
still not fitting `soc/aspeed` as it is not for the ASPEED SoC, but for systems
that communicate with an ASPEED SoC.

Maybe `drivers/misc` is more fitting for this?

> 
> This host module should be the entry point for setting up all features
> related to an AST2600 present on the PCI bus.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
> Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
>
> diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
> index f579ee0b5afa..147a9033bdc4 100644
> --- a/drivers/soc/aspeed/Kconfig
> +++ b/drivers/soc/aspeed/Kconfig
> @@ -55,3 +55,18 @@ config ASPEED_SOCINFO
>  endmenu
>  
>  endif
> +
> +menu "ASPEED host-side drivers"
> +	depends on PCI
> +
> +config ASPEED_HOST_BMC_DEV
> +	tristate "ASPEED host-side BMC PCIe device"

"device driver" would be more fitting instead of "host-side driver" I'd say.

> +	depends on SERIAL_8250
> +	help
> +	  Host-side driver for the ASPEED AST2600 BMC PCIe device found on
> +	  BMC expansion cards. Exposes two 8250-compatible VUART
> +	  ports.

In the commit message you're stating that the device driver can be expanded for
e.g. IPMI over KCS. Should the user be able to disable features selectively, or
do they have to always have 8250 serial support active?

> +
> +	  If unsure, say N. Choose M to build aspeed-host-bmc-dev.
> +
> +endmenu
> diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
> index b35d74592964..c515e163eab7 100644
> --- a/drivers/soc/aspeed/Makefile
> +++ b/drivers/soc/aspeed/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_ASPEED_HOST_BMC_DEV)	+= aspeed-host-bmc-dev.o
>  obj-$(CONFIG_ASPEED_LPC_CTRL)		+= aspeed-lpc-ctrl.o
>  obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
>  obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
> diff --git a/drivers/soc/aspeed/aspeed-host-bmc-dev.c b/drivers/soc/aspeed/aspeed-host-bmc-dev.c
> new file mode 100644
> index 000000000000..e586d0505577
> --- /dev/null
> +++ b/drivers/soc/aspeed/aspeed-host-bmc-dev.c

*snip*

> +static int aspeed_pci_host_setup(struct pci_dev *pdev)
> +{
> +	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
> +	int rc = 0;
> +
> +	pci_bmc_dev->message_bar_base = pci_resource_start(pdev, 1);
> +
> +	if (pdev->revision == 0x27) {
> +		pr_err("AST2700 detected but not supported");
> +		return -ENODEV;
> +	}
> +
> +	rc = aspeed_pci_bmc_device_setup_vuart(pdev, 0);
> +	if (rc)
> +		return rc;
> +
> +	rc = aspeed_pci_bmc_device_setup_vuart(pdev, 1);
> +	if (rc)
> +		goto out_free_VUART0;

This goto seems unnecessary. There's no specific cleanup that should be needed
before.

	Tan

-- 
Tan Siewert <tan.siewert@9elements.com>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470BDCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 11:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApyuhKtQNl/ApFXQyFUOgocGZQ0TaSgguqdnnq65VcE=; b=2pNfMvgHl/nqVYsqcCzUdFGnhX
	mwd/cv9+oCI5Nq3yqNiZQejjO2c/qmejyZ/GdGdnRapo0B2Q+B4i7GXN+0JsjKvXtWo9WhOeeqV3V
	DKCXkAbRekIUTtBSBCGqqb8vvg4CxUdCN6R8Q7G9k9n3f/VybUWM84A6Vd5JnjtgETPTp+a1GbigK
	jjO1ueV5S1FRqZa5tlaqv0wFeXMLWGhKu+K2ZHMcxXisunv2jzmVcR3ZTNQuZkCMf2chCnHCDyW63
	EBAGZjSyXsiiA2q7P4uLpOlQLqesq7wneulCk3Ju5bcvgc6vwPGRgs4Tg58DD6cg1WChfPtEpQ9aR
	kmSzL09Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v6C-00000007PBh-1DFz;
	Wed, 01 Oct 2025 11:34:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v67-00000007P6f-2Ifn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 11:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759318453;
	bh=zpQrOFOPqVvlT4pJe9ZkIkPzqGLH6HsuGaHlEdclWno=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LMj71SZeBdZ34iSi+ZXBuNlrQ7SV3mbQj6v24yHTVMXg6xuBwc56hRMznrndh0cE8
	 JahUnrkXOGPjKeT5A7X/+KCKo9ZE+MBw7DRmkTkEeHsVhP0UZOKrhYOUQhHMaVXPkt
	 +k8ZnOzQxGtCQP5QDQzeZ3yL4xEevcyZpGxw42MYj+b3LqjViHxJtYxO2eHSOgGaaD
	 cW6QBcgHIanwIvxa9kk2+MsBCq79rZ8sGX87S0+xtVNSkCAhlZTpp+Du7WLc+dZgtW
	 2BGhzCfl0qQiOLeOyH5dbnXh3ltac39PKh2hIlZqrOUeNE7vse0bVkwHFGXaH/HvVn
	 RWwpzfY4Jy7pg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4A0F517E120D;
	Wed,  1 Oct 2025 13:34:13 +0200 (CEST)
Message-ID: <55975f94-3655-480c-be9e-ac4075c60a7d@collabora.com>
Date: Wed, 1 Oct 2025 13:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 03/13] spi: airoha: add support of dual/quad
 wires spi modes to exec_op() handler
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
 Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
References: <20250930022658.1485767-1-mikhail.kshevetskiy@iopsys.eu>
 <20250930022658.1485767-4-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250930022658.1485767-4-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_043415_774853_E577345F 
X-CRM114-Status: GOOD (  15.11  )
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

Il 30/09/25 04:26, Mikhail Kshevetskiy ha scritto:
> Booting without this patch and disabled dirmap support results in
> 
> [    2.980719] spi-nand spi0.0: Micron SPI NAND was found.
> [    2.986040] spi-nand spi0.0: 256 MiB, block size: 128 KiB, page size: 2048, OOB size: 128
> [    2.994709] 2 fixed-partitions partitions found on MTD device spi0.0
> [    3.001075] Creating 2 MTD partitions on "spi0.0":
> [    3.005862] 0x000000000000-0x000000020000 : "bl2"
> [    3.011272] 0x000000020000-0x000010000000 : "ubi"
> ...
> [    6.195594] ubi0: attaching mtd1
> [   13.338398] ubi0: scanning is finished
> [   13.342188] ubi0 error: ubi_read_volume_table: the layout volume was not found
> [   13.349784] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd1, error -22
> [   13.356897] UBI error: cannot attach mtd1
> 
> If dirmap is disabled or not supported in the spi driver, the dirmap requests
> will be executed via exec_op() handler. Thus, if the hardware supports
> dual/quad spi modes, then corresponding requests will be sent to exec_op()
> handler. Current driver does not support such requests, so error is arrised.
> As result the flash can't be read/write.
> 
> This patch adds support of dual and quad wires spi modes to exec_op() handler.
> 
> Fixes: a403997c12019 ("spi: airoha: add SPI-NAND Flash controller driver")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



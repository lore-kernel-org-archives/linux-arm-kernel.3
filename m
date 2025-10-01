Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5226CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 11:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2ipqHbIRc6bqIFqef7bpe9qb3R0rArz6DDvyWbgNXs=; b=xGlh3fvnoM62RVkZNYu4M+EWg6
	P1c9n/r8EDPp8c1TKoRA7PvdV4ieU5BTnLGuyzqxi6dhbAGjzo2D1UrdqH6O5pIX2pzP8DcdmaELi
	ndwHyJnqI9dLSu8/v81n4gjcoyHGi5aHji8Vs+3N4gWFbebOk4/DqyMElvGHOoLEthAINFopKdy/8
	XA8bIOQCx+LkA9NjaGbSWKIlcCbhRpIfWc47tKs2KAlgHwH3soeQk/DMlEAQTFoM5vgFZrBfS2SFW
	YCIvCnYSG6qAMoO9zE3kJipNeML7Mmahev2pSXXJGavfrEw2IihDouHf3xDuMTASgShvp+EI8/lL+
	X/04V0Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v68-00000007P9O-49zi;
	Wed, 01 Oct 2025 11:34:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v66-00000007P5W-0p94
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 11:34:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759318452;
	bh=OkY4fp2SjExYLRU7K7uU8FjXdXwmHdXuDmYve9vU6oU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VEshQX2RcjwMihb2A+mAF7Fr9wHa0k1sCHoINarkLYQuJMpB/vIoZA9VVzVWlKdy1
	 6RlXnI/KeF1sq33ekor4dky8MqnmeC/ZNLXQD+sgdfU7j+5ETIgNika9V6qJtb2hK9
	 fCjxfJdb+8+9P+eWAA0S4PcUfmp5palkZABWJCC3B1ySBFQz6AGtegi8sgVTr/HlER
	 LgZGGlDJWE/cjJMCh46rVWD4ozI2ZFu0z2Qj0ec60t+v9EUX+3pCdye6sigJA79Qu5
	 QRa7wvpp83XDdyOL/OgoNCvPFugtdPnSXlGf4TUZ4RFVWbJI/Pfc7S1yCSlPewoZps
	 Qv9uxb4Lmvg5A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D80FB17E13D3;
	Wed,  1 Oct 2025 13:34:11 +0200 (CEST)
Message-ID: <f5e10c75-9263-416d-a3de-32af4bb7c2dc@collabora.com>
Date: Wed, 1 Oct 2025 13:34:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 06/13] spi: airoha: fix reading/writing of
 flashes with more than one plane per lun
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
 Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
References: <20250930022658.1485767-1-mikhail.kshevetskiy@iopsys.eu>
 <20250930022658.1485767-7-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250930022658.1485767-7-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_043414_416792_A39F9238 
X-CRM114-Status: GOOD (  16.94  )
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
> Attaching UBI on the flash with more than one plane per lun will lead to
> the following error:
> 
> [    2.980989] spi-nand spi0.0: Micron SPI NAND was found.
> [    2.986309] spi-nand spi0.0: 256 MiB, block size: 128 KiB, page size: 2048, OOB size: 128
> [    2.994978] 2 fixed-partitions partitions found on MTD device spi0.0
> [    3.001350] Creating 2 MTD partitions on "spi0.0":
> [    3.006159] 0x000000000000-0x000000020000 : "bl2"
> [    3.011663] 0x000000020000-0x000010000000 : "ubi"
> ...
> [    6.391748] ubi0: attaching mtd1
> [    6.412545] ubi0 error: ubi_attach: PEB 0 contains corrupted VID header, and the data does not contain all 0xFF
> [    6.422677] ubi0 error: ubi_attach: this may be a non-UBI PEB or a severe VID header corruption which requires manual inspection
> [    6.434249] Volume identifier header dump:
> [    6.438349]     magic     55424923
> [    6.441482]     version   1
> [    6.444007]     vol_type  0
> [    6.446539]     copy_flag 0
> [    6.449068]     compat    0
> [    6.451594]     vol_id    0
> [    6.454120]     lnum      1
> [    6.456651]     data_size 4096
> [    6.459442]     used_ebs  1061644134
> [    6.462748]     data_pad  0
> [    6.465274]     sqnum     0
> [    6.467805]     hdr_crc   61169820
> [    6.470943] Volume identifier header hexdump:
> [    6.475308] hexdump of PEB 0 offset 4096, length 126976
> [    6.507391] ubi0 warning: ubi_attach: valid VID header but corrupted EC header at PEB 4
> [    6.515415] ubi0 error: ubi_compare_lebs: unsupported on-flash UBI format
> [    6.522222] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd1, error -22
> [    6.529294] UBI error: cannot attach mtd1
> 
> Non dirmap reading works good. Looking to spi_mem_no_dirmap_read() code we'll see:
> 
> 	static ssize_t spi_mem_no_dirmap_read(struct spi_mem_dirmap_desc *desc,
> 					      u64 offs, size_t len, void *buf)
> 	{
> 		struct spi_mem_op op = desc->info.op_tmpl;
> 		int ret;
> 
> // --- see here ---
> 		op.addr.val = desc->info.offset + offs;
> //-----------------
> 		op.data.buf.in = buf;
> 		op.data.nbytes = len;
> 		ret = spi_mem_adjust_op_size(desc->mem, &op);
> 		if (ret)
> 		return ret;
> 
> 		ret = spi_mem_exec_op(desc->mem, &op);
> 		if (ret)
> 			return ret;
> 
> 		return op.data.nbytes;
> 	}
> 
> The similar happens for spi_mem_no_dirmap_write(). Thus the address
> passed to the flash should take in the account the value of
> desc->info.offset.
> 
> This patch fix dirmap reading/writing of flashes with more than one
> plane per lun.
> 
> Fixes: a403997c12019 ("spi: airoha: add SPI-NAND Flash controller driver")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




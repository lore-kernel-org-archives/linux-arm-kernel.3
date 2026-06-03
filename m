Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5144FCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RASJEjVAR9afFVw3X7mPRvBm05E0D//IY850D9FxOG0=; b=mASf4KMCQyU+Hpj+cYVmsMGKl1
	vrbQDUJzF2Ud00OpUy0teFKycxO+Ep2BRYiU2v6yX2G6pT/gBwYeATBMqwjcA7Nob0tBQzXPdjZmL
	5VJCBQ//Ui6L8sEstynOiUgRHLPm6u+HHVTxybF/EiZ00shZLj3QuL3vm5m2CXvbMNhpU0hDAEhjq
	pJyKeVICNOku9DcI7MFZCx57J1gPxeU8lePXegmPy8mOOJcOdSGkeuGHy3pagK0/8ANHgNgIURlVm
	UuE7d3NpO/nWC5AeAx6pI/zdNkXOIe8NW8MNqjUaIbmPQtiF1i5gmQZLK6VZOx4bQJjfqOyhjwU7w
	L9lczCeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjNb-0000000Es7m-112j;
	Wed, 03 Jun 2026 11:03:23 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjNY-0000000Es6o-45DN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:03:22 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso34655655ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 04:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780484600; x=1781089400; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RASJEjVAR9afFVw3X7mPRvBm05E0D//IY850D9FxOG0=;
        b=EbZQmQatfnTVHxJNNO8FC9dqgTAJAFzNEHaSov04YJo4t/hD9ddzXYajmBnGBj/6s6
         2k10l0WMHqJiB7fL5rCZoA/sXzyrdh/tPoDFlMgA+JmD5bzt49gnAqV9j/G2rk20yNPg
         v+iFk41IsIHkiwbz6E0d4bCzd7wqUs5Ga/advqxDYg+VgzYHXbqGqLHYKFtKAyZQ3Y75
         57swkUfGc51rPQbwXSXuLLYGzPagJhZBWg9SkRtoQQqPktZTbm0r3xOe4WBcBieV9mcp
         z+2FTBGI0cxYCCZ9CAvAk9Qe8y9NoC1YFylDtEWQGnbJf1rrubKmtQ6koMK6CGMhyvjp
         sxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780484600; x=1781089400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RASJEjVAR9afFVw3X7mPRvBm05E0D//IY850D9FxOG0=;
        b=iD3GUwevdksIp7nx2mhol9KgQXOHa0w0dekcSjhUJs81Hnw/KwT/s4VfwxK1D2NNVT
         ehdJNmvSRDNZv9aG2oH+ViPWm9bmctAXHsS7NCwmq/Vtn5HDNT0rQVyKKRw+sc0qH5/3
         6xsjMKHEcpDSCh7nQjJsslEiblfCEcce9eTp1UuTK5Ed6eJxfZ1HAYXf+QgkvvFGqwtY
         A65S2wNJ63noctPhpClRaVfEDoiOrHPKj7piKdlYfbHp1FIzH+bP9jx5RlirtYE6SNnX
         2T3VWBb+aoprf4qWxKanRNHY7f27I5nSdL4LsWiBZgzCaLhKYEkM+yohRuNpBtAx1CKt
         INjw==
X-Forwarded-Encrypted: i=1; AFNElJ/KH0tozmDLrjQ4+Xu4q4dSp9WreZlA38GE4CVVvKNNXzRE+kAUDw1cPVh4NmkKNOQLGsoYew1nm4F27KM5QVa0@lists.infradead.org
X-Gm-Message-State: AOJu0YwtPnvwroZSx/ppREVjsLzCqCj8bPnZaKwBTOHBE4tlupT5CLsU
	3eoM0FZ1JQdaqHJSZe2juWqKfF/7u91y51i5rTLGnwSZQp6Gef+sVpCx
X-Gm-Gg: Acq92OGuXODYTwEkKASLBZZDG4UQEuQp4CRrh26RylrkMgbWsQzOkjxu6CF7X9R/0kj
	dUPEbLKJx2I/jxqwesXCqkEooHyaca2diig+zv78o2/X1NHKO8RNup6gpCY6xstrVAlDt31B9mx
	+LsLS+4hf3vbWBh9K0XEn6lmNO1GtpSuwputQje/QdDbkv0LYsXi/N3Z5ghNbHmFjGdXFk5reqO
	Ev4qPEmJ/+FWSYFMlldQC2agL2rVGazIhiq+D0+l/tsQLNMOX0OhOcmXgzbzsMF+vv8Uici0TXz
	0ojkM1nGmuCqna+GqMYJpzP5SXaHli4ZbNsIQOeydf3sXtq6owc/A98n4FaNtO6rfBJngiuvRlA
	wSo5w/kd6lkpc8kfWdZX3pDFbunZ224b6QEcFjKqDM6pyQUkNfpmEDB3v5YtQC90y186zFxNNSA
	/BJ+ACPtlcsS8XvMltpJHQwpzXZSnXtvHpJwYdRZ+7q0lR1+NMod7/xviglqjCY8mcXPuAr/gFI
	pCKE+9JCoRmcQ==
X-Received: by 2002:a17:903:1252:b0:2c0:e5ee:f554 with SMTP id d9443c01a7336-2c163a24976mr28261115ad.8.1780484600180;
        Wed, 03 Jun 2026 04:03:20 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e1b6sm21738805ad.38.2026.06.03.04.03.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 04:03:19 -0700 (PDT)
Message-ID: <5d6ecdf7-1987-4ecf-ad59-06595742cc8f@gmail.com>
Date: Wed, 3 Jun 2026 19:03:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: Add Nuvoton MA35D1 QSPI controller support
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260603043551.1062112-1-cwweng.linux@gmail.com>
 <20260603043551.1062112-3-cwweng.linux@gmail.com>
 <d32634eb-4eed-46e6-b378-d42df0b1c75e@sirena.org.uk>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <d32634eb-4eed-46e6-b378-d42df0b1c75e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_040321_018816_65E996F8 
X-CRM114-Status: GOOD (  18.89  )
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

Hi Mark,

Thanks for the review.

I will address these in v2:
- add "depends on ARCH_MA35 || COMPILE_TEST" to the Kconfig entry;
- convert the file header to // comments;
- split the low-level CS register update from the SPI core .set_cs()
   callback, and make the spi-mem direct CS path handle SPI_CS_HIGH
   explicitly;
- use op->max_freq for spi-mem operations instead of spi->max_speed_hz.

I will also fix the subject lines in the next version.

Best regards,
Chi-Wen Weng

Mark Brown 於 2026/6/3 下午 05:30 寫道:
> On Wed, Jun 03, 2026 at 12:35:51PM +0800, Chi-Wen Weng wrote:
>
>> +config SPI_MA35D1_QSPI
>> +	tristate "Nuvoton MA35D1 QSPI Controller"
>> +	help
>> +	  This driver provides support for Nuvoton MA35D1
>> +	  QSPI controller in master mode.
>> +
> Other drivers for this SoC seem to have ARCH_MA35 || COMPILE_TEST?
>
>> @@ -0,0 +1,579 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Nuvoton MA35D1 QSPI controller driver
>> + *
>> + * Copyright (c) 2026 Nuvoton Technology Corp.
>> + * Author: Chi-Wen Weng <cwweng@nuvoton.com>
>> + */
> Please make the entire comment a C++ one so things look more
> intentional.
>
>> +static void nuvoton_qspi_set_cs(struct spi_device *spi, bool enable)
>> +{
>> +	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
>> +	unsigned int cs = spi_get_chipselect(spi, 0);
>> +	u32 mask;
>> +	u32 val;
>> +
>> +	if (cs == 0)
>> +		mask = NUVOTON_QSPI_SSCTL_SS0_MASK;
>> +	else
>> +		mask = NUVOTON_QSPI_SSCTL_SS1_MASK;
>> +
>> +	val = nuvoton_qspi_read(qspi, NUVOTON_QSPI_SSCTL_OFFSET);
>> +
>> +	/* SPI core passes enable=true when CS is asserted (typically active-low) */
>> +	if (enable)
>> +		val |= mask;
>> +	else
>> +		val &= ~mask;
>> +
>> +	nuvoton_qspi_write(qspi, val, NUVOTON_QSPI_SSCTL_OFFSET);
>> +}
> Note that the core deals with SPI_CS_HIGH, the driver doesn't need to...
>
>> +static int nuvoton_qspi_mem_exec_op(struct spi_mem *mem,
>> +				    const struct spi_mem_op *op)
>> +{
>> +	struct spi_device *spi = mem->spi;
>> +	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
>> +	u8 addr[4];
>> +	int ret;
>> +	int i;
>> +
>> +	ret = nuvoton_qspi_setup_transfer(spi, NULL);
>> +	if (ret)
>> +		return ret;
> This uses spi->max_speed_hz but spi_mem configures p->max_freq which you
> should use (it might be lower).
>
>> +
>> +	nuvoton_qspi_set_cs(spi, true);
> ...except where you're calling in directly at which point the driver
> needs to figure this out.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5034BC02193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 08:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVHdPHZta182pa00CYYtJOzM1kMJtrB33zkyMPcHloY=; b=fFElIi34bMfAQY6NicTLWBw2IB
	uneFFxiB97JqOOWZwxSa5jBwFsoxiL6jJbBn460qWw8b0rqBVAxrI7rHJ8vmAUyMCFhigT3ZmMLbV
	bEemCJRgbA1/JR6o5ocE8h3EyRzAywtomiOLfqNHq8D2Ti4w4c6TR/6UFadI7KEOlsEjQrsjcf9VZ
	Lj75NJYWok4rDVGqH1XSU5SHaLOljEZoTa+dg1RNzWUlxBQ9MoZEsjLt3r26q7sXKfk+sZOyjojg1
	zA7fAzznewyu+SIqs2JSjqx1jND8kKuIRKp/L/1KXclnVPXQ2WKmgad1ul0mpzXfj9tE201xUMNQ/
	mWZkX0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQOj-00000008T3d-3MQ2;
	Thu, 30 Jan 2025 08:59:41 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQNP-00000008SqY-2P2w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 08:58:21 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U6Q0Y6018023;
	Thu, 30 Jan 2025 09:58:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	pVHdPHZta182pa00CYYtJOzM1kMJtrB33zkyMPcHloY=; b=Y+DyFbpE7xKRstU1
	GV36Maqi+BgyjILcGzcMzVi3eYPOiU52JGmciFtAO9ktuipMEIkh6Ih5EXixAtFu
	UD5lc9+XvALvTxT9iugUoXpi6hMdBXeNrEze47unC42NZ0lzAtGkSZfvX6o6bunz
	BuuOyYqgnv7agXA2XdNCXdptBrGJJsYZbAp9VGpRLK34fDMDPFKvtvihvQS4/QQT
	nuwTcZ/TFVssjycjXXN5I2izNP1ljKOuVBwB1lVwgyI9yQq6Xgqr4NwFajllkVAv
	80lUrGl98dPDruqQlo+6O6SO3wUR+UdCAQjfsbcZYheQitUTQg1HPLrs3gIva9Wm
	eT/Yaw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44f26x6wca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 09:58:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 675A540044;
	Thu, 30 Jan 2025 09:56:49 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F12E72D5869;
	Thu, 30 Jan 2025 09:55:47 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 30 Jan
 2025 09:55:47 +0100
Message-ID: <4ea55395-e4e2-425e-9711-3c99f30a9fa9@foss.st.com>
Date: Thu, 30 Jan 2025 09:55:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] spi: stm32: Add OSPI driver
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <christophe.kerello@foss.st.com>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
 <20250128081731.2284457-3-patrice.chotard@foss.st.com>
 <ec35dbd3-5730-4cc8-8025-d349740d1ba5@sirena.org.uk>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <ec35dbd3-5730-4cc8-8025-d349740d1ba5@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_05,2025-01-29_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_005819_907824_AC77E608 
X-CRM114-Status: GOOD (  16.64  )
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



On 1/28/25 13:37, Mark Brown wrote:
> On Tue, Jan 28, 2025 at 09:17:24AM +0100, patrice.chotard@foss.st.com wrote:
> 
>> +static int stm32_ospi_tx_poll(struct stm32_ospi *ospi, u8 *buf, u32 len, bool read)
>> +{
> 
>> +	if (read)
>> +		tx_fifo = stm32_ospi_read_fifo;
>> +	else
>> +		tx_fifo = stm32_ospi_write_fifo;
> 
>> +		tx_fifo(buf++, regs_base + OSPI_DR);
> 
> It feels like the _tx_poll and tx_fifo naming is a landmine waiting to
> surprise people in the future.  The code sharing makes sense but the
> naming is just looking to cause surprises, especially with it just being
> a bool selecting read or write.

Agree, i will replace "tx_fifo" to a more neutral name as "fifo" for example

> 
>> +static int stm32_ospi_tx(struct stm32_ospi *ospi, const struct spi_mem_op *op)
>> +{
> 
>> +       return stm32_ospi_tx_poll(ospi, buf, op->data.nbytes,
>> +                                op->data.dir == SPI_MEM_DATA_IN);
> 
> Though the one caller is also using _tx only naming, it's a bit more
> tied in with the op sending though.

I will replace stm32_ospi_tx_poll() by stm32_ospi_poll()

> 
>> +	ctrl->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD |
>> +			  SPI_TX_DUAL | SPI_TX_QUAD |
>> +			  SPI_TX_OCTAL | SPI_RX_OCTAL;
>> +	ctrl->setup = stm32_ospi_setup;
>> +	ctrl->bus_num = -1;
>> +	ctrl->mem_ops = &stm32_ospi_mem_ops;
>> +	ctrl->use_gpio_descriptors = true;
>> +	ctrl->transfer_one_message = stm32_ospi_transfer_one_message;
>> +	ctrl->num_chipselect = STM32_OSPI_MAX_NORCHIP;
>> +	ctrl->dev.of_node = dev->of_node;
> 
> It looks like the controller only does half duplex as well so it should
> set SPI_CONTROLLER_HALF_DUPLEX.

Right, i will add it.

Thanks
Patrice


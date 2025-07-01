Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7494C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 07:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjEU9ubolXq6bNyzBdOl3AlCHglaTXh8+re7Vdnli3k=; b=I4HLpZ4AiyhACTVvQflOIgYZYL
	7T8iUWq3hAMSGSbQb17qGV4gsEG2pd7nStQU9KTwGijXJk2offcXbazkMQRpnaEwWqSRAvtqcK1HL
	DRc6rDwMx8A9rLK6dkpjBVZf8cX7yB5AMTKtyfdIR4rRW/af79dOk3uNn0xC/aQwNQFuFGxqUa8rp
	BQRGxOTdQsTM8y/GTmC9//Zf+6D4dxx4GgIaF1rPlPATLrTtamkhH8ddriTsthJodU6eztKLLEr89
	rBYZ/ctoJC82Yytn+VQQsQfZnASuv+n55OQN6LcsoXLE4fHBS4N/yFuuzZtXuwg6YnNhq/psgxpYz
	3+Ua2HUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVin-00000004JRh-1ipf;
	Tue, 01 Jul 2025 07:48:05 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWV9l-00000004EuU-36XU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 07:11:55 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5612IZfh012666;
	Tue, 1 Jul 2025 09:11:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	pjEU9ubolXq6bNyzBdOl3AlCHglaTXh8+re7Vdnli3k=; b=Jn7H8vOcNMzX2slj
	XzBW1YVZpqYxreG+phG/EWQUK5cjaSMAFvyr4ircFjTLgeyKt/K/GVEr9JmSJ7H+
	sZ0DgzlhQ2WFAoKx1IXs9k4bktUtqGc18MBGdoNiEzPCWWQp4BZ/g7/rgiwwOVqT
	XzRf3NYqKYM60MspwnJpyyBGLV1eyk04Aa0O7UFWXEjt+mnlXnUHfHsZLqUPPS3v
	SHd2IL+MfukystmnC4Od8EGySAYy0Hv8ItD5EstgTqqcfEfG/0emb5z2TjW8nI1q
	dtQzGNLKNIXjV7wTNqjZ2nbXLW7YGFK62EuOBrnheoU3cLfAoh7QBK09MaokwTFI
	xRoIhg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j7r637m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 09:11:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5F4CC40058;
	Tue,  1 Jul 2025 09:10:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B1A5B83746;
	Tue,  1 Jul 2025 09:09:33 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 09:09:32 +0200
Message-ID: <cd2f6752-6d3a-4fca-93c5-70ad7529617f@foss.st.com>
Date: Tue, 1 Jul 2025 09:09:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: stm32: delete stray tabs in
 stm32h7_spi_data_idleness()
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <linux-spi@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <2033b9fa-7b0f-4617-b94e-7b0a51c5c4b1@sabinyo.mountain>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <2033b9fa-7b0f-4617-b94e-7b0a51c5c4b1@sabinyo.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_001154_514913_974F88C8 
X-CRM114-Status: GOOD (  13.36  )
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

Hi Dan,

Thank you.


On 6/30/25 21:35, Dan Carpenter wrote:
> These lines were indented one tab more than they should be.  Delete
> the stray tabs.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/spi/spi-stm32.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index 3d20f09f1ae7..afb54198bde7 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -1895,8 +1895,8 @@ static void stm32h7_spi_data_idleness(struct stm32_spi *spi, struct spi_transfer
>   		if (spi_delay_ns) {
>   			dev_warn(spi->dev, "Overriding st,spi-midi-ns with word_delay_ns %d\n",
>   				 spi_delay_ns);
> -				spi->cur_midi = spi_delay_ns;
> -			}
> +			spi->cur_midi = spi_delay_ns;
> +		}
>   	} else {
>   		spi->cur_midi = spi_delay_ns;
>   	}

Reviewed-by: Clément Le Goffic <clement.legoffic@foss.st.com>

Best regards,
Clément


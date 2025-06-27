Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F78C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 11:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JT/oZIZ3g44uQwFbSBm3mpKN5NBsBXZqXoDPZXCZ6qI=; b=tLvw0uBDhY2opqucN9lCggwuOv
	iDmtfW+L4QmPe3iOK9LVTKGDZfOPMcIQZQ5o8fln/lP1ODOSERyaG0KX2f5FpkYTp1ufJlTlnVgnT
	6GhC9em1YGtxThw1ub6DOdUjTHdKGWJDOwO9lzBmPxVdfBSl7i8WZaQ9nAycl7ISGZg1gwGOBIOgS
	YD4rW+EZCSSvTB091X17xM+1L2Ex2QbgOe3LwL/R2cB83W1rIHy4Hmt7JyQXaekh+hNm1ou65ZzMd
	FX1N3N4j8yqoyt8Xch2mqYSL/b5Q7DBCfhRwMXMauBlo7bDNCevxKy5pQLycf6R1I5ejGmk9VeVcc
	dbt1dcPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7eh-0000000EYwC-0kn4;
	Fri, 27 Jun 2025 11:54:07 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6AO-0000000EExr-1VTV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 10:18:45 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R9hWB5006538;
	Fri, 27 Jun 2025 12:18:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	JT/oZIZ3g44uQwFbSBm3mpKN5NBsBXZqXoDPZXCZ6qI=; b=jSnTASSp2oBQkLw2
	Qztvz8e1Qcq6x2XtbPu46cXqFGcZVewFDLTPfYdWrK+EmKBpLAXq5vHLcY0shDlV
	06M7TVBh5kBSOU1ffW6b54hqFfLjxiiUDfGAk7n5PBP2OQnu3+p0Krlqq27dYfJ2
	ufGczDWmxh3DaJ7oV7la4zPl6Z6OE9x3mRghUpzj9hXlJazoIYx4BZa/15hapccW
	37D2a84ioyvi3WwzycdcbG59eONlrCH9c6A1r1VLgD3UucFgNZXUn/q/E5eCaZ4G
	BRk1Z/dmdw8HTvOuDXkSdKvq6xckNLe7l0Wl9/BiTJZFMEHwUkxVyffuO1im/veP
	nW8oGw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47e7ppr59e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 12:18:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1D30A4005B;
	Fri, 27 Jun 2025 12:17:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC6FABE10A9;
	Fri, 27 Jun 2025 12:16:13 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Jun
 2025 12:16:12 +0200
Message-ID: <813dda8d-7871-46ca-bf22-4e231be4cbf1@foss.st.com>
Date: Fri, 27 Jun 2025 12:16:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] i2c: stm32f7: unmap DMA mapped buffer
To: Alain Volmat <alain.volmat@foss.st.com>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Andi Shyti
	<andi.shyti@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>,
        M'boumba Cedric Madianga
	<cedric.madianga@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        "Pierre-Yves
 MORDRET" <pierre-yves.mordret@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>
References: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
 <20250616-i2c-upstream-v1-2-42d3d5374e65@foss.st.com>
 <20250626090301.GC348766@gnbcxd0016.gnb.st.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250626090301.GC348766@gnbcxd0016.gnb.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_03,2025-06-26_05,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_031844_673818_0631EE0F 
X-CRM114-Status: GOOD (  13.71  )
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

On 6/26/25 11:03, Alain Volmat wrote:
> Hi Clément,
> 
> thanks for the patch.
> 
> On Mon, Jun 16, 2025 at 10:53:55AM +0200, Clément Le Goffic wrote:
>> Fix an issue where the mapped DMA buffer was not unmapped.
>>
>> Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>>   drivers/i2c/busses/i2c-stm32f7.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
>> index 973a3a8c6d4a..a05cac5ee9db 100644
>> --- a/drivers/i2c/busses/i2c-stm32f7.c
>> +++ b/drivers/i2c/busses/i2c-stm32f7.c
>> @@ -1622,6 +1622,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>>   		if (i2c_dev->use_dma) {
>>   			stm32f7_i2c_disable_dma_req(i2c_dev);
>>   			dmaengine_terminate_async(dma->chan_using);
>> +			dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
>> +					 dma->dma_data_dir);
>>   		}
>>   		f7_msg->result = -ENXIO;
>>   	}
>> @@ -1642,6 +1644,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>>   				dev_dbg(i2c_dev->dev, "<%s>: Timed out\n", __func__);
>>   				stm32f7_i2c_disable_dma_req(i2c_dev);
>>   				dmaengine_terminate_async(dma->chan_using);
>> +				dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
>> +						 dma->dma_data_dir);
>>   				f7_msg->result = -ETIMEDOUT;
>>   			}
>>   		}
>>
> 
> Sounds good to me, however there might be an additional place to fix
> within the function stm32f7_i2c_handle_isr_errs:
> Could you also take care of the unmap in the error ITs handling ?

Ack
> 
> Regards,
> Alain
> 
>> -- 
>> 2.43.0
>>



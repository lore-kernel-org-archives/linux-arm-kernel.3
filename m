Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82967C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 07:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npzxxQg3AAleq0Lybv60/mXXydV8H5IHVXqUHauWTxs=; b=sdLOK8FenYfzAgCAQbOJRR/tXi
	+iEqbLBxr+LOybfWmVsOpTkhnF6wmzUXNh1mGlauFVXWoSLOMvjlNBnyBK4Gg2W4OHtiDbdcVEnX5
	dqGZJTnzfNH+pGK4rRid76kLAfsyjKppmfYgU/6lpFSXfcieIW5IwZsHjuyzuYSfZb3XATwc4a589
	cb6xr6/DG2HxUo3Im64pbQABNKAlHL0fOBM2Wvei7c+UEQSyjsvGjwn4xG30Ik/Si3eggQoJTyyMe
	RDQ36UzqiJtVLBRa3tu8Rb8XZ+uNVa9/9vETn4cUZVK0Ck6RTrSzvdg6MofnPxaOD2U8GPY+SjrRb
	/xhF/93g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEMA-0000000AVqr-2laW;
	Thu, 03 Jul 2025 07:27:42 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEHw-0000000AVBe-1skz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 07:23:21 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5636iKQV002403;
	Thu, 3 Jul 2025 09:23:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	npzxxQg3AAleq0Lybv60/mXXydV8H5IHVXqUHauWTxs=; b=Uj1QAxdPfx6LqXSh
	1+ryb8pe7ooyPtWVa7Z+iCLzfHWV92go8qbzCrCafplRgwUiZqCVBFK4pH5+Ifvt
	u+62KttT2B0xFNxEoDnMRW5bhqezQaYJLLxHsBP9XCO+2GH4wThfQuNe5TWfGuf2
	zI0aC3ls5dNIr+S9RCNLGu4S8EJSiuP1rz4LmSSyApYqyewv66QrhQTRPzFbUeU7
	I4s96SUsp8XocexpRUPm2ur2TZ2AKAS6gthIggspdBJPwPIlRFLbPJjv8ZgAvzXl
	zb0NCzKvoUKnbVibDymFj+qbXxUNatvAV1wU5wzXOeH5un+Fyi5bH2Q0/8dCS5DY
	Lm0dJA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j7r6e53n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 09:23:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3CFA24002D;
	Thu,  3 Jul 2025 09:21:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ABD54AF01A6;
	Thu,  3 Jul 2025 09:20:27 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Jul
 2025 09:20:26 +0200
Message-ID: <44f4f1a4-0225-4fda-b17b-f3159e00851d@foss.st.com>
Date: Thu, 3 Jul 2025 09:20:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] i2c: stm32: fix the device used for the DMA map
To: Andi Shyti <andi.shyti@kernel.org>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat
	<alain.volmat@foss.st.com>,
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
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-1-7a23ab26683a@foss.st.com>
 <n4mx3xukr5zffajpwomuwp27fywmogm6nmv7hgkcwpghjaorwv@2mqmgg3u5far>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <n4mx3xukr5zffajpwomuwp27fywmogm6nmv7hgkcwpghjaorwv@2mqmgg3u5far>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_02,2025-07-02_04,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_002320_764748_31EB71C9 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

Hi Andy,

On 7/2/25 18:57, Andi Shyti wrote:
> Hi Clement,
> 
> ...
> 
>> @@ -118,7 +118,7 @@ int stm32_i2c_prep_dma_xfer(struct device *dev, struct stm32_i2c_dma *dma,
>>   	dma->dma_len = len;
>>   	chan_dev = dma->chan_using->device->dev;
>>   
>> -	dma->dma_buf = dma_map_single(chan_dev, buf, dma->dma_len,
>> +	dma->dma_buf = dma_map_single(dev, buf, dma->dma_len,
>>   				      dma->dma_data_dir);
>>   	if (dma_mapping_error(chan_dev, dma->dma_buf)) {
> 			      ^^^^^^^^
> 
> this one should be "dev" too, which renders the chan_dev variable
> unused.

Oh yes will send a v4

Best regards,
Clément



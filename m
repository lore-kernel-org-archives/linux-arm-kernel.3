Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666A5C5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfXILiAwBDaxvqRoSf8xZ7r6Qs2Yw0ErBR+u4/IPE9Q=; b=wNKTXW/qIK6IOilMmTgrKvPv9p
	+/clEVR0iTQc9SSg4D5v4y0ByaPXUuOVYGhMN5Eswit3i8c8hWmJL/Vou2Px6qjIsqhoNTTVqe9KK
	edOOkcrnyagP57Q/wEM21F7pT9G+Qjwibw32dD6I2NGOMQZKdBMh3yv4ivfb08zk816mAM9ftxKYu
	zr5FtRPDBi99EbaaSKR31SDNETbRYLwEc7gE5OqqDspBSi+i+L3BnB6QfBRRMQ1DDFaGNO6/R3d/q
	8jljmfRHefZ/4fVSfkcQdONl/Btp3dWSwIOOp2d2Wl42EZ+Bzm7Z/WSoxQi43uLLQgeIofDjJM51M
	nPP/7ztA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXxO-0000000H5Zm-2WfV;
	Mon, 24 Aug 2026 16:55:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXxJ-0000000H5YW-2FwL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:55:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OFn37d2261417
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 16:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sfXILiAwBDaxvqRoSf8xZ7r6Qs2Yw0ErBR+u4/IPE9Q=; b=ByBN/BqVIwxSsv7C
	5vePHD+qP1XPRv26tJh1xJpiFcWjFIupOTGGuEA8DnxthAUGC18zZH9r0NikPRN6
	rJfhaYVRAHTyg9RT4OEGiUnReE6SxP0IPOnn9/wq1xBZB/4nAxhFptNLOz+w4jhk
	h90r9/ZlrdfCYk3KFd0MroXEjuk3TXyh1N3Kljw34vKY0paYqhph/cdnGsdsjIzt
	tafxak0YMW4qBZRh7kQQ2b6Ea3KhmBj3NiBivPKXZdYnwkIfoKODPe5k/T2Lok2X
	YQgKuKOlCN9yM7tooAr1Oohc1oKaWPSWbtly6MNEYByj8rNTo4o2gf9FS2mQS8/u
	impz9Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf2atb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 16:55:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb48f41343aso57915a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 09:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787590526; x=1788195326; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sfXILiAwBDaxvqRoSf8xZ7r6Qs2Yw0ErBR+u4/IPE9Q=;
        b=WzTlxY82YtfFCz5gh+LYDg+MGEbUVf/QltmTHGqGSQmlWl20yP6Qi1JqvrOTSwbcv/
         yplCVbNaIGcpt0lZSjQ/m0hcHI9a7nIZVzyr8ePqCIcOqCzsx9qR20j1A6g1yeX3t7pk
         eLoM3bR59LZl6d1ZoQk/NvtJSrp5rjTADbAPxHyAc5jyXv4UA4iJXsSrpPrJ8mVWEtQr
         2EfbGJLLbhIQWUw9sY1yvMvI9WBcr2GJKWgjK3JRUAuj03ntV99O371idJuai02v5LSa
         aKWIJ1UKPImwJaMh/IlTGg8w4xvZZEzdIl/x6VFg0QHXG5mQpjVQ3BWSSLBMJLcrzRa0
         kQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787590526; x=1788195326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfXILiAwBDaxvqRoSf8xZ7r6Qs2Yw0ErBR+u4/IPE9Q=;
        b=R1VWntq1l5eyTzmnnsoqCLR4OEASxvWQm8HVxOhbxhV2CMrpSzoQzYQ2OBvVl9FpEb
         rGTHZvS70XrAnGIae9pjtKrmD8846x8lrv9FzBLzEwBMhkcOnfBQP+yO2v/GBLqT1R1U
         xHN0RLt/KuyGWETG/axUSh6lkRri6yw5Sj4ta/3XeEEnKq57oJjchREOLmEzBqrvhWHL
         y7WdhS6bm6GCViiZON/W4yXvNEsJzi3V+seWc3qrw6eQ+UwGCF9c+5NmnYAKdoc3byez
         PdsJvAdU0Rj2Xh66sG5GLzR9JSPvyD/Hu2ojiJT+ZTv2ezZkKfZoFuy/wbSldvddOavk
         2xhA==
X-Forwarded-Encrypted: i=1; AHgh+Ropyc0rFqEWOB/2PiC9GnR9SalZGwJb9dNfBYaaVFOwReCnUBhJlxdmgN9V2v4Y45Q/4CZeQqyKZi6HksPes2I0@lists.infradead.org
X-Gm-Message-State: AFuF++mgwkZ1/fXgWoyAJz1bnv6I6fVOCWfCgPizeIwKysEvM5QNSmNI
	MmCtwlw2Q4B0sUFcDRcDoCBUOMrNR/nkzMUuXTpfKVjJGKCGAew9U+hm25dI4h3eEQsJggxtsGP
	PWXe86jY7R6L2pAyjE+0KVKfGXsqiQh6/eB+7awE3UVeOybHybEKAuPhPf/gBibFyigJ6nyThuw
	EPxQ==
X-Gm-Gg: AR+sD10NZnWxSBZsJXiBDtoIqy8k7Ykm/YDMY/H/309Qvb3OuBrzT073il37EKwH4m+
	stE054IigREc8ce/iw89BuGiTZN1Qrdii/OjILrkcwhQ1LaJvug7vDVkd91BPTJXDFGc9mFEyiZ
	T0OddH59PsUpT7T98x1IyuklKa4WiKRmUsCU1qzpzbfmqfE7SfxdPINrkmq6xMIJeSvTfck4tlR
	shtIhHIxlmKMZWbYsUSxtGEwi6hubcFeu5EtBT3I7K7/h/eOp5s0YT1VZ8bp+ZY3A333yHHAyjz
	VJy1/AzFQY9+Dw6qabOnXZLusMa6A/VQgilIUljm4aOJlFNo8WAIE0G0iggdubbM1XQjSbBMbLz
	9Dv4sxgiWmTznhxHe2/y1Yt/CqCB71w==
X-Received: by 2002:a05:6a20:431e:b0:3bf:b9de:8557 with SMTP id adf61e73a8af0-3cd8f294ee1mr683410637.9.1787590525665;
        Mon, 24 Aug 2026 09:55:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:431e:b0:3bf:b9de:8557 with SMTP id adf61e73a8af0-3cd8f294ee1mr683336637.9.1787590525072;
        Mon, 24 Aug 2026 09:55:25 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.106.1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199daeccbsm1253160a12.7.2026.08.24.09.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 09:55:24 -0700 (PDT)
Message-ID: <e47bea2c-ddf5-4568-9a2d-a30a31793352@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 22:25:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] soc: qcom: geni-se: Populate clk_perf_tbl with SE
 source clock frequencies from perf OPP table
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-2-61171ab1cdce@oss.qualcomm.com>
 <d81d61fd-79d1-4bea-b93c-0afe44f9aab4@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <d81d61fd-79d1-4bea-b93c-0afe44f9aab4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE0MiBTYWx0ZWRfX8VRQp8FsR2iO
 SrYjpxnpc7nBFETg3WCbsolhoVpdA4OAQkfAPI+hWSxUlMqamW3PgxE1meyS2iPEcwFVIAeCVIB
 bRYCsdJERoDcEzIzUzqd2BAC3g05qdY=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c777e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=3DKySdf3VQHjbkfL60kt6A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=rko7XVifj6BEHbDbj-IA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: yXOpqOwCUMFSLO9QOnUMENlasC80eD28
X-Proofpoint-GUID: yXOpqOwCUMFSLO9QOnUMENlasC80eD28
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE0MiBTYWx0ZWRfXx9oom34RfGw3
 QjpaML1UQL9Cz3fMJtkuQqY371rju9v0YKuAotfGHkXYg1rThg90aSbkDi9hvU8OGutlcZYwt43
 KYczwsPmjIbMXmbQzSkudfUl8GU6mCFrRxowlfWXxzFuTNyjoHZigsy90cDOtDvJ1F/aU9BAnP5
 1eh32SfXMNvj/cfk9GFglpJTsxr/7p+waVHPLq54rbn1uncOEZFzzSB2f+uHg9TFsYNfypMnLBI
 es8Aj3vexpRivvktNeFwpgxfzUf89fLVKhhydWBEHsqosc/NpNgVSuV6hdmmW0d5HwbtpfMPoj1
 AHJDh7OQHhw0UkzVAh4/f2UdaWd0NA1O3jSn+i2C+pGMFHvMu9KWyEPlJTewiWEVrMLfnPp3EL/
 iIQhfOibzpS0wbV9QBGbLu8mVBALVYjLHzQQFZOZv94KwHk0mrFNYYWFhjM0GlY0FambbOQjaoz
 ADrNktlHwaOBcnD1c2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_095529_699983_3CC52CFB 
X-CRM114-Status: GOOD (  15.76  )
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

HI Konrad,

On 24-08-2026 20:26, Konrad Dybcio wrote:
> On 8/4/26 9:57 PM, Praveen Talari wrote:
>> Currently, on the SA8255P platform, protocol drivers attached via
>> geni_se_domain_attach() treat each OPP on the perf domain as directly
>> corresponding to a protocol value such as a baudrate or requested
>> frequency, and simply request that OPP via
> [...]
>
>> @@ -1175,6 +1181,29 @@ int geni_se_domain_attach(struct geni_se *se)
>>   	else if (ret < 0)
>>   		return ret;
>>   
>> +	perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
>> +
>> +	num_opps = dev_pm_opp_get_opp_count(perf_dev);
>> +	if (num_opps <= 0)
>> +		return num_opps < 0 ? num_opps : -ENODEV;
> if (num_opps < 0)
> 	return num_opps;
> if (num_opps == 0)
> 	return -ENODEV;
Sure, will update in next patch.
>
>> +
>> +	se->clk_perf_tbl = devm_kcalloc(se->dev, num_opps,
>> +					sizeof(*se->clk_perf_tbl),
>> +					GFP_KERNEL);
>> +	if (!se->clk_perf_tbl)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0, level = 0; i < num_opps; i++, level++) {
> One iterator is sufficient here

Will review and update.


Thanks,

Praveen Talari

>
> Konrad


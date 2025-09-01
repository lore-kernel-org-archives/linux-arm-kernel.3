Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA70CCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 09:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1J076/LQgI+3eWtUeFftMALqG6G2irnWWLjDqPX+63E=; b=BTWtkluCGssTWch/QOPWsv+LdD
	mJy2bDO1kJ+qXBSGIXAygNJNjWGPeAEmV5kdMFM/sfU9CWRjSwV2A4zHjP72pO3QiqWp6oiS1uON9
	EJClGPHtHz4Jw3reW2iN5V6faeqaKnTWv3lpjGw/FX1ZOen+i8Q2oUogavZZc5t+e1q2KPehMl+po
	fkg9sEQf2TnlrFnUP3owls5GFzgv9emFTnmR0giA1GjsFtSdEqnLCpYTTS3jigT/TpZz87RR76NeN
	l9CdSjwxDcAdhocBi1kk0nmjNvdc6lcgvfBJ6bM9scnWR9F4N+LPZNv4KjDKX9aYDFTdiiWhdjqXc
	z1JLc0Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0R2-0000000BgNi-01dM;
	Mon, 01 Sep 2025 09:02:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut03p-0000000Bbn5-2pGx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 08:38:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5817ulKm003420
	for <linux-arm-kernel@lists.infradead.org>; Mon, 1 Sep 2025 08:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1J076/LQgI+3eWtUeFftMALqG6G2irnWWLjDqPX+63E=; b=jy05AZlF4U+KbBD4
	TfBvoLftuB4zowARI2w17Xd4334aLgFV0N9EiseTD7BVYVyt1s2s98olfk/rRQ61
	E8BHwT8h/dV70f0+LnMtzZWxg6J0NoiJzfF8H65Cd0UJUgTU9ifXOx/Ur731Sece
	+H39Ax6zrPz/8EE8+xbiW7RA6aWd4iWbixllIWW91gw/G1f7fNREVAH/7ea+IOlq
	Lzma4heZYFjyDENVOOJ5CqDN0AXAd076JioKunxRpsRwLnw9nAwM8gwNeBlIHnJ0
	zA8NbzZlhvhdKiX7peQ7J8+7PD+QmQD8ATQMLkcxMMhmIRqJ4qYIUyvhBxi4Z02u
	F0Dwwg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp452y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 08:38:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7724903b0edso1328750b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 01:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756715923; x=1757320723;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1J076/LQgI+3eWtUeFftMALqG6G2irnWWLjDqPX+63E=;
        b=AoU1Amnp9/zN3iPDHm+D4QRatiKTsGt/ZU0Zr0n6OVtg3Cvutvqce9R3fphhlWrJXG
         k6gxMX/zfetWaKTskBJ5CfjGbFKwj9R4Ddbm1FoPnirSiTxYa0ygzCBVfg6fc2Werzat
         GEViDUO1P7LDNvB95+cf+BFApwdxVpmf4gnDAmJsF8H2Mx03k4K98gtXAkzlj6PN1m8/
         R5wZmW9yT1wsjxzD4CBr6Hcp2T53lq5YMNQs5GAtR0CZL9Jn1zGOUh+8h/kA+FZByONV
         AWdfsm8L6NFMvWHMOjNLpdCSqLHejzBBeM33sFgGUvVHccZLuthqWPgQ1JZusD5AnObm
         zEeg==
X-Forwarded-Encrypted: i=1; AJvYcCXxEHjIES9TR8fQLlxHDZMQmwaDO9HPs7LxnXlheKsMoxEJJqoSttj2i6DvpvqWZOq+RjywO48A2imKhSF8zUh8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9xoMNWTv7eP3g/HyHXeQqt3F9rgzOEu0yNvEz25Cpn/qcBz5p
	w4vI0L1rydR2bcxNX74p6z+2B+YhHyCRUmUSUNPLGQe/tJsxowTwua1DYM5UqTWI3pqymEHiPQL
	w38T+H//daoo168nwMfLxqaGRHQkVGw6fIrBn9qy8lFJLJYLoICHNwSxygrPdfnXFYiuaD635rA
	pyQg==
X-Gm-Gg: ASbGncuJGRzi7fzCXpEqG3EOVYWbwUOBPterHGP18jRuODArICQbEoKAOpE8uZDqHTE
	Itteum/2Xo0VgqJXHvA83UglDDHZEMR9qReipX8Nc0m2CVOAr4kii2uPqIPIPLVRjsc3kb6C3KU
	jtAoMXJHk37Af0s91BZqj0L2mLhU+2TNLq93KNbdt3DtT9h6REnVqUg+sFaCfyZUV20mPg8firJ
	CL/QJzDOgFoCI1NfqHOyg31kDjkDSxEJ4osdd0i5O4yqhG9tORh32HtVnqYzX7p0DVdu788KWTo
	GG5/urbT8iSTpj+gAr6JNyED+kTA4WN76PtQb/EZe6j7MLMDfLp6fzD3jl49aX1zxbNKoPYMken
	GRNvUDYzSmdkEGJ3F0ayiq+oT6QC9zSh8zQ==
X-Received: by 2002:a05:6a00:1789:b0:772:2e00:831f with SMTP id d2e1a72fcca58-7723e1f1deemr10329854b3a.4.1756715923368;
        Mon, 01 Sep 2025 01:38:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsvQVbqKRANvlU7zeqIf181vFzHz2jPH5oH4pRglmEHl2qc84zDD29EMGRW7zDIDTyLCRwSA==
X-Received: by 2002:a05:6a00:1789:b0:772:2e00:831f with SMTP id d2e1a72fcca58-7723e1f1deemr10329810b3a.4.1756715922864;
        Mon, 01 Sep 2025 01:38:42 -0700 (PDT)
Received: from [10.133.33.247] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4beb72sm9925996b3a.61.2025.09.01.01.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 01:38:42 -0700 (PDT)
Message-ID: <15147896-1378-4a3d-85ba-4258046f9e31@oss.qualcomm.com>
Date: Mon, 1 Sep 2025 16:38:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] coresight-tnoc: Add runtime PM support for
 Interconnect TNOC
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com>
 <20250831-itnoc-v4-3-f0fb0ef822a5@oss.qualcomm.com>
 <b608b4b2-f850-4b49-be65-b2f4e3784dd5@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b608b4b2-f850-4b49-be65-b2f4e3784dd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qAVvyQTFiY0AlGspfZBZ3k0k0-A_fdvu
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b55b94 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=ZZ2O94ThGh-PlZ2E-5gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: qAVvyQTFiY0AlGspfZBZ3k0k0-A_fdvu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX63HBvW7q7EC7
 Vn/o344m9LmIkLLUe7p3bd+lTOGEgPCMACvBcmwBZaUyNkJTL3ongjru17qMl4BBb/C6Z9zlVYr
 z0MfztVYbgnI5ZEwWr0BtsqhMMQR3YJXeFzujaoiFZ1MOFUWaOa6CEymcajcRJX6ZSCSv8jvTza
 98Ty2HUvIuawsIyHNyl/DRTOAisxCpjIDPNio+7o4xFKSeqb3vLnXMVkRHOiKt7dW1DN0eugQwk
 1fG1M25vfvMGEhJj/z7p85qVVDsLMNMWD7THwg+XMiz3v70vbsQAxtIZGJ/41zNlYy3x5SzKLHw
 E8W4mMA5PtHYa6SRXwrw7MRi0we7n0m4fyKIXSqwV6hIeMy1dLPBlZlJQpgn3PG2P16xsbCWzSw
 o7PYumRe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_013845_832595_FDDED94C 
X-CRM114-Status: GOOD (  21.13  )
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

Dear all,

Apologies — I mistakenly included an unintended attachment in my previous reply regarding the patch submission.

Please disregard the attachment; it is not relevant to the discussion.

Thank you for your understanding.

Best regards,
Yuanfang Zhang

On 9/1/2025 4:30 PM, yuanfang zhang wrote:
> On 9/1/2025 2:58 PM, Yuanfang Zhang wrote:
>> This patch adds runtime power management support for platform-based
>> CoreSight Interconnect TNOC (ITNOC) devices. It introduces suspend and
>> resume callbacks to manage the APB clock (`pclk`) during device runtime
>> transitions.
>>
>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>> ---
>>  drivers/hwtracing/coresight/coresight-tnoc.c | 23 +++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
>> index 5be882300d79bc0173aa6a19d7da1d48c4aaca9c..2c5370497076536bfa868f0d80db775ef242968b 100644
>> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
>> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
>> @@ -301,6 +301,28 @@ static void itnoc_remove(struct platform_device *pdev)
>>  	pm_runtime_disable(&pdev->dev);
>>  }
>>  
>> +#ifdef CONFIG_PM
>> +static int itnoc_runtime_suspend(struct device *dev)
>> +{
>> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +	clk_disable_unprepare(drvdata->pclk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int itnoc_runtime_resume(struct device *dev)
>> +{
>> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +	return clk_prepare_enable(drvdata->pclk);
>> +}
>> +#endif
>> +
>> +static const struct dev_pm_ops itnoc_dev_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
>> +};
>> +
>>  static const struct of_device_id itnoc_of_match[] = {
>>  	{ .compatible = "qcom,coresight-itnoc" },
>>  	{}
>> @@ -314,6 +336,7 @@ static struct platform_driver itnoc_driver = {
>>  		.name = "coresight-itnoc",
>>  		.of_match_table = itnoc_of_match,
>>  		.suppress_bind_attrs = true,
>> +		.pm = &itnoc_dev_pm_ops,
>>  	},
>>  };
>>  
>>
> 
> missed Reviewed-by: Leo Yan <leo.yan@arm.com> tag.
> 
> thanks,
> yuanfang.



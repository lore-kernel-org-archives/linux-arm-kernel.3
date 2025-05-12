Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8590CC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 16:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kr3jWOCGeen6mhPU6fQ82uGqo7KISN3OGotI9WEfvvg=; b=PPdHxxyJnX7bUMlUuYrTu6fEve
	rAhVI7ADkf3cos8LZbMHAU5oQMlQnZ9OAatKEeHDeiWP1x5JAXETxjfyrG1M8fXp+R1LRgDLnl1t5
	A4dlKXaqk2DCPWJ982OkzkhH3BIssvVKil99KUxzcuqxVzWKLtgV49IonzpAr+bT8SRk6dGnDdNLy
	D1WncDraHN3gqaTXXzcn3D/7Ye7A12RZSHVR7X8bjsJx5CNjR9mpvbFLvsB/MyjayYsnmmRIm6OsY
	d38bjJ3rYeURP+nVtGZj8c2m2+QYjn8xQH9Wochs7VYTxQxNPgUurFxNm26WU4jQSLln1jBFi3caA
	vjO+Fwvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWT8-0000000A8eN-1oqK;
	Mon, 12 May 2025 16:57:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWCp-0000000A56c-00ss
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 16:40:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C9uuPM018756
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 16:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kr3jWOCGeen6mhPU6fQ82uGqo7KISN3OGotI9WEfvvg=; b=JLWsQO1zK5h+kY+3
	XgMugpyth20ltJzSLsi4BAavGHPJ7W5PKT/gAoHNW461/cYPAnIr4xQv8KMsSn/e
	+oKmNPd4D7B/F2j92WHykFvslMQ5BWUUsvHzTtl2UZy0bAEbpcMwhg3nrfKVn+b7
	F18qCj7u4Jk+6R40GikdoBn2iGhTP0mDBLaq35T3PXtvuBUniBUebVabz1H87XUe
	QcatAHQP7nUhbDmgx0hdZ6SSUbEsZrO+B1M6f023V3pLH70taUWrYplSglw67tFn
	wX5Of4Nh7+WYBYNTWQxRWeupBddVxn1akWstUbin948ZK2s2KqEL788oJ5jtXuzo
	aEI0cQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyynvuus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 16:40:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c545ac340aso42063985a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 09:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747068040; x=1747672840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kr3jWOCGeen6mhPU6fQ82uGqo7KISN3OGotI9WEfvvg=;
        b=V/97NdzzubIaFqXSRPI1vw6zPuhofml2+RwyMPDMkem1TL59mzDW4QM2833r3VhIL4
         fLE15DpDkBLNPyhasHrEDJ90yWwGLFNMinVRyDW11I14sG7yf44Dwc7TTU1+rtGW81CA
         Sl43ikZtd0ucAeGiRRJCDRWWea5xZ3998aWhTgjkIkPvIJocsZDLtsJtlhRU+jTtFoUY
         60G+EzMIh6G7Nx5ZREbkV0vyMHG/uCt1Zj3T6k/d+ElTfBtAYqs4a6Uz+RoMqWTd/6X/
         cyaV69l56449EZz7ksYp0aE14TicktlIVLneSnNVd/CdK/EKj4xpDCeF5eIabqdiqYGq
         Yfrw==
X-Forwarded-Encrypted: i=1; AJvYcCWB0c+y+qfhRfFoMEzbuZ5XkpY+D+GVb9NvuIfZyanOTRqxSRRo65IDZfHFhUZuLWyzXsqsFpYUjoKKzAEBxwS6@lists.infradead.org
X-Gm-Message-State: AOJu0YyXwTZtsMlnkPonufDNAvsUvE9fUw8X2jDqDKKP2PDEjCrHMQ5O
	zhvOUiQ2Mtw1/GT3fKxJP79S9atDQScrlzmoJmgAmCOwZ6Vo8qgeXqxNKSb2xSQrFzbh44P7cPT
	mt3tP5fT+npE7S6lbuDUCKJGhjZAtew8bBUmjQG/L19Y/TOas2heWU5NVTr4bx/rkbUJYrW78kQ
	==
X-Gm-Gg: ASbGncv8SUDV08gbsle9kbr5cg4udyRUKL6OTzSJ9NhfGszQa2/NRWP+4LsGCi5seg/
	IQ2wyZTQ3bPpWfqQOV2JO/3CH7kgmDeRWu6BnnlQZ4FHNOz8A5wuF2aBsysIPIrCO04PZg/meBO
	zqKPVBYGiEw2aZxJ0YYakkdEeWmxjrek0exscpDu8SR2WNWLmrzwrrYXs1gfg4cMe8u9pig07Qs
	oLiK2DHjjPlTyGEOT79GN0b+iqgeLnxjyfasdo8Usqqe2idRGqumjI7bwhmXqrKsOOKUZiZKq+x
	41fkcaWEwcw0dlZJB8o0jLmG0GngRHz0eAy7rzXTFdLW8ieXK9++2/lyT1dqPFExohE=
X-Received: by 2002:a05:620a:4442:b0:7c0:bd67:7dd9 with SMTP id af79cd13be357-7cd0113e87bmr724491585a.11.1747068039511;
        Mon, 12 May 2025 09:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYboUn9LFZ6zKugg484tI2Fmt+H6eRADnHp8J2TCCgkIo9QNbZ938v2XB0JB1jPwZubnycuw==
X-Received: by 2002:a05:620a:4442:b0:7c0:bd67:7dd9 with SMTP id af79cd13be357-7cd0113e87bmr724490685a.11.1747068039202;
        Mon, 12 May 2025 09:40:39 -0700 (PDT)
Received: from [192.168.65.222] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21947a13dsm638882166b.83.2025.05.12.09.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 09:40:38 -0700 (PDT)
Message-ID: <3c7ddb25-1d76-4f85-a058-abdf887dc0dc@oss.qualcomm.com>
Date: Mon, 12 May 2025 18:40:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250512-trace-noc-v5-0-f2ef070baee5@quicinc.com>
 <20250512-trace-noc-v5-2-f2ef070baee5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250512-trace-noc-v5-2-f2ef070baee5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE3MSBTYWx0ZWRfX7BERdvgTevz6
 xwGdJOtRZZJxh44dnemSas1GhG+nES3eVvXgdIY341ZD0md0Na/zHb57zI0VvScKxq1LuS/dcWA
 f2BrF2J6DX0pLq1gT+NRDZ03sMSIzxlQdBlKeEqTBfrgSDfAcFhtzEp5d3KenrEQNMGezWZWtSW
 gQCFjOFmbibs937NfJn9+8fFV3LIz25IGp2HrmvHqYAoz2gRMTnUNLHqjbU5xdVtmz+78ffgkyI
 kkugA8XEH2FoZlY/7KKT17tbCig1LAOWN4LCvycmdPnsYw8oJfDmYrP2ff9alAQ3NzKR+wGpS4Q
 ERHw4GmuiKeFmdfzJJ5pmOQ36mOrpG0USQ9D6FiJ3tRAemGA9iTZKw8vc2u05KyOe6CnEJkCypW
 AfvS7wiMxmK1/4YpHIwPnldHhLNDB7fywH6L8Lijpl+xoYqe1AeCCbeJFlgQ9qrvUZ6NeC2m
X-Proofpoint-ORIG-GUID: 3Kad0yYjvLddCJtgn5-orC-kxOSE8tlC
X-Authority-Analysis: v=2.4 cv=Uo9jN/wB c=1 sm=1 tr=0 ts=68222489 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=IWLDPTm1b9FEelM1JeoA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 3Kad0yYjvLddCJtgn5-orC-kxOSE8tlC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_05,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_094043_060104_507C5219 
X-CRM114-Status: GOOD (  17.97  )
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

On 5/12/25 1:10 PM, Yuanfang Zhang wrote:
> Add a driver to support Coresight device Trace Network On Chip (TNOC),
> which is an integration hierarchy integrating functionalities of TPDA
> and funnels. It aggregates the trace and transports to coresight trace
> bus.
> 

just a couple nits that you can feel free to skip

[...]

> +static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
> +{
> +	u32 val;
> +
> +	/* Set ATID */
> +	writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
> +
> +	/* Set the data word count between 'SYNC' packets */
> +	writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
> +
> +	/* Set the Control register:
> +	 * - Set the FLAG packets to 'FLAG' packets
> +	 * - Set the FREQ packets to 'FREQ_TS' packets
> +	 * - Enable generation of output ATB traffic
> +	 */
> +
> +	val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
> +
> +	val = val & ~TRACE_NOC_CTRL_FLAGTYPE;
> +	val = val | TRACE_NOC_CTRL_FREQTYPE;
> +	val = val | TRACE_NOC_CTRL_PORTEN;

FWIW 'x &= ~foo' and 'x |= foo' are what one usually expects

[...]

> +static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct coresight_platform_data *pdata;
> +	struct trace_noc_drvdata *drvdata;
> +	struct coresight_desc desc = { 0 };
> +	int ret;
> +
> +	desc.name = coresight_alloc_device_name(&trace_noc_devs, dev);
> +	if (!desc.name)
> +		return -ENOMEM;

it's good to add a newline after return statements

Konrad


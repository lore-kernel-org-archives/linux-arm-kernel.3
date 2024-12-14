Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619F0E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 22:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFgyAxvNra4DPanTeeFOl2uaHZeaHsP5CLLrDFBo6ho=; b=X/VvJXW5wasQczXqhX7207wNy1
	hSbRmHkHm6usF4rVbnkHHer7bf+TRSgyoKh2dtmkrDRide51nVTXlsPuloowKEOTL3pB6D/mk3fxX
	ndAuGUcdrQCZSZyLe3DlAA+1swk3DZ6fv1IFmbgSEgVSdASDkOZ3Kpr+otLSPLgQFYEpPKu57N6PN
	04AH2P6Aq95OvMW+NvUemm9ZzEYgAE0lvGnyCKTJbpy1FdZu4Nmfh2quXBbWluk3osu7q3yqu6etR
	QAHnGHI3IAq2ZVOdOVhqf3rmmSP1H0cLpd/My7EvR6UMQLwdTO29yK+SW54/B8+qZ1rP1ApHM53Xl
	pXw/qgQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMaX0-000000072yF-19gl;
	Sat, 14 Dec 2024 22:22:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMaVu-000000072pv-2j3j
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 22:21:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BEMHsUa008153
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 22:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XFgyAxvNra4DPanTeeFOl2uaHZeaHsP5CLLrDFBo6ho=; b=dVIqkSuoN1p8Gj6V
	Htso3DGgxvvZTckg+iGOn8Te8TmY8zi0Ul8RuMhXD5aayWi1InUIpBvgskv0+iU6
	N7v6KmYXwUHVnUMepOG8u/jj+ZwbpQFm4JgAGp6uqdF5OhxD5doGg21U3qg6lcYF
	eaw8M8kNAsnzGEJ6KinPnLkGgAJ+FyfwnGyNdWuOTlV8oTz6DOVMFpohEa2qbVP2
	3HsrvY85BxRJBrgpSfAYD5DJ2qlMA4d9Ef4pdc9d10D3hDLzl7912ODkEXIthCAB
	x3pU84P+05WHH4SjMujXU8E2u91BpIHNKGIc8vqN03LuxdfZYaDVEgH9X9YEilbL
	PGNbTA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43h309h3v4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 22:21:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6db1009a608so6695516d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 14:21:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734214879; x=1734819679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XFgyAxvNra4DPanTeeFOl2uaHZeaHsP5CLLrDFBo6ho=;
        b=V620HdKkGHMl/cG9F8k6jZ8WUQ3joEa6+I5ujFW07bImP+HYrVOBqR6n2amOrrLTt3
         UMXOZ3MVqDWMrhyRx1W9ug5slJiH7a7srPfKBUgEMdOZBScitJGNTrmKOLaAotHDIdap
         wOwVIb/MEz0II+43Se8vmQmMB5YtYwh/GhjIHFDsJdLLg8riiwcCcFHFZTomgDS+Irrj
         x7Wk1R+wM6YNGRUPeDW4yqD6LNBaQZtzWC2VKT2bqKw3TQ9DclSkOT0oELXeRMg027fL
         acPDoKECor5UZAdy3f8PfwJc6hP9PHt7VlbOGIVz6J+Bn9wZtuWAxipoboMRHggmKhz2
         mvMw==
X-Forwarded-Encrypted: i=1; AJvYcCWKQaNAYvt+4Y+f/dEJdCynKVsVDhauZlkZNN428nQXmjiNlueum+D7LhxvJU/0+qjceDyqGHA2Ewze/XCm71XI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2bX+UFgaEofxEFNhYwO/gRVVWyfp4AA6gpN8n0tQGWck4mU2c
	L1fjCxq1iaLukW6ftW6S3CNf9pyk104szQ8dTPiSjMkkg+Go7Q+aGpLRCWHJgB90O9WGZOO7IT2
	JlLqlDo3qZlZjEoyVxc4wF9s7Z2gKrqYGYgtG0bTwi0LNjfbhEZMS8OXszk3JZN2+g6NyorOsSA
	==
X-Gm-Gg: ASbGncu5p7SaQjItXoX62K3HjIGZe9SC4/gkCj1OWML0EdO2ztxZkduPp+9/CrYHMng
	XYUruaioVmdO8j095G3/1nvU86E4RLzwxy4WDuIkYM93DA94FD4pvCE0C8VbjfS+PNTRy5ywsg6
	MxGWM1H9IFOm4HRXZ+xJEwqzXD8ZfQqs97Hpr11S0Y0m6bL6+FAONqOCNhf8QgMA66wfzLtrda0
	fdyK6PJX17GAq8FjWSDyccrSoeWKz6TKFSreLnukOQb0f2Pn4i8bdMj6uurVeE6WysFAAS7joUt
	1GOFSedTg8UwPamL+As9G30vCMbI6ZD0p4k=
X-Received: by 2002:a05:622a:190f:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-467a57f6742mr48219451cf.10.1734214879203;
        Sat, 14 Dec 2024 14:21:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbbI0TFGIG9MLv/VjODWxI/PrwN18PfiNaH3L6SpMQngv2rPDHw6DYFqdLdXrWXvc+AGYizA==
X-Received: by 2002:a05:622a:190f:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-467a57f6742mr48219191cf.10.1734214878829;
        Sat, 14 Dec 2024 14:21:18 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ae124asm1383487a12.40.2024.12.14.14.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 14:21:17 -0800 (PST)
Message-ID: <d09097da-a07a-4dfa-9c0d-567b329b64ac@oss.qualcomm.com>
Date: Sat, 14 Dec 2024 23:21:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] Coresight: Add Coresight TMC Control Unit driver
To: Jie Gan <quic_jiegan@quicinc.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20241210031545.3468561-1-quic_jiegan@quicinc.com>
 <20241210031545.3468561-5-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241210031545.3468561-5-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XB_N9xaflrjYvhMMZghA2rR7xT4MlVZ1
X-Proofpoint-GUID: XB_N9xaflrjYvhMMZghA2rR7xT4MlVZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412140185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_142130_827111_7A731600 
X-CRM114-Status: GOOD (  25.89  )
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

On 10.12.2024 4:15 AM, Jie Gan wrote:
> The Coresight TMC Control Unit hosts miscellaneous configuration registers
> which control various features related to TMC ETR sink.
> 
> Based on the trace ID, which is programmed in the related CTCU ATID
> register of a specific ETR, trace data with that trace ID gets into
> the ETR buffer, while other trace data gets dropped.
> 
> Enabling source device sets one bit of the ATID register based on
> source device's trace ID.
> Disabling source device resets the bit according to the source
> device's trace ID.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---

[...]

> +static int __ctcu_set_etr_traceid(struct coresight_device *csdev,
> +				  u8 traceid,
> +				  int port_num,
> +				  bool enable)
> +{
> +	uint32_t atid_offset;
> +	struct ctcu_drvdata *drvdata;
> +	unsigned long flags;
> +	uint32_t reg_offset;
> +	int bit;
> +	uint32_t val;
> +
> +	if (!IS_VALID_CS_TRACE_ID(traceid) || port_num < 0)
> +		return -EINVAL;
> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +	if (IS_ERR_OR_NULL(drvdata))
> +		return -EINVAL;
> +
> +	atid_offset = drvdata->atid_offset[port_num];
> +	if (atid_offset == 0)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&drvdata->spin_lock, flags);

guard(raw_spinlock_irqsave)(&drvdata->spin_lock);

and drop the unlocks

> +	CS_UNLOCK(drvdata->base);
> +
> +	reg_offset = CTCU_ATID_REG_OFFSET(traceid, atid_offset);
> +	bit = CTCU_ATID_REG_BIT(traceid);
> +	if (reg_offset - atid_offset >= CTCU_ATID_REG_SIZE ||
> +	    bit >= CORESIGHT_TRACE_IDS_MAX) {
> +		CS_LOCK(drvdata);
> +		spin_unlock_irqrestore(&drvdata->spin_lock, flags);
> +		return -EINVAL;
> +	}
> +
> +	val = ctcu_readl(drvdata, reg_offset);
> +	if (enable)
> +		val = val | BIT(bit);
> +	else
> +		val = val & ~BIT(bit);
> +	ctcu_writel(drvdata, val, reg_offset);
> +
> +	CS_LOCK(drvdata->base);
> +	spin_unlock_irqrestore(&drvdata->spin_lock, flags);
> +
> +	return 0;
> +}
> +
> +static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
> +{
> +	int port, i;
> +
> +	for (i = 0; i < sink->pdata->nr_outconns; ++i) {
> +		if (sink->pdata->out_conns[i]->dest_dev) {
> +			port = sink->pdata->out_conns[i]->dest_port;
> +			return port;

Return sink->....

> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +/*
> + * ctcu_set_etr_traceid: Retrieve the ATID offset and trace ID.
> + *
> + * Returns 0 indicates success. None-zero result means failure.
> + */
> +static int ctcu_set_etr_traceid(struct coresight_device *csdev,
> +				struct cs_sink_data *sink_data,
> +				bool enable)
> +{
> +	int port_num;
> +
> +	if (!IS_VALID_CS_TRACE_ID(sink_data->traceid) ||
> +	    (csdev == NULL) ||

I'm not sure this can be null by the time it reaches this function

> +	    (sink_data->sink == NULL)) {
> +		dev_dbg(&csdev->dev, "Invalid parameters\n");

dev_err?

> +		return -EINVAL;
> +	}
> +
> +	port_num = ctcu_get_active_port(sink_data->sink, csdev);
> +	if (port_num < 0)
> +		return -EINVAL;
> +
> +	dev_dbg(&csdev->dev, "traceid is %d\n", sink_data->traceid);
> +
> +	return __ctcu_set_etr_traceid(csdev, sink_data->traceid, port_num, enable);
> +}
> +
> +static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
> +		       void *data)
> +{
> +	int ret = 0;

Unnecessary initialization (you instantly overwrite it), also below

> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +
> +	ret = ctcu_set_etr_traceid(csdev, sink_data, true);
> +	if (ret)
> +		dev_dbg(&csdev->dev, "enable data filter failed\n");

Since the this function returns an int, maybe return ctcu_set_etr_traceid()
and let the upper layer throw an error (also for some other functions in this
file)

> +
> +	return 0;
> +}
> +
> +static int ctcu_disable(struct coresight_device *csdev, void *data)
> +{> +	int ret = 0;
> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +
> +	ret = ctcu_set_etr_traceid(csdev, sink_data, false);
> +	if (ret)
> +		dev_dbg(&csdev->dev, "disable data filter failed\n");
> +
> +	return 0;
> +}

[...]

>  enum coresight_dev_subtype_helper {
>  	CORESIGHT_DEV_SUBTYPE_HELPER_CATU,
> -	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI
> +	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI,
> +	CORESIGHT_DEV_SUBTYPE_HELPER_CTCU

Please add a comma here too, so that future additions will be
less noisy


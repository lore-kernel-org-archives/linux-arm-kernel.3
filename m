Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9FAC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 20:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNtoPTL9iStSRPUJKcZJpTJAZ89LqGPt1UmcSw0fFnA=; b=CP5474EYJafnioYYtzyZopQZlR
	jFmIJebPe2ek07JAHO6M6IpGGr8cGpwOTvAP92WLExvw9G2M5E4z2iH4kM7OnISvK5x7ldnbFpHZD
	4eOeM4Vnwp/6gtscGdNsNPFu6A3XaSnUBO6lFwza0IRc5r2VGfnXd5P/I9Xp74/V+30+j4MPOdG5k
	rQx1LDmmW3YhJtA4rHbW6OVn2FrqWP2ZHHBQEUTNEloc3bcpQtZYQucqMrAbfb7obazwrL0cgYrjm
	Aw7SAE9m6GQ3XDjbeeVpUWUoq6r9xvsa60ymC5t3KxU1eXzDlFBQLrxEc5/gzhx7QnWYYcXY3arTk
	8ji3TfOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8PU2-00000000mVS-3Hz2;
	Fri, 25 Apr 2025 20:17:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8PC7-00000000k2I-3A29
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 19:58:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK2UT021918
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 19:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yNtoPTL9iStSRPUJKcZJpTJAZ89LqGPt1UmcSw0fFnA=; b=VarSxdeA3/EhEQIw
	jeR246EZaDYV1+SI5QQprcRxUOoPJbc3Hc3/2oZ4xL+ZC8QPDuHTNgW9NE+304W5
	2HGA3F0RGdBa7iHP/2X0i7wz/usUxxr2MQ9rwx7PFl4pamFHqpdX6Zq82seQy2q2
	ie5nxyukvs/v0N0hubJ2+l4p1lmiY3zfvIUeA+UntZ8RISrNOmaXRNXt1oEAMLQ4
	vzHH+S3/LCszpRDz0FC75Ql0zNY69KY3QFBlz4UvIEQ0nDj6KB/4MTpRhSLn8dhW
	ofqjwAPrW1t/aLR4PBsWhv0ykGQn6eGxSq6QGq+GfU0RquOOFq8NwQra41zhns2L
	rGrM0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5j7bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 19:58:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5530c2e01so11007585a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 12:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745611122; x=1746215922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yNtoPTL9iStSRPUJKcZJpTJAZ89LqGPt1UmcSw0fFnA=;
        b=NbJ6DdZMsDf3naB32LKf4slK/gbRtN6PoL9mWy6QG+8xaTehs2Lt+vxA1irFjrfSbo
         4OdicV8/QPU7aM1PystvL6Gl2ehcSAuUN3dwrzPzNG/um7tEyp/nCsMe5VJZ6iXSVFoP
         t0Bn0EDc/ZorbVAUt+UnCofz8jNwi8GozXj7whX2mZcdM4qosgKjIJGc7Mo5I6XH+eAV
         X80PpKoNay6OQMxfkM6iFXuJ4/NaMzIB2q+CMaFlkuhFsLll04LA4VPUh3MxdNCv09p4
         hPP0UvVdpDg+so4N3fD13mRgdoM9cH/HsKMywRgWvZu8uwpyrAPbLF00DyU7szCPPjff
         PX6A==
X-Forwarded-Encrypted: i=1; AJvYcCUt1bGtNq/hhoLsCIgZhYMAsbr4jkVDEjNDs/yRfUmZKdYejChu16ftnYA9JGX/8At7MIwuyAujHHE9CaypyWTI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw653b0ixy2zPzCR6m7AnWpucJrtSCrFmZw5wwuYXRGzsoL2Roc
	UXXzeSNP3kcjna8LwBMLggfRXgjkRm+gh/D4cnO6UNmgglIqfLMbXt6jDBJSFdQUpv3vcfCcifb
	JmqrpQYOyEHrVwyWDznXH315d2drJudBidygZD1T5jHN1G6PiWuuR81uMLQA1Bb4+4NyzI/Ec6A
	==
X-Gm-Gg: ASbGnct0PVkgQL9HIuSChTmkBNWMzOHGJj0eOelpxzInYhAJguzv0CjZAxQG7HoA+gf
	5T58Yj+Wnd92+9kPDZpyNwT90x2jcVIcbjrKpQFZdutILvpAlAl1Q3YF+wemOhwpE/dOPK57Fc5
	gHnlzF/9vsJ3QwCKtO3bjfMABF+TBblXP+7YPvhPyPnlj2xNQy4BDexXVlEQi88zO88zGvn2Y2i
	9V53gYO4PEMk/GXV8iB7N0z9mccI4AtM/5EK+KPepE1WDHr0IXmhsnoh8H/yI7JPfQm/oKGIZ8O
	hxpHZBJV+Lz1tA+itQTCOpaNIdc9sOv8vuX7yguyL/L1dKaGpWXMM8ff4i2//DQzASI=
X-Received: by 2002:a05:620a:25d4:b0:7c7:a574:94e8 with SMTP id af79cd13be357-7c960723dfamr190180485a.9.1745611121657;
        Fri, 25 Apr 2025 12:58:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs6uTHSx+y7Mx579TQd+STHV6sBZGedNrCyPkLHZ+PRRQmhhsgzyIO4lYzckySewL4JVEITQ==
X-Received: by 2002:a05:620a:25d4:b0:7c7:a574:94e8 with SMTP id af79cd13be357-7c960723dfamr190178485a.9.1745611121304;
        Fri, 25 Apr 2025 12:58:41 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e6efcsm183552366b.44.2025.04.25.12.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:58:40 -0700 (PDT)
Message-ID: <86bc707d-72d7-44f2-b77f-3fa89e25789a@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 21:58:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] coresight: Add coresight QMI driver
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
 <20250424115854.2328190-3-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424115854.2328190-3-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MiBTYWx0ZWRfXzEaIvV/lxe+5 f3HS1Nok2OxJ76NEQcTOHBw2OfWhs0D1YpKkCp9hU1o2TsNs2vvBjH4UGT2/Ts5M0x309/tvj0S RaBRjl+lgWOiTSF9+E28qtfvBnhXAAD7x0qO6Hm0YkBpR1ke+AJDvYlcCFzwB8LriaRrsl5dAa2
 EsAmvpZ/gf6DoxhkRpTjRZB3lC1yHd4x/6o2xCNilfadizXOcxoIo8aC6ph3b6SCqX7EF81CxV8 AXIDoeebBgUrpFvoo6XBFFWaHLR0g/lS5UX9zsGJeBxI6Yu8VctYB6DZPe/kzBVEoDOyxBwt/gN m1ZfbTfuOSCMdMWCsJjpp8zTIXieMXc5J4M26nWHg4nhDZyTcUfz+HbS9BjrIbds5B3jtDyYGQx
 Y+7oFW40DQpGEJdQJdhkv3d6C/h1VDfTqNo/chwEYwCVMll55l9GjzvIzx7MAqCCH+bONhQ9
X-Proofpoint-GUID: wWz9cFrqp7PwiwFOHR6pfiZDDyGRnBGa
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680be972 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=iMEcykrR2jlrdE440VwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wWz9cFrqp7PwiwFOHR6pfiZDDyGRnBGa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_125843_922584_ADC442AE 
X-CRM114-Status: GOOD (  24.40  )
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

On 4/24/25 1:58 PM, Mao Jinlong wrote:
> Coresight QMI driver uses QMI(Qualcomm Messaging Interface) interfaces
> to communicate with remote subsystems. Driver gets the instance id and
> service id from device tree node and init the QMI connections to remote
> subsystems. Send request function is for other coresight drivers to
> communicate with remote subsystems.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---

[...]

> +static int coresight_qmi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = pdev->dev.of_node;
> +	struct device_node *child_node;
> +	int ret;
> +
> +	/**

Two starts means kerneldoc, please use one for a normal multiline comment

> +	 * Get the instance id and service id of the QMI service connection
> +	 * from DT node. Creates QMI handle and register new lookup for each

The first sentence is a bit redundant.

In the second, Creates -> Create for imperative mood

[...]

> +static const struct of_device_id coresight_qmi_match[] = {
> +	{.compatible = "qcom,coresight-qmi"},

Nit: please add a space after { and before }

> +	{}
> +};
> +
> +static struct platform_driver coresight_qmi_driver = {
> +	.probe          = coresight_qmi_probe,
> +	.remove         = coresight_qmi_remove,
> +	.driver         = {
> +		.name   = "coresight-qmi",
> +		.of_match_table = coresight_qmi_match,
> +	},
> +};
> +
> +static int __init coresight_qmi_init(void)
> +{
> +	return platform_driver_register(&coresight_qmi_driver);
> +}
> +module_init(coresight_qmi_init);
> +
> +static void __exit coresight_qmi_exit(void)
> +{
> +	platform_driver_unregister(&coresight_qmi_driver);
> +}
> +module_exit(coresight_qmi_exit);

You can drop the __init and __exit funcs and substitute them
with module_platform_driver()

> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("CoreSight QMI driver");
> diff --git a/drivers/hwtracing/coresight/coresight-qmi.h b/drivers/hwtracing/coresight/coresight-qmi.h
> new file mode 100644
> index 000000000000..1d57e46177b8
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-qmi.h
> @@ -0,0 +1,107 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +#ifndef _CORESIGHT_QMI_H
> +#define _CORESIGHT_QMI_H
> +
> +#include <linux/soc/qcom/qmi.h>
> +
> +#define CORESIGHT_QMI_VERSION			(1)
> +
> +#define CORESIGHT_QMI_SET_ETM_REQ_V01		(0x002C)
> +#define CORESIGHT_QMI_SET_ETM_RESP_V01		(0x002C)
> +
> +#define CORESIGHT_QMI_MAX_MSG_LEN (50)
> +
> +#define TIMEOUT_MS				(10000)

Parentheses around constants are unnecesary

> +
> +/* Qmi data for the QMI connection */
> +struct qmi_data {
> +	u32			qmi_id;
> +	u32			service_id;
> +	struct list_head	node;
> +	struct qmi_handle	handle;
> +	bool			service_connected;
> +	struct sockaddr_qrtr	s_addr;
> +};
> +
> +/**
> + * QMI service IDs

This is not valid kerneldoc, try make W=1

Konrad


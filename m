Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DD8D59F7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 22:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6umwoYj9OreXKl0xzSlbeae+yKTlKkVh5/dhD285sY=; b=MljoNqc8OVuzlpw7LIydKZtiSP
	qGSOhu4+94KmTh/nkeZcRgoenJC9pcUyO+Fws9Ky4JWn+ZpHGSJt7S9k/ZBYjy3YrOP9qeyHJ5kpa
	bxpq+A3ANt5CIUCt86p2WtN9up5zySwn694Dh0k+zuHO7pFggFduKvEuxXqW1F8UcN3Jdfffqv6yu
	PmAhMBUl1AbF9AH/KbEaVYBu9FOtaaob9UT5MEEeL7ivgQ4+hE/qXRqkrG4CrKeCM0rOVcZm6JQh1
	+PUySNC/sB5kMTw+wvLTLNY+uTwgC6Jx/Nsi+d2tq3T1KuA6sNq7WVNw7B6Y2dBO+CseEyW2JNweQ
	f46W1BdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8oOE-00000004uOl-0Fj0;
	Wed, 06 Nov 2024 22:20:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8oMT-00000004twB-2Apc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 22:18:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6AGSmr003817;
	Wed, 6 Nov 2024 22:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y6umwoYj9OreXKl0xzSlbeae+yKTlKkVh5/dhD285sY=; b=C7zBWjkKMfiX6Tju
	b11ykT+vFfcKGfkY1jkQ6k+eWsEzydPEhGQvxcw3bxUnZHY9Lod7tvZ30vjJBsNa
	NMBoxzrQMc0nes4nF+3nkTi6ez7ikI45MjNrHkjy4NAAlw5fwk9Rg5VFZUvnPYTt
	zClpkiG7mDNGKWrP1fF2r8OxPRFJYz0M4Mx6nY9/padiEZy/H3wsyR9Ol1jLxXDZ
	QCy7jCvQZpXMpvjuE12sqRtZ3NO3u48Kb7wLqY/yW/BEwkjoY0uOqLCWlhmdAwTC
	bS2HSez2qaiDX5rPLxLzjuesN7UuCsO9JQwjzaUQeuViS1VuuQXsXFDQFHArHeUp
	V/3k/w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qvg3u8w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 22:18:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A6MIea0022910
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 22:18:40 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 6 Nov 2024
 14:18:39 -0800
Message-ID: <e77acdfe-43b9-a28b-11e4-2ffb481c4078@quicinc.com>
Date: Wed, 6 Nov 2024 15:18:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V4 1/5] dt-bindings: firmware: Document bindings for QCOM
 SCMI Generic Extension
Content-Language: en-US
To: Sibi Sankar <quic_sibis@quicinc.com>, <sudeep.holla@arm.com>,
        <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <conor+dt@kernel.org>, <arm-scmi@vger.kernel.org>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-2-quic_sibis@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241007061023.1978380-2-quic_sibis@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OFrehKGGJi8JVLmM8D5HdD9jI8bRk7oR
X-Proofpoint-GUID: OFrehKGGJi8JVLmM8D5HdD9jI8bRk7oR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 mlxscore=0 spamscore=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_141849_599038_7A55E10B 
X-CRM114-Status: GOOD (  12.68  )
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

On 10/7/2024 12:10 AM, Sibi Sankar wrote:
> diff --git a/include/dt-bindings/firmware/qcom,scmi-memlat.h b/include/dt-bindings/firmware/qcom,scmi-memlat.h
> new file mode 100644
> index 000000000000..7ae8d8d5623b
> --- /dev/null
> +++ b/include/dt-bindings/firmware/qcom,scmi-memlat.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +#ifndef __DT_BINDINGS_QCOM_SCMI_VENDOR_H
> +#define __DT_BINDINGS_QCOM_SCMI_VENDOR

The #define does not match the #ifndef (missing "_H")

> +
> +/* Memory IDs */
> +#define QCOM_MEM_TYPE_DDR	0x0
> +#define QCOM_MEM_TYPE_LLCC	0x1
> +#define QCOM_MEM_TYPE_DDR_QOS	0x2
> +
> +/*
> + * QCOM_MEM_TYPE_DDR_QOS supports the following states.
> + *
> + * %QCOM_DDR_LEVEL_AUTO:	DDR operates with LPM enabled
> + * %QCOM_DDR_LEVEL_PERF:	DDR operates with LPM disabled
> + */
> +#define QCOM_DDR_LEVEL_AUTO	0x0
> +#define QCOM_DDR_LEVEL_PERF	0x1
> +
> +#endif /* __DT_BINDINGS_QCOM_SCMI_VENDOR_H */



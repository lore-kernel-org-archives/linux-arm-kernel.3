Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E67CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 02:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JASlTDQ+qZuxm/AEyyWjcH2QxjTgQBqcBlxVgn/e+JM=; b=lYefbkGghvCIrcGROTjbO6T4LT
	5+2SixPLwe8YbDBYGTfdvEHv/0GX7gBhWsSn4hlXDDcDDkzArXsBu50efXWh9RB0mc2ps9P/+GoKg
	VmFZiy/n2grUDcDEaXRQ/YngzWO5GgenvQplWH7rQbGLKg+2/a5HbeOxxkQ5uOpsdRW0b+dSxxmqU
	pNZTY/HVF+PoUVKtot7ePIqcJ14dRgBbzdGuzOqJI0v7FgbfzKdgPQaQXJ0wcsHx8kD7UPJAaf8dw
	86HWjRHebIC005ObGHTSUc3HMsbC0yS8oAT4Czut9aSjgQFVaPepZMOsVIr72bFCOhTC3GAs0W2ok
	kF7B1GNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyLXN-00000006VWw-0zTy;
	Tue, 16 Sep 2025 02:35:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyLXK-00000006VWQ-13kf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 02:35:19 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FLgjET026727
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 02:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JASlTDQ+qZuxm/AEyyWjcH2QxjTgQBqcBlxVgn/e+JM=; b=U1n1VC/ugsjMH+FR
	TRa/Zp81NWeoR+8v4fb76LnrDsQy/5gxZFzFcEb3X8yySbtfh4JUGpO3UodDKUYc
	Nsrjrl2upDyLuKONmqHtWzZURcUKU+L0CK+npEflmcnDTnAN8a1OlC78KKbBxR5T
	lWasq+r2dJ0gFuskpky3DF0jdCon0FWQeznM9qs2VJJ6jtZCfROyrheNAU0SPqJ3
	l+YLqv+OM5LwIqO1H7lFoUEh3x1HfbeM6lx7Orre+OcSJsa5xVBLTSmBYxq2of/i
	XLjPKBzV5be20h/eOcy69hAr0cztLeyxsyWBRs16vLgDqU0nu5q/NVyP/XDWUrqk
	2+0miA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u570ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 02:35:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4f87c691a7so7696886a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 19:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757990115; x=1758594915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JASlTDQ+qZuxm/AEyyWjcH2QxjTgQBqcBlxVgn/e+JM=;
        b=FLbG4fq/+NdkIyzSlA0a08b/c/kT5z83lQa3sFgHanpxsM0mCti6vDznxhlfVfpnxQ
         2HxL31uUP/u4LaEPOtPjU5ovW6+uhsuLFS6hTkfbtZVwyhTfTir5zSOBoDjkvGxFZZbY
         Pc6/XCeqkk15+cXWWUiTnDDjEHoWlaNn4y10syg1T55WYi0FeBwsEirMmSpxoyrvSO8d
         3IuLzgr5g6Cu+x2asK5YK/aeOhynr3IGWUa3R80e9vgmZD5gRjkJInNrxdTVedNoneR1
         wkBDvcr5uqshaKQX2SG5dfr9LSLETHdLP+L1/WzV6brVDheB/AOO+QjoAPcsT+xfCA6q
         Cr8w==
X-Forwarded-Encrypted: i=1; AJvYcCW5rxjuY0bB8I2FjfvKhJKK4DwneMmtrQMiTESrZTyLeLn6urbxcivgNMpFVwZ38tP8zs30v00ZJYGM5/aklVkn@lists.infradead.org
X-Gm-Message-State: AOJu0YwjyMNP0PZQyqwHMNEaTWgIKqf4Hy6juTzBVv+SMqZ+BVyFwtH0
	17VXlOYGmXuxj1M5lfbMK1KUp3bD7BJnRjWxb7t71BtTNkhiY2+3NHSi1HfcZi5q4kKFF85nIfb
	9onXPMPoKadZbRKhmVG5lFDshHTR2UeMquzU+Nb6sKynzluJaAQeeRWeuowQdFevHu2aJzAU/KS
	SPZQ==
X-Gm-Gg: ASbGncscHOZAwJoJStO1D09TOZcmsBcmb5IdLQlShl2Eg8xA+mHWSaqKfZyg/BvTe/C
	R6UdRC7xCqZfrm8UVrRDshAkSAvLctrtbxlGOTdsJMCSjxjVemwSjMglm6FGmbEIK/UkWy4/rIr
	KXibFh+9gL9FLItOd5aZPKTQ289JNJrinAJs375sF9Py/IYAi3NW66pfRj4KvSsewM+1w29P9lj
	FQVrTfLUUF5ijBffxYxM71d2n974daavgWUT0M2Qr4PSB0jZuT7YkRoHI3r/VmfLxQvxWixQo2k
	RLYVWAvVuOf/6CI1NX1dMvc1h0SVFhOGKetnjEZNaU+QTFP0oW3kkB+V5LlmTikv+GA/4QkcIA7
	XEN3IcBNeQwyXmihiBWS0Z2A6sQZCxoBwHClICHc=
X-Received: by 2002:a05:6a20:7343:b0:250:429b:9e56 with SMTP id adf61e73a8af0-2602a28e319mr18346443637.8.1757990114782;
        Mon, 15 Sep 2025 19:35:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOLGzO215Y1vQ0GPjMPr4AcmObjX2DF8YFcM9ZtdXs0aLfAHkLZ+r8Bv6nCk8Gdo2y2Iny5Q==
X-Received: by 2002:a05:6a20:7343:b0:250:429b:9e56 with SMTP id adf61e73a8af0-2602a28e319mr18346398637.8.1757990114293;
        Mon, 15 Sep 2025 19:35:14 -0700 (PDT)
Received: from [10.133.33.235] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54b5568a82sm9180276a12.34.2025.09.15.19.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 19:35:13 -0700 (PDT)
Message-ID: <f9d3b3ec-dcf1-42ce-b925-70e5543771ed@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 10:35:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] coresight-tnoc: Add support for Interconnect TNOC
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Leo Yan <leo.yan@arm.com>
References: <20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bN2o3FcYnJXnTvacTAHGemRcwW-lr-hr
X-Proofpoint-ORIG-GUID: bN2o3FcYnJXnTvacTAHGemRcwW-lr-hr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfXydOksBmhMiPu
 emgZ1cwg5gsNuXi8pJhbMxUWupIZcPWTHMq7m5mp5eBTBSB7/ox4avfCVPzNbp5qRiFjaT/VpFj
 cEpmMVs1HYnhrYfeBWNwtSFib1qAF3UqIzRrXsO3vzwQGot8RzEKic96xiWMEmU8fWAy1bLucNb
 e3xVrF4jFBh4cHONbqdQB03VyjnQSz95T+bAd68yWjtTosVGjhLrB4qVkxYwYaVx6aInzNGu0Ic
 K0GNsvpDIrHYCaxMjuaP0s7bOFyZKiej3iB59I3NBVm8iG+vERPjMBjbeKrJz+LZ/Atow3H3EMf
 DOZJ5BpNhGKsvNf1ZfxaGdk/l0hCXbmFE3+mWigIF3/yUTUAFhgkzcthcKEai2MDOLkvXoT4wj7
 0g0XMqo+
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c8cce3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Wn57KMgoQ4YZn1JjiAUA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_193518_310023_4A82CF01 
X-CRM114-Status: GOOD (  23.18  )
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

Hi Suzuki,

Could this patch series be applied? Is there anything I need to update?

thanks,
yuanfang.

On 9/1/2025 2:58 PM, Yuanfang Zhang wrote:
> This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
> (Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
> trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
> this block does not support aggregation or ATID assignment.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
> Changes in v4:
> - Fix unintended blank line removals in trace_noc_enable_hw.
> - Link to v3: https://lore.kernel.org/r/20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com
> 
> Changes in v3:
> - Add detail for changes in V2.
> - Remove '#address-cells' and '#size-cells' properties from in-ports field.
> - Fix comment indentation for packet description.
> - Link to v2: https://lore.kernel.org/r/20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com
> 
> Changes in v2:
> - Removed the trailing '|' after the description in qcom,coresight-itnoc.yaml.
> - Dropped the 'select' section from the YAML file.
> - Updated node name to use a more generic naming convention.
> - Removed the 'items' property from the compatible field.
> - Deleted the description for the reg property.
> - Dropped clock-names and adjusted the order of clock-names and clocks.
> - Moved additionalProperties to follow the $ref of out-ports.
> - Change "atid" type from u32 to int, set it as "-EOPNOTSUPP" for non-AMBA device.
> - Link to v1: https://lore.kernel.org/r/20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com
> 
> ---
> Yuanfang Zhang (3):
>       dt-bindings: arm: qcom: Add Coresight Interconnect TNOC
>       coresight-tnoc: add platform driver to support Interconnect TNOC
>       coresight-tnoc: Add runtime PM support for Interconnect TNOC
> 
>  .../bindings/arm/qcom,coresight-itnoc.yaml         |  90 ++++++++++++++
>  drivers/hwtracing/coresight/coresight-tnoc.c       | 136 +++++++++++++++++++--
>  2 files changed, 215 insertions(+), 11 deletions(-)
> ---
> base-commit: 2b52cf338d39d684a1c6af298e8204902c026aca
> change-id: 20250815-itnoc-460273d1b80c
> 
> Best regards,



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7D7C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 14:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAGhhqN4VqHtfbgt2Tbr4gpqwtjyfCZLT6lo8yTUy6A=; b=WnVUmZThXP0jamBJCbhozB3FAB
	B5eVBM4lm3uyAIXj2j6v4IodFV9VCP8PI9KKM4MK9CeiB+l/EAaCvmzb/Ca9xeeuQAVG40kchM2Y7
	zDCzC3NbFOqCe1L/6E3zIUp65YEfQKDi6o50rhGJBXKgAkwCPy3OpXPDunsnPYtT2NUYiUclo5jZm
	n6Y2IKkFpHiRrY/Xm11p7FdDBgoKfjpf8hDKr6947yluf0U8DBGbcGZWmcZ16NGGTIuj/OyXoYwGt
	3YqGWlEASrkCTFqC8K9d7qjmwGoLr8D5/XYD6YlVQXUAzwIGae2QbcSAk108skDQ5EDqYGfoaglNE
	eB/IYlhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYBj-00000006DjI-34Lm;
	Tue, 18 Mar 2025 14:45:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuY4t-00000006CgI-1COT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 14:38:00 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAmYkS010490
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 14:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tAGhhqN4VqHtfbgt2Tbr4gpqwtjyfCZLT6lo8yTUy6A=; b=gIwFQGJenoLrfmKY
	gUUGigyv8Nxbs+7reoenvfxxhzVUPGCKHpp8UpmFblCooYaopFNrMjZzCvSi9SVk
	6Dd+XQ2judMxwpwkb1cJT3BUakr2cUA67/iUK+MGt7DUi1kTr/76VZjlB5BxnV3e
	IWBCZloyBl2a55wHWD4kTPe3omYfoGcaRx3GjGHRxhXIIGMJNISJzN6R6JkG8HZg
	gOfEPpu3jLzIRnhFAG4H26ldYNiXsGZunjHeDqdWxbELol7Udlf07XvQ+lwnbezY
	LVqPrAFfPqekxwXMwKxm4zsQIItcl9DoflvaKnMv5P3oWwIbIGksugKOSLHARDzA
	EYZBkQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exx32718-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 14:37:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4769193d03fso13663531cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 07:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742308677; x=1742913477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAGhhqN4VqHtfbgt2Tbr4gpqwtjyfCZLT6lo8yTUy6A=;
        b=HDge4EKrmWqMQwm++iiPRmZtyhfSAjf9iq2u6956V3Gj9NlQiJDtjaDA/CoUpDU3+f
         vZq7QCMMat5iRkbHMOoZ8zoCwpELiJDvhvTRoD6aWFsfY9bVaL4rj4Xqa+6YhQT0PZ4F
         KT2c3vNpOB4KEGUe4R8UlEub71wzces8p1R5A/8caA1vQyDKgzQPCs0gESR9i/itumq/
         L/3IsmTRiKYTE6PO5gjHqrbCsYb9BaUXQuHNLGbQ/vufta7CATRLrTaM8fGMOZbUSKVj
         OWfM9BHN/qZaPKK3yB7d1ExeGHC7lF+5+vAC1FhR/3Ru8X/bDQrY2+Mvr/a5zRo6RBEm
         p+lw==
X-Forwarded-Encrypted: i=1; AJvYcCXCbCLO65c7jriC81j+gSIQmR5y29mE8TJqzbkePQQocoDG3WIlI2ORJFP5HXv/R4eoMLyHb+ms6vVdRwQAaGAX@lists.infradead.org
X-Gm-Message-State: AOJu0YwNeRyYnYED05r8OiJqK7r8g4uPfT9n5stGGXypsoo4zL6B4O73
	ozcXHF7PUXExe1gmZDk05wmyTMM8YCnoyJQSL967Ww2lOp1KLiHHGY7dxIe0KoSjB4hZUKrMw5o
	cW70o7YmmJYad3ELgBFGXmgC4mmIsvxz3VSzt0YOCSWquOrTEeDdD3NNi2P2DXz6qLC4ceXeKsg
	==
X-Gm-Gg: ASbGnctcpF8qTP0vaxz4FDlRq6VaQZtlGwHiBapGOQxDc6TPYS2i0ZxbBxiVbSlyC/p
	CG4exWbXplDsYYOwDQbQvrFcW4JVawRuCBRlSTODhykP0XnFKWz4kvTdQGbWt8Boz2H+j9U+JVs
	XzL/qn9TVuL8RdLu/mpzn01C6Ty4MaoYgz8THgoXCQK0TvcmX8ynLuxoXgxQdsF+0c0oxSNnHYF
	9QcSfDqDNI6YYBuu8OxPuTdtloANR6vponS1NgKKepqpjK7/zBaqRPEY0BSBoEvRfLC1skpASJS
	ryK1Ed4e3losJvleN1Z17lGNvrgSZL0XW4rk1hkOZFzQG0VcZJcwwqPB14cjpMyJljZ8YQ==
X-Received: by 2002:a05:622a:113:b0:472:17b5:dc3b with SMTP id d75a77b69052e-476c8202f85mr104871761cf.15.1742308677577;
        Tue, 18 Mar 2025 07:37:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu3NI9SHwDJRtRLeM+LYyy91ZTXP2zu1wGYSCx+/R4CBuBs8q75lus1IkTgKetEM2ptDStBQ==
X-Received: by 2002:a05:622a:113:b0:472:17b5:dc3b with SMTP id d75a77b69052e-476c8202f85mr104871391cf.15.1742308677170;
        Tue, 18 Mar 2025 07:37:57 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149ced82sm840656866b.123.2025.03.18.07.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 07:37:56 -0700 (PDT)
Message-ID: <08d0a3ba-9141-4877-84ef-3b16b074b31d@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:37:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] ARM: dts: qcom: apq8064: move replicator out of
 soc node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
 <20250318-fix-nexus-4-v2-10-bcedd1406790@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250318-fix-nexus-4-v2-10-bcedd1406790@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b+uy4sGx c=1 sm=1 tr=0 ts=67d98546 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=X_QOm82O2s3uUHrGAOcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: RS9WJbgXYRVV2i1JT2DOmcccgfXdeJQ9
X-Proofpoint-GUID: RS9WJbgXYRVV2i1JT2DOmcccgfXdeJQ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=873 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_073759_331700_156EB979 
X-CRM114-Status: GOOD (  12.39  )
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

On 3/18/25 2:22 PM, Dmitry Baryshkov wrote:
> The CoreSight static replicator device isn't a part of the system MMIO
> bus, as such it should not be a part of the soc node. Follow the example
> of other platforms and move it out of the soc bus to the top-level (and
> reoder ports to follow alphabetic order).
> 
> Fixes: 7a5c275fd821 ("ARM: dts: qcom: Add apq8064 CoreSight components")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


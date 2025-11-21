Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F19ECFA468
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 08:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JAkezeh/3k5RAgavCGVWo8Iw9IqT2Gh0aroqmSOqUs=; b=BhRyXTukxBhc5Ro7rL1xIXLdm9
	TBPHsqwDGDFjWuBHRLS2LpNz8VFDp8YMIdPzbDBiwwU0grqfD4sbqBfyqeG/eX1+4JAFOizRq+MsU
	Qo98B/7WCFshf0uxVninBq3oK9E7B1fJQic0Wvx8HnHOjeuTXDl0oeigy+4ZSUQXMI80Y7Zlo2sTE
	Jt0BA1styOZX7Rl1P/kiworwNnr7rcQ2OONplM/u+9ioDf3rTvsl9eo7Ks/UYXEc2DTU3mn8MoMzU
	LKkuZoiSaMZWtLdXNnW+UnFw6H7ez2kp/1DeJwMmQayzufKWsO6Rm5ZpZ25esjqTSPT/DkLtHmUnu
	yd0kwZ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMVt-000000084OM-22cL;
	Fri, 21 Nov 2025 08:29:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMVq-000000084Nv-38uK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 08:29:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL7OKGw1390780
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 08:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6JAkezeh/3k5RAgavCGVWo8Iw9IqT2Gh0aroqmSOqUs=; b=G4V0rxOe4Kf/hxrk
	+DlkXKnkNXGBhyddDzZ27sNR35SkgeJmKBJIWMtI28KDYSSsD5EE0gZ8kHwcFGc+
	1SNTUl4zvheloNMwSakynnS96GLeRHjc/r3bXzmyGnSeNCQpq1ddVlDGZft9pmX/
	gc6rYS+90MSaZ2DOPkIWcXdz0D6s4Ppph09OfZmK2h4mV22nwofrMF/aFkT8MzCg
	RG6CRTtJBq6eTE4sHfxOCeVU8PzpJ871LIY5yC874fdyJtEWvDBEGczDhcxxz+39
	xHz7OHTJev8hZhiAwqHOYJTmqbUqppfqWBC1Jd+xb9DVxvX8Txdi/FqsTrE4b9LW
	BF/UIQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajb531j46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 08:29:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b89ee2c1a4so4597068b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 00:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763713741; x=1764318541; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6JAkezeh/3k5RAgavCGVWo8Iw9IqT2Gh0aroqmSOqUs=;
        b=WLqpU1PaYfVGbQp5UNd7wa6hWxSW/kXIxoEWDuMzcrbZArsHs9tWxSnJdnja2GHYgQ
         ar21K2u7KT/sAxkFJ/5jKOSKlSD4jxSc/zkzO4d/pdW3iLThvIjYphLi7N3rz+e8I2dM
         BS+6z4Gpr5IoBVg+ngKR8xzyeaW3ZNd25JjUmOS7XCmnARYV+OfB/5+iPMSmVdMSfU+t
         CxiuPDi2WktGjOs55BS24oAIGKHjle0GsCKGZxOrQ22dgcuGfWmEV0oKhB5T/D0AKhwE
         hp/hbtvhaXJJ2Rxo7o29dldtg87stol+K4ScwqWeeDJgwVxyqC5DVuW4+dGQRwzHtzDv
         M2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763713741; x=1764318541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6JAkezeh/3k5RAgavCGVWo8Iw9IqT2Gh0aroqmSOqUs=;
        b=lAC7cjOYxOeaOae6THEx8LKkHRbivRaTkaOcjD0WMzdqWGwIeEQ1tO28hlSc/eyar3
         H8MIoh6dZ2r5zTFjGciN462ruy08W48knJewZX7BTTdfTutrA0UA5wflTSJOU9/NU2yq
         wjI2J4dcJlMtXBajseZ2ltiQTRTwIVbjgaXH+odeAPd3prrYgWi4siuZSa7vrgbNka++
         XgfIHM4vvW73tHtdqcbRkakmyCavVDSXpW6iYx/Xot9PplVKG9RQpi6jJuAKKiBAEtiD
         k2t4juCGPaleftUDLQfOX8oiSCpPLAzV3By3EMI3KPvF40WUIkerk+vhc9IOoaaCdht6
         PPIA==
X-Forwarded-Encrypted: i=1; AJvYcCWo6kMjiWQUd4hmNLj/XZARpo7B/EfR2SmjI4reNf0Q9IPPnp7MD9xTl4vJyFWTMQvN1DT4mA3HAxuq6gB5QPpa@lists.infradead.org
X-Gm-Message-State: AOJu0YxPxDMWel7L4UjgSXf6IgpoziuVXeXmxIW4d5kLhOpKwOtQhnzh
	s9EGQu2fhehX5XEvvRCIU2Vi0MU4177ZRTWruZx/YR3QgIojyWH6HH4CKNnH6nOqkBDm+fAGd7s
	skPt4UFQzcVHANS6r1eCl84ne5TEBx9dhjpkjkrCwYKN9tELPCpXhjyin3usZQOGsSl4lnrhcE7
	q/nFqmtqC3Iiet
X-Gm-Gg: ASbGncsoKO7DwIbssPZ3IjRukpiaVHCrLUYcbGHJfRooJJXOKqJPYMDxEzI74BtpLyg
	0DNqMAjjhbMFzfyW9uxapPHJUWbl2sN8I9Gmz+TYfiUVn1B5vDa55VoHIaqbjB7j2/Pu/f3pfbz
	pKH8zp50MKio4z6psJxHsIQhZQD1QfX/awBttcFvahLK08DA9zRwpbv7swNnaqVUz4QH1D0Gmm3
	MP7ikXtFahk+UajtLIKFkFkUZFCUutXNiE/sO0tqmI4kGw3ktz2h4amxMbXCIBZ0vwjyTiHhGWU
	h+MczpblYVtAYucOkFYCmgKPcvtJ4Y1Ep421vzat0jHheTl8Lzr9llMZlcqkTmIEvE0qgyxC3Jr
	mQShIsj+cnBz1Cp9SJHKmjDQ7AMfUCXBNcMGhMy/BNV9Io5Wt3ka3hBcdkyCCby2UfLWN6N5CpK
	Y=
X-Received: by 2002:a05:6a21:99aa:b0:35d:e4b2:b389 with SMTP id adf61e73a8af0-36150f3dfc1mr1751911637.58.1763713741247;
        Fri, 21 Nov 2025 00:29:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsQTHVheQgneyCFu0o6wGvg0YfoXoqQafdaNidRDNhqqrHxF19/mhSTPhNIghjCjZh9lcSRQ==
X-Received: by 2002:a05:6a21:99aa:b0:35d:e4b2:b389 with SMTP id adf61e73a8af0-36150f3dfc1mr1751874637.58.1763713740790;
        Fri, 21 Nov 2025 00:29:00 -0800 (PST)
Received: from [10.133.33.178] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd775ccabfdsm4619323a12.29.2025.11.21.00.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 00:29:00 -0800 (PST)
Message-ID: <a2988f95-aee7-4f1a-a35d-049705b0f874@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:28:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] add sysfs nodes to configure TPDA's registers
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8fFjwJqN13YP3IQKRDxyp-mElA3HUHQk
X-Proofpoint-ORIG-GUID: 8fFjwJqN13YP3IQKRDxyp-mElA3HUHQk
X-Authority-Analysis: v=2.4 cv=Wugm8Nfv c=1 sm=1 tr=0 ts=692022ce cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=rf22lFbXz3lptHW25oMA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA2NCBTYWx0ZWRfXyycuMhvMLu7s
 yF/LG0WgGwpnujl+XcgYbow9v8bfLQoEvMlZ65KWfMcygU8l771SXXLlAZIUwxhkwrgc6TGTTyY
 osOOcp/SfdlvhJRbCa1Og5sMxzeHfH0kmE9q1G4NjyAAuCtZs8suMIR3msfJOHTfp4vxVA6Kn/x
 qqu8bCPEOnNetK2forghE41rl6OVPtoUD8yb28VdSBTAY24OXrBABv1fSm9VDwiP55aG44WGa93
 x5makpGiAKsp7C6D+43DtyoPYBma7/a7/w4teZiLDFGvKhh5A+GyQ0edzT/LUBBxhfz6/R/ncXT
 xLICvn/zBIR5oVLPcC1UYD3SJHREL9KQpb3dzuAGyQs10xUdNKaIcoi70l8Q7pB/CGvHfC9pP97
 MTBohjUdtN6oSLraec87EiXMXHI1DA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_002902_813202_88E21078 
X-CRM114-Status: GOOD (  17.63  )
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



On 10/28/2025 10:02 AM, Jie Gan wrote:
> Patchset 1 introduces configuration of the cross-trigger registers with
> appropriate values to enable proper generation of cross-trigger packets.
> 
> Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
> which determines the frequency of ASYNC packet generation. These packets
> assist userspace tools in accurately identifying each valid packet.
> 
> Patchset 3 introduces a sysfs node to initiate a flush request for the
> specific port, forcing the data to synchronize and be transmitted to the
> sink device.


Gentle reminder.


> 
> Changes in V4:
> 1. Document sysfs nodes with correct kernel version and date.
> Link to V3 - https://lore.kernel.org/linux-arm-kernel/20250827105545.7140-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V3:
> 1. Optimizing codes according to James's comment.
> Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Refactoring the code based on James's comment for optimization.
> Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1-jie.gan@oss.qualcomm.com/
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Tao Zhang (3):
>        coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
>        coresight: tpda: add logic to configure TPDA_SYNCR register
>        coresight: tpda: add sysfs node to flush specific port
> 
>   .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  50 ++++
>   drivers/hwtracing/coresight/coresight-tpda.c       | 278 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h       |  33 ++-
>   3 files changed, 360 insertions(+), 1 deletion(-)
> ---
> base-commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
> change-id: 20251028-configure_tpda_reg-f3396f97f9a1
> 
> Best regards,



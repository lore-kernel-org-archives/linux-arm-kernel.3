Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8BFF30937
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhLz5z0Vpfhm4H83owUtlVJk+BAJ6aTwTqUMB6W4aJ0=; b=3vgsljnwtTwuYC8ZrVFa9udZ48
	eEUWooIhO8YMzwN5nwyN3XqLdJ9+jlOMjDGT64qPvXRW0Hr3zRuF+PyOXUNhHHSNSkeqOCjFWiXf9
	3KVYJ5IcmV0gaA8OwAL1kfI9uxjVf594U/pwAFO+bqry1a32is6L0d8iMJEe4hXA7Q4zujAASqB+b
	f0iUp8VAyqncIKJlTmthbR/UiwuYArS24kbRlo/S7m74k+WTrOnsebXgRxbISR99ErbwkLd7MCuSO
	KvA1GVWFYpPUMNdkG4Ez02MxzMJA49G0IGV9hCuokTRzFyVHsUdHm8YTMsSGkEYgi1pfl+ObdPfap
	vh6S3dCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6OF-00000001dFQ-0y4z;
	Thu, 05 Mar 2026 10:57:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6OC-00000001dEp-3As8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:57:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFpSg1517935
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 10:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BhLz5z0Vpfhm4H83owUtlVJk+BAJ6aTwTqUMB6W4aJ0=; b=Tw124HDZ5WZZ+WdD
	NkgiskmJRIVeVUyq0S97hI9IoGIjLrDmq1Hhi4ecL3vL/WXWTkhRn/V51ZU6zlJh
	Yc97hRqYllWyniyNoahXTp0sNtVwO/kcJa+GZxDvo/Slc1dyrYD/+AHtRohAWRSe
	bMQi6SuY1WVpwr9dp3huGaIEoi1dUhOmzbcIfx5yZdInx7koGA0kcarA43qXveFJ
	7xISEjxmNzS0ue2SlfraiB61t0eRl8bLRmgNOG5De0vvvtVVsJcuny4m3rasZevN
	EJgJwPxmQrmlnnzPABhDsiOWLsZVZCwIHN5KjTuTVlXgEoi+bcBUSq7sVx1Xnoe+
	Bp3TCQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuptjdtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 10:57:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb38346fdbso593763785a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 02:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772708227; x=1773313027; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BhLz5z0Vpfhm4H83owUtlVJk+BAJ6aTwTqUMB6W4aJ0=;
        b=g/SoWKJglqOKotCzIuWBec/71nVVODBM8K3oedQavEIW2JeEHSwFceTAkkmjKRAsLM
         mK9QtGDaWZPjyXQpDsvGDKnCO5Rw/+pb6rLLP/RNFwnMCHX+9UAz7uNC+STCvqgvQ4oj
         kUmKfE+aBYDavGwcKf1CM35JEej/0BsDNZ94G3h/mZGhJJrzYuUUjUAdVbp4Nitzgni+
         hSn+Zm2EA1IYk3g2WHE0GpFxB+IAXGRwWryNca927tmpt/d/F6LC9CR7K9p/41Icq2kt
         TRJzM1mwG6TynS/ma1Xc5+LqqcfbUoJIXK6miAkbYpRR4bB7FJlvtjz14cqXLzuSGFXR
         5k+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772708227; x=1773313027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BhLz5z0Vpfhm4H83owUtlVJk+BAJ6aTwTqUMB6W4aJ0=;
        b=QV5FAWxtLiEDIXyQ5OHYfmEvZ5WKuflbDpYSDy+FOzlKg+aJUCYvx3LQ6Nm8K1KAuR
         XpQFBR3upqgxsjRqssdh/sGdEQXIESOIkKyYAzOu28p4wJFk207xPAOSmuFgnS/9AhdS
         Kud95tnjWp/dQAT+V1/cgmafTrMxdG7gqX3Nm2LWFxW5ZDAQTNvubwlvJbWsSq4meljW
         Kj/O9k5KbrZGgR+KSbl1Ibk2G19pe6XDhYF8+GGZStC+hJvcGUF+J+oFMU2gWLhj6Kvc
         oJQox/7t3nwOUzXT06j9M7imKNYO1YnNaHWZUSrBsQezaCpyQK0VHSIJHmkTJG0bvm6y
         c2hA==
X-Forwarded-Encrypted: i=1; AJvYcCUPl/bLly0gGpZ66gyOs5g60AX2NR+qLX8Y3g5cpIqVop+ksG4axuAb/igg8cdATIfld5FPyjtwU5yugxD5HtSN@lists.infradead.org
X-Gm-Message-State: AOJu0YwDk5eD7N3bQ7LqFgo9RnMz8ZWDlJ8HDl0jxQNILk+xN4wC2x4p
	nHbIUyeKC0spKh2V5PvXTk5W3PWTfIbXX4yBXDiFbBVp7XDl3BD2blj2bBNt2SQF/gAPTV6o+iV
	tjA3QFqPekIuAiSsgdt9lSvIULdnOSZ5VRZN1aglBxC0Ua7+yKOjOGR797KSQTsrfSCkS/oGWhT
	/3pA==
X-Gm-Gg: ATEYQzxGXs9955kJznBnlSy3mnSJ5twzWETYBjcVhPpEE8JNn0yKCA9mALW8yrZGrc/
	++EMsIBLCFxSxrW97dj9S9OJjk0TIgbvZEnuR/tRjfiUyQQLeTZiYylpzLxrdy9LwG/OviHvo9I
	HeGqDRG6O4wRIvbMp7jnP+gzpiZKgyFWDhwGLj/zZtGXTTBBHKFvJ5dULzD43bYkhXgFMl6fyGT
	hg8R2vRMoh0/IpcqgqKyvQrsLn0m+dVvef2EAXJ7SvTY/al3ucbod/H3SpcO4cy8bq4lRuG/R/b
	/XAII7V0aTuyf0IzOMhX0p8t+YCDtPXv7Xu/IrHbZB8OOUhpGWXfo9PGG6qnQfiE+EAAsbKd28d
	AAFY+siAjPVXd7+96pCa7rJeTorBlzniWJeJTlIOMLxvmVnXAYhs8x6f5tbHIUGTTvlykPxJkoG
	jv++I=
X-Received: by 2002:a05:620a:3f97:b0:8c6:a719:d16f with SMTP id af79cd13be357-8cd5af1e137mr550341485a.4.1772708227079;
        Thu, 05 Mar 2026 02:57:07 -0800 (PST)
X-Received: by 2002:a05:620a:3f97:b0:8c6:a719:d16f with SMTP id af79cd13be357-8cd5af1e137mr550339785a.4.1772708226576;
        Thu, 05 Mar 2026 02:57:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b94061b1426sm98165166b.2.2026.03.05.02.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:57:05 -0800 (PST)
Message-ID: <686932a7-4070-4d6d-885b-a3dc57e3ecfd@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:57:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 07/10] arm64: dts: qcom: qcm6490: Add psci
 reboot-modes
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-7-cf7d346b8372@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-7-cf7d346b8372@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4OCBTYWx0ZWRfX1orXsQJ0p5VB
 yVE6vC0NpDYWU5YTfp1J5MEQn4FM40cGnNkXDk+82WWNGQMTwgFns4Ec7NeLYuuHLDBGI5NOXsZ
 bM6eiwSUo5dmQA9VLrRLmqpbH15qY4GsvkkqGF5pQD5Rh5P7rlwy2dNKpd6CG+6XpYQt9+hS3JY
 Xjwh54MTwD07ba3QZBfBkDAOSLgSpCYjpb3u1tFyKcpAVbzNOQQ8t7UbnvotmBL2TvW6eFCe3dd
 mkWQLmGrn25DDueKGeq/YP07ibHRauK5zEmJEmXItIA7CDYIsG6YcnNuOgjV1w4T2Qob6HXvjaY
 eHO+UZ1A/zlxSwZwoSiiEIV77Cn5PaaiG4JuvFQbaFTHFCnRa/AOBbzN+A849aVVPjaA/8P5v/b
 dF6JY7P6qK/SUm4iW+4z/eot8sxbMjFztrQTB2/Pz9zV+3/R+4RYfxvyie2bw67SICOVAu1MNzY
 3WzOwVXEDwZCxkefGOw==
X-Proofpoint-ORIG-GUID: x8RHhVdudl4lxV7Jmhz9Ij5U4932DMxr
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a96184 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4wuITOyn1pdjjq_Hru4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: x8RHhVdudl4lxV7Jmhz9Ij5U4932DMxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_025708_814959_59CB1AC2 
X-CRM114-Status: GOOD (  14.46  )
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

On 3/4/26 7:03 PM, Shivendra Pratap wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
> for use by the psci_reboot_mode driver.
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
> 
> Support for these modes is firmware dependent and not available across
> all sc7280 based boards.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


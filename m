Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F520C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 14:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3i/WfiJsCWYWSa50/DOQ09XMPER/DM23N59KdrrCh2s=; b=hT+XYXqzLNicFOmJC7KsNfqBsl
	OHzxWhPrblPYrZCrWnxfPIuSqE1Gw7O5g84u86odozYou8lRG6BQFMa4BkWOotG/li0ynHDxTx5jp
	+tg7yPF23h/3DHlaOCZJrgcWzLmmQjU47Mfe23gL0UKaxYxggiphsVzroyKufNszHodEGHYvLE1bh
	7CUy9rAXokXI9ov/nQ65fqgLmNtgetrDt8G+9HJSmxVHX0rOOGFykhdiHYulL9irF63eUFUcaVHq7
	5ffM02mzTx83kmWKdoafEIcB+t48+0KEliEh0c/xXdW/nMUImS2uw/uBbN3AZ2ye0adzf9su5jU7i
	tzFbZUBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuY6k-00000006D2o-2XPx;
	Tue, 18 Mar 2025 14:39:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuY3r-00000006CUr-2bsX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 14:36:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IBUT7J003334
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 14:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3i/WfiJsCWYWSa50/DOQ09XMPER/DM23N59KdrrCh2s=; b=lCp2FSEZ5VcXhX2I
	U9+rycuZP8W8+f0tpC10IUwXwN8oaI2SUkcDf42s6Qsa/6hPG7UbzNClNmbVZqPQ
	DdNpCBiXqazzByvi1h6fqNio/WY/9nAz7jeESH1yjX0pT+tMYIuNnlloi79EF+A1
	0xTkwZx4vg0/YyuIzFRaAiG9FpZi+6K9a75sPrbgC2yk/vyrEmMP63hiaFnyPjq+
	mWu8EJy6sr75BiAc7ejnCAYQSZtbfnyDyk4uPrUjtsP7fCbIGnh8RUjLiPT+Ydcg
	LKbouWsS/a5X9C7UmDZhw3GrkesBcj6L4f3fvIwwt5r6oZ0/c3vVMEwVPhRTd4EB
	/YpiqQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45f010j1dh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 14:36:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8ff8c9dcfso19295866d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 07:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742308613; x=1742913413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3i/WfiJsCWYWSa50/DOQ09XMPER/DM23N59KdrrCh2s=;
        b=LeWDThkXH5yO25pnxtatp+WSPzFkl9MYtxLNwLVjTYVtOAjt7oq/qOzHPM4ObmqelW
         e6lN0eUESMXFuC9rv3wwk475t0UiQQ+6c+kzAQfl5RI19s7MIreBPpFX0f91zyUV90Es
         qycnN1Z/ISnkCdGiWR7LlrBl8bqVT0VYB17alNvx6DW5JMxPfrBFqaMlcwYgHJOAyUup
         XkIceUWiIPmXiMo53ylD60TcyfWT+/nORxmpqeUPgYGQrH4A7A2X1RSvj3DhgTm1tfp3
         jLvpvCH/7XPuekjfPfQS6P7cogaVgSDICW/RMF56g917t5QqWPHRftD8j5cvC8JhhWqp
         tshw==
X-Forwarded-Encrypted: i=1; AJvYcCWQLZI9IIla2mNhbrU23Rfe+TZ1mZYQbXISngMkTn2xEWzigJM/LdGLJDGBD+CBgSaXBVl4WGF8ZGM1okUUdIVT@lists.infradead.org
X-Gm-Message-State: AOJu0YxnjlnQK14W0Y/CMKpBxQkJdwer+Q9SfSAUHcTiePoKkNofHdNU
	Z2VKYUr8BJkWghwLBVa7wKbSjJg4tyKOrPr4BiY6/sThTT4PHeUl4GChDPsrEMT96hsH2Wr6WW8
	jpt1nGqypmHTrpE7/fCoP+hdh07fzD1b87d0KLrhQ46VS3xGdpyVJ0cjydD469ajcxgoWbi7Cbw
	==
X-Gm-Gg: ASbGncslW0a8KcWycisaXmULHhHFHVzifgRwmwIcMuONsOAhkoi5VwQ5qwkxdQyRtkO
	IxldlK0pOZPXnwWGkXDE+VqA5g+sm6QH7W4u83eZ5FxnJm/WBrFT8Pyr1vZzkboN2loV/Jz2HGO
	bsFPVj21651aA7B/7MUVMoaPMRAkhBWLYx540YhNbC/MOSiZj1yjbTQT+JVvFynEwYSUmiVrLe4
	0MKswDKJ181ZxPyM7BbM0sGysN8hYZSQo/AIB+bQl/VmbHxcWwsn9kA2zg5LyVe3q+7XAZrN8v3
	ZeCgFBn2B4eEgE/pu2lfF6Aw7rakFLgubVidgvKj+dBl5eG1pOYSgnaPmc34Aqef3uTkfA==
X-Received: by 2002:a05:6214:2aad:b0:6e8:98ce:dd75 with SMTP id 6a1803df08f44-6eaeaafd099mr79752926d6.9.1742308613344;
        Tue, 18 Mar 2025 07:36:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH630QmTtlvTyt7LsuCuoPjQARwW1UMfX8DJMZr/yM3CDhlOmPUiz46vASZy9uXmEk0lZZbDA==
X-Received: by 2002:a05:6214:2aad:b0:6e8:98ce:dd75 with SMTP id 6a1803df08f44-6eaeaafd099mr79752666d6.9.1742308613012;
        Tue, 18 Mar 2025 07:36:53 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a40f61sm854429366b.134.2025.03.18.07.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 07:36:52 -0700 (PDT)
Message-ID: <c8b872ed-62fa-4c56-97ac-d01c400d621c@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:36:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/10] ARM: dts: qcom: apq8064: add missing clocks to
 the timer node
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
 <20250318-fix-nexus-4-v2-6-bcedd1406790@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250318-fix-nexus-4-v2-6-bcedd1406790@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: K4_zrvMgS6bGR3VjCIwyK-ghwB1cMqK0
X-Proofpoint-GUID: K4_zrvMgS6bGR3VjCIwyK-ghwB1cMqK0
X-Authority-Analysis: v=2.4 cv=G50cE8k5 c=1 sm=1 tr=0 ts=67d98506 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=Jgmzq8KhWWce1OBKEKoA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=997 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503180107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_073655_669528_E357AC81 
X-CRM114-Status: GOOD (  13.03  )
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

On 3/18/25 2:21 PM, Dmitry Baryshkov wrote:
> In order to fix DT schema warning and describe hardware properly, add
> missing sleep clock to the timer node.
> 
> Fixes: f335b8af4fd5 ("ARM: dts: qcom: Add initial APQ8064 SoC and IFC6410 board device trees")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

This is not strictly related to this patch, but this node/binding:

* clock-frequency seems unused
* "qcom,msm-timer" seems to have never been present in drivers/watchdog,
  arch/arm/mach-qcom or arch/arm/mach-msm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


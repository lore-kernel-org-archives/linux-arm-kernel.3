Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AD5CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 09:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeO4uzQcS7EaU9LOkmxTOiDImu4qwZVUEBZXP8oCHUE=; b=f9AeRSNWI6V7ZDMpCmQZXUX1fi
	yqD285Z7hnk4elU4vmmjVhNF4/gxUY/gKdTWhGaWtDT9sRyh+JRdA3HuoGScLFdJPD1aL4bY8SAUL
	SdCn1I7prvZtMC5UcYhx/APCWEmlKKfSzlMOQ+UkAUfjXA9ySSlqtLXdPq1kORjgYpJ+sI3YOil9i
	8hPknvQ3uA2uu13vemXFURo2ezZU7B/sqTBrCkvM/p2FVf3nkH82Qy7K2KxnKtFd0xnqEaSnHy1I3
	aCOuKNJGq7tSzijTaIlmeC7eL9Pv+I8AekAozXPrxffqmM3qTsGMkhtErC6rWdll9yKTgJPqzuZ1W
	iamNzJKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEuY-00000007B8V-0043;
	Wed, 10 Jun 2026 09:07:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEuV-00000007B7j-1ZHp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 09:07:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iXxI904270
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 09:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GeO4uzQcS7EaU9LOkmxTOiDImu4qwZVUEBZXP8oCHUE=; b=LBPH6WnlVkF8XTV8
	Af+cN0FL1EWATgyiLRLO1rPcY07OlMhw7XYPN/OAyM5V6LGKWMEBxDeE2lB2GUw9
	Jj2kCq/qT7XAqwlF1xBkqop2ziFldUs6IQlmE4q+SE9S/04+/wXToThEgiTc/f7q
	fYRpUYMd0MnTKuaRoq+8UXYvEZ2WNdATFieq9Px4yVqTVTsUiur/Wk1OfJIpCr7O
	D5otzVQIWyiv2msVACw/yoXRnCznMGnXwbbSWH1aKohbiwIBr78vpAMcWddmRdFh
	caogT5mgoGvj1lkAFsYcafaJMrIYxd14e3DrN4Oe9M1LpKE+GwCjpsbSRR+YA+mh
	9oIaBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epuket6kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 09:07:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5177b12d7bbso11716051cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 02:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082462; x=1781687262; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GeO4uzQcS7EaU9LOkmxTOiDImu4qwZVUEBZXP8oCHUE=;
        b=BI1wuHOkdd9EL7MhcZwWACkz6psLNuHJANPbOomJmE7s7bm0Ea+vMm1B1gkLeofaRN
         Vsl/rVAEThfRhd6uvAnOh97GOdDE15f/+ntEYVcDBR6WG47pLM5SGs9QXPA3QsxPGPa1
         FFNf6yrIrsOffavvY4wnQ189UfOguS/8Ypo3od6tiRYrHTifWELc+AeMOBYWesX6BYdv
         QRGDcOkW3D9sEgAKBU/OrDUlAmTnZbiwXlS7ORN2OmdiLStiNL3PdOiFL6zYSClBmpGO
         DTQSlQ7PpPDnKyc7zbbKJnObs4kk7kZzFFDQaFPzzCIziX0zaRAPzLmLqVmfJxZUGgkH
         +d5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082462; x=1781687262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeO4uzQcS7EaU9LOkmxTOiDImu4qwZVUEBZXP8oCHUE=;
        b=e+e6cn5sXP4xGZRNhPSKs9jKCT+fzAK2LciikJ2myNaND78BikV77l15wTwzNb6he7
         iT9mM6lsvfo8sogDOPuOVNglK7PFmx8B1jHisndMWCuwVg1la/uqYjFRgJ9zGJhovmgJ
         UGUFLQCmXy4ubE7nJq+Z4ZB+q9xIORkxZ+HoXAZV34d5PkqoKSPO/MdnU6j9ehZAdS8c
         yBx7py/0r8iUvDwTyaMDoDAni2QLHsY/1I3xV9SLae8XVgD4av3dC5DVSwb4ARqxDyu9
         Qgu47Ce+Dr420W2j2jebZ1w/3P5gCr9hXr0po1XMWP7V4Ixc8ZZKY/QixjSS7zXp5b8e
         HUFg==
X-Forwarded-Encrypted: i=1; AFNElJ+wShzxyueBsVBfFapMejF/u9tRfOVB2wsJwtOlZK3XEFziBWyBrkDskLRn4EGvBfnV3D/fU/GchqMwiLu955ks@lists.infradead.org
X-Gm-Message-State: AOJu0YyjCfXJVGFYYFWg5ov710OCEJ766gMqVZgSeltvXVpyPW61gXRg
	HXYaqIK3mWqG1mDpYuQEqLgt8cr3ybI3kJdJRGzlzKmW6gMHgURuOLIenx4tV/+PNxIbPblXre6
	HrHW7A6gNo4WxUDTVq7zi4iVNMaC6rF/3lax+7c+yIGIrjcan4ym0v1BGZ1LWYN8O0XO2BYzjGW
	LCTA==
X-Gm-Gg: Acq92OEiIVvhCYwxtHcEO1LR3NesPT8JjNSrIj0Oi4mB6q91HanqNHqh5wDJ3rgObPW
	eOIBE4pSpXwrTtJ30YHFE3AeFQzvCUWvPFcsApGVmQrM2I71D0tQo5+pTeQI9HC8LP/yiRKukFA
	33EPhL0x6NVr75HMw28ubD3p+7lRxWOGXrf4jKUG4x3fq8N/7NddDpIldt9lRc4WO+kWlPLYtNw
	UNCt6/HBE7Jc39r1v48797QD/KyjezPS5ssgqDBUlp06LCSjQRcBWF07zZTEj3KG5dPpc1oMl6/
	mz+WlPL5fY0+yVtht8HkOL6lUuAyxXUMR2edd1fFXPfWhE+jIe8iFT0numXdPGCzKV4lLguZPVq
	AIxBSMnTGg/nEbWbG3ZNQ9LjS5cMSkeudSD1bSVbDgvJKf4kEpfEs2XVR
X-Received: by 2002:a05:622a:1809:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-51795958520mr215927921cf.0.1781082461864;
        Wed, 10 Jun 2026 02:07:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1809:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-51795958520mr215927641cf.0.1781082461469;
        Wed, 10 Jun 2026 02:07:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e03709sm1158881866b.30.2026.06.10.02.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:07:40 -0700 (PDT)
Message-ID: <4b53badb-c3e7-4870-8cd8-dcbb4036f0e6@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:07:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: defconfig: Switch Qualcomm SDM845, SM8150
 and SM8250 drivers to modules
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
 <20260609-clk-qcom-defaults-v2-7-0c67c06dca11@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-7-0c67c06dca11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NCBTYWx0ZWRfX5Dnhb/C3Jssc
 mBgKpbw9sRwL+mZ9eGrz1uptbylPRRc9m2tH2sy6Mli+gorYjWSHIZG6Vz+NkVfeV1K2fmxbG3q
 79yHZQJKjqiinb9JMgZqzfg5eulvCI5SDd9a8MRoKsIwkakUk5ndi/jHwbO8y6blAtlcSoqxSSw
 UXqHlDCDFMun4raf9WqQhDqOdfRCLuwTR6kDLpJ2u7PvF8cLyPwL6KJ86vJN7SUkYH3U1vWG2ZQ
 tE+S+uZwi1xKBg35o6LGcCreMAJGjtVBc5LDazPSZVF3hucb6AtrK76w+qZCiOcO787JmmNEre3
 Y9lkVPHHCF3BsfswHlFH0yPXSkk5y1RG7Hz2A5/AddcSgvVD3M09otAa7Y+xLskm5Db/PPgavJp
 vAMuZf18T2GSjeWLodTW7yb6uxVpqUEpYvaDv2W+tA/t+wf/MiTufQQq/9oX5+OyLpgC6tvvVno
 S8rfSv7qnrdC+HHVbaQ==
X-Proofpoint-ORIG-GUID: a03r0IQTRYealsIrffvoE2ClN0MyJfSk
X-Proofpoint-GUID: a03r0IQTRYealsIrffvoE2ClN0MyJfSk
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a29295e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ySCF49DNHzRfUD6l2y4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_020743_534769_8EC8EFB3 
X-CRM114-Status: GOOD (  10.52  )
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

On 6/9/26 5:32 PM, Krzysztof Kozlowski wrote:
> Display, GPU and video clock controllers on Qualcomm SDM845, SM8150 and
> SM8250 SoCs should not be built-in because they are not necessary for
> platform bring-up to shell or even mounting rootfs.  Drop their explicit
> selection in defconfig, relying on defaults which makes them modules.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


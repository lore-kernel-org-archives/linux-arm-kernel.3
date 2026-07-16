Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EA9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 05:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlfvgBp2CUMUGWsfegxHeutfqkwSpENHA/lVll+qXo0=; b=R9JzsA6Vs3HOYoCEaj6PPzNNVJ
	57Ia8N7wVf5k8D6UAHaQ8X8h3JYPNZgk2V0ewSlf0K8GuW9O5uGSCGTFxxzl+dVhXKGo/O9Izw9aZ
	SI716PAvpbQSsqNBPD03+gNKVyTMn2WYBu1iB8AdQhfk665LgZmL88sWw5IynsTVbO8zJYxDHyDMm
	E8FePPvSx5UXvHOH7WEbO/t4u4MLT/EUHcB8ftkjhFb3NqqMm0V2USjCD1chfDlCPE8lRoOkuqbXZ
	jDEBHbZn0gyZie4xnIMV0sqxBqaRnWB+bnCJQLO4FmqfjrhdM5ih6QEKKg6H8PgbpVFE8yy4voLHI
	v0x3yb+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkExq-0000000GURo-3h1q;
	Thu, 16 Jul 2026 05:48:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkExo-0000000GUR6-3SZo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 05:48:54 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wQWW1556115
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 05:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PlfvgBp2CUMUGWsfegxHeutfqkwSpENHA/lVll+qXo0=; b=FMY3yF5NogrymTs0
	jaiHe+HyMVoUo/dQl+KvAsd+Mg+QHsSTO0gvKPripXH1M8IRix781ihlqk9I3hy4
	OqrSHxVU3saAIFBlZ8jORSFoqeJHrf6kmCqyxRrls5T5opcigjDve+pjb4llGPRy
	AB4RVaFw53MkOpF8+VMqNTxZKccBBXRbjHtcE+M8cK5yolyWYTY4OyTFlRUBV0bk
	SOMvb3jcuJC1okl+aF4Le8DnXNy5Dk86fB5bODOKT2dxnuDxGGOiAK33eueQg2tj
	L35X79mzACI8Hauk9ZQseJhJAmdlBOdiSpvq16dhPyPzV1/A3fbNCsJ/DbJnsqjd
	xGzV5Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqj7c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 05:48:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8dc607c8a54so127514696d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 22:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784180931; x=1784785731; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PlfvgBp2CUMUGWsfegxHeutfqkwSpENHA/lVll+qXo0=;
        b=TUn9Gd9qepAkmVz6eJbec0m15+Zf8xW3ogEtc0KQ4iEleUVeYwolCDT+BWFEc3qAb+
         TvxgBqcyD96SzIETTLuq8OEPqD/URzYU6mK5U+sl0ftJtpXuiR4c9uJoM4oU61X5P3fR
         sCUgGiz0tbX/wJQS1FQJE4859w38TXEMrZ28wGHoJxb4MQOEMqdlXTzhFfiuKDDd3ZJe
         etRahJrunKbHmGzzUnFOn4MlidxgnNJht1ACI+2zTeUm+ESEESVA90/58VHHFpEnAc6e
         u/LbzFDjBvkaijcC9qS45/PLoChcGu1q8GhOIYwP35MDQfRmkSx8uMoOOGoo452n/Bxm
         7DOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784180931; x=1784785731;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PlfvgBp2CUMUGWsfegxHeutfqkwSpENHA/lVll+qXo0=;
        b=AO+gG/6XcZOnvAwEfXUEcHkenM/JFBSreOnH1drjfpnXSx57mNMuFwHqfGWRTzl0K9
         0qb2HAFL6qUicsBzOCdnOmVO444YCFGk/jqu3STTwz6y51bvz82hbNnCfZS9fRdh+fie
         AMr3hoq8TJQN2bktX/jmJ1y2WNPymIEjPXV0wvxMPntdVzbr4KB/uu+zXJ+DBD6zKxZJ
         FAxbGFTokFIT2g4V9o35Ihy2SOfJDlyUjaqM8jqqFJkRev0kGnoHz+MlrXUBqmU59/YA
         1OVoLGERMB8x5vjZPaAcMk4ihoRa5K6m2qs7xitv+GOLl7su7DXcB+wLlSUdUm7quwoX
         RJIQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZtuvHoJziqH6VuHeKo3wg0Kkau8R8KXYvNba5jD5/k+kaqAxlgUUqqAeoShx/znFwfX2oSXe5uxJ0Q0LSE5Si@lists.infradead.org
X-Gm-Message-State: AOJu0YyVzmmEwFDOwc/qfzgmjPXqdRjsPk0dKBVV651c2F/OQrXHnBxZ
	7/kPz4xZ8g9Fs+s+gk5YeJHMd+FhBjnDa9G0oKqoiER4iQV+/DSp0sRhejV0n04OllnArYyAw1d
	SfXcOXyZ5qvAR9O+K5zh7Y0vMwBGnxaBDkkTNcg3+qt/SJUQOv4jCMJbD0DUKXDmEuu3/4ACh2M
	cUFA==
X-Gm-Gg: AfdE7cn2o4FNIrBY87GcHXVYtOn0LUccemL9ylkar1RA/syQBt6T9v9HTeYeSItl6la
	pjZzqN359rvbfkGyo6Vzf6me5XLMd4AjQzbJLTmjvkexWyfEnqV0mzIyqULVMN8lYP+yrqQCW3m
	szWpJugubG7HVHXcmQ31B+vuQobdNFXvaOvIuohcGjbHi17WQWA3LLpjZVMTfXoGaGBEnr9sroF
	GhGTKG4vyGa4NBw85y9s7whaY+CMRTDMyxGMYnSDHlwgWIQs7RkB3W3sza8i9lhN42C1XAJp8/E
	noyRTydWKU848NBgVa/kX+OSsBxp2S315EMMIzf5HED0BDVsskguXq+RgxRpKynvnJRUUiyujrx
	yrQrTWADy3J2LpWOsH3EgQr4WHoCmHg==
X-Received: by 2002:a05:622a:28e:b0:51c:7b12:5fd8 with SMTP id d75a77b69052e-51e4f12bb6cmr60374521cf.84.1784180930851;
        Wed, 15 Jul 2026 22:48:50 -0700 (PDT)
X-Received: by 2002:a05:622a:28e:b0:51c:7b12:5fd8 with SMTP id d75a77b69052e-51e4f12bb6cmr60374451cf.84.1784180930455;
        Wed, 15 Jul 2026 22:48:50 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e9ac02sm29699565e9.14.2026.07.15.22.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 22:48:49 -0700 (PDT)
Message-ID: <5a69bb8e-8a06-4678-bf20-f0dbf76f47c4@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 07:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] soc: qcom: Hide all drivers behind selectable menu
To: Julian Braha <julianbraha@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
 <20260711-qcom-soc-kconfig-v2-1-4a907e064281@oss.qualcomm.com>
 <9bb44840-c3fe-4bcd-af2d-149dbc2c7c8c@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9bb44840-c3fe-4bcd-af2d-149dbc2c7c8c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a5870c3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=lK8Tr2M9iWliC4v-rQwA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA1NiBTYWx0ZWRfX/t6xzwwHFG7c
 CZLjH2CpXeM1a6A3WBwKJkiPq3oAdbUOFlaZNhmUO11T7yDeFKEjw0EeH6ZFZD5uUyLsqnHIPLF
 nwXvFtbKUxX0zAx/90VuSUUWD7SBkto=
X-Proofpoint-ORIG-GUID: GvjTgDDk3E9NT69waHOzRBHscNZ-YIiC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA1NiBTYWx0ZWRfXzJazNedg/EK0
 QD0HuPUFzmXpfVox4Qq+pveduPR27/m8g7TwYQQnxHlKZqt9NcrfOCb45TrMxVbGNub/NQA8o6w
 IZWfclC4qOo6P/ykktQ2b0KA9ZTUPtKxBVGapBZXDWSPDxoZdjXIZK9rG2Jg9/oK82QFRcvaMHb
 1dpaat8VZ5UgfR+uZ6HOrgVTXrhrkLOgPoc2WTyiYB8DY36jbg1c9Np15gKKdCYXNAt1GD+Y585
 Wb3EJRRj344VzPQaJ47DwsSw0rXThASujEHjj6Kp2whMTZO2dht0mrTprTBigAs5HJd68zBTJh8
 iBdReNJcvKX/2AHN4sEkCInBnX1yXnzgVa41aS1Bbg8em5i1ghXHabD4hrhuA5jf8PQ0kdMu2Yp
 vJ13v6EZElyGqzDbekVGw3pIdLXfb7WXTbviJ2vnqLSHv1bgnSmW+oA2X6f7to05rCs5zuz5K8z
 /O+gD+im/UacaI9698Q==
X-Proofpoint-GUID: GvjTgDDk3E9NT69waHOzRBHscNZ-YIiC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_224853_025166_0DD0A626 
X-CRM114-Status: GOOD (  13.09  )
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

On 16/07/2026 00:58, Julian Braha wrote:
> Hi Krzysztof,
> 
> On 7/11/26 14:25, Krzysztof Kozlowski wrote:
>> 1. Allow compile testing of QCOM_OCMEM, which previously required
>>    ARCH_QCOM.
>>
>> 2. Hide behind ARCH_QCOM or COMPILE_TEST drivers specific to Qualcomm
>>    which should not be available to other kernel builds:
>>    QCOM_PMIC_PDCHARGER_ULOG, QCOM_PMIC_GLINK, QCOM_SPM and QCOM_PBS.
> 
> I think this patch introduced an unmet dependency:
> 
> WARNING: unmet direct dependencies detected for QCOM_PDR_MSG
>   Depends on [n]: QCOM_SOC [=n]
>   Selected by [y]:
>   - QCOM_PDR_HELPERS [=y] && ARCH_QCOM [=y] && NET [=y]

Can you share the options leading to that? or config? Without
reproduction steps that's really incomplete report.

Best regards,
Krzysztof


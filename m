Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157DAC83F21
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 10:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvkMX/SfCrQy1ThgqRjv/mjGrsXTIeTx9QKU6pkfYrU=; b=iN7Lp6p2ur0OXVwRyyPRgo8BI1
	Y6GfVKElpY9HT1MIpYWxHaSUhzosxG2LmFkjFEpuz+H8eKO6fedOW2o9fYQFVtN7kd4kt9x2gSuGG
	IKwy9tg67F5pVKeF5tMXIimBI0hNaS6Ha2N8P8eUG8gvPIFlkVShFznbcFdGVQzHhpCPEk1Thdfta
	voZJFhing6tu3Hdmj4VhkfbfZyWDKf4R0Swy2mKYb4KXOvyJyHbb+KG+iwhfsss/Jf/zZ1RfscReX
	pR+wyaHQ/J0BbNzIusC2YtVSKwTs+TPyRwMv3XiAVtPMqtTkGX+G8nM846GBbegaIc/R2BlZGD+hv
	kgWPTfSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubGjZ-00000001wzS-0ptZ;
	Mon, 14 Jul 2025 10:48:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubGh5-00000001wQK-1GBF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 10:46:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EA18ko032000
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 10:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NvkMX/SfCrQy1ThgqRjv/mjGrsXTIeTx9QKU6pkfYrU=; b=OjgikyEb1mjfDte1
	wtP/hpabasFr7CEflySVgYGJm5q0nSReES76WtUDsAjuVaGWqBaidYYc+ixjFAyW
	B1c+hS+/h5RiQtj9mbC1P/SNWh13uGAsktQ+25BjHlJO2Yp713g1b5IHML/EBtSm
	7GzjdcMCTjs4eqzESvGMBglzsukbovmXSYVcRUR95hJqGozKR0o4Tq+VKiIzkcFL
	d2fSI2y5SYSoWoqem9sJnwPZTiCFACI19+lhnsk1Jfkwn0Ld6LVvaYjNUlAeoL8U
	XKNcKYWWEsO5Gslfhw/4ku1cVVXMLjTp13cMhyuFWE+l4Q/IgOCH250QMqJZNIJm
	+gON1w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugvmvdj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 10:45:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab77393308so1040061cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 03:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752489957; x=1753094757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NvkMX/SfCrQy1ThgqRjv/mjGrsXTIeTx9QKU6pkfYrU=;
        b=MC7xOSOzrpj6NWBAjpvfvRY7dyx2onQLd4xlws4Il3U29GjyPh6fgZVnVcLG9G8Q//
         FDwfbBKZKq2RfDrG6t01bIXOqD0LYx373/nH8qRO6WCSSOBKIwO9RjcUAYkFCvWons88
         0BpfaSlpwEuJrNiyCiOHxL3k4coROtJIWTaN24IjLq8sAmRXZChWwq63z6a9+FjmNpEH
         C8AVdT/GJbNltQVEtbhRceXwFXLxo7rlSJwA1tms8Tij6aixiI80bhPglq9XMQ+AGLAq
         LuH5az1P/6LIE5QbBMRbmP332/bj85WHG9bZP7JW239B3Z6yBIXlD0IsSb9wilthE9z3
         MZEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVROCyt5mx9OLZo0RZTDPjMdRC1dbjCKIN/vnED8DT5u6+AFX1blBW8p1F2ektV+hewo2MWVD9nN0/0K4az5FvH@lists.infradead.org
X-Gm-Message-State: AOJu0YzJwL6t5liNAXM3m4T6uyp9zH+bDMAO9E1P9dE8xuTtWQNRvj0A
	FlXObBFKUawNy+APmTd9P2yKbzFoh95rn5uoBfIHoFLV0fZWn+L5n77gAR0K22tmrah3dY5hwtv
	rbAKs9Sh478tiPTKxlCGyKQvs6B2V+cFITdWif+b720YpfB3jnZj5/d9u38Fa+6u/JpENezDf5T
	WNSQ==
X-Gm-Gg: ASbGncuRFCFwV/5f1TORaDRFKTGnh1Zg0VqOSq54VaB3cOTRre39ukBZvZkMqioIKCA
	KYrwt1LrT+jmBiE/09557ENkj1OM2Xeb0r9+Y9zcOLvoqjkeikRQdtduh7H0KlneNMG0b+6KqO7
	SPgMcCUk7kZ9GxIDMAiPSMzcCjmTUCAkbQ/TkbN6uuZPMyxRJGxITe3/DeHoMNyM7fE2OttMght
	mfcqK9ximYMNMPg9GCS4ie2O46Ijg613s0UBh3UuAxi88IYGBNAnmEsrrv7L5EwQY52+wF8mxZD
	kMytVK4vnz2rsfES+RB2ksrGyaGUw8qZ7xn1hgwGZnWyliUKM6ol5r40UqOkSpvTnFWK7NC1/I+
	eGMGEhb1gDHTFKvledC1N
X-Received: by 2002:a05:622a:2308:b0:4a9:a2d2:5cd5 with SMTP id d75a77b69052e-4a9fb85981emr61407331cf.6.1752489957173;
        Mon, 14 Jul 2025 03:45:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELfiE1hbm9W21cfQCQReZLaomvmcfube3hO9vSP/hdiOgPjCPkHWjuKc+mXLxmKJJITonrVA==
X-Received: by 2002:a05:622a:2308:b0:4a9:a2d2:5cd5 with SMTP id d75a77b69052e-4a9fb85981emr61406911cf.6.1752489956642;
        Mon, 14 Jul 2025 03:45:56 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294c15sm803864866b.117.2025.07.14.03.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 03:45:56 -0700 (PDT)
Message-ID: <e2b92065-e495-465c-957c-ac10db8fec09@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 12:45:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] arm64: dts: qcom: pm8550vs: Disable different
 PMIC SIDs by default
To: Luca Weiss <luca.weiss@fairphone.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-13-e8f9a789505b@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-13-e8f9a789505b@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: s0hxuxRdBD7T6cmcpWoO1xaQreylJcdn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA2MyBTYWx0ZWRfX+eoTL0Ya8+id
 SfMg9nfZo3sdH7+ZgQz7+8a2NXpuG++R9YrFJMCr7JodVXCpw73IQ5CZehx8MhMH7ZMEGHePfgB
 WOVEpOAZ4ajbaT4/MiAaK08QbtAnPIuTv0kYooep0XvWoGjKVq4cNC2Ag5VgfXbKsqAEq5aRkcD
 uXgmFDOPPtbsSkKSV2nuryZdiPzRdDJ92sj+6BN5cEVxrtD4kbmn/lwQudnJv22K9EtFx5jRCXO
 6PnDGKgaUMmm2oWHZTNhpxx7aRF1S/0MjnTAh835bRxZ4FvQaTgJIwABkIAW/GFNXX10nqqJxAJ
 7SJ21uuEGss7etMSi8Zdv5IglqZiNx9OJrtDBDy5cvho5lriXZqN+1WlIYIs7H7e+w1dpzFW+YU
 a/MrD6/53k+LID+Trzermbq9cekX9KoAm8EsNcTnbXsyagnhkyDp/xCU7KG7iI1aD7mONIJ7
X-Proofpoint-ORIG-GUID: s0hxuxRdBD7T6cmcpWoO1xaQreylJcdn
X-Authority-Analysis: v=2.4 cv=C4fpyRP+ c=1 sm=1 tr=0 ts=6874dfe6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=yhMgBbtfkmf45w4ReXcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=747 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_034559_347334_C65CD7F9 
X-CRM114-Status: GOOD (  16.91  )
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

On 7/13/25 10:05 AM, Luca Weiss wrote:
> Keep the different PMIC definitions in pm8550vs.dtsi disabled by
> default, and only enable them in boards explicitly.
> 
> This allows to support boards better which only have pm8550vs_c, like
> the Milos/SM7635-based Fairphone (Gen. 6).
> 
> Note: I assume that at least some of these devices with PM8550VS also
> don't have _c, _d, _e and _g, but this patch is keeping the resulting
> devicetree the same as before this change, disabling them on boards that
> don't actually have those is out of scope for this patch.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


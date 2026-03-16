Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAB2F30296
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 01:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Chyyx58qykqbbM/NbZozHdwyy5DiINB753rlDMdCFiQ=; b=ICGmtd/n2aaUTIYgsWeE6ljnWZ
	OVbH5x2KBcLit9G6Cui2fEtu3+154gS22wY3FkF0gPFKe/SmQTQ47DcTuEMFgcjYCm3Bk+/b3KKfd
	4A7ReruIWZQsjZIbrzmubfObs9tYRqKaCRk4UwUR5p0aUwfOQsBcLpQP41riKri3zdhg7YbQSRQZv
	2bK3MzCAkqlhMi3A0qaFmzLGayMwhghA2CTrFfkjqwvoZP5NrRC4pVhGDf4Q3SirdxUe4YYvh8lbH
	nfoPmQv+ZPQWovvOr/g0NdoZBZWYVOzkedy1uyCQ1YgLX+GJWQfgsW4om9wEimVBMcOfDJCBsMcx/
	TrVvj1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1x6y-000000039AV-3lyN;
	Mon, 16 Mar 2026 01:51:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1x6t-000000039A3-2vum
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 01:51:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FJG1hX1317856
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 01:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Chyyx58qykqbbM/NbZozHdwyy5DiINB753rlDMdCFiQ=; b=d5jdMSAiK1ZVC3fW
	KFGxhPCctBEy6wMCuUwn7ht6XPH+scXsUC6K7IQfytA1Sglu5pl0HaMuAqYQpLMN
	Dn5zupR57+35iFOHcAVqW9BS4qclpaZsSQ0t2qsEwHzu+f9rg69+IGs1SbouRl36
	SV5Cffnrm1v3Vohjs8NY2nfuLq7g4mdlx/LhrA65LkjEt44+1rfku4lkyDOTKLfM
	S6SGDuI5n2iCHRU0rLWgduEe7NOci7YcuT0ZsKt32ZoYyhsJ1P8C/bycb6jiH0KB
	IzuP/Dd34PP+9SmkQ9zOWL6iMrid+C0RFe2RTkIE3Xusa4JiVJQ3tu0oOgcLwTff
	9+I61A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xkrvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 01:51:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c739120475fso2372131a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 18:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773625869; x=1774230669; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Chyyx58qykqbbM/NbZozHdwyy5DiINB753rlDMdCFiQ=;
        b=fO9xgHi8UukcsiYMagkqH4Mzv0U75bmntOVhZRgq2ir9x1I9yLR95KQEQGSmVMu84K
         ggRKju7nH550ZNb2UfmjmWTKh1sZ/L7AEMB/Ojg3qEkTiW67k8PkWNoSlxQfoAchsovz
         rjTEquCaV6vSpnX+hcgDQGqPtw25ZfdGH7sYH3mBXRb8gy/6aG0cKuMBo8MWtAlBbeD7
         n1jtkanQNGzTKvdQza9mQJxlcSG64Xz3eUNMN05DiNzmmgVPamZ57upbs51OgvQREe92
         Rhyn4jOaFKCB1F/yRyD9VJUlV1WwXUYnaaB8JIM5Bt8hRaGp9xLfhcPRAbI1WqGTjI03
         ap7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773625869; x=1774230669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Chyyx58qykqbbM/NbZozHdwyy5DiINB753rlDMdCFiQ=;
        b=Li2nfr5EOvTYoKN7mJTHjjJR4qdpbARM+kYUpI8fqpAIx1eYMei/596gbIZZPakalB
         Ow1/kt18kJd0fuQPkXIijlqub6t7g82QhnNn/+SB+Sxswn4QP4UoRTIiUFAVnoPLr507
         y5TxMZKRiOxIfoDvLRHA7H5+Yb1QkSp1o0HgBA/oX9gER4cSXNpLFdeAPVzb2hVIaaB8
         A//ICUQcZ2P9Od3QgwvRvjMyZI5YM+0vVG3A0O8yU7eMbMez5yqG054VU4w/Hspi0tqJ
         y7NWaL5eG4ojqzFA2y6UF+8HWnvks33xAVQLf39jffBpl+s4uURHGQNZco1Nwgic84Rf
         Yk3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxjB/A1fCo5pcq0AO4ymgMxiQMhFc1f9gVhZ6I4hfJqW/+HFgIu+829PGUya5DMLHbn4Fp4W7sfBYGupJggFRw@lists.infradead.org
X-Gm-Message-State: AOJu0YwoG7g7aNk9bbMqPW6+0XDItwEP6NQ4yqveCQnfcg0TB8I1EBQ+
	kbVxqsVYkvvZHDRQTgf89cMEgF9KQe75XlSj+kTIxGM9p5zhaFjWqtW7kU5idu0MJ6FFuxqRv9V
	V6nkDFT0FqHcP4tT/0OZi5m3J9LlR6jfaGuckxUZ5hAx4GNWmVPOg+uzwiLoyQKaZt+W+ziLJG8
	KaVqhTojZKTw==
X-Gm-Gg: ATEYQzxFakB7DMz8X30hBX3nnrz8iFo4uT0ZtLl+jUfa0sBqWjPLAkxjNWG1m+gxxm0
	Gt82qo1Xrr1Xf9jIVSenuli8WkPqwYkKGTJFvqSPKipf8SCK3YYbUiUhmU53F0Baw2/OPSYza8j
	fEGtPggL1j3ZHTd+JwbuBRTUAIE4z16Pc3+46J+a4FsDyDtiYI9MBkft3teJlzANneBZmv/IbTX
	z+9rtdNovwvlyZn/Ly9/ov+9icpzKKrmTzofVFFGJ7gXmLPN9bMVW56loH+KLEmekgBwLolmlxc
	HKcSL/Ul+oYq8mpfDFm2F5Vnvo18QUOaDnHNzNZAqV5e6mZv9E80/0ViVAHs4+d14jy+v9d/OIt
	brjz4EtO60RgkMRzFH4bUniU4vOtnR/vxY30s09TS4CY+sOTXYKdo3Yglt08Xp1o3COZTL+e7oR
	gFzKRiKXPYvaI=
X-Received: by 2002:a05:6a20:3d83:b0:398:6461:6879 with SMTP id adf61e73a8af0-398ecd9770fmr10646406637.57.1773625868617;
        Sun, 15 Mar 2026 18:51:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d83:b0:398:6461:6879 with SMTP id adf61e73a8af0-398ecd9770fmr10646372637.57.1773625868109;
        Sun, 15 Mar 2026 18:51:08 -0700 (PDT)
Received: from [10.133.33.137] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7402214f21sm2046131a12.30.2026.03.15.18.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 18:51:07 -0700 (PDT)
Message-ID: <80b8ef5f-95e6-4c02-8a5a-07295d0ebaf2@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 09:51:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAxMyBTYWx0ZWRfXzjrTCpzqHgp+
 +b/EhEG+/6smxBQ3/Q4pnzJXpL215bR5umNqomOLFlzMEtkNRap/tanX0O+uhDvDmw2KeDxm9U1
 cUoUwy3gTtoT/vOGT8A7wavuT+F1imetlm5H14lwlzeuEjXgQdXWQQa3L7FzyG37TRUqUBiUFBl
 nzWVNq/NBTrLF9jE6UB6OY/7kFEN5pyiDHs7DuLIULpU2HORCM2baCH+lhlz/CQCy3Eqt39+rhi
 YrAsSZQRNZp256Jlg9wMcYkZU3KJ38YYMr6PDyD8N9r1rGn4dTkmksOGvmeaw1WsuB2nvZWWWYs
 6es2YTrepMO67OEPKbHOfUQfTVBYveVnHTYR9/yFcJtAPrLC3gaIZBlfZR3fpL3/QufKEvqSbCN
 pUMQficbLckrnNtm6LZYS4Q8RKAO5XBY+g6y9NSpvob9j6mTcF0+c8um7ioLGUFZrE11LF4Mm9c
 wLZcpeBP3PY0pmJSi7A==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b7620d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=nTQ8HVyESOUA6E9D-IoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: JLYThBQ7kIwEsUkPDP9fsHxC6csliUNI
X-Proofpoint-GUID: JLYThBQ7kIwEsUkPDP9fsHxC6csliUNI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_185111_863233_AE0633F7 
X-CRM114-Status: GOOD (  20.36  )
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



On 2/27/2026 6:10 PM, Suzuki K Poulose wrote:
> Hello,
> 
> 
> On 04/02/2026 02:22, Jie Gan wrote:
>> The DT‑binding patch adds platform‑specific compatibles for the
>> CTCU device, and the following Qualcomm platforms are included:
>> Kaanapali
>> Pakala(sm8750)
>> Hamoa(x1e80100)
>> Glymur
> 
> Given this is predominantly DTS changes, and there is very low chances
> of a conflict with the binding yaml change, I would recommend this to go
> via soc or the qcom platform tree.
> 
> For the series:
> 
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 

Gentle ping.


> 
>>
>> Since the base Coresight DT patches for the Kaanapali and Glymur
>> platforms have not yet been applied, I created DT patches only
>> for the Pakala and Hamoa platforms. I will submit the Kaanapali
>> and Glymur patches once their corresponding base Coresight DT patches
>> are merged.
>>
>> The Hamoa‑related patches were posted in a separate email, and I
>> have included them in the current patch series.
>>
>> Link to the previous Hamoa patch series:
>> https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa- 
>> v2-0-cdb3a18753aa@oss.qualcomm.com/
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> - change back to the numeric compatible from hamoa to x1e80100.
>> - Link to v2: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>> v2-0-aacc7bd7eccb@oss.qualcomm.com
>>
>> Changes in v2:
>> - change back to the numeric compatible from pakala to sm8750.
>> - Link to v1: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>> v1-0-a5371a2ec2b8@oss.qualcomm.com
>>
>> ---
>> Jie Gan (3):
>>        dt-binding: document QCOM platforms for CTCU device
>>        arm64: dts: qcom: hamoa: enable ETR and CTCU devices
>>        arm64: dts: qcom: sm8750: enable ETR and CTCU devices
>>
>>   .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 +++++++++++ 
>> +++++++-
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 +++++++++++ 
>> ++++++++++
>>   3 files changed, 340 insertions(+), 1 deletion(-)
>> ---
>> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
>> change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d
>>
>> Best regards,
> 



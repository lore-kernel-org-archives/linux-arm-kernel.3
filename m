Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAF0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2ckU9DLLAn5LdB48ZpPiIGBrsJhbpkMqNXUETVARFk=; b=eZTBsbHo36mWwm8+jaMT4pVvxW
	PWG+L3HuXR0ofpbhP1mtp7aYzzJyrgqo9Vbl6BBwgrXWdzCNrXYIXGrR2fHPXmJH4lRYMUeFfPo9R
	v0Tuov1e6xq9gwKn0d/NHQEq4r4OtfguHQ4wv6ugkQ2SAhERvDgpCL+OggzXdXZ+PGdSc43JeOxmG
	YBsu6KABDLsSFqbtpTqw2xhqMgbFZKF+EUaboklgPMW5jJB3ZfSJTxB2tzf8wvqssU8F59fJDt5Ub
	q4hlWmmzxQOEpqqutqCaG5DzA/BPGcnyYJZZefoG64BqWarwLhQbof6uwh3SnJ0QhF8LqQ88Vrdgt
	XacFDXAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepBc-00000000sdz-3lRG;
	Wed, 01 Jul 2026 07:16:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepBZ-00000000sdX-3g9s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 07:16:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lXKF137160
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 07:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X2ckU9DLLAn5LdB48ZpPiIGBrsJhbpkMqNXUETVARFk=; b=jMSYWtB0xETMBELT
	d64Ood69eVceW3Vdxt15j4LqwyEWsYWoqWGnw8R8F3TaAsahMnkJpT0NQUQ0AEus
	1JCqvf0I1ceGHvNYvCLZ8mrj1efo61wSNHxLloP6QB1fhM7vE55E7FCAEWZBFcEd
	tDmI1ZWCU0iqq+9OxAKA9jXigt6WYrT3SjqPhDriM5WQUYsuAkqH6Tgo+60QKiTY
	sGK0oTdchz71fs1Z86+9eXNvGy1maMuHcu1RQbiH9WeE4j203/excc66O68+3gWM
	xlj5uaye/sN1G6ksa00MQzR+Vh3zSFGbx5Wy7wqwOctaVl2hD6CDVicZIOv/5ja3
	+powzQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0aud51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 07:16:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so1093831a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 00:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782890200; x=1783495000; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X2ckU9DLLAn5LdB48ZpPiIGBrsJhbpkMqNXUETVARFk=;
        b=geR4xvH0IabePqFsw54mEu4vjtTHHZkNzHYmbx2cESCkOPPfUBTYO2lCK2zDOU4QDb
         2pI0SDeTGvdjV2VUvi8uYKjF2B+XysxCjAdt3M7tk+F4H5pKMVlOmPNS8O7quSXyjdCo
         dTBbAp63s9EI6cZh2OyL1lBZcw6NL9M95cEix0ofL/Bsqbpxyuv5ITLAVBt3ir8irfb0
         ndxlpWGaoucAil7mnMim+Vyq4P9Q8HrNXHHaBxpr/qorIt8z8S7HsNS5LG3GuPmxyYsq
         vbsIKoQfYoQZKOvZZGFP3X2vjmj7QacR8TE6m5sgwfrICUNy7ed/LIDmPs+e2PVFZB1r
         S3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782890200; x=1783495000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2ckU9DLLAn5LdB48ZpPiIGBrsJhbpkMqNXUETVARFk=;
        b=eR+KbuDnbLNHcC72uN/TGrm2x4XXpJEyJdiBu8LVYof2aB/aiLw3DfgDAgMmlMDqsj
         dtl9m/ZNOufWWGePJQ7RMwDI8b7T2/O7cK35JF67dp5WB++mmGg0CY79mdIlwYiilCaB
         /Sw4vQdrINqWrIoEq/eMejlY9lXjgM5UTlPzNbGilZsg4hQeALbO2ODuutLDex1XV0rJ
         tRmblCrQOu3n30EOprhr67oKz1kinfuhUO5SXMs1Di08S/0/evuo+agcbZW+uTP6Wcj4
         Mzw7mWmGqGVH5TeYFcFup6D12xE/cT7YeKZ8/3YaFUv6D8Wd/3bUo91zkTiigVbZ1a+E
         ytoA==
X-Forwarded-Encrypted: i=1; AHgh+RoSCoCK/W3LGF8iNWTMdQGtxOnrECqvbwJS9CCSy7fxg5JHDn9+gSJusMSo8viOMk5GdjV+6U7c8fnD+DdBlg6m@lists.infradead.org
X-Gm-Message-State: AOJu0YxM8ZZ9m7hMDKMED2OtJanvhDO8jI9EeOatyEZAuDYSni+LQmp4
	orOVoBZyUBd6bfXBQ/z0TUXzUQ0ZqNK82GHxznlpkEQcSNhJ3Ohz3EC73Ol0oYa7eNQ+jiEC1Hk
	3ahDc9hN6o4ho6nRcr7NgMRSqJKGAoGk9snVXqCN61AnJjzfSYWsLDOKgODLaX0AwXLswMYgcOR
	7/Wg==
X-Gm-Gg: AfdE7cnC8Y/dsu0DXqB+gMtDz5CuySZHQ+vUQ+qk58lbNEeDGMfHO/HKVI6HwK/U1hm
	CQZ/vrKm433bhVnVUBmMsnhEMMT4KeOsliL115Eynk+JvWz24k/lft9Fy4lgrey+XDFnG6YOT1/
	UDBQokaRCq0Tc0+aE7jKr25biUjnFHFyfDGncKkYzbTjz3KForvd5NiRX/AUzvmL0docQs+Kvd5
	IjJ/JfYNMgtYXy3t0kxoaVcW155m3ZI7Grq3Z7gb+6n7H6s7C8l5UI9EBmNS2RcoS9JM3VuarsK
	InLn1IpnJ8Np+hUqtoqu6gU12qEmiKJv5JSUFew1xze/rn/0GMFyRQCJ4S3glnOOyUKVqyLwCq8
	HES84BXE6g4EEksYY46EmRvy77JGOhQzZN0VGFSHolRCm3OboWB2LvFkMwFpTcTiwzDvpdvvqll
	Q=
X-Received: by 2002:a17:90b:1d49:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-380674340d2mr4032522a91.4.1782890199813;
        Wed, 01 Jul 2026 00:16:39 -0700 (PDT)
X-Received: by 2002:a17:90b:1d49:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-380674340d2mr4032489a91.4.1782890199337;
        Wed, 01 Jul 2026 00:16:39 -0700 (PDT)
Received: from [10.133.33.76] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbcd9f5acsm2795438a12.10.2026.07.01.00.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 00:16:38 -0700 (PDT)
Message-ID: <4117c406-0d75-4eb1-842e-1d346b7fbf99@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:16:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
 <20260701-stirring-piculet-of-vastness-a361e5@quoll>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260701-stirring-piculet-of-vastness-a361e5@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a44bed8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=GqxzKewt3drvE_C864MA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: U3rHBDOQQ3Bwp1Ythl1NF0eaDW5Lrm3E
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3MyBTYWx0ZWRfX/NK4BdqBsxlV
 gRZe8n3hAjM3qk+5jAy9gubPqOWAQQtFQzrvGcF19VO8x792FWy2nT1ZDp/MNLL9PXlYE6JUaD2
 iV7h0pOvkCALzRBwj/cb+eeNa3T1f+U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3MyBTYWx0ZWRfX5uYmnbhNgt4U
 CHGeOafaiUtNwTXw/gOK6ZVU7v24FU2IBeDjMD23NtfT8hPgKtoAw1XP9Ln5TdOFyxuvVRniPlW
 t0qgmOAlRzjcIV02CLs9Y1p6i7/NfbBD3wDxbqmPG4XC87leJYwmIP6L6KgYskMhFIP6CaDYGyD
 aMr4WChQsfb4uqzmn2RLAWKUMcGRug+I3kzPKoc5z5lWxhD5RuwtxSF0NAdCq5uNpy9iNMKvH+S
 vaJds0qCQol7SNohQJTO7szela5aPgLZUJwchPB4qVPeTavQC0zgLJwILFXxynBmXHC9H1nq32J
 2StbiQpEhh4augYu5G2JZuwJmLumao/n1CqN+mc8x2TsYYcSrGCc8Z1HymMkv9JnK2uuXd6o5JV
 jlVE1dVh/zKq+WLvG9sD8jvjZfWQRSBz2t6tTHSghs3Q5CYLWLN07P7qILcEd6ETeweh8lw2Sxs
 zUcbcofiEr4AcW8vklg==
X-Proofpoint-GUID: U3rHBDOQQ3Bwp1Ythl1NF0eaDW5Lrm3E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_001642_038736_F9C6A7F0 
X-CRM114-Status: GOOD (  22.49  )
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



On 7/1/2026 2:57 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
>> The TNOC compatible previously only allowed the two-string AMBA form
>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>> AMBA bus.
>>
>> Convert the compatible to a oneOf and add a standalone
>> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
>> standalone string carries no "arm,primecell" entry, so the device is
>> created on the platform bus instead of the AMBA bus.
> 
> That's a Linux driver specific reason, so not a valid one.
> 
> Describe the hardware instead.
> 
> Also, you do not get other compatible for the same device.

The device is intended to be discovered and probed via the AMBA bus. 
However, due to a hardware issue, AMBA probing does not work correctly. 
While adding the arm,primecell-periphid property would allow the 
existing AMBA driver to bind, but I think that's a temp WA. As 
Suzuki/Leo pointed out, we should not add the property to pretend the 
device as an AMBA device.

Instead, I introduced a dedicated compatible string so the device can be 
handled by the existing platform driver without relying on the missing 
AMBA primecell identification. The purpose of the new compatible is to 
clearly distinguish this platform-specific case from the standard 
AMBA-based implementation. Or shall I re-use the existing compatible 
"qcom,coresight-tnoc" as platform standalone compatible?

We already have a similar pattern for the interconnect TraceNoC device, 
which uses the platform-specific compatible string qcom,coresight-itnoc.

Thanks,
Jie

> 
> Best regards,
> Krzysztof
> 



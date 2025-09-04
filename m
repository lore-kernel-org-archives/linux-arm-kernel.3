Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC349CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKt0S7ecs0CtAy+/PB8DTyVHpUERySp0ZgXkiv6AF1k=; b=imt/SAE1B377jTrCVyEcsKVQNp
	clMmUhG9SG5qVAzElgOkCSujdqp8s8fnlg1W/mADTy+zSBASv+BY0Dbqta5TswhYNvnde4OnmvYbo
	Aav+QkYyFWle5hOKFF6KHKu7vHOIvhNHCOQlEkyN1Wwl7QxZjHGzP0zTSbUneTkdswMM4vvEa5C/A
	5lAwR/Rq1IGKaD9dOKBZ9A1mdrvhNEGjh/F21jXlEiiQXq0JuzqKhRF0XoE9EyqfUliVrNNnv0JUD
	eAyrnSO+EQvXOQzkpysk3RkC9psCXRYWyRzSHDYf7ib8lMwHyGwwpxVi9rkUL75AUwV5COMLFQLXl
	EEQJCegQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu04p-00000008UqF-2nsq;
	Thu, 04 Sep 2025 02:51:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu025-00000008Txl-2oRm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 02:49:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840KfbF029700
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Sep 2025 02:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lKt0S7ecs0CtAy+/PB8DTyVHpUERySp0ZgXkiv6AF1k=; b=Dq/qDeOXkgKTS0FC
	qmIXOjDFHE1NV8mvTG3DxpBs20sDbb7ZFcJTIFbgwediO8jHxivwJ5dnGKIWngJn
	1vhgGoAahs8fO4l4KyQ66J29BHPXxMeCsTa7YWzrnYIMoxQAk6Xmm1nGAHw3JIWk
	e2UD1pKHD9hGHsYtu+DhBjg69t2oMtZjaqz0xgFYE/0yNKvcl8yJvP0xRAngt/GN
	VuigZDbo1xyWo5YkpMWTqJGpN1my4YDgdBBscQHgLyZ2CAvFiJOIdlSF5q4qkL3/
	6ufdUiYLnKCCYCaS+LBj+63RN6yQFd5zs7UIoHZLL6wo53A1qc53dCc1kNWE0gTx
	3HCmNQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpe21q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 02:49:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3276af4de80so570541a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 19:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756954143; x=1757558943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lKt0S7ecs0CtAy+/PB8DTyVHpUERySp0ZgXkiv6AF1k=;
        b=m5lb2WLagOalW9MqdfxT/MeUVfg44EZeoOB5+xK7Pft8DW9BucNNJ3SAz8/tw9AmvD
         fu2IsgZPdTbOz1qcDGEGbxaI1zZsXacG9YFn6GflySLo+sFGkii1v2ycu6WSQDNblOoW
         wQxBH4GFbPstTvnbs4tUhbP1muZKqBV2G2APBgbf64Uejq6nY8twf6Luw4MfVcDJ/a2u
         JJK8T2AdVAfXyOVTv2RSgqUDssUtdPd4fZaHsiVmqOnCIaFdrkON43l3ETeIqwiAx2s1
         gWIElGmTVH5Q+3JwZTmrTuJ+b/xxs8FeH2acwqiyyhnP6t8rImGJCYA68QACWT0HG81b
         Zphg==
X-Forwarded-Encrypted: i=1; AJvYcCVkQucIdSSaLUN5Du0GWI2tQf4ymBrKSoJnB5m1OTDMZoqYAnSD667mem9+6eQJmItmeVgAG5yK9Bjv7R744faW@lists.infradead.org
X-Gm-Message-State: AOJu0YwlRjvlYBDHr1hCbI1WebJXwbh3JNqoAByCWy2Kn3TfBr6Ek0iZ
	YL9yq3KEFiS7KM8RMd7dRFDHJy9iQWhSWn/vXBxr/fT/LXTGA5BB/TVcaUW1RPJP4N9xk8tms+0
	f5s0wNGB/i4f+E2OSHUSuoZ80vNFnlSi0GMHdKDPxFq1hxWQR0HV490lpCp8BylIUcKE0I3pAwc
	7uhg==
X-Gm-Gg: ASbGncsPj/q+XA6zS4yhoBSVdlfZ84Ym8js2yE6yyzlZ4YP+jH7rkwkjmk+K2bkTnP1
	NcfDEjVbg5KqoZd3KY3VmlFXqqkIB5jiEaOuCwHqtsb1+2e/sHPudBnEHKvW/GO1pKb4P6Ftxxh
	WbLzHqNKGz39SNViVsN2IrT58WmMws9jaHJy4iuH3qcDF1MxirXSrHOtRWOkaJ4STnkpWJLy31X
	Z/JF7VzwDG3pRzT35Sc91/j4xesbD5oag7xH5lg9vu+AAJVEDTCcR3Natq3cglbQGVI1AA8Y6V4
	hF8S/RVKqiWO2q2X+Qf32Q+fcuEjDBGU6MuXjsv7w3Eam2wVvpmYYSkEXiWWC5uiRDg1Uq4rc6w
	9ENTGfIgU9aagMIK9xI++E15lTTF5
X-Received: by 2002:a17:90b:1d48:b0:328:bfc:ed81 with SMTP id 98e67ed59e1d1-328156f9a2emr23377036a91.36.1756954143506;
        Wed, 03 Sep 2025 19:49:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELJFGledcyj5orxusevvJh0NdR70AZnkQGjekJR1JcPW2asraw1wJ1eMDCJtOKT1CpY2VcfA==
X-Received: by 2002:a17:90b:1d48:b0:328:bfc:ed81 with SMTP id 98e67ed59e1d1-328156f9a2emr23377004a91.36.1756954143000;
        Wed, 03 Sep 2025 19:49:03 -0700 (PDT)
Received: from [10.133.33.16] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32b92a28a67sm298195a91.4.2025.09.03.19.48.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 19:49:02 -0700 (PDT)
Message-ID: <d7cd5d3e-3010-4b6e-bcf7-d0ce599f473f@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 10:48:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: lemans: enable static TPDM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlmao.mao@oss.qualcomm.com>,
        Tao Zhang <quic_taozha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250822103008.1029-1-jie.gan@oss.qualcomm.com>
 <20250822103008.1029-4-jie.gan@oss.qualcomm.com>
 <a53c6bae-710e-4939-990f-5974346f6c75@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <a53c6bae-710e-4939-990f-5974346f6c75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EWwKP1ko09N1qZL76a8XfiDQLrKS8D06
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b8fe20 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=vFb9WTq5DyKq8J-f9BEA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: EWwKP1ko09N1qZL76a8XfiDQLrKS8D06
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX7k16HIx5fXr+
 /874pPmz9uh+kO1sfupjXoy2bTsW9YUJKlIf4sOE5MP3XAthByXNh/SmFhCkzDci4gnGvqtI6Jp
 NhDywDzt63ZoZ1/pWFg3foAR9clhAZdFvlaJAPRb65MwG8+jMDVkoUM4KwACWcp5b5uN0KgTx65
 k9cQ4h8xFoeplybiKHo+L5ic5XMKsHQcISlI6L+bDbkJXTSSn5tMEcGDrHEcn4VxmyST3Q0Fd+p
 owzaZ4pEajWw5pE8PvwJCGN5hd2FoYNU+R9zzQSKRVPp6IG0Cuzl1Yta9wc8uo3ir9fTFKwH+tU
 UPPEykZbY/Advbn4bGztfstPXXBZJoK4hy23UX986slAgV0/LqKz8IojCOiCB5vBPX1Mi6tUncS
 Cg0a6Iyv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_194905_829973_3D336C0E 
X-CRM114-Status: GOOD (  12.74  )
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



On 9/3/2025 11:59 PM, Konrad Dybcio wrote:
> On 8/22/25 12:30 PM, Jie Gan wrote:
>> Enable static TPDM device for lemans.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
> 
> perhaps renaming 'turing' to 'cdsp' would make things easier to
> comprehend
> 

We are following the legacy naming rule for the device.

Will consider the suggestion.

Thanks,
Jie

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B11CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 03:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhYPs7vpcUnJsvDso3Np9kelujWCWr8tqGZf4I83GIE=; b=hXEjVtb1Qzszl9oG1szWPtwhkg
	Ol+Ll9V2CYtzb9MyL6bLEmN5dZBgI1sti99KkYtHCr72a8JluCx/DNytPjD5/aqFdo83FFI4qLo3q
	obthq3a+oXA04bAMdeQ43eLXp8gIx7uG0TqkfFvTBuiCrfnQNkxAaIptutfSGul9POxONsJ1lsyI2
	e259wJCkS73DDoyAMobQ+7oNFzYKkOG16TEen8OJ7znoyAVRI9m2vEPPp+DkTnzMj/RhqLTE0bWQx
	a/ApGyiARXSKr3ewnFoO2zfw9VOOA2jUS5NG7/q090bGrQxx9VsUo06MTZzh86HUadJ5KU3wwhjc7
	0LMnowmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEJVK-00000003QIt-2rHW;
	Thu, 30 Oct 2025 03:39:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEJVH-00000003QIQ-3MTE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 03:39:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TKngpo1598489
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 03:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhYPs7vpcUnJsvDso3Np9kelujWCWr8tqGZf4I83GIE=; b=mwRl5gtHBK+PfKXe
	oxxbsWD0u+UUtaO0ETxqmp20A/rNxi9lJzuLRPLgHmSSCAm24Gmiv3WBKCHCSH1F
	FFdkHgpKoa5xCqt8HnSqIw/cYw3soYbFUHgZQIC5KhH+xwd1hWoAIx1H0EbNcBM6
	KrUP8o1QIR1NVE0MmnQlE0eVud0TC5GRPLLnIKj8KtyWDfYCRu/daUQWefdm9o4d
	kA880vQVjEWl4aVNRTEgKkRxniUNFCEK5qWjbyBQaNNUbq8T5n8GpYZdgclTScf+
	c9CRh4u32hF4AlkdnMhlg4N1ISkv/o8addhlR1AlRDeuzWlROzVkFGX2oEQ+N+hW
	kRyzeQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ta7ryex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 03:39:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-294a938fa37so10934805ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 20:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761795550; x=1762400350; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhYPs7vpcUnJsvDso3Np9kelujWCWr8tqGZf4I83GIE=;
        b=L+n1xO4JY59JUU4sOXE54/+SvSwybMvXfxIRL26Xb7+0cEI3RLWSxBTA4FQa9bZtHW
         ar7yPO3fRrtEeEE6oA+Qhl7fXuXPyBfEMEDl+5zbJREG75TvLlWFXv9ut8rKffJ5kONx
         Rio+hoh4KUlsl+Tcf5iw0kOaNsmoGmxaxL36OuNPp+41nQjY/JEYxJLd5ppKHifmaTzf
         clh4bMKZqiTKgEkP3VqFVMWwgjm76tMVth+TOT8lTQOKEhGpKMBfpkTZKdqucxINCpjR
         yMZ3kbv3kD2U+MGMzlpEtSPuK2g/gX0fMPkQALJ4p19XYJXy8ACcztbCV35Plhg6Q/TH
         rdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761795550; x=1762400350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhYPs7vpcUnJsvDso3Np9kelujWCWr8tqGZf4I83GIE=;
        b=r9cfB+GjUi9oaljQelhGKNE/Qwef0DI2UnEuI05VgaLBYAtDgfcpCQtqd/6gVsPvYf
         fMbiMqZbu5zcsnP0NUuI2i9JfP6Awym1Ko7cCCvnqQe1zucJth6odcrSuLW5U94h5v4A
         tKGCOaaRMbrgMQT2ORtKb3bdHpceHhlIXnd51OQl/OL5IULtjryq6JYZlLx9c9jpO1NS
         umL2LLz6HxgEBnxbuvalSr9U4WAVtFkWe/aVz3GnWKxokONE/r84pJVduYhHzdcbbg5b
         DBT+fNGeLRspZijUdvT32ia33RMRYbIbW1Qxo/Rg+Qt3KEk7PCOGxo1NnExw+TC9HVVc
         TweA==
X-Forwarded-Encrypted: i=1; AJvYcCVKusFa+nkrdSBtHXcf6q1RuMeGfedQJqc/CkSvFLPy/gEmuZRFIMCw3uatiH/+1a/1y9WmEokg5NhE95EKcx64@lists.infradead.org
X-Gm-Message-State: AOJu0YyujueT3To0vuhDjjsa9SUCrlMpGe0B0Y0PYN0Y8QIFj2+jtkXC
	4GweDTjQLQ2slPzi3EGn5RsyZcGXLFjZxLBGaFcDyuMxsL+tiVhWltM5NEAkRXRdBk86UfKIhYU
	icemy7JvH3oI60BPP9O3ym3iDSYqt6J/mQ/VPrfNPmeM9zAiRU1exBPgfIhAa6+Qzl4W1lnyj3+
	y2GA==
X-Gm-Gg: ASbGncuf49yo/MQlrErR0dHazf0V7MZIdwsZUEw3cK+zuKgfE9a3pRpFWGRBwYpdrRB
	nMGZDKOY9c0rrTHWSn/6qgjBAjk0hgvGxqVJslQcge7nVu7n9jc1n9rmHZfC3CjWtC/8L5BF+e9
	5BeWoFtnrJTPppN7dCKxB/bAhK0Bt9WlWFVGV6nFu36eycFcVk4Er+27ZKvmoMstomLs21I6r4W
	I+rUPqwiPV1yz5ekKgjLZns0P9BHWJiAdIfCDVdxH5swV5hfxsjQFrWitpP+Rgx0ygTHjsWgSHQ
	rNnfaXL8EZLaV7zPb8wdtoo2wkwuPMQyI4MaljSIm5RPhCwhJCDiRqr/gz5A7j4Qfm8HmCDMobg
	nPxnMeIYKq9d+gPU/kPTSpPoQB08SpOw=
X-Received: by 2002:a17:903:240f:b0:274:777b:ca6d with SMTP id d9443c01a7336-294deeeb76fmr69476075ad.43.1761795549859;
        Wed, 29 Oct 2025 20:39:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDuq6Cy861gKvQjGL7vn7LoqYvAFnjvADCSK6KoaTP0/m4xLO7nEAtd1CcKZenG2kW18zBAA==
X-Received: by 2002:a17:903:240f:b0:274:777b:ca6d with SMTP id d9443c01a7336-294deeeb76fmr69475615ad.43.1761795549359;
        Wed, 29 Oct 2025 20:39:09 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e50dd9sm167674895ad.111.2025.10.29.20.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 20:39:09 -0700 (PDT)
Message-ID: <06a9de6c-c9a7-4c5d-9be3-5c9c9b4a56cf@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 09:08:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] arm64: defconfig: Enable TC9563 PWRCTL driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
 <20251029-qps615_v4_1-v7-7-68426de5844a@oss.qualcomm.com>
 <jjbiamlcof6gttme3crotwyzsxtrguohaib73gcsaabpan5fqe@s5uroqqargti>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <jjbiamlcof6gttme3crotwyzsxtrguohaib73gcsaabpan5fqe@s5uroqqargti>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aaVsXBot c=1 sm=1 tr=0 ts=6902ddde cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=eF76SeNzXSV_S8XMPHAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: umHKneVND2IN7QN1NFjG2xVqIMyqyf8X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAyNyBTYWx0ZWRfX+UyCdmmbXqVx
 zDm7n8HMO0FzxhjxaZpIruWysFenooGXwTlGkvQpHtIkKg0+VsJyPxKsoi7e3JNEYzdc/BchKh4
 BFEj+wnQEa/mOkmtJKZ2cSVYJIAHH84fuM5+QdhLOcBuEE6DpN5wUwNGvYFhZrdQGyi6X5TzQC1
 3urJJoalWUcmkeghgmr6zUx035B8X0UOhInCM7Rw5/3oEcuEFVWLEt8259+BdslJkTznf3xVir8
 hVymo40nRfiPDRDnCjCs1py62ObwRSEiyR0VwumK2fX5kw6zUuYd0hnJzDLd8ieGknVnY28yfC8
 7eMnYo1Z/rqxgMPAURmn+z93G8Ve1QwQYZW1HdK0evqZJNazbqgKVy1iK1f17yiiL3Tw1sBLfEk
 95dKiJahWWMkG6L4FoWXMlEp6cCb+g==
X-Proofpoint-GUID: umHKneVND2IN7QN1NFjG2xVqIMyqyf8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_203911_964502_C7BA8FFC 
X-CRM114-Status: GOOD (  16.69  )
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


On 10/30/2025 5:34 AM, Dmitry Baryshkov wrote:
> On Wed, Oct 29, 2025 at 05:00:00PM +0530, Krishna Chaitanya Chundru wrote:
>> Enable TC9563 PCIe switch pwrctl driver by default. This is needed
>> to power the PCIe switch which is present in Qualcomm RB3gen2 platform.
>> Without this the switch will not powered up and we can't use the
>> endpoints connected to the switch.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   arch/arm64/configs/defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
> There is some broken logic in your commit order. How comes defconfig
> changes come before the driver which actually defines that Kconfig
> entry?
>
> Please reorder your patches _logically_:
> - DT bindings
> - driver changes
> - DTS changes
> - defconfig changes

Ack.

- Krishna Chaitanya.

>


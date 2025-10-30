Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E83CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 03:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8cTGlLixs0EcG4dKWmS5DgH7TjtJvlrFipCs1gJW+1M=; b=OnLOHEKEbiFCIpBp8RtRRKcEch
	272s+9zZDEUarjfO2ODMHj++yhhNvu0Fb38YrDA6n2Qd0AjCP17WJomvpXTukxGObtUN4udt0925g
	9bfqUXyl5BVmOHXcdWc/V53R/sdgGMbneRO2RbrsDmwMeDjAF4q62VDLjXXfxny+dHX1hl9AxSUE3
	7VHq53AzcqNEgSpziBAfKIJP+Xb9d4H+Ppz6DmUx+r0yEiEt5Yz7SW8Yu0aHtG1ku2RqaJrcmB7Kp
	WtDbpfmA/2wjDDpm7hy2NRHP82w3wn3ThMEQXoOs9Em0KQNk4tUNvLeJVd/nIaPcGm0wH6wrQjGU8
	LETKwkLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEJUs-00000003QGF-1WYT;
	Thu, 30 Oct 2025 03:38:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEJUp-00000003QFs-32WC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 03:38:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TLsq7d568012
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 03:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8cTGlLixs0EcG4dKWmS5DgH7TjtJvlrFipCs1gJW+1M=; b=YmmWK9mhT2/HxmP2
	d/nFKs3NQn4xlGvZZfIFG5MSrL3wNBGzzzVHkjrBYqKjMtp6d9O8Q+yEH+BI9Agd
	UdVzS/cq64ZiTm/qTUrq1gJ/XNX52oZhy8VDJYarB9G6gvVC2JYAknbBUtHPbEf0
	MCOlLD755Tx5npzVGJqQlVMchCTMw7bZ68LjrZsPb0nMDCllscrLvRBaWnr0DzZp
	9mfy05Wa7L+DYSVNG4c9nXNr5yv2kUaZKCNlscxbLBYon318zPTxzAteBic5quaC
	XPU9Ed62Qqph09EaEuqTnIC5OY59+k+C2bYrJBFuHUPjWvb9UrjRgUU8lJRPgrI0
	vr3Eng==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3m0bjbsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 03:38:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-340299e05easo499290a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 20:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761795522; x=1762400322; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8cTGlLixs0EcG4dKWmS5DgH7TjtJvlrFipCs1gJW+1M=;
        b=NcK8HJXySLj1q4H8SwDIpM/BxTEkBCZeZlxt0V6w22XwNlvQprExNDsvHphMxeVcgQ
         MI6B5Z6470HUGKbltgqlEIbFrueF8UZeoWD60viaGeHxJYbyq3Y39AFvWxYoVqL0Mv+5
         gDFu27gwMBsb3C2ObCwDTJUxYZUf/GObRZAXCaYHLT2lfpr/0l1dtpT6XWUfH/B6uniw
         yf4iRTXi/ptv3Y7VUc4F+73bK2oUw3s83yyA6o+FFmzQEcLna8DhuYMvReZBqA+Y/JXh
         2APDZehaoewrkbv4AwEMwn5AGmF6TgafvYH5usoGwEaMD4E0HKF82VoIVRKlMAMGxPPC
         O0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761795522; x=1762400322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8cTGlLixs0EcG4dKWmS5DgH7TjtJvlrFipCs1gJW+1M=;
        b=oywPy5M+fIGa6GqMixCEpQnXKsI0ZfqcYta5auEHMwr7fZ75XFG/CXM8bZh4jVy9Qh
         k0hPy6O6UUxnt2H2Dv3F00AI0I1iyoravSvTTzOF/CJpD8U2cDsg72VDXHvVWBvbMR4Y
         tjd88E21QAP/fCAnlV5x0gZsWcMBtZmhny1sC+jcx4zhauqvSuuKL8tlv+l4nmHyhUTe
         tR/KJS2a8eqDF/nAiDnEuPd5d4zN6NQjysubncQaPkDT/Ule+SAcC9EYF759JcaC/6XQ
         qFp+0mocNqi5ZBhyOcgEM7MiEeTdJ+rhhbbGtN+juaEpnx6DGOfj3y/+jsfGknLAjdbv
         IR3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVb0dQBovOCLldlyDin9N8vG0sHt0fvanGJvyHbATPoOVH94wg8uDIF3ba9FxgnE+fl+Sf3whhMLIr2TXLbD9/J@lists.infradead.org
X-Gm-Message-State: AOJu0YxDqi4CiOBRuDRU6UGd386x6SlXJR5gbfFhJXGkwDxcrbPQbm78
	qmdheQ6YhS9fnvT6JTKQXEwkNhqlde2yQUXtFWfO+ouiM1dHIQGdVg03ASmCaUTrSR+WuoxLGPk
	5hVqc7VI9q/7/M67CnOC4gc1qzuu5/0iGQFtjSWj5ZyUzcvlH64MJHIFXobDhL0F6y/+lQyAfCJ
	16mw==
X-Gm-Gg: ASbGncuf3HWapKCklBI3L1HJGFyGBo1lGUO5i5vo+V+6q8OUJAMXofyACFfdFbQXnSk
	hVZfYrm2qCvF9PAFATTdahXYNYE6rYXs7hwb4QtqUPh9iYzesCu2eIOnj+DUXpf0cr35EFEKQEg
	0MmeC6J5GLj3hEiurbY4AeZJbGJrGJzlVue1WPCYurDiZs7Vs8wCt9CHiAVcPzUEbU2rnsnunuy
	xsGU7uhQU2iWO9lisaDsTDHlbSDXQZIEtLvvJ2SfWarWbKQKm2VLxpfiecs/gAMoaKaRHqc35rP
	NitpuFyMgbYfZLUGmxf0lX+8vzqHVOrmJoxOt2o8iEGLHB3+kve328kvan2tqWNhCYC6n5FyYiT
	iVOB1PGn4BIRhbNd5mGyrDfrg5AFXoAw=
X-Received: by 2002:a17:90b:38cb:b0:32d:e07f:3236 with SMTP id 98e67ed59e1d1-3403a2a22a8mr5280702a91.22.1761795521550;
        Wed, 29 Oct 2025 20:38:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETSXZA/9AUH+eCeARyftxGQaYC5tfLi6TMdi8gQWvqS2Cl78YWh6ARpNw6aUIpThTzHdcxfQ==
X-Received: by 2002:a17:90b:38cb:b0:32d:e07f:3236 with SMTP id 98e67ed59e1d1-3403a2a22a8mr5280661a91.22.1761795520939;
        Wed, 29 Oct 2025 20:38:40 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3402a5ba7fesm3305920a91.9.2025.10.29.20.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 20:38:40 -0700 (PDT)
Message-ID: <a876f8d4-969a-40a8-8988-2f716a742741@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 09:08:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] arm64: defconfig: Enable TC9563 PWRCTL driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
 <CAMRc=McWw6tAjjaa6wst6y3+Dw=JT8446wwvQ0_c5LHHm=1Y-Q@mail.gmail.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <CAMRc=McWw6tAjjaa6wst6y3+Dw=JT8446wwvQ0_c5LHHm=1Y-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SG_T5vnsmDXJhIXnEmmUHDo7Vl78L_r0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAyNyBTYWx0ZWRfX6EVV1H8dRDsE
 r4gf6qlkLaCvCYV/IgNEcO9GhSiasdZTMVeVEw9AC81U990Z0kbzSr/b+UsLP+nCqYbBhb2HmUZ
 Vs0PUqo1vu4rMfz62MujDwpk6VIDhe9kIIfNZbwiRLHCVP6l6XxIRuIRQOKNivoC2CWL38od7Dc
 cKWJrUTxcvxu1BJbycdnF/q7kfu8MNk3RBVUWHW+HaricAqBMbCOtW07xdJyydAjiNVB4B4mqzK
 ycq38tNBjDnbysFuG2fzHc9GtArRA5prslLv6v7ueTsyg3UzorCYcGpHhrV/lVCbfpFwveFyp+U
 3r8bz/FLapzRw8kTaaF0H7qPNjJBXcQADgm0f/g7JM9iYdq5KeUSmcPlQoBZZeb4qY4hiX4ur+i
 K+fJDjjxbc+byGhoi2Hy7VVlX8fJBQ==
X-Proofpoint-GUID: SG_T5vnsmDXJhIXnEmmUHDo7Vl78L_r0
X-Authority-Analysis: v=2.4 cv=YLySCBGx c=1 sm=1 tr=0 ts=6902ddc2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0FT5JWsqCLsmEzCoxIcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_203843_910470_6330E200 
X-CRM114-Status: GOOD (  17.12  )
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


On 10/29/2025 6:45 PM, Bartosz Golaszewski wrote:
> On Wed, Oct 29, 2025 at 12:30 PM Krishna Chaitanya Chundru
> <krishna.chundru@oss.qualcomm.com> wrote:
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
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..fe5c9951c437a67ac76bf939a9e436eafa3820bf 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -249,6 +249,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
>>   CONFIG_PCI_ENDPOINT=y
>>   CONFIG_PCI_ENDPOINT_CONFIGFS=y
>>   CONFIG_PCI_EPF_TEST=m
>> +CONFIG_PCI_PWRCTRL_TC9563=m
>>   CONFIG_DEVTMPFS=y
>>   CONFIG_DEVTMPFS_MOUNT=y
>>   CONFIG_FW_LOADER_USER_HELPER=y
>>
>> --
>> 2.34.1
>>
> Can't we just do the following in the respective Kconfig entry?
>
> config PCI_PWRCTRL_TC9563
>      tristate ...
>      default m if ARCH_QCOM

Ack, I will do in next series

- Krishna Chaitanya.

> Bart


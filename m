Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86543C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 14:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCKrDwqSKjmhyeKOOoVxGn0RwDBU8qLuV9+cCH02kvY=; b=nfffV2grbv3Oaim2HWFyBBFtLT
	VzWl3UOv0nI2hUzQyHenOPf4934uRYGgQo8W/t9CHDH3Ha9ip+a7XkK7D9MymM1lffAdls7vfr6g0
	mI5YiEifJYkOBt5w7zgQL7jA9EYAcont/U7jsM4/4Hc5bGHDJiOUVopLrvLM1NN7PTKyKYYCUb8N8
	mUcTuv0B+9i/apdU+awAFMGeANBfOGziYINq3+ilWQ7uz1NuNRRQ1To3o6KH29pFiCZ3BIyrGuduA
	97fdwzAsUN7D+v0R19YRcJItt3r4T92xTeIZPIPGJWRcVEKkWkh4Yp38TXadGfsIPzlLMoYtUksrK
	vWffCYLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYA3-00000006DZC-3uka;
	Tue, 18 Mar 2025 14:43:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuY4g-00000006CeX-2mZ0
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 18 Mar 2025 14:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GCKrDwqSKjmhyeKOOoVxGn0RwDBU8qLuV9+cCH02kvY=; b=jPbtEZ0K3uNfzirEnwLwH2zEBG
	b0ioBbS9L9liDQ4mB367URSSf+B6/w0Oq7I5h5yd62CS3M4xyfp+Ss1NmQow+GRPqHBnAGj74NGCL
	g+e7/O2W/n96LVWEA8sy8CXLhRhv0fGkpAsCnql66HkR2RXswicHIXA+qyc3R9l5ND3oDfdBzieBh
	DZMRTtKv9Zp/NqXVGOW+er3TTjX/6ufij5VRyDZjLh87GLlQDMgYBRdYC0cGZfaIWBRl2o4/cSCGr
	szGqQ+WdFZZWLH9Dscjr0gloDl7Yk6pUqbwn2+WScznIokg6AGO2HuC6pvFDQq8iNxarV4fUcN80Z
	NXjPCwXA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuY4c-00000003nqX-3o80
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 14:37:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IA4jbE027057
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 14:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCKrDwqSKjmhyeKOOoVxGn0RwDBU8qLuV9+cCH02kvY=; b=EanalfZEWaMlnULA
	X8r69MwvC9mgLnXuhFIFkf4iM/aiYcUUwNzpWLcGrX//s+p+Z0Flxkm5qxf7711Q
	wMVe5Oh1j3toGMyCZtQeCTnv18Wc+cEbGSNg3w6nsOf3vMVef4UOPJPxqUlE+R+c
	RcpXLTo1GitpFF6ia9HNv+yxGd+okp5OL6zP2oYBSEA67X3m1F4rMIf3iMW2XFbM
	PbNPFqYuuN53AslI+4bPbaXr4thslRD/1lAJ4Oxm5PwyhoOuOuHoHvBYx363ZdqE
	HOIw2G71NnEFwyNybVMzewUP4Oq+iJY+pMpPP6Ls8Hq/H6jrsHW82GVjl439bqhn
	FylJ3g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtj87d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 14:37:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476718f9369so8891571cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 07:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742308655; x=1742913455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GCKrDwqSKjmhyeKOOoVxGn0RwDBU8qLuV9+cCH02kvY=;
        b=GKipV1Dt7osr8sr3nPxox6hFyWBaQlFEJK5KvzWuPm1n/uFAxRx9kQw4kK/hObT/Oj
         Ri4kyIPCnpN/7oFq3n8Vn1sufENzHK4sXQ2FSD0c9eWDzpgfjnwmhTZ7Uo8oGIRA/A/Q
         BQaXMLl5rzn+vazF6t6Ti0MwFXgKk4ex7ZrJVScgy4q6ypN0YgKNWHznp9U5cGmcu0ia
         z+QiK845/5xRt0oWZTxf9WIvFhcPAfmabXgIqRRVgFnpGk8N01HaGpg4wxVy4pbDmHPi
         BK7Hx7Q5geusLJD0VD7DLMLzGsPouQUmSalZXd3bOdLcCfRQfRu+XBRikhczB/FueeSx
         C9HA==
X-Forwarded-Encrypted: i=1; AJvYcCX5R1Pq5MSUQa4J6146UpOXO9SiUPbKkcUo4qnxQ6IConsNr/1UDDtRO7zpTTwTmeFph8+p/Ic7QYar+9I5ypR/@lists.infradead.org
X-Gm-Message-State: AOJu0YyP4xMO0eOjX7r25Icg6JbbrT5AonzWKMPJsfJ5/ICV+xALe5Sf
	wBv7ZNx3btOtOFvD7Cm93PYowGOWYupFj5A9RozxkG2H2yP3wc7ldf0V0Qrj0Op/XdCRNepQe5y
	kx2B71xLJcn88boIdfUg+OUY+dOZ1OLqd1fq/CuFPSRTFiUiTCXV5Q8krzj0vx+azwpUMWj82yA
	==
X-Gm-Gg: ASbGncs7+3qqL4qrtBAm0/Irg5w1BGV5FNtsu16pGprf8vLtic6l4GoD4J2BpAK9QrG
	Nb6XSGbVYLQ2OAy0D9b37V3HrJcfAZTaTjv/fhZ471aeLsJYnTX4xrUKVRFSjSbtjCdHSr+kOYA
	boT0aE14/Wk+u99ZpCM/yIi/Eh+9Do409GAgeIAE9MSkgolS3qMb8x+0TpsPe1ubhabyxCqzNOt
	7+uJFg1SLrsX+8dSmcxcYav3dzQzeY+GHzZpHHGHdSgbn0SnK198+tAU9/gCxOC2maSAEQJa/Ys
	qXY0IBLBxduCqTDCRL+0N/28ctU1LzviCpHz8wliBILoTlEyyhPLW9pIGAkSy7wH72rxYg==
X-Received: by 2002:ac8:5a4d:0:b0:474:ee9d:43db with SMTP id d75a77b69052e-476c8195536mr91629791cf.11.1742308655050;
        Tue, 18 Mar 2025 07:37:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9XlW3vxIbChrkNlEMFD1fJVPzEE60tzANRziluVDqnNCVbhsb/A1XFOWf+p/vkEK/1xCqJw==
X-Received: by 2002:ac8:5a4d:0:b0:474:ee9d:43db with SMTP id d75a77b69052e-476c8195536mr91629481cf.11.1742308654623;
        Tue, 18 Mar 2025 07:37:34 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeb2fsm876771466b.15.2025.03.18.07.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 07:37:34 -0700 (PDT)
Message-ID: <61ed7f53-e7af-43ab-bd92-15317b94b617@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] ARM: dts: qcom: apq8064 merge hw splinlock into
 corresponding syscon device
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
 <20250318-fix-nexus-4-v2-7-bcedd1406790@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250318-fix-nexus-4-v2-7-bcedd1406790@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CnfvttAz_NWz4bJkPPv7fynx-EGiG6p1
X-Proofpoint-ORIG-GUID: CnfvttAz_NWz4bJkPPv7fynx-EGiG6p1
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67d98530 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=RnBFEU2T-AcrtaIZjsEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=676
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_143743_414742_8E8D3C2B 
X-CRM114-Status: GOOD (  11.77  )
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

On 3/18/25 2:22 PM, Dmitry Baryshkov wrote:
> Follow up the expected way of describing the SFPB hwspinlock and merge
> hwspinlock node into corresponding syscon node, fixing several dt-schema
> warnings.
> 
> Fixes: 24a9baf933dc ("ARM: dts: qcom: apq8064: Add hwmutex and SMEM nodes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


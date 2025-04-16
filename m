Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24498C369CA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 22:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNfrCvKLz1HL2/Ep2TIoQ6EJuGuvEvjrG/9oyVd/u88=; b=McFa9+41TP+ff0TkEqxJVBkVI9
	aP6Le55pQeWFQIRmSM1BRv1keW2MJ1UX1H5gMv66byWYpYerYbciQGDBylPrXaRfUSMPkZQVTNtrv
	vl300iWrD8KkcmT1ngjDGNagNCUbpRS6VurDZeKJTxEQIl03scv1GQNpXeQG66Hvqw1DAad06gL1T
	st5uTeAnHloj2FCaFiu4aDhxvUjVVR2FMDjR2TEsf18MVDfYfiOwF+borB2S3aNOWfDC2ltJLgKif
	y+hyAtbux1Z8FoGDe34CRG12mNZqVIyw535XXDzYN6Et3P6BD0N9wF39JYz6YsxyxUzrFIOArRjvc
	grnYsq2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5BXv-0000000B4sq-1CR6;
	Wed, 16 Apr 2025 22:47:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5BW2-0000000B4fb-2ptJ;
	Wed, 16 Apr 2025 22:45:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GMNdb7020536;
	Wed, 16 Apr 2025 22:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xNfrCvKLz1HL2/Ep2TIoQ6EJuGuvEvjrG/9oyVd/u88=; b=NqKrFflUuvmOzgIb
	tnKdyY7U46RSAItH7u6oAgSMZPHNeAlPVKEjevMzYAiY8KW9gPajHLwQEhB4ziYn
	G5Vkj1xOEgluDc6TeD5M9RtzyzbaEEB7KSYuTskmf5aOKEKogbEeGVDnxHYsOlp5
	5RY34pNAqLPzzK/07Kr2NctqklzPqoQaQLpHI63oVqnaQCwaAVWkzwFi0C2Tflyw
	fOHcEOhyOS2WlLN6nLbQM/27oNOTpJBxIlap/w7q2olVx8GpnnLITVMfT25krb6E
	wT74ryb+bLR1DzYwahReYwS98oAzBlPRt1HQx/7xrGGMVIpjRA+3O1/Rf4fWyCsb
	VUly3Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpvt5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 22:45:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53GMjmYO017521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 22:45:48 GMT
Received: from [10.110.59.41] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Apr
 2025 15:45:48 -0700
Message-ID: <0517c37d-b1ba-466e-bffd-9f47b0d458d5@quicinc.com>
Date: Wed, 16 Apr 2025 15:45:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
To: Vinod Koul <vkoul@kernel.org>,
        Melody Olvera
	<melody.olvera@oss.qualcomm.com>
CC: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
 <20250409-sm8750_usb_master-v4-6-6ec621c98be6@oss.qualcomm.com>
 <Z/exOF4T+0vNLQwg@vaman>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <Z/exOF4T+0vNLQwg@vaman>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tQ2iOfxn8lJ-9NvJwiHwGQLX2R8JqxPZ
X-Proofpoint-GUID: tQ2iOfxn8lJ-9NvJwiHwGQLX2R8JqxPZ
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=6800331d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=hpYwsUs0O2kreVQoPgkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_154558_740585_BB060EA6 
X-CRM114-Status: GOOD (  11.08  )
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

Hi Vinod,

On 4/10/2025 4:53 AM, Vinod Koul wrote:
> On 09-04-25, 10:48, Melody Olvera wrote:
> 
>> +static int m31eusb2_phy_write_readback(void __iomem *base, u32 offset,
>> +					const u32 mask, u32 val)
>> +{
>> +	u32 write_val;
>> +	u32 tmp;
>> +
>> +	tmp = readl_relaxed(base + offset);
>> +	tmp &= ~mask;
>> +	write_val = tmp | val;
>> +
>> +	writel_relaxed(write_val, base + offset);
>> +
>> +	tmp = readl_relaxed(base + offset);
> 
> Why are you using _relaxed version here?
> 

No particular reason.  I think someone pointed this out previously, and I
was open to use the non-relaxed variants, but I assume using the relaxed vs
non-relaxed apis comes down to preference in this case.

Thanks
Wesley Cheng


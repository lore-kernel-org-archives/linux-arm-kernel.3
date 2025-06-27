Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D28DC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 04:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6Br1bux+uto34hrOpRBdkZiWcPdqetSr/kBiy2hggA=; b=yTEskReWRRztczfmwmlJCjkb3r
	fUACQudEZrh3w+Hz6cQg+LF/YzpfyAxKfeE77PSxGsxQWUQNgCD5QyLAQLoOJxZl0FGcJ8RRuZkMQ
	v68tAKG8MQsfGcca4Y6AaCh2OFXYSuy0I0ZKcOypSPcUGVLuwjDOijxeId/ZYU2KlDrvPyFS/c0jw
	RidNL3Uz8ph2aoS/LmkgPAvxzimQpGtbUObqUPX9Jz3ttV24COYVs/ESWqlSdmEaEKO3sG2fBcKSr
	AKr40dBMfBP302/u01HCjvrYx13vJSFBZjp53pz4pSv/ovXyaZFbr8wDJ9A8dWUyZ5MJqgk+8rDrT
	quq1eXSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV0oz-0000000DYOv-0jrd;
	Fri, 27 Jun 2025 04:36:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV0mf-0000000DY1D-1Z47
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 04:33:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4DCeF014521;
	Fri, 27 Jun 2025 04:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K6Br1bux+uto34hrOpRBdkZiWcPdqetSr/kBiy2hggA=; b=NhJtW8tYUV3h9F0r
	YCdxz84zFOeQJf1e+1KSouF5SmwRMEsmBG4odOI7tzjpxde0qM0x9R08iN6OLH7d
	Y3zr2Q6UwaJ1k1OoqUs4WMuiuAmrsR5MstnSvesDvrxJ11FKFbVCTvb5yh5toQO8
	q5y8G9mswFqvKYt5TQ/MrE3+1KwvweKMKasPej89J+dQ4RKbeMOQVOBzPvkyth3T
	XL1voXrJLgsXa8M5TAFxtxUNDuFBNotPD8XOHQJjEkEcZ6HH4u5QQm0wFD9YHsp7
	0QAb9Y+LuIu7LxyT6g3NokiAmOfNriVoRKIppda7+wkQyyB+bz1eum6092MbPweT
	YI6MUQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm241rx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 04:33:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55R4XMC2030809
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 04:33:22 GMT
Received: from [10.253.36.2] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 26 Jun
 2025 21:33:17 -0700
Message-ID: <a3498578-e3ef-4c63-a132-56ba6ac24900@quicinc.com>
Date: Fri, 27 Jun 2025 12:33:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] coccinelle: misc: Add field_modify script
To: Markus Elfring <Markus.Elfring@web.de>, <cocci@inria.fr>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Joey Gouly <joey.gouly@arm.com>, Julia Lawall
	<Julia.Lawall@inria.fr>,
        Marc Zyngier <maz@kernel.org>, Nicolas Palix
	<nicolas.palix@imag.fr>,
        Oliver Upton <oliver.upton@linux.dev>,
        "Rasmus
 Villemoes" <linux@rasmusvillemoes.dk>,
        Suzuki Poulose
	<suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>, Yury Norov
	<yury.norov@gmail.com>,
        Zenghui Yu <yuzenghui@huawei.com>
CC: LKML <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
        Andrew Lunn
	<andrew@lunn.ch>,
        Kiran Kumar C.S.K <quic_kkumarcs@quicinc.com>,
        Lei Wei
	<quic_leiwei@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Suruchi
 Agarwal" <quic_suruchia@quicinc.com>,
        <quic_linchen@quicinc.com>
References: <20250626-field_modify-v6-1-200dffa38a07@quicinc.com>
 <e52cb86b-01be-4560-a1da-a6b07108d651@web.de>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <e52cb86b-01be-4560-a1da-a6b07108d651@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685e1f13 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=8AHkEIZyAAAA:8
 a=uPLpxg-qKf-oJQXuHx4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=4NdJUZNqX0cA:10
X-Proofpoint-GUID: 1615e4W39KXNXAtpa1cLcQpMTxbj-kP_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDAzMyBTYWx0ZWRfX0MTFlVem0EDG
 qYepEKcTPilRd4UMCp9Wrc3DLOqGO7a4axgWd0j3W29rPtxkTxv/XtVpLIz3SubKFxEpnQzZI+l
 ME85y8Ho32cC+7l7/CvpiSXZhSmN/wbtiyp5dFB0I7Bgh2h6krzZ/Yc6ZxCOPLV0EXi9L9dsFTA
 UFv3AMpuiX3C1/UsWIBOgXrSnsZqC2nhp6bfdEgoTzkyzYARWLMzUgSgXL/QDTD8bpbDpcYhv6q
 9REWwd34mYZNo9lLuQEnqxXbo2Vv4ekhZoAG7QXIQNgy2PRs+GBt7mwp8uj+qMtF3pa6+9UETuG
 sVcm7e4XSJJKw6EhMYWh2gsh//v2wlL1/pgffVf6Jo7bMihC0qEn4nPd1xFyDVVUjNN4BExqyOT
 9TSrAZaDmG4/Lv1a5EWRAvMLHJ8AFm9mTWAaRurNsRPq7otpg4yFFDR0uku92cQgfTU2B3gs
X-Proofpoint-ORIG-GUID: 1615e4W39KXNXAtpa1cLcQpMTxbj-kP_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_01,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_213353_527310_DA24F3FC 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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



On 6/26/2025 3:43 PM, Markus Elfring wrote:
>> +coccilib.report.print_report(p[0], "WARNING: Consider using FIELD_MODIFY helper on %s" % (x))
> 
> Would you find it a bit nicer to use also another formatted string literal
> as a function call parameter?
> (The recent code adjustment indicated something for the operation mode “org”.)
> https://docs.python.org/3/reference/lexical_analysis.html#f-strings
> 
> Regards,
> Markus

Sure, I agree that using a formatted string literal as a function call
parameter will make the code cleaner. I will update the function call
as shown below in the next revision.

coccilib.report.print_report(p[0], f"WARNING: Consider using 
FIELD_MODIFY helper on {x}")


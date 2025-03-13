Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E251C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 05:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAZgkWjij/bqtx9GgE9Wpe4QoKRhLY1S0Jub+7/TYRk=; b=wMwKg6wxAh/1Eot6TsQ/QE5We0
	hNra4kseHwvxafxebpo50Y+XkaSOMTDv+oDvv03tCesJoyh1ad7znTCm0KSthJkhTmRWWgE2WqLgS
	f5DELPwVF9EiNcxRqOtBcBqaAMNSTx6k/dbaALkKE67hJ0V/24uw601MWpFpZlyR2knGVd/U3+N0O
	ORFtf9hrW0Lo2qn9P6vRqtwAqICzoB+L0YlyvflBkSka/aHOIQHaeXUCbXyvRQYp6AaciqfaYKlMp
	Vm/mNK50FFQhfqy+6sMaGe1lHw0+t89ezONaWJjSaoU0aREUqfRcuUTgJ/GRv8+kPuE65n1QlUOJR
	S17WDWbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsaq3-0000000A5oW-13av;
	Thu, 13 Mar 2025 05:10:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsaoO-0000000A5dA-434R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 05:08:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CKLU0B013654;
	Thu, 13 Mar 2025 05:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lAZgkWjij/bqtx9GgE9Wpe4QoKRhLY1S0Jub+7/TYRk=; b=gV24+jqmk5Mc1Jkn
	S1t87cethNT7FZedzmRe41bngTfoyOL8DbDt3nerkiwL6XYulplw8U2rGREEpyvg
	DgOkaDvOf4EHLG/xWDqJb+pAXwLcbhe+m5Begc54esXtQ74IO/jwLvZbmirjwiME
	3cfogy1c2h2pbH4TgLj1uBZfmNjgILYRoMeq0f9c9d8ScAUllhqlvNB9Z3asI6cX
	Bxw2a661E7wYlJabzDjXYyyTJ+Ci2sZuJeleeD2XMnYSqKULVtZhFStI5U5LJLRf
	YqTzh4WHmI1aQAfwKZVEy+TQTHQtV9NYUlcqF1S5Q25MgzUo389U0qXHZ9ktkyxP
	w4k3SA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nmmrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 05:08:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D58f4s018711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 05:08:41 GMT
Received: from [10.217.216.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 22:08:36 -0700
Message-ID: <b2265099-cf95-47b0-add4-5b0f89e61ba3@quicinc.com>
Date: Thu, 13 Mar 2025 10:38:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20250221-qcs615-v5-mm-cc-v5-0-b6d9ddf2f28d@quicinc.com>
 <20250221-qcs615-v5-mm-cc-v5-2-b6d9ddf2f28d@quicinc.com>
 <ljfgljuhlpkjvqwomhvq5l6giihqv6h5nzswncaqgelvjycgew@bcxjrgbj3lts>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <ljfgljuhlpkjvqwomhvq5l6giihqv6h5nzswncaqgelvjycgew@bcxjrgbj3lts>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=M6hNKzws c=1 sm=1 tr=0 ts=67d2685a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=vGHd0kDLeNPC5odisEEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -3tWWf_R1xeqdOO2JC1PlrDonj_Xg9DC
X-Proofpoint-GUID: -3tWWf_R1xeqdOO2JC1PlrDonj_Xg9DC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_220853_136487_92574761 
X-CRM114-Status: GOOD (  16.64  )
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



On 2/21/2025 7:41 PM, Dmitry Baryshkov wrote:
> On Fri, Feb 21, 2025 at 02:50:13PM +0530, Taniya Das wrote:
>> Add DT bindings for the Camera clock on QCS615 platforms. Add the
>> relevant DT include definitions as well.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Just noticed. I've never replied with this tag. I've provided a comment
> to the v3 of the series, then in v4 this somehow appeared. Could you
> please comment, what has happened?
> 

I am still confused how the tags were added, as I used only b4 to pull
the patches, only there was one patch from patch series#3 to patch
series#4 was to drop one patch as it was already picked up by Bjorn.

This patch has tag only from Krzysztof.

https://patchwork.kernel.org/project/linux-clk/patch/20241101-qcs615-mm-clockcontroller-v2-3-d1a4870a4aed@quicinc.com/


I will check all the series and correct the tags.


>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>  .../bindings/clock/qcom,qcs615-camcc.yaml          |  54 ++++++++++
>>  include/dt-bindings/clock/qcom,qcs615-camcc.h      | 110 +++++++++++++++++++++
>>  2 files changed, 164 insertions(+)
> 



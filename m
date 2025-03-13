Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313BBC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 05:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rfv85+30VXwkVgVD5wkuN2pjxQTn7ho5NyKDGOREnzs=; b=jIUXqAG0clfFFJK0YY9JtCqXPX
	C/qtiiMG9RQJ16kAHpDOVr3oIuMncof5aU4j8Q5jOt3+Ix+mE9t9O5HtmAyvueDFhG7bIKcfDObj0
	5i0kKnskRfkGlJ+16vaRqYoj3eVTKwOI9dD6tODvIWQ9IUI3TEnp8rC+6nRAxkAGQ3XfJyupWyVBl
	33416VxOrIC9YqMFJNQS73tcSJS4UVhh3W2VGVZtD0ew+TPfR0qx0us2bD60plugzJRtrkVnDfVup
	cDBgDd5/cgz0LmeQ6OudokWJsDY+ZGAlDRJmApcSfY6wwk7nJEO7BIQJsZy+E3xX9sC1ra+L3U/1i
	0wXVuyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsarf-0000000A5wc-3vpB;
	Thu, 13 Mar 2025 05:12:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsapE-0000000A5hO-1RGR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 05:09:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CNDmu2009941;
	Thu, 13 Mar 2025 05:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rfv85+30VXwkVgVD5wkuN2pjxQTn7ho5NyKDGOREnzs=; b=C/cbDf92w++vUN8t
	gd1Z0Gp3vC45yASXKc/G0l71FsolyYJ/a5GfDkGzhRaGe0h2NrFDCPZ9PEYFAo3r
	rDFfJvB9b8E6bEZvq2hoarf0Nh1GkW2fwsM4H4j+Zuh51t4q+XOHY7z/iiJlFVCg
	bEqkG5m77Q9YiFNb3OFRTew7DINPVusaVjfd+tEQdnvZYkcFxexa5p/f/xwUs8eo
	YHaGOZ5b9sQK3y9PXZWXnGph1Bd9AaE6Qri9rAXBSaHaAXLLf7dWGdmalKglH8Ha
	D8R4cAsyvCvKN+QoXPx2wG7rMFi0m0HJZDmUvWB0B6ZfOdHYI6NKtb+PSVfLRrHD
	SzlyxA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2rck9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 05:09:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D59Y8T010387
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 05:09:34 GMT
Received: from [10.217.216.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 22:09:29 -0700
Message-ID: <5b81ba9f-810e-45c7-b991-ffa842b8c8eb@quicinc.com>
Date: Thu, 13 Mar 2025 10:39:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] dt-bindings: clock: Add Qualcomm QCS615 Display
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
        <linux-arm-kernel@lists.infradead.org>
References: <20250221-qcs615-v5-mm-cc-v5-0-b6d9ddf2f28d@quicinc.com>
 <20250221-qcs615-v5-mm-cc-v5-4-b6d9ddf2f28d@quicinc.com>
 <5f5nt4g3fy7446gxnjg53n4uir57hm62ewgusekls5sbmadwez@pfxmhrkck3zi>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <5f5nt4g3fy7446gxnjg53n4uir57hm62ewgusekls5sbmadwez@pfxmhrkck3zi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=D6NHKuRj c=1 sm=1 tr=0 ts=67d2688f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=xE1T1L2TKFzN_Gv-B-QA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: FMbg4gB6mo_lieJXzZDMRy3-UERmBCph
X-Proofpoint-ORIG-GUID: FMbg4gB6mo_lieJXzZDMRy3-UERmBCph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_220944_516184_08A7352E 
X-CRM114-Status: GOOD (  12.83  )
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



On 2/21/2025 7:44 PM, Dmitry Baryshkov wrote:
> On Fri, Feb 21, 2025 at 02:50:15PM +0530, Taniya Das wrote:
>> Add DT bindings for the Display clock on QCS615 platforms. Add the
>> relevant DT include definitions as well.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I don't remember responding with it, nor does lore find such an email.
> I'm totally confused, what is going on?
> 

Dmitry, I will recheck all the series and update the tags and resend.

>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>  .../bindings/clock/qcom,qcs615-dispcc.yaml         | 73 ++++++++++++++++++++++
>>  include/dt-bindings/clock/qcom,qcs615-dispcc.h     | 52 +++++++++++++++
>>  2 files changed, 125 insertions(+)
> 



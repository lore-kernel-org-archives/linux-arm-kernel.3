Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299C6CE8E9A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 18:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1i2ZXNwjEcPtLkLQKb7CxSRAKZ/hfhZMiMaFS6mOGpQ=; b=zTfM7zDiPLtJx6gR0ltTNcVGbw
	QSuOwNbBO6EeWNgmnvxTgyXLQfaocDepjnfORKCU/IQ4ZHWtSiXWGpdHo+66gORkXGIfdtzhWwDLt
	pXBTvFeJN1Nub+9Yns2LjMnBORFoVkPhCHdeinO+5HaBchmcZMnfwwZP8gzydGYq0B8BDvZw/Y9Zh
	Iryq7fFRmT6TU3mp4PCAVSJzr6d3Xhcq58ufTfTMaHkQhK2z+S26TrCl0ix1dNAJcENebw2aFMxFt
	bSgNdQeiCAzJBFkIs0fSzcNauIEuQ/c/8hKOQk1/ZvbQgPPa9ddPCH0H3BcFgfUmQliwU8OnZ/x0T
	GfhMIa2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t42Cz-00000001PLr-01qc;
	Thu, 24 Oct 2024 18:05:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t421h-00000001MdV-3xgk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 17:53:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O9X2xb018730;
	Thu, 24 Oct 2024 17:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1i2ZXNwjEcPtLkLQKb7CxSRAKZ/hfhZMiMaFS6mOGpQ=; b=OZ2gebQauWdyEHHP
	8xZYh/BWLIgle3S8v6vNi/edwqwbPjJ/M+WEDYkmgVPJWf8FbXsY/u0SYedgbh2+
	FWQlm48hoVr/kr7uQEqxfoMlKzmrMqtB1NXEja6Kt0c5oR91dKCrdOp2V+nldarq
	Us82f27ERqEWKRXH1VpEHe7a5PYQiLccdEaTZrMig0AzQjwyHRDh5U3Rz4IUvwVS
	XdTdg7m8G3hC5xbf+NZHIjwPOGniOotQ8lDxz3lECb4jGlTrEGJZMBoFJrOmtplQ
	b2cA9xkG4HhvYOWLhhvV/mOD+jKJCO9CF0ywNC0GuYO2Uv+7VXU3Dum4GAN3Ih/Y
	ZJeOIg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em66ej1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 17:53:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49OHrRdf029277
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 17:53:27 GMT
Received: from [10.216.42.109] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Oct
 2024 10:53:23 -0700
Message-ID: <1b6b8585-4e7a-4ac3-85c6-bb6dafc147ac@quicinc.com>
Date: Thu, 24 Oct 2024 23:23:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable sa8775p clock controllers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran Shaik" <quic_imrashai@quicinc.com>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241022-defconfig_sa8775p_clock_controllers-v1-1-cb399b0342c8@quicinc.com>
 <glhmky5r3rd44hmnxgtgeelqp426fdsh7w2fqpuusz2ek6eauw@sfptftzsilix>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <glhmky5r3rd44hmnxgtgeelqp426fdsh7w2fqpuusz2ek6eauw@sfptftzsilix>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VSzStdRTRqwzeI_PgqhInfsFWFqLStKP
X-Proofpoint-GUID: VSzStdRTRqwzeI_PgqhInfsFWFqLStKP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=527
 suspectscore=0 clxscore=1015 mlxscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_105338_217368_B042F640 
X-CRM114-Status: GOOD (  13.10  )
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



On 10/22/2024 3:33 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 22, 2024 at 01:36:38PM +0530, Taniya Das wrote:
>> Enable the SA8775P video, camera and display clock controllers to enable
>> the video, camera and display functionalities on Qualcomm QCS9100.
> 
> Please mention the board / device rather than a platform.
> 

Will update in the next patch.

>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   arch/arm64/configs/defconfig | 3 +++
>>   1 file changed, 3 insertions(+)
> 

-- 
Thanks & Regards,
Taniya Das.


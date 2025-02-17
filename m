Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1589AC021A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hjqKwAEjBQEmoqd+2ugTsyb6OUqNmOcwB/Gk2YNfnE=; b=QJVc1rLykG/4nZ4KEMGGnVksnh
	hoVexV5OsXjGFl3wQqaMZ5pDfeiBQAE1Ra7s1Fp1xTm1m+s9pNQZhWYytsMqPhK2wYpSoXJ0rWBXh
	C8m8k4TxeaZEEnu/w6mSHU/z4b4bOM1E/xD7wFfLCUQn3X/yp8BEtbJsGMORKux5lpJeP6TZEq5xQ
	lJU2pmt6lkx8BNg/xAY99fUuVAuuiuKGsxHmw5lfXPFt8h923EwHprcwS7l3HCCc/rLrackdW1lHM
	tdoHmtpeiTMmaiy1Ur7ap0IW96X+9ofSeVGJDEnjI0xt9nWHnPo2a+dhHlVfutwwJGiFRuddlsW77
	OvFAEO0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyki-00000004Aqq-47Ry;
	Mon, 17 Feb 2025 10:53:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyAT-0000000452g-1sZJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:16:02 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H030c9002910;
	Mon, 17 Feb 2025 10:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7hjqKwAEjBQEmoqd+2ugTsyb6OUqNmOcwB/Gk2YNfnE=; b=F/pmuLRfn6c4NBZK
	9tZU2fCc604KUl4L9SEJnQhanqQ6lJLmxSErU+937agx6vjAGZFIAeI3YH1CsbxC
	T6S/HgwIt/Oet0N8C3RUuaTkdZwIsDqYpMgD+9HmbvXffg4qwS2tVm6bd3Tpswdt
	iKswX/eVmDpCTwGS7t2u0aebKVmFzZE8fn0+/J5GOMkzefUxv6mJay6lpoUcZB2r
	zvaRGlZu9D4/qLuANJ3oweI2Yy1mvdwKX/nt0fIsbZ8gzkmXSmPVATc0euUFs7eO
	jXKMFOOG9diS6870nYkAdUHMdMzkBgIgG3LI42dIt/B62pZtLP/VZa5/pDo5IWL6
	jVcWGA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7tsa2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 10:15:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51HAFn2o021933
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 10:15:49 GMT
Received: from [10.151.37.100] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Feb
 2025 02:15:43 -0800
Message-ID: <779a23f9-868a-4fe3-abc6-9240fd3ab491@quicinc.com>
Date: Mon, 17 Feb 2025 15:45:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH V5 0/6] Add minimal boot support for IPQ5424
To: Bjorn Andersson <andersson@kernel.org>, <konradybcio@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <ulf.hansson@linaro.org>, <linus.walleij@linaro.org>,
        <catalin.marinas@arm.com>, <p.zabel@pengutronix.de>,
        <geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
        <neil.armstrong@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <quic_varada@quicinc.com>
References: <20241028060506.246606-1-quic_srichara@quicinc.com>
 <173085441672.26510.12002868497417768812.b4-ty@kernel.org>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <173085441672.26510.12002868497417768812.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0vfDTzgoZsBo6oayox3MWP30CzYjNDKX
X-Proofpoint-ORIG-GUID: 0vfDTzgoZsBo6oayox3MWP30CzYjNDKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 mlxlogscore=842 clxscore=1011 phishscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_021601_612697_C5C20E77 
X-CRM114-Status: UNSURE (   9.55  )
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



On 11/6/2024 6:23 AM, Bjorn Andersson wrote:
> 
> On Mon, 28 Oct 2024 11:35:00 +0530, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> The IPQ5424 is Qualcomm's 802.11be SoC for Routers, Gateways and
>> Access Points.
>>
>> This series adds minimal board boot support for ipq5424-rdp466 board.
>>
>> [...]
> 
> Applied, thanks!
> 
> [6/6] arm64: defconfig: Enable IPQ5424 RDP466 base configs
>        commit: fd516bb4f48fc527744cae42d8e156fb09bce157

Hi Bjorn,
    This patch is not appearing in mainline. Can you please
    help ?

Regards,
  Sricharan


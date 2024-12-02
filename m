Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A80AD10DB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 07:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v26/TYOob+NECfnPBpMu7z6StsYT9j5xEcam3fwIlbs=; b=U/06TVmXSupTBzmju9tEKDvm1V
	8PKyrk54xLD6LWbAl4bUfgvz2ixpKgRBj9Q3juzUlYUDrt7s8wzEAPwpei++wVDDDqDglq9TmOw+D
	LOTzG5Tr1tGn/Gm51VSbs75hBIFEH9qE5E0YZzQJBlKXi6pnzKhufDpS3iQsyrJWmyNtyOj+bfE2U
	bt4uo2nxEenwJxge2P/bKPIH2z9pD7sifi1iQHQR2reIVUW+lC8CKVyK1zgP/PJy5SqgDLNkLau6/
	QmczHJcV7BjwLREgvcbd/cf5RyAzSnE+jGoWqyQvqh68zAanAq2H55jjEofW57DTHa42wHKHZlkJU
	wNSiQzEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI17C-00000005KbV-0mDW;
	Mon, 02 Dec 2024 07:45:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI105-00000005JRN-40FR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 07:37:47 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B1NGR0o028211;
	Mon, 2 Dec 2024 07:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v26/TYOob+NECfnPBpMu7z6StsYT9j5xEcam3fwIlbs=; b=aPgUE9S+gEkelo/M
	e3kNbnO6OOX/CM1QNfdytGYcJk4j980xmQ38QcvvLCDvsd8z/E/sWzqM+i/5IxeN
	7WKFqFx73e1C6ulU9BZqBU4FtPG543i/1IbX5LyZyv1PkNj3ohI36UlfcAAZSYZb
	8F9UmTi1qcvriPC3jLMIeRbSqr2FvxC+Q1q2pJl2CXziKl6mnX401LC8LDdx0jRL
	fiNpnjf7h0bC6HnjNfkmYKtblCUE0dqAOqH8xO1pHbBxM6gSACKXN4HCpG1W1s2z
	vA16C+5g8aaaH3wQesu5Fsc/Wow0ZUxZDQ4sAftgfbUhJ6KFMQV9EobKuKR1mJaZ
	T0S/yA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ufe3r8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 07:37:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B27b7sJ000401
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 07:37:07 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Dec 2024
 23:37:01 -0800
Message-ID: <8d08c539-6abf-4def-890f-e54176f26efc@quicinc.com>
Date: Mon, 2 Dec 2024 13:06:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] clk: qcom: videocc-qcs615: Add QCS615 video
 clock controller driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>,
        Abhishek Sahu <absahu@codeaurora.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-10-7d3b2d235fdf@quicinc.com>
 <d4afdd01-3147-4cfc-820a-f6004637e6bf@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <d4afdd01-3147-4cfc-820a-f6004637e6bf@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: o78Pex3XS_OFdCfr-0bRkYSDMPy3W05E
X-Proofpoint-GUID: o78Pex3XS_OFdCfr-0bRkYSDMPy3W05E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=959 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_233746_001162_2AA2AEC2 
X-CRM114-Status: GOOD (  10.99  )
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



On 11/9/2024 10:52 PM, Bryan O'Donoghue wrote:
> On 08/11/2024 04:09, Taniya Das wrote:
>> +static struct gdsc vcodec0_gdsc = {
>> +    .gdscr = 0x874,
>> +    .en_rest_wait_val = 0x2,
>> +    .en_few_wait_val = 0x2,
>> +    .clk_dis_wait_val = 0x6,
>> +    .pd = {
>> +        .name = "vcodec0_gdsc",
>> +    },
>> +    .pwrsts = PWRSTS_OFF_ON,
>> +    .flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>> +};
>> +
>> +static struct gdsc venus_gdsc = {
>> +    .gdscr = 0x814,
>> +    .en_rest_wait_val = 0x2,
>> +    .en_few_wait_val = 0x2,
>> +    .clk_dis_wait_val = 0x6,
>> +    .pd = {
>> +        .name = "venus_gdsc",
>> +    },
>> +    .pwrsts = PWRSTS_OFF_ON,
>> +    .flags = POLL_CFG_GDSCR,
>> +};
>> +
> 
> This looks good to me, except; could you please check if venus gdsc 
> should be the parent of vcodec0.

For the video gdscs we generally do not explicitly need to mention the 
parent GDSC.

-- 
Thanks & Regards,
Taniya Das.


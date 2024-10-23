Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85445CFA460
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sdx/bt6PJOEJstPldXkgqJQx0q6plWR/NY5/L1mrPEY=; b=4XOGDa6+iYs5LW/7wRY6qOL4A+
	Lb1O/SV2xzN391ZTMal/OerCk6usXYwe/QvvvPUbVbkk/jqksC6igTWpEXNUe2zMTevsw2XpxmmrW
	x9nJbA9YKUzg/Pu6jJWa0+y25AFTrcv5q2JXObnimsAMusuzclVMhK0fc4CltQjJ7r0z9ty+FL5A4
	FWdIVweJUaZwodhwFQYeYtFIBEAs/KI4HUvBrol9uwsexmXy5DwdON/zhF0jVQSw48iZ7VH8IF+q4
	ET2yq4RHlYtlDF+vp/CM+OybnZ0bvdT6d0G/49i5ShV2CS4A91aR+hhOMm6dA/D3hq1A5cZQv1iXk
	lLqLBBQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3h0p-0000000Fgam-2O9v;
	Wed, 23 Oct 2024 19:27:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gTj-0000000Fb9T-0i3t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 18:53:08 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9hUiH025415;
	Wed, 23 Oct 2024 18:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sdx/bt6PJOEJstPldXkgqJQx0q6plWR/NY5/L1mrPEY=; b=M4DNjJjXmR5M8Wg3
	YCWES9BsqHqHh2vLn1/BQnTjoYiqB8LWeEeERUS0KZ/1Y37XbzCzm3Dt1kG4aspJ
	7It7AlfKW2BZaZDc4uxOFSvrJ6ANUYBsgR7DUJNfCJDbWJyARC3tobQDWUpoZb6e
	UJerkgjDb3aKf75yUrDOrlWHu+VbfYJTbkHHXAghdTkIdtOSWNF0DL4N1D48Hdj2
	35ZvPLmqU0bM2ycFq4GRXruhu4FTLenfh4uLSg6nhnNj2sR6ko81gVm0AnGd7QfG
	rWMcj4XPC7io4sJgoTjY8hsIs6WrgICrWVjORtL2t7rKapRbTPpBi+JuODQi4gU6
	DGLIDg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em41u7d7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 18:52:53 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NIqqRr012105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 18:52:52 GMT
Received: from [10.71.108.63] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 11:52:52 -0700
Message-ID: <3862bfc6-c2f9-4aef-98fd-1f2b5318a2a7@quicinc.com>
Date: Wed, 23 Oct 2024 11:52:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm-smmu: Document sm8750 SMMU
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg
 Roedel" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241021230449.2632493-1-quic_molvera@quicinc.com>
 <tf7zt3ytxdzgeop2n5ard2kivbjtcqun5jahgqvejynj2ttyon@eg2yd4ulouw4>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <tf7zt3ytxdzgeop2n5ard2kivbjtcqun5jahgqvejynj2ttyon@eg2yd4ulouw4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Cgifw-p_grS7sf9Iv9UNMCLAxMh3Xh0l
X-Proofpoint-ORIG-GUID: Cgifw-p_grS7sf9Iv9UNMCLAxMh3Xh0l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0
 mlxlogscore=739 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_115307_358464_A179F85C 
X-CRM114-Status: GOOD (  12.77  )
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



On 10/23/2024 1:25 AM, Krzysztof Kozlowski wrote:
> On Mon, Oct 21, 2024 at 04:04:49PM -0700, Melody Olvera wrote:
>> Document the sm8750 SMMU block.
>>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
> This is incomplete, what about clocks?

I agree, but I don't have the dt changes for the additional smmu node yet.
Should I update the bindings regardless?

>



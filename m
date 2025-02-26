Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64F5C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 05:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pq0VnmDD2J5WUBS9njZY7rvRpMdayjGUpkeBScg3ekM=; b=2ewu3a1c3dNzxDwJlziPv63FVq
	GwKLVaVr9rgS8iio1sDx3WUs3EWP/XJ8w8axoL+QGKf6V0tedv+R0RUWVdWwfMNPvY6Kzen9ULwJd
	dBObhSnETJ+JwGlP9hKQMsNWPYVvROZSaTIdzZbeT0wWpurAd8QcWMm1sOvariib9wbFDwO6EgyX1
	V/XwKLjc34Fey/DBeaOw1B6qSzW8Bopri/Ahb9p4dVDY3MBHJyRlbGJfMH7qbtUXWuL9rAeWixnO5
	ekjPgGcBm3tE8wULgGtmUyzYZ+v3e+8/nxsQf/r7+Y+FifC2BH5iLCFO6ycZMowfsqpIE77Qp5CTF
	IyOCgHTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAQQ-00000002TmE-0jSF;
	Wed, 26 Feb 2025 05:57:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAKI-00000002Skq-4Bem
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 05:51:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMWqar011761;
	Wed, 26 Feb 2025 05:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pq0VnmDD2J5WUBS9njZY7rvRpMdayjGUpkeBScg3ekM=; b=C2ikENMYRACnTxuw
	bI/s+EQQCe6OpTLIWYOJsv6HCa7zV09RbPZx/wkOn2YcqHNZgnyRIeP/ZnxoiuYB
	pjv8TjEM12072me4GgMFpQqnJ7JFfvf8xrBCwN7N5sg+WN59fDr+ZNynS4tvqbwO
	veC+P+9+/FPKVFEQZibOIIT+5ZwzuFjhpWDura5wnuLBb95iuSUeCzNh3yHy5JA3
	kyc/rxLXAhs3ID+dyWH9a8kvJdjFloa5u1AF7lt2uepf31Cywg6a2f0wcwrD10AX
	0C9aUOf4ucQ5Viij0+YTXz2banZQgW01LxFkZgq3cRIlC72g5H21fpYTN4u/aWVf
	s9AqhQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prmgv9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 05:51:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q5pGFx023779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 05:51:16 GMT
Received: from [10.50.7.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Feb
 2025 21:51:14 -0800
Message-ID: <786af13e-942a-09ff-49c4-2a3d7e9be7c9@quicinc.com>
Date: Wed, 26 Feb 2025 11:21:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] arm64: defconfig: Enable iris video driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20250225-enable-iris-defconfig-v1-1-1ed49c8396bb@quicinc.com>
 <2bfb37fe-6e6a-4f9a-82be-5776935563cc@kernel.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <2bfb37fe-6e6a-4f9a-82be-5776935563cc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: z8aScgOngP9vRzdKumFFZDUQ-X238CDA
X-Proofpoint-GUID: z8aScgOngP9vRzdKumFFZDUQ-X238CDA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0 adultscore=0
 mlxlogscore=714 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_215123_054555_613A937B 
X-CRM114-Status: GOOD (  10.74  )
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



On 2/25/2025 6:36 PM, Krzysztof Kozlowski wrote:
> On 25/02/2025 11:09, Dikshita Agarwal wrote:
>> Enable the building of the iris video driver by default.
> 
> 
> 1. Why?
> 
> 2. This was already sent by Neil...
> 
Apologies, I wasn't aware of that. May be I should subscribe to
linux-kernel mailing list for such patches.

Please ignore this patch.

> Best regards,
> Krzysztof


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CF8CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ejp+lg8gINEoy0MBHN/XIRMKOlDhM8ESEDoQsLHHuA8=; b=ILPG4RvpN5ipAY3f/hasn3S/J/
	1obMRvKRYamWSByLv3BV+Hk93Ur8CbL42cLbUN8pTc9oynXE0tBqhD0KvE7gmlqcbP9V664buOBbh
	53deNP0zlcVZs0q4Nzaj8AzOQGoyNVeTh3DzwOgN0iTA4FQWUcFXzqdmF0kMPPSxCya2Ud7/zvEeQ
	vui1LusB22+MfYOu41pRjAV1YlS0Q+9WmuvwYVNU9xoHo+9tHtyyzDNunf5MwLnvJknZn1Y8mCpFo
	NKfrlb5KFNcxfG3FBwzE1V6GOxTp7Vk8t5olf5Nej85mUk3eOix8PWx7+bfO+4IGaTzg8C8aOYV3H
	jT3DkvOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Bn-00000008Wzi-356A;
	Thu, 04 Sep 2025 02:59:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu094-00000008WAQ-36gv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 02:56:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5841FwwQ005260;
	Thu, 4 Sep 2025 02:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ejp+lg8gINEoy0MBHN/XIRMKOlDhM8ESEDoQsLHHuA8=; b=O59jBCvF2ICqwLVb
	t9JaKEau+qXN/urYCuizrLjH0cquYodbZ08tsTDBmhbP+NI1iub+F2Gi/wihg6DQ
	Ouk76+rDehwe5o2iEyrd/Kcr+nsL0Rovix7yfWi7MW0A2ZbnDuR5KMUkflgf5ov4
	x3SWws06tAR+aLGFZXxZPQ4vwQLARDwSFjunhQVZXuaV070xPi/MOh3jPpCvFMfe
	3sMPSNJgCUFmPQLpTKtIDkUl/8THKrRMyvIwSezyDxYo5fRlEfE7t4aXagchYHeb
	X7S4WB60lMRRdWQCvLB3CHvO4YNsOjzlCAk4ZdQAX0Sj6VQJELk3yRrcUGZ4Tofp
	AEXrrw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjnvcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 02:56:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5842u8vi021511
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Sep 2025 02:56:08 GMT
Received: from hu-panfan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 3 Sep 2025 19:56:08 -0700
From: panfan <panfan@qti.qualcomm.com>
To: <panfan@qti.qualcomm.com>, <mhiramat@kernel.org>, <rostedt@goodmis.org>
CC: <ardb@kernel.org>, <catalin.marinas@arm.com>, <dylanbhatch@google.com>,
        <kdong@qti.qualcomm.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
        <mark.rutland@arm.com>, <samitolvanen@google.com>, <song@kernel.org>,
        <will@kernel.org>
Subject: Re: [PATCH v1] arm64: ftrace: fix unreachable PLT for ftrace_caller in init_module with CONFIG_DYNAMIC_FTRACE
Date: Wed, 3 Sep 2025 19:55:57 -0700
Message-ID: <20250904025557.2002080-1-panfan@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819063418.1263119-1-panfan@qti.qualcomm.com>
References: <20250819063418.1263119-1-panfan@qti.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b8ffc9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=3H110R4YSZwA:10 a=yJojWOMRYYMA:10 a=S8iKQRKk4SiPzSIsZgUA:9
X-Proofpoint-GUID: MGCDhHIdEi94weTppguHRSFxRXu0UO34
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXxykn31WwF5h0
 FUssFX1Pg6Fo28epVw+3FvxOHMOpZE7PyeCJkkBjMGcRe7isd9U/lK639lhTWvZkMmCDkzppAZ5
 2j7UyBXPeJccIAlKx99ulwOvjP3quTK7K3OCIQXPPKX9dn99Hswu1cRbqXQDQ4B6+T+ERCvaddp
 eFNva7nxgEs82Dc/6Xljs0hgHLWlIdA25fERApygYjNOjE0pOXjqAWRZDoOR8Vskvc3qY5ePQEs
 I/3sAnxSjODNHJJM4tLqRtc7Beo6pD0BnF+fJX3GO8dPSr8QjM8lB1hbep0JDxtVtxBiMlxvvSz
 q8NKh/QFd8UlxLyQt0RRAyp8CK/QcawAwcg2Yp/1gcMsmHj3vnm0gm5C1aQijTZuOfdWGHEpEbB
 JENVi0VP
X-Proofpoint-ORIG-GUID: MGCDhHIdEi94weTppguHRSFxRXu0UO34
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_195618_896608_92EECD51 
X-CRM114-Status: UNSURE (   9.16  )
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

Hi all,

Just following up on this patch. Any feedback would be greatly appreciated.

Thanks for your time!

Best regards,
Pan Fan


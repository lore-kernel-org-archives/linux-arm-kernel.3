Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391BECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 03:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpuyT/5XEpYp3ndZ4kv1I9X8npAH/eSsVWL2KX4ktNI=; b=FetouplDg5ban8UuEhrWWPo2fS
	VcpUwSQoai8vpdLv27wVhX7/VoPt+0mbo6n2WnEIHa+uCnpjjZSNAUnAG01tDen8fgQ8JdeRa0Waw
	lnK3PdkaCnXFYoEbcS8ptzAVsATHv0AwNX0Zrw84Df3HoQIax6CqMmhdPjj1cd+5wr/pQoWOghYY3
	zuwVafgnG+a5t3YVPjYNfKjMm5C1GbqPv8FVcxpwY2YZUTKWNfXnBC910J+/DyCDWxuMY9lpjAYwZ
	tb3Z/NmylZiDmhF0OFU9TLzLxRQFlHcSdvsGkozrQEr7kLK6pJ5d0QRXGYO8rELFf1CD3c1TiudKn
	EYT6UjRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNbX-0000000GaZN-1Q1T;
	Fri, 05 Sep 2025 03:59:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNDQ-0000000GU4M-2NKZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 03:34:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584JA1C5031806;
	Fri, 5 Sep 2025 03:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JpuyT/5XEpYp3ndZ4kv1I9X8npAH/eSsVWL2KX4ktNI=; b=TKrcZdo00DSshiNA
	0dwjXllg43qgxRjxBQRs7YSdHIkhCjGdrI+mko1XxgCHQ6Ccp4H1tlT1zOuDa/ok
	SWD3s0y4Pqvi/42GtiaR35DmYtBYNW5JcqgjL3yu83ZjoI0idy6SNSV+RwKV8Uu6
	Wkd+FuAGlw17Uy4nS7pIMCGo8ioPnqEHzbNB1MkmQV6PscBrJIpWBVeGzcCHoAWS
	pzYMWrmeAD6DuksQRdGGEnnjK+H2NYmpDSVn//tA/nIC39xA3nUsXwHdyFxxHsZe
	IAxgHcLRUuRtVcd9srb2+rHfdLKLN3N65jT/NPFQEgWcr3gotiJkqT7YpggPS+K9
	kE91VQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw09r6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 03:34:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5853YBL5012620
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Sep 2025 03:34:11 GMT
Received: from hu-panfan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 4 Sep 2025 20:34:10 -0700
From: panfan <panfan@qti.qualcomm.com>
To: <mark.rutland@arm.com>
CC: <ardb@kernel.org>, <catalin.marinas@arm.com>, <dylanbhatch@google.com>,
        <kdong@qti.qualcomm.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
        <mhiramat@kernel.org>, <panfan@qti.qualcomm.com>,
        <rostedt@goodmis.org>, <samitolvanen@google.com>, <song@kernel.org>,
        <will@kernel.org>
Subject: Re: [PATCH v1] arm64: ftrace: fix unreachable PLT for ftrace_caller in init_module with CONFIG_DYNAMIC_FTRACE
Date: Thu, 4 Sep 2025 20:34:00 -0700
Message-ID: <20250905033400.3223310-1-panfan@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aLnLpArhiT-mQxn9@J2N7QTR9R3>
References: <aLnLpArhiT-mQxn9@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -nGpMRxczFvANa0QEIhaqcP3dSibql49
X-Proofpoint-ORIG-GUID: -nGpMRxczFvANa0QEIhaqcP3dSibql49
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX5fEsYrnRho3S
 o4Pi+LhZFvauQW2USB8/LkFfz1t4j//E3zUe1hTM9FDdUwbXsEimtRuadlPCwhx0LLqwYATsLXI
 hTxSheKEFaDYLweuJOY1g4DqVUilKDiYr7FArQatpWag+fm8TTJ73udnY2A6I+eV0iHooJ7yQYg
 ZvmIXziDqk7TukQE417FbaIQh6hHsP3Gd+cX4KoTl+Evi6A47NY6X0ZxWUd0p0usMZ9Rg7Ae/al
 fEEgyxaR1C0TBImiVKN7ZGVHQWiE8vw0sHqRDdUjgxHvZz31YonS39v7oxeLznAvg//LWK+jCMq
 G7sq+4/FjAeOO6Bf0KnKLYV0s/S12PE7X8oVU6o3a4WdxcK78e+SYV0FOHdnzOeQw2p4MF+rUWO
 K6Bef+tm
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68ba5a34 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1vadqSz47zZtUf88aekA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_203420_727579_61A191D5 
X-CRM114-Status: UNSURE (   8.78  )
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

Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mark,

Thank you for the review and ACK.

I’ve addressed the comment by adding an explicit check to ensure the
address is within MOD_INIT_TEXT or MOD_TEXT, and sent a new revision:

[PATCH v2] arm64: ftrace: fix unreachable PLT for ftrace_caller in
 init_module with CONFIG_DYNAMIC_FTRACE

Link: https://lore.kernel.org/all/20250905032236.3220885-1-panfan@qti.qualcomm.com/   # v2

Please let me know if anything else is needed.

Best regards,
Pan Fan


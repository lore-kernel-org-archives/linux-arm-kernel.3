Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083C6C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 09:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=op/Ag1A6md0DsDBJ/E5eHh1AniEZDJjKyNg/fUBJrS8=; b=Yoh7khoa1NXWLZr+mHuQZe5+2c
	8gVjw7OdJPNTtQ/llrkTu3IkjuwUphG0ogO0BKMSW3T57sSykY+VUW0GMaS8G9IY1VCPy30dwE5YR
	iyNKaG3/9QhmgRnl5kEd1I+37tAFHLktnsqTDBrO0Pt2Iy3EI3xZWlVdrNPG6qZCj+Niu4TnUCkdb
	NtBUvZQHshgxCRiEqj67kVlgEWrjGACyNH8ae4Lz8KZZBCbNNWrrqCFK7Rk6uio7wqOSZZq7cSryJ
	pC6TlDgfJdAQPh8evwUjZrz8yg+NThRAqgQ97/7JGE7lkWibvK6baw7dXh39YCC6vcV7L9T40AMHZ
	OgmJ2j4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchXd-0000000CD6R-3fki;
	Fri, 18 Jul 2025 09:38:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uch9P-0000000C8mx-44A8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 09:13:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8HJ6F008498;
	Fri, 18 Jul 2025 09:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	op/Ag1A6md0DsDBJ/E5eHh1AniEZDJjKyNg/fUBJrS8=; b=D7qaKLvRElgKI3Ky
	tZ/njhvZFfAryHKT4I0jpRzrMbUHk7amVrCD2dWqITi6Vlxbpwxh3D5P4RYbYpqs
	8AStEsCyhIj98tX7k+LcsaG1/fFVMUYM7wbdgaGbuNkRz3DROvABc7OWjNVtUkVY
	jmPy6xbhEMDdXLaNWmtZePrBWtpk4iD1vVcXN1Y4jxsuKDlOstTvLQIIOdONAna7
	CmKyf+qs1zDo7/4GQqIVwd5uYO3Lh13810rdQgBU8+3IGG7MlZr8DlSWL5bTxvSo
	9HEsxdG9gsox/66o+JiYjVBVuydZ/z9KHJeqZQdrBlWi/wrkB8PV8y2J8F668k8e
	l/aJzQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxbaw9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 09:13:02 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56I9D10o019181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 09:13:01 GMT
Received: from [10.253.76.178] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 18 Jul
 2025 02:12:55 -0700
Message-ID: <f361df26-0314-4011-9c49-3b030bf4d95b@quicinc.com>
Date: Fri, 18 Jul 2025 17:12:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] clock: qcom: gcc-ipq5424: Add gpll0_out_aux
 clock
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov
	<djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_suruchia@quicinc.com>
References: <20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com>
 <20250710-qcom_ipq5424_nsscc-v3-4-f149dc461212@quicinc.com>
 <193de865-980d-4fd7-9c43-39ae387a5d0b@oss.qualcomm.com>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <193de865-980d-4fd7-9c43-39ae387a5d0b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oceujg-cA7d6__dsGgV9v4PKOnMNanoS
X-Proofpoint-ORIG-GUID: oceujg-cA7d6__dsGgV9v4PKOnMNanoS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3MSBTYWx0ZWRfXwetrrYxaSbdY
 c0mXEjpl+t1ZeTXgV+y5aHbz2hXbHG6P7n7n/8wHFNAPKl6F+Ngf3m6RTscDNncSCr3eBU/SHnS
 e1kXpRvCQmUubm2mnupptVbYQPZ7qW+ihE3G2BfzTnWOKATdIGWYiRPcl87J0yqcbCzMwP8NgBv
 DyD1HbPT+adDvk0GlEDnzNphzilqIL4FbSo5V5NBifg4rpn8M9oqlyu2XzAkd7evSs/93CyRHla
 19vTa3UMYssjR2TKjSCeEXsUa1TJciOEmI1fA2hQr+s1kyRTBfz2Kjonq42ERovW0ptnkGvg+Oh
 ntnl01O0EWavc9CazSBULOTTsBdhTW4doHzelBQdazTIk0KIG/iiVKuZuKp3dg9U6uM31hk6BGI
 tORkGRuqnRthX5ZlCS+PqM+CIOeQxjLxPv/2ZrU5t1XDG4x1E8ke/VvFNDsClXMP/CaY4V6m
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=687a101e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=1O3MfNHGUYumxtBdEW8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=960
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_021308_129654_01445677 
X-CRM114-Status: GOOD (  10.04  )
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



On 7/18/2025 4:41 AM, Konrad Dybcio wrote:
> On 7/10/25 2:28 PM, Luo Jie wrote:
>> The clock gpll0_out_aux acts as the parent clock for some of the NSS
>> (Network Subsystem) clocks.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
> 
> nit: subject: "clock:" -> "clk:" to match the other commits to this
> subsystem
> 
> Konrad

OK, I’ll update the subject to use "clk:" for consistency in the next
version.



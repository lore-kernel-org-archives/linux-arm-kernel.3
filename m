Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFD7D0C617
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8Zb7tpksoD7fMvqbTloS+8Cuu9LoyXtYTMubuP1Hpc=; b=RJI5JvUzb6eX3b6lTnjNBpUnUi
	TTnp8ZR65/e9xxy2ndIbP7sYM2bsWR+kMcz8B9XWbzSErWhbpvW9myAeAY8a2wSVtzQUZIKiEzFGB
	EuHyvAma4UHRBpiD20MwKPucqschWBKX8vCYVnsbrmTM+FNaVJKL6EuxYXJkoGbTkbHgQQRPM1w8m
	AEP5zp8Qj4dxMXBQBF3BpDFWxjHdyFOkrF4e+AXq6fSQIWYOWrC74CENR+s2hmz+Ck99C+PgZJvqK
	fHBAGJgW1i3uUqNKYCwnmbYg7/PyVMi1dG0p00nvdR7seFNHc3YmIp9Ju+zJz01GKJC18e55Aa1G8
	eoJh6Xhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LCu-00000003zuj-3Aar;
	Fri, 25 Oct 2024 14:22:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KxX-00000003vz0-40Uu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:06:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P62N8m011840;
	Fri, 25 Oct 2024 14:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c8Zb7tpksoD7fMvqbTloS+8Cuu9LoyXtYTMubuP1Hpc=; b=cHyVY4Y+LpwOph0K
	x0rE8GwEuo/82S5c9vhu99LQC2ynyaBZGuhFZJmrz+fHSArvw6sFa2by40NhwJtL
	6D3G5mYe1cqnuZZfGOp7z3+o0WCZWLcXfOUEDzC+jkQKWE2P7lxBO3HJ7eB7p2V2
	piiyuBXuSWV+JGIU6wVFeFdbzaXBPWhfmgwzYhcZS5QOd2XTH7P7zEdPGo3q3uoT
	QbAypr0gIJYlY2NS/HKxTqFFvS9v9dA2R2leWRXB8C3pe5glg4xzInZ1upbSfaGw
	FHlaoM+Qd0J3oCPaxVEECy1GNEt83cqITAoczCuWw2xQgoOGqvw7x0goBbvz0R4r
	k+pxDQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42g5q81be3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 14:06:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PE6OIX012362
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 14:06:24 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 07:06:20 -0700
Message-ID: <72a0b7b5-4209-f969-0726-e411b5a74e01@quicinc.com>
Date: Fri, 25 Oct 2024 19:36:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 3/4] pmdomain: core: Fix debugfs node creation failure
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
CC: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>,
        <ulf.hansson@linaro.org>, <jassisinghbrar@gmail.com>,
        <dmitry.baryshkov@linaro.org>, <linux-kernel@vger.kernel.org>,
        <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <konradybcio@kernel.org>,
        <linux-pm@vger.kernel.org>, <tstrudel@google.com>, <rafael@kernel.org>,
        Johan
 Hovold <johan+linaro@kernel.org>
References: <20241023102148.1698910-1-quic_sibis@quicinc.com>
 <20241023102148.1698910-4-quic_sibis@quicinc.com>
 <ZxuixxBzQZUdIW1c@hovoldconsulting.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <ZxuixxBzQZUdIW1c@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ehmzMwQX5Q7m_GJ1jVenFpukylRey0u9
X-Proofpoint-GUID: ehmzMwQX5Q7m_GJ1jVenFpukylRey0u9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_070636_040304_C34EE180 
X-CRM114-Status: GOOD (  12.82  )
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



On 10/25/24 19:23, Johan Hovold wrote:
> On Wed, Oct 23, 2024 at 03:51:47PM +0530, Sibi Sankar wrote:
>> The domain attributes returned by the perf protocol can end up
>> reporting identical names across domains, resulting in debugfs
>> node creation failure. Fix this failure by ensuring that pm domains
>> get a unique name using ida in pm_genpd_init.
>>
>> Logs: [X1E reports 'NCC' for all its scmi perf domains]
>> debugfs: Directory 'NCC' with parent 'pm_genpd' already present!
>> debugfs: Directory 'NCC' with parent 'pm_genpd' already present!
>>
>> Reported-by: Johan Hovold <johan+linaro@kernel.org>
>> Closes: https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
>> Fixes: 718072ceb211 ("PM: domains: create debugfs nodes when adding power domains")
>> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
>>
>> v3:
>> * Update device names only when a name collision occurs [Dmitry/Ulf]
>> * Drop Johan's T-b from "fix debugfs node creation failure"
> 
> Also seems to do the trick:
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> 
> But perhaps you could consider starting enumerating the duplicate
> domains from 2 (or 1) instead of 0?:
> 
> NCC_1                           on                              0
> NCC_0                           on                              0
> NCC                             on                              0

We are just trying to make sure node names are unique and
can't ensure the pd-name correctness since ida starts its
number generation from 0 and I didn't want to shape the
fix just to cater to our specific case. The firmware fix
will be in charge of ensuring pd-name correctness.

-Sibi

> 
> Johan


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948E7C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 06:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+3iGwj/hO6S7Q34SFvoBpBvY/YCE7J0Uke+mqkFKdM=; b=TWpne+lEauKKA+KPOQp7CytQWn
	Tqm+4tJfiEOY7nqoOqhJP1ZOKHfeTjJeJFNysrF4V+kma7YzdcKqi8tp7B177pooSyT0eC9qViFbp
	pCF5iAHkZQ7KjzUZ7kjLelk3Go5eXt+slq+hcGn/ZBTGL5+IyJUOY8AwSTBjQYFAG574tDTvm6mBx
	MTg+xZlcTReNVcUsu+7bTZguW9DShhcIxG/2f8aoTuPeyW1L/otedviX+xAzh2jq/52eo0GaiVFtN
	o/MP9J7ItXUWGRt9V0dRyt0+BRebs0iBQzZz+MR/4SjUYDMuZULRKWQHeuwgSdRDSoakD37GS5dEV
	vXQGUDLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBgg-0000000AeUI-1URL;
	Tue, 06 May 2025 06:21:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC74K-00000009Vb5-2tVA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 01:26:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545KTahu007918;
	Tue, 6 May 2025 01:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a+3iGwj/hO6S7Q34SFvoBpBv
	Y/YCE7J0Uke+mqkFKdM=; b=lLWokG/oTSHi6rlDNIPU9NU/6RtsEIwXEn99+Dqn
	LGbfLebmWVRwfX8hTtAcN7uZbSYiMAOA/AUYrQqtyCfph/eFNFR55B+AmYfuzskK
	qp9s9QvxkXJinwdh+1fV975rl16fxG3SChI4GGuEOuecfDdQvB5KFuCvURJbyyes
	jmP4zE7fewYkZJ4xEe0WIWzuJSRDLXSX4bG7O3WyMIJ093QPwzuLeXdllALpbqZe
	iRvn392OydCJLw0J8O31CeLzBY1dMO/8P+RJSOUurXGQ+2PKtUVzi98/4CEP2DkW
	gcjQLH3yPwFILQh4k+DmL3zF+j3P4SxOD1rkAgE9KyGDnQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep5xbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 01:25:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5461PpoR000950
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 01:25:51 GMT
Received: from hu-mdtipton-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 May 2025 18:25:51 -0700
Date: Mon, 5 May 2025 18:25:50 -0700
From: Mike Tipton <quic_mdtipton@quicinc.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi
	<cristian.marussi@arm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh
 Kumar <viresh.kumar@linaro.org>
CC: <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Peng Fan
	<peng.fan@oss.nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3] cpufreq: scmi: Skip SCMI devices that aren't used by
 the CPUs
Message-ID: <aBllHt7A2nP/9x3N@hu-mdtipton-lv.qualcomm.com>
References: <20250428144728.871404-1-quic_mdtipton@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250428144728.871404-1-quic_mdtipton@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=68196520 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=3H110R4YSZwA:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=8AirrxEcAAAA:8 a=yJaCyoTPdldMf7LLIq8A:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=TjNXssC_j7lpFel5tvFf:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: xQyI9TTY1mL-lT4GgZf6t5ZYvE89kQxv
X-Proofpoint-GUID: xQyI9TTY1mL-lT4GgZf6t5ZYvE89kQxv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDAxMSBTYWx0ZWRfX0c07hmmoRyzu
 LDWrWnnWv0/IlnrcjiVXRgnYvkD5HQsp5bdZIcTS3Ww3dRnV6+lb3FHQzRn0Nu4CE5ohLo35EE3
 MKWpVsDkWPL7//XRwgO1B5Ap0ztm9P674s9K5i4ifZIqFlhXWCbSIc9r5ABVp+gZjTfGb0tUbRX
 tplERRuJtyhiHFdJkXtIfrRcmuWfMWUtvQqH9IyzS+B7z24iL8mT2Uitj7uf/LCk8tCHk0My3yu
 9bOsebPbHJWneXjaOU674k3uq0f0ax1pgOOQ/HLaF/3yMt/V+qK2tDRbQ9TDPhMMZXuUt/3/iRY
 iUVUEF9bHJ3gqd78jAUeDbRZM8AkFGjdDvnbqJhp6oUQIfhzS12fZ+JxzDVF3KKdkfa9Pyyvbkb
 KznSbL3vilQGSjCN0mGXpeB7U4v3hct0eDyZenBiokuEQJs7RfQKSxAzer5ybRqNDw4Kbexz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_01,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=809 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_182600_859306_F49E125D 
X-CRM114-Status: GOOD (  14.48  )
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

On Mon, Apr 28, 2025 at 07:47:28AM -0700, Mike Tipton wrote:
> Currently, all SCMI devices with performance domains attempt to register
> a cpufreq driver, even if their performance domains aren't used to
> control the CPUs. The cpufreq framework only supports registering a
> single driver, so only the first device will succeed. And if that device
> isn't used for the CPUs, then cpufreq will scale the wrong domains.
> 
> To avoid this, return early from scmi_cpufreq_probe() if the probing
> SCMI device isn't referenced by the CPU device phandles.
> 
> This keeps the existing assumption that all CPUs are controlled by a
> single SCMI device.
> 
> Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---

Hi Sudeep / Viresh,

Any thoughts on this?

Thanks,
Mike


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE16C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 15:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVZV0AwDXeRJIVKP1ntdkFoyDgbEMhaaG3s/gT1aGF0=; b=NsVe+SZxNaJ4zhG/JpHpN4pcsY
	WLxeSCBKHtQeUGnuUKpXjIgOWjlNQYYERTKiAe2XVNGvDLeQ1fSQ3ga9Xv4XSs8Yn29Haz/iVpTfb
	z6/Giqv37Rn86xBT1q3tPGPkG4hSXi5kX77Lc0fDypvOfsX0fHfAl91LHcGYaBid8gCqRewtdh2pO
	l9nAon7YpRfzjJtn9flW+1mKRcAzK4N20NT9inO0c+RUbZLI9Sdn2ml3dLJVs4uxtWKfKnSB2CAvw
	fJHEUjGXhK/ZIXPNsOsQOcR96ol2ttChdNj3SN+/avk1Djf3eRDLTbnNfmCJvtL//H6jEAqxeCCK+
	xCMAUFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LrK-00000002emQ-1OMe;
	Mon, 14 Apr 2025 15:36:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LpS-00000002ePB-25p6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 15:34:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99tDl015786;
	Mon, 14 Apr 2025 15:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oVZV0AwDXeRJIVKP1ntdkFoy
	DgbEMhaaG3s/gT1aGF0=; b=OeKHL6vXUOTAEqHdRvx07ebA6GxJAj+OUH8Gln3R
	woSPKnmGqdx/jYw6G8ZrJcNntgDDTIFCzAO0FliOGNzHnl5OyRTZVsmXgXotQ3ZG
	UKEVlbrLoNW9Fw2DAq+B+A3RogaJFfK7rOk2mDq1uX+BVpeXw41Fi0F0X2XoytHy
	TK0lsSC1aHHvQw73HoqdP7QimG1q2oUC77e17OX84y+OOmWuaD3gzTj0DZErGtBo
	b0nT9vnHMTFYCkODBae2t9w3ECAzAcZuirDcBsefzwZkFMOZsJ0o8BBy5dSyyKro
	o5BMFwti7wXwoJplLKeVSZOyj8Wu7xEZLa056QU3qKN6bQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6d1mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 15:34:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53EFYQnp004077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 15:34:26 GMT
Received: from hu-mdtipton-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Apr 2025 08:34:26 -0700
Date: Mon, 14 Apr 2025 08:34:25 -0700
From: Mike Tipton <quic_mdtipton@quicinc.com>
To: Peng Fan <peng.fan@oss.nxp.com>
CC: Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi
	<cristian.marussi@arm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh
 Kumar <viresh.kumar@linaro.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] cpufreq: scmi: Skip SCMI devices that aren't used by the
 CPUs
Message-ID: <Z/0rAfQjxjZEAIeP@hu-mdtipton-lv.qualcomm.com>
References: <20250411212941.1275572-1-quic_mdtipton@quicinc.com>
 <20250414083832.GA19563@nxa18884-linux>
 <20250414-splendid-clam-of-democracy-dacf96@sudeepholla>
 <20250414102813.GB19563@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250414102813.GB19563@nxa18884-linux>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ctqw9QoNA1g2hcgJ4hfNZGubd1CKCaWV
X-Proofpoint-GUID: Ctqw9QoNA1g2hcgJ4hfNZGubd1CKCaWV
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fd2b03 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=odXGOWDWpvyb1jO9vMYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=661 suspectscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_083434_559501_3AC0C8E2 
X-CRM114-Status: GOOD (  19.11  )
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

On Mon, Apr 14, 2025 at 06:28:14PM +0800, Peng Fan wrote:
> Hi Sudeep,
> On Mon, Apr 14, 2025 at 09:23:24AM +0100, Sudeep Holla wrote:
> >Hi Peng,
> >
> >On Mon, Apr 14, 2025 at 04:38:32PM +0800, Peng Fan wrote:
> >> Hi Mike,
> >> On Fri, Apr 11, 2025 at 02:29:41PM -0700, Mike Tipton wrote:
> >> >Currently, all SCMI devices with performance domains attempt to register
> >> >a cpufreq driver,
> >> 
> >> The scmi cpufreq device is created based on entry
> >> { SCMI_PROTOCOL_PERF, "cpufreq" },
> >> 
> >> So the scmi-cpufreq driver could only probe the upper single device.
> >> 
> >> How could the driver work with all SCMI devices with performance domains?
> >> 
> >
> >IIUC, this is on a system with multiple SCMI servers/providers some of
> >which don't deal with CPU performance domains at all.
> 
> Yeah. This sounds valid case.
> CPU perf only needs to be managed by one server, the other server
> also has performance domains that only for peripherals.

Yeah, this is the case we're trying to fix.

> 
> Thanks,
> Peng
> 
> >
> >-- 
> >Regards,
> >Sudeep


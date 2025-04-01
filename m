Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEE8C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 01:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plP8oj1jjF0QukAD+IbETCZ0Df3fQbNghQ/Wqix13W8=; b=V9Iou+/AuZb7+q5ILbcFTZrhM3
	w3NnQxYIP/fR7MI0e/euiRXzdnGRe/pvX0OBvwHwry0GVSv5Rz6NxQ56PP2WbacwErsPyb4mtunBc
	1rGkBwjqqK2mrnGttVHpHnBdxVkhaqXiWgyl9ow/xqwAhuQwb0G64DJuKYvGFhQoe/DV6duNCrhS4
	Isy8U/QLi/A/Meg+Yrm3qeN132p9cYeNpc2YpmnUbRWSFUXN9Cr3dG0GzQUXG6XPRyYHbvUBeXVpa
	Zt1j4umaEfVt5dDyJoOKBhgb9vCKwLQHPx06g83rcQZYxFp1ZsDQbpyQG70hHTXwZvWKvBf91RPy4
	1ZT67iaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzQ5k-00000001heD-3bO4;
	Tue, 01 Apr 2025 01:07:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzQ3x-00000001hUU-1kdX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 01:05:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFCtSg011972;
	Tue, 1 Apr 2025 01:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	plP8oj1jjF0QukAD+IbETCZ0Df3fQbNghQ/Wqix13W8=; b=Ws1xskBNy6azB3WV
	t4UlZJma4MELDSaqCI7dQRwBP/DsNs9tYO0kVi+wGp41O1WMOsG86D5qKGhxPCHj
	CARaY+EX324qjy/TTXefhiWrnrTdq3PtLCkG/j5FerTipgZxWTojuxl5cSf5aPKq
	ZChBgMtS7eOwnKR2zCAk0QZAs91xfNt4r+WRQW4ayi3z/FB97hswtltkYPnudaO+
	oic0NgfuRKNM3vrFZOgzIKPCvU3CMN4qOosfq89iVbR87NHdzi2fAFwbhapIxFKh
	OiwaQkGABxInkujkjq1+3raoTxVjDHlVblDLP0n4J5vyS2R9BTO0kfYEhYKrtu8J
	jk/JYQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9mjnxn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 01:05:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 531154r9027423
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Apr 2025 01:05:05 GMT
Received: from [10.133.33.107] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 31 Mar
 2025 18:05:03 -0700
Message-ID: <bd93fcc8-b24a-4215-a5d5-aeaea022c789@quicinc.com>
Date: Tue, 1 Apr 2025 09:05:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] Coresight: Allocate trace ID after building the path
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>
References: <669d3cd7-6dce-48cd-a409-567ebfaa5309@stanley.mountain>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <669d3cd7-6dce-48cd-a409-567ebfaa5309@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Mfhsu4/f c=1 sm=1 tr=0 ts=67eb3bc1 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=1gzaYbZdkDmZoBbahxsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: q0EeAvgOGBZYBMhL8k70tNC-ZZJ22Zp5
X-Proofpoint-GUID: q0EeAvgOGBZYBMhL8k70tNC-ZZJ22Zp5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_11,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=843 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_180509_466816_311C4611 
X-CRM114-Status: GOOD (  13.00  )
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



On 3/31/2025 10:14 PM, Dan Carpenter wrote:
> Hello Jie Gan,
> 
> Commit d87d76d823d1 ("Coresight: Allocate trace ID after building the
> path") from Mar 3, 2025 (linux-next), leads to the following Smatch
> static checker warning:
> 
> 	drivers/hwtracing/coresight/coresight-core.c:697 coresight_path_assign_trace_id()
> 	warn: assigning signed to unsigned: 'path->trace_id = trace_id' 's32min-(-1),1-s32max'
> 
> drivers/hwtracing/coresight/coresight-core.c
>      681 void coresight_path_assign_trace_id(struct coresight_path *path,
>      682                                     enum cs_mode mode)
>      683 {
>      684         struct coresight_device *sink = coresight_get_sink(path);
>      685         struct coresight_node *nd;
>      686         int trace_id;
>      687
>      688         list_for_each_entry(nd, &path->path_list, link) {
>      689                 /* Assign a trace ID to the path for the first device that wants to do it */
>      690                 trace_id = coresight_get_trace_id(nd->csdev, mode, sink);
>      691
>      692                 /*
>      693                  * 0 in this context is that it didn't want to assign so keep searching.
>      694                  * Non 0 is either success or fail.
>                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> True enough...  coresight_etm_get_trace_id() returns -EINVAL on error.
> 
>      695                  */
>      696                 if (trace_id != 0) {
> --> 697                         path->trace_id = trace_id;
>                                  ^^^^^^^^^^^^^^^^^^^^^^^^^
> It doesn't make sense to store -EINVAL in a u8.

Thanks for reporting.

Jie

> 
>      698                         return;
>      699                 }
>      700         }
>      701 }
> 
> regards,
> dan carpenter



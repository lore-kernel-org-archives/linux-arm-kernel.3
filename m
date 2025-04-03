Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DD3C36014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 00:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uer0RfSroTyaMMgudcavQQBrWzkwUHa+awFpTFXVkX8=; b=ByJzb1eoosX4c54RASSyo6QHm8
	mAB0ioscggCPIADG7qMSOKPbAMhrG2qBobvO88ZoUv30Czidv41WIt8x5qoEKWwKE7ZlzIvPr+6Al
	Tngl4f7YJ/ao4+vP9Ips8wEK0fLpGq5SpewbCqoCUjo6eeHMkgMsCJJPLxRy4nkgSXgdV3yvdoFWA
	3OAfjF7A3joNfFZ6da3O1x5pSZQ+qzJaZfGSz0pGJkQOuPvpNSiZ36U7gg8vbBarJVyrDtbXe2SCX
	w+qM8u4Lr9vtKbfFjYFmTmNmahFrp3pr7TowCSHk0mqfYTgQoTVzS2ZAg7dmN7RI9Fato2BD+p81g
	n0Rj7dbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u08sA-00000007WLj-1wDA;
	Thu, 03 Apr 2025 00:55:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u08qO-00000007WCv-3v4W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 00:54:10 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532KD4Ga009884;
	Thu, 3 Apr 2025 00:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uer0RfSroTyaMMgudcavQQBrWzkwUHa+awFpTFXVkX8=; b=i70vckDxE//X8lw/
	wz/r3KZ3iiiTM1gKzGfsoHjGblt7gu9el6ELqtL0djDdHuOKF98EkA9CiqUP7kyo
	1QiMW8Uyr/D4MYpH7IqcbMJbx1lO9dnmzug4Ij7V0GsBiLDNoAKfoR47w36KNVBf
	ZZBORWr+5nujUTETNL/JsNryVsR5fMOyMpsSuoo632OR6PLLBRZZ3n+A3v2uAHfC
	XiF20ns0gOc5fZ8axocqv8yCGm/CkJRxgJMo3U2p+er8xyHwHVIzcf9e0vmzJldy
	57Yjl0Sxtp0E0jEbJ3HUE7MHYjNspglQMVVXZkQeK612+sKeeXO1t6+/TZbBJtlK
	QYY6lg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sc2yrey9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 00:54:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5330rx8K022776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Apr 2025 00:53:59 GMT
Received: from [10.133.33.117] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Apr 2025
 17:53:57 -0700
Message-ID: <98c1acbc-7e14-4aa1-9c1e-831be9eb4c91@quicinc.com>
Date: Thu, 3 Apr 2025 08:53:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] coresight: core: Disable helpers for devices that
 fail to enable
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>
CC: Yabin Cui <yabinc@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250402011832.2970072-1-yabinc@google.com>
 <20250402011832.2970072-4-yabinc@google.com>
 <CALJ9ZPOvcxswvfbpWkXgJ=WL+HLa33nm0ZzHogYNZ9keXfi1MA@mail.gmail.com>
 <20250402133232.GJ115840@e132581.arm.com>
 <CAJ9a7Vg4DGzPhnSBh2taTgUTORMY3GUPpJY2bHjkMdFB1=wP=Q@mail.gmail.com>
 <20250402141228.GL115840@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <20250402141228.GL115840@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=AMoviu7M c=1 sm=1 tr=0 ts=67eddc28 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=kdkFstmWLiu210ncHx0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: KcGwo3aitrWkFLNwy-z2p51p0dX7CYSy
X-Proofpoint-ORIG-GUID: KcGwo3aitrWkFLNwy-z2p51p0dX7CYSy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_12,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 impostorscore=0
 clxscore=1011 spamscore=0 phishscore=0 mlxlogscore=927 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_175409_115861_2DB09045 
X-CRM114-Status: GOOD (  24.63  )
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



On 4/2/2025 10:12 PM, Leo Yan wrote:
> On Wed, Apr 02, 2025 at 02:50:22PM +0100, Mike Leach wrote:
> 
> [...]
> 
>>>>> @@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>>>>>                  /* Enable all helpers adjacent to the path first */
>>>>>                  ret = coresight_enable_helpers(csdev, mode, path);
>>>>>                  if (ret)
>>>>> -                       goto err;
>>>>> +                       goto err_helper;
>>>>>                  /*
>>>>>                   * ETF devices are tricky... They can be a link or a sink,
>>>>>                   * depending on how they are configured.  If an ETF has been
>>>>> @@ -480,14 +480,8 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>>>>>                  switch (type) {
>>>>>                  case CORESIGHT_DEV_TYPE_SINK:
>>>>>                          ret = coresight_enable_sink(csdev, mode, sink_data);
>>>>> -                       /*
>>>>> -                        * Sink is the first component turned on. If we
>>>>> -                        * failed to enable the sink, there are no components
>>>>> -                        * that need disabling. Disabling the path here
>>>>> -                        * would mean we could disrupt an existing session.
>>>>> -                        */
>>>>>                          if (ret)
>>>>> -                               goto out;
>>>>> +                               goto err;
>>
>> Going to err here is wrong. The comment above specifically states that
>> we do _not_ want to disable the path, yet the new code flow disables
>> helpers.
> 
> Okay, now I understand here avoids to disable source and links for a
> sink error.
> 
>> then falls through to coresight_disable_path_from() - which
>> the original code avoided and which also disables helpers a second
>> time.
> 
> Seems to me, the conclusion for "disables helpers a second time" is
> incorrect.
> 
> I checked the coresight_disable_path_from() function, when the current
> 'nd' is passed to it, it will iterate from the _next_ node after 'nd'.
> 
>     /* Here 'nd' will be skipped and start from the next node */
>     list_for_each_entry_continue(nd, &path->path_list, link) {
>         ...
> 
>         coresight_disable_helpers(csdev, path);
>     }
> 
> This means the _current_ coresight device (here is sink device) will
> not disable its helpers.  Could you confirm for this?

It seems there is an exception that the helper devices connected to the 
sink? The sink device may not the first the device to be enabled in the 
path if the sink device has a helper device.

So I think we should add following logic before return?

                 switch (type) {
                 case CORESIGHT_DEV_TYPE_SINK:
                         ret = coresight_enable_sink(csdev, mode, 
sink_data);
                         /*
                          * Sink is the first component turned on. If we
                          * failed to enable the sink, there are no 
components
                          * that need disabling. Disabling the path here
                          * would mean we could disrupt an existing session.
                          */
                         if (ret) {
				/* disable the helpers which connected to sink */
				coresight_disable_helpers(csdev, path);
                                 goto out;
			}
                         break;


Thanks,
Jie

> 
> Thanks,
> Leo
> 



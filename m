Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A875CD37B7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PB0b00HDdMyvLcXnO50+iokdfpNKZLgAgDT0mhyx+3E=; b=GZb3Hq+Tnbe9T4KhQm4R7vDrQs
	tTQ6ImDapMovQvEHrOdYLJEF7md34BmH346yL3GjpYQowx9Uyhmb7h/RT3QBIWta8wGmgBKycL6U1
	apEM3ElqtG4jDrbZOK8Uo5urg4wfJN4I/AtQtpXMd5lyzrK22+u6fDlfeyywMxOyMW54qDXtRqznE
	t9ckge6tB0vc3SPMjKXV6Kdb3og7tM53DoZ/8LlByrnM+eiiLXVYZeJNouqtz4+u50G/ku1mZ2YXv
	NC4pY5nDXNb+GiUbsD6HDNkPKm8a4pYiqaQazzq1UDodG+6K6WOmeS83uicvjzjidTn9GMngNg68S
	Zt++hsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN9i-0000000Cyjg-1viN;
	Mon, 11 May 2026 09:42:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN9f-0000000Cyin-3707
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:42:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B9TXYk018395
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PB0b00HDdMyvLcXnO50+iokdfpNKZLgAgDT0mhyx+3E=; b=EdmgKMwFn9OWhJsJ
	5qdsZeJCW0ORnI0ra7GxFisJIkaIq1KagkzRWZ5kd9QL9vRIn5FA8NaS6KWvyRL7
	mFO13HMVbm5cBrQOpgiFmUlfwmH21Rv916ETyF9aQCErQicKnhKgdzDAX6c41426
	pm/uHGGR40JLW1aeZDNLY8SBJ9hIhBmp5xGXaElafpaHqkjsANEevJLGixTotCJJ
	29otELySEstNPPejITm3nhNjFiy5IvTzrJZS7JH918xzY7kZmVQq7G8lq+F0tVrV
	yFcHRvwpGc816NdQFS8kNiOe8Y9trJt60SXOjoDMvAfxn4ERkVY51e2jqQl9pSn5
	M5CwUg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xfs4br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:42:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c797d8c9c2dso4988806a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778492545; x=1779097345; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PB0b00HDdMyvLcXnO50+iokdfpNKZLgAgDT0mhyx+3E=;
        b=V+ZyalK7e3hIPkkAguzwsHx/8rFpXUJ8gxw25uG9PDLBptTG60axEIOSDHPJXGdK2J
         AgRckaGzF7FcF4olqtpq2MPROauRgO9wv1qG78WDcVe2FCgumlVWoPN1LSzeSorI18/z
         VQBqsWpg1YLpSVZMlToSZA+o6vuTbQinDVEg49fgwkGEO1LV4Hei6gTv5SLOkcBiK3Uv
         rwGL+1CHCu3R1u6mo3SeZtM2np2vJ+GeN15Gr4VB7BZSIxNoO4NWOFwDWciQovou1c4b
         nff9VHRsv63KjZr50qh7J5iaizXCDfsYkjF35ELV8dVv22gGyvUpPiBdwwNzQLR5NKPs
         O5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778492545; x=1779097345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PB0b00HDdMyvLcXnO50+iokdfpNKZLgAgDT0mhyx+3E=;
        b=tPbAz07rThj8pdJHMToWs6bkk9OnHkmX/UV3grUrn4eNBJwGNgchUJK3B8mnEWgGuf
         j+9r7yhEbi+bxmwtLmRHSlqPi+JJ1lu1FFGmOExEcptxV0bvKHBb/kPadkWKpdkwgRIX
         0dLFRVK/flAXysXAVaC0MWw/UstRYTzwa/7X60G5AsXgDD+N90M3ZBZcXiE5+KwwDxnU
         /Ie84UksYW+jTqTJ2cWdqeMl/LAC10odmL7ljtwwBjNWpV9NP48CdRlge9UmO3M6n/H2
         Qz6U3QqlcQjf0WoazPG/K+RxPz6EwuTsfJKlNvV58FCgpYqZogo9umwXjotrtvotZlr8
         EI5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+GhZ845CWAcMwwrG0Iu96Wlgg9Y33N30Yn8eZ99tot9LrWZcMhqOmcUauLoKyC9/1dancMTorV7ewcxZF4wBO0@lists.infradead.org
X-Gm-Message-State: AOJu0YxDiFHGJ9kCkoUALWWDoqF9cJD0NBYHusJpywNtYncFgYZ6A9a2
	bWiXy/lBCewRtAOt5lSYdgGCNWGIZS+CChVB3vfgE+EVC2db7GqOQminyKfOZ7T6GOZ3xycy/ZW
	FXBb0Bh+17cSdjwJs6SQikqD942soOLiD9f0REh4irBLNES38rMhyGahFxydvPpf1HRe0KV3lHB
	oD9A==
X-Gm-Gg: Acq92OEHONxZpbZwfPWrCVdqD56hiRaBYBVtIOJqw/I30Uk2HZRpU4SUz45JyhCpsYY
	rpusv/LDmYSnGCvmTf/Y3kz2R/lcLVQnnmzivSaoOCfQaZeDSSZCas/yOFuTa6yUK6sw1uM/6uo
	34aWSMBJHBG/xvautu8CHMQ1dqAN/oTnPQRIcaZ6p+JgqMRacxGXcp028tqykJpNbJ7JGlWaq2K
	x9xkvoPBUgACuVcq0whI1Qn0yX+haUOUtk/cgygwpPjedEVyupmoPTI7ShGrMP1ZZQg4zEbqXd1
	okInDZgYVkNHxH16jgqrYi5iPkzE6Xkoz3BXgZ41quQvWoCPDCT8LIIizkzg69Qswu1pO3AHmcU
	XfG3sqV+sP2cDmqSkVNtgxN21vU5fPUDJqMftzxLnikeOnP/u6W2PG5IT4Me0x1O4Veko3f5+Di
	whh1KQWIVOmQ==
X-Received: by 2002:a05:6a20:9185:b0:394:5513:ce5 with SMTP id adf61e73a8af0-3aa5ac37704mr26458886637.51.1778492545455;
        Mon, 11 May 2026 02:42:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:9185:b0:394:5513:ce5 with SMTP id adf61e73a8af0-3aa5ac37704mr26458846637.51.1778492545013;
        Mon, 11 May 2026 02:42:25 -0700 (PDT)
Received: from [10.133.33.31] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826767be55sm8447282a12.1.2026.05.11.02.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:42:24 -0700 (PDT)
Message-ID: <a593545e-8883-48bb-8268-27e024896d00@oss.qualcomm.com>
Date: Mon, 11 May 2026 17:42:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix source not disabled on idr_alloc_u32
 failure
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
References: <20260511-fix-coresight-sysfs-enable-issue-v1-1-1b3829748171@oss.qualcomm.com>
 <20260511092446.GJ3778514@e132581.arm.com>
 <eefdc953-a127-41b9-afba-a07cf5d5734a@oss.qualcomm.com>
 <20260511094009.GK3778514@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260511094009.GK3778514@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TqXWQjXh c=1 sm=1 tr=0 ts=6a01a482 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=P8UTN6DROHfuWNEhrZcA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hQnYK9D0AezF2fQBmLUUJNZDj3BQaylA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwNCBTYWx0ZWRfX+/8tbUcAVmp2
 IgJDDQAiVJoSkGM9yRYSJe/2cGOSfeCA+vSYLDI/EDmjdYYUU08d+OLYN1sK8lXvo2bFzeTz7HU
 o0bsiX7ZKozgGgrWeXLdJgcTq799Y299vKyWjDjQtJ1rtkohijXjy8b427nGmg7P2DzIII94yto
 KBabbKjRx8yKet3m6d1lVakHtszEKjFf9M16ToH8Ckeh6OF4swqkXpdkrHdoBi1keYqZc/nG0GK
 gfdiTDI1LLvgjXK5yboOww1eDNKuCb8yVdHetp7kRCoX+UoOECny/d9LzSX1+LwN2p+xu5EweEP
 lqFyrnNUxVrAvEV8H/txy/bHWYTltIRYxdlUvIYaGtS0hg004Pw+dThxzS2+FxW2uW0hji0VoYX
 jtVsiIvJcPeem0FbrIKuzc4L2en1Q0YN0Z/vRUneQDlv3I1jS+QZ0A4mpApkV0nyz98699HsEq6
 d7m0gKN2oQSXCJgjAsw==
X-Proofpoint-ORIG-GUID: hQnYK9D0AezF2fQBmLUUJNZDj3BQaylA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_024227_902856_F5097E45 
X-CRM114-Status: GOOD (  19.01  )
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



On 5/11/2026 5:40 PM, Leo Yan wrote:
> On Mon, May 11, 2026 at 05:28:37PM +0800, Jie Gan wrote:
>> Hi Leo,
>>
>> On 5/11/2026 5:24 PM, Leo Yan wrote:
>>> On Mon, May 11, 2026 at 05:04:44PM +0800, Jie Gan wrote:
>>>> In coresight_enable_sysfs(), for non-CPU sources (SOFTWARE, TPDM,
>>>> OTHERS), the source device is enabled via coresight_enable_source_sysfs()
>>>> before idr_alloc_u32() maps the path. If idr_alloc_u32() fails, the
>>>> original code jumped directly to err_source, which only calls
>>>> coresight_disable_path() and coresight_release_path(). The source device
>>>> was left enabled with an incremented refcnt but no path tracked for it,
>>>> leaving the device in an inconsistent state.
>>>>
>>>> Disable the source before jumping to err_source so the enable and path
>>>> operations are fully unwound.
>>>>
>>>> Fixes: 1f5149c7751c ("coresight: Move all sysfs code to sysfs file")
>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>
>>> Actually I have noticed this. Since my PM series will remove IDR things,
>>> and I don't think anyone really hit idr alloc error, this is why I
>>> didn't send fix for this.
>>>
>>> Anyway, this is a reasonable fix. I will send out my PM series later
>>> in today, I will pick this patch into my series and rebase on it, hope
>>> this is easier for all of us.
>>
>> Well noted. Please feel free to pick it into your series.
> 
> Thanks! Just note, I updated the Fixes tag as:
> 
>    Fixes: 5c0016d7b343 ("coresight: core: Use IDR for non-cpu bound sources' paths.")

Thanks for the correction.

Jie

> 
> Which is the original patch for the issue.
> 
> Thanks,
> Leo



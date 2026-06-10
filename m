Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D7ACD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 06:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Pk4bUqgKs1LDEGTz6b1TtBX5K7vWUA+YaexjSASAjI=; b=PX+AvzeeqvVh+Fx+lpahxea2fj
	1ydfjtZJHW20Ud12kU+5am4wM+3DjzEjZm1U/E0CY5R0+rMzp8pIgJLU5lsnRc0h+gDSJ1DKgiySk
	K/EmrfIjMeudQ4ircbNDdgempXvkBUdwSth5EIEc9S3p7wvEuWR6D/YTrw4fCk2pFLDurZpqwJZtR
	H59Zh14oXewd91nL7lyCbbB2kKL6JjQLwm/Qav3WlNiw+ZxLYuYx5VMGYh4rU0xT2266F220vxmnq
	vW7qxvDG5KU4iTRvW07IMuaQcLUHWboNyYUafFKgNw3VV/tuk/KJGN7ex+Smz/JsWcws7RZeQKJip
	Sz80ITlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXCOJ-00000006t2S-1HTU;
	Wed, 10 Jun 2026 06:26:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXCOH-00000006t23-0NG8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 06:26:18 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2eh2j2481622
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 06:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Pk4bUqgKs1LDEGTz6b1TtBX5K7vWUA+YaexjSASAjI=; b=GzV6ndoMD6BQO1Ts
	U4mkIcBqvWsJRK+HvGKEoMuWaE9btvcZ3GYWTn87F/KshM15Tnm6hOp/f4XomGXn
	/jSDHK2D742qNUWA8N6jsy1K17t9hHS6WRQN5RaL0uZbsIgpwzG+ngl3XRCz8oCr
	h8uFtfHYw7ysw1NVvKJnwHKUuGn6F/SRIJwqcXStgW8+JjG5dghn4VY42QxoF2qC
	U4IhG0p3Csx1uT+a527akHzmNEyeI8teEMvWX8Kcu9Skh0n/jhTdf8CLejpw+HvI
	xlA37+8DjEaqeugrBGqg8BCCSLEcBQFJkw+GREhLXrmy8jIW9LhqySDLa0hEwk+o
	l+GzjQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnes213-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 06:26:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517a00fbac6so9181111cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 23:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781072775; x=1781677575; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Pk4bUqgKs1LDEGTz6b1TtBX5K7vWUA+YaexjSASAjI=;
        b=XOZ+nNqxZGtyZMCF5K6m1v35EeRSVIgrjqwmMvF/0+Mwntm1rbcPAq/DQ04a+fCCZz
         +VfbzpDU1xtQHOihjGgGCaiLfWl9asXOHseHaTA8WzpQ5JYJ7+G7tUATmSX8qxnOr6N0
         9CYkKcgL7Tsj4xDR61CGMyQk6YygHpv30ZnPbkWm+ylRC37cyfrA32ISfJsGmtZrGJGc
         zZkbURkO5BBBioQNhmKyTWpf/UUCFmo4hagkc22yLZ1YQNosJUCrzIDFNwd2V7KolwiO
         /XL2qG6wTUS7CHu3/fLCGUvWmLp8JG5dPbc+9PdKMRvU9zYtzRU6tWy6pMLVNLLnHLrw
         lP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781072775; x=1781677575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Pk4bUqgKs1LDEGTz6b1TtBX5K7vWUA+YaexjSASAjI=;
        b=L51Z4CgphDcmGUowc5U+YJ3wrOK1QosbgCdoHqo2/nu/cxadxdMu+XgXQ8o8hiEYqX
         fanCpRFAhW4BvcwCSOaDg0laGCsQRZkCQonDYJnDx31Oc2Q4bqOe+60yP8CGTCVVo5jX
         VDQxDvf94IdOEI2I9RtxkygcY3Xhw5cnz4O5nj/MkMU+hVF/7kVkKg15fLXzv0YMI8Rr
         VwU9nuFJUrZ6m5DrHPP+wyEig4r+E6ZETZw9Ixb5nTuQGI4NBX0dmxi25Ry0XBrAVQf1
         Defv6/FAKRXw0KfNbiUjwhpu6nGiDpFhpxWPQyp7C7o5gAOWRyf9ZJfwSaUP5TCqLiV9
         DL2A==
X-Forwarded-Encrypted: i=1; AFNElJ9cOOUzZBox7DcKKsTs1VG9AVTE+MZ60vLleix4WNeha938fBabxuB5DXDUhPKEKcK1yOrGLPeXqt3htHk20apS@lists.infradead.org
X-Gm-Message-State: AOJu0YxXOX1xfyDC3QOBvWu20aY29evCH0gpzaQ2v3ZUcxpCdhLNYv3j
	z60qTR3nJT2Rr8mibFcUTHD5Bk/d5HdCosMLvBZ9sLfwiAUzxiAYQdVJ1iy5dvvOAnu0WsipPqp
	gsBR3qZbqWq/5MvOd2TD2Ir4JM/K0jVOCJ41lf2uvcMr+IpOaj83LCbeuxF6NNKJTUQjI+S3PhX
	wFrQ==
X-Gm-Gg: Acq92OHXJYp95UgHBprMJX3LaPwlBP9CD7q3x+2fsVGUB47KIkTrykGEfTrWw9S2P9V
	KDipV9bc7T56+SeEPkNPiIppuCmBOsVsg1kVkXd/H6BpqVqHjetbaX12xu07a9Re6zwlZorSIxW
	ktwDmDbu3QKjTmPE+O7y4+uA0I+HTkwPSJ9waXW8CbswfeHJtViZW3DKQd7L1wqWehKPNdh+kjc
	WijHxqR/1a0WBPRQk8oOHGFk9J10h5TTt09mMDul9aiO/UCTGjbFfH5JhGGz6ArMebPP7Zrvf2D
	hLfHNz1Dt91cLr21+w/0nLLZeAa4We5ilJv7sBpwbchLTcuFtyW15gNNUb94+/uHZEo9D0v6Kgi
	2sg8TmZ7Q83BhQuG1xrp77PgSKzVgvSh0J5BKMyS8PZ8pHn2+l4LECoRFItsjci0LCoZkHxOxGs
	mHDWHSfZhdjyFy+le6orw=
X-Received: by 2002:a05:622a:5814:b0:50e:635b:5579 with SMTP id d75a77b69052e-51795b9dda1mr365592421cf.19.1781072775206;
        Tue, 09 Jun 2026 23:26:15 -0700 (PDT)
X-Received: by 2002:a05:622a:5814:b0:50e:635b:5579 with SMTP id d75a77b69052e-51795b9dda1mr365592081cf.19.1781072774760;
        Tue, 09 Jun 2026 23:26:14 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7f50:81e3:bfef:b418? ([2a05:6e02:1041:c10:7f50:81e3:bfef:b418])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dcaa924bsm62959045e9.1.2026.06.09.23.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 23:26:14 -0700 (PDT)
Message-ID: <b5e225af-c082-46c0-912a-cb7a6c39a308@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 08:26:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clocksource: move NXP timer selection to
 drivers/clocksource
To: Frank Li <Frank.li@oss.nxp.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        Thomas Gleixner <tglx@kernel.org>
Cc: Enric Balletbo i Serra <eballetbo@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260514-fix-nxp-timer-v3-1-a3e68fdb505e@redhat.com>
 <CALE0LRtJemHQj7o8iV1GaWJLVfTse6fp-TFvodC=AeWov6s39w@mail.gmail.com>
 <aignHiLu4wbh86Ut@SMW015318>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <aignHiLu4wbh86Ut@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1RI_JIoKZ78fODHR4lpnzOHrF42PcQMX
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a290388 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=8AirrxEcAAAA:8 a=9N1ALIpxdcsQ5w2WyocA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 1RI_JIoKZ78fODHR4lpnzOHrF42PcQMX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OCBTYWx0ZWRfX5kWxnR775adh
 sjOlCS9Ee3iLUqjuZYXNELAI0dyB1uP9IAvxuT3J5dJTiOE7HS26YjM5Rxfdb+s0/GxPaVtIsoo
 /5TqM9LUZkv2TrcNkNhqA0lu6DLLUcG/ZDyS+D9+pdwW+SA8OcpKsAkV4d73ncop+AOJKOSdIvl
 tmJcwr8YiSk25jssinMnvVJb7kDnX9U5PyFuro0GmRjSI/VN5w9eq44LMSoP0bz45hG8v9cUISs
 /5m0gjm5n951I2L0OWnhmHUnIPeCEwOQkuCbaV5EIpe8J9gBKoH83UvKXgO44EqIN/nT7+o7McQ
 d3BTBWKeZ89VrkH6olQKIvfoAO4EQmCa+blJcMsGIJddUHWhRgKwkB7p/fpaLUXLn9r7fl+BQIb
 1kEHTDa79I/k651eWnCulVGbIxDzSAWwy0vE77bVn7GhL2NcWfe1KXXd7BKLPv+y1X+zPGQ9zo2
 Q11snIrLoZq9hzoNCoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_232617_133626_2363A1C5 
X-CRM114-Status: GOOD (  16.10  )
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

On 6/9/26 16:45, Frank Li wrote:
> On Tue, Jun 09, 2026 at 08:57:59AM +0200, Enric Balletbo i Serra wrote:
>> Hi all,
>>
>> On Thu, May 14, 2026 at 1:14 PM Enric Balletbo i Serra
>> <eballetbo@kernel.org> wrote:
>>>
>>> From: Enric Balletbo i Serra <eballetb@redhat.com>
>>>
>>> The Kconfig logic for selecting the scheduler clocksource on
>>> NXP Vybrid (VF610) uses a `choice` block restricted to 32-bit ARM. This
>>> prevents 64-bit architectures, such as the NXP S32 family, from enabling
>>> the NXP Periodic Interrupt Timer (PIT) driver (CONFIG_NXP_PIT_TIMER).
>>>
>>> Relocate the NXP clocksource selection from arch/arm/mach-imx/Kconfig to
>>> drivers/clocksource/Kconfig. This allows the configuration to be shared
>>> across different architectures.
>>>
>>> Update the selection to include support for ARCH_S32 and add a "None"
>>> option restricted to ARCH_S32, since Vybrid lacks the ARM Architected
>>> Timer. The Vybrid Global Timer option is restricted to ARCH_MULTI_V7
>>> SOC_VF610 platforms to prevent it from being visible on Cortex-M4 builds,
>>> which lack the ARM Global Timer hardware.
>>>
>>> Fixes: bee33f22d7c3 ("clocksource/drivers/nxp-pit: Add NXP Automotive s32g2 / s32g3 support")
>>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>>> Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
>>
>> Now that Frank [1] has created a merge request for Linux 7.1-rc1 and
>> the request includes
> 
> Thomas:
> 	It touch drivers/clocksource, Is it okay go through Soc tree Or you
> can help take care this one?

I picked it

Thanks



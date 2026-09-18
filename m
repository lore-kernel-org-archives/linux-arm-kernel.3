Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B633C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCfArd1fgKC44I5JZ5GUogTe93k25uI8hDyLvcW7e3U=; b=usiE2bs0KqxcBjaWdMFCs4CgB/
	QTyh4mFeQlzaCjDTkowdSsy6BXOH/tyXdoYBntNjQUcwWy0euwPm0j/aTDKDbB8ycbxDOpFt+f0GA
	dPY3katLM+EwnJ7YreM5ywZjX670AsmYgT42Z5Y6leRaKDNH7UwEZA29xJt9ybUHnoaNlHqDfZ6l7
	oZcDXKARahEnbMkwP+xl5XpaXjLuE/rJ8+4Vccsm72t0O5thwwtcR1XE0SgTe2foyT4zcdcXVFJKb
	If7d0uGKSSAxq7WcFQnNvpH+a6BXgQg2lG7/tKYZ3bbaAozldsctnrmoVeqrRbpsdj4rlEexNjcnu
	GUaegnFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Uri-0000000DwZE-3oOK;
	Fri, 18 Sep 2026 09:26:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Urg-0000000DwYA-2K1b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:26:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9HdZ3812737
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OCfArd1fgKC44I5JZ5GUogTe93k25uI8hDyLvcW7e3U=; b=KTdV6ECtGkqjFMIM
	WXoXqJ/mkAnnVOVsr77WygbTheTO6/QOhdENm1trWkudebiTEuMbDGp9MKdVk7qR
	2gJ1jcv/8/zxAYi3iakUmPWQlKid00VAFCYbaKCg4worn0wrOnk5s1eQ56xSWnhi
	HU1i99bJU0CBq8RNI6P5SVxtfkIPEWVhhHIlq7EiozcJKp3ko08ChTNG8/Jgu262
	/29CrT8U3Kq+Za1iFZkgGqUnN4YoNLd4ggMe8SC3YgbdPz6eLV5IjMqpLnvaxT5g
	vYCMVFtkp2nJHTNIcXz90ayR1h8Lp8NIp5aWQscHW2zLCRSO1iEKlo4L4gxGUv4r
	k+OOiw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2hv8143-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:26:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e8dd8be81so6350396d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789723598; x=1790328398; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OCfArd1fgKC44I5JZ5GUogTe93k25uI8hDyLvcW7e3U=;
        b=IfMrewGWOSWAXez0TTg9dwpMQ+93d8AwxfoZR//YjFCFmpk5SUrN2AdaUuL2vfXmEd
         qM7/GZAt9QIOAbk1XXcTgpqhzdqgLNLI6d3HND1ZVP+By0sD/l+O56CYDp7EPJn3npSm
         qxK7yZI/H72yoUmx/Ep3WLwpBOjRZX+uNuUR7Y+zgC5QeMdyvDhONgjwfrdSG4lJbTqz
         WySC7iIMQNrck1CqAqBv7h7zH2iJCEJT1Yu/V0WL0F2iMZ5HJjHnI0JgquG6AVLEoFts
         P45Mf2TGmgnDw7pP6Hn+jh98Ka/mP+b9y4w7yIs0rh1/HiDy4j0Xos2qYW8vxzUuRAlk
         KeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723598; x=1790328398;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OCfArd1fgKC44I5JZ5GUogTe93k25uI8hDyLvcW7e3U=;
        b=ca4+doe1zUPqdBq/g2e1kvCsvXpCDXy0Fz0M3nCKXnoWKHlJcYfOB0sbAUzYJ/j5On
         JRnnIp01+4kONmlienk/Wx34jwGq0yY2FSgUeeU6BvW97hdO0FfoK49QOM4ZNWTlxfBH
         a2IjDMOCvHMp5w6qm1pbjpkSp9yURGqukgcz3JON/2pM5ToTcWD3h2skSDxJwWIfPjVA
         KqhgIAo5BJppF84UATzt7QDGO35wgZRq9V9AQWjG2iBGUXg2oJMnM1V692jWZwFJ6qsV
         9sOzUYMVIZnG8TBZz4lW66moqbSJQhKd7wz5OATP0BHuKKB2cteEyz+tUTNVveBZMFXV
         Cvug==
X-Forwarded-Encrypted: i=1; AKwUvBzq3PX5Z1S8mxk62HxqZwE1ryEQ4rGGeiwxpIvAdWPwF0ZcotFEWg8HR3kMMKdNPykI5Pv/5fXw1mdPzzJBALh2@lists.infradead.org
X-Gm-Message-State: AFuF++nqOb+H71QhUKsIyEXRMkhAJrDxWLidKCOnJLu3GpcgQWTvmR+Y
	nUGNq7Yg1aCvXjKb45hVJnN13p5PpE13/LuxGIbwBhJvZLgKz376lUAaiVesbBq3XeqPGKpyH73
	5mIi7TvaG26uc8bvW8K1KGrPehh6Sz55n0j9s6ddHvMo9W3EaxDJOGOYyynfSmU7ePCcDaYj5iy
	N3nA==
X-Gm-Gg: AYBFou3c4D54u2LvPZVl62Np40ycLu4WhvY9DXXzzzEForXIPDxe/HYRcnTM8oL6hpM
	mDD1VJ4wHOnPbkzQ1o9S8Y8Hj/TVxMl80Bi78evLiMcp+DEI5IrO9f4PbN8pLJEQDs7qfswrbe+
	r6Y8Xx6uSfpl3ISYPQJxoks74u3mvPoa1Hh+0TFVSsWhWp5nyroajw5LCjI/J9KNzhxhkWaFDMc
	8MwOINH8zoHk66hnK3vGL+811pDkeapkim66fR22Y34ozuO+ey8hDSmClNPOsNMoS9OBDRjXUWR
	w0G8W3INNAXCMKnMnafvxKgUddQzUnwgbXRR2QnchA+emgow6p7GKLibFX32ts3gt66eoqynmlb
	bZmiuTbm9Ii6iEx8rHfqMk84nYtV0ppa/a+35zrEHOYCSpZaDal+yQg829UFFczJGJPFZ6T83Nq
	2PYpoX9IZSJ2WR5as94I9RKLTPWAJyNvVN4JDAPUGlVwfw8loP+QvdfGQodY208+Mxq9s=
X-Received: by 2002:a05:620a:29c5:b0:93b:d7b4:bbf with SMTP id af79cd13be357-93bdca5ed54mr202483785a.76.1789723598303;
        Fri, 18 Sep 2026 02:26:38 -0700 (PDT)
X-Received: by 2002:a05:620a:29c5:b0:93b:d7b4:bbf with SMTP id af79cd13be357-93bdca5ed54mr202480685a.76.1789723597628;
        Fri, 18 Sep 2026 02:26:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb0715esm35946966b.20.2026.09.18.02.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:26:36 -0700 (PDT)
Message-ID: <6d103565-42aa-4f02-91b8-bc7598830c8c@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/4] firmware: arm_scmi: Fix
 scmi_protocol_device_unrequest() race
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
 <20260911152329.5822-4-johannes.goede@oss.qualcomm.com>
 <20260915-messy-imposing-frog-ea9338@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260915-messy-imposing-frog-ea9338@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzMCBTYWx0ZWRfXybRERmqiIIZi
 M+DgNSFLrxuTvgwkh2fKUfTnqe2BIv6GJlQie/Mj86c4B3OpHBq4Ch8HMNVy6K+5csnBJxKOBKb
 AGUrTZBv8A1K0MN5a7UuYrHt5YQDfO0=
X-Authority-Analysis: v=2.4 cv=IOWXmQvG c=1 sm=1 tr=0 ts=6aad03ce cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=U7ZbcBUnRWPs88qqOtMA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzMCBTYWx0ZWRfX++o01Oc3XIGv
 FXvmg8xyR1kSbRCHDLG4TM5do9298twkijjS0q/qHtrtpW5ObSD66jhKZzEZ2OjAEWixKW5v2Hs
 8iF0GUUqVNnAcOZ7oTVihUJbzg5ZWftFRl4aUtK1kut3wFvkqRWrSgstiSOyV8ZITiRtMG5GYnd
 +l6JwLiJOyuAQZX1PSq7V9EnfuPZSKUoFEMaJ7cTvCa09UQvxtQFgBEcovf5k/ulyhbdKINmfgx
 +hkkB3ezEhgxZDPvvnPs70RvH+9AiJODl5Nni0SGImfyYSja0fTmoQ3qEAPU7OPWIOh1JHl5joE
 lSk0Qq294D/5uDX1Ar1fg4RG5R7vFK3D9NEPfi21S4K4jXGl06VeFhUX6kcDv8f6q5YjLCU2Y0Z
 2TxEwBZU1dEzufEW2S9QnLM60WC9UE1hdwRGfOK5RqLgA1dBP2tQXK67aEQfM4spRw2PX8hVinh
 KTPSuMmt11MuddSYTmA==
X-Proofpoint-ORIG-GUID: aDXE8aubfCier_zCYwTuPwad-EyqSCV1
X-Proofpoint-GUID: aDXE8aubfCier_zCYwTuPwad-EyqSCV1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_022640_727097_C52C6A93 
X-CRM114-Status: GOOD (  12.26  )
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

Hi,

On 15-Sep-26 16:21, Sudeep Holla wrote:
> On Fri, Sep 11, 2026 at 05:23:28PM +0200, Hans de Goede wrote:
>> scmi_protocol_device_unrequest() unlocks scmi_requested_devices_mtx during
>> the notifier call. During this window phead might have been deleted by
>> another racing scmi_protocol_device_unrequest().
>>
>> Re-acquire phead before cleaning it up to avoid this potential double
>> free problem.
>>
> 
> Does the below address this issue already ?
> Commit 2c4097e6c4ae ("firmware: arm_scmi: Fix requested device removal race")

Yes, the v6 series was based on v7.2 which did not have this yet.

I'll drop this for the upcoming v7.

Regards,

Hans




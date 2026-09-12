Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE5CC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 20:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMJ1BP7kFCSqrDlTpk6HSShuuUbHZX05cq1SvWPnFxY=; b=WVrZaLFXwlu6B0jdZUW7/f7Olr
	N4MUE4ZRxwktrCgWz7t6rUC3s6OR1omTa+ky/U377YozRR2tN7xYA9Xt9lCtxlcbOPEn0l8gFKrJ3
	6J7wmylvOjbrVV5AW3s/68JElfsFDc3R//uT59wIW+zN3qnLM9537wZdT/948qRTfnpPzUigxRQ35
	K/QY8s8xazLk24Gf+aiUBY6ChC5hH4Hctj9Oqh6MsQ9F5Uq0rBtyDMJOa7zGGZHdkYZEEZve0LiT+
	im5nQpoFuYjBZaLy080a1ZOeFf7E/gY7hixb0xMYs4Np/mKJuxJTZ3Mjf7PrJOwI3RbDHC3lHATjw
	newsIokA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5UnY-00000001CoT-0JHQ;
	Sat, 12 Sep 2026 20:58:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5UnT-00000001Co6-1BF5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 20:58:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CI5K1k4071651
	for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 20:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMJ1BP7kFCSqrDlTpk6HSShuuUbHZX05cq1SvWPnFxY=; b=MhX5Xfkvk4ZQQ6g/
	KiLgU3Jnhik938QvC1TZcJUQhVGx6Aec/nDosu5TSQWGdLPmXg4d63G4TR0PmiUF
	Cin4AjgXj98K2DrMkrfKHuCE6o2gOht947UIjAP1hMdXbl1RLi/8b9ann2dnAhzG
	m+SvtDCZ2l4qwm9wlEMPk/KUohnbnKkXD2is9ZubQaMn9mvYmol/ac09N17MmOqO
	lZSrY5rDMmh3K9frCbkPHNQsghwuQZtv1W3/nFzH1+CPRd4qYq1OL1hdQXhNSqpY
	V1bxrT8hGN/BAp5Ogx2He0gf+OpcWXPo0rk+RKd94Vh0up+LukwzO+9PqVlO1EKI
	cofpHw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dhx7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 20:58:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-938153538caso365737285a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 13:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789246681; x=1789851481; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMJ1BP7kFCSqrDlTpk6HSShuuUbHZX05cq1SvWPnFxY=;
        b=L5HU1zQ8fPOXku1FPO9reybKQI2yoh86kUci5kX3Whr0cEbG8O0jn1CQEGWqIATWX2
         hPmsw/GLqx1Qo724H6Hav0MmmJXZyaMJmRTyfWxXHGwmakzup6gjJwekxmE0/N/JCazX
         pvcqCJkcAATTxgCFYqLLMS3aIbciBLvqcsXTKPxfj2CwdzKc5Ja2D4ci0OXdSPpsBlfd
         aEI1+bLtv9Pbm/QoNdcZoARuimToJpaefpbWu1zqMYCRNekGoKFneEwot6aTcDnQd7iQ
         NuTv0w3KX89V4Bt5n1Tfx2fWPu+Z3nVSc7RmMTm6ukkcw6zOqRw0Fou4sK43YdQldmqP
         Dcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789246681; x=1789851481;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMJ1BP7kFCSqrDlTpk6HSShuuUbHZX05cq1SvWPnFxY=;
        b=rVn11+BSG/EFWbNgrHjW8p6A1drPpIkVrttK6ESl8OIferPFT6bw9NI6LetHKMqEHg
         bkdpfjnT/xDG52bJ+VEoKOc0mrwOmaR7ijRnaZhLUa/9013m0ilhkPDHpcp8ddwdukFc
         5/hig3dPSdc0owo//fP4SLMsREzzIFWqzYqqTjjPWTyUMUg4vhkZA6UgEkXrLkPf1NIO
         LEaPoiuViFsFrLd283X5N9ZXY4XooyjQcuoaMQEgyo7b5vV6eH3AX/F7I3bK9Y85mXFv
         N7vqF781rkJD0u/XvpEwURM7Gj+DFk1ET3Sr+70h53GQTgRsfHszjXpiV+j5G5RrbmW6
         UnMw==
X-Forwarded-Encrypted: i=1; AKwUvByC5A/UgzG0KUHLjgZY2l418lS+/HhcE69UCRWYi8ylnLYRIn49n90AZUWMpUnsTKeuFC0ZR7BwgWgVaKkDB12l@lists.infradead.org
X-Gm-Message-State: AFuF++lfu+VkU1ipAxh8tSKFgEj2CAOPNKOKphj8Lb7pq61fi6FBcV3i
	0ooeAgY9AmLufZgYF3jVmOLdP/w/ZFd7YqEQyWBppfOuuHEdVfpvqWbIL17AVDWAbW3Ftc6MJY2
	4Onf+FuBsJ2hdh7OqxBZaHmmIE6Y+TOCDaKmji7H2dUEC5xfVHN75joPYY1ZfOFaZOQWCruFCb+
	ZbKQ==
X-Gm-Gg: AYBFou0eC9BT4boDZ3DJATNblZ26lUQJI6fgLgsHoFtfOh5AvdoKrNRnrSDFyb7ezMq
	j4Da57g7vokHxBSdXDRDjU38kyo/tZhff6gdi3eHzMFSCo2dcayHE6c3IVl+0jl6wwK/nh76oBX
	p7w1rt2bOZZlbp7VmjRP1qZ36xeLN0HE7I16rDC5cJXUbt6sRiop+D/tnDs2Ci5+7F0iBx7ui6S
	WVJ0L3Tbl3Pah0fVGWCdZHf3qoxmgRTkBarH3/1ecUt911fscAx/5P/hoTw70Tsycz03GItNJsi
	2jG1MPyUI1aDab0jNVA8N1Nf1ok+n7ohN4FkG0CMw9ROYM72wFzT24JCjCf5LFA3W5qlwLdnusz
	j7WGv+m9mzaP3921hpsJ884H5LJpP4k2zJaxr3drh6OUqfQPbNQQ45o4tgnCHVqER/wvM1Ts318
	I2QNRuqJ3jlzFQixEZn3G0vKuIFjEMGIHVXDc1Q/wQQV3zJHKCIADp+1cm7GV9L2VVxZM=
X-Received: by 2002:a05:620a:4386:b0:939:6db3:6cad with SMTP id af79cd13be357-939ea13c648mr1411256285a.12.1789246680658;
        Sat, 12 Sep 2026 13:58:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4386:b0:939:6db3:6cad with SMTP id af79cd13be357-939ea13c648mr1411253885a.12.1789246680244;
        Sat, 12 Sep 2026 13:58:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b59644f2sm1993071a12.29.2026.09.12.13.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 13:57:58 -0700 (PDT)
Message-ID: <a7f109e5-50fb-45ab-bf8f-c674d9e8fb3b@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 22:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/4] firmware: arm_scmi: Fix
 scmi_protocol_table_register() error handling
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
 <20260911152329.5822-3-johannes.goede@oss.qualcomm.com>
 <k2agmmtgq2tbx2zyokidn3dsdkcjpdjbasx7vlch6b3xz5sjuk@pfhc5npwwegc>
Content-Language: en-US, nl
In-Reply-To: <k2agmmtgq2tbx2zyokidn3dsdkcjpdjbasx7vlch6b3xz5sjuk@pfhc5npwwegc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMwNSBTYWx0ZWRfX774KpWCxR610
 vNbg7+YRtGgANMHasrUeNH3xo3UmHymVd0BcFmBYgr2IpFDsX82UF+N456iJskjmsw+jUpGoLsO
 qAfIwnnULcGmS0fm4M03cbrx9h6/vuEpdDkF3E+EMl/2aynEXIGMx2AaOJ0T/G6tSk0jdfe76Bg
 GfprmFyMskAbnFjXO5ZqCU3xLMxNAkbSC4qVhO42boP1Kz9HGKZxaSh6qLpsBIeeltWXPU2T171
 tHZ1tnshvHn6O/HS6s2Dj6tKdQ3bIi7Br9nXK4lu3OgDIVYX+UtXfGshv1vOlTsK/J8eqpaPydW
 gND+FXEO/d0e8zaQ9BWfRoP2X5jh4O4Ifz6pnKfJcbQ4bd+C9vt7GuAArnxxcD6av7SkTB9Ulz3
 CZ3HeHFfeeHN2TEa28j2qTFt5M54ap9Ns3PpiZEDlAUjpZcXVI+eWlYhkJdL8a9Zjsdcz8GuBCx
 GPPbDVGnweJHBA++asw==
X-Proofpoint-ORIG-GUID: 8loWOeCAAw7TT2q6I_rXpI9sL3PqNADS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMwNSBTYWx0ZWRfX2fR63U4Jhhgj
 qsbH3lUpsvefYLyttmfOWysSQMOWaxDZuTkvsT9XqNDiBXo2uEquTaKSAiPjFlY7c4ZMMeQNVqZ
 vLffNeOXjrLWAOXV6wAnteBqDYp35vo=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa5bcd9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ePD8OZhNOdW2f7jq964A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 8loWOeCAAw7TT2q6I_rXpI9sL3PqNADS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120305
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_135803_463956_E34B3FF2 
X-CRM114-Status: GOOD (  13.55  )
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

On 12-Sep-26 22:50, Abel Vesa wrote:
> On 26-09-11 17:23:27, Hans de Goede wrote:
>> scmi_protocol_table_register() stops at the first failure to request
>> one of the scmi_device_id-s into scmi_requested_devices, but it leaves any
>> previously successfully requested device-ids in place.
>>
>> Unrequest any successfully requested device-ids on error to fix this.
>>
>> The code manually unrequests these rather then calling
>> scmi_protocol_table_unregister() because one way this can fail is because
>> of duplicate device-ids and in that case the original device-id must not
>> be unrequested.
>>
>> This also moves scmi_protocol_table_register() to below
>> scmi_protocol_device_unrequest() since it now calls that local function.
>>
>> Fixes: 2858f6e5f064 ("firmware: arm_scmi: Add multiple protocols registration support")
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> This was already done by the commit:
> 
> 2224b622260b ("firmware: arm_scmi: Roll back partial protocol table registration")

Thank you for pointing that out, this can be dropped from the set then.

I believe the other 3 should still apply cleanly with that dropped.

Regards,

Hans



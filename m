Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08959CD484C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 00:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shoV7R4cdUdhDy3Rocqf7YVmXVjJmlMkZCU4pnjakno=; b=3PCn5vvfcSugNKFF74skicyTRm
	J3GzQ2CUTU9ByP6eHQhPTwe3nt2xkwbpXpUCaUW7IUa2fQbF3gM3/Jq9ISnMo/dp1i1dHceMR/Rr9
	5VliL3xZBi/ADOBOb34zO3mZVP9EOWA8YETgBLQAD17UQr9obuXvNIYNbWNI0MZ+ZU/43Lou2uRYE
	Yvd5MJxqxjhBaSYsLdvYWb3xSsRp8+AiGRhZULCIHjRwC9fE+z/7DQAup5MW5547vMwtWsTERwqSa
	eZXKV5j5JdT31ZSWp5aAvmsWlHiD0D8IlonMOXQCFlok3e316tOmQjH3s74BneobufUpxz1TXl2Vz
	lnxN4dJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMbOv-0000000F7oM-2cBD;
	Tue, 12 May 2026 00:55:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMbOs-0000000F7nj-3smC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 00:55:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6jS73384767
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 00:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	shoV7R4cdUdhDy3Rocqf7YVmXVjJmlMkZCU4pnjakno=; b=R0duVV0n4m7w8iCh
	NG7W1wQ9SExmgVSG6FzVeffT6cW+VkZO5/QRRXeqtaiwpM1tW3btJG3y6+KaLydQ
	SZuPxx293PvyXuC+XrGJQRrivYss9J0oB4IDrPSGw407Iy9slw0WFOMykl4yDrvu
	XGQ54Acfb2/TDONLyTYveYACPuVhDkxoeY2DoLzBj5QyI+ABlyNMrhxP+jHi965J
	0ZCVx+sEAXy1x7vTM5LlcEr2Ix8m8A4zsobsCtA17Vjw6wIOK//f8Cst58p6l7By
	yxgE+alRWJDUwOuO7W/WpQumduL4LGZii1W7BuaudPSGvQCVfWImxAFDUARxNcRC
	OcMsHw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv4gtd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 00:55:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f9429f49cso6200932b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 17:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778547305; x=1779152105; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=shoV7R4cdUdhDy3Rocqf7YVmXVjJmlMkZCU4pnjakno=;
        b=FUdnP1641ctuIu0a/n0H9S0Bg96wNrdZHVQR4AXIq+TQ4GPPwFx2HWB7vyrxrnYant
         YXBJMo3NRQ8DuqyGOKAouBNSx0oc+fcvII0hrHMHkSHIp/5CdZR2ALG18W7ETz1MeBKB
         L71F2g4bsOWuxQ4ZN1EAQq/V3FygHnEEmmR1fELaZWN5zrNuviK1fbzebBR58z3avA+l
         PAR1rHTjxqJm4lsi9fcmcx4jUVhPp7r4YbQbQB6GvNWVoTHDkmy2GDsZpFQzmdOFg/m/
         DvE3TuUoPk4K02utjoPSzcTH1Am4X1YsePPVYMZH4TxROppCTJF8muc2l5Ld3SuLm62k
         hwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778547305; x=1779152105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shoV7R4cdUdhDy3Rocqf7YVmXVjJmlMkZCU4pnjakno=;
        b=q69fM1d3fPqFSGNHfIsVb5NVVF4owj8nU80JrVfaoqcWAKOVquKwQ2FbKeE5+2X8l4
         EG6hjzgmBsJbgvTkcndjb4+e05a/oXVxgG95FYnCIq4GJhdktnnstLA7gFeYTkAV/TbB
         JmEAN4DstHa00w8WLnmJkeAEa3IMrlKazbsNwyySBdt+IxJcomTRf/XBJ0Lrs2gsOxaq
         bJ5eRkBFjLBoT8cUffAOiuE2iTMugnIY+yiYqWr9j50JdZnWyBF06PuFMC1MNrtEsFZ+
         kyQa8VRBdjA05n+BRkBzlFdQInYR5AJ1BqTYycrgjqlxELTExz2GE5KPD22F+KQMfVKh
         H/Yw==
X-Forwarded-Encrypted: i=1; AFNElJ+VMeW3sPd81AdZNQnvNvmEB/nhavNKmS1hf2LGCxQDHuCebLwhs7Qvd3CBzYrgTZynG6JXklfX/gbloDsX8fHW@lists.infradead.org
X-Gm-Message-State: AOJu0Yyboc3rQrIPmpaK8dYkDZMT42BORz6BE8Lk+Vwfrk/jURYS2MTV
	m5Ub10gX1F+H4BYi1FzUpl7y9bP7lPv78ATb+C+aUN+6iQp2xcQqliHQFuqmaXhVuxEV43ox6e7
	Dn3w6huYlge474skQoenN8U59A5C2NLMNqAyjqkK6HGZJFTs2vSTW4Odum3+l2c8yKMz1m/u8rz
	2+OEx3Z0JYiurR
X-Gm-Gg: Acq92OGe33mujNt7fFBJX6SimNGE9yzS11b5d4ZJGda8ZHuWFgnw1n0L2ySUwmkG9Y5
	PH641DvkqvsKDo0iPpphKv0grcqShhGCznvONErcV8y4C6K58bxAFc6F9HtP7+ipKjWDVwQ4Hsd
	kZMPKIumDv75yelVmUnvmr/g+NkAUhJF2hVYmXBf4fHHQN8gkAn/byOuubiN/rZLa4piXu5aIy4
	HRV+Pd0540ytAopy7I1xteE/v87i+sZZScILGtwWu+PctlFNtW886wFdRX1wjp4A78Rf42COekm
	P+mk2cLg+xqD/YtI6WtkxVqK/GkjUQQnlLN3fh2qeoSrO5M9/GKvwDr6EEqx2/H/pdW7FmuPgBl
	YSviQ1z5orD6urxxuWONM6IUiqsGvYnrLD5VhoufdsVtE5S6cRRmlmEdzHh3YiqfiC04GTHbely
	mgRzh2AnR7aA==
X-Received: by 2002:a05:6a00:4b12:b0:824:374a:1407 with SMTP id d2e1a72fcca58-83e3994878bmr11449813b3a.16.1778547304753;
        Mon, 11 May 2026 17:55:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b12:b0:824:374a:1407 with SMTP id d2e1a72fcca58-83e3994878bmr11449784b3a.16.1778547304276;
        Mon, 11 May 2026 17:55:04 -0700 (PDT)
Received: from [10.133.33.31] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm27141591b3a.3.2026.05.11.17.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 17:55:03 -0700 (PDT)
Message-ID: <eb008f96-41bf-441d-9b16-1ceb79e2ccaf@oss.qualcomm.com>
Date: Tue, 12 May 2026 08:54:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight: fix missing error code when trace ID is
 invalid
To: Leo Yan <leo.yan@arm.com>
Cc: Richard Cheng <icheng@nvidia.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260511-fix-trace-id-error-v3-1-ac4c8356efff@oss.qualcomm.com>
 <agGd1AB19yz0U2s1@MWDK4CY14F>
 <146d34e9-caa3-4119-a3f3-79515b3f2c46@oss.qualcomm.com>
 <20260511144556.GA34802@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260511144556.GA34802@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZrTd7d7G c=1 sm=1 tr=0 ts=6a027a69 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=azZi9I3KAAAA:8 a=nZrqWMUQ7_P3nV2vYQYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=9agbdnaLCrZLQcVvdjT-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAwNCBTYWx0ZWRfX8GeDU8hfXQIp
 RGHN4Wu73LowuqghCDou9GZALAmlwPgTZlRnv/RuR78ZPlEZml4YwBxNAintNhCpLTyMl/B6O6z
 0uuCAZqEEP//SpyZzm4xQu3iyURayoSGrjaXzZrX7LVKL8fqStd6A9AmwU6u3UnXaatyEGffUmL
 v3dphz+V7iLTFkJ3ZFI78V9ydIpLqKN/DXfFmXk4fYnrtWhSZgSrWCmXiAZ/e+eS1tVBPox/wna
 dCaLaz7DgU5Zr+8IwQBdJn7pwAc1wV2FDKErbmv8kLao+bqwHFhYXpz3rgfzFi8sESKSfMEvcwS
 16yLm8rO6c/7ImmECqZ3xv+cwSUIg0OUggNpSMOpGW/tg4A7uFiWtUg/4Q2Iwb7wt1NeneQMKto
 lBnvN8REkd9hFL/t033XH0Juvb+AbBaskjE98k60TdkQcQV6Z9nMYtNU1yY25/WGuxe25fEcEvR
 qs1Q7gc+I6/z4ibPWjw==
X-Proofpoint-ORIG-GUID: Wcde_KHxiubKXpTb0yoK1MfCr5_9m2he
X-Proofpoint-GUID: Wcde_KHxiubKXpTb0yoK1MfCr5_9m2he
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_175507_007720_B994CEE8 
X-CRM114-Status: GOOD (  25.15  )
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



On 5/11/2026 10:45 PM, Leo Yan wrote:
> On Mon, May 11, 2026 at 05:27:10PM +0800, Jie Gan wrote:
> 
> [...]
> 
>>>> @@ -755,10 +755,16 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
>>>>    		 * Non 0 is either success or fail.
>>>>    		 */
>>>>    		if (trace_id != 0) {
>>>> -			path->trace_id = trace_id;
>>>> -			return;
>>>> +			if (IS_VALID_CS_TRACE_ID(trace_id)) {
>>>> +				path->trace_id = trace_id;
>>>> +				return 0;
>>>> +			}
>>>> +
>>>> +			return -EINVAL;
> 
> I'd advocate a bit early exit style, like:
> 
>    /* 0 means the device has no ID assignment, so keep searching */
>    if (trace_id == 0)
>        continue;
> 
>    if (!IS_VALID_CS_TRACE_ID(trace_id))
>        return -EINVAL;
> 
>    path->trace_id = trace_id;
>    return 0;
> 
> Early exit can reduce indentation depth, and it handles simple cases
> first and then the complex logic. In some cases (maye not this case),
> we may benefit a bit from compiler optimization [1].
> 

Thanks, that's a good suggestion and much simpler than my solution.

> [1] https://xania.org/202512/18-partial-inlining
> 
> [...]
> 
>> The return value has been ignored in perf mode. It will introduce noisy by
>> adding __must_check. So I think its better without __must_check?
> 
> Wouldn't it need to update perf mode as well?

I will also update the perf mode for consistent usage.

Thanks,
Jie

> 
> Regarding __must_check, I searched Documentation but didn't find
> guidance on when it should be used. I don't want to use this annotation
> randomly (some functions use it and some not), this will be hard for
> everyone to follow up.
> 
> IMO, it's fine not to use __must_check here. I would leave this to
> Suzuki and other maintainers if have different opinions.
> 
> Thanks,
> Leo



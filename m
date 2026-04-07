Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F97F3D5E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 10:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pW18SYaewZa2ej+crJk99wLT0nXZT691qI5b/3x5qMM=; b=3R03d2MDsg+9VR3m/a1D0pJXAi
	mc80JSesRJNpx/LDvio5fMhul+1515iK4Q3dSSNrEPrbOw5yJ5bJ9U3BdaCy3+7MRJ/nizLCu76s9
	D5nfzASaZo6b6TpgeA0Aksviwxx08yzZb2Qu8ETNQyr8BshFXAguax6uis7mqrro0QpI8way1tS7/
	F8TljxsBTVZqarssBDJBMMCpgKTkCo1wbFE/VHKpBx98Zye6ptA0nTHrxl0GtQBOB4nYWZltD0ssK
	7vJrAfI3d2kHDQd9nyfy78wIprIp9hDIx/wO9WMLjAjS2cGre/AxhpIeYAzG/z5G+WYr2C0PTkB41
	87X1oFMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA49b-00000006LYq-0eR8;
	Tue, 07 Apr 2026 10:59:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA49Y-00000006LYS-3xuf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 10:59:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376p3go1407046
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 10:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pW18SYaewZa2ej+crJk99wLT0nXZT691qI5b/3x5qMM=; b=W+LOTv13ENjFxOAP
	pEXx12Pc1CtXtjBrpCSy841S9mfXxu6RcST8MTyQigyM8zPoUjZXAYEH7JLoKRYH
	mJ1S4Bq0nWKEP0j/4ewik69txqIU4Pv9QqCIM6t5Juuf0FbulbvxjLRtwZaFTHaw
	yRAPKRPc+7ZAjQrLrR/vnG5HzzBTUUS5w09VpfK2VkbO8E9+FL6m+vCSCuf2hcVh
	JWE+kvVYwgUsjdgdknhX7B1FLNpL5PbE+XM9ErtjO44E9BHzpijQmPFKO+GExgYd
	Bsf+riVeEmQaLIVr/0sflVz4W1VR3NRl/TX7h3ZbU5CLO/to+9ALI/pMxtJcBL3f
	CdK44g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmratcf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 10:59:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76b06f37a7so1835550a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 03:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775559567; x=1776164367; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pW18SYaewZa2ej+crJk99wLT0nXZT691qI5b/3x5qMM=;
        b=E82S/jYJXmm22wzKl5SGSjPPuttoEQPWumiND61HciZDANU3Jb8YHrzxXUVmCETytq
         fX7EaiwGxML8e5yYeQh7b3BCmrKqBgAX7vY+kDqLwU7KpNu/bjVKxUA4o5WkzKNTEZQv
         1obzQUnpM7tjeSpT52v114Cqn4dWOdLS3b0y/HKocIfjyMxaLg7Gx0mRxFlyXqtjtbmr
         km/IcOdn0fCSLjsQpqpZq8qVY9uGphEKamDrAYNbiB4lx0sLc7NrKqQt0KvP9EH6lzzK
         JsPECtViNwRyttgg86iHthR6fgstwS+Z1y+L/d5uF48l9Qg0Df7npVRF4vMy9EaZCkum
         b30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775559567; x=1776164367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pW18SYaewZa2ej+crJk99wLT0nXZT691qI5b/3x5qMM=;
        b=KNfAobttx858tg2YrWOf5pMowGpAqcw5K1Q4Q5iWFMganiNhdCfvRRZIp8dHULEz19
         UNY15QYyCeH5+11Wgo/XHVmEf8DYAazlW1IPC5SsbBfyBYjC3IfO3NA8cowiH8sIVt2Q
         T4jaaTOd9MPuY/cicHZ8d+EW57PIJKWhlrlaIRvxpOGSpJZYXInL4BYRONL5uZ9HsQJP
         yy5ouqwrq4aNpsQMD3A0+9OVR9z5y03ybGYlV9Dx8gXO/CatmX2MQqKg/JUHWoz90M3y
         ssEq934NSCWhpxazY4rHNcBx243VRCjOxsQOagsFfJRoKfGmu+ioGoGry/mP1m5oPZA1
         QtNg==
X-Forwarded-Encrypted: i=1; AJvYcCXyyfgGwSc7bVc9jaBTLk95e/gQHx7fwaMX/GXqSEO2eA/GbtV0EoZQcBNZ95brzzibYV4S5s2/MMilT7IE8hZP@lists.infradead.org
X-Gm-Message-State: AOJu0YxhuUTqicBGxzD6KDt4STvDjvdR4/LAalvy7Nzle2iqt21caYKs
	wcchsktP7WOQQbdhdQMTBRaCQqfECbMJE8TLDxnlqD7okvWuTgrwLhVRfUVOIjGJFYpbxg8gwAE
	Wbg4XEfa2knsrbM7jl01QfGXczdjeViIqkayyZfAfLCoinBGn415h1GfHEBPMZfxU001gCVEajy
	pe5Q==
X-Gm-Gg: AeBDietfyRtdcvda9gHIFX8o61fH9shf+/slE1O2gC5RXYyqN/GrTqHWi3M8OhN03Tq
	Qe8pUtA05XZhIWn8oIAxGBohDAv+MMICTCLlhrQRedKZZh0cuv21Jf9cGH6R2w+AL1afL18inPU
	6qVj9yuKW7hSZ98cU8yuqi3GaNgnH43Xp2PMnMyH5A4M1eBYtsGt9VVz0J0qcEbLp2nA4+bUQ4a
	BCc7eW/ilOJqFC86NowT1C80sHitf4zMX5jja/ZK8qg09oTFbwVp6dr6Kf/FWKwohoCblGFd+OG
	waJdj/8nTnpx7q9IGTB5pA0iBFnao6I6EgSfwIs9+65n0Ls4PPbbPCgKmB02wtU5vWNExwl3y4n
	cK0MxcQVVzBm4dbtbnjg12DJkaPqcihI8HQqHgkzN/V/77pbevJUgyv7KHbMEO8F6bn8nyGxRUw
	xoDU7WHWjctg==
X-Received: by 2002:a05:6a20:244d:b0:398:bda8:d8cd with SMTP id adf61e73a8af0-39f2ed0ff5dmr15779428637.7.1775559567466;
        Tue, 07 Apr 2026 03:59:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:244d:b0:398:bda8:d8cd with SMTP id adf61e73a8af0-39f2ed0ff5dmr15779398637.7.1775559566966;
        Tue, 07 Apr 2026 03:59:26 -0700 (PDT)
Received: from [10.133.33.25] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6476a81sm15130467a12.7.2026.04.07.03.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:59:26 -0700 (PDT)
Message-ID: <a912064f-9ac7-4f0d-aacb-564eaa87cbf1@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 18:59:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: tpdm: fix invalid MMIO access issue
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260407-fix-potential-issue-in-tpdm-v1-1-42090d27c0a8@oss.qualcomm.com>
 <20260407081048.GJ356832@e132581.arm.com>
 <0a4911f4-168b-48c4-9554-3962d6e96efa@oss.qualcomm.com>
 <20260407103530.GL356832@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260407103530.GL356832@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iwI3pU1Tek7BZOxoxyf2ACYigqNb7Aia
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMiBTYWx0ZWRfXxhmPhTgMVUFZ
 Sh5GMEFXZIf7OWWYfXV3IzXYXUpoVtUQyZsJKAZVujxlNnXXsUkI4p7bFgyONQ26lDePo9bmi7z
 h8795jwVLrS9T6YuVHxU+iBNZbseLqEno+8xu94wjCRdn+65+Lg3m8+OUlQdBVJY5bKBy64b3x0
 RVFK2CHoZBmNse/gfNIdcocxCbYWbtyH0y4JbFnjzIO2ZC5/E8PNDVd9lB+y9npak/ciAdlLlC9
 lK4lxqITYusCfNCGSUhFGOxzyANYvmX7GZq3fIpOBnyFi+Lv07qGDLjjwz4LEl1KNAGaAPYaToD
 ibl3uUGEWdtrmDtuqsSDqPyVne5I+Fj6hM8Sgl13QGnGeEmQnAMd7WhudyoqHyCbOD9PLMjmi1/
 x6yQe6/oPCGf65SkpsfUc342PNVcLTdZniWRwwKXabAGm/Txi0ys0587BCLM1vQqXyXHzaK+fnp
 jUtljPr4KOBd7obaUpw==
X-Proofpoint-GUID: iwI3pU1Tek7BZOxoxyf2ACYigqNb7Aia
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d4e390 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=D9BDWDdkfOs3MDT8590A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_035929_008270_78D26432 
X-CRM114-Status: GOOD (  15.51  )
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


Hi Leo,

On 4/7/2026 6:35 PM, Leo Yan wrote:
> Hi Jie,
> 
> On Tue, Apr 07, 2026 at 04:33:22PM +0800, Jie Gan wrote:
>> On 4/7/2026 4:10 PM, Leo Yan wrote:
>>> On Tue, Apr 07, 2026 at 12:47:11PM +0800, Jie Gan wrote:
>>>> Create the csdev_access struct only when a valid MMIO resource is
>>>> available. In tpdm_probe(), base is uninitialized for static TPDM
>>>> instances that lack an MMIO resource, causing csdev_access to be
>>>> created with a garbage address and potentially leading to
>>>> unexpected issues.
>>>
>>> This patch itself is fine for me.  However, I am wandering if this
>>> is sufficient.
>>>
>>> As mentioned "potentially leading to unexpected issues", can I
>>> understand some code pieces access register with uninitialized base?
>>> If so, you would also explictly add coresight_is_static_tpdm() to
>>> prevent register access.
>>>
>>
>> Actually, we havent MMIO access for the static TPDM device, So no issues are
>> observed. The commit message here may be misleading. do I need rephrase the
>> commit message?
> 
> Yes, good to clarify a bit in commit log:
> 
>    "So far there has no register access for static instance, but this
>     change helps mitigate potential risks in the future."
> 
> With this:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

Well noted.

Thanks,
Jie




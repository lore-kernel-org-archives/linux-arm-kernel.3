Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE0AC531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 14:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aNiNwU2QrjjQdW9slXjUnT/0JOvoYgEc5+oULzxO43Q=; b=I9JyzCvckThibGtN1GgbgjSxKM
	+ioCuEjmCM5krK6bHcXLmaGQDsKYPzX9mJFtRRF+XYPbItOWuzKNGwVD0eE+iFy8JLiUoIL3xqABQ
	mrvh/VxzydfiguzPTYcDqdj+AlvWZrAsFs/moUntB89XIhgffJPs05s0KEeqx6bYREV4MoGTIJdbf
	ygYzg34SdtVaDfFHG4tnImFCqCrxzvjTHG4wd+YsAiibk19zBySM4SGVrVrh2ERSPUsB9R8sNOJcC
	ptUioeETaxbJ7DK5CpQKLSzm2INvZp8tQewFXQxIPwHQ6GvjgfWyRpWx6wAosgK4gZMRqa2ZPVUF+
	NaAi4+Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMUL-000000031Eo-1TUA;
	Mon, 27 Jul 2026 14:39:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMUJ-000000031E5-2GIx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 14:39:28 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDldYn3895621
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 14:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aNiNwU2QrjjQdW9slXjUnT/0JOvoYgEc5+oULzxO43Q=; b=cnxgraePk3sg5GSX
	Fy/C6BKFOQKwhwxJC4foprG58vTDKyc9wfn2Y9MCjt27ia7i6Ks1UCMmb9xdZAfS
	TUFMilyElQQ4nI7UygXGsk8EMO/0nQSiooHhKMJww1JnmQC8QIvVr7F8v2YtCFnC
	V3SaMlMnE4FC0VlsPbKsz92eEHnJX9Gv9Vgx8z+AYAL9FZUExb4vOGhQplJMTNKp
	Mdno9Tu63Vd9XvffFKdtqGCW1p3hZWBexODpxKYIY3/rxmekEyfVMh3bxmXGG25Y
	KZCOfEetABf2Wk5aNHCzoFRvtx+kC9Tvup0A1d5yWA8jgFDCOhche4OJuj+YSZoY
	436Omw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs32gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 14:39:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bf321d786so29482461cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 07:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163165; x=1785767965; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNiNwU2QrjjQdW9slXjUnT/0JOvoYgEc5+oULzxO43Q=;
        b=IZC9MKnk5th5DMew2lCv9HRFVdQFMWvaVH/UQGvR92dSjmu3L+lY0QQz+gXJXSgRY1
         t9NIxT5Dn26nM90qYjFl6WQu371mJSbLtbCXwD2dtRBT++XSOimkndTGByDY3W3ptXMV
         T/Y03m22cD4TCidDmQS82iG6P/G2KXNFKXb+yzg8x1xSeHwtc5ajHPKA9fQip1PZLWHO
         An+cz+Ua6ulViE5LK6K0Hw/pJcXMkGh8IUqpjt6Z+escx3YOqYqHx3z6sU/7i4Sy2tlT
         PwZh2jvJh09BRyXSCx0ce6EzKHuje+qkbDq4Feob244yyZwaFj/WahLeEtmHawC933Mh
         DRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163165; x=1785767965;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNiNwU2QrjjQdW9slXjUnT/0JOvoYgEc5+oULzxO43Q=;
        b=X4kMsF8Fogn83d3Ma/itmDfpKBY2Frm5W7fcID11/Y0DjmgvL6knumk+SRWzoqPpPF
         FPbVoSdPEQjqfX2zITmYidfT2B7yOnlD0APMLO2P4QB6FOa2fQ2FF2SS4ajxXnd917hN
         tCnyBR6c5In8qWymaPxIw5hh5iTxQ8MijBTzk0F0NKraJdSAowVLRA1rZeIlGSyizMb3
         aF6FqHwUDWadYSBigZvJdlVLwmk2EjJ5E+dgQcG8EHu154BDRmDLEVnGTBk9HWl6FMSA
         Vk/MzKqD+RsSbGiNzjd+vE9zjvzY7R+q8uVfQaRWRClf0CTaEK3v5zJfl9fhLs+QjnG2
         refw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+BgscVFl2OUFHeo1GmOCjq0iRaUIM6b9lkghrIaXKzOX9YYY6eULLqP4SeVotDzYPFDDxlOWkZ/yHChducs18@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg0+J0QmBwH3KXy0LPWDWZKugqjjF0bW24dp103PGDgdSyODGE
	CrpLl03GQJDtJijtziQrWf9UWrGmLpxAFL+ezwAgNyKfYp0+yFL85f8W3UblnDOFrIAR/Xp/Al+
	LjnIpPktQSoSYQiliiX0QEF8Oq9iqCDrVVt6EUAh6Ab7dL6dGU+hrQfK9KDfRmmTEnX7HtD+OP5
	IBkw==
X-Gm-Gg: AR+sD12+jDK5anefwwyzCiHX1zJtA7m+lS1C5w9itvskEPqBF7f2X4npf7tYVK9rRUC
	oAsMUddMpxno1vNX19p9wvv535xmWwjmLGyhSuZtHpzX/Tb5IaG4y09e7sufnOrwO82dU001Cu2
	dQlm+OVx7wzLCRIKwDB1PxKo+smn3izfMrnZuodsLQWSg9K0owG4E7qMWddSQOjOfCjqSWyBw/F
	f0DSzEjbRbfFY3NjL8uhsFrWBk/VnVHv4yTO0/ROhczPVDJjYWGktENqyujf30+YYpHq7oJ7Kuw
	wqq25NscnCnyEicDwfvx9ZJbD5MhOTrpIJgmxgsJ9ry4ae2A8YnBauay9OALWs619Sef9ncgGhc
	GaFTqyg24/EQq8abwQez6B3jyG/3cNqh7EoqAZAYC8XTjqg==
X-Received: by 2002:ac8:7d86:0:b0:51c:1811:6eaf with SMTP id d75a77b69052e-529a8732f6fmr90542321cf.65.1785163165425;
        Mon, 27 Jul 2026 07:39:25 -0700 (PDT)
X-Received: by 2002:ac8:7d86:0:b0:51c:1811:6eaf with SMTP id d75a77b69052e-529a8732f6fmr90541801cf.65.1785163164950;
        Mon, 27 Jul 2026 07:39:24 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6e9a2sm51480708f8f.35.2026.07.27.07.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:39:24 -0700 (PDT)
Message-ID: <3ce0266a-64b2-404c-a904-25b6991f380f@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:39:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/imx: Disable clock on runtime resume
 failure
To: Can Peng <pengcan@kylinos.cn>, rafael@kernel.org,
        daniel.lezcano@kernel.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260722084909.463437-1-pengcan@kylinos.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260722084909.463437-1-pengcan@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfX3+Xh02a9aeKJ
 CWlbWk50I2hEYDbWWevnGEAOoC2wpgDDxjO9h3rJjGOnDL42SYllp+XHRsWmDI1DkiJosf8QHSt
 0ok13biBh1rciBpoxZd3O7Z+GK4svo14qWsMKE9YY1Z2UVCfb0ufUyfl/vEjCTVMuec2TdG9HJO
 7P8oa1ZApV3jXAVgp7t/miiPiYU6hhn0Qebsk5X1ZwrMGwG9TjejDr4VazoW+TfysY8x/M3G3wP
 Qy0tK/F77JDSezKvgo6o3pD1QLHXuVj4vNuOkwBSHIXOzUnlIiSNN7YnNH45dY2OMMFKNzIxg2k
 oC2p/KVCSxMscW/WbgrNaaUjdO3a1FiN+8CQBZgKR+8nx4ph2TMR/10IVsUnhzLlmEBH+mMZFkc
 OkCBpLJYXpch0xU5qYJpGwtGqeml0k9M80rcYjHmOgrCKR8QkZ70AkcnmwyB1mfDA60ZTXC8w1q
 6mX5KMu6vPkfCUlIuYg==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a676d9e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=mjVe68GCGcCyfEWORksA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: oCGy13khDonkttzy897VUJLmyH7lgVIY
X-Proofpoint-GUID: oCGy13khDonkttzy897VUJLmyH7lgVIY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfX36nM2bzw2DPt
 PH0HaT/obTSXFv1Hnfe5rnWrijvP8wGLgQ1tIHOhNkePx5tfZhnx8ZbjvKbo97Z/LrONQ64yvW+
 wJm9oQO4Y5F0ij9Fw3l12WJTBPssAv0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_073927_710229_2B539FC5 
X-CRM114-Status: GOOD (  10.77  )
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

On 7/22/26 10:49, Can Peng wrote:
> imx_thermal_runtime_resume() enables the thermal clock before
> powering up the sensor and enabling measurements.
> 
> If either regmap_write() fails, the function returns with the clock
> still enabled. This leaves the clock enable count unbalanced after a
> failed runtime resume.
> 
> Disable the clock on those failure paths before returning the error.
> 
> Fixes: 4cf2ddf16e17 ("thermal/drivers/imx: Implement runtime PM support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Can Peng <pengcan@kylinos.cn>
> ---

Applied, thanks


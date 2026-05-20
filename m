Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD22CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCb65PPgVcRobY0yH5IOaSFWaUsgF41FkRsrX3Cll+M=; b=3477or9Xps0DDLsCSV1FYuJOhS
	KOpUEbtMMa6KS1Jc7cU++E0ObQFK9YWO+Upt8ezFBrP7kpesXNFVkrsBLPqPY72BGo33Qm/xodJ0n
	Jz8B9YcORQWT1VnHQYnwmW5p3nJBZTmHTkICEDbPbXWcl3kjsNqBIDZ6nvHEK0UYyf0NTJ/dYJHRi
	ADUiNEaIAFLjuhw7CQeFdw3JGIO94DNnMlhOBBgYIQAwlQ+jllVHrtiwYYzPV6AxC4Mg2hUggMP19
	CO2ZqWSKA9xUGcJulGrcUvuQVLuAoZZIJmqjGniCEBUvzc/HFkbPxVj+OOGpEAiQNRh9zLa/jjPvT
	sGTTziww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPix0-000000051Wy-1bIk;
	Wed, 20 May 2026 15:35:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiwz-000000051Wh-0PUm
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 15:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aCb65PPgVcRobY0yH5IOaSFWaUsgF41FkRsrX3Cll+M=; b=p+P90J36Fs61sod7KdxoLjyDQl
	hbhrylhPKnBT+QPIPrUleQROH1s3vPpkQCB0awh6ifEYVBQ4JhjQaouy67ISCfFT78HGzFi8rPthi
	jkWsHR+OJCD43GQCslYY91YRwBHQjbhmP8xPqzMXULBVqaPm3hDmcuvMTOTOp32QJH7G+x2YxCCUK
	2uT9wYHhKiO0kdGPgwfsTZpJO9fNkNtsFlxG8ml9HurIv6nPnhq9gBJxu2/Y77kg64gCUwLYuHdoe
	guaQCGkJJjQROq9qa5P/uLgvazJknMr9bLQhL1lm56SDC1seyIc0MFRHC6pbShnhUqlEUBbgUvZle
	wboRA5Ww==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiws-0000000HFVo-41fg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:35:10 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9oZKY1178265
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 15:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aCb65PPgVcRobY0yH5IOaSFWaUsgF41FkRsrX3Cll+M=; b=d2sGmmerqvMmdFQh
	BICjFbRpkZtg8XA1a0GfQ/DqoV24Fe2dZyAiEeR/7ZZRJCXRwDpQbt6kdwFMcWWy
	YJQZaRSMc1PIMCPZEPlmPgOXtd4WR9+yPj8Z/pJ6WWVat3y4/YAeUWnVHITP57H0
	xJS7hqDkruXeJ0rFNTh5QtjmfRCuqF2YCFQ9Q0jd/NfPxVhegGlo3/2vYqpoJLg7
	ll2CLT7biH7kqzzv4/zeNdIZCpFNWGONgCIAks9fnvO5H6ERW/iClGzcmN4nWeic
	inZRKXYKxWk5IYhwuuc07eDLuwd8zL8iKkVNfs1D0ORVGzWFfEwjEBE5CowVMQhh
	DpbPFw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6s9w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 15:35:02 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6314daf0053so2780934137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779291302; x=1779896102; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aCb65PPgVcRobY0yH5IOaSFWaUsgF41FkRsrX3Cll+M=;
        b=ItFCzvGIenFNZd3fLmSUE43s5Si6YKPZhEQLSD3knK/iELfXhVLEzi0vtECSZRwsUl
         szK5ErSVRAS76YEyNxZ/zHxGM542kBD6iR9AJYrJzvC7vGzxiKMKt5dQOCfN3HgjaZNq
         JfgzY33WQuyGgMY8Baa6ynBZmR/PscdkmFpm4iFfvyqF1Fh2H951Z3DWwaYj1NCiB6iT
         aRAxVyx0vWWwg+uJ2IqKjqMbqrekejXq+7m4u+DIxWxW6TMr0sn39eNcCeqeC/yv742f
         wr4FzpWZlSWTbRlqFJD6BmuwlD5kYoYIp88+DiUBDucHXateavBO9xVvo7MfPFmQxY2x
         d/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779291302; x=1779896102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCb65PPgVcRobY0yH5IOaSFWaUsgF41FkRsrX3Cll+M=;
        b=DkmTKq7go5CgZbbfOGA8ZGS1UT3MAbgprcP19K78dOfDUxqwZe7bhzAW7FDhF+QulH
         3VWtogwH9R6OXrt8L5/VZhrFZkXSnUpKWYIqmP8Lm3S61czI2YmeftXkaUcady2LIs29
         766fSDGCXxQaxMnUeTVlqLyv6US0CWy91ptf12aqiJfUUjHLUqKRkv5RUtM5hU/vCCeR
         KoZfv1+kyC0JUOPig3NIDgq7wXUTWlZatSjMPYMl+mpI7djiqt03S2E+RfW80vRbcb2K
         5UlvKDLG0PNy2dp5qaNk11yTk/vmXhD0vE6jM0OlhmQ2g5sqgfjDu/B9NKLRLQ5ikTOH
         Tmhw==
X-Forwarded-Encrypted: i=1; AFNElJ8bnyfI+i2Dsmysg12WY8rbJwg2lsfMuIV4+A3iZicT1DKpBaNc4xzHyJW034+g/NLcOMqHQB6+KfDE9InwD1Ab@lists.infradead.org
X-Gm-Message-State: AOJu0YwufZuMaH/almwOV2eQCXI0XSkgV0DYpnvpmy9TiuPlxIc5Hw+q
	XIRB00u7W0hsTamk+H5XgXOHSblaLrErg34d8ar/hRTdvm7wyOYlbt4ojUm6KdFD5t2OWd2DdAN
	v3Lou7xlGfXXsHSKMritii82XA5woB9yNqA/ZWHoLWDf+2wSoVcdK5CUu08iSkWc7w7Ly3mG5kl
	gO1w==
X-Gm-Gg: Acq92OHfT2YL81tct9oo111WiAOnFtGw3ZlfxK33SCnKKRBTPQV9/P7ClxqD1/xTwpt
	L86j/YQq9p7HogJgevlTcTUh8+h3jUJgXIY+VQdvFoNUO40Sh4P2YR2mitI/tHKJHaTDoMTC58f
	Oug5I2OUS4tALwQFusI76sEP+wmzCRZ2mDzJi2cYoSN5j5EzqGtKtRojEFZg6Ktsw3flUqpR7Fd
	TIcueVh6A6ZOLzgsJ/fWZk9CeKBEp3jj3OXxLxo4F4o2xiwhuVZtPu+WY6f1pVZBRfklDsbPZvF
	vTHdMXezGsvmiSwrDAF4x2GVrvt9Y0UtBpZHSshUYCb5OwHARxXvRNGbG14vR7kibZZYXhCoZ2G
	l4VSVUlzMgDaQUv4iT9okx79X0ajoR8fIqfuYs2FyQO82oIrJ1bDCblP/lIY=
X-Received: by 2002:a05:6102:598d:b0:633:2389:3a84 with SMTP id ada2fe7eead31-63a3fc964a2mr11421071137.24.1779291301943;
        Wed, 20 May 2026 08:35:01 -0700 (PDT)
X-Received: by 2002:a05:6102:598d:b0:633:2389:3a84 with SMTP id ada2fe7eead31-63a3fc964a2mr11421006137.24.1779291301435;
        Wed, 20 May 2026 08:35:01 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab818sm421761775e9.14.2026.05.20.08.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 08:35:00 -0700 (PDT)
Message-ID: <81b15533-3258-48a8-8d5a-0dcec7027254@oss.qualcomm.com>
Date: Wed, 20 May 2026 15:34:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: mt8173-max98090: use standard callback to set
 jack
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260520132930.54333-3-srinivas.kandagatla@oss.qualcomm.com>
 <5990fbb1-286f-482d-b02a-d0637494f435@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <5990fbb1-286f-482d-b02a-d0637494f435@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5wSYpQc4N4oYr7qHZTffb2QxpzRLNe2i
X-Proofpoint-ORIG-GUID: 5wSYpQc4N4oYr7qHZTffb2QxpzRLNe2i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MCBTYWx0ZWRfX1cW6LmpZIqx9
 bBuq0x8m+WcX0xeauaQCp2jcPrhFymRDenZ0POKmQwmyyxqEl+W31DjcDAPQPeS5sTbcE/j7pXk
 I4EyPvxQvJSUUc2t39AZ0Jqtw7oVuzMtXz571xqjWUkjMaOHCmjgVSDBCi6wVA6OUmaJJUJAZuM
 1QiBAiMN9nZ3CvvF1mqX49XU3GjowrkmSHWe6Wq14ESxXecRBwe02CLLcgvFyGm1y3u7pKJ+G1k
 V1e9L07gDsRrkxeiJQSBUrqc0j7B8kCi4edptG7D7X0eiUDCuZDFDttDoCG0cDWE6wqUOFDt6JB
 ValIrDNYH9XUqCbVthckFtpQw9SBqrpeTxD6DDWH7aMrfKRvuFeCoMOW1WQuyK0K/2b+qaF2ue5
 hXRfBXYRJZMLTy1swOJbE4AxyoJxyYxXtpzUveqnG0KHDQ/ZR2d4vyPSv2nfgQFZ2cKkvfkVJt0
 SDdNKxV2QkrQJG9jK+A==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0dd4a7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Zl4mUG8r6ouv1iOMoRsA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_163509_021038_D5771D6D 
X-CRM114-Status: GOOD (  13.57  )
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

On 5/20/26 1:42 PM, Mark Brown wrote:
> On Wed, May 20, 2026 at 01:29:30PM +0000, Srinivas Kandagatla wrote:
>> use snd_soc_component_set_jack() instead of custom callback to
>> max98090 codec.
> 
> This needs to be squashed into the first commit, otherwise the first
> commit will cause a build break.
I had them in opposite order in my local setup, which is why it did not
break the build for me, I can send out a squashed version.

--Srini



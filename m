Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E660C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 03:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auI/TBj3WksZ+3BHU5GHhTelrXI6VszNhGlf081ZjvE=; b=FAbHjO/T0u7mnnY1DmvASuM8VK
	QtQBr84km+qNf7/K3Nkaz5B6cBv9NgLoSuDtTjwMDOEP+fI/CeYT8+m8QS8q8I7wi+h29AGvahetZ
	aZmYZUP0QRXyUOciq8yvLFc29bv4xVyoVPjvFywZKeNLecMCDslrlEqj3UCOow5ejDW9lzHkz4Tt1
	Uut+/vTk7flXPrwpJwVxB7x3Qfr1pWpeU+P5Hd3qJWSMAhXB2mHiCg2AceKtgpiLbYQeliB+2rcMd
	dNDaNMg4myvuNA5XMuaxWXBSVALu5PsauFTF2DEVMoSAWs9h0zOGvXK6UqNBb6eF1vB197Gg4oQUr
	wkWY3eUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyhY5-000000005NF-1YTa;
	Tue, 25 Aug 2026 03:10:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyhY2-000000005Ms-28lw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 03:10:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2Qsva1633231
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 03:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	auI/TBj3WksZ+3BHU5GHhTelrXI6VszNhGlf081ZjvE=; b=iOHpof7nf1DUJM+j
	oQqP1eWwm55v/QpHWL0gY1VgJ+tIcutSd3Y/7LDSwTuKgqCCIPDL3RuaggO+J/RF
	pofPy3RYlpCRgqH1O27CJPBw19eYzS4voQi9vOQpnC7iKB/Y3XgJU8jW+o/IW1U7
	eU34+mnZi+o3+HT33jOdyBBIXTgOaT121Yvf3XIjl20OO73FEanoGbNnodjsH1uy
	GIBBXGe0kE3G55N2L+AWJXk3JXC6GJXUmwz4Wu910NjgEwigK4rjOukeSdQpQNJH
	GP3QOJhvFbRfNd3Vlo84ZnfGxYpMzSljnX2nn5XT0+pnzM0aXAws9Bm+zjrR97d0
	/XVA0w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8swr9wyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 03:10:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so6822334a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 20:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787627400; x=1788232200; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auI/TBj3WksZ+3BHU5GHhTelrXI6VszNhGlf081ZjvE=;
        b=R0J0/TFe1dol4/krp/BSckAq9Fu4/a12+KO9+hOwH6FZe0LVEo8AOKb5j79O6xOEbY
         G48IbaRToALpV3q315P2q1qkN58ghuOeOWPiWStcthIB/lbGHORJ/E3Rb6MSjW+HSS2A
         LsHeORYYMEfzIRnyUFyE0VtX075vcjEBflt0m6zGsS4Nz/y8mCGtbS6JRaUxRD0d2IkZ
         40SUyYRe9rJgkrnzP53KNNIXMyr0DnuyODqcoPMkJExH0dX0PDmRHVfrIIcIMdFdqOyv
         3OT1TfoNKHZTLQOeIrHe5Cb2FlX+nvG0/FAbSuY5dBzylHUnRmddUB+5ERtDiOUWApvn
         nOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787627400; x=1788232200;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auI/TBj3WksZ+3BHU5GHhTelrXI6VszNhGlf081ZjvE=;
        b=L2n86ly+XQk3zif4fDwYVXTfwBPMDvBjPev0NIAityC3tswo941Czz1MgVUYcVPu71
         uIZLkaMDtq1Otd9fF3LKo5pRmKm2J6eEgdvhnNBmAXIKx5V4wg54vOtPeHGc2jZ7KQDe
         qN0m5kqTJPPnsWCz+s3gxVhRk12YBTs1SmV0jYHSMWsqIooO0U9/ewdsrDZ79jn2fOvE
         iGNM45BmsTDpPXzzpuzqbNAiv2/7i/kZwJhMopBVp3bbUh7jN9ZjyzDMOQWoXV0HNrQ8
         W//v8nPqqSOXVXUegFAWIaeXvN7FQpOr+FP+vynnIkDIKFzSAc0Rm1nRoqLLD/6eJB0e
         Q88A==
X-Forwarded-Encrypted: i=1; AHgh+RpLQGJrFdV/QQEVCm2Q3cYWDcxGk7dFx8Grm5D1IVlsGTUrK+9YdxTwZlBhRZQW5YPqpw+H9qKnoa7trSX9wb/7@lists.infradead.org
X-Gm-Message-State: AFuF++md6eWtMjWeOaeoN/MbXVHG811WOVVtBbBpE2Yv7XWdjZm+4UJk
	4QGFNhRruX8pk9YbrO1Epeo/9X6xkS+6kZAG4klvw1q7V+WetGwe1CLDvhw7HTXW2j6kXDG/xUE
	A21EN97Upg3qgi2/65+kJgSVA04pnwuupQy2QZe98pQskBqgQ85k0sINx6KgXX2JnksUs5z1Cjm
	Qj/hLadba0/A==
X-Gm-Gg: AR+sD11wiTuwGn8ve9sjW0K0dV63hWf9GSeJrcAg4FgO7vunG8LJwGiYh4Clwn7mOky
	vxmRcH5N0v1IXy53WtG4yKHtFehAKWdHu4SzuOnEXA3c+HgILdshNB9BP+lrv55iU2DDO81tzrm
	wlCEwfJ52HW0HoGILCSqUxQCuBhKBOPwg58smIOHfV8bAW61nR2DqjAUs95e9u1BBdMcQtEz8bq
	A1KXIW3SB/xRfN+ua+WLEWOdYj3XFG19ehMsB8L18DzoZKnsbUkblBMv2AUUGkCohgXvAmxfaaK
	gNRUPFxma4tDMA+ZT0ctG5KCYV8HjTda7C4myuGS2JgeOaZs1oYRtCWATfOYof9CHLTCXxP5g3e
	JH9g21xKzfRi62HT0xoeozGbANk7KL3rR3X+BECaPRQzxIg1xIa/YKwd/Lp4D/iQ8
X-Received: by 2002:a17:90a:d64e:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-395c33dd84dmr59024622a91.1.1787627400127;
        Mon, 24 Aug 2026 20:10:00 -0700 (PDT)
X-Received: by 2002:a17:90a:d64e:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-395c33dd84dmr59024515a91.1.1787627399640;
        Mon, 24 Aug 2026 20:09:59 -0700 (PDT)
Received: from [10.133.33.87] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3964480d4a7sm567481a91.4.2026.08.24.20.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 20:09:59 -0700 (PDT)
Message-ID: <55c77b0d-6625-4221-a983-8275f3c1d1ae@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 11:09:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: tpdm: initialize spinlock before exposing
 sysfs
To: yingchao <dengyingchao@kylinsec.com.cn>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Mao Jinlong <quic_jinlmao@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>, jinlong.mao@oss.qualcomm.com,
        qinyungao@kylinsec.com.cn, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <8693039B65AA093F+20260825020647.2469-1-dengyingchao@kylinsec.com.cn>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <8693039B65AA093F+20260825020647.2469-1-dengyingchao@kylinsec.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A0q7NL971egxEQHhL6TkhfjHCGMMOXZF
X-Proofpoint-GUID: A0q7NL971egxEQHhL6TkhfjHCGMMOXZF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAyMyBTYWx0ZWRfX/B7qKYbksSfq
 WfNJ4fPHE1bdF6/Rrv+ENXcmO1w1ShKfncFOruXpsQhdII/2bCsebw+dcO9XR1eNojMVgvgQiWW
 rdgK2LsNbRweMa3Z616X77dM03qxCCk=
X-Authority-Analysis: v=2.4 cv=TqPWQjXh c=1 sm=1 tr=0 ts=6a8d0788 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=C4lfG5toAAAA:8 a=EUspDBNiAAAA:8 a=fwXp5HOcM--7f4IBWnQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=iqleXTDqv_QQetf3OR0u:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAyMyBTYWx0ZWRfX9V48QSeYpuet
 gqozdTbvpzU4flNkpFWn/zvPQQVumdMljdR68iI5kBwlWcSdN/jNHrMi93K5Su7GATsOZnSd6uy
 qMO/Ex3jHfKiugMAZDpoKpP8K/oQ5z7M+QjWrhksUy8BN0dZIT1LtSF6pfT9DWIXgSm29Ahgaiy
 rpQfpmuNDc7PaiEHHbjFfvZbhAZWRU55pYB9ECCU3YyT12hpTcIgKF/P8H+oU6qqagBwH1MQ7by
 t+vDg6idqgNsNzmQ+VS7t6pzk7JoF62Ao5mtNr1EnqQivTX1vyj12wSKab4Cf01jlZaY7Z0n0eU
 GGP1aD07OQzqY1I0IaITFICxsEYKTTKt/X/CVNqDpiKKdIEXgvjjonPp0JzLG23fqVi8xjxN8YB
 Wb7fBjMEkYUvCAh57aKQkdbkYBDMIfiN7PPCT26Lx5T9dEMur35pJXsiCpkVkiipP7f8E2XZIwj
 Y3EMkGb+N8XTCMoBQ+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_201002_576646_8A271899 
X-CRM114-Status: GOOD (  19.36  )
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



On 8/25/2026 10:06 AM, yingchao wrote:
> From: Yingchao Deng <dengyingchao@kylinsec.com.cn>
> 
> tpdm_probe() initializes drvdata->spinlock after coresight_register(), but
> the sysfs attributes registered by coresight_register() use the spinlock.
> This exposes a window where a concurrent sysfs write can lock an
> uninitialized spinlock.
> 

There is only a very small window during which users have a chance to 
access the sysfs nodes. But still worthy to fix it.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>

> Initialize the spinlock before coresight_register().
> 
> Fixes: b3c71626a933 ("Coresight: Add coresight TPDM source driver")
> Signed-off-by: Yingchao Deng <dengyingchao@kylinsec.com.cn>
> ---
>   drivers/hwtracing/coresight/coresight-tpdm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index 8464edbba2d4..50d1351772b9 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -1457,12 +1457,12 @@ static int tpdm_probe(struct device *dev, struct resource *res)
>   		desc.groups = tpdm_attr_grps;
>   	else
>   		desc.groups = static_tpdm_attr_grps;
> +	spin_lock_init(&drvdata->spinlock);
> +
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev))
>   		return PTR_ERR(drvdata->csdev);
>   
> -	spin_lock_init(&drvdata->spinlock);
> -
>   	return 0;
>   }
>   



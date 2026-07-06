Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B9BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 00:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjYYU5MdcHMT84Wjl0yNDrZfZdaLTw7OHcRSQorQSzE=; b=wOixJdGkddiEe05/X/OrgVcY9/
	YsuyRHUUD2p0Spx6hxIA0Bc8shrDCAxtci1Epw24AoxhasTcte5toG3UUREhWZObJ6kh3lY42XWO6
	kEbd+6BSstXqkU9p5qNGH7STEqVdWU2iOoMFsvM5Xo8ArhJ4DgWdPGN/8MWc1odUS9QTlwHtRn0rf
	MwKqc1Lo/pvOyh7Bp2WtLE8wyCS6lchkLWlRPji4bzMJcTDpJpUhzAZqZOJklyWjAgCgY1KJIZoUW
	TXbd+qYQqwkTIDkx2sYLbW8828C0wzvHd7fdwPxCn9e7+YFKZDn4xChXniULQfZmwXNjygXBCmyDo
	0LK7OwpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgXJ9-0000000Autt-1SK8;
	Mon, 06 Jul 2026 00:35:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgXJ6-0000000Aurh-19bL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 00:35:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665LxE3C2868070
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 00:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qjYYU5MdcHMT84Wjl0yNDrZfZdaLTw7OHcRSQorQSzE=; b=CD3cUqaAegJB4e65
	l05cjqYkNSEGBRSi30tpdxmoIOjXbYTHz4LmamSYt/F6+AMmWpsNGkgehh9rh9CR
	fY8da+SdeMDmN4BCSyoiKPMJyMpgc75KNDqSSyv5G4WjyRin4yhHvtSGIqps2di4
	D1uI2inlFoXz6N7ynEw5G7wWxaYF/MMISXPbFzM3nl1ryvUqwW+VRiZKfpRgtml/
	mPhWtO+j4eB1Sa7T3+Gl5HqIwJQS4y/nnrj08U5FqcXMsBhuQ1oxL6iqVjvxV1Zi
	YVkqaEY7vSgQcsBoqqZp4sxM6qSyqy2PAieLMsTI0iyi9Ypc67oqXZdb0kG6Mv5a
	NNStoQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4suv1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 00:35:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37d4f23eb37so4272539a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 17:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783298130; x=1783902930; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qjYYU5MdcHMT84Wjl0yNDrZfZdaLTw7OHcRSQorQSzE=;
        b=cGd4hcPPAhFIU49mLlzKdaa6xNSsvRFIacuuVz5eQUmd9eBP7mbPNO4zuSfthexdct
         K7oSpc5I+PnDHy0MlxdrK7e4j7jf8aQQQC407MeqriSB2jiGCLN17WhZ/5HIDNbhLiZD
         eD4m7DbQ4wWYZnEmQLPaSHwSq600yrDam5P0mNTohHChFwtHkEXaQ/18JsF8ZQiMVjXk
         BIbKl+4ZItqNNMi8kz+mfKYJ1tqqUIRROsrbG8ApZJct4K6Wp86WMH4ZavOZUAfG0DjV
         zzNb8q5+5SiKHjcNkcD9PnUcLA5X1TztUeao+31tGwX9uyXasEr3MvThlaBrFygdzbYt
         dZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783298130; x=1783902930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qjYYU5MdcHMT84Wjl0yNDrZfZdaLTw7OHcRSQorQSzE=;
        b=MrHQucn8WmwuDRMkrPHh6/yve04F2pCsysqOB84F/CCwBuaoEYtIoe8KChPpdysTQK
         HgoIzVpI+jUO3HfIhcuMJwUtub/qtsFZX70KoPLR9UZlE90AppMooDjMA3wI7MzEmxCu
         l3z0ZR5z+fTjjEIj75YeIbcV8HHLCwjLCDkbAVks97KCOLf5BPU8Bp1yjCywTtgzN+H5
         ztTXQsgn12WtEvfndgDhhBrRbKdKp4s+qhGqjPnXlo6Rf9OCMI0uYFkDBLtvpxfjI9Ga
         QMUGRpnkziKvx8fW1whDOlVxCfSYUXTUepW6Qm8cuTXSK5alhe/733xjx10RrBVmfxJn
         w80Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqi5Xm12qehSEwchtos+/3EOzzf4VnuqS1JB4Av299p6zHaIrXTAYcPCbDAUqCfdG5ozcBsAJv4OYzH8c33oii0@lists.infradead.org
X-Gm-Message-State: AOJu0YwYxfPXGrAHIqTvBuaOJcCdCCkFcGqHMZHUm3AWav4tadLQgz40
	byJREdKALupc436MYnRJpwz3Yhw2X8GYHEj4+FcLBG1LwhkgUQMTYZIG0SGuzdXgeYPfZ8u8EXl
	FdpKg3RnCD0OSLvdS7VnZQV5GhJHiVa2A7Z2F5YZZE9PXXM3IJpqcVcua8NYOtbtXXf9aW3Zu7t
	S4MQ==
X-Gm-Gg: AfdE7clWJFppx4Q/SZI5VEeMC3praAejaRe6meNrREGrPZ/7YkFm0CkFtMxvFiGRY8T
	SccOi3TxZJWYc8C8jersBovKVGr+MXAes++KQtcKtyNblmzpqLCfGP3avsjGJWSoRUUALJvOznE
	AS6dk/eWMhnbyWcZWGU9EjR0OKnbl+DZAO3otUu+Aw0yBBFScTdzFcJ2fkou88TWggd0g/1J+E/
	Dilphdwfe3HeE4JDDfhAV+MhtvcdjusY+bTQjNMq51yWG7gLpi4+TemkamLvYNZ3SCdq3j9jkRS
	ANpxenug3u+G0xoWJTzyNZjP1fBWhEpEadnGNQbXcZEgnwtEp8x3046/YtD9EgmbxCR/LmSGjz3
	G539aY2Ddz8bF4viumn4FRpB6TKsKiqD+c1BOnh8QQo3J56E7cBCiRgAvAHS2gY+VICUWqZ5qUU
	Bn
X-Received: by 2002:a05:6300:141:b0:3b3:f46:1eea with SMTP id adf61e73a8af0-3c03e208a9bmr8362713637.7.1783298130400;
        Sun, 05 Jul 2026 17:35:30 -0700 (PDT)
X-Received: by 2002:a05:6300:141:b0:3b3:f46:1eea with SMTP id adf61e73a8af0-3c03e208a9bmr8362690637.7.1783298129919;
        Sun, 05 Jul 2026 17:35:29 -0700 (PDT)
Received: from [10.133.33.154] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e921cd139sm5158166a12.23.2026.07.05.17.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 17:35:29 -0700 (PDT)
Message-ID: <cc416479-0754-4787-a2ce-7af6fb7158ab@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 08:35:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: dummy: add missing MODULE_DEVICE_TABLE()
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260704121621.48544-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260704121621.48544-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDAwMyBTYWx0ZWRfX3qqjI4q+bo2o
 Aw8kBugBFXPuFfqqto19ZBN9f0pQwmvVdJXdbakCgZ7+L/8nxN2qpGJuqLD4IKoVjsEJ/5VHmd4
 2ChB/Umo9hGfOdGtOtF6+6r1ujaPyOA=
X-Proofpoint-ORIG-GUID: bOgEcbt9aVV50zQto8kQvy1RHRmdQj7e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDAwMyBTYWx0ZWRfXxzISqMCViAeV
 z9GKZovlxATjwsSMtV+bi0ReoAHenPdZ1SpaGELtSZWr2uwXP1YYw3r+5nrrmJjygArzsgC/tKe
 sNbpFLrWxoMwrpRaPgpSmjYOqPjZxM7Ej7yiSrJcRq/pgi1PIGou2Kvh9EhTe+1zo1H12+9ieg5
 r58wkeEQYXCGHE6atRgbwsqNQcwBAxNz26i5rkJltI40iaXlMe4h1amW1SRztJyGx08IZGTgzcf
 qDRAHWJ8h5CToYUVpJ2ywASmm9XbAApc8iedGJzPq0uavhJiXq+Y+7GW+8wo5J44NHeo/9CNAjO
 xGFtUT5nHQ5NlgC7xT/S/mP7qu3sx1dMmfAYjv3o4m24/kXdtd0UTrEtYQOuWeuA1HEw9UFVVNZ
 gLGKeuhiPADnH2hWfkCOaiNDuUAbCIeVQmHuGrAUsrwAKjqF+zOsB2VlmFP8hLWZ887yv+yNizV
 onxQu/TMV3dePCpHuEg==
X-Proofpoint-GUID: bOgEcbt9aVV50zQto8kQvy1RHRmdQj7e
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4af853 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fBs5-pIvW3lKeRPO0CEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_173532_335230_72F8E4BE 
X-CRM114-Status: GOOD (  21.08  )
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



On 7/4/2026 8:16 PM, Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
> 

Thanks for fixing the autoload issue.
Please add the fixes tag for the fix patch.

Fixes: 9d3ba0b6c056 ("Coresight: Add coresight dummy driver")

With the tag:

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>

> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   drivers/hwtracing/coresight/coresight-dummy.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
> index c176a2f57300..04880d38feb7 100644
> --- a/drivers/hwtracing/coresight/coresight-dummy.c
> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
> @@ -212,6 +212,7 @@ static const struct of_device_id dummy_match[] = {
>   	{.compatible = "arm,coresight-dummy-sink"},
>   	{},
>   };
> +MODULE_DEVICE_TABLE(of, dummy_match);
>   
>   static struct platform_driver dummy_driver = {
>   	.probe	= dummy_probe,
> 
> 



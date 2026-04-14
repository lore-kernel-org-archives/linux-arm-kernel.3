Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DF6ED7B86
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 08:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTX/7ucEL6ex2fPrlvvCAc7rdkKfuse1roma74lGVgQ=; b=loA3OHUkI1xFR8KSo/dtW6F9bB
	GFEIEESTM6pi4ozcGUTZuGYQ7XEL0oCB9JoQLYdzFRm97MAQeNU93smxxsxmF+S2WXPbXdPOByWV2
	kG3lU3jR1wEBKEOyZw536g75YWiLA3oE7lPm0Z7sVy7E8X+fNF8gsNx72sIJIlg7iWzN+U6zUKeln
	bd0LMQmpGG1+a6Ps53wqBSKKOLgjtucjtcHf/pJENhcgjutESqC08mpQ+Z+WVyh+YpnFlObb23zt0
	OWOixoroLUGghR8aVRF5/HZDwhQwHO2TJJN9AbwHhToKil5b3mPHMiZ0F1vlY58duhfKm1Db/Nyld
	g8GDinHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCYlL-0000000GwJp-1886;
	Tue, 14 Apr 2026 08:04:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCYlI-0000000GwJB-2Jl1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 08:04:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6Rl5S395324
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 08:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yTX/7ucEL6ex2fPrlvvCAc7rdkKfuse1roma74lGVgQ=; b=Tcurg1Ap2O9dNPI9
	h/XBh4cIqszBiUBsrkgjiE59SocQov4FSIest7Y8tqxzqN6++7QYcV8gJbD2GMfJ
	8mv7amPKgBkHJulUFW6TPL5p/0Adgt/8+qZVyMJamSLE2GfcSOQLkxQu6rzk4D+0
	ZlqcXN6rZV4pNUw6pPb795JUY7aLfjbHp1ogW52v/G080F8RTH/pM06N4cbU62bf
	m7XIld+QL7sisoM21qFa0nBuv2KyuiGWgQA7b9cc4qyV1nl8VV2jsNGa5MqLc3si
	NmK0lc1xHAiDNKsnBOdXSChn3xCN4pLxtCPcimxQ5eIsbo0Q5Bq90wM39o6wKQTW
	BbQzHw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870sq68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 08:04:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35842aa350fso9933545a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 01:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776153882; x=1776758682; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yTX/7ucEL6ex2fPrlvvCAc7rdkKfuse1roma74lGVgQ=;
        b=R850mZfPUN1yfN88NWV5+c5MVvWj1EctpmbharZyY58MujKZ9Yd35HB2kKxEcm4JYq
         UjvDCShDYutEyWkS/iVD0mzwI59F6HeUGmCRY7LOKgBWsps1WnsJTgNElSov+w7JQ4Cb
         FentYLUSg9eXWx/pBbM+TfcnCr0vkT879VQbW22WI1zX02vYNpbUiSK3IH0lL8/EuFGJ
         VCGx/Tu7w1bEWT0fW02ShhxVijNqWVszBAiE+C79FfEBUEaEgfCvj+QPCOrIRvTgepp1
         LfWssEZMX7nRL2rucxdk8zrnp6JsTjgX+M1gIIwFGcWwKtg7qWmW9vYJA8jVATriZYiF
         wyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776153882; x=1776758682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTX/7ucEL6ex2fPrlvvCAc7rdkKfuse1roma74lGVgQ=;
        b=cAUkYa06N3rm2gVkyVOh/nj+KQMUpsxSnO6vsF30VcWJpx1vMW08MX2KAlLQcqvTnI
         UWquMiXC822rqHoH4IaMjlN4S/qfshLp+r6lqgByvrwO9vaVh4kLj6yTwJ6/X+BTbxjy
         5liFyi/J7sHN7g/05Fxr+N4CZhJhBN8ll8b/kMOHOE0Wgei/lc/UlBwTB1Nd928sdfLj
         HXTJu3ZpFOo59M0aAlLmOKXXR84lDdXwhifaVnx8TmhGFS1RzEM9TX4lDGCYFPBLMTIs
         bwOs3LVOH322QTWMpYF+8zGiLvmyTZn//Caagu1YDmO9qRVNUPHh3p956t8JkO35xe+8
         1wrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fLeSpmOCN3Q5Y4DGQk6E7PfaSp/UTj+JYBBVm32FUZi/01Rab9Hpmjv5j11uf1kDALfOW4S8wuZY0ouhngCNv@lists.infradead.org
X-Gm-Message-State: AOJu0YxihQQWCTbBvzglBTE8EQeqMcBzxXjom1+2bMKCzPPfMuQHIgze
	3l9MK0vvhEQ5mfo4LZ1g7BnTOJSAyueBvbiCuqUn9v65gOzS1nzZisz90O8L1+b5wpcd5FcrOe6
	/kc3dQ41/hf5eCatQ+HR49c8KzCTQ8jKYqI6QAw5AyjGSkqanCRGSVEysEcPJShS+yAaTIu5/Wk
	oHVg==
X-Gm-Gg: AeBDietVyTR6LJO17ogGNTxPVlDeZha3RbCGGpxZMBo80dXHnWpLcBes/Ra4ZJ3FL3u
	+vja+t4LtZzkVuKSumHhqgScsz6uCcDNdXkXFAxMXxQ05J85+5l4EQVTWHZBpdeiWybaj7SNPYe
	kiKVmWcATiLlwM2/HLBWAB0DyJTmiYSq4iIENDm3b5PuqUlxMrOykUjT0H1M6ksUuY0gh8LEJ4r
	GtSfbb035UweppHsn7ACvC0+MufGBgwNy/7covIDCCfMnwQuTRkvNiuQvi5AXTUYgSvRv2up0LH
	uzQOc0XXnRCt9oW+det+ShlX08+/2wybWhNdpHiqGKnyoU7wRwVqi4rE2Wxe//xUZlSwqTGDrY/
	bllaBmANdKgQR73lZ3OEo6Um3OSNLLcTdK9S+qTDVhDaOltJnJabwxHntnr6v0kPrHF8UtJMnKq
	ZjjxJvVgm4Zg==
X-Received: by 2002:a17:90b:1d8a:b0:35e:3e86:e2d3 with SMTP id 98e67ed59e1d1-35e42777a47mr17421186a91.10.1776153882497;
        Tue, 14 Apr 2026 01:04:42 -0700 (PDT)
X-Received: by 2002:a17:90b:1d8a:b0:35e:3e86:e2d3 with SMTP id 98e67ed59e1d1-35e42777a47mr17421164a91.10.1776153881943;
        Tue, 14 Apr 2026 01:04:41 -0700 (PDT)
Received: from [10.133.33.11] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fc6e8ae9bsm1165923a91.1.2026.04.14.01.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:04:41 -0700 (PDT)
Message-ID: <e66d153c-c099-4eaa-8d8d-60f2b9f4046b@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:04:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] coresight: etm4x: fix leaked trace id
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com, leo.yan@arm.com
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
 <20260413142003.3549310-4-yeoreum.yun@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260413142003.3549310-4-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7ht0fWj8LY-19uQssnCAZ44JTFyUu7ZX
X-Proofpoint-GUID: 7ht0fWj8LY-19uQssnCAZ44JTFyUu7ZX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3NCBTYWx0ZWRfX7r3lAQR0xbLm
 8UMiHGMclbeFtf9NR0VjyNKw6kBqV2qvMeKqo9pHi+fYGd2sdbthe+xKaIppZ4tULlQkbB4tHf2
 Gxpw0plI+undhQloEpy4Kq9iIM+09Nu0zv2ewJG6jTL5rc8XkT8yCzEp4qs8MEMkczyhRZa/ieU
 YhOGXZzXbgo04sxit6Y05k0Pd5s8q3D9FTIK4YHwAC2pQqRe2fnj0v1bAYEUesxQZLyxsNaUzzO
 CyqeMBWAYxoioNG/uBkkvvqB7ADqxMJGrnp71ptiM8YUozIzWQGDWDth2H1oFUSMMiNNhiORekz
 VvHbVqhjUxLBDSmo7gfTeCGtDuoaEOD2c/DG/8rFoGUOkUwfBfQn5HY21K2qPq66nlhUM/r5cl3
 3MBYwv9ERoeVqM1DpvdXsZp/uh2ahrhibNTJZk0hNvhpBymV8mUHZCw69djXkV1VDbkvUfjHX5e
 lC8EbK2ZUj14VUyZX2A==
X-Authority-Analysis: v=2.4 cv=MK9QXsZl c=1 sm=1 tr=0 ts=69ddf51b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=gFnN8SiNFoKemXR6UKMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_010444_718554_9B5724B9 
X-CRM114-Status: GOOD (  18.30  )
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



On 4/13/2026 10:19 PM, Yeoreum Yun wrote:
> If etm4_enable_sysfs() fails in cscfg_csdev_enable_active_config(),
> the trace ID may be leaked because it is not released.
> 
> To address this, call etm4_release_trace_id() when etm4_enable_sysfs()
> fails in cscfg_csdev_enable_active_config().
> 

LGTM.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>

> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 8ebfd3924143..1bc9f13e33f7 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -918,8 +918,10 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
>   	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
>   	if (cfg_hash) {
>   		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> -		if (ret)
> +		if (ret) {
> +			etm4_release_trace_id(drvdata);
>   			return ret;
> +		}
>   	}
>   
>   	raw_spin_lock(&drvdata->spinlock);



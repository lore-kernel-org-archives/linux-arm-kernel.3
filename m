Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85118C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 03:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wv7VUHWdp7FOHwnmCDQTxgbKyh+3nz706HoUphQe+oo=; b=jx5lhH2YS747fSYpp4spq9Dq6L
	R3nu6zNhjBM2pEE1kstVMyA5DKdc7MrxbulEI8v/Dm42zhVy0YJmK5vO6/8zG0kW4KjqJj2MYf4pg
	zU/hVrSJDYxCi3P0r+6O+BKcy+XbbMx7mc8x3KqrM0eSg6pY3MdBzpXmu0w84Fy0GfOO47ELht54m
	msnCBGYMMCZRhXYV8jd3oOsPj74sAKQz90smTijtW2hiWXTmNI2S8syzzXkLv10tnfIM5jv/bwlBO
	tS7eu6pcPBMi3cG/GNlJiTvGR2o0VprFJiYi/evXtH5dO86NEFX70M7KKgtDXUjnsJ4DZafID00kY
	oWYo4WPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9DDD-000000070Sy-3jCH;
	Wed, 23 Sep 2026 02:59:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9DDB-000000070S9-2Y2P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 02:59:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJBhje3897576
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 02:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wv7VUHWdp7FOHwnmCDQTxgbKyh+3nz706HoUphQe+oo=; b=Wq8YoPsKkFmdS5IQ
	27CNPJF4Y55SVu/HVYyhJ+VIYXGt78vPWF7zB24f8c3q0F4/dmqjBrBOeqW4kslh
	10sIcD5NF2b6j8inY0eB+x9WOI15zG8Zx3ESCSqye8V6gXYr7JEOppFdyJMpy6E6
	rRubpQAz0M+zTx6UZ5VkeUDEIuUljlCbUzV/6kupOgE9bHwQ7669E6S2onpLYCiZ
	RY6jkAP6q+jjy98CVye6d6Ylcy/VVZvN0b0TJeHkY93wJvT39bm2EbuJJFKvGJIW
	3jY7lxYS5KUk2AisHm4cizcPrIAZdEaOjPB6HBvpz6HxXNmtczNJYJ6u6K6VUw2M
	kJKP+w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma1p47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 02:59:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deda201bcso726979a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 19:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790132390; x=1790737190; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wv7VUHWdp7FOHwnmCDQTxgbKyh+3nz706HoUphQe+oo=;
        b=AtekYVM2etC28X0eEnzEzS33intJkB02dVx1+6tUdT3GeL+r+/x+qwMRoTuIi2YoRr
         i8IbOIJciFnyXQgMEmERyl3sSDfzpEWJfTQ93Ksmj7yBYKiASrr96h8HjcZDoLOlTv8E
         8Np/Cq1/tzPkyKg9+XvTSI5//luDOn897IeysjMyXTK5EL+cy+yBKN9/dppJvJRFMMZv
         tJFMnEOn16ZyV129Do4wCc8yseGdsgFbhRbKjKcbMDoK4NpCaYGfm8EIcFhUWqt6Ywp4
         EET7xceFAu71fCm0LQU6JLwy4SflE0tEGilIIvxWsvIyfV3/Ldhr3RDbrZvd2LjtpU/2
         jTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790132390; x=1790737190;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wv7VUHWdp7FOHwnmCDQTxgbKyh+3nz706HoUphQe+oo=;
        b=Vh40SvmoAwzg5uwCa7OlN1Oz0KJ60gYOGI92m2uH4ewq8/ieNlhXTrF7ATFDnrV6Dq
         5Nvv2wPpEnskBkSD/4BMJZBdgp99BWTth9z2cU4dAOWytnE4AYYfX+UUWo+xPuEW+Oku
         nA6X9HD5dpQPo8LJBIYkBrKZ7fM3Ogxvrcr0AuWdMEk/g68JY06i0fyO1RGsmA245yRZ
         dmEmSEQqWURMHvJsFAhQ0v/ALApTb0vwgD/peijSRzut9N5muSE/7C90aP03Ky0icD0i
         BiDcwUb9GU5ul+j7iaLDINv/8g1KgBm+YXLGgCIq4umCBrdJ1gRIVKHkfMucobzdNv/n
         Jesw==
X-Forwarded-Encrypted: i=1; AKwUvBz9U+OrdtZtrOEXZ+fWAAWZ5LLorXRtgSDt1FMkh5NojRh6sWFFgUoMU6y8kA1KT2VIrPPiPiWM9gzZXSUEr2g0@lists.infradead.org
X-Gm-Message-State: AFuF++n+k/9YlgH4FiztLzdiuVApnf4uz+BW2D1iWbv2B5d/KD5MGxok
	F8qJ1C7YXs2w899MK5MOxTR3OyT1lDv5gg1RcaeVgzwIzUGU0OyLSb2SyvJvW+FbM6nbzuVXkNS
	yP536gz6QsZ9blhdEvCvQ9ewZ7TMX5tKWll4fvL3f5flz0wm96zRV8++sCUFZCJhmNGAY+j2FBq
	Cgpw==
X-Gm-Gg: AYBFou28HgvcKNDU4nf2nTKTNSPpxka84jXfjWyH8V6K/6U7+/GIwUlYbJO1R0ZGB05
	/GErE1pbpjF3bPSfnIKanGfaczK/xTQ2YxEbsTfByR4F6tpfM9ohw6cLlNtHdYno5v08CRCY2jn
	Wdg60LQ9MIcyGoLU2D1qccKUTtuC5X9APnmaVWdYaK3vLnuw9cWMcI7KSNciYFTnqwhW3ICLzbQ
	GTB3u3Z2C8ns8gay/tY/3Qr6in92hQiKXhA7Q+/Duk74eZPW67GxRENaemuZ0VGx45ebQr4JsSe
	V3HOCgDXzhKuCT517k7oTIjRnUs/hGvAB/m2yuusBmfGg1YxSPYCIihBCxJkANv22Pyzp3WCp7m
	oE+wJJrrJPXfpI4YlO8D778Yqr6QC8+4aWzucQ/MaarRVP3qCX8mZqmwkwAwvvY0=
X-Received: by 2002:a17:90b:4a0a:b0:39e:6c68:c789 with SMTP id 98e67ed59e1d1-3a07e71cc99mr1203576a91.63.1790132390111;
        Tue, 22 Sep 2026 19:59:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0a:b0:39e:6c68:c789 with SMTP id 98e67ed59e1d1-3a07e71cc99mr1203540a91.63.1790132389605;
        Tue, 22 Sep 2026 19:59:49 -0700 (PDT)
Received: from [10.133.33.57] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5de5c8sm3352105ad.60.2026.09.22.19.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 19:59:49 -0700 (PDT)
Message-ID: <272abb48-8f13-4fe8-a7ab-bfa353f1f8ec@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:59:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 07/10] arm_mpam: Fix mpam_dt_create_foundling_msc()
 to create MSC platform devices
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan
 <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini
 <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-7-bf6645bb2f65@oss.qualcomm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-7-bf6645bb2f65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uAXw53uhe8qOQnd3MSMaWJQUwfdwzgOC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMSBTYWx0ZWRfX7o8d+lG8XOL1
 I4K+kbdPz64GiVPD2Oq4gUUamyXiUFAC/dHUntEL/xGBXjNHz0GNL7s5nlVD7MSm3qsUURvp84N
 e4ZwenbvOCedbP4YiERE/k0HpastRNw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMSBTYWx0ZWRfX9y5pRtHytIRJ
 W97bPFbqxF2ktaRe+NhLrSofrLWvQdha1Dw0ZgIOuYW/s4m3N7DDSRXVrA5MKUvPKNrjhEJyicP
 Mtao8iFiVCUs/IO4tEp6Rc5xSSyIQMUEKf+tCb9LKTb0xX+mgyhuYqyPeMphICj1Af94LA3pTGn
 bUri+6Rq7uw2a1gY5U4Kg/Rwb/Nn74VFkYimQ9tiP70b39KCg2J0PRYPYQXUfrc9kXBJweL7xIZ
 e6OpH7MJq31v+k0vXrM+6+Xfzw6a1rCFfXC4Gf1UX8Na5D2FujwfzIjpLSBmWYn4rSocb8nZ1fB
 PveRCf8yGdbugcmove01JF1f2KnbsAQxMzOE2b1teX/tX2zG5HNwsdVbmMiLAhV0r/LsVAbJUhW
 syKH6S7uA14TKK8IsFxMimqqkpssID0D7qHhRYiuCnZrnwFKdEVUOdO6g0ohz8b2e9j6fsRA2K/
 qfFa2LeH8YvE1G5M0EQ==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab340ab cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2UIP8dk73OJ_h1EwUPsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: uAXw53uhe8qOQnd3MSMaWJQUwfdwzgOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_195957_651533_B5B1C414 
X-CRM114-Status: GOOD (  25.49  )
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



On 9/14/2026 5:37 PM, Yin Li wrote:
> The original code created a platform device for the cache node itself
> rather than for the MSC, so the MSC was never created. Instead, walk
> the cache's children using for_each_child_of_node_scoped() and create
> the platform device for the MSC child node, skipping cache parents
> that firmware has marked disabled.
> 
> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 27 ++++++++++++---------------
>   1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 480e38cfa86d..7ef3ed55b066 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2366,23 +2366,20 @@ static struct platform_driver mpam_msc_driver = {
>    */
>   static void mpam_dt_create_foundling_msc(void)
>   {
> -	struct platform_device *pdev;
> -	struct device_node *cache;
> -
> -	for_each_compatible_node(cache, NULL, "cache") {
> -		struct device_node *cache_device;
> -
> -		if (of_node_check_flag(cache, OF_POPULATED))
> -			continue;
> -
> -		cache_device = of_find_matching_node_and_match(cache, mpam_of_match, NULL);
> -		if (!cache_device)
> +	for_each_compatible_node_scoped(cache, NULL, "cache") {
> +		if (!of_device_is_available(cache))
>   			continue;

Hi,

As sashiko-bot said：Checking of_device_is_available(cache) here 
introduces a mismatch with mpam_dt_count_msc(), which only checks 
whether the MSC node itself is available, not its parent cache. And in 
practice, cache nodes are rarely if ever marked as disabled in the 
device tree, so this check adds unnecessary inconsistency without a real 
benefit.

I'll remove the cache availability check in the next version to keep the 
two consistent.

Thanks,
Yin


> -		of_node_put(cache_device);
>   
> -		pdev = of_platform_device_create(cache, "cache", NULL);
> -		if (!pdev)
> -			pr_err_once("Failed to create MSC devices under caches\n");
> +		for_each_child_of_node_scoped(cache, child) {
> +			if (!of_match_node(mpam_of_match, child))
> +				continue;
> +			if (!of_device_is_available(child))
> +				continue;
> +			if (of_node_check_flag(child, OF_POPULATED))
> +				continue;
> +			if (!of_platform_device_create(child, NULL, NULL))
> +				pr_err("Failed to create MSC device for %pOF\n", child);
> +		}
>   	}
>   }
>   
> 

-- 
Thx and BRs,
Yin



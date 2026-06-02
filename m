Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BE2CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 16:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cHo+HdLfWszrxz8FIlQUKjxLUJPM3VQU+KKIaZgzs8=; b=Au3Je0zYci70BN+ZruZcmAhAhV
	4Ij3+vkMoemtL06jz9N+bY3FNZXLVUxVxYJVcRG6KRn2VAVCU8KOcILlc+HKo4LXXVwxt32YBkIdv
	YLM6M1tGE038EHJOzFfHkHHQVj/lQqnz5aNV+JS1MPX/7JkmGOsXOB8dH89ZAYkgvtx3jkHMm+LMV
	5Y7CKywd3e1nkzyhRzoaeh6KzRapfkgn1+Qg3Gyy6MexCeqL5hh6dANRbmBtFj2hXmrrq3W+7JyKx
	yuCtSO1b6VEX++6iJSaDKocKu4n4NTBS5Me5OsbVnVmyyi9cf2fI/hNT8BBqwmDbCS6JTORMTLLML
	/YjG05KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURYo-0000000DOe5-30ue;
	Tue, 02 Jun 2026 16:01:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURYn-0000000DOd6-2k62
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 02 Jun 2026 16:01:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9cHo+HdLfWszrxz8FIlQUKjxLUJPM3VQU+KKIaZgzs8=; b=WkZmPd8AMlpWnKmDUOMeNyywdQ
	7m/6L458TOSrG/rihpzwMud68cn3PfTembWB4TFKYxHm/eoalL4lnmB24oIDqRMXOfgPAOa2any6l
	EELsgWR+lj6zws523hksISNtBH9xJ3PJI0vhGRwsQmbghSewK7+rSjPBVZnGkX5LP5jv+RAmE48IN
	DO0ZE4pPrc0pSqucKD8RBBPjxlP3+8DW+96+1ku/cK4fwfsj0GEqSfd2fV+qg0ANYjXNPpPIiYcwB
	Ha9GDRhO7oJvaXTBnGnPPPEJ9PpFmQc2ad/ZjA905xSWeFZHo9RxbDEuLA9WdvlkmBxJU/r2tOKo4
	Mh8xF0pA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wURYj-00000009sh2-0EhQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 16:01:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652DFQwX2884626
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Jun 2026 16:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9cHo+HdLfWszrxz8FIlQUKjxLUJPM3VQU+KKIaZgzs8=; b=ecnlHgn9Mot6/zjN
	P/Lx9gAlO0F9M5Kvyys6oergtAHmwf0hlMC/HPcSzcdCKheQFuMK71KnDqiEfI6d
	5DuV7b0zGAXkDtD0/6wRkIGlOG8vdpY1uGDoEFEJvHDgGS+ngjGxhXHUgNGDWR6P
	Kf6+Dd9zji1rcznj+z9+EsUrpcQjEOQCG6S1KCXE4dAVYno1cVJaVyS50SCiAfsZ
	N+MnBRBijUy66CdEy25rXcteN97sWzBHdf4Vfy0sJM8USRWa87SQh8KkM1oUao5f
	N20FQe41eDuQq2kAxYpSFuIFIdeycxrJsFbAwIysRq/6PKFwZRZrLr5Q/BKl/f69
	oKE2Hw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsu12b49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 16:01:37 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6e9280ea589so165521137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 09:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780416097; x=1781020897; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9cHo+HdLfWszrxz8FIlQUKjxLUJPM3VQU+KKIaZgzs8=;
        b=dfRjfaVdGctoY0Wb0t2iFMPxa2leu7xgisKQdb0t7fSQEf7a0V9+OyYY67kNqbcvt5
         TjSfphznNtQs6IPU+NW980tHZzJEUDfRi/2A38d4t79cBY9CfFAQod/wQ/zV4Q3X0Smz
         G6PX0z23QKGIQT6V9vTao861B9TaMtxLHEC26RIGOmBz0tgTp3yN39vVIE1DYxXWe46O
         8bZ+T84hI0hkc3M3P/TWwp5kEWt1do14UtnufiasybZKbxy0sEo68obfSywhOXmxMtrJ
         tyW9e5JoJ9TpqWc829sejKAe/3V7kUO2g4GSAOjzXW9922CaXn7JCH77DgmiiSSIZUXE
         pKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780416097; x=1781020897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9cHo+HdLfWszrxz8FIlQUKjxLUJPM3VQU+KKIaZgzs8=;
        b=UZv39d1q3/0W30O+rRQIxG23/ZGGAYiDnkqhXflMmuVx7Q6wELuJljYCejFbrF0wqB
         e1dYWwPbTeqNKmtit38R9x5tCfbeP4csd5+35nEOVaZlq5rzb23TwjBSt4SdAP9pgTR2
         SSQ8he1XP95tum1adbS/Ni7bF+E7T1RiVIolujYLTejtpJFMGZ3Hl+vzMeFDY/x8rLRC
         CwLJRbF1gASaPvBRgzc79BrYMZvDgm1LoycbLqlNcOnyAhYrsu5tCSTGpYFZEAdgLuVq
         jCVQjg0qeoXf+kBYAV2yULwB7YTbEKY3u/CwBTqj64JR7HxG80vY4GKoRz/+DJnfnGYr
         Nh/A==
X-Forwarded-Encrypted: i=1; AFNElJ8uSzQ9Z4OkfyzlJ1FPPJSzYCf4k+rbUV3NffSMQoe8T3RrpM+QyvBAcYVQNTs7sjnzFQeVo7CkmCZPdFxyrCRJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzSls49x3SPS5fClUfj1uKduuIucfMqfqekb0P7RPl+aODQJsOV
	Lxc5RODdR3DFxf3I8Gh+Sv0hou9gqi2CsMUZKNSZaYFwqXGcGXEnWxZV03IsgoQR/w96LXtePq8
	NO0eBiq0opiVLACoB1Vcn+vamRhbaurXU1nGIEcujuG9xRR2INPL1ADB0nVy4LvjG9fLbcnipFd
	cZuQ==
X-Gm-Gg: Acq92OGyOUdarZ4XB+Z2RKWD7DNFtzmvzYHy5BRoYFMdGqcRiitgHiJyToFa8a+IwKM
	1LTkygJmrBl/vnXhVlqTMmwxTSpbpAvFkLpHoJ23d5Upw+SkpMeJJvRv3O1vuXIHy8xgZCqc7TS
	k1aq7RvFfLQrOIyhJ/5csGXKWpNqaYkG8aQhcksN51L2xt+zjB5wFvc4tiI92rBQbv8FcpzbmSd
	+n/gIP6fJQcSQeo8TLkBM7PK+uMPvH88x4NcWjgM2TgCmNfiLvt/gjuRL5+bdMsINNVqFlvz/8y
	JtYsETBEov73dILA2ejFl5fq67QzEBQkZkwTbEy9MvnVJ74mkBigx1e/BCb9hCpf6+Ho3WmrUub
	YqUyohYUwcpS/JjXCOTUtA47QfuIunAPATRDVMFF5HOHpbBjfGJ8X9/przrbAcdZHK6hxxStG/r
	f9
X-Received: by 2002:a05:6102:a49:b0:639:4bb7:c916 with SMTP id ada2fe7eead31-6ea1cc674f6mr506770137.3.1780416088627;
        Tue, 02 Jun 2026 09:01:28 -0700 (PDT)
X-Received: by 2002:a05:6102:a49:b0:639:4bb7:c916 with SMTP id ada2fe7eead31-6ea1cc674f6mr505747137.3.1780416079609;
        Tue, 02 Jun 2026 09:01:19 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d40sm199325f8f.26.2026.06.02.09.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 09:01:18 -0700 (PDT)
Message-ID: <9adbe3cb-d42e-4b89-b6d7-62dd58b98e15@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 18:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] thermal: amlogic: add missing dependency on MESON_SM
To: linux-kernel-dev@aliel.fr, Neil Armstrong <neil.armstrong@linaro.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        kernel test robot <lkp@intel.com>
References: <20260602-fix-missing-meson_sm-symbol-v3-1-6f7f69cd7d6c@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260602-fix-missing-meson_sm-symbol-v3-1-6f7f69cd7d6c@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: K7kHzWi6caGyIswXyYMcJ-KBfoL9r9Oi
X-Proofpoint-GUID: K7kHzWi6caGyIswXyYMcJ-KBfoL9r9Oi
X-Authority-Analysis: v=2.4 cv=MKFQXsZl c=1 sm=1 tr=0 ts=6a1efe61 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=tv4TSO8pNUtKKAd5OgUA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE1NSBTYWx0ZWRfX61ucQnEHkZi2
 /QGyaKgqXFxsN8LRCHpHWewSBSrAhYVVHtLtN237hGiqODhSckNEshLLXOeNH6DYm8AV6OCvshA
 lZXtQ56B4mV194D1T8ZMhy1U+tfhwBA8FuQhcV1VkjiRWFLF9Pg8a1XtC13Zoqtbyi7PQG7hdyH
 wnnGcs7t55usVedWup7SE7ROGb3wqVKS+XH6mgBMJ721YbDla/QEwKTERX4kc3DGwF55dJOjW3M
 nzX2l34vK/uet2bRBStqRSb+6bjIkxcjFF3Dk2lAX7S74OER5yovysZHpPwNDmltrV0M+CGinYv
 bkKfB57H+RWqaDCKM0hQ1ATUa1IF7iNU4JPvbiKBU8Bbgw8nh9CWJHZwBIynElWHNTZL4jdy3AO
 blKlzSDfqHRnN6WF0eITGqR+XAHpfCPBPzug1rrISkj6EqYxak1mhGqNQODTRkNW5CZeBgzCmIj
 jKVkrdyRUlzOzhgA8Ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_170141_380569_59A42594 
X-CRM114-Status: GOOD (  21.73  )
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

On 6/2/26 16:19, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> The amlogic thermal driver calls meson_sm_get() and
> meson_sm_get_thermal_calib() which are exported by the meson_sm
> driver. Without CONFIG_MESON_SM enabled, the build fails with
> undefined references to these symbols.
> 
> Add a proper Kconfig dependency on MESON_SM instead of relying on
> stub functions, which makes the dependency explicit and prevents
> invalid configurations.
> 
> Closes: https://lore.kernel.org/oe-kbuild-all/202605291530.en7aGn7w-lkp@intel.com/
> Reported-by: Mark Brown <broonie@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
> Changes in v3:
> - Add a dependency on MESON_SM instead of stub functions.
> - Link to v2: https://lore.kernel.org/r/20260531-fix-missing-meson_sm-symbol-v2-1-1def8c3c169f@aliel.fr
> 
> Changes in v2:
> - Replace #ifdef CONFIG_MESON_SM by #if IS_ENABLED(CONFIG_MESON_SM)
>    to cover builtin and module in config.
> - Add missing trailers for kernel test robot.
> - Link to v1: https://lore.kernel.org/r/20260530-fix-missing-meson_sm-symbol-v1-1-3fb672b989d4@aliel.fr
> ---
>   drivers/thermal/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index 1c4a5cd5a23ee..810eeccedfbab 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -436,6 +436,7 @@ config AMLOGIC_THERMAL
>   	tristate "Amlogic Thermal Support"
>   	default ARCH_MESON
>   	depends on OF && ARCH_MESON
> +	depends on MESON_SM
>   	help
>   	  If you say yes here you get support for Amlogic Thermal
>   	  for G12 SoC Family.

Did you forget to remove the stubs ?


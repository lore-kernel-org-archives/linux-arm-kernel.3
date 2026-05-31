Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEFFCD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 08:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSSHczkNGcyBGltE9n3/Qlzx5H59gm8hjXNQO9LCZb8=; b=GJuNS8ZJwIuYO965vdC/izXjC9
	Li7tbK2KnuyLgknz4JfQ901CUCU0R1QqT0GdBT5UmIR5OvLbgOKKHTgSqDtAB2USUnaFIIHNWAR9e
	GV5h8WNyv6fkkv0LLEIwedWYK9SXcrBTNMt9PtRjC2J+kjPA6gRkfm6YGMLEOsj4Y5StgLFboY+4x
	jCzSdPKxKAY5LIspcpWGJnYqaxAWaQX1TJ0uc4GZ2IF+oYv6hoc6V1j1m/HwKsT1EqpB8HXlJ7SI6
	204YMJAII3T9cbm2gkvdEht0qLwUAvXZPlVPhqXlX/iJT6lzu08gvoxbanh6YCtWcTldAhjc3RgHh
	6Th5IVQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTbjx-00000009O1l-3hxn;
	Sun, 31 May 2026 08:41:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTbju-00000009O0s-1kbm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 08:41:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V4txQv3498164
	for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 08:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LSSHczkNGcyBGltE9n3/Qlzx5H59gm8hjXNQO9LCZb8=; b=cZ4EEOxo0R0xP1cU
	uqEA0gxK3qJB1dGa68+Nwb6j4ak5fuDQlS+mSQwNHLxzaWQugt7N/jSHX7xGjQHU
	/Wx7Biv29sb+3uEqCwmeL/3HlvBvd7Ez9cXTqGkIyr7H9GzeA1vrscAzIxVlcQTz
	QKPhnJiszl/4ncCOB0uKTz2mvSS+s8D1QTjL7TCYZe373Pf2EweWbOmho5rKUzlt
	iWmuHqsHfVwtdjZmdEqtxeCeGfm1drRIff/3atjIOM84xaQftodrJRA190q8/nup
	ezmg/o/mi5XtNKReiCHe7kjKMgR/E4o7FGHPRtGaqMmCHaIuIHdyZEd592EaJDY+
	2CMboQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr41b78p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 08:41:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516da5a1db4so181621191cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 01:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780216904; x=1780821704; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LSSHczkNGcyBGltE9n3/Qlzx5H59gm8hjXNQO9LCZb8=;
        b=CRPqd0ty7tbpn7jMBx9cDMNVAoIvgkcIetyxscXDCsuKMtWwC7CF4qC+DDQ3gH6Pbz
         iCKp9XkNYZQCenNoIjq/OGxh5NYd2PPEEXR/NyfGxbjmai2ly5JE5UdDmAhvX7LhZEEy
         uRjPn9Gb708WbsV7RghKmODZNQc5xFhFHQWUzKzluaSuKpUmw2D7mFm01CuIe8dOp4g0
         IS5QdmtnmuuVoa6ske/ue03tdpvas1Isya4exUz4j8YZ00KJZJC0wPHWDg1cWNS3eUTZ
         1uLSJ0TSYCI6h5gWXNqA9R2vf+FWQfh/jZs9oMBJCJAdrznqbGCZJZ4yEN6jXYw6nQz4
         Z9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780216904; x=1780821704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSSHczkNGcyBGltE9n3/Qlzx5H59gm8hjXNQO9LCZb8=;
        b=dL346qddzdzoAW9WMbEp+yKPvSm3GIU/YYqgf7lgShWqp/H1zIhVEzn5c0XehKlVqB
         xT+gM09oRAlVwKSWk3Ecr4oVLX7Rq3JQ1EQWXl6frJj3r9XQwt8ITAWyJB9nR5HD/3Bf
         IBOLkZ2NgHT2JwQaaMVXA+36Ce5FzWya6Bq6kGLjGWZdiv7HW0VoeyIxJMIYsAPee/rG
         aHnmcPEoZkSZBwGidwJtmKSz+Ypxy1qJP5+c/H7nMAb036xXFrumbaOj9M3R/r0ObXrg
         HOupGZE+G4F/sdtmIdFRv7EGZXRTCQVVk5dCifMR8C8x56cQ5rW27N1mFs+fFd8F2xCF
         +lLw==
X-Forwarded-Encrypted: i=1; AFNElJ+I77UdMkE4r5xJlrZ26APGO+ozh3E9Tst2ck2ZcYHZKCwh870OEcHwnMq8VQZOC2RnlM4yYtDaQ/yb6v8PqnW/@lists.infradead.org
X-Gm-Message-State: AOJu0YxROaTzaVWjhb5DM2H7CNIuU+o1rS9vhqlWZLjtbPWaZe/YYIsQ
	yMa36a5vEEnm8qYX3lfAsajl7LrzmCCUBciwvzT1LUryv1U6CpSqJMNohOR7eRl7izcXKeCEwdj
	1qwLdA7YzuB+Tg+6oIPAhogobM6h5nwW708xKXRITFijqzb+40cJ+YBpGISfzkV+3xszD7oGJwQ
	AkZtmxGeiEa/sc
X-Gm-Gg: Acq92OHqjp9lGdKFIaWGtwZGvp/UWqZ7dK9M0YAQRWOibUWeKE0o5eRy3GIWUVb6HW6
	LePzssB9DGTq6sFXceFF44cH3qr11AnYLZCAO/VbJzsVU/UsEnDjzZtZgWFHogadw9IGkSzC74/
	/vn08OipwC92xprcIRX+KdVXj/KEWi2847k7oBSeICrQGuMJ4/DWvGZUAN44N7Xlu7cxD1VDpu4
	/ypGjb6+LCagj7MbMLzzv6FLyHuUtUQk6XzvyBiuFA6AfsbZYx6syHvpI/mOg8FAOi11SlQEoyg
	a+LbpEMETAZiIOu2sI3bsJp+vacHGGevBOroie50Kiyhp2E+Pe6vEACNx5a/MCLjyrjT2ftbtfC
	o/M4AuOg4zDOzsuUEpcfv2p6b7p/giqb+PqDNy3erR4pMyPj0shjS8nQJDZpI1Gf+xk+KzSFZFY
	5G
X-Received: by 2002:a05:622a:4d43:b0:516:e031:9321 with SMTP id d75a77b69052e-5173a6ce03amr101633751cf.11.1780216903599;
        Sun, 31 May 2026 01:41:43 -0700 (PDT)
X-Received: by 2002:a05:622a:4d43:b0:516:e031:9321 with SMTP id d75a77b69052e-5173a6ce03amr101633501cf.11.1780216903167;
        Sun, 31 May 2026 01:41:43 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cabfd6esm166065495e9.15.2026.05.31.01.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 01:41:42 -0700 (PDT)
Message-ID: <8c11a91b-cfbf-4b9c-a46f-907989bf8305@oss.qualcomm.com>
Date: Sun, 31 May 2026 10:41:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: meson: sm: add stub functions when
 CONFIG_MESON_SM is disabled
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
References: <20260531-fix-missing-meson_sm-symbol-v2-1-1def8c3c169f@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260531-fix-missing-meson_sm-symbol-v2-1-1def8c3c169f@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fOEJG5ae c=1 sm=1 tr=0 ts=6a1bf448 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=QjikovrxREX5USwBPxUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: BBpLTENF2GeEjnt3cBaofZJsJ5oeBehm
X-Proofpoint-GUID: BBpLTENF2GeEjnt3cBaofZJsJ5oeBehm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDA5NSBTYWx0ZWRfX0HB7puSHZYI5
 MZmHhC6weNwqDs92QbtLWNB+g1SPfRpKCJBQjEeLtdK9LP8hCHUbLIhdPJhK8fdeHugwDMIL5GH
 4Y+QBULOx5q65b6yoaP7PF+pj+kKGxRKKNP0WkQaPXOFqM99QiUL+pBDnFDcDxU164yrq1pymfl
 tqtn63EbsEztnsp8r6cMTHKanXZklNTZz8wCLKadL+TMh2JiiAy2NGpmNz/eEzJGdie9tbZQS5V
 1vNh93R4b7IDNLQRuDQftV9UcEjZD8Fl3LlqSYy3UoENBP26sK0y9toXRST7iobnv8gdHX7z35p
 SZ8Yd5YN6hg88ToWGdAmV1XhN8swR4kfODdR1hXbcXjRE16Z3hvkB2V/Q7pzvR5ssLg65y4EWye
 nahniCA3wMLTDlxvzDLcvst6g9+0YihQZ2jnlIQtldhEgOhPAerqZ0ZSVv01k3X+9fxtXwJnMmQ
 5/gmEMCC2BA/vwZGxsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_014146_510030_7C7C89C1 
X-CRM114-Status: GOOD (  18.88  )
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

On 5/31/26 09:51, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>
> After merging the thermal tree, linux-next build (arm_multi_v7
> defconfig) failed like this:
>
> arm-linux-gnueabihf-ld: drivers/thermal/amlogic_thermal.o: in function `amlogic_thermal_probe_sm':
> /tmp/next/build/drivers/thermal/amlogic_thermal.c:196:(.text+0x2f4): undefined reference to `meson_sm_get'
> arm-linux-gnueabihf-ld: /tmp/next/build/drivers/thermal/amlogic_thermal.c:205:(.text+0x320): undefined reference to `meson_sm_get_thermal_calib'
>
> Add inline stub implementations of meson_sm_get() and
> meson_sm_get_thermal_calib() behind an #else guard so that drivers
> including this header can be compiled without CONFIG_MESON_SM .
>
> Fixes: b21d88de6918 ("thermal/drivers/amlogic: Add support for secure monitor calibration readout")
> Closes: https://lore.kernel.org/oe-kbuild-all/202605291530.en7aGn7w-lkp@intel.com/
> Reported-by: Mark Brown <broonie@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
> Changes in v2:
> - Replace #ifdef CONFIG_MESON_SM by #if IS_ENABLED(CONFIG_MESON_SM)
>    to cover builtin and module in config.
> - Add missing trailers for kernel test robot.
> - Link to v1: https://lore.kernel.org/r/20260530-fix-missing-meson_sm-symbol-v1-1-3fb672b989d4@aliel.fr
> ---
>   include/linux/firmware/meson/meson_sm.h | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
> index 3ebc2bd9a9760..baecdaf263f41 100644
> --- a/include/linux/firmware/meson/meson_sm.h
> +++ b/include/linux/firmware/meson/meson_sm.h
> @@ -27,8 +27,25 @@ int meson_sm_call_write(struct meson_sm_firmware *fw, void *buffer,
>   int meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,
>   		       unsigned int bsize, unsigned int cmd_index, u32 arg0,
>   		       u32 arg1, u32 arg2, u32 arg3, u32 arg4);
> +
> +#if IS_ENABLED(CONFIG_MESON_SM)
> +
>   struct meson_sm_firmware *meson_sm_get(struct device_node *firmware_node);
>   int meson_sm_get_thermal_calib(struct meson_sm_firmware *fw, u32 *trim_info,
>   			       u32 tsensor_id);

Do you really want to compile meson_sm as a module ?





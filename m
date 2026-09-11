Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0A8C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKTp/IY773F08+8E7J5pPWPMUyIPEHKU71ocxCPr7kk=; b=WoAwBZcfHGHEXTYorFYx3hk1rI
	UJDtam+ztZQCk9SXvkjU/MzxjftPhj8QIszIJOlhMRlHOm1FYf0yhm0Kt04qGaWQi2hfQF/sLFG1y
	DAOEd8hpfnBE/R70h+pTdjgIigvp/7EY/w5I+wG1Cu2ct/tFGLdFk+uhrN9h9FyX3K1UCi+2nP6jC
	jv7X3wYCe39VhwluaKiDx3wb0QzKkTr1noKzBG78KE5l/vk6ONKXwvgr57UNpxffdE29Rrr3X3uM1
	Tw+uOHyPctelXC3BHFlYFx82IyLoeaJzKbPPmfcuDLdjjTvgyhbYjCU8pkOcOA/vCLG/+2ezj4Mba
	lxSF1w7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5138-0000000GiZ3-1hLg;
	Fri, 11 Sep 2026 13:12:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5135-0000000GiY7-1Slq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:12:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCisoe2978648
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 13:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HKTp/IY773F08+8E7J5pPWPMUyIPEHKU71ocxCPr7kk=; b=Aygt6tov0zoV4PFB
	FAbT8kqQ/RutqTQC0/lfRLFw+v8RdgLqZC8/63EymNz6hn8FlE3bR6yFILsbc8EJ
	FWoL+sVcsprZcqbpWqI9PPtpMvAtUwaY3RvBp36Huws/dtZPT2F1B6qS3MzDlyTX
	C7QzN34cBF9DwSwUC3NCDGD330JWcCm8V8Pl6yQBqbMiZ1JE8tUUj5znVhZGtRyc
	ZKweO0WKA0tsHNGRsHtIpns7i7BV02yIHGVOtMA9Eh4Bre+a4+4tmEDdQtBUotah
	7YZviFK9J4PVkgDyXko5PUKSNxICkp6RizRgCr/XTef86zeMfrZI1QagWJBYJC1y
	54igwQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7ucjm42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 13:12:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso1252630a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789132330; cv=none;
        d=google.com; s=arc-20260327;
        b=Oi1BX3wYh3/jHubRfuv7XGnBRdfSRQUuFX3TrMXTXi6EYi0x44X5SoHlSsEk8SSQGA
         jq/n98SRF8oUaAl2eaeUVAXGlYJLVh01IbvN1K8DzJBnz7D5azLAwANB/ZMoFTqr+BKA
         WekTFVDjy3wKf+uqwSEADIC5PzHmLStg2IvtPEYmdSGqCKmTDZQ1LoOoP+nkcHmXEpT9
         5OuBu1IrVRijkCYo56gVaSJYUMR4cm8TBY8dXmxzlqP8BO0JpCt0lSgvuT031ev+ITdP
         vroc0qIoYnOZyvxThw5Hh3HbxwhMs40a2xi1qrcUjSlpaz0cTDeQ9sqIPp6kLYUqU8RK
         mWpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HKTp/IY773F08+8E7J5pPWPMUyIPEHKU71ocxCPr7kk=;
        fh=U9OfGKgBklxjYngINMKfTokViF7QycjqF7fneOuDy+Q=;
        b=V7fcJ/IeW2q4bEaSYVAAIkpbPqnXeNu8ZDHZuXjrurC0C+X1pnyBk7ZB8pzrTlAwCk
         Begln4tNfbTKcymIpSsuscMQVGOnSWSNIna/8BHcbzVJuXPeoP8DkG4XF2/TPe8C5mA7
         KJuB2e2fE+wS/uRtACQEimrQ+hFWgfViQYp/5kCnIEl29Ivm5db4dunhe1ipecAT7oYg
         /shOOWho8V1VlSwCG0/j9sixvj5UEeiEQLzjhOZOzzXtSYsRVSA4F9hIDIQjFdXs1ah8
         AJRnRUR9RGNUXknA3kUUBQxjhydxYS3/dxFRtNft2+Zm+n+1+HjJeyD4cfmJPe7bkCly
         xJXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789132330; x=1789737130; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HKTp/IY773F08+8E7J5pPWPMUyIPEHKU71ocxCPr7kk=;
        b=CFVKE3b+/Q4QHwQp8wDQcexhMMknyiVHEca01/R/rUPO3C1RwdzYrhZeA3Z2d8uXNy
         7WLGXNMyBzVUYborsqoUDRe7rD5jcQPa+QIcMCTPvYVF6ju+txv/NtWQvQH++dq5zkLg
         BCweNnUrmBc1Meyy1Qc2P5rk5VYDHXQebaK2ImlB8zJDErakGN3g2cuMyzskKatq76nm
         m2y/+/7rnBWs5GJDlsDKPdwH/swoVFqgNDtJv16+tVc2Ipr+A1Qn1QM4b3UwSSiW+VgI
         C/H/adm56/EnCUuk/Z5dKaX5xkXAHWbOHl7ySw7KzTdTX/8FdlB8f3AVX31QdHGX1Qj+
         tZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132330; x=1789737130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKTp/IY773F08+8E7J5pPWPMUyIPEHKU71ocxCPr7kk=;
        b=fHDLyXE3c9/HOZImZpWjRrYLqlbQ4Pnbr20YFzHmgk47OXqRfXSt0cN6LV8jv2a8Fw
         phbLxr3c3maPT02GtesYp7VbcSuexYAzeVTG+SdC1w9BKaYUi5PEfNcWVWpxhnE/lNdJ
         LfXcLQoodoXbIqbyBzNz9QWSoVer2dnkjPmmcRUniiPOIBiFOqwbmz/K53f52gcYj8C5
         ytFp5ZAAk6UZW3vS0tCxHL8M/9dWKIOd3H9T4urpMlfIn3zoYGfF3fT/8EPfXItseqpS
         wS2jKZeR9+nGf+AxLm4QBKwDP2KyFTFIt8lyJvoWXQvxS/AYLURU7oLH8V2LRMYeuo3X
         ILLg==
X-Forwarded-Encrypted: i=1; AKwUvByr07InsWSX01+9Yb++Pgpl4J5Zq9Tudt4hsbZjyoKh4a0LAfwVHkCcmQ/KiWTzJ+ar88qF+uCPtAXbOe//6+M9@lists.infradead.org
X-Gm-Message-State: AFuF++lM8BRmGH94sXuGtQW/9XQgemDQXrtmeJj1/kAOimA4qn88s76M
	4Sq0tmIDkXNK8AF/XpXL4TEejFfxHdBT6jRfy1OgQ8XcB9Ugce7et5ma+YjKrPhh0ikqZRZG4o8
	UZuRmXzoQ2IfRWyjkx2iUxfIaFV96W4zTgNMoZ1dFkNfZ8o38TX7TFGAM8b3wksxjQLkwKPaV4n
	vKEFgxqSMNEkdzgqSiVnAFJlG2qf0EoI3/jbwparGO9BBz0kv1UiRY
X-Gm-Gg: AYBFou1TCnJcoPCdlr1SoSQcx4ErcPxlO8OSpNOGmr7rFuTZnh3GBklukiIG0ZtT/oZ
	fYo38w2ezwENvuOeZGV8yzUN3WnpukH/giUjkHux9Ub1s9TDgjtpBLixJZv0HHJc7VrMoP5f6oE
	9bZQ7tDTCBJWUn6pmPUdDi2RHOxT/rb3gTjlxf3uuR/96ghzEjUWn6MeTfUw==
X-Received: by 2002:a05:6a21:a96:b0:3d3:aec2:4dcd with SMTP id adf61e73a8af0-3daed3f8e55mr8023534637.25.1789132329927;
        Fri, 11 Sep 2026 06:12:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:a96:b0:3d3:aec2:4dcd with SMTP id
 adf61e73a8af0-3daed3f8e55mr8023476637.25.1789132329455; Fri, 11 Sep 2026
 06:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com>
In-Reply-To: <20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 15:11:57 +0200
X-Gm-Features: AcwNN1UZPZAmOQ3htDsLJexxGkB7aiDXDXlLaVZbjwo9vpFFVATaLlk8aAB5hoE
Message-ID: <CAPx+jO8D4jHwGpPrGng2dL6Ng8pU2qqRMRzxX0gh_SPLfDKWog@mail.gmail.com>
Subject: Re: [PATCH] coresight: handle runtime PM resume failures
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa3fe2a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=gBcF6orTRoxn-YdRBJsA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4NCBTYWx0ZWRfXwgCzYrR9aP0X
 W2AN7EpWzINsaIcvTYHyXMBq88yU/9f4yEf+eLIusOEsJKJHKLAczSk525KHXwDfwC0J8nwRVQ1
 cR27lzmb5GE8Tf1vdkVVDUGEVvG7+p4uXsnGvD6gvLJl2NEDf4FUwLX8isbJkDyXU9s9NMwmoIL
 +fbpbCY/slF1ueSBjVx7B3VlpBvTW7CTHWKTU/at39ppD/dhw7+YBHsoTUflYyLRVnQeyArXyQv
 n2CwCeR8/dXV9ShIqBdRQPoQ8rte0aefzOiL0tJSo3LEYmUCfLKBXxaZBy6/FLYvYsj1vyggaGY
 KAPkJbzzCyaSl9BScUxf/nm4PFlGRZTVDLjDXPz0UtvDcFaiZ8q6xpYD2fbmXerHjU2N1++9TQV
 MnYRGgJ1vpEheGRDLomkay6sKektLs7WH1WA9RdJY7mQrbz4gAZAEdyS+UGFQmObKWxlhgvkhVX
 hBOt9PAQO4fG0Dd6RfQ==
X-Proofpoint-GUID: IswmchyjWpNJZusDFMahGqWOcagXJ_b8
X-Proofpoint-ORIG-GUID: IswmchyjWpNJZusDFMahGqWOcagXJ_b8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4NCBTYWx0ZWRfX68zd0APAJjRR
 GkWYvAKX63YLx3D3ldKScKpv6QdFAmNJSAYP9E2AlC/qq1cE/PkA3xYzYWbSUVMvHBA9RY89yDk
 v1vVzi/n/pW2X1LmkVDtwib6VwHDkTY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_061211_399908_87A0AED5 
X-CRM114-Status: GOOD (  31.89  )
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

On Fri, Sep 11, 2026 at 12:29=E2=80=AFPM Yuanfang Zhang
<yuanfang.zhang@oss.qualcomm.com> wrote:
>
> When a CoreSight component's parent power domain, such as a CPU cluster
> genpd, fails to power on, runtime resume returns a negative error. Severa=
l
> call sites ignored that error and continued to access registers on an
> unpowered device, risking an external abort.
>
> Replace the remaining pm_runtime_get_sync() calls with
> pm_runtime_resume_and_get(), which restores the runtime PM usage count
> when resume fails. Abort before accessing hardware and propagate the
> error to the caller.
>
> In coresight_get_ref(), unwind the module and device references. In
> debug_enable_func(), roll back the CPUs that resumed successfully before
> the failure. Finally, release the mode acquired by stm_enable() if its
> runtime resume fails.
>
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>

Feel free to add:

Reviewed-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
> This patch converts the remaining CoreSight pm_runtime_get_sync() users
> to pm_runtime_resume_and_get(), propagates resume failures before
> hardware access, and completes the related module, device, CPU and mode
> unwind paths.
> ---
>  drivers/hwtracing/coresight/coresight-core.c        | 13 ++++++++++---
>  drivers/hwtracing/coresight/coresight-cpu-debug.c   | 10 +++++-----
>  drivers/hwtracing/coresight/coresight-cti-sysfs.c   | 10 ++++++++--
>  drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 10 ++++++++--
>  drivers/hwtracing/coresight/coresight-etm4x-sysfs.c |  5 ++++-
>  drivers/hwtracing/coresight/coresight-funnel.c      |  5 ++++-
>  drivers/hwtracing/coresight/coresight-stm.c         |  7 ++++++-
>  drivers/hwtracing/coresight/coresight-sysfs.c       | 11 +++++++++--
>  8 files changed, 54 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtra=
cing/coresight/coresight-core.c
> index 928488a216d4eafa3cdb5f882ae5f44ddaff0448..ff93a017dbe22b01236ac2e50=
21da9b82890e72c 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -822,14 +822,16 @@ struct coresight_device *coresight_get_sink_by_id(u=
32 id)
>   *
>   * @csdev: The coresight device to get a reference on.
>   *
> - * Return true in successful case and power up the device.
> - * Return false when failed to get reference of module.
> + * Return true on success and power up the device.
> + * Return false if a reference cannot be obtained or the device cannot b=
e
> + * powered up.
>   */
>  static bool coresight_get_ref(struct coresight_device *csdev)
>  {
>         struct device *dev =3D &csdev->dev;
>         struct device *parent =3D csdev->dev.parent;
>         struct device_driver *drv;
> +       int ret;
>
>         /* Make sure csdev can't go away */
>         get_device(dev);
> @@ -843,9 +845,14 @@ static bool coresight_get_ref(struct coresight_devic=
e *csdev)
>                 goto err_module;
>
>         /* Make sure the device is powered on */
> -       pm_runtime_get_sync(parent);
> +       ret =3D pm_runtime_resume_and_get(parent);
> +       if (ret < 0)
> +               goto err_pm;
> +
>         return true;
>
> +err_pm:
> +       module_put(drv->owner);
>  err_module:
>         put_device(parent);
>         put_device(dev);
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/=
hwtracing/coresight/coresight-cpu-debug.c
> index 3a806c1d50eafb4249ab516ef846e437831b9681..39602d610e5b22ec4f165dbb1=
26a7c06aea08eb0 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -429,19 +429,19 @@ static int debug_enable_func(void)
>                 if (!drvdata)
>                         continue;
>
> -               ret =3D pm_runtime_get_sync(drvdata->dev);
> +               ret =3D pm_runtime_resume_and_get(drvdata->dev);
>                 if (ret < 0)
>                         goto err;
> -               else
> -                       cpumask_set_cpu(cpu, &mask);
> +
> +               cpumask_set_cpu(cpu, &mask);
>         }
>
>         return 0;
>
>  err:
>         /*
> -        * If pm_runtime_get_sync() has failed, need rollback on
> -        * all the other CPUs that have been enabled before that.
> +        * If runtime resume has failed, roll back all the other CPUs
> +        * that have been enabled before that.
>          */
>         for_each_cpu(cpu, &mask) {
>                 drvdata =3D per_cpu(debug_drvdata, cpu);
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/=
hwtracing/coresight/coresight-cti-sysfs.c
> index 3fe2c916d228808233ef19e9213a0cc0ce3cf297..6886b8713368058b9cf33ab7f=
afb5f87e23c1ec9 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -167,8 +167,11 @@ static ssize_t coresight_cti_reg_show(struct device =
*dev,
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct cs_off_attribute *cti_attr =3D container_of(attr, struct c=
s_off_attribute, attr);
>         u32 val =3D 0;
> +       int ret;
>
> -       pm_runtime_get_sync(dev->parent);
> +       ret =3D pm_runtime_resume_and_get(dev->parent);
> +       if (ret < 0)
> +               return ret;
>
>         scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
>                 val =3D cti_read_single_reg(drvdata, cti_attr->off);
> @@ -185,11 +188,14 @@ static __maybe_unused ssize_t coresight_cti_reg_sto=
re(struct device *dev,
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct cs_off_attribute *cti_attr =3D container_of(attr, struct c=
s_off_attribute, attr);
>         unsigned long val =3D 0;
> +       int ret;
>
>         if (kstrtoul(buf, 0, &val))
>                 return -EINVAL;
>
> -       pm_runtime_get_sync(dev->parent);
> +       ret =3D pm_runtime_resume_and_get(dev->parent);
> +       if (ret < 0)
> +               return ret;
>
>         scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
>                 cti_write_single_reg(drvdata, cti_attr->off, val);
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/driver=
s/hwtracing/coresight/coresight-etm3x-sysfs.c
> index b3c67e96a82a4995515457d1ac0a5b183b162f0f..b34e282ec4a5f37f7de1d2ff1=
18042b47368acd7 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> @@ -47,8 +47,11 @@ static ssize_t etmsr_show(struct device *dev,
>  {
>         unsigned long flags, val;
>         struct etm_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> +       int ret;
>
> -       pm_runtime_get_sync(dev->parent);
> +       ret =3D pm_runtime_resume_and_get(dev->parent);
> +       if (ret < 0)
> +               return ret;
>         spin_lock_irqsave(&drvdata->spinlock, flags);
>         CS_UNLOCK(drvdata->csa.base);
>
> @@ -933,13 +936,16 @@ static ssize_t seq_curr_state_show(struct device *d=
ev,
>         unsigned long val, flags;
>         struct etm_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct etm_config *config =3D &drvdata->config;
> +       int ret;
>
>         if (!coresight_get_mode(drvdata->csdev)) {
>                 val =3D config->seq_curr_state;
>                 goto out;
>         }
>
> -       pm_runtime_get_sync(dev->parent);
> +       ret =3D pm_runtime_resume_and_get(dev->parent);
> +       if (ret < 0)
> +               return ret;
>         spin_lock_irqsave(&drvdata->spinlock, flags);
>
>         CS_UNLOCK(drvdata->csa.base);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/driver=
s/hwtracing/coresight/coresight-etm4x-sysfs.c
> index cc6cdd3ae29d502a2e67f07400de957b6dc71af6..55e05c20b302d4bf55c4df30c=
9ee6d6a1b5f1031 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -2457,10 +2457,13 @@ static ssize_t coresight_etm4x_reg_show(struct de=
vice *dev,
>  {
>         u32 val, offset;
>         struct etmv4_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> +       int ret;
>
>         offset =3D coresight_etm4x_attr_to_offset(d_attr);
>
> -       pm_runtime_get_sync(dev->parent);
> +       ret =3D pm_runtime_resume_and_get(dev->parent);
> +       if (ret < 0)
> +               return ret;
>         val =3D etmv4_cross_read(drvdata, offset);
>         pm_runtime_put_sync(dev->parent);
>
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwt=
racing/coresight/coresight-funnel.c
> index 0abc11f0690c5272ebd55df9e98544e3b401cfe6..5824a1e4d046a3caf5b32ed1d=
8526b8bd7e9ca76 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -190,9 +190,12 @@ static ssize_t funnel_ctrl_show(struct device *dev,
>                              struct device_attribute *attr, char *buf)
>  {
>         u32 val;
> +       int ret;
>         struct funnel_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>
> -       pm_runtime_get_sync(dev->parent);
> +       ret =3D pm_runtime_resume_and_get(dev->parent);
> +       if (ret < 0)
> +               return ret;
>
>         val =3D get_funnel_ctrl_hw(drvdata);
>
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtrac=
ing/coresight/coresight-stm.c
> index 4e860519a73f6fff640090cf58298b89a31e6359..b9f15990ed994ea827c8e237d=
764e74d8d231ddd 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -196,6 +196,7 @@ static int stm_enable(struct coresight_device *csdev,=
 struct perf_event *event,
>                       __maybe_unused struct coresight_path *path)
>  {
>         struct stm_drvdata *drvdata =3D dev_get_drvdata(csdev->dev.parent=
);
> +       int ret;
>
>         if (mode !=3D CS_MODE_SYSFS)
>                 return -EINVAL;
> @@ -205,7 +206,11 @@ static int stm_enable(struct coresight_device *csdev=
, struct perf_event *event,
>                 return -EBUSY;
>         }
>
> -       pm_runtime_get_sync(csdev->dev.parent);
> +       ret =3D pm_runtime_resume_and_get(csdev->dev.parent);
> +       if (ret < 0) {
> +               coresight_set_mode(csdev, CS_MODE_DISABLED);
> +               return ret;
> +       }
>
>         spin_lock(&drvdata->spinlock);
>         stm_enable_hw(drvdata);
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtr=
acing/coresight/coresight-sysfs.c
> index 4b010f8bc4c08da31b3d295be6c37b6d941629d2..5849dfbd9d0bd3ad10734919f=
78bc39cc968539c 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -17,8 +17,12 @@ ssize_t coresight_simple_show_pair(struct device *_dev=
,
>         struct coresight_device *csdev =3D container_of(_dev, struct core=
sight_device, dev);
>         struct cs_pair_attribute *cs_attr =3D container_of(attr, struct c=
s_pair_attribute, attr);
>         u64 val;
> +       int ret;
> +
> +       ret =3D pm_runtime_resume_and_get(_dev->parent);
> +       if (ret < 0)
> +               return ret;
>
> -       pm_runtime_get_sync(_dev->parent);
>         val =3D csdev_access_relaxed_read_pair(&csdev->access, cs_attr->l=
o_off, cs_attr->hi_off);
>         pm_runtime_put_sync(_dev->parent);
>         return sysfs_emit(buf, "0x%llx\n", val);
> @@ -31,8 +35,11 @@ ssize_t coresight_simple_show32(struct device *_dev,
>         struct coresight_device *csdev =3D container_of(_dev, struct core=
sight_device, dev);
>         struct cs_off_attribute *cs_attr =3D container_of(attr, struct cs=
_off_attribute, attr);
>         u64 val;
> +       int ret;
>
> -       pm_runtime_get_sync(_dev->parent);
> +       ret =3D pm_runtime_resume_and_get(_dev->parent);
> +       if (ret < 0)
> +               return ret;
>         val =3D csdev_access_relaxed_read32(&csdev->access, cs_attr->off)=
;
>         pm_runtime_put_sync(_dev->parent);
>         return sysfs_emit(buf, "0x%llx\n", val);
>
> ---
> base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
> change-id: 20260911-b4-coresight-runtime-pm-failures-70f250927aeb
>
> Best regards,
> --
> Yuanfang Zhang <yuanfang@qti.qualcomm.com>
>
>


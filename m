Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD4DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xypUPvLubQm1/1Qk4UMSCjOCD4eeeEzl0qrPZ2tmTo=; b=3WnEELkW7NEi87alGZAAjcEsIl
	u2DCBJdMmH+ibJq4Ae7EckDCXV3wCXR6NUwJ2njNmRryQzewqS5h1zw3lpE1Xc4e6V0+UZepOjj/R
	542d/7ZWPq+pd4/8Zpw8eJ7HA40yEFur66GU4GZxWkNnvius8j1AN7W7OjxYrgSab80Z2y4Un4zcx
	llbyV0IvWDtNLVTrxbKrhkRumV4wRNf8IQlU+4K7LIH4Lp39EEjYGjkpBdC+K8hyIbtGxQ+z9UiAJ
	z0xcqDrv3c/cBB65p+prfvezIHGiX637RIXsNEjOev6t1n1VNr7Xwb/4mWmCmTVQOFx2Ak9g0abO/
	PbDFTPKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglWv-0000000CwHb-3nAb;
	Mon, 06 Jul 2026 15:46:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglWt-0000000CwGq-0KKE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:46:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFINb762537
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 15:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3xypUPvLubQm1/1Qk4UMSCjOCD4eeeEzl0qrPZ2tmTo=; b=It64YZqdQboZwbgV
	jN2arthvl62bMDnhE3LaDveUv4FdjOFji0EFia5JGs0fMSjyLN8hQ/4AfNqCZnzY
	CEHfOWn9C+rBcm91CytXQeNR69LJiKSd24k8zJZu1GGxV2f6u4O91NFlMkyBLeNH
	oQ0ZR3YzBNUczvmU+fl9MCJx1Nyu3K3jjoAsVp4pjdJpPo2ymhkMvElHIv+yzhrs
	5Bzcd0QC13jknE2hDq8D3aTcSRIb5nZI8TJ2Q0GhWdGCDUsBVH5oStx171awafp6
	DqXyY5gTOruYkbDAHi9zsigc9AaoKkANUgy01W/RFL1sKQUBQvUX+clO5hgCp5c4
	1ZLG2A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxt8qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 15:46:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ee2847cbd4so37986466d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:46:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783352801; cv=none;
        d=google.com; s=arc-20260327;
        b=JfRwMDIFhFcwgd84dwb85CY8NRIz53OBeSpNHBjchxqg/dB5rxsiESdw6dY1LCfKGo
         OTD66FM9tiJSRsAZxBnq7C1KfOBnoWdEGcaEDdyyTy3Ogl4Qmzy4JIwjcLuOrYHdyIMO
         Neh9HKDQ1YrhChazRnCIVKoLg+P779W2U3SsbX2cRS+oeIjg+qsB2cL/wcVZYSCti5Re
         HxyZuXulAzGlttgxRRh+tjc1ryakQSUqugf/+cKpiK+L4sX55fDBihdkECKpH4IRfUzO
         EFDPZSWyyx0qS4OEfGYX8b6eXmI2hAStimOX7Mr30TlpVRGh4L9MktxofsyGIbX/r775
         GJPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3xypUPvLubQm1/1Qk4UMSCjOCD4eeeEzl0qrPZ2tmTo=;
        fh=/uInPQQEYpjgbv21JuOk96VYY4U7XQBYjtjw0ygheX4=;
        b=nh0IQ1XVwYBGxZcnispdegZNVSZKELrgVfASdP4K9uTCJFdmH/A0fscfcEhrUW/kDf
         XQxdwntUl1HzI5n/7uwzgkdmO+uKJnl+74QymwNYMMnk9T7JRJBVsYPJ9zH+qIOu18ez
         jT5YergtmdcC9JEsBTWV6o2vLLBHzxCvMKNoBqknu47mIWpkHIcUKKPQIBAOqzBrl25F
         0pNh+qzhc9b16fQ9IECzPvYfTgntz0FE2hj5jVgoONvpZzqrGmbtVJUOFb0v2UH9gZ/H
         MgR+quiwwHbEhmzL3hM2KbTcFNOv7Ep/LmXw0XASJoyeIEmMVGpkwgwdpdeybHqmhKrl
         5wOg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352801; x=1783957601; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xypUPvLubQm1/1Qk4UMSCjOCD4eeeEzl0qrPZ2tmTo=;
        b=QzcpwCByBwWIwJtxqZRO0aDjtmimeo4kj6ABwQxh80uktnLVPXjFL5aAl2Wloaaopx
         32WuoV+tamgLrfPboq6m4/iRkZkn0IiTuKSZoDWv9+yrut1WXDS9f8jKjUdZ+4QRGKLI
         AP7dZf+2LstVWrRNUiMdMmywK1eQRY/JcXGss0bRNZdW4KE6OH7SVjELkcs1/eo2Ng3Y
         6T19MVjv0Xs1zCI1E9Ki7cyR7uCyydu3jKY7l2vGJKyT5Ezh4VVyPaMpXoR7SihF7dEA
         SYCT34bp8wskLqlx0QCuBuUa+mpjyeLzO63stYQaOOkkz/WITwWBGoeaK+92BcyAkQYE
         ju/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352801; x=1783957601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3xypUPvLubQm1/1Qk4UMSCjOCD4eeeEzl0qrPZ2tmTo=;
        b=MdSMzmfvC3uh69H97nTcVa7hlY2Ep4FwjxwbnQgB5OXcgGyqtL7Opzihv3daBRz3Qt
         VkdHPWx/Y7FenQcxaPjuywu7tQ7tHDqSe5K6U/9UWDUu/iliiHOb3ipQzjnY2s0RRWmo
         9dPVmF8pbn7gbKWzP6zj/SWok/zu4VWJGdsJJql5rXEVM4yvdQwYpjRgUIqp3BG4fH+k
         2w0/alXxagH+HAwXiSSPI3tLXvULthU3cAkOGRsxidBazL4sjVSy1ogEfZOXKBfEOfS2
         STK8zC7VqayfYuvnSXZHvsaQYqnp+7AtBOaIKhW+uWpNJ7+1xcjZPghPndOVX/H1kpO5
         lf5g==
X-Gm-Message-State: AOJu0YzbwpkvxtkvdcWr9zRNfq/JVZ6ETtVZfGXWe17D2zfJOM2gpSqp
	KXu4KW5cvaywhZ25uO7J4yX2nV9TpguhnkCYpZkyCWypbFEAE+uPS1jQHLHVogZymOudX18qLZQ
	3F7QCxQFYo0lmsrewJPxKn4jMeOX93ONuk1X8c+zPfJ9xvG/lRbbSLhU/PnuLOqBDbIUctyfYe3
	wP2N17EC4DqthBDBM6TCvuupJMS483B/o0iMzztyBUfgs8kmPHT+3e
X-Gm-Gg: AfdE7clltKYuLTcqs6WwWdAVv4sDpoqLzmMH+66PxstZIZGTJCy2ny9Eh+MO5m/qDr/
	iKB0lvcOoI+lGFvLcFJQyLiK1SV3gR5uTyQf6aOi73UOMw5R4v52t2Ng+0ihkFx5elyO3V60l1D
	G+m0o3yiPB+qnAvGzOyoiSacxN4/Nr3lXNDF7kHZePgvd9KYd3tHPQoEUFYO/ZvUVp4ToY
X-Received: by 2002:a05:6214:29e3:b0:8f3:8a75:f952 with SMTP id 6a1803df08f44-8fcb5abbce4mr13936356d6.49.1783352801096;
        Mon, 06 Jul 2026 08:46:41 -0700 (PDT)
X-Received: by 2002:a05:6214:29e3:b0:8f3:8a75:f952 with SMTP id
 6a1803df08f44-8fcb5abbce4mr13935776d6.49.1783352800368; Mon, 06 Jul 2026
 08:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260609025458.13744-1-enelsonmoore@gmail.com>
In-Reply-To: <20260609025458.13744-1-enelsonmoore@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:46:28 +0200
X-Gm-Features: AVVi8Ce16IKovkNp7ixdrdpD2hLmFhO7URjbqFRpBgMGSiJRteU4DwswInGTdYU
Message-ID: <CAPx+jO9vdg62sff6eE8rCqVH=Bq0ZsbrA+HQ++qam8u-eaLYKw@mail.gmail.com>
Subject: Re: [PATCH] ARM: PXA: remove remnants of PXA93x support
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        Ulf Hansson <ulfh@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Rakuram Eswaran <rakuram.e96@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>, Khalid Aziz <khalid@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: TAU3q8YxVKzpffXrzueZBf3ing50JBGW
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4bcde2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=JGXKmvUxgQsyE4geREYA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfX91fWQbchWcV2
 A+5TGAMF6Oj4xg+7G4Y2Drkyk/Q5e9+fQPsMhrNlw2Cm7fyf4NEvWGBkLGojQnkneA1T7OXvIVS
 fuB3H6KXq/7jx7Cnu0120LndDeQA3ak=
X-Proofpoint-GUID: TAU3q8YxVKzpffXrzueZBf3ing50JBGW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfX31pinqojeA46
 5IytKPN6aZwXIn6eEDE39jl7getAZYrTVCAXXRfk1+iFAjQROMjW6didVJRbBjgVZbCvPUB64QY
 XNVKA7nH7+1B8cN+CVqqEQhAzYYsmI83QHE4fQJ3zyIdTKp55zp/zUVenD8IG8KewiNVJRYc2VI
 CYzvLoddXX8HQOoB0OSkYEHneyi8s9xrzErhDHD4La2rYv5DY5iaJlXx8uDH6ywYraOuHlXzecF
 iRZf0rl6Ssh9zkTUTbkpMV5qGBNcMEcqQB9CIquvj2v04bIRD+/23BvyGlmBZsTrVccF+ASU4ni
 FxJcIYVe7N8CG4EHuYO3MnlyLRS+zVKi0LcZpTbNV/h/3TttNzFoBeDnUCfGXw8xvDCsEljvEDs
 mDDbGzltTdGYVvYNHsJB9/1Tzk9E/iETqRdKcrdIjZej8vusAV0Buid0pN8CUb57uLMUj0A86Vn
 WV0XCiJPSlIdTfVBStw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_084643_137927_17602A6A 
X-CRM114-Status: GOOD (  19.88  )
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

On Tue, Jun 9, 2026 at 4:55=E2=80=AFAM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:
>
> Support for PXA93x chips was removed in commit d711b8a2987a ("ARM: pxa:
> remove pxa93x support"), but some code to handle them remains. Remove
> it.
>
> Discovered while searching for CONFIG_* symbols referenced in code but
> not defined in any Kconfig file.
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/pxamci.c   |  3 +-
>  include/linux/soc/pxa/cpu.h | 56 -------------------------------------
>  2 files changed, 1 insertion(+), 58 deletions(-)
>
> diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
> index b5ea058ed467..f8427f071c00 100644
> --- a/drivers/mmc/host/pxamci.c
> +++ b/drivers/mmc/host/pxamci.c
> @@ -43,8 +43,7 @@
>  #define NR_SG  1
>  #define CLKRT_OFF      (~0)
>
> -#define mmc_has_26MHz()                (cpu_is_pxa300() || cpu_is_pxa310=
() \
> -                               || cpu_is_pxa935())
> +#define mmc_has_26MHz()                (cpu_is_pxa300() || cpu_is_pxa310=
())
>
>  struct pxamci_host {
>         struct mmc_host         *mmc;
> diff --git a/include/linux/soc/pxa/cpu.h b/include/linux/soc/pxa/cpu.h
> index 5782450ee45c..38bacdae684f 100644
> --- a/include/linux/soc/pxa/cpu.h
> +++ b/include/linux/soc/pxa/cpu.h
> @@ -46,14 +46,6 @@
>   *  PXA31x     A2      0x69056892      0x2E649013
>   *  PXA32x     B1      0x69056825      0x5E642013
>   *  PXA32x     B2      0x69056826      0x6E642013
> - *
> - *  PXA930     B0      0x69056835      0x5E643013
> - *  PXA930     B1      0x69056837      0x7E643013
> - *  PXA930     B2      0x69056838      0x8E643013
> - *
> - *  PXA935     A0      0x56056931      0x1E653013
> - *  PXA935     B0      0x56056936      0x6E653013
> - *  PXA935     B1      0x56056938      0x8E653013
>   */
>  #ifdef CONFIG_PXA25x
>  #define __cpu_is_pxa210(id)                            \
> @@ -126,26 +118,6 @@
>  #define __cpu_is_pxa320(id)    (0)
>  #endif
>
> -#ifdef CONFIG_CPU_PXA930
> -#define __cpu_is_pxa930(id)                            \
> -       ({                                              \
> -               unsigned int _id =3D (id) >> 4 & 0xfff;   \
> -               _id =3D=3D 0x683;                           \
> -        })
> -#else
> -#define __cpu_is_pxa930(id)    (0)
> -#endif
> -
> -#ifdef CONFIG_CPU_PXA935
> -#define __cpu_is_pxa935(id)                            \
> -       ({                                              \
> -               unsigned int _id =3D (id) >> 4 & 0xfff;   \
> -               _id =3D=3D 0x693;                           \
> -        })
> -#else
> -#define __cpu_is_pxa935(id)    (0)
> -#endif
> -
>  #define cpu_is_pxa210()                                        \
>         ({                                              \
>                 __cpu_is_pxa210(read_cpuid_id());       \
> @@ -186,18 +158,6 @@
>                 __cpu_is_pxa320(read_cpuid_id());       \
>          })
>
> -#define cpu_is_pxa930()                                        \
> -       ({                                              \
> -               __cpu_is_pxa930(read_cpuid_id());       \
> -        })
> -
> -#define cpu_is_pxa935()                                        \
> -       ({                                              \
> -               __cpu_is_pxa935(read_cpuid_id());       \
> -        })
> -
> -
> -
>  /*
>   * CPUID Core Generation Bit
>   * <=3D 0x2 for pxa21x/pxa25x/pxa26x/pxa27x
> @@ -218,22 +178,11 @@
>                 __cpu_is_pxa300(id)                     \
>                         || __cpu_is_pxa310(id)          \
>                         || __cpu_is_pxa320(id)          \
> -                       || __cpu_is_pxa93x(id);         \
>          })
>  #else
>  #define __cpu_is_pxa3xx(id)    (0)
>  #endif
>
> -#if defined(CONFIG_CPU_PXA930) || defined(CONFIG_CPU_PXA935)
> -#define __cpu_is_pxa93x(id)                            \
> -       ({                                              \
> -               __cpu_is_pxa930(id)                     \
> -                       || __cpu_is_pxa935(id);         \
> -        })
> -#else
> -#define __cpu_is_pxa93x(id)    (0)
> -#endif
> -
>  #define cpu_is_pxa2xx()                                        \
>         ({                                              \
>                 __cpu_is_pxa2xx(read_cpuid_id());       \
> @@ -244,9 +193,4 @@
>                 __cpu_is_pxa3xx(read_cpuid_id());       \
>          })
>
> -#define cpu_is_pxa93x()                                        \
> -       ({                                              \
> -               __cpu_is_pxa93x(read_cpuid_id());       \
> -        })
> -
>  #endif
> --
> 2.43.0
>


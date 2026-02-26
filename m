Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD44FD3771
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 06:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feLzlxQHC4cwWCidFRZFj0vPLV0yL+/3P9Ho77Du94Q=; b=npaKoW6Toiu7VBFhsiA4MMXhCc
	dqGaAhjoiwrlM7io0Bf7I/WrQyFcXGmiat3jnxfX1PcnolUm6MAZ6GJy4f3rWPkubt/YjxPbzImm5
	B1U+QlIirMqV1q88e2LVKLrIxGHCqvzcctmr9ZJroVwVGY5W+3MC2QGhzN5VsAnEm9u2SniYR5E/8
	+ARYG4MEzF+oc4NDA81u5m8DEbodtUIeatnBBmSzXdVso3Q99se054p+3uyQkgnDsqtqTs75zJYaH
	Jya54cELeO+xZFeD6PaqIV4VI0YQOf/yKsI/+lnizWBH+3C5izoqQFgzSJoRB+G78LC4xCRaOisOm
	rFLRi3IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvV75-00000005VZ3-1E0N;
	Thu, 26 Feb 2026 06:44:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvV72-00000005VYi-1hKV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 06:44:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4Usxp3776971
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 06:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	feLzlxQHC4cwWCidFRZFj0vPLV0yL+/3P9Ho77Du94Q=; b=LXyqSEwCxTLss82O
	KGTevmugKHsamOfer4V1RKk1N+rnb8x4W4EpbCeyBwJo059YXIxwKS9h9vPsme3z
	35pbJiCgB5E3GBpsjjmwXzXmbX6E3h2+JKAPgk38ATFgaa1GYqztgV1XMe6OjNkX
	VHFwUFtgzR/SfB4KyIPNNeO8V0cpEoL9bHtP+XGlC87iM0H+m8yNA+WKF7YPgbm/
	REetkHs/b2ZQUJu+FGGR2C4a/sWgZqmVR8K6+pBjzJyBBOazfgPz7MGjcPwOOi3u
	8CUfSLEdsPoXWRGL8c8QMNt8TRoLv2OnZKoe6DcGMXLoAvTjKIjjWKWTWxxwraz1
	HBXEQA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjae0s35d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 06:44:38 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d4bd29099eso6711165a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 22:44:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772088278; cv=none;
        d=google.com; s=arc-20240605;
        b=E+pKlN+ig8e1vmHYgfiXfO2znnxiZbOmLPPGmnUh1g9VvTRyW5c5GpyTWPenGYXX0n
         e3EsKp6WqlnUTU5lIeqA2W48smqp1fckbkmAv6V77sdKxW59HWpdfeRECZQzeD6s7ZSF
         P+F9mEdOx1Ix+m+UruAlZjZPK5hWKdYRLjhqdM/vv8fpd6UyEJTUmZ5pVG31Em6qpC/j
         UUn1MIcxIPoP44vWcqDOVBL8JVpybxiERTPPJ38x+1JpVQfY2fvieUag/GXjEGLVfgs1
         gcLU5GKwsnN//+fvE/yCkSk0jGKY4mKv6SAoZY1GDKzudgonelzmDE40ac/b2biQcp6r
         +kHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=feLzlxQHC4cwWCidFRZFj0vPLV0yL+/3P9Ho77Du94Q=;
        fh=mpcoD7F+PNCWa10nIIwnttgP0yRRo0deukjNQMJyYoI=;
        b=UvbIQNEm1UyDsJ69R5PkbQgAQ83nYhfTO5Ece4mCnu0Fz2JHY/rkf0ZyUcW44aiHYy
         jzBtn+9fbjBLWD7uGyw+eYUBbNByEpy3RiH50DRxe51vGquu9a37x6LekJ8CbqZ9b86F
         GzsQkB0G6N9KOX1fF2SYdKpux7oRtPov4y19Wwv26YNaO734h3PBsLYpXEYDdqVL/SFf
         eNxq3kR7RHQgEe6GHGo0u9Q3gn5rOCEThs5/DLh6XNkmDe+EqPU2Yu+68ETrhLHiTfr4
         q25cHSVFKKREaEo+I0BV/+MDvpXixNWTNjLuRIRb68uLFLRiSxeoUEwRscZFqlec3j9u
         EMew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772088278; x=1772693078; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feLzlxQHC4cwWCidFRZFj0vPLV0yL+/3P9Ho77Du94Q=;
        b=jsmU21EbbRVl1/xZpSWT9eTHoUhgRbA43npWHH+hqKKT6ZboKxJqbXjh8lOmUvsm7m
         giu+i2mqnxKX+n0V8N4d9fxTI/t5k/HMaBNwWt8wZvj2t0jUft4sIcdFzZ5g+hk+Qb9V
         xi/jOD4MjlfPWVy0wF5zUsn9reNliHRO6SguImNQOFTsPaDpUiUFtdoY1Fi5RslgeeHi
         zIs+SmVSTFE7gNCf9hBeCxjpFa5BudxFx9PhELE81YLSUcC67FtG5mataOYFQBBvPeVm
         K/3baQIqyKO8dFHITxtbnQxl+szqKRJCoL6/p8ukcQbmC6dc/XPfaz/Gx1bpDdwuaWGS
         vhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772088278; x=1772693078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=feLzlxQHC4cwWCidFRZFj0vPLV0yL+/3P9Ho77Du94Q=;
        b=SMi0aFCQLLeYRMEBVuHOV+k6CA3Z9ObOTWSgEMIvyBjLvc2xg0BIhK75rO4/dluraz
         wLm5ljefmTyGivBwsIeoyj6QGNVtzskWQoofCWTSgApXVFtqznF1gQyD5V268OdKI47R
         QMiFjLM+qhhcBqAXG7MmiWB3JbC+ZcNhQAUFbAdQjo1ErBY4kySydA1vUKrvFz5ovg9O
         Dv0LOrXE7a7eqH105T6ceJzEhzEeI+YwuV13yVSlfb2W+Srvu+RYPenu66YYpflZcx8O
         ndrbQmp7zzYtAxu968yU9NrZwSunCit921bphw2JR8jg+XZlngPGS/+r1ts8LYN9AbKV
         QjoA==
X-Forwarded-Encrypted: i=1; AJvYcCUmYGp1MPTlXNTDwDaLaohQp1ACb9sIzmDL0tuTJ5XHJsxU1XYWP0fVQTKavH96b50ouSqtCXKKgwX87RYOKtLk@lists.infradead.org
X-Gm-Message-State: AOJu0YyPcn95J90HQjy9sd3q4gxTZM6fY6M8XdFv5h5ff8GoCRuNfXiv
	UoyCL4daIlgmeiq+hR6d4At3b/p98OZzl3YL6WGHX8d0gm9jIPb7OKWPUbvbgX7/9VwLWQauFAG
	f+LTasodbwNMLWLsngXRpg+7rsfn0h/CQAJpChDxTw9nQykO6K0HwwCzrpp5ywwNB1e7Y18Eevt
	uCMkKWVxWr/blWHPNicOqAc9La8uZt5mpNCPBCkG+CgXEDFmqrXkuH
X-Gm-Gg: ATEYQzx1E1mkcrAHFt0Q2SGblmPh3rPE6rCUbUxY/pd2IGqtl3i+SdBNjhRn1dYwdpg
	zIbx+0lcHPKQ84P1TfIVwzgvEMU3Nx+jAjzgxFEWTB3EZwFu03QUWs7Nd+8fUO3TfDtOZheXi2I
	4SCi50e3Xf4dLeZhfQW/uoPLpoXO1lCxPKVPpCRNHTX+ed/wDOlTR9WU5Dj49w6hDGzcDaIKn/P
	26D6qo=
X-Received: by 2002:a05:6830:2a17:b0:7cf:d819:a2d2 with SMTP id 46e09a7af769-7d52bf512camr11500527a34.31.1772088278237;
        Wed, 25 Feb 2026 22:44:38 -0800 (PST)
X-Received: by 2002:a05:6830:2a17:b0:7cf:d819:a2d2 with SMTP id
 46e09a7af769-7d52bf512camr11500510a34.31.1772088277848; Wed, 25 Feb 2026
 22:44:37 -0800 (PST)
MIME-Version: 1.0
References: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
 <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-1-347fa2d7351b@arm.com>
In-Reply-To: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-1-347fa2d7351b@arm.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 12:14:26 +0530
X-Gm-Features: AaiRm51ZQEVzQPuSNRCFd13Five9fB0P9HahXQ78_EQWjVuCiTnlrkcRyhMOVfQ
Message-ID: <CA+Ht8=a9a-zB_kEt1ZHFeTWSYGn4o3MRuHdXY9FDWWNZ=gc-Yg@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] ACPI: APEI: GHES: share macros via a private header
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
        Dmitry.Lamerov@arm.com, catalin.marinas@arm.com, bp@alien8.de,
        robh@kernel.org, rafael@kernel.org, will@kernel.org, conor@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        krzk+dt@kernel.org, Michael.Zhao2@arm.com, tony.luck@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA1OCBTYWx0ZWRfX0Xelks7fxuFo
 LHVBAg4ya7cXOrfRI5FRcaL4iyPnt/KwPUM8IC9CVq+DcPQtHsSAcDVZ2h9VLCxB2JqiYEa7PjS
 jNxuE+/UGwdxO8N1kARci62oKC53MEnf8kNaRMM3oDN4uw6KURJOFQrSCUciZWHovGhxIwR8EQV
 ORfCGw/Ge0bFdvk/hCydmQC7E9nrVr2R16QzcE3ZfPhstsAYlvqBKaE5s7IR9YuCwzNhPDDuN9d
 SnMKJEUHG60cnEVSRjlzZAgKt0CtHS/SF1d22txm+KqAZeDJ+XzYVerHtrQkhYcUKZEvnG7mrdn
 AktDxT3FDG0VHIPS/m5sC3Ky5lq6L92M5C/dqUVW5X6uXX1fdnJppI/K90wbDuMDqBNRMOPKPNg
 GaHxO7rJpoE2+pFzy9GqvcS8JLNB9LFyoNsAq5WOIZGTHhE3XvGewP+RgameiDbM3Xlp3hAl6XH
 TGFJAIEqpeW5+b+p3AQ==
X-Authority-Analysis: v=2.4 cv=O7Q0fR9W c=1 sm=1 tr=0 ts=699febd6 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=7CQSdrXTAAAA:8 a=el1Gr4cE1T2VXIUlPsIA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Lp5YXkns3VSn2i7_tuHUj1EFbSDbkXK7
X-Proofpoint-GUID: Lp5YXkns3VSn2i7_tuHUj1EFbSDbkXK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_224440_580997_859D9D4A 
X-CRM114-Status: GOOD (  29.68  )
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

On Fri, Feb 20, 2026 at 7:13=E2=80=AFPM Ahmed Tiba <ahmed.tiba@arm.com> wro=
te:
>
> Carve the CPER helper macros out of ghes.c and place them in a private
> header so they can be shared with upcoming helper files. This is a
> mechanical include change with no functional differences.
>
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
> ---
>  drivers/acpi/apei/ghes.c | 60 +-----------------------------
>  include/acpi/ghes_cper.h | 95 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 96 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index f96aede5d9a3..07b70bcb8342 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
> @@ -49,6 +49,7 @@
>
>  #include <acpi/actbl1.h>
>  #include <acpi/ghes.h>
> +#include <acpi/ghes_cper.h>
>  #include <acpi/apei.h>
>  #include <asm/fixmap.h>
>  #include <asm/tlbflush.h>
> @@ -57,40 +58,6 @@
>
>  #include "apei-internal.h"
>
> -#define GHES_PFX       "GHES: "
> -
> -#define GHES_ESTATUS_MAX_SIZE          65536
> -#define GHES_ESOURCE_PREALLOC_MAX_SIZE 65536
> -
> -#define GHES_ESTATUS_POOL_MIN_ALLOC_ORDER 3
> -
> -/* This is just an estimation for memory pool allocation */
> -#define GHES_ESTATUS_CACHE_AVG_SIZE    512
> -
> -#define GHES_ESTATUS_CACHES_SIZE       4
> -
> -#define GHES_ESTATUS_IN_CACHE_MAX_NSEC 10000000000ULL
> -/* Prevent too many caches are allocated because of RCU */
> -#define GHES_ESTATUS_CACHE_ALLOCED_MAX (GHES_ESTATUS_CACHES_SIZE * 3 / 2=
)
> -
> -#define GHES_ESTATUS_CACHE_LEN(estatus_len)                    \
> -       (sizeof(struct ghes_estatus_cache) + (estatus_len))
> -#define GHES_ESTATUS_FROM_CACHE(estatus_cache)                 \
> -       ((struct acpi_hest_generic_status *)                            \
> -        ((struct ghes_estatus_cache *)(estatus_cache) + 1))
> -
> -#define GHES_ESTATUS_NODE_LEN(estatus_len)                     \
> -       (sizeof(struct ghes_estatus_node) + (estatus_len))
> -#define GHES_ESTATUS_FROM_NODE(estatus_node)                   \
> -       ((struct acpi_hest_generic_status *)                            \
> -        ((struct ghes_estatus_node *)(estatus_node) + 1))
> -
> -#define GHES_VENDOR_ENTRY_LEN(gdata_len)                               \
> -       (sizeof(struct ghes_vendor_record_entry) + (gdata_len))
> -#define GHES_GDATA_FROM_VENDOR_ENTRY(vendor_entry)                     \
> -       ((struct acpi_hest_generic_data *)                              \
> -       ((struct ghes_vendor_record_entry *)(vendor_entry) + 1))
> -
>  /*
>   *  NMI-like notifications vary by architecture, before the compiler can=
 prune
>   *  unused static functions it needs a value for these enums.
> @@ -102,25 +69,6 @@
>
>  static ATOMIC_NOTIFIER_HEAD(ghes_report_chain);
>
> -static inline bool is_hest_type_generic_v2(struct ghes *ghes)
> -{
> -       return ghes->generic->header.type =3D=3D ACPI_HEST_TYPE_GENERIC_E=
RROR_V2;
> -}
> -
> -/*
> - * A platform may describe one error source for the handling of synchron=
ous
> - * errors (e.g. MCE or SEA), or for handling asynchronous errors (e.g. S=
CI
> - * or External Interrupt). On x86, the HEST notifications are always
> - * asynchronous, so only SEA on ARM is delivered as a synchronous
> - * notification.
> - */
> -static inline bool is_hest_sync_notify(struct ghes *ghes)
> -{
> -       u8 notify_type =3D ghes->generic->notify.type;
> -
> -       return notify_type =3D=3D ACPI_HEST_NOTIFY_SEA;
> -}

All this has nothing to do with CPER which is defined in UEFI. All of
this is part of the GHES structure defined in ACPI. Why are these
being moved to ghes_cper.h.
It is blurring out the demacations. If you are caving out CPER
helpers, please don't move GHES helpers. The better place to move
these helpers is ghes.h otherwise they are good where they are.

> -
>  /*
>   * This driver isn't really modular, however for the time being,
>   * continuing to use module_param is the easiest way to remain
> @@ -165,12 +113,6 @@ static DEFINE_MUTEX(ghes_devs_mutex);
>   */
>  static DEFINE_SPINLOCK(ghes_notify_lock_irq);
>
> -struct ghes_vendor_record_entry {
> -       struct work_struct work;
> -       int error_severity;
> -       char vendor_record[];
> -};
> -
>  static struct gen_pool *ghes_estatus_pool;
>
>  static struct ghes_estatus_cache __rcu *ghes_estatus_caches[GHES_ESTATUS=
_CACHES_SIZE];
> diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
> new file mode 100644
> index 000000000000..2597fbadc4f3
> --- /dev/null
> +++ b/include/acpi/ghes_cper.h
> @@ -0,0 +1,95 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * APEI Generic Hardware Error Source: CPER Helper
> + *
> + * Copyright (C) 2026 ARM Ltd.
> + * Author: Ahmed Tiba <ahmed.tiba@arm.com>
> + * Based on ACPI APEI GHES driver.
> + *
> + */
> +
> +#ifndef ACPI_APEI_GHES_CPER_H
> +#define ACPI_APEI_GHES_CPER_H
> +
> +#include <linux/workqueue.h>
> +
> +#include <acpi/ghes.h>
> +
> +#define GHES_PFX       "GHES: "
> +
> +#define GHES_ESTATUS_MAX_SIZE          65536
> +#define GHES_ESOURCE_PREALLOC_MAX_SIZE 65536
> +
> +#define GHES_ESTATUS_POOL_MIN_ALLOC_ORDER 3
> +
> +/* This is just an estimation for memory pool allocation */
> +#define GHES_ESTATUS_CACHE_AVG_SIZE    512
> +
> +#define GHES_ESTATUS_CACHES_SIZE       4
> +
> +#define GHES_ESTATUS_IN_CACHE_MAX_NSEC 10000000000ULL
> +/* Prevent too many caches are allocated because of RCU */
> +#define GHES_ESTATUS_CACHE_ALLOCED_MAX (GHES_ESTATUS_CACHES_SIZE * 3 / 2=
)
> +
> +#define GHES_ESTATUS_CACHE_LEN(estatus_len)                    \
> +       (sizeof(struct ghes_estatus_cache) + (estatus_len))
> +#define GHES_ESTATUS_FROM_CACHE(estatus_cache)                 \
> +       ((struct acpi_hest_generic_status *)                            \
> +        ((struct ghes_estatus_cache *)(estatus_cache) + 1))
> +
> +#define GHES_ESTATUS_NODE_LEN(estatus_len)                     \
> +       (sizeof(struct ghes_estatus_node) + (estatus_len))
> +#define GHES_ESTATUS_FROM_NODE(estatus_node)                   \
> +       ((struct acpi_hest_generic_status *)                            \
> +        ((struct ghes_estatus_node *)(estatus_node) + 1))
> +
> +#define GHES_VENDOR_ENTRY_LEN(gdata_len)                               \
> +       (sizeof(struct ghes_vendor_record_entry) + (gdata_len))
> +#define GHES_GDATA_FROM_VENDOR_ENTRY(vendor_entry)                     \
> +       ((struct acpi_hest_generic_data *)                              \
> +       ((struct ghes_vendor_record_entry *)(vendor_entry) + 1))
> +
> +static inline bool is_hest_type_generic_v2(struct ghes *ghes)
> +{
> +       return ghes->generic->header.type =3D=3D ACPI_HEST_TYPE_GENERIC_E=
RROR_V2;
> +}
> +
> +/*
> + * A platform may describe one error source for the handling of synchron=
ous
> + * errors (e.g. MCE or SEA), or for handling asynchronous errors (e.g. S=
CI
> + * or External Interrupt). On x86, the HEST notifications are always
> + * asynchronous, so only SEA on ARM is delivered as a synchronous
> + * notification.
> + */
> +static inline bool is_hest_sync_notify(struct ghes *ghes)
> +{
> +       u8 notify_type =3D ghes->generic->notify.type;
> +
> +       return notify_type =3D=3D ACPI_HEST_NOTIFY_SEA;
> +}
> +
> +struct ghes_vendor_record_entry {
> +       struct work_struct work;
> +       int error_severity;
> +       char vendor_record[];
> +};
> +
> +static struct ghes *ghes_new(struct acpi_hest_generic *generic);
> +static void ghes_fini(struct ghes *ghes);
> +
> +static int ghes_read_estatus(struct ghes *ghes,
> +                     struct acpi_hest_generic_status *estatus,
> +                     u64 *buf_paddr, enum fixed_addresses fixmap_idx);
> +static void ghes_clear_estatus(struct ghes *ghes,
> +                       struct acpi_hest_generic_status *estatus,
> +                       u64 buf_paddr, enum fixed_addresses fixmap_idx);
> +static int __ghes_peek_estatus(struct ghes *ghes,
> +                       struct acpi_hest_generic_status *estatus,
> +                       u64 *buf_paddr, enum fixed_addresses fixmap_idx);
> +static int __ghes_check_estatus(struct ghes *ghes,
> +                        struct acpi_hest_generic_status *estatus);
> +static int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
> +                       u64 buf_paddr, enum fixed_addresses fixmap_idx,
> +                       size_t buf_len);
> +
> +#endif /* ACPI_APEI_GHES_CPER_H */
>
> --
> 2.43.0
>
>


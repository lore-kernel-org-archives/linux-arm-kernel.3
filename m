Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C6DC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 10:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+B0bdJnNuDQnu1UGOYoafwDSfTYHTsN++I797lL5+sI=; b=D9iNs3ceaGNhUL9qweE8ybjcLG
	98VTxmLj6oKzsve6ErRLdc3PjvY/aZAe3v7DLEnTh8cRsce0WzVlE5j2BQTwbopESEzNlyASQB6Ss
	mJttS1HrQYJOe2WmbN06P6fw8r0B0+f8YJrHhEC6UZcYkj7n+BS84NDTcZzcfhxuB+5GgbNVDKkE9
	OlAx97eJRh+2W1+xSzwPqGAF5s9Ka/rFKvCIa1+JiUB7MpfnrxWhasoFVAZpZFFdJC0avKFHu5pVZ
	TOv1U83fwSR99p2B6qkLk77Oa78drWwD518Tiy+1Q8WDbZgScGBz2WYf5pbxtoJ3CoKiP6yW/d6k7
	I+PpNFHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WTc-00000006TI8-2S8z;
	Mon, 07 Sep 2026 10:21:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WTY-00000006THU-3qOn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 10:21:24 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bXV63702368
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 10:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+B0bdJnNuDQnu1UGOYoafwDSfTYHTsN++I797lL5+sI=; b=Bcy9UktBH4oVROwE
	RifhQdsu0OGWptbh3PQ7tg5u5T7NPqvUPO7Ns28E4AGl97CqJjSGvLHnfQLY5O11
	Tu9n7dW47TcxMes38doT5qMKchJGt5dtpi/bF5vAaJrZgTmzD8UpalGrCtv+SQ5S
	qa8TlPxvZ2C86iKYSAaQIkyU4DuS0cnSkS2ELj0WRF3K0hUmdFEdeRoIzyEsfIOb
	+uMmk256TBD3SktRNSBFKCQhgFEqHAwckK1cGK9P42bhrCqBKgQltY4BcCm/tn15
	wZwR2cRFQ4Ra9iemknbDMNpAHbMem+12NIfTEAkJ3q1IiqtG8ym172pL5Hh3Eqhi
	0dZ8Ww==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66hb6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 10:21:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-85722fc5a21so4265985b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 03:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788776478; cv=none;
        d=google.com; s=arc-20260327;
        b=sk8lXBXoUlJG7vQ76VdZUKg8al79kGG/RyirmpAO2PKTh85S6/j5KDAajVIDAspEWZ
         NaQoX0sX8Ohw7q1pwTmYkz9LBr1K67oKsjdARtgxppwKV56wqowC+kIN8nA0tVNStQjY
         +Ej6jiHLjXV/hbWeqXFBq91xrKbGiFZcqezgS+uSQSlXproXTR9ULNHlUBiPyunA8JFu
         x291LGLFYGiKjIi5+qHQmYxacnRbFqwZ57bdR8RZ2ES4TMCFG9BvyvX5HUSui/V491SP
         xT+GCyEp1r7AXse57jBOE/iwDBxuxhnOf7K1bZl9d/SvtRvnmWdcdLMZMJZ0dZXNefmQ
         RApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+B0bdJnNuDQnu1UGOYoafwDSfTYHTsN++I797lL5+sI=;
        fh=lUOPlQDPpvM5F758ukRsCnxNCC/CODuaLticqcMzDTk=;
        b=SGLfuxK9IDW92wrwALF4Hw4Hyj99aBB4lo4OXkV58UGC5M5+87+2bniVRQUU5mpXOs
         j7Ypv458NKOwQ1xrdXCJe/8lwCsYw6d0C40IfMJMxbjpFCnnuA3rAwS4ROg0+n3cgBYM
         SBqTD7YOE6r20qP8JhcLishbrdXMGz+ut5s9NVnNGK34vuMitpNwL6WFS4+ckVeSWrCJ
         xtHKAKdOTeuERZM8MeX6eFnOroqabXQawV/6cCHavpehD1MRhaxZ5Ke2WzMxMFTKEUDc
         ryan29Tu76W29m7zRcfShTYOFkeiz157SpkG5vWB0km/REme53oSQwd82USj/t7WUS3N
         oHLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788776478; x=1789381278; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+B0bdJnNuDQnu1UGOYoafwDSfTYHTsN++I797lL5+sI=;
        b=bPDw8TpM7oAjBbqCCW+BDcL3g+6EMyIRHAB/1+LA61/tg81SqZwD4wWXPTps/QRmgs
         7HmInGg5iEY65e3YL3nzmL605tx0zCCgum3jP4J1zgTGi8m5XJTTj/micI9mgDJrvGgb
         WqVIqX4F6pHw8TY8kp4D2U86KybYa50zs8ZBZt8aW8wBzoSaFi0+8lm5ZIFmJmxqfJ3g
         FTVar7XzR/tklwY/OW+f8ftc53Nr6jBVdKW4vRkIIupOXbsVo8LahyqCUP8J6ffPXFTC
         IG0xGCYz4Rqkk04yvDEElcXjAd5NVKoFFDDkGJemjKJbbaRm2CV6dYPBDAhi93pZMhWu
         S0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776478; x=1789381278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+B0bdJnNuDQnu1UGOYoafwDSfTYHTsN++I797lL5+sI=;
        b=FT6V4fDTK5RyA9lirG8M1aqYytSv1dL/rxO+r0L89nDp5eXO5AMkVZK/TllCNR8MTN
         p+WCKyX5UKDYjU+pRJk5/wbbzb1S9llJYW2gZ0TUfx68RyEGC7XVRw2am1L4mC8e2t8k
         ikYkeF971aa4cGE7x54ZGSCvDbiGXFkcdtYC3Jj+JtTFSqGRV8lHStSu5SoQUxbxHgOj
         s2ixyt3lrI9Ku3H6ZpzSDUaqQmR9d5baM0IXsJ3SgWg/zZcHkCWHu80YTXt5ULL231Hk
         notVdFma6bp9XrXMAH9BB4YaeX7IPTVYJUZ4gNuyKOu4lgsEIHP6vN+fnMrtU+yYkvRL
         wV3A==
X-Forwarded-Encrypted: i=1; AKwUvByliVKlGVF9Tjk8eWCpl8bg6qsnjhkqDzILrQnlDgF+hB6PmiDSh3Y8a2AWN8KC8zswh4qfHbFqhfb206KgEsZl@lists.infradead.org
X-Gm-Message-State: AFuF++nkWxvM+Y+NiEHy8fp7u0ZHH/OqDN3t6yGSDNBsCxYktAJ942Td
	1QCszsT88TdO7r3Fnbt4+f88wT66uiHroDvNjR0lduq/3ra+mkSwhQFTZCtSEOJa4mCnlOA2EWo
	jhF90H4g51WqVu7WmK88o7VDDZqwM5tPPXRPCr1rR20P3jALIUWDRpxcjpMCzc+hbPGwfcGkocK
	dGFTi9BKsEewlonikIy/3qeXOmq1nRldX0JmhijUDunctu9a50egvf
X-Gm-Gg: AYBFou2T0wGNltGmT2sgM/xs7rKdxlDuhQBGksejof4d+3oP7K1/5RDd9mp3PtfThpQ
	hqB0sAGhFYv+i6PhOwn8OW+ruMp3ZPVUTsRNH2lRhJ5XtCCHVUsGz0uZ/2QHr/LZ9TBY73L0xJ/
	n3DAWgqtjVwRArJetrxVKONKwS4vnhb6Zmn+f2nDIPGCT61Ip8QJu2zTDT3A==
X-Received: by 2002:a05:6a00:4c8f:b0:84f:5cd7:e3c6 with SMTP id d2e1a72fcca58-861662d4ce4mr30999435b3a.5.1788776477876;
        Mon, 07 Sep 2026 03:21:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c8f:b0:84f:5cd7:e3c6 with SMTP id
 d2e1a72fcca58-861662d4ce4mr30999352b3a.5.1788776477149; Mon, 07 Sep 2026
 03:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
 <20260901111441.122436-3-ulf.hansson@oss.qualcomm.com> <12268d64-08c7-421f-83e2-e6306fde9a88@gmail.com>
In-Reply-To: <12268d64-08c7-421f-83e2-e6306fde9a88@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 12:21:04 +0200
X-Gm-Features: AcwNN1XfD57hC8DPhUlZJGAy3-RlDshBPQUcpMqu3eRHVOiq1DrVi21R9DJBy6k
Message-ID: <CAPx+jO_OWjZpt5SZpCrFUXXVsJ5izV5Ez5BuEVT+s9YHy4enCQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] pmdomain: core: Allow a non-CPU device in a CPU PM
 domain to do power on
To: Dhruva G <goledhruva@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e901e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=u8BtVuMVLpZXKRMe:21 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=RK_iZM9tDnEtT-fnq2oA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: gcJ0CQsZgtTPOlBdoH7SgenyW355uUYt
X-Proofpoint-ORIG-GUID: gcJ0CQsZgtTPOlBdoH7SgenyW355uUYt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMyBTYWx0ZWRfX8mNIiC7f+N9D
 LFh8eQJfSlt42f4xaZcpSfpDwhSngLZqz1JWc9+QSTimp1mEb+J9ElJLEtwkjlQlwTur9qgcTOt
 FDGDkKqH4YptXDxTABT+0+njaoZWPvQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMyBTYWx0ZWRfXz7N+JxXWplD0
 NKQsube0J71jOA8l9RuMoCb43i7tE5AsB0p7RwzxjdzeXKXssdCUfHVDylZ1nFUXPsxOOdCxROy
 M2mMF5BgmbcinLOgKF8HI80AyxeyJgEkfI6DjlcBLFLWJfl6Vuim8jT3+51jiqLT72NkzeWz9Jl
 GmwK3OJCPQn8Dhsr0vxIACpf+mDgi/PrDo57v45MpmMkRPNLeo6GnVQUuae4C79/q+Lq1ShksnY
 Sv/Cgifp5BI/eJr1sWXN+dqdOPhNlTt0o65okWvjnukccSgwi/fh0DbI+OS1shC8rQS/AxMFKSg
 gNKXqajhFchHwtRjjmNXjlzB+Nfzl9NIm/Au9943E4d+N2AGyQgCcUdr+TWsQwUJiqpmsx2gwZi
 wU8BjHPpuDCLW13yTIJmjh8qh3s31i2oRhT4FBK7mwCVqyHfqWt8hu4a4IdefoyEsZ97/16j7qb
 OTYvL5mQVJLWjsGsQqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_032121_096966_6335BDC1 
X-CRM114-Status: GOOD (  45.49  )
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

On Fri, Sep 4, 2026 at 6:26=E2=80=AFPM Dhruva G <goledhruva@gmail.com> wrot=
e:
>
> On 01-09-2026 16:44, Ulf Hansson wrote:
> > A driver for a non-CPU device that is attached to a CPU PM domain (the
> > genpd has the GENPD_FLAG_CPU_DOMAIN configuration set), is currently no=
t
> > able to power on the PM domain. More precisely, to power on a CPU PM do=
main
> > one of its corresponding CPUs needs to be woken up if they are idle.
> >
> > The current support for a non-CPU device is that its driver can only
> > prevent an already powered on CPU PM domain from being powered off. Thi=
s
> > leads to problems for a driver while probing its device or when it need=
s to
> > call pm_runtime_get_sync() to turn on the power for it. From the driver
> > point of view it looks like it all works fine, but when accessing the
> > device it may end up with various errors as the device may not be fully
> > powered on.
> >
> > To fix the behavior for these types of devices, let's adjust the behavi=
our
> > in genpd_power_on() to wake up an idle CPU that belongs to it, in cases
> > when it's needed.
> >
> > Link: https://lore.kernel.org/all/CAPx+jO-sCierYj8jnoKQHckJG16dOBxnNrsZ=
VYO=3D38R2cLV8nw@mail.gmail.com/
> > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> > ---
> >
> > Changes in v2:
> >       - Rename a function according to Abel's suggestion.
> >
> > ---
> >  drivers/pmdomain/core.c | 80 ++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 75 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 6ac1ce18fda3..97273ed2f825 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/idr.h>
> >  #include <linux/kernel.h>
> >  #include <linux/io.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_opp.h>
> >  #include <linux/pm_runtime.h>
> > @@ -19,11 +20,14 @@
> >  #include <linux/slab.h>
> >  #include <linux/err.h>
> >  #include <linux/sched.h>
> > +#include <linux/smp.h>
> >  #include <linux/suspend.h>
> >  #include <linux/export.h>
> >  #include <linux/cpu.h>
> >  #include <linux/debugfs.h>
> >
> > +#include <trace/events/ipi.h>
> > +
> >  /* Provides a unique ID for each genpd device */
> >  static DEFINE_IDA(genpd_ida);
> >
> > @@ -32,7 +36,9 @@ static const struct bus_type genpd_provider_bus_type =
=3D {
> >       .name           =3D "genpd_provider",
> >  };
> >
> > -#define GENPD_RETRY_MAX_MS   250             /* Approximate */
> > +#define GENPD_RETRY_MAX_MS           250             /* Approximate */
> > +#define GENPD_CPU_ON_POLL_PERIOD_US  100             /* 100us */
> > +#define GENPD_CPU_ON_TIMEOUT_US              5000000         /* 5s */
> >
> >  #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)               \
> >  ({                                                           \
> > @@ -1027,15 +1033,75 @@ static void genpd_power_off(struct generic_pm_d=
omain *genpd, bool one_dev_on,
> >       }
> >  }
> >
> > +static bool genpd_status_on(struct generic_pm_domain *genpd)
> > +{
> > +     bool is_on;
> > +
> > +     genpd_lock(genpd);
> > +     is_on =3D genpd_status_on_unlocked(genpd);
> > +     genpd_unlock(genpd);
> > +
> > +     return is_on;
> > +}
> > +
> > +static int genpd_wakeup_cpu(struct generic_pm_domain *genpd)
> > +{
> > +     unsigned int cpu;
> > +     bool is_on;
> > +     int ret;
> > +
> > +     /* Find the first online CPU in the genpd's cpumask. */
> > +     cpu =3D cpumask_first_and(genpd->cpus, cpu_online_mask);
> > +     if (cpu >=3D nr_cpu_ids)
> > +             return -EAGAIN;
> > +
> > +     genpd_unlock(genpd);
> > +
> > +     /* Send a IPI to wakeup the selected CPU. */
> > +     smp_send_reschedule(cpu);
> > +
> > +     /* Poll to wait for it to complete the power on sequence. */
> > +     ret =3D readx_poll_timeout(genpd_status_on, genpd, is_on, is_on,
> > +                              GENPD_CPU_ON_POLL_PERIOD_US,
> > +                              GENPD_CPU_ON_TIMEOUT_US);
>
> How is sleeping here made safe for IRQ-safe consumers and child domains?
>
> For a hypothetical example, consider an IRQ-safe SPI controller in an IRQ=
-safe child domain D,
> whose parent P is a CPU domain. CPU A is outside P, and CPU B belongs to =
P. Both domains are initially off.
>
> A runtime-resume request on CPU A follows this path in drivers/pmdomain/c=
ore.c:
>
> genpd_runtime_resume(SPI device)
> -> lock D
> -> genpd_power_on(D)
> -> lock parent P
> -> genpd_power_on(P)
> -> genpd_wakeup_cpu(P)
>
> genpd_wakeup_cpu() drops P's lock and sends an IPI to CPU B, but D's spin=
lock remains held. readx_poll_timeout()
> can then reach usleep_range() while D=E2=80=99s spinlock is still held.
>
> There is also a problem without the child domain: for an IRQ-safe device =
attached directly to P, __rpm_callback()
> leaves interrupts disabled. Dropping P=E2=80=99s lock restores the alread=
y-disabled interrupt state, so readx_poll_timeout()
> still cannot be used with a nonzero sleep interval and timeout.
>
> I have not reproduced this on a board; this is a hypothetical configurati=
on illustrating the paths.
>
> Is there a restriction elsewhere that prevents either configuration? Othe=
rwise, this wait cannot sleep,
> and the parent lock needs to be reacquired with the same nesting depth us=
ed by genpd_power_on().

Good point and thanks for catching this!

As this path is only for CPU PM domains (has GENPD_FLAG_IRQ_SAFE and
GENPD_FLAG_CPU_DOMAIN bits set), this is solved by converting to the
atomic polling helpers. I am cooking a new version!

[...]

Kind regards
Uffe


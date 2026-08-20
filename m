Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9258C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSaHqHnxNvb6CqEiudUKpmDqvVSufUKJTbfzCQiY/CA=; b=jyTjxt6sH4bdS6cyzqHp6yQkOn
	m2MEEQBZX5ehBaK+Q2RN2EAeMRXAjwZcKXBRme9uTS5JuUFd8I1N2d8/1IcIZx+G6uCkum+T2pRyR
	HePjhPOp8M6o1c7eXHH+YXxNJPX8L3poUpiinMSWY2/C/X4kBsXDB0Db+4dcOUc+fG5tLctKIwX1+
	JuxM2q0oDYMpZezAk8gozyCjFsXikklV7DBWiwWtRFcCbR7EelZRqHkRDIZHLHnhnJiZGNS0+0UAQ
	OXeE0EiMpHwEWTRiFAzaW+lerP7sG8MtwBeZH5xBwX2qJntqyX3zsBQv1Vj+Z75t5hXdYQpZEdu94
	Eubh+Lcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzYR-0000000BJNc-3L7n;
	Thu, 20 Aug 2026 09:59:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzYP-0000000BJN1-1nm8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:59:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6eY932161122
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 09:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FSaHqHnxNvb6CqEiudUKpmDqvVSufUKJTbfzCQiY/CA=; b=oMV5pBw4lu6V8ORR
	bJYBOvrsKSfU43iCzMy3TRRyFYcZAy2hF9weTkyAlPI8H2CbuJCKZzn6lK3E0jUN
	llsfY3U/CmsdJ64rYcs9YZjZetvDmpdsRnTK20ddqUvoO3wbgzAm0XGYxeiNIOVq
	Onz/wKqMMCQ5mzMM+b/aNhYFrixDDEIBUA/1EYEZ4S4xZj7ZpErCdDSvPrMIP0Wh
	G4XSCrV2rofXwVHIuLQgUe+zj5GrlBXmwNXYCGmv2hLwm4Qwy7Awwpj9T4KQhVPW
	KWkwmACYYdjSUW8y6KmjqlXfVKNb61DTjx3WfkMmOMovJ3e1c2Yq0ZCHW2rdUCED
	sygK3Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7rq5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 09:59:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa55c9430so19167845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787219960; cv=none;
        d=google.com; s=arc-20260327;
        b=dSkXJoUpTl0+AldGjHMh7JzHuEvBd06SxnqZtEC4epvdqXHkbPp7VQgf8OcMB5/f7e
         h3q8ZTY3ttgeha/Ri5OKm5ZetG8nLgerBf9u9zaEBYxKfI/qkOJrekYgiu/1PdefGcaG
         GVELOQhgERw/Ohz1acQWotWN/Df8g9fCeVD61dNC6V/dtk5d3cfnlNQDzVzOYJC0OVeN
         JN+CrNblTAoKipXR3iOEbJygg1iTsJp9v04BD0PjpI/yGEkJRAZeT2gVg/8Rzr51Iqtc
         M7MVG5TahJU22s+vpdvnvoZu5338ImHfWTaYxx+fLRH6SS8fNvAENS9xsSBlaRPbcCp8
         ilyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FSaHqHnxNvb6CqEiudUKpmDqvVSufUKJTbfzCQiY/CA=;
        fh=TSk/waIQh+Nl4MQvaQv/zWuE1lx+F8B23Q9EN0wlzxk=;
        b=pIZmL+YCdsTbUCeIT/8xDdLGy/kWTMH5gnKXs6//5QkI6sFvMQnJ1Fz7jIBBLritS4
         m1uwi5gc0in6DzY2qHtO24hajyJFirbwnmwFa0+d/KZP+Uqlp6doCc/0JnanechbPKg5
         dxAwbRDw1pk6HJnSRxSsM6cIB9r2f8MQD5THxTvEMdfftjeSjCPwh5OJ8oAlNwkwxfeD
         r1ICb77N+brNYlN88qURfKykdAecXKBZuWSFJJ/8l6nOX5kqte/J/RNE5NI/688ABu3O
         X8TeJw/XbpIkaI4x6myKXg89VzrImfDoL0EwlB810ttMqq6VPUVn8nxEK9v5WQpsJEBb
         n1LA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787219960; x=1787824760; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FSaHqHnxNvb6CqEiudUKpmDqvVSufUKJTbfzCQiY/CA=;
        b=A4+jwuXS/5UMtAvgcH/A2DE1bKtcL2HFyfflYQiohbHXDCiHrLQYZ1kC8X8mfQjcgr
         Cv1UEsniilmOoO36AQxfqUumdGrUOBxBLVZTraSazgcgntOzxbkPLo+7E+98eiedG7+4
         XHGOgc3TNd6fzy0NKhche9x09TIqvS8i54Mr2ULxg1qJ5bYfHem9Jnzf+O08ThiM5oNk
         hHCvFliP0gRzcNYiXmcKzpG+Vwh6IuAHZpi/DENfc8sP7H16PL7va6DdK21w7sfoeeaN
         BcJx8p3vFJT7d6RidNE3o4SuLJfxixdAtuXNcisy2D9fw/tAQ41lm2gOHxQJqwfunI7h
         yvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219960; x=1787824760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FSaHqHnxNvb6CqEiudUKpmDqvVSufUKJTbfzCQiY/CA=;
        b=oePVyXNg9NPkVbgNbHpvBPlybSvfnJpIya4X+6d2csaamqXfEoMdpMuYWNuYi9hE4G
         C2hm/4wk+CDEkj9A5cuZc3iRdQQZwwmrz3t87CyrPU1wzdgGNqO0x0Z2yIJMkCx2RQD6
         w9Nb43JlejpCcbNc34Le7svozQTq3w7qOy2z/Cmcez7lU2/DA6XCoCk8YpWahyNDkJey
         HOjXA0TT9xZO8vZwh6DZKmIGD3iGTorbUYW9GgHyTmuK3OGsGwsIkyab38xg2nc+xHOS
         RVVJHrFYKm2VRJsQ+DH7yIihWALLpJjp868etgSa1x4Qp+nQIw1sq0g28r0KNIQQeOCR
         3nOQ==
X-Forwarded-Encrypted: i=1; AHgh+RoA20uuNwqZM9ys6jOxyy7DiP5L1QnW1Odz8ETJhpjzHVbZbggDT4DA82pFlIVyc7Ub0qnHqFYx5WjCqaH6Z8c4@lists.infradead.org
X-Gm-Message-State: AFuF++lS89vYTWY2Cq5oOg6IRzKAOMNuJPtECuUk7WO+q4u60VQIdtwt
	1FCopIn6Zxhcr0hBtxSCiVW1kFpU4sK/NfbxfHa5lAFRa39nf/JJeAOIKmCwO9sF6XjTDHt0wHd
	7W9SNHzkhtjYUgfAp5gAB4DK6a0vWin/QM7VUy/AVALOJv7itZyfKOspZpXjvoXn+43xMylJV9i
	E5/xDOpxrfHX5oUlB8njXZeJQNIgZomGtBd32TxeqfvVE2HburRh2+
X-Gm-Gg: AR+sD10cxzf+9+VW8hQzJNGQkOYwvfjDalF8RVE0dW+AZZfwDIFpjoL9yf+I/V7z2Kg
	DooEnPZGAD62KG8M4gEJGInJ1zQvYuitSaRKIq8//dhoyhrrYTpUU2LsM9jKhOJ+klCrJLakObN
	0e5XKzJobOnRFEvBCf00V03uD2kKwADUHJmGTp0BKB9nhEGSNwvkL1KOtVEg==
X-Received: by 2002:a17:902:f551:b0:2cf:afa5:b19a with SMTP id d9443c01a7336-2d5fd6ad63cmr190936585ad.11.1787219959858;
        Thu, 20 Aug 2026 02:59:19 -0700 (PDT)
X-Received: by 2002:a17:902:f551:b0:2cf:afa5:b19a with SMTP id
 d9443c01a7336-2d5fd6ad63cmr190935515ad.11.1787219959289; Thu, 20 Aug 2026
 02:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260819151457.256959-1-ulf.hansson@oss.qualcomm.com>
 <20260819151457.256959-2-ulf.hansson@oss.qualcomm.com> <gkeug6e7thc4j4drwjreirzgtdq747vj3u7jsulslbhru6qjjb@s6ypnqwi3szh>
In-Reply-To: <gkeug6e7thc4j4drwjreirzgtdq747vj3u7jsulslbhru6qjjb@s6ypnqwi3szh>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 11:59:08 +0200
X-Gm-Features: AcwNN1XK7dEs62eUen9n-mxcBc7VkbIvkm68wapHAppB932T_5EJAsmItCtZvUE
Message-ID: <CAPx+jO-a-YOD+YG9zuzvTBY+gob0hj9gXGKoADJGPj2to7527g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] pmdomain: core: Allow a non-CPU device in a CPU
 PM domain to do power on
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3MyBTYWx0ZWRfX9dap+GgVvZ+Q
 vxbViUZUVZrtmIh9gxypZUIYByXaG5Yk1H1oXclvUSdno/le7If1g4vtyBnHV3+IoSiCk6R6Rrf
 GUndBfPAIbS5DmM1UxXxhk3ZeUMSx3hVriawtshzis7HL2WWGx5LbWWRN7/+V09zexYt+3s5Lyo
 zRWR9w+S7RuxXlU3XO+09qjLwZsnm4pzJuQDkh4yQZ+Pp2MayUpE5GmeR0J2GYwiB6mlwW9ai8r
 FHqT79GHADGFfD9juEcVHk8/7Ybtvc4pYa1WJAyaZ4hYZHs6LfFQ1cIPuW3Dtvm/UhJjBSaMVg4
 PbZdQTeC0isZbW3ZRm01Q63IC9YVuliG44huAAxbhcn8lafyxHx1UtFGw15PrjsYLXx5S0EEFc/
 78qLRSMR5vmzveFQA4ZLxSbrCT1Rt4fyxansrHdO/c/Q8xAqQXXC3lK8btqEp1SDp7jdFjGNLhV
 MyO0bb2RQbKz6KCMmwg==
X-Proofpoint-ORIG-GUID: hStyh6cmL_1zQBD8nS3PIR_nMO2TyZxU
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a86cff8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=u8BtVuMVLpZXKRMe:21 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Fytdzj91sHjwM7AYtdcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3MyBTYWx0ZWRfX01dzPprhIU2D
 PcAT98ITVVlPFX030pIGPeLykSdUEy5AMtwUVZ0TpWwCJPPWij60uf3NOOo6sssvbEYQJQ2Y3ZY
 XcvnKgp4RW64BXGMyPdkJ5WbYoWBLaI=
X-Proofpoint-GUID: hStyh6cmL_1zQBD8nS3PIR_nMO2TyZxU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_025921_477784_48EBD870 
X-CRM114-Status: GOOD (  37.04  )
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

On Wed, Aug 19, 2026 at 7:52=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> On 26-08-19 17:14:51, Ulf Hansson wrote:
> > From: Ulf Hansson <ulfh@kernel.org>
> >
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
> > Signed-off-by: Ulf Hansson <ulfh@kernel.org>
> > ---
> >  drivers/pmdomain/core.c | 80 ++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 75 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 842c4169e290..7345c06f1d55 100644
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
> > +static bool genpd_check_status_on(struct generic_pm_domain *genpd)
> > +{
> > +     bool is_on;
> > +
> > +     genpd_lock(genpd);
> > +     is_on =3D genpd_status_on(genpd);
> > +     genpd_unlock(genpd);
> > +
> > +     return is_on;
> > +}
>
> I'd change the genpd_status_on() to genpd_is_on_unlocked().
>
> And then this one would be just genpd_is_on().

Yep, that sounds like an improvement, thanks for the suggestion!

>
> The rest looks good, so:
>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Thanks!

Kind regards
Uffe


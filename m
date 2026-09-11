Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851FFC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 09:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GnNl1ymLj6T4C1OIFz8Wiaz6RCI0mjO/q04EailQgA=; b=T/kDGdVo/zHqSa071m/s3upIyr
	TK1UOYBKGM2D5E7B1KR5PbG/zAtFVvnCBE6sxA+RrHuk2/lLbRWjEFHiE1iGgjUSYSg+jEiVPA0pC
	XtfNYTPUyEumAlPfS214RdD+jsStsXN/0gJxElHirOO9kP5v5mbpHRVx25PzxxugUL9A/9iM+KebU
	MiLrzny+u8JVzOHf5jhtsVP4FcSCSRwEuYiB2uvU5UgmKxVgxRI9aezKVwGh0HZHOrCkLar1xHhKB
	ne4qGaOQEsqUGoJzkt9rCHaI835PmnOztj+CoGuV4Ecjmvm+8a81wj/N4TX8bVfUedsAYcHlCTnEr
	Ur7tiTOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xDm-0000000GDS7-3mRH;
	Fri, 11 Sep 2026 09:06:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xDk-0000000GDRg-1IqX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 09:06:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7l5l22311747
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 09:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4GnNl1ymLj6T4C1OIFz8Wiaz6RCI0mjO/q04EailQgA=; b=U6asSxexnwwTSr7x
	RbRkx2DFoKaGix+Qlmew8tf95/+2tBbS8aob+HSj2TbxYCaSgzdLrEdRRQWU2mIe
	3IIyMGnDBUNwp1koopNOYatlPFfgn+Xt8Rb4kbPbKfxH6SGX05PG8YzcxAYUfQ/F
	2kPM3GF6jeXpmHlPd1XPzRxqYsNmpCPTGvg7eV51nZx7Oby28/8FM2Ng2CXFZwFe
	Q21PAWuL6GSXT+YyzpwR4qHI0PDj/oW7hg7uRTiO3bRt+5wv6iGXs5QuulwmqN2h
	CFv5F5MdeO84DgTbjqXY02Rbetszf20moct0L7api8SlC12EfYe3o1qDesnQo9hh
	Prsmbw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uchn1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 09:06:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so1267067a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 02:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789117615; cv=none;
        d=google.com; s=arc-20260327;
        b=FI+eo9NtjFmuCXelmVfi/cetZeUMR72jwZZJE6gh2TfuHDlHUWXeLlHF5yNID7GZO4
         Rq3iHm943NtVQbW5x+9J74ZuGwjgU5uYDqIwe5g9PDqdYnmCaamFMpBOIy/WIIpDMOgA
         XSP8sAc6yuOoU8q3Q/v7xq5QNahBEA756n7vhlqMUttnv/fHBSrp3VbElS/Ps2m7DPDb
         cdIiOD4THzETY5iIkx0u+6FMvAUxKYi2oY21lxejYZDA6aCY0GiPNvhvo45nen0UQamR
         wqI6UqN+qNPN/5mT5qIab9CDiCvTYk0BoOnO6EkjyD2RHQn+PPUpEvkqzLnZk2YwCOl7
         NGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4GnNl1ymLj6T4C1OIFz8Wiaz6RCI0mjO/q04EailQgA=;
        fh=MnYYtb27ny1JomOgSVqZmxweQMrtqeAlJgkTLPFLUvM=;
        b=SDnWVfRjw0wxg/t4ULVYMNN+XurgupexNOEPzSU7rHND1Sfq3bkpEEImXyNTkfx0Oy
         4I4MVfauG7BE1POsNXf0f6OwHQo488qEjbsqnkWxMicsoWCJGRML5xeyQ1GR2CepGgvj
         XpGSp/vfyeXugIGVtGy8nDl4Lhl+tegzXSik0Ae2qQhWplOpZCyQZAm2JPh0p8DsEsVv
         cwKJFtWqD5VNNvJZITxm5W/sGpPgC0AHF0c05ssl2wHDEV68ZfHw3re9U7NRvR77zXFv
         mhpBwAwIy0GKxG4Sovv80e9OFXKdhlkErbCAa1VfIZQ8iae31UaBEWEUh89Xv++YwQnx
         X/2Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789117615; x=1789722415; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4GnNl1ymLj6T4C1OIFz8Wiaz6RCI0mjO/q04EailQgA=;
        b=GQEjPsNNw3f29gOqDJCZNC2silHjelJdY6+HPsYxQ0dR+lYkfhcvqjljXdVTsXEum3
         RBLAGt1Qh6oeYW0GNCHb7oWhFwnUeRSO9tP1ngvM6FkujO8fNAAij84sdhox4pn8lScP
         5Bn+zQiqy4p5eddiXz4wdCQ9aePMCgWIuXLnhBaJL+/8ltQ0Qld3/CuJPrtDS0NwrGU1
         vfcwzzfzvGdnZElJVdhQT8IQZ4TH0QQpx1QtJSagXLbaw8pBnyv2NVkzQH03wMqlBT8n
         q2Ev+E5ennSy6gOnvt93uQoRpj5BEkUwVlWy4eOB05R16y3Oz56Hfd8jnJJrsLaBgPZQ
         92CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117615; x=1789722415;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4GnNl1ymLj6T4C1OIFz8Wiaz6RCI0mjO/q04EailQgA=;
        b=kdKZJY2TjrU9zAPHLxKz3K+Gobiv7iuQ9fwz2Kzip08Tht83FtHcejcZiJ3PPyO3JJ
         6C4/mOLDKbsNAuH1UBwr9HEGjgU8RHPKahJL/aB+nipk1IDlJamJ9fKsx2ZHi5NfeAV4
         U5ZR5zvpbvbvU3LM95ROPQ30tmtSJ88S3vQ5VL/BD5J9OkvBpsMRUTwK2M+JVWtoeHlb
         Pw9HAYMn7rQgnyKDfNnF7zHW3a2QrafUK1AZCf43bErf2Qcp3Q2tbOdxiUz7HD/4QyFb
         VAC30UvSrP7T5sXpTURdp11TzJtWBUvipHE0O8oHzl1tEuJjspATc9LpWjjx8NV+g0EE
         P1vg==
X-Forwarded-Encrypted: i=1; AKwUvBxBz5nWdOjGOXaFbv2Vbi3w93u3Ry5iVlrbTghCEt+cd2ghfnML5H8z7dybnS8uXkOynLsulCww9vV2L+gw9sSK@lists.infradead.org
X-Gm-Message-State: AFuF++myCGkmHV2T/TjPdO3xhSo+Zty5RSs4YDjfFwfRd95kvJwyHGHg
	lrotsKlm5avFBCTcThkUs4/409mBiKtQinL+2Hs1STjjIXFbFWgaNIMBPv9S9ON5mlopNcYPKgC
	pIqEU8uzcnZ0FCQ562wrFYAfF6ifm7PfDJbU9hTnzWcJSCIbNkufiiKzZRhRsjOt1/TRZjDj2dh
	eqZKwBqC4YTqpdJWc6c6r5L0R2S5rIKYOQ1EUyyf1wkdtomxghWagw
X-Gm-Gg: AYBFou1cyW8/sypZXIO8jJuQESQANsK30PkHu9dG7Mje+WZWox/MMI3/WTLl1WZYsl7
	t8OuQUxIeC8eyNTrNnvIA0V/K2+yyYGrmyyFBNpGFkj6KimqZFa6IMY6N3nDoEO7eOomGPf43nc
	sbEYzswV+VaQ3lNVyb5sPuIoIyIpNT7G8+cOErMX0KLXhZ2PNcAjsXcjQ6Jw==
X-Received: by 2002:a17:90b:3147:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39d9bee5d69mr5499765a91.10.1789117614524;
        Fri, 11 Sep 2026 02:06:54 -0700 (PDT)
X-Received: by 2002:a17:90b:3147:b0:398:ab03:95b2 with SMTP id
 98e67ed59e1d1-39d9bee5d69mr5499696a91.10.1789117614000; Fri, 11 Sep 2026
 02:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
 <20260907111659.263324-3-ulf.hansson@oss.qualcomm.com> <02b29827-3ca3-414b-9377-972f3d46eb03@gmail.com>
In-Reply-To: <02b29827-3ca3-414b-9377-972f3d46eb03@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 11:06:43 +0200
X-Gm-Features: AcwNN1WWtbHklmpQXJKRAIYWnaeeJF8livz9f5GEdPQsQLw78oZnmRYUG5Wxguw
Message-ID: <CAPx+jO8Cf_NGJ6h30+cd-arAJGQL=V1HayRZqaTrM-xg9eUhpg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] pmdomain: core: Allow a non-CPU device in a CPU PM
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
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa3c4af cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=u8BtVuMVLpZXKRMe:21 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=I--eTaT0OsuqKzBIU4AA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfXzaTom2e5lKA3
 UDIpE+Fj7cqzGNteYDrHj9mYx52jYLnlhM2TsWfiyB6fKi759dEukSY1wwAXgSHP3XdPEjvZO3F
 1fBtBHxYA2hEndmiPQ0FwXwRV9VPUaniLH/m9l+2dVKXqvErLCpK541CNTCQNBtsUf/cuk7AJ1f
 2e0x3wftWZ3bmPrfmltYtTEarsQ/FZ7sFX1qGqGaO4z7C30LPJQKcydiO4QKgdTC5kaxhPOeOPD
 AuqvrgXB0C54uJtHx+IB5gdbr9SE39TA9FDAPSR4tIvql5Pu8RV3IBGEYzE9YaPMI9gM0lk+Cnb
 bCZsySiPkuy6O2sFJE0sF2h6FnngUZ2xMgmmft8RMtmxi+5nDQhW86Cz6Ihi106PKca0DQTYPyH
 MZEMXr/UfxXvb62yiVXZGFvrFGGo4p49DpcRGB8MKIdUUstNaSLVoDm0czOAK1EP6xetSHipsj7
 J2xm167Lf/uu+5e55bQ==
X-Proofpoint-GUID: l9lB_hfj2vHKKxxi-qWYhcm8O3KjbXN_
X-Proofpoint-ORIG-GUID: l9lB_hfj2vHKKxxi-qWYhcm8O3KjbXN_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfX6izldoJowfvl
 OgaTnXrotaBfGY3ACPy8Ahp0Nm7KTozEBSitW/gh/G8hw4MR2ENGCrdgnFCJqVQb/ELEk/Ecp6t
 SNo6WoeV4+0PW6tr/Omb0vKEcyVshM8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_020656_359397_5609F562 
X-CRM114-Status: GOOD (  51.74  )
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

On Thu, Sep 10, 2026 at 8:31=E2=80=AFPM Dhruva G <goledhruva@gmail.com> wro=
te:
>
> On 07-09-2026 16:46, Ulf Hansson wrote:
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
> > Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> > Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> > ---
> >
> > Changes in v3:
> >       - Moved to atomic polling, pointed out by Dhruva.
>
> Thanks, but even in v3 we still have potential issues.
> It does not fully address the consequences of polling for five seconds in=
 that context,
> nor the parent-lock nesting issue.

Well, I assume we will not be polling for 5s, as it would be an error
and it means that we fail to wake up the CPU. But, I get your point,
5s is really an unnecessary long timeout.

Ideally the timeout should map towards the deepest domain idle state's
entry+exit-latency-us, but rather than looking at what is actually
available for the PM domain(s) in question, I think it's easier (and
good enough) if we just pick a common value. Usually these values are
in the range of a couple milliseconds and in some cases up to
~15-20ms. I suggest we decrease the timeout to 300ms and see how that
plays out.

Also note that, at this point I don't know of any use cases similar to
what you describe, where the device in question is in an irqsafe child
domain. Hence the polling would not be done in an atomic context at
all, so we should be safe. Anyway, if this doesn't work we would
simply have to limit the support to non irqsafe child domains.

In regards to the parent-lock nesting issue. I don't think it's a
problem as genpd_wakeup_cpu() is not being called recursively, but let
me double check this to be sure.

Kind regards
Uffe

>
> This seems to have been pointed out by this corresponding sashiko review =
as well [1]
>
> [1] https://sashiko.dev/#/patchset/20260907111659.263324-1-ulf.hansson%40=
oss.qualcomm.com
>
> >
> > Changes in v2:
> >       - Rename a function according to Abel's suggestion.
> > ---
> >  drivers/pmdomain/core.c | 80 ++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 75 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 6abe8b198949..b62d4e544bc5 100644
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
> > @@ -1026,15 +1032,75 @@ static void genpd_power_off(struct generic_pm_d=
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
> > +     ret =3D readx_poll_timeout_atomic(genpd_status_on, genpd, is_on, =
is_on,
> > +                                     GENPD_CPU_ON_POLL_PERIOD_US,
> > +                                     GENPD_CPU_ON_TIMEOUT_US);
> > +
> > +     genpd_lock(genpd);
> > +
> > +     /* Re-check the status as we have released the lock in between. *=
/
> > +     if (ret || !genpd_status_on_unlocked(genpd))
> > +             return -EAGAIN;
> > +
> > +     return 0;
> > +}
> > +
> > +static bool genpd_need_alive_cpu(struct generic_pm_domain *genpd,
> > +                              struct device *dev)
> > +{
> > +     if (!genpd_is_cpu_domain(genpd))
> > +             return false;
> > +
> > +     /* This is not for CPU devices as those are managed differently. =
*/
> > +     if (to_gpd_data(dev->power.subsys_data->domain_data)->cpu >=3D 0)
> > +             return false;
> > +
> > +     /*
> > +      * If the current CPU doesn't belong to the genpd's cpumask, we n=
eed to
> > +      * wake up one of those idle CPUs to power on the CPU domain corr=
ectly.
> > +      */
> > +     return !cpumask_test_cpu(smp_processor_id(), genpd->cpus);
> > +}
> > +
> >  /**
> >   * genpd_power_on - Restore power to a given PM domain and its parents=
.
> >   * @genpd: PM domain to power up.
> > + * @dev: The device that needs the PM domain to power on.
> >   * @depth: nesting count for lockdep.
> >   *
> >   * Restore power to @genpd and all of its parents so that it is possib=
le to
> >   * resume a device belonging to it.
> >   */
> > -static int genpd_power_on(struct generic_pm_domain *genpd, unsigned in=
t depth)
> > +static int genpd_power_on(struct generic_pm_domain *genpd, struct devi=
ce *dev,
> > +                       unsigned int depth)
> >  {
> >       struct gpd_link *link;
> >       int ret =3D 0;
> > @@ -1042,6 +1108,10 @@ static int genpd_power_on(struct generic_pm_doma=
in *genpd, unsigned int depth)
> >       if (genpd_status_on_unlocked(genpd))
> >               return 0;
> >
> > +     /* Special case for a device attached to a CPU domain. */
> > +     if (genpd_need_alive_cpu(genpd, dev))
> > +             return genpd_wakeup_cpu(genpd);
> > +
> >       /* Reflect over the entered idle-states residency for debugfs. */
> >       genpd_reflect_residency(genpd);
> >
> > @@ -1056,7 +1126,7 @@ static int genpd_power_on(struct generic_pm_domai=
n *genpd, unsigned int depth)
> >               genpd_sd_counter_inc(parent);
> >
> >               genpd_lock_nested(parent, depth + 1);
> > -             ret =3D genpd_power_on(parent, depth + 1);
> > +             ret =3D genpd_power_on(parent, dev, depth + 1);
> >               genpd_unlock(parent);
> >
> >               if (ret) {
> > @@ -1306,7 +1376,7 @@ static int genpd_runtime_resume(struct device *de=
v)
> >
> >       genpd_lock(genpd);
> >       genpd_restore_performance_state(dev, gpd_data->rpm_pstate);
> > -     ret =3D genpd_power_on(genpd, 0);
> > +     ret =3D genpd_power_on(genpd, dev, 0);
> >       genpd_unlock(genpd);
> >
> >       if (ret)
> > @@ -3410,7 +3480,7 @@ static int __genpd_dev_pm_attach(struct device *d=
ev, struct device *base_dev,
> >
> >       if (power_on) {
> >               genpd_lock(pd);
> > -             ret =3D genpd_power_on(pd, 0);
> > +             ret =3D genpd_power_on(pd, dev, 0);
> >               genpd_unlock(pd);
> >       }
> >
>


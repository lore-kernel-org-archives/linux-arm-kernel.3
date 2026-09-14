Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3993C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vu8FzaKqwvVKte6/8Xq/EhQXyU+EIfm/StcQWbop8JU=; b=3CIF1VVqOvyrB3Byli87h7NNN0
	TJvyv8VxEAdLTucox6b8B/VJEfnVwOGFKUNqVs2vIMBJFyJxupbqC/OXm8bu6r4vxSB5yEhX6AETq
	I1LDOEOe9oOU4xRC5AyCAfKqmMImOcTVDZwKFPFTzuHWlbu62yN/SbRJvR1zx/DGJQBeoSWNdwmkK
	8KlOm1oSK1i9tZEsPYey1pBKIyTbC66/+JwSspGBmGa1rwoyWwr+m7Kx8zJh8qVv9d2c26Ov3xKSU
	+aaH0IaghGsFeKcDSTmXYXj2PPF4jD8/0MbvzbYbtPQwsRdJq2WVp3avryCdBe4jLo39jfnyVS16/
	Y2m+MPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64s7-00000003Ep3-29KP;
	Mon, 14 Sep 2026 11:29:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64rz-00000003Ens-0G49
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:29:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmMJ34032528
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 11:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vu8FzaKqwvVKte6/8Xq/EhQXyU+EIfm/StcQWbop8JU=; b=caRqaS2AxVs7aeG1
	acaSpuQ2wtaqMV2Jcb1gFqnQboOUQA7+5b2IPrpYgQnnX9Zr4dkQkPJI0QaKMFnp
	DVhFHKvbuIhTAG3fC0NtC1mHIvH9NredhDP+UHMr63HmwvySYOdpXrRn7GQgwWPx
	4u14ckoPSnF26FkPNgKnP6qJB6JwIkRjd32bfjr97v6JL1W2LAVnasrkrtZzkVx4
	0sbWMGZhSmUVBgXPS4f6iAEXOc2A+pahveMCJo6mfcphbmhkrReAyjcSJNKPzWBm
	8dQ4pH6RbkAwsHkAjh0Jey6w80HXZJTpkdTydOXKsUNG/F7uYu7oOxQZm3vlaNqW
	gJhHog==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8bk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 11:29:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so4058176a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 04:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789385345; cv=none;
        d=google.com; s=arc-20260327;
        b=FEkpiDoYYGuKB/DOTFwKYLtrE0xdNx+xcA2bzrh5ThdY3O/noJTP5kzkjpjQMbsQ4e
         +wa9WtIJR1XjoxiiaCB109mH6cPufuJ0cnBRcm11RExpahI2k07W3DiFJnZwkqCRc6AE
         t7vx50WnDDUvstbBW/j05W1obb1ouUQjZOwB/dKNpPhtnrwPQS6OShIfYZcxBiog2DUi
         55RJQtMFXn/B9cH2pQtylQmX1H7tZnCaRpUKM6FpDCUqtZsz6b0gsTKNWjGCSH6Z5PHg
         MRLH49r1wDrqMCN06xdz1emjVJup42N5iJyecIfzovzoikVLVdreOUS5/wqs2XfESRS9
         /Ipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vu8FzaKqwvVKte6/8Xq/EhQXyU+EIfm/StcQWbop8JU=;
        fh=pSOig2wiW9icVNdfkbo0gW1H6QQTAT/fnGbi6OZV2uQ=;
        b=qO2r+0trWeyboswrgMIwdnzemwB0loE7KS/WDJAJmRdEhL51OUQHgklA0CyeV+I8fj
         C0gBAV7oQhokULc/oygjjqEMiQrS49NUiDlKZw7JVA848IIyg0j/xNUO2SJB6P18QmeA
         xXFdiwYfAR+cXKO2UdyfHHIb8+59iEUZFZjRdHBhWzyuIhmECIeR4+H8aZSXKUvlB99W
         0pVLEHXdeUMW8JGoZQFIOi6TB12LgDeFrAMjoQuN1KBTpJXQZiiFrQrPd4UoH/GmjV3p
         dlHb4iwBsw5zeVA+mbIYcLOH24ah5kYF0VavJ3wqSAVUbQShLkB9B5RbjS5P3GbmBCEQ
         98VQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789385345; x=1789990145; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vu8FzaKqwvVKte6/8Xq/EhQXyU+EIfm/StcQWbop8JU=;
        b=gGy4MXnslwivm32e8mH5z8bGplU+6xvSCnu1UNNKLlQFeTHqWQtT31yKhtmxL8UUBM
         NYh/pL63F5WfVqQdB3I1Uhp8xLDLs81jOV+EN8ApSHiliLE6hzBwcVVRCyvdkk+KlFFg
         6xl2RnA5vrN+TnzF8ozxz/dyqAlhL2NwBHtZQk2zyD7pbLVkqDtGuZMpLg90UXaRnh/z
         /NfHvi/dmxR39QKNqITDN7q/eOnq7VwCCJxLsnhPYkGE5dyetqenN7pKn10cR332g+VQ
         7wRf31I7U2+zv7nBesWvkx8+2yPeJk2HAL6C62WtokCVgfVOTbLPD/2j4cdbrosJRMta
         hQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385345; x=1789990145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vu8FzaKqwvVKte6/8Xq/EhQXyU+EIfm/StcQWbop8JU=;
        b=soN36L3Toal85Axrb0JFBAN+Xk0B1fQhEr9vrfg7k3fvu1u6PYpoKhn7oMyFHst17n
         EYac6QloQss44j7NdQURh3SnCzxWHr50JGMMfMfLphEa5QxA1HnJzm5uqqcV0meObMI1
         Ue1H5SpsOaBQszNcNFDwElEVLjiOHRGKM7bkumWbIH+Url9WWVK2sTCroloXsclOpNbM
         EHWbAGjD8hYgZOABIrNevL59Em7vWhDm+rntVG5a68u9+GUYnwRBX7du1NnbKKUhSWy0
         I/VYCrPmnfV/1aB0biApGvfe5ei5/dQydZoovSYwMj+w+xWWp7JWfmwmLWHxLTzZb+JQ
         indA==
X-Forwarded-Encrypted: i=1; AKwUvBz+U83YGFX6gXsQtbqCdfrahLfanSTGyZMWaf2xnPp0a7Z++OkucfZ6Gyi08EWcCAMRqdLlFYXX9vLB3E8Q4LdM@lists.infradead.org
X-Gm-Message-State: AFuF++kJDOd5ChkhgRXIPzffHMwJxlVroGGZ3dKZ0q4rYOi2OsiAhN/z
	mcy/gVLq6GpZawDaZRZk1om492Q6OS4ublKv27zCnM0QHTOmTU2Elp6+Q6iTLT9vwogrIV2BWiZ
	tM9/1h0T7wSvu+YSr6/1UvmFdUQxoLmd9j70hIOe9ApKxFLIL53D0u2dFmdVNMcb1FUOfC7/3WC
	S3RMqrV4wHHQe7qre3s19UM6YPjSLyQqLd84taUnt9qUzY06bMzrsc
X-Gm-Gg: AYBFou1cx8N+rrgQ5m3JPrIuKpl4t8OeoMGw/1rDi3jAwLSIG2C3YJH0xrtIdhxu/JV
	JXb8PiuUE84PvMTHkcQpW93l+oI1I6jAKKiO0znYIrvO6toLW3lpqQDdQz18gjGCrBPIPpWk6wt
	eiu7kwzkBaZpsYpQiUNetynU93sHq6kS1k7Ur0GurrI6YEsYEGGj1fe898UA==
X-Received: by 2002:a05:6a20:ce49:b0:3d0:cc29:ff64 with SMTP id adf61e73a8af0-3db40642804mr5427130637.15.1789385345398;
        Mon, 14 Sep 2026 04:29:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:ce49:b0:3d0:cc29:ff64 with SMTP id
 adf61e73a8af0-3db40642804mr5427033637.15.1789385344914; Mon, 14 Sep 2026
 04:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
 <20260907111659.263324-5-ulf.hansson@oss.qualcomm.com> <327e3afc-0803-4ca4-9c76-249077ab9b2e@gmail.com>
In-Reply-To: <327e3afc-0803-4ca4-9c76-249077ab9b2e@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:28:54 +0200
X-Gm-Features: AcwNN1WlCy19af4Kdfv9qzAUmpjAMUrSlWlur374POXIbZWJybPNGsXjpQRAkBg
Message-ID: <CAPx+jO9P=7i48OAjCZTRbdKgPSLvyKjXW+z3sRcNExSc3-Zd6Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] cpuidle: psci: Initialize the PM domains in
 powered off state for OSI
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2MyBTYWx0ZWRfX0Sr2eGZD9JuQ
 UR2s6VcUkGL4Xq02kp4yIjkQbYzSwo2bGA1MLMdxSjhJRdgZEtaCvmeSkm1DAJ6fGd16Q+2t/88
 9Yxc35sKV2y6NvMB2hii6rkHyrlApWnJv6AtguicPDDWSi/bs3QVKj7ptw3T0dKxA/D8UchobRv
 HzyV5E36pFa1SaPcfdRGyb9dSAZlvo4tm7YG8FXno3bXIqndEksGO+Z5pLzd73hzCUiIeZc8VyR
 DLY9d1+y/IQ6A5OF5ZcA4OB4nYBvIQyroeRY6k3ciyBiyVMtYoE+Av1/2enKOV7PEo8Ja1ocyyW
 9Ly37I2yQr3e75uJvNRsbOPljMFAZJ7XT5aFGuVWTJj8saK39wa0KThox8jHTXjj2MEg3P6DgsV
 ul4QrRYYxDSz5FdocZlczKCJVj1680aqKd0RBHc0txNirikcMBkb3TLUdqM4u5lKCyw0DcWq5Rx
 tZALy3VJuyspfHlwDTg==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7da82 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=rXashWC7mhQ_VnoTN34A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: ZMM3dBoeEX76yGKGkSOXB-7GIU5fNrFR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2MyBTYWx0ZWRfX5/dctlJ779KC
 vvOEgqBv9WVoiK7MP4A7sO+UrKIGBa+DgfFiXv2JPcI86YreqlY8MiPuSr5SRRc40BMCK07ngYf
 vOUbIYgngyumKZf2ZJGL5n973vC/hEw=
X-Proofpoint-GUID: ZMM3dBoeEX76yGKGkSOXB-7GIU5fNrFR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_042907_109206_399C376D 
X-CRM114-Status: GOOD (  42.02  )
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

On Fri, Sep 11, 2026 at 6:34=E2=80=AFPM Dhruva G <goledhruva@gmail.com> wro=
te:
>
> On 07-09-2026 16:46, Ulf Hansson wrote:
> > At the point when the PM domain and the topology are registered through=
 the
> > genpd subsystem, it's not really known whether corresponding CPUs are
> > online and thus if the PM domain should be initialized as powered on or
> > not. Instead this information becomes available when the CPU devices ge=
ts
> > attached to their respective PM domain through dt_idle_attach_cpu().
> >
> > This is a problem when using PSCI OS-initiated mode, as we may end up w=
ith
> > a PM domain that has the genpd's status indicating it to be powered on,
> > while it in fact may not be the case. In the less severe scenario, this
> > leads to selecting a shallower domain idle state for the PM domain than
> > necessary. A more critical problem is when a non-CPU device shares the =
PM
> > domain, leading to their corresponding drivers not being able to trust =
the
> > status of it.
> >
> > Let's fix these problems by initializing the state for the genpd's to b=
e
> > powered off and in the deepest possible domain idle state, when using
> > OS-initiated mode. The support for ->sync_state() is maintained by sett=
ing
> > the GENPD_FLAG_POWER_UNKNOWN for the genpds in question.
> >
> > Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> > Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc0=
23f5@oss.qualcomm.com/
> > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> > Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> > ---
> >
> > Changes in v3:
> >       - None.
> > Changes in v2:
> >       - Fix a bug in the call to pm_genpd_init().
> >
> > ---
> >  drivers/cpuidle/cpuidle-psci-domain.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cp=
uidle-psci-domain.c
> > index b9e4ad7d43a3..4d8c63d329c2 100644
> > --- a/drivers/cpuidle/cpuidle-psci-domain.c
> > +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> > @@ -68,7 +68,8 @@ static int psci_pd_init(struct device_node *np, bool =
use_osi)
> >        */
> >       if (use_osi) {
> >               pd->power_off =3D psci_pd_power_off;
> > -             pd->flags |=3D GENPD_FLAG_ACTIVE_WAKEUP;
> > +             pd->flags |=3D GENPD_FLAG_ACTIVE_WAKEUP | GENPD_FLAG_POWE=
R_UNKNOWN;
> > +             pd->state_idx =3D pd->state_count ? pd->state_count - 1 :=
 0;
> >               if (IS_ENABLED(CONFIG_PREEMPT_RT))
> >                       pd->flags |=3D GENPD_FLAG_RPM_ALWAYS_ON;
> >       } else {
> > @@ -78,7 +79,7 @@ static int psci_pd_init(struct device_node *np, bool =
use_osi)
> >       /* Use governor for CPU PM domains if it has some states to manag=
e. */
> >       pd_gov =3D pd->states ? &pm_domain_cpu_gov : NULL;
> >
> > -     ret =3D pm_genpd_init(pd, pd_gov, false);
> > +     ret =3D pm_genpd_init(pd, pd_gov, use_osi);
>
> If CONFIG_PREEMPT_RT=3Dy,
>
> psci_pd_init(use_osi=3Dtrue)
>   -> sets GENPD_FLAG_POWER_UNKNOWN
>   -> sets GENPD_FLAG_RPM_ALWAYS_ON
>   -> pm_genpd_init(..., is_off=3Dtrue)
>   -> genpd->status =3D GENPD_STATE_OFF
>   -> RPM_ALWAYS_ON + OFF is rejected (pmdomain/core.c: pm_genpd_init()
>                                       rejects an RPM_ALWAYS_ON domain who=
se initial state is OFF)
>   -> return -EINVAL
>
> Therefore, on a PREEMPT_RT platform using OSI and hierarchical PSCI domai=
ns, psci_cpuidle_domain_probe()
> should fail while initializing the first domain. The genpd providers are =
then unavailable, so
> dt_idle_attach_cpu() fails during PSCI cpuidle initialization and the dri=
ver rolls back its CPU
> registrations.
>
> I don't have a device on me to test this path, perhaps one of the QC devi=
ces + RT config
> can reproduce this?

No need to test this on HW, it's certainly a problem. I also noticed
that Sashiko pointed out this as well.

>
> Should PREEMPT_RT case instead initialize these domains as ON?

I don't think so. Instead, I think we can simply drop
GENPD_FLAG_RPM_ALWAYS_ON. The main reason to use it was mostly for
optimization reasons.

Since we don't assign psci_enter_domain_idle_state() to the
corresponding ->enter() callback for the idle states, when PREEMPT_RT
is set, this should still be fine without GENPD_FLAG_RPM_ALWAYS_ON.

I will give this a try and see how it plays out, cooking a v4.

>
> This might be safer here atleast:
>
> ret =3D pm_genpd_init(pd, pd_gov,
>                     use_osi && !IS_ENABLED(CONFIG_PREEMPT_RT));
>
> Regards,
> Dhruva

Again, thanks for reviewing!

Kind regards
Uffe


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275CDC5CFEE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 15:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UX/M98g6kcstxhb0l+BO6UEsPV+vxSMCH0MKryTplFI=; b=R1GPIIjd1MGl4cwop3JY2Xc3m/
	ZZ1QtXmi93gui0S0PVmpveMpMAgxxV979d4A9XcLD0moyRH0bhqrm8RKsZOcrEklVC1LT83XNF8ju
	JTqAwX6EkuyK4fs5PvtKjoiGGELyQeHnhSkdsXeFRaxVJAItwxvXLTB4XT+ak8vKSrybLYTCuvtou
	TGiFHiWxAGpLciHnoZdDXBRFVpYANcq95+BBAY+jA2Al8sEHYLVTDhdaCvSvYCSufIj/FO208afNI
	OnlQTlq1pb0/KuhvKCwB8euEXNvfrjwp+9Xex6v4a7+aETprxw9NAywLb7sULUUSmk541FmawCVSU
	cIGzSIGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuAyP-0000000GTMO-1bXt;
	Wed, 12 Aug 2026 15:34:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuAyC-0000000GTJx-1IUM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 15:34:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDcs5M3654848
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 15:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UX/M98g6kcstxhb0l+BO6UEsPV+vxSMCH0MKryTplFI=; b=jangk5cS9zu/cD7m
	+j8n6wlVBBPd55ggNuStVgGcN5H6+La3N96Wq+k5/c4IfcXx7/+6n8PMugoo6F25
	rrnN7adv+gWMsaqjaSfN2VVR0z6L6aDxAgnDjfDiLjHKj743h2yhRr20cexZmkQH
	1H3yipWwBHwHCfKgC3Axd5qgIkEPo+3xDku5UkCw1bWCpJMLuILQYbVi1enadwEu
	y4GSF6VBnv/eNntq0L9o8ld+NoV2AGXNZVmagYGJGf4FVzrRxwqNAKzomKbNyjXs
	1XgWIkjwEKUbp/SbfXzqWthWNo79sbVck3rtoJEveDzA4WbowgXMWqslst0fXqjb
	isycRw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0pmysdfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 15:34:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cccfa32670so15458205ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 08:34:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786548859; cv=none;
        d=google.com; s=arc-20260327;
        b=DTudQh+26H61dt7EpTnsH5niMYdMLuTRMV+SHv2ugsz18ABqSDs64x649OL4BA6EdU
         61eVU3a61pLmYTu1Qo/aAUqhb8iQbehgBlt9X1LhK3UqH+e4wEIIg1THnZzFDODPEbk6
         1F9+kY4jocgfFFzSjbAP9SdJcwbeyFLIZjPk8DdMOprXaN+GIPQtfQjfTHcDkqzHL9pE
         VCkDOfWGe6eaoe7X+yxJzR6HcnODYUjfzPE7aVHq/oaHCZwdr/cfjFLmoWPpszt1RvEf
         CRDytNCMVO7UO+6JV5r8cwOWh4P4TuFTTxdQn+u+dDvlAUB7HAC/yp7swWRlNu1auj/T
         9xNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UX/M98g6kcstxhb0l+BO6UEsPV+vxSMCH0MKryTplFI=;
        fh=Pv03C2kikTprFxVlpIeQyEFST2H4MN0xBj+H2mSE7YA=;
        b=kB8t22E911HmhZ07mj9MtG4KP4Sf9ARbZ7tqff+MEWiMHhenUH8+ncrgiDPMYjb9VU
         N+rMMdwToKg5zzS/u0NdOIXBMd6MnEw6SOkg7ltT+RmScu1KB+6gNM6md5HpAp+MpY3q
         vtfxIDdT03C3bafuGlG2vcnY20dJuxRt+jK78LMKr7GKSojZ/VhFCdZAujfTlD0YRmIV
         cdGFtOPvUikLwTn41ovOf4hxQh2mSX6tQqhgOx6wNTaHJ4AWpkJJzr52p2UnFgjhx5fX
         0xPTCssLu6D/+c9zOlpQeha0mgK1yAoRGWjwKolEP8aGLm5JmsfQZsd5D76vo/dMsezf
         IBpg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786548859; x=1787153659; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UX/M98g6kcstxhb0l+BO6UEsPV+vxSMCH0MKryTplFI=;
        b=g9/QCS/DF0RShPjqVULwb2WGVcBKnmU0DaYxjmE5IJnK86wdDbB01geXhi+tNvTECJ
         m9rw+Pb5OBNKVTfhx3vAofBNgN588/WxQShdmUwiPzaAKM6LZPFI64gR8SFqAmIcT9nR
         /LinRCIGWhdrERLKx3C9RUy9p9RjAbZWmrf0b7p/0VVsCclLZXxL75QAg3JG+810pKsU
         MHChPjBHk1Yze2USkbznAL4a4JYzR8gaF2wF8IE7xPVq/FPbEOkuRIiXBsuP1IUBS1zc
         NBigVSdEJBJa/mMUfesBGPEVUPCN4ELBL5lbO3bkrhNbGvZiVcJQEiRRPG/0UNBxJNiQ
         DVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548859; x=1787153659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UX/M98g6kcstxhb0l+BO6UEsPV+vxSMCH0MKryTplFI=;
        b=OJS7TdBip/zyxVNvZtTYMpOkqobdVflQA0ViQ1LB4CjsfD8dCKm/38DLeyy20X7rIY
         +Y2PF0UzsuX+ZkX946MCVN5qWM+cOV2ZTMaW7j1dn9+OtoWJgh3pvN9spHANTMFtHWj3
         PrjkPZHlzKfO268gAnguWlt7wzi6H7NO2bkEAw0LV5h2sBl4pQ+RpznU3eQtdEkNkIoR
         IBjkLMeE3c07PT/4IISTBEU/nR+sJaDOYz/hSwkRvPD6NHJ7jbVWON098U1pTWctLWTO
         UEZpBfrbT1ej4uhN+oLROMix9tvS94zvgWFigcGzxCnGftzmVA/ojoM6iJvqkhzd7AIA
         ky+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrZeCaRHqqy6QU8msFNzsOGvcSkQimxykYY8R3zA90/ZsgnP+b8cP40HAWBkbhTupfm6104ULu555kLgNG1Xk23@lists.infradead.org
X-Gm-Message-State: AOJu0YwKdWDuGc7q3jPG60RbAXSMleLcGC5EYspOTltvYoThGqXirK8W
	YMS43oRKfzwFeMv/VHgAXel/pek/qtPpAXqtBKCMkfAt3Ob45BK1oKnZc4ooBcXYHO/FozYGqrd
	P2MBoVfBzZG5WqPczuN104QTOR7Sks4y2Jbq0YfUFgHjF9q7Z2V1xw9B/3znWD/7z1VHCb4BWJa
	XQsa70T1ka92VtLtsXxWJ95tMBWmenqDU15P6y+s+lQBO9A5N42kYe
X-Gm-Gg: AR+sD11g+bWHjSiQgL92DzmZj+lvpjuevl9PwM84kZeTnSTGYEZLYLTC9/JPg8QlUCN
	D2CZJBAsEoASb5Zp+/p3Mpf2d1JNWufGw2oBy4ZVWEtTVXDvrErgE+JfGzmg3TU1zZoW9GGHtfQ
	jN0be3PQXCFJHkuSywQvebtQ/LxMRmqd425SWRw7GR/JFwUv8Jk4vgQw//wQ==
X-Received: by 2002:a17:902:da84:b0:2ca:6c8:abde with SMTP id d9443c01a7336-2d3455dc469mr66327005ad.18.1786548858601;
        Wed, 12 Aug 2026 08:34:18 -0700 (PDT)
X-Received: by 2002:a17:902:da84:b0:2ca:6c8:abde with SMTP id
 d9443c01a7336-2d3455dc469mr66326205ad.18.1786548858148; Wed, 12 Aug 2026
 08:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com> <20260811-domain_off_ss3-v1-1-6a0a0fc023f5@oss.qualcomm.com>
In-Reply-To: <20260811-domain_off_ss3-v1-1-6a0a0fc023f5@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 17:34:06 +0200
X-Gm-Features: AUfX_myi2ZUJDsHfRryrtjfBgvDNohz0v5dvMDAblTITfqOs1ilaSpnA82VV-8A
Message-ID: <CAPx+jO_Z6woSz_ywFjNLhvEgYyBQR89+trK+6kL6Q1aPxsWtwA@mail.gmail.com>
Subject: Re: [PATCH 1/2] cpuidle: psci: Start CPU-cluster pmdomain OFF when
 OSI is used
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyNiBTYWx0ZWRfXxWQhhDVPx4MG
 OfnIGqC69GusJvkJ+OcBiYX79cwZDWodbw45kqvKvMEXO/i0jEbW8iD3A50Yq2U9EWHU6svqIKf
 8ha8s8gEK/Og11r9IMlYg36T+xH6jPo=
X-Proofpoint-ORIG-GUID: D1jmneUlRIF5zDYm2Q8nLk53HUITnaLU
X-Authority-Analysis: v=2.4 cv=C/fZDwP+ c=1 sm=1 tr=0 ts=6a7c927b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=rNF3hdfX8ybiPTv_IDwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: D1jmneUlRIF5zDYm2Q8nLk53HUITnaLU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyNiBTYWx0ZWRfXwLvvVTra/IHl
 htDkhitOQZRBR1GUmkh/qXSzFAMNBLNB+NAe38wOd2bWD8HrWWX79PPfkW0ihygGvtEmUYjxmgT
 NpIkRMeP1tRXqpAHSO6eyLyHrbtXGujDkaQGmESp1PhPfSH7RiAICpdqlD/E3mVoOGFjPDQ5zq7
 p6eWveCR62s7ye8/zvabIvaN9IAf4MJGdJTzEmFsSf+MkHr2r/w8ZW9qphW53oseQRzAyQzvTnx
 f0J9JU5mrUOvyvBjpbeyxuhqqqak6s62n5TeiHO2lgPqOtvR+0taeDvHWnV+u6frxIS4Z4IoXpd
 uIP5iwTDdYvHNYBsArcP1SRW4ALiIQVR2m/8i6PonN8Jif6/xo07tfrWP9FPjoTMyojCVWcTX+o
 USRZpCQbkmdIUWwiwamXUHOaOpH7fj/rS5zCS1+XcCT46oEsebP18Cc3f2k+yLjYIoIkeVQDPa1
 MFMMYCpYbdmEjREYDmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_083420_372375_6AE06BC6 
X-CRM114-Status: GOOD (  34.78  )
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

On Tue, Aug 11, 2026 at 7:50=E2=80=AFAM Maulik Shah
<maulik.shah@oss.qualcomm.com> wrote:
>
> psci_pd_init() always calls pm_genpd_init() with is_off=3Dfalse, so a
> CPU-cluster pmdomain is marked ON at creation regardless of whether any
> CPU has actually powered it on yet. The pmdomain's own status tracking
> (and the power-on notifier chain fired from _genpd_power_on()) is
> therefore wrong from the outset for OSI mode.
>
> A concrete example: hamoa has 3 CPU clusters, each with 4 CPUs, under a
> single parent system-level pmdomain. Passing "maxcpus=3D4" on the kernel
> command line limits boot to the first 4 CPUs, so only cluster0 is ever
> actually powered on. Without this fix, cluster1 and cluster2 are still
> marked ON at creation regardless, since is_off is always false. Because
> none of their CPUs ever come online, neither dt_idle_attach_cpu() nor
> psci_idle_cpuhp_up() ever fires for them, so nothing subsequently

Why isn't dt_idle_attach_cpu() called for them?

If we pass "maxcpus=3D4" on the kernel command line, the
cpu_present_mask should still contain all CPUs which cpuidle-psci uses
when attaching CPU devices to their respective CPU PM domain. Or maybe
I am wrong here?

> drives those two domains to OFF - they stay marked ON for as long as
> the system runs. When cluster0's CPUs go idle and its pmdomain is
> powered off, the parent system-level pmdomain still sees cluster1 and
> cluster2 as ON and therefore never selects a system-level idle state,
> even though no CPU in those two clusters ever executed.

Doesn't genpd_provider_sync_state() get called for these domains,
allowing them to be turned off?

>
> Starting the domain OFF is safe under OSI:
>
>  - For CPUs already online by the time this driver probes,
>    dt_idle_attach_cpu() explicitly checks cpu_online() and calls
>    pm_runtime_get_sync() on the CPU's attach device, which resolves to
>    this same pmdomain and drives a real power-on immediately. This runs
>    from psci_cpuidle_probe(), a device_initcall, strictly after
>    psci_idle_init_domains()'s core_initcall has already created and
>    marked off every pmdomain, so there is no window where an online
>    CPU's domain is left off with nothing left to turn it on.
>
>  - For CPUs that come online later, psci_idle_cpuhp_up() (registered
>    via cpuhp_setup_state_nocalls(), which never invokes the callback
>    for already-online CPUs at registration time) powers the domain on
>    through the normal cpuhp AP_ONLINE path.
>
> Gate this on use_osi rather than applying it unconditionally: in
> non-OSI mode psci_pd_init() sets GENPD_FLAG_ALWAYS_ON, which
> independently blocks genpd_power_off() regardless of is_off, so the
> domain can never really be off there and marking it is_off=3Dtrue would
> be misleading noise with no effect.
>
> Fixes: a65a397f2451 ("cpuidle: psci: Add support for PM domains by using =
genpd")
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Kind regards
Uffe

> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpui=
dle-psci-domain.c
> index b9e4ad7d43a3..fab9de648b17 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -78,7 +78,19 @@ static int psci_pd_init(struct device_node *np, bool u=
se_osi)
>         /* Use governor for CPU PM domains if it has some states to manag=
e. */
>         pd_gov =3D pd->states ? &pm_domain_cpu_gov : NULL;
>
> -       ret =3D pm_genpd_init(pd, pd_gov, false);
> +       /*
> +        * Start the domain in the OFF state when OSI is in use, so that
> +        * genpd's own status tracking (and its power-on notifier chain)
> +        * reflects reality from the outset instead of reporting ON befor=
e
> +        * any CPU in the domain has actually requested it. This is safe:
> +        * dt_idle_attach_cpu() runtime-resumes the domain for every CPU
> +        * that is already online by the time this driver probes, and the
> +        * PSCI cpuidle cpuhp callbacks power it on/off for CPUs that com=
e
> +        * online/offline afterwards. When OSI isn't in use, GENPD_FLAG_A=
LWAYS_ON
> +        * above keeps the domain powered regardless of is_off, so this h=
as
> +        * no effect there.
> +        */
> +       ret =3D pm_genpd_init(pd, pd_gov, use_osi);
>         if (ret)
>                 goto free_pd_prov;
>
>
> --
> 2.43.0
>


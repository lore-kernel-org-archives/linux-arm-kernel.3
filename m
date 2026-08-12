Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FAFC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEx69xiRSRAe0xJc/Z4e3vk2TczdhrCLmrje/dy0AFE=; b=KFEVwADbp3CEssQrgBCzW1odkT
	knLMW4mwjWITxUPFS5G44OXnem06uL6len5IXZ+EPrgWa5yjwC5cnbOS0V/rHUXaQ4XylZgKSidXV
	V1wv1bac6ulFTKKtg4WRFvV5uaIfiAH36NxooqSZ+0lD++ThqfO4XjeRvRAl3yyLh9yJ5QM9hiMuo
	7dhRLeA6IN++4VgeefProOlGPRV7iEhKXiWMr1skxIKq4LeB5XBvOSyc/aMReQ198TYzAXK/30bz9
	pGh5rv5VlhE44kpPs3owktax8DFo2VDoyfPEcP7PuEdQv1a3aK42sLUgGvpHcku9FOgbXKgKzG7v2
	EG4jnESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5LU-0000000FlVt-1KH6;
	Wed, 12 Aug 2026 09:34:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5LR-0000000FlVM-1jWt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:33:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C8YRFW2934258
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 09:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zEx69xiRSRAe0xJc/Z4e3vk2TczdhrCLmrje/dy0AFE=; b=iFsEgs9Kn2SP+ADc
	UyW9spWpFNQctEnMMn4PpsmqXVyKZCc3OUPe02eFhUrZaAL6rZRURmXDYHiC3c2i
	0O8aKFIu3NlWffaJwDuUyg2rHFs8yHv9pei7b0mctZc7TOb1HwgsU3QacztK/Ltq
	FhnJl70ArFP8R1P0h7/RLq1sqVWEA6tZnxwpgjo1dKEltg3so41URrgoW8W0c6rb
	Mf2KItT8MGASwIdzJGARc94prVxEHQPPBwvyrSaVY5zcsN2X1vXOsrqNL7TJ/Jrg
	kuEQw2ckiY1vbTsQmPP/dDvrxxqAl1ps28/Or0ySMtc643+u6XuWTkxF92ppayqE
	CQng+w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08jrk5ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 09:33:56 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737f1f1e1bbso126070137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 02:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786527236; cv=none;
        d=google.com; s=arc-20260327;
        b=HxDxG3ERXVrBDQwfSFA6WiLysq6v4oQrLwfVCgE0g2/UzjihvsNUXP2v0pPhprSvJh
         qeFkYfxPBqs2vJZTTKZ4znE9ZJSd7s4YDgV8rwUyjC4NJTdEotTz+uZMSj4uCR9mMHnK
         mzGPffl0jmZ81je85j3fbqII/+xnn2ct1elKsCvYHUz5bbzKh4cpyEMMPK6pJBvmiG4D
         NefgLUH/9o5bKoLA0JHZ2skLQ6KxLexoJPK9EENgPznveeNfYIPSXux2p1fLhqUvfAvq
         qClgC+5ydwoQwNe1zKmex/p6EqYyD5SYKTMDuowPqiVc85Mck6bd9Ce1/jYgipKiXhOQ
         6bJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zEx69xiRSRAe0xJc/Z4e3vk2TczdhrCLmrje/dy0AFE=;
        fh=1U2yzaFWJlFKc2GZF7Nh9cAagCdYBicDwUvlyYp0BTM=;
        b=G3EseMg3eHziKSwuCzKaIp6yginJ5h4Vop68yPMOML88y/4KZtSWMv1w4yFWlE+CfU
         66HSqK8Uf+5IpIrIwsJAK6zk64Vg3FXIDnYYsMPUb64aRO1kfetsQMExvp+hknPhWvNh
         EqXwQc59QhTHmnnOAIrH4uUZg6v0yw5lXkRXl2zjdCp06nlcv/NSJKGnwmXEmy07m+o2
         G8VjJUrF+WJjMCKYOXe4ysE/NPmxEItC9SMkQOBKUQeRYJN3ULXBA68fOmSCXGQCFVKz
         tOfoXDcBDlOdY11KJeBjTmER/4w2cwI1CgBJvY5Wf6YBMBAqXHQAjRQoX6OHAfTKOaXp
         sHKQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786527236; x=1787132036; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zEx69xiRSRAe0xJc/Z4e3vk2TczdhrCLmrje/dy0AFE=;
        b=E/LciSBji4ZEz1F0Kt/j8UTB7OczxNQYU1JnepylEa2oIiGb7q6a5IKUqnBGZ73RW6
         9d49cmXkK4uBqLVLtwfC325bXNRGsUC3nEJ24uip7srdSulwH1jYmXznkbFm4WI/CUz2
         Bk29lcfJ53tfgGPZNHXyHVnGER/r+ijZ8uD17QnBQPAOGqY8MclBONix8aLiwbFQczdG
         S+QwxihWYlHLtSdYl0vg3pkq51dhfwueTXCeKEVuIu+9nJ7wYShzyOJd+cSuqZxZEjvj
         ehyfk70ufKuW545ylYe6WGCev5q28+2Adziyc5x0dNqt1odaXZeXskv2g8skeFL0VUDC
         i+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786527236; x=1787132036;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zEx69xiRSRAe0xJc/Z4e3vk2TczdhrCLmrje/dy0AFE=;
        b=amOofQ7C2JLnrNz/T5GEa/jD23kNs/PS4Gp4ZBnb5FBRUEmZD/zxJ+ARgcJab3VyDo
         yoGwUmTMv6Iig17O3kF/71tmpD937i+aLvgIEgzVTjM6WTN2uSDz8uFhpTDcxaG5REEQ
         Tfsdi5ZgHXKlscNKIKym8qQbzv3oOt4+DDP+jse0tBMbINxHyrL5MQftY+IuPAtIzafH
         oT9YQx5iD3yln4XzwHabdXhnKKdubpY907HmkDnf5dJaJO8rGhhsaSW+MTSb8wRMLFQa
         qDIlieeShsclwCZnXzldg6nsfxiTIALbYuS3584IM2FOCztneeB7JT7fEx1qYwxt2+bX
         CnXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGaw3q/bbYy/Xly6my3x/tksWGbwJXFi6DdHK9QCl2wF8rHVp94cuIczyqtIjS6FATsROTwOAqbIZTo6W4x3dg@lists.infradead.org
X-Gm-Message-State: AOJu0YwdhcGONOZw6QFsflCK4rmb75PT1aiQPbNBvjpnRLzbEXU5o0ud
	BJUDMACjnwBxT24dPNAqBtTDUaum0Fu4isOlsITyVarZA2rcrKXxmNM9GXCsSkrYZwHcAUT735e
	oLLAAFUKZplXzaN0kO3f3n0pnoPrxDrxD5UoR1j4pyE0CFSX0Jw6f84xtofwdHU2joCVdb5iJWu
	uLyf1LZuv5toHgQYHiz/fxqI3lF6TbOYkWNpjz5ut0WBwR+SfKipQ+
X-Gm-Gg: AR+sD11LFByFZNHad1cCTEtNQpbeOsASALNLmMiJgkY7NK+0bJMfoZzvJFkJQ7ec1dX
	K+gfHKM3TSqEaqc1EO8cG0W3iaznjBWGb3+ajI3vM59zuZZNOdyUwYipD8Df0OrUCrLgLf8KoQS
	tjIP3hRJtlCRJGWmJM0N1e7kpoapAmHgW/pNra9l304tnENXbyN4QdlmGvnRag1S1tm/rlmXeBs
	wMwfGOrDg6n0X93
X-Received: by 2002:a05:6102:94d:b0:74a:be82:73a6 with SMTP id ada2fe7eead31-76c88b5d4f3mr653461137.8.1786527235662;
        Wed, 12 Aug 2026 02:33:55 -0700 (PDT)
X-Received: by 2002:a05:6102:94d:b0:74a:be82:73a6 with SMTP id
 ada2fe7eead31-76c88b5d4f3mr653449137.8.1786527235189; Wed, 12 Aug 2026
 02:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com> <20260811-domain_off_ss3-v1-2-6a0a0fc023f5@oss.qualcomm.com>
In-Reply-To: <20260811-domain_off_ss3-v1-2-6a0a0fc023f5@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 11:33:42 +0200
X-Gm-Features: AUfX_myst2nAw5V_YUmuhaFbQdg1Mey-MuLYa2PToXnP1p5QWau0DOIrAmPhVs0
Message-ID: <CAPx+jO-FAL1asnPRwhdH3R8QZvdTnCiRG-uJh7sT7p55nqBw-A@mail.gmail.com>
Subject: Re: [PATCH 2/2] pmdomain: core: Initialize state_idx to deepest state
 for OFF domains
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
X-Proofpoint-GUID: BKDdOruqCABF75irhbkrkxa5FfFmvuK_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3NiBTYWx0ZWRfX5qYubh3nUMLA
 XvsqYzbrU699/FXkVbEaTES4CSmAkir6nL0l9PB+2YmeFzPjxpwIEmevsqiYkUwfktuZ56hsus6
 Mkjk09juXUDkW+ySjV2gR2xo++RT77w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3NiBTYWx0ZWRfX5mEUYnP8MEum
 9Xyrg+xkrbIErkcUoTrbPzPbYQn/tag2dWv5S34nYFtQljDnrRq7gici48+WX5f8vrc1qctu6M7
 LuP300V9kppoP34l23epYGAFx+eLvPwFePWrw2MV1iSaAZ8bDbPD1Q8C1gdS1BUPaCGMg9JTSnO
 AdME1gWWP1V5st43Bp1kuDnW1hRn5VeKlD64N/gbrQraOVgvI66nZ1DD0doqN1Mh631vbIAk4Uq
 R3Ln24r/DPGc7cfAJAMQNBm+3fKFVn5RssC8xKX1v1n1hMyVJ5BBD2wB4Fa8Ks+NWc+pJzefg0P
 CM6519ysGiGP1f6Y/rIEgiaj0xsVZ72tkyYUPVq21kozc7J0bFSBhG+x9rXRf9KYk/7fiNCQINg
 P9djuiRAXaGGnhVtbSaPRxCluC3MfximM96RdqPOcQSqBTHBIYUb3Y8saSXz0xyVqP3kB9LsmEa
 E7eTk9fCuUI3FtDrHEg==
X-Authority-Analysis: v=2.4 cv=Z7Dc2nRA c=1 sm=1 tr=0 ts=6a7c3e04 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=P2j-IMcOwh7rrdvbTMwA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: BKDdOruqCABF75irhbkrkxa5FfFmvuK_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_023357_462359_75BACCFA 
X-CRM114-Status: GOOD (  28.16  )
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
> pm_genpd_init() sets genpd->status from is_off but never touches state_id=
x,
> which stays at its kzalloc'd value of 0 (dt_idle_pd_alloc()) regardless o=
f
> is_off. A domain that starts OFF without ever having gone through an actu=
al
> power-off sequence is therefore left looking like it's parked at its
> shallowest idle state (state_idx=3D0) instead of its deepest one, even th=
ough
> it is fully powered down.
>
> This is visible on hamoa, where cluster0/1/2 each expose two idle states,
> CL4 (state_idx=3D0) and CL5 (state_idx=3D1, the deepest). When CPU-cluste=
r
> genpds are initialised directly into GENPD_STATE_OFF under OSI mode
> ("cpuidle: psci: Start CPU-cluster pmdomain OFF when OSI is used"),
> clusters whose CPUs are excluded at boot (e.g. maxcpus=3D4, leaving clust=
ers
> 1 and 2 untouched) never go through a power-off path, so their state_idx
> remains 0 instead of the deepest 1. debugfs reports this as "off-0",
> meaning the domain is off but parked at idle-state 0 (CL4) rather than
> "off-1", idle-state 1 (CL5):
>
> genpd_power_off() and genpd_sync_power_off() both gate parent power-off o=
n
> every child being at its deepest state index:
>
>   if (child->state_idx < child->state_count - 1)
>       return;
>
> so the parent's check treats these fully-off children as "not yet at
> deepest state" and refuses to power off, blocking the deepest system-leve=
l
> low-power mode (SS3) from ever being entered.
>
> Without this change:
>
>   $ cat .../power-domain-cpu-cluster1/current_state
>   off-0
>
>   $ cat /sys/kernel/debug/qcom_stats/apss
>   Count: 0
>   Last Entered At: 0
>   Last Exited At: 0
>   Accumulated Duration: 0
>
> Fix this at the source: when a domain is initialised OFF, set its state_i=
dx
> to its deepest state (state_count - 1) instead of leaving it at 0. This
> makes genpd's reported state consistent with reality for every is_off=3Dt=
rue
> caller of pm_genpd_init(), not just the PSCI CPU-cluster case, and requir=
es
> no special-casing in the parent power-off checks.
>
> With this change, the domain correctly reports its deepest state and SS3
> is entered normally:
>
>   $ cat .../power-domain-cpu-cluster1/current_state
>   off-1
>
>   $ cat /sys/kernel/debug/qcom_stats/apss
>   Count: 218
>   Last Entered At: 726792712
>   Last Exited At: 726950687
>   Accumulated Duration: 199888773
>
> Fixes: e7d90cfac551 ("PM: domains: Prevent power off for parent unless ch=
ild is in deepest state")
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/pmdomain/core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 842c4169e290..5d96d9eabc1f 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2409,6 +2409,8 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
>         INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
>         atomic_set(&genpd->sd_count, 0);
>         genpd->status =3D is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
> +       if (is_off && genpd->state_count)
> +               genpd->state_idx =3D genpd->state_count - 1;

Even if this is probably the most sane default value, I would prefer
to keep the flexibility.

That said, please make this change on the genpd provider driver
instead of in the core.

>         genpd_set_stay_on(genpd, is_off);
>         genpd->sync_state =3D GENPD_SYNC_STATE_OFF;
>         genpd->device_count =3D 0;
>
> --
> 2.43.0
>

Kind regards
Uffe


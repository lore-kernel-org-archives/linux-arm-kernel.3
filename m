Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C68C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 17:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxyixotCUqnv8fTWw5PhKOZA9Gio5rw0RkkCoxm8lBY=; b=0EGL6KFoMPlALMyQv7zG5pEvV2
	5qaRc2NgLlhVxkmt9iHX63i0ecVETJsvZAk2J7P4SixOOkRteCXGIv+TfvxZkNoX3EiDXPM5WRaDR
	b3X/4QS8CFNp6HGhBzyZbbHVIv8we65Kd1f/8iqED4V1tYzAnRLwM67qeleoXlEeJPCcL0+b2vptJ
	P53ACuLua6V/MVpLk1pmd2U8ZAHxd+or+MkGAgOqUL/Dhg9jx6XhGi2fP3Ktjx5NRUS9gLorem7jQ
	Zg84nRzyvcKiSopdJ2GPY1bKcwfJOCCKlrbaiNgeAdd4ORbxi+PqUquo0YL+TL1SLSZFF+0ticcJ4
	5zbHtj7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkHi-0000000AIIh-1HOd;
	Wed, 19 Aug 2026 17:41:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkHf-0000000AIHd-2ELF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 17:41:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbQ771620469
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 17:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SxyixotCUqnv8fTWw5PhKOZA
	9Gio5rw0RkkCoxm8lBY=; b=ag9/GdtPoSs274iEWAv6M8JsDOct2DyiA7f4DNXv
	h6JlJL8F5RxQR3X3pvvm7voi5Yav7ss68/gpyjSZ2hcQMxRg++2D5ACQ4QMITxrR
	j/zf+hf4llSTN8E38yxYDIyziF2VMAgQ6lDydHbBLhXS0EvB/eZBn1RX+AyRj5pO
	UffQmYPllrzp/2FEfJ3Z+6OAQZSQbOAESp2uar+6zjyMLPwZOTsuKgqtOk7l3DAh
	Gd96niK24DIWTStRkW3+0A+HbK1756VLVYBfbCFatrnXD3H3Ce0JB8lHlZ+AwrHR
	DSz8y9cBoC/1idCe5+DF+qsnqDHIpcps/tutB4JcsHx9LQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5e83s16n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 17:40:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ef13b61bcso189868985a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 10:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787161257; x=1787766057; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SxyixotCUqnv8fTWw5PhKOZA9Gio5rw0RkkCoxm8lBY=;
        b=E7k/wF0cEUCdOJK66IFNlActZogMvhhzpipLj72NOj5Wo5G60HrUuH39fsXENul3Wn
         D9k9F16axn7jdPs/gnw1oBHcYMjZsDtA1d/+U8cSEeXgu+gRSeIcIE7Eqh/CYddlgyCw
         GQdpbE2ScAmcMmV0ER28lsOefl/hMMlTrSbVOREfflLHOESO4vrz2bJPnpTla5+tPxPI
         JoKMDAimI9dOCKlwKlUZtoU57OhcGOEfYo3sDvvzIMPeLBtyI7UMX00cECODInzBalQ1
         H7XKs9VhU0PUxNrw45nQr2oNLJLLs1FGYx2J+7ip3KNwnfyMb1v41mx9D3p3v3j6YLIH
         Xi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787161257; x=1787766057;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SxyixotCUqnv8fTWw5PhKOZA9Gio5rw0RkkCoxm8lBY=;
        b=nZR2itrKxkqJWWNv6tsRnw+51klO95VaXtAZooVTqm5a5ILu+8LkHFJpoY3aS0SoNW
         cuudNQyObMn7cF0/x5b9gWzgW3o3MfuOtMN8B5BkTBvIn2O6vQl6zVpm0WQi5TOzKNp4
         KJFVMxYGwjEr5wMUWeG7V/7EyzD213BX7rc5/KKBHRTo8qeQgxSfGkWwX+kJh9QPe4Nu
         kzuqIeAScWWYz5NbN/rqDaFExrPfREh9e9I2yZougdO73DMvnWn1BWOwA2GMYvClXQQK
         iC6hylvAjPAwK0D7mY52JtCMHqea1Upp7ZJyqtmQvtC8TF+v8Euix2ygKTEvEJdp7pVN
         aY8A==
X-Forwarded-Encrypted: i=1; AHgh+RpFkP/u3LA1w+LeKTUzA/IMs7RKYt0vYMZtiQp5wHJx3rppr/xfwe6RKkCeqSD2b/BjPrW8h2KrAnzPJE6t71sv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8zqna4QQpioQjNf59cmBXaZVBlzyf71E870UxD7HgLsBS28eM
	zHFBC3RW/RJ7sxfKyrx4rT/xECn/H8PgCJDAG1nEFt/TpgcqKcbTjH86/+6pGGunApkKdGnINPI
	Xa55t9lwfoO+nJif0hFc4ndXxklEbBxl/WzZw4o8I8WEHCQnFdEJ2fnkvIysAOSvYZxWt+KZ20l
	PBKA==
X-Gm-Gg: AR+sD13vbkW5m0rsMcxwlcsDUTnBQXeGrVn/bakIueX0Q6VTm4j5dPMqONr8kbD6yob
	4jYS5wp31nFHUkKjC6YSx60zSaii6KOChgaEe09Lh/y5e2g+D673+Qm9SK6EEuNf8f45tDo2+WR
	VrPm+Ec4fqWAxCz1GvhjJRaJxsaGz/Ng628Dcec92ab200b/qDBfv5Z4YsEd53m9gedzrojjcLm
	ztj7s4Rcxo0ahOThgkB1DNJV2WiS8jPyFLt17o+ZKG6ziXQXqEtGh56HTRjRnu1mkg22NPN2IZi
	FEg+GXWHY3uy2Ss7nn93y8sO4G7DGdQjPHf/mLZ5/w/6qvlsoCSdFL/WDn2o/GbC1gLvEiCGlHH
	X9USeT7VckyQ/KEY=
X-Received: by 2002:a05:620a:6884:b0:92e:b289:8cca with SMTP id af79cd13be357-9371e637291mr695802085a.44.1787161256962;
        Wed, 19 Aug 2026 10:40:56 -0700 (PDT)
X-Received: by 2002:a05:620a:6884:b0:92e:b289:8cca with SMTP id af79cd13be357-9371e637291mr695795685a.44.1787161256406;
        Wed, 19 Aug 2026 10:40:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441748sm7196819f8f.8.2026.08.19.10.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 10:40:55 -0700 (PDT)
Date: Wed, 19 Aug 2026 20:40:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
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
Subject: Re: [RFC PATCH 2/3] pmdomain: core: Add a genpd config to support
 unknown initial status
Message-ID: <yuowf7hfnhcizjgxglfypsqbf7oavh3jywbls5mdbuyc5rglmn@ejp2tahonk6r>
References: <20260819151457.256959-1-ulf.hansson@oss.qualcomm.com>
 <20260819151457.256959-3-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819151457.256959-3-ulf.hansson@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzNiBTYWx0ZWRfX4qhYD+7hg+n5
 EnAvM9US0W/PROEAuJc8QZE/7y3+IebwH8BA+vY8jJgTdVLjPpZsgb/P/gJr9Jv5s2Rcu207sRP
 ux4eaoEfTxfrlIRvmSC3UdMvS4bD2ag=
X-Proofpoint-GUID: 4oEdAtWm-lDrIqYtijppd2cYbRwBgAZT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzNiBTYWx0ZWRfX1JzaFj/xyaXp
 3PrH2lnGIaBMr9Vgk8OhZVJjKM+ZnClr6yAHYaI0AVEksAcgSWUmOKB+wSjjR1iDC/fRXDlA0sd
 hn0MKklm9LK8Hq9anC2E+HJeyxBEUm+/JBLgKLsrQQukbc6v8AKHbYiR1cvduuIm3goD1KMdhcr
 gScAZO+Ox1vDN9H9GRCJotWu+B4kA0+wcH2aHrFftD/hh0wcyGH/ZAF7LsRP0YGRtmtvtrTo2a7
 ktpqm6mgPp1MweTA7bWNVLcvJMVYr5xlB8Mvyf4DbDpZWzpQ19EFVdDd7FLtElW5+CMDD19WeNw
 otqQk8GfTUC2zASKJ4/2FVQ7L4jRDR15RsyMbgdkdu5/0rIi+MlpPGrPl9xb6HTROsEx2SH9lif
 rta1TrZ18/x2sJGXXaY0Esfc9fV+LU5lGd0wggjGpZjQCDcjJJbfRCmuyuHyiQVQDZmK9+ybw02
 NcACinxvEM4QBk6I82w==
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a85eaaa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Cb7zu-ASHT091ChWOAwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 4oEdAtWm-lDrIqYtijppd2cYbRwBgAZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_104103_582409_9777153E 
X-CRM114-Status: GOOD (  33.87  )
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

On 26-08-19 17:14:52, Ulf Hansson wrote:
> From: Ulf Hansson <ulfh@kernel.org>
> 
> It's not always possible for a genpd provider to know the initial status
> for its corresponding PM domain(s). To register the PM domain in a safe
> state, the genpd provider driver may therefore have to initialize the
> genpd's status to be powered off, as a way to prevent the PM domain from
> being used when it actually could be powered off.
> 
> In these cases we may end up to power on a PM domain through the genpd
> subsystem, while from the HW point of view it may already be powered on.
> Under these circumstances, it may also be required to keep the PM domain
> powered on until all the consumer devices have been probed. In other words,
> until the ->sync_state() callback for the genpd provider in question have
> been called.
> 
> To support this behaviour for a genpd provider, let's introduce a new genpd
> configuration, GENPD_FLAG_OFF_STAY_ON.
> 
> Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com/
> Signed-off-by: Ulf Hansson <ulfh@kernel.org>
> ---
>  drivers/pmdomain/core.c   | 6 +++++-
>  include/linux/pm_domain.h | 9 +++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 7345c06f1d55..be4fff2f4664 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -189,6 +189,7 @@ static const struct genpd_lock_ops genpd_raw_spin_ops = {
>  #define genpd_is_dev_name_fw(genpd)	(genpd->flags & GENPD_FLAG_DEV_NAME_FW)
>  #define genpd_is_no_sync_state(genpd)	(genpd->flags & GENPD_FLAG_NO_SYNC_STATE)
>  #define genpd_is_no_stay_on(genpd)	(genpd->flags & GENPD_FLAG_NO_STAY_ON)
> +#define genpd_is_off_stay_on(genpd)	(genpd->flags & GENPD_FLAG_OFF_STAY_ON)

Maybe genpd_is_state_unknown ?

>  
>  static inline bool irq_safe_dev_in_sleep_domain(struct device *dev,
>  		const struct generic_pm_domain *genpd)
> @@ -2445,7 +2446,10 @@ static void genpd_lock_init(struct generic_pm_domain *genpd)
>  #ifdef CONFIG_PM_GENERIC_DOMAINS_OF
>  static void genpd_set_stay_on(struct generic_pm_domain *genpd, bool is_off)
>  {
> -	genpd->stay_on = !genpd_is_no_stay_on(genpd) && !is_off;
> +	if (genpd_is_off_stay_on(genpd))
> +		genpd->stay_on = is_off;
> +	else
> +		genpd->stay_on = !genpd_is_no_stay_on(genpd) && !is_off;
>  }
>  #else
>  static void genpd_set_stay_on(struct generic_pm_domain *genpd, bool is_off)
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index f925614aebdb..9929347e1d7f 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -121,6 +121,14 @@ struct dev_pm_domain_list {
>   *				powered-off until the ->sync_state() callback is
>   *				invoked. This flag informs genpd to allow a
>   *				power-off without waiting for ->sync_state().
> + *
> + * GENPD_FLAG_OFF_STAY_ON:	Use this flag to inform	genpd that its initial
> + *				status for the PM domain is set to powered off,
> + *				which may not correctly reflect the state of the
> + *				HW, as it's unknown. If the PM domain becomes
> + *				powered on during boot, genpd will prevent it
> + *				from being powered off until the ->sync_state
> + *				callback is invoked for it.

Maybe GENPD_FLAG_STATE_UNKNOWN ?

Or probably it would be better to just add a new state to the gpd_status
enum, like GENPD_STATE_UNKNOWN.

>   */
>  #define GENPD_FLAG_PM_CLK	 (1U << 0)
>  #define GENPD_FLAG_IRQ_SAFE	 (1U << 1)
> @@ -133,6 +141,7 @@ struct dev_pm_domain_list {
>  #define GENPD_FLAG_DEV_NAME_FW	 (1U << 8)
>  #define GENPD_FLAG_NO_SYNC_STATE (1U << 9)
>  #define GENPD_FLAG_NO_STAY_ON	 (1U << 10)
> +#define GENPD_FLAG_OFF_STAY_ON	 (1U << 11)
>  
>  enum gpd_status {
>  	GENPD_STATE_ON = 0,	/* PM domain is on */
> -- 
> 2.43.0
> 


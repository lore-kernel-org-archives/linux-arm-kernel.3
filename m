Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D4DC624CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 11:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6JiqLVIKwcrWqWIh9PGanD5SoJcpxSHH3ZfyxSSvuk=; b=DZMTQZPOSaWdPWv5fQ0dfKA+zx
	qijNMKL6TmrQlYO1o8tTh/gR+1rJ9xPA4gxawdO/Gg6kFF81wCI5U6B0/jJeY+EEwmLfAimtSlDNc
	2S1w8jxHUDwbyucI5K1V233xOQC3krazrQ0lW3olGJj9drQiPA7hRQBNSOjVr09iGLCQBiC79dzfQ
	ZQABRXW+EdyyS940j06wK3fZYTzHSP45TifFF/q9D6ENXtKd9DVRmXVaC7WGbj0MsnS6WQCbF6kMs
	b6bFz6tW+BRk0U7EUWvgBZ+rSgwF0MxAsyp1xz3HkLodPjLjjPE9fzaXPBZZ/LdB3BJ+SS4BpMhVG
	J1g7yLkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MkN-0000000BhIF-1ReI;
	Tue, 01 Sep 2026 11:33:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MkL-0000000BhHk-00xv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 11:33:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJX5Q1137380
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 11:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6JiqLVIKwcrWqWIh9PGanD5SoJcpxSHH3ZfyxSSvuk=; b=CH7B/SyVwOMv/qdY
	AGJIJE05vndzFXl4sW0cx3haeqXZKbeYHjbF51huewfiqApyC1Uy//LuQt24yHzx
	FHs9InwipUZqpds17mkVmuer3WVsQw85cHUJd0QRq81ROTnSKYLsjuDs3gK3J0NL
	lnYtO2PsCX1BN70fgcWoonzYaJWzQw6IkJDPa6EkJGtFd4gNa5DO3x2xJ0SzIu/L
	3xe8faebpbZuImf89hhXBU93NppsJCNK115z3GUijqyb/fLWsv6L8sJqBAyX2Wci
	eR2b5+Xhr72QRxLq412tqGH9EPYHSXAKHf+JeW/xDwDq2h1T5T9ffkltopZk+FNN
	R5ZigA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcshkhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 11:33:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf1c86963bso9674545ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 04:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788262423; cv=none;
        d=google.com; s=arc-20260327;
        b=PYAjD26kAWAUxKGKW1vrdq8Qb0phe8iTj/KPPCOJZ2QXDfoCQ0TDA0ecHeBg59PX4O
         sx44m9GAQ24ApLlAIsGNhkRoEBIEg+LD7Su5GPatSAnSA50GQ1mvBP/OefZ3KT2uw9vh
         betcYaCWmPpTHvUenPGrCiWNZHdEOqp9U/9Hkgx1xvWE0mD0xIfDIMz8jdLK2ms0iin5
         ofh6kNCZtRYD5L2ndEB0rM02oLKkhWyuHUVvSaSitdKtMBIxK5SfHkTa/tz3Cq3BDUTU
         kWktgFqcC0dSfFz+3KVrjOhlNkgMjjrBjkxpjhblqq+HeMu4MJt1qKNvV5WgwYjdahO0
         jg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V6JiqLVIKwcrWqWIh9PGanD5SoJcpxSHH3ZfyxSSvuk=;
        fh=TTtlB7QPOe0QDSNzh3l7250jzPLho5FTsdzsbxlbIQE=;
        b=g6lWnXvmEbD0i5GwwzxxG1AYAp57dj4TPnrWbW8ceZye2SIxA5ppEmkdN6Bs1ey1BG
         WgTkBoHTTFvZ8I8ok90L2PwjH0nQpQCLQXxbWgPEhINvv9IJnaQzp6kYlJBzSYLriakJ
         RFa5+11O7x5v6skreJr0czki5flt4Xb7olNAkH7RiEDAyWGoQx74b8lSaZR100AP2lxK
         djLcGN6X/O49Tkjgc+HmZKgUGEnPOpl5FV5iI9YFgnue/T78RTF/SWyViigxy7nCAzxU
         +JgF6AdyLbZsStQfV8oTjS3M3sq7sM3QINPdWyl69JO7aQrzPLHAYMwyqluTBysP30Fk
         ZEKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788262423; x=1788867223; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V6JiqLVIKwcrWqWIh9PGanD5SoJcpxSHH3ZfyxSSvuk=;
        b=UtngicLHzl3g6TZlElCvkS3GcxPVzY0OGGNIiSwakqXnCt2CpVH9cgv40EA9pgP/ii
         xtAZU85ycp1RsiYEFKInRgOO8kUMWI5cGlN23r1Tjy5Iw7k7gLbu0hwwBcltrDYw8Gm8
         +HjeRNlu9f0PPxvZq0ZuOxdB9H/iAPpnAF22tsEBNtZ4OwiOvnkPBYkYvp72dSI9YGMr
         t3qeGqdL7pqpB+fRfxhZzeas7Rn79oN96ch5knYkM8RZg9eagwhixol04VJIcXWcLWoX
         0nLwkOQ7783wZHqxSGB6RdgwOq0f3ika5EdGVsI+7fKzHRlJhukR5/nnDuk+RfPFg1rI
         y1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788262423; x=1788867223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6JiqLVIKwcrWqWIh9PGanD5SoJcpxSHH3ZfyxSSvuk=;
        b=DjACTyBGSnT5enTxCabKXBCojlRJ1QRbhrwk9y1QJOnBuEKeriHelAJLP43tCHlx8F
         9VEZsLaafvch9FEaq+JJoPF8fRp9ysX50l6GLtrbKfZz8hFBEYvsBAe6HZEo0r3cHyqv
         RE+hGn5b7Vmbx06m9D0ZW2xlA7SZY8+B+xyoOgaKZ8d/m1BDo5Ake2CvO5IZ0eOAxyus
         2/m8FUDN5q2Ay+Z7YetYEgANzXxJ/jnypEdfwV4EffigLhxEC9/v/GqxKM/YW1/khC9y
         JhPEbfUjM+tqIUyeSKTk2gLefc/hm8zYpbeLpYCSFgBRFi9GXw7usI3Zct/5IuTr7wSR
         qFRg==
X-Forwarded-Encrypted: i=1; AKwUvBytzervUgCXL4Dmn0IV3xMnKD9oHa9pWC185b9nCzMwyJKxkzP021NuJCMJIboSaWGUp6DynYGqE2fKW0kBjH00@lists.infradead.org
X-Gm-Message-State: AFuF++k/O+GEeMSnKuH4qTjlqLjAc602AqU/SpUWv9AzCyT48zoJWKgJ
	e/tdh15XXEGyFJHwz2ggswwBWtsnjl912R2MxjjZ6KV/EJjd0Z7p8CIuVlCBrIR1ZE64Y/1Zixe
	ME/FOIstr1mL2Bn/nMyY5GHUmOQHA60zgt4Aipv6WoSHyX2bF8mQ6OK09UGZYB912VAPVDMumil
	1OjZNwF/fKe+sAGvyCc2Sys2kwksmACl8n1/427qgkiKz5j12FlmkF
X-Gm-Gg: AYBFou1J74IlbhEpXMsIHVJUf1YNGpUlHraWKkXU86rBET2ol95EDfBegJZmF3hPknj
	BotjN07MlBBuYgKsKHiyMPx8OvKGxdJ1o/M5cvOdXKhJm2uf2p1NFjXE8lHIpTgdasYoQgrol50
	NJsvJl8lg/ecu6eMGY7jQX/dP81Yd5vqXvbWLmrHEbKdXVyU6PHhpzhWAmrA==
X-Received: by 2002:a17:902:d2c4:b0:2d8:d4d2:d135 with SMTP id d9443c01a7336-2d952845317mr45504535ad.17.1788262423270;
        Tue, 01 Sep 2026 04:33:43 -0700 (PDT)
X-Received: by 2002:a17:902:d2c4:b0:2d8:d4d2:d135 with SMTP id
 d9443c01a7336-2d952845317mr45504165ad.17.1788262422831; Tue, 01 Sep 2026
 04:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260831-topic-lpm-psci-domain-callbacks-v1-1-4a47d95c9c79@baylibre.com>
In-Reply-To: <20260831-topic-lpm-psci-domain-callbacks-v1-1-4a47d95c9c79@baylibre.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 13:33:31 +0200
X-Gm-Features: AcwNN1VtZoA1_YSarl9l5fAeELnFtcgDxJxCO3oJ3BzWm6vuhhyYMYT4SOZL0-0
Message-ID: <CAPx+jO85NBZq=YCxhs5Fbo5rDZ7pGHHKiG2HRJUNVKj_1SOscg@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: psci: Assign domain callbacks to all CPU idle states
To: "Kevin Hilman (TI)" <khilman@baylibre.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Scaria Kochidanadu <s-kochidanadu@ti.com>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwMiBTYWx0ZWRfXwspwjwKubkWA
 +wCzjnT/pudCPfDhPHXJeYiIEVglGG8I0fjeypnB80tAGmjzbOwGs19dlDqYO5t2DDdpj1Uf5xk
 As4C7lKKWinLh3Fn7QxnTC8NB5PE6jE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwMiBTYWx0ZWRfX6jAyBaevxLjg
 Vltk9SrXt8s1XI/m/gNsTMfI6Bo1Tk0QfAlnVVXyabLYPHW6eQDdIYES4MpN+vPSp3kNrc26J5k
 HNUZ5PV7dnswnxhzwHFlfXF6MFzqzarCg9ZDbKvs3Mi8GuznooQt+hV0yvgdAsiJ8rzdUSyVC1Y
 Sip7XFKwLh8y5Q++0O3AwawscgKBizT2UxRvHZWwKzKO2WGjA20ADzr13cSE04/+vi0YhY9SKmM
 GVUsR6t5S3MKVCfT0EDvHxKneX0YxonT1rDrklFaHKdEmv2Kzrlq3eEPaq6jq2fT+9QBtRuru2j
 UTXr4gxwEpEwZi3zuAJzwQdOIYglEEcy2A6sUwjrfb0vWkwH+CRxDdNZXpX3Gp2K78EpJM5A5P7
 jazSDwUHCwwSr2I+O3rV2toSVDzlg6GZj9aTJ1A64DjNVCPKiwOjMmVYgiDIYS6Xdv+tjtdBOS1
 D7blxlEJf9uFKXdpXmA==
X-Proofpoint-GUID: tSm-xP-m4DfuoDlF6AgwyNkgXrbkqDsX
X-Proofpoint-ORIG-GUID: tSm-xP-m4DfuoDlF6AgwyNkgXrbkqDsX
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96b817 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=IpJZQVW2AAAA:8 a=sozttTNsAAAA:8
 a=nffbhwOHn8sc9RhtvssA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_043345_265948_00F9C87E 
X-CRM114-Status: GOOD (  34.28  )
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

On Mon, Aug 31, 2026 at 8:52=E2=80=AFPM Kevin Hilman (TI) <khilman@baylibre=
.com> wrote:
>
> Previously, only the deepest CPU idle state had its enter and
> enter_s2idle callbacks set to the domain-aware implementations. This
> meant that if a QoS latency constraint excluded the deepest state during
> s2idle, find_deepest_state() would find no state with enter_s2idle set
> and skip the domain idle path entirely. Similarly, during normal runtime
> idle, shallower CPU idle states could not trigger cluster-level domain
> idle states.
>
> Assign both enter_s2idle and enter (non-PREEMPT_RT) to all non-WFI CPU
> idle states so that the domain-idle-state logic is triggered regardless
> of which CPU idle state is selected. The genpd governor remains
> responsible for honouring domain-level latency constraints independently.
>
> The enter_s2idle path uses dev_pm_genpd_suspend() which is safe on
> PREEMPT_RT. The enter path uses pm_runtime_put_sync_suspend() which may
> sleep and is therefore still excluded on PREEMPT_RT.
>
> Suggested-by: Scaria Kochidanadu <s-kochidanadu@ti.com>
> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
> ---
>  drivers/cpuidle/cpuidle-psci.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psc=
i.c
> index dcf20ea5ef5e..db9aa57c51f5 100644
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -250,6 +250,8 @@ static int psci_dt_cpu_init_topology(struct cpuidle_d=
river *drv,
>                                      struct psci_cpuidle_data *data,
>                                      unsigned int state_count, int cpu)
>  {
> +       int i;
> +
>         /* Currently limit the hierarchical topology to be used in OSI mo=
de. */
>         if (!psci_has_osi_support())
>                 return 0;
> @@ -261,14 +263,22 @@ static int psci_dt_cpu_init_topology(struct cpuidle=
_driver *drv,
>         psci_cpuidle_use_syscore =3D true;
>
>         /*
> -        * Using the deepest state for the CPU to trigger a potential sel=
ection
> -        * of a shared state for the domain, assumes the domain states ar=
e all
> -        * deeper states. On PREEMPT_RT the hierarchical topology is limi=
ted to
> -        * s2ram and s2idle.
> +        * Assign the domain-aware callbacks to all CPU idle states so th=
at the
> +        * domain-idle-state logic is triggered regardless of which CPU i=
dle
> +        * state is selected.
> +        *
> +        * For s2idle, enter_s2idle uses dev_pm_genpd_suspend() which is =
safe
> +        * on PREEMPT_RT. find_deepest_state() will pick the deepest stat=
e
> +        * whose exit latency fits within the active QoS constraint.
> +        *
> +        * For the normal idle path, enter uses pm_runtime_put_sync_suspe=
nd()
> +        * which may sleep and is therefore not used on PREEMPT_RT.
>          */
> -       drv->states[state_count - 1].enter_s2idle =3D psci_enter_s2idle_d=
omain_idle_state;
> -       if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> -               drv->states[state_count - 1].enter =3D psci_enter_domain_=
idle_state;
> +       for (i =3D 1; i < state_count; i++) {
> +               drv->states[i].enter_s2idle =3D psci_enter_s2idle_domain_=
idle_state;
> +               if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> +                       drv->states[i].enter =3D psci_enter_domain_idle_s=
tate;
> +       }

This breaks the current contract for genpd when it tries to select a
domain idle state for a group of CPUs that shares the same PM domain.

In principle, if the CPU has a clock gating state (shallow) and a
power collapse state (deep), it would be sufficient for the CPU to be
in the clock gating state, while allowing the cluster PM domain
(through genpd) to enter a domain idle state that corresponds to a
power collapse state. Depending on the platform of course.

On the platform you are working, is there a clock gating state (or
similar) on the cluster PM domain, which is allowed to be entered when
the corresponding CPUs are in the similar state?

>
>         return 0;
>  }
>
> ---
> base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
> change-id: 20260831-topic-lpm-psci-domain-callbacks-a8af0cd7df35
>
> Best regards,
> --
> Kevin Hilman (TI) <khilman@baylibre.com>
>

Kind regards
Uffe


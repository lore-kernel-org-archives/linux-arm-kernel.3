Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0972EC54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 10:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HW7nK91TFv9fL78pEO66gVW1LSmg7sz4PPMdk8VtV1E=; b=plR4P1CTpNNQ67W9YXd6tGesKj
	8kr10NnUKs+cRciJdwvpyzkpf9SgJLqV87muVb7cLb7P2nwKcY7q5VkAxW3V88hWIoremlc63j4Gt
	P+p9eGAqZlaoy+L31bLZcNbXmAtXz6WUJemuJnY2OPPSoJMWe8q/1bPSAwgx9x2dwyrTGEO+3kHCY
	qtSqMB6cGefDEKwAh0SNACbomxh+C+GBGjcmRqVU+HmwjpAe9VR5/A3kJSa4TwZXmaUhRFOUS7lsk
	gTBy/H0xfKAGfNapJCI7OMEJuw29weRQoMWxCNPE2xMegO06QL+HEveiedbyCffFC8SOp3Yqmtyqk
	L/4Y1K7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wof6d-00000004yFi-21E8;
	Tue, 28 Jul 2026 10:32:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wof6a-00000004yFB-3pOO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 10:32:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82Dha2358857
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 10:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HW7nK91TFv9fL78pEO66gVW1LSmg7sz4PPMdk8VtV1E=; b=HmkCQTI1v8O5o2wC
	UkT2ZsPDXdjoUqMnhp5DtTNZ+f9mApVcNX+kZgBFeE6J6QzGikSFIClPUNyLJm61
	PepCa5fsUZSgB7x26Q5mc2MXlI2RSZBN10nzactmj5qs0Vxm1Hj0kGG6QWME7tdk
	p4ElGhP1X1c0/wmjvLhMHc6+joHIqkpRfdSQy9hjTgJowKSoJidSfZRdw17SjoIm
	a6PtLyn1tttHEM/S9r2dFSlr521PstOJzaSLeqE/qRQ/YfSmFTNwFRUEwJcYtmP8
	+aS78gTFvg4Hx55ZcdX2hbNsIvYclgbMVSk2jtnHKl6Wdpige6rwhGh9gMSO3RVh
	viRn8Q==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn3y1fnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 10:32:10 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81eb7dc4e28so103974137b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 03:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785234730; cv=none;
        d=google.com; s=arc-20260327;
        b=bU7ApbtMLtR2v3ZhXbMwWGtX2l8t0VwJL43XvtJZf3BnkIGuChx2R4HPOKERFB+HPu
         oCOcvieyOkiipsQG6B18WEgxL8Cv9YlQ/PSI/jByTX2TRuznWoBoueF746jcbMR1A94J
         QiKrU8ATLANNy59skmuP59TukcYAJArqIhWSRr12Mz1HRw5sykGLxfGw/RPqEdpS4mCM
         yiK4LMp2t10y1OZO6njHYZJwD/e4HQoLn2iaE59WV8K+g4qnm/NXoqsuCjbM3gu0Eoun
         4C4LC6mv6W58Dtkb/a6qd0lQkgghQbOgUJNkwbVB7E9R8iCiFZl7a+daMvhR/3wDn3By
         4m0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HW7nK91TFv9fL78pEO66gVW1LSmg7sz4PPMdk8VtV1E=;
        fh=Mf0nYXoqBfya4pjwcrCJfgNRSU42PsFCA4UikfWQ0Ps=;
        b=o7yM9MX5hsbK0TZAd2zJg2znqWMFs7f10t35Fg8bL4x+XiYPYtDrUoivFlU2LjoV77
         syQQqZLff6Z42JfW63gpRn3ctfXxlDvJUw6PCg6CH7LHdLoTlGW+q0P/jnDz8QN6weQK
         YU7802gu8AZuxbgw5clT6kdo4WUuuS923MMD3mQ7sg8CL+YS/WZw99ujzJdq89OknvnE
         LlL9G23zfzqQ6l5Mdi/6lWNV+gDIsCAmM+0sopfNrx6O1yKN4BYq+Jfh1G9LVdruJ8fe
         w8llRCJ1QNVdakA5TQOwzgSwJ+28oqaARJ18Mry5zDWRd4EitFvj9XSfcPd3rUnomuMW
         8NLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234730; x=1785839530; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HW7nK91TFv9fL78pEO66gVW1LSmg7sz4PPMdk8VtV1E=;
        b=VzneFHcXxlPxJhgMD3MDiAmYDUIzy99djy/4tVTUCDGhaMj/58YbdyoHA1Eq05xBjZ
         HuiLkZWW1WVn0bv2G2RlfckPG1y/Iq4AKDmo529+Qd+o45g1a+kF9CfTkHfX21Q33jRD
         qJvhJeF/jgQx5VohMlX9WExBAUgoM0foFht276N6o5zVM00sLvQi5DhDa/DkDOt5mOr8
         pBwqRMUsSrazLbB8qFDfybWi1Xu7gJYQHd94hRf16w6dhTFA0daValgSupAy7Ic1H4BD
         oXlKvjtdPpOED8ejQnikcwBcwGXQWWVVWmqOOIykIB/27FQQfDNGkNmpHz8vMNCJYh8m
         QD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234730; x=1785839530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HW7nK91TFv9fL78pEO66gVW1LSmg7sz4PPMdk8VtV1E=;
        b=M37zfrS7Ak4YYEWWrAR4aO2jKQFXGCblbOM5AyDe6aB/ucSETws5BZxQUNWyiPv0lm
         akfcXrejAXtu7VZnp20xo3EgK6zDtY3rv/JwHVDCKvxuXlvNNw3cKv78aLWbMugnV2rL
         ZZYo1ucWt6xtl8Ol0OlxREWFLbdpM8d6ExiY1/MJ4hs1ddGIPcLH7T+JoKU6aic1PMSS
         zWzwPA0LfELZDocX3rjhO0JYBSRaf8uNKa0P/zEm8gO6Knziasvo2vgJEa2DA7Mi2NTC
         CVllJlL+rDqTUAuLYsicc7uEPoeEHuIWH8ndwQPs3sEFnWPX6Gqu9tFWPdKipDB1uMjX
         w95w==
X-Forwarded-Encrypted: i=1; AHgh+RpGAR2qkxOm28coX3y5WFnN2iMypj+b046BCDZx+nVZPkQMfPPy7lrPwAxZmAT385D8R6uVcNK5BKthhBWVNXwl@lists.infradead.org
X-Gm-Message-State: AOJu0YwBwx8oe3eXYPG7dVJj4uSVWBG2VX+cOrtfJJI75bMX7u59H6Jq
	MKDGemnsNplC0MjfcBo0neKmHY/f5owbSNPJjoxHojhsVJxE+3HjxvRQEot7zkJKw69cVdXVQXR
	0T+ytdPJ5CWYUjZsdwKdHnS9qEZ17gKn+lBBd03HWLsCugDjpfUxM3c/HExYDtKlulXJaQxe+DY
	ysWuL+HWiC3hgwehcf1QoAKtZvaxR5udlyNhuN5q5Ad6Mei5A4J+br
X-Gm-Gg: AR+sD10Lqz8lgukZxTwP1rgJSHTiV2pVLmYH2mdrcymlIIbAkibpmUaaCmTBPxYOcVc
	slhEmr6HskFbnvICmTQYFchRqDNfnyLG+8E5stqFD06/gVXSs2UsTrGWDRi/FFYDpUtbC5ibfeb
	Xwo9+7jOXRiAB3Iwhfg1gEYraNY81OPJIEgMzuwgqf9rAxGV1uFLi6bsXzeQ==
X-Received: by 2002:a05:690c:a98:b0:80c:85e5:875e with SMTP id 00721157ae682-81f9942cbb0mr7432667b3.71.1785234730028;
        Tue, 28 Jul 2026 03:32:10 -0700 (PDT)
X-Received: by 2002:a05:690c:a98:b0:80c:85e5:875e with SMTP id
 00721157ae682-81f9942cbb0mr7432467b3.71.1785234729554; Tue, 28 Jul 2026
 03:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
 <akfHIH_dZrr5bosu@J2N7QTR9R3> <f2d4b312-4a11-425e-8329-33838ed37d15@oss.qualcomm.com>
 <al9uRagYJSQPJr7_@J2N7QTR9R3.cambridge.arm.com> <20260721-wandering-romantic-buffalo-ebbc4f@sudeepholla>
In-Reply-To: <20260721-wandering-romantic-buffalo-ebbc4f@sudeepholla>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 12:31:57 +0200
X-Gm-Features: AUfX_mx4FYBv0CDzLfSFCClFXJjPNUK_fqBRZnaSA4S674r4_XuDaeJlCBcbxE8
Message-ID: <CAPx+jO-t1fRrS=-ufM11DAchi4uAki6mnnkJ+qh=M1G-qs4c=g@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: Disallow disabling boot CPU based on config
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=fbidDUQF c=1 sm=1 tr=0 ts=6a68852a cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=Th27373rO5TmSeHawX8A:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MiBTYWx0ZWRfX7SfAoE/9QmrI
 t5iOY1PvRN6eMCfqUO7aXhRxQ1JaiLLeuIDfPnk8gkowMRE+uXcYDKineKzmasNm7mTdQvsQgv2
 9UrT0iK4O4zWaLWxBSkYkk8f5H6qi+w=
X-Proofpoint-ORIG-GUID: ZN-FzfHB-Kch-noVvvFDFff-sIURFr87
X-Proofpoint-GUID: ZN-FzfHB-Kch-noVvvFDFff-sIURFr87
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MiBTYWx0ZWRfX75MNrefXdDv1
 2qM8bFeGOQyM7OW6REdu9MucUAVi9cUnIm85cyVxnFr2UQ5qZE55AkjUmYi525OpFKu79Wf5tvC
 06VS8N1qdu+kPdXEY4HoZz/nHGv2PMg88+IARO3imtztDrIyESjW2JXkoomFAD3A5CLs9oi6Wvf
 e89B/KwuHMelVQ6s0ZfwGUFuRwUr4WbRzrTWAK/tQKZda9Z1DS75wwYwJYm4k3seheL+VrqXSBG
 sHlRZ2jYjhyFrVaOjrNtl3DV5ftkePYlXDo5YZpN2adSLBPJbRJvzh8FlOEMbygv9H6iFXKEhZu
 ffiZEC1h4LwgeQfUx0ITXjR+3xbXXP2g/LsHg9tffNRrxrmn/srOWghBF701JkxUNNqfws71MRt
 erE36ryLORUFvt2c3itsAQiz+HZh0YfSU6NmFL6aVn8ij82yDODRTUgLmnlYX0H02rui65S/u7F
 sqGnBntVyo+6cT0h9fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_033213_064851_6B2A1B6F 
X-CRM114-Status: GOOD (  32.43  )
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

On Tue, Jul 21, 2026 at 3:53=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:
>
> On Tue, Jul 21, 2026 at 02:04:05PM +0100, Mark Rutland wrote:
> > On Tue, Jul 21, 2026 at 12:29:54PM +0530, Sneh Mankad wrote:
> > > On 03-Jul-26 7:58 PM, Mark Rutland wrote:
> > > > On Fri, Jul 03, 2026 at 04:50:02PM +0530, Sneh Mankad wrote:
> > >
> > > FW permits CPU0 disablement because it functions properly in regular =
run time.
> > > But there is an additional hardware constraint in above mentioned pla=
tforms, that
> > > suspend to ram has to be performed via boot CPU / CPU0. Due to this c=
onstraint,
> > > CPU0 is required to be online when suspend to ram is triggered.
> >
> > The PSCI spec doesn't permit that.
> >
> > Even if HW has that constraint, it's up to FW to hide that from the OS.
> >
> > [...]
> >
> > > > This is a platform-specific property, and it's possible to build a
> > > > kernel that boots on this platform and/or other platforms.
> > >
> > > Yes, but for that reason the config will only be enabled for SoCs tha=
t have this
> > > constraint, it will remain disabled for other SoCs.
> >
> > Please re-read what I said. A config option can't help if you have a
> > single kernel that supports multiple platforms.
> >
>
> +1
>
> > > As mentioned above, its not a FW bug. CPU0 is allowed to be disabled
> > > from FW and HW constraint is for suspend to ram to be performed on
> > > boot CPU.
> >
> > Please see my other reply at:
> >
> >   https://lore.kernel.org/linux-arm-kernel/al9tdvOxYb83zBxd@J2N7QTR9R3.=
cambridge.arm.com/T/#m872da3cc4ded3386dce92d4bd4bdf9c33d3e2d0b
> >
> > This is *definitely* a firmware bug.
> >
> > To be clear, I'm not saying we can't do something to address that, but
> > let's not pretend that this is compliant with the PSCI spec.
> >
>
> +1
>
> Just curious if CPU_OFF on this CPU0 returns DENIED or just proceeds and
> ends up with cpu and/or system hang ?

My apologies for side-stepping the discussion, I just wanted to share
that I have explored the exact same problem with other vendor's PSCI
implementations.

In fact, I think it would be interesting to see how many PSCI
implementations that really got this correct. :-)

That said, I think a DT property should be a generic PSCI DT property,
but then set for those platforms that need it.

Kind regards
Uffe


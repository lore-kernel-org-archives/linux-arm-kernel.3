Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF92C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 07:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsK6CNkPzqL+25hJDO5/FxatvGOrEq2Iq+btxLgvqQY=; b=VWgzxFUxWiahECYre85ytE/kcI
	ovnZ0B7Q3PEA6S9KyY4/Vw9wpQDXvyD7VD+7GpeqENfwVlipYXeQpIAFu28+RRTEz+/Tqyb12A4Jz
	Ag0e7K7fLGIWY5MrGursu+csvjiInnYRrzB81aLra3J9mr+8n3S0kQ74e+vAZYbtthYbYG8DYXTyM
	zY30yImK/wS6CK26lH54TaiPbYXWDn7Q+FgKgZTYEsFTlFQOdZb6IuafFh/mu2tqko9BuuYFP80aR
	/cVRbnx8Q+zWvY4TZqO4YPzZvqOld1NI1TGsl3+mphQdEr+luKRy4u0GNm4A2Gn/MgMUUeuVx1Qsb
	Msol/SBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2OnB-00000001JD9-0UjF;
	Fri, 04 Sep 2026 07:56:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2On8-00000001JC3-3mLF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 07:56:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mn8c2351565
	for <linux-arm-kernel@lists.infradead.org>; Fri, 4 Sep 2026 07:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AsK6CNkPzqL+25hJDO5/FxatvGOrEq2Iq+btxLgvqQY=; b=lyMe15eqUhFeLFRb
	ZvQ0jwRyMlDf4mFoetfSpQzEYtL0ch88a/gfxsbX2JtIdepnq+rkvGYgQAIF6v9e
	gmYcp/V4pNV7LwqvRF0oYLocep8S0xOkDji5fdOx9fOSaMk69L39GDys5WkISYZl
	pejqQmGAmG78zYbDoAFL1nQFAkJaG6RaDB5fBDzjeTM89qI3wnMwkzcQZO30t8h2
	bqbETwMMnF72JwJQEshfEVrj/KPRGa8Suz3/9z7Kji2cuAoL5x07XOL/lPFDQptt
	GVKoUAwfrHe8rAgW4FXRSLVBVcBcJS/cwbn8P3M4+hXKcnpUA9dV3BU0D306rwo5
	q/4KZw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fgsxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 07:56:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso1009690a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 00:56:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788508612; cv=none;
        d=google.com; s=arc-20260327;
        b=hLJldCWbEaUJ5HVwaw4t+YEHDfLKSxXj82kx41Z94ltfsZYFtCbhq8JpkC0Mt6esAN
         AcA4Bt6Lm8JCzqLPsL8bnOk2a7z2pnASHJpd5S+kMJl7IqqzbWWbR/ZQx8k2lgMbC1uw
         kgGbnyQXizks6u+mx9OEjaLIai6llhpBopbsZ7u+KoO+EOK/4YUvs50jsOAikUVmNuE5
         BPYj3VVjj1HMP6QmlZD1qZXLBNv7+uTpQ0c2UrcvpXG1b9HiSVv+K1u3ny/jTN5h7RLu
         0Fk9wT6MilASqUURj9y7Um2V5r5TVJ5N6X5Pu3CxevE8tYC4gkGLolB1z1qFX8PETh5o
         5h3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AsK6CNkPzqL+25hJDO5/FxatvGOrEq2Iq+btxLgvqQY=;
        fh=iiuC5ERn54+eVEPNdegvwTZSNUDtcLtSrUZau+wxQnk=;
        b=hARMweVyc6tFZgQMB5cwRzzE2BV2aB9j+tv3xXZn6+7Jt9KcwHbKM2WHtsGobs3I0G
         GmwgcCVwdB0ArbitH62lsI+DCGmlnIH/f+R0DnI/yo9xJQYZZFKCTkyVXfOZuhzjWQ7O
         1B8oIlbQUa5jGHZuCTRD8s74vKo2zchEpESaHdDiaXNJKsMrA9KWY7fzlpa+lBIac9Fi
         UuHfywiCJkNAlXlbGNMofL+J6gUY4MWKqJ1wvNzv2JPuvFDzlTfWF3NSxCINmUsBCH2f
         MeGriUeKZo6A3IwA+zuxnBGCmw1+9m3GhuqsrqsOn5oOY6PQz74DhTKxEB54zU8gPNH1
         DpCQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788508612; x=1789113412; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AsK6CNkPzqL+25hJDO5/FxatvGOrEq2Iq+btxLgvqQY=;
        b=L5Ny8wsHcsSbaDYHVZRlBQFnZ+14KVlZWIlkCNyYAsMA3WTd5otwv7oitj7m4+/p34
         OLhZc+hrEZ6C0CcBR6ozXauYL6N0mmbitTZmhIwEwMLwCWPgzvjAOyncGMjnJBN/eGpf
         tSxpltpuQ2bKo01QSsptYEtGNztmXkJMhzStR7BhHHjhPUnArGngbc49Wwm6C4Xp0rl/
         DgTAkgDi5+t14XVKyPTEMB6Q6xrU8Gt3pY34HEtSjt5n6GJu0mJy8CR4TrzJ5ktgobTq
         61fEjxWih5ZzQvbXPZZffAr0s+8bchAIhfobCnqxUe4LelfrSEVUoxZClikU5X5BhKsN
         pMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788508612; x=1789113412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AsK6CNkPzqL+25hJDO5/FxatvGOrEq2Iq+btxLgvqQY=;
        b=kkC2DAA/DZq0IIAPjv4HLIXu9AZuIJrZIVenzrBsAmXo6RuMIu0KH82zzi8PnL/H49
         UncvjDJ9EBOLB4xfGzuFrc5oT+xit3fdtVdAzhngVLkFVztQw+36/u8+eraqH8l6zN2K
         x1QQtcqbg1ZzGeL5JfDWb5rpzPRBMjvQ7WKOaHrRiCA2M7KAL8stHzDNh4KxSIbkeRB+
         GhPTIhRrdb4S+6cNLtonkgDEPwUDxmQzJCKShbnwn8VcRL9ydskVyLoN5OfdIWDwjSLM
         lpHU7U7Io+OvuUhXxPEFt9/dHaMAAzvFC96Ea03tUyp2ns/OOOr58MitZ/QvNEKAw0v+
         sa0w==
X-Forwarded-Encrypted: i=1; AKwUvBwOJHc5U42jOzgDG5TULKjDKLU1JzSH+5y8HRzAGq5XE+1jNyptLkbfbZfHuPhGGECxxI64e9kjBMFHkAh9QVVZ@lists.infradead.org
X-Gm-Message-State: AFuF++n2OhqiA0dbL5HcmoIPgVjPZsRWz29EEUnZ/4YeZjvP8Rlz3Rf2
	BImWiZKg+wagIl34waN4UAHbJNM/bGCjfv/d+LEOubOOGU+QxchyBungTVKQAFr+wW9t/+pNL2z
	1gAvN1D5AlJN+MG96WIuTAUZFJ+y1c0RCnz3HXoRt4PaXdU5DoW7QFbuHV8SiGgX4zLUbu4rPa2
	ESjpitndMM17O3D+J8TF7q6Sj4f8V3Uz1LSxyDmj3Wuo9Yqt9Q4uU9
X-Gm-Gg: AYBFou3HtwD9o77/aDMgMWAOGALbV14HnbX0Cd8LkvoWO0DFXXv8w3XZoaAVX2bV0Dm
	WbSChrKl09e49Jv2Eq8ybpD0jOx+tfQPNFvHGQet0zNqKiy+NB8j/x8Da7mGYNSy+xxfYXotF+m
	i6sIXaM+JrF9bB6Fbxx/V8yQzOXYaYvmxKfHPyz6Ibij5Q09zjU8U+sWt6Yw==
X-Received: by 2002:a05:6a21:3989:b0:3d1:af47:5f80 with SMTP id adf61e73a8af0-3da39f77bd4mr6420620637.11.1788508612160;
        Fri, 04 Sep 2026 00:56:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:3989:b0:3d1:af47:5f80 with SMTP id
 adf61e73a8af0-3da39f77bd4mr6420552637.11.1788508611689; Fri, 04 Sep 2026
 00:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <CAPx+jO9fcvBsxe9yx9oK=0EXmpNwub5ba0a-TGk1WRFaRGsqpA@mail.gmail.com> <177884a8-902f-49be-8fcb-b2bec3ec7d6c@oss.qualcomm.com>
In-Reply-To: <177884a8-902f-49be-8fcb-b2bec3ec7d6c@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 09:56:39 +0200
X-Gm-Features: AcwNN1UllrxbRYClFejSTOv1mPezdKyC-qM3m7DiYE7HdwsmgFFrqN7aqxA-MZ8
Message-ID: <CAPx+jO8bXn2F3cWz87Ozjrh00E+a_UWBrHeUViTEkTL87JHW9Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] soc: qcom: geni: Derive SE clock configuration
 from OPP table on SA8255P
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9a79c5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=D1j1bUi7ZpnfGdUu11IA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: FSoTAOtsy9bt0g40e70Hgm3Z4m6SIXrT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3MiBTYWx0ZWRfX2/Flof4YS5hW
 DV1Q1McJB2KW4gPgZmThyV09W9H9PpQUwoRmx/et9YCnVQO6+qahvAPwvqo6Rxmp1VCi1UA7nxm
 z4YNjUa8AGALinpDgRnnFVsKLUABu2c=
X-Proofpoint-GUID: FSoTAOtsy9bt0g40e70Hgm3Z4m6SIXrT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3MiBTYWx0ZWRfXxcZE0HPOV9O9
 xUI0CEZ/FfNByPux2hf65L6bB1bGnJFYU+h5fUnZ+g3cfekBLIl3K9rd8eicFHkeSwWs2sGPW4V
 zJG80JIjib+bZAwHymA/o87VNzf1A4P8zfjMOfM0ez9T1aquYlkjWUbcQPMpB59lV8N5ps3mzhl
 T82HqeVI3QGAn1+3wcH1U+ImNt9pafr45Wq+89phx6fJyLwgr7Ki6vQZ0iH0YJY/MO5XbqorOYG
 XB0qMwIXFxR/TORYNkXMOQE4MIHcoJkrVYfGRkEFVgMnkd34jbG0/leM8P+A+LlZ/AuZgrHiS1l
 9G7yGQMvk+fhh8f4A5zxlvdaO7Q3+qbuOC8aqYHO+rQlc0VCv5ulYnyoX1vsEV1QHFCQZuo29pJ
 WV+QOj9xCqEZLynf8n+nchO7IXhKZ3dQ37K3P46Tv0IK6I7swTSODu2+8CZkx6lUnR6AjXyf4s7
 gXuWLdKIyK8Uk5NVd3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_005655_062706_02D5A5CC 
X-CRM114-Status: GOOD (  46.00  )
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

On Tue, Sep 1, 2026 at 6:48=E2=80=AFPM Praveen Talari
<praveen.talari@oss.qualcomm.com> wrote:
>
> Hi Ulf,
>
> On 01-09-2026 20:22, Ulf Hansson wrote:
> > On Thu, Aug 27, 2026 at 7:59=E2=80=AFPM Praveen Talari
> > <praveen.talari@oss.qualcomm.com> wrote:
> >> On firmware-managed platforms such as SA8255P, there is no Linux clock
> >> handler available to determine the appropriate SE source clock, source
> >> clock index, and divider values for a requested protocol frequency.
> >> However, these parameters are required when programming GSI TREs, wher=
e
> >> the hardware expects an explicit clock source selection and divider
> >> configuration for the serial engine.
> >>
> >> In contrast, platforms using Linux-managed clocks derive these
> >> parameters through geni_se_clk_freq_match() using the source clock
> >> information stored in clk_perf_tbl. Since the firmware-managed path
> >> lacks equivalent clock information, protocol drivers cannot reuse the
> >> existing frequency matching logic and instead rely on a direct mapping
> >> between protocol-requested frequencies and performance levels. This
> >> creates a separate clock configuration flow and prevents
> >> firmware-managed platforms from deriving the actual SE clock parameter=
s
> >> required for GSI TRE programming.
> > Hmm, this sounds like moving backwards when it comes to keeping
> > drivers as portable as possible.
> >
> > I understand geni_se_clk_freq_match() has been around for a while, but
> > fortunately its use seems limited to only a few qcom specific drivers.
> >
> > Rather than continue down this path, would it not be possible to find
> > a more generic solution for "geni_se_clk_freq_match()"? Can we replace
> > it with a common clock/OPP API? In this way, we would not need to
> > sprinkle drivers with calls to platform specific  code.
> I agree that protocol drivers should not need to know whether GENI resour=
ces
> are managed through the clock framework or a firmware-provided
> performance domain.
>
> The intent of this series is actually to move in that direction rather th=
an
> introduce a separate flow. Today firmware-managed platforms cannot use
> geni_se_clk_freq_match() because clk_perf_tbl is only populated when a
> Linux clock
> is present. This series derives the same clock-performance
> information(clk_perf_tbl) from the OPP
> table and populates clk_perf_tbl during geni_se_domain_attach(),
> allowing both
> resource-management models to reuse the existing
> geni_se_clk_freq_match() infrastructure.

Right, the goal makes sense, but I am not sure the proposed solution
is the way to get there.

We really want to avoid having generic drivers like (spi, uart, i2c,
etc) calling platform specific functions. This isn't just me, it's the
general way for how we do things for drivers. Of course, we have
exceptions, but I think you get my point.

In this case, why isn't it possible to use the clock and OPP
framework? Is there anything missing to make this work?

>
> Likewise, geni_se_set_rate() hides whether the underlying implementation
> uses
> dev_pm_opp_set_rate() on a perf-domain device or a regular clock-backed
> device,
> so protocol drivers no longer need platform-specific callbacks. The goal
> is to
> converge both paths behind common GENI helpers rather than maintain separ=
ate
> clock-selection mechanisms.

The OPP layer already has some capabilities for managing clocks. Can't
we use devm_pm_opp_set_config() to prepare an OPP table with the
relevant clk data for the devices, as a way to abstract things?

> >
> >> To address this limitation, the performance-domain OPP table is treate=
d
> >> as the representation of SE-supported source clock frequencies. During
> >> geni_se_domain_attach(), the OPP entries are used to populate
> >> clk_perf_tbl and related clock performance data, allowing
> >> firmware-managed platforms to leverage the same clock frequency matchi=
ng
> >> infrastructure used by Linux-managed platforms.
> >>
> >> With this change, protocol drivers can use geni_se_clk_freq_match() to
> >> select the closest supported source clock frequency for a requested
> >> protocol rate, derive the corresponding source clock index and divider
> >> values required for GSI TRE programming, and apply the matched clock
> >> through the OPP framework. This removes the dependency on direct
> >> protocol-frequency-to-performance-level mappings and provides a common
> >> clock selection and configuration mechanism across both firmware-manag=
ed
> >> and Linux-managed GENI deployments.
> > Rather than adding yet another platform specific method, would it be
> > possible to extend the generic OPP library with the pieces that are
> > missing to make this work in a generic way?
> I agree with the goal of using generic infrastructure. However,
> geni_se_clk_freq_match()
> derives GENI-specific parameters such as the source clock, clock index,
> and divider values
> required for GSI TRE programming, which are not represented by the
> generic OPP interface today.
>
> This series does not introduce a new clock selection path; it reuses the
> existing
> geni_se_clk_freq_match() flow on firmware-managed platforms by populating
> clk_perf_tbl from OPP data.

So geni_se_clk_freq_match() is used by two consumer drivers today,
drivers/spi/spi-geni-qcom.c and drivers/tty/serial/qcom_geni_serial.c.

Beyond the $subject series, there will be even more consumer drivers
that call these platform specific functions. As I said above, I don't
think this is moving things in the right direction.

If this can't be solved with generic frameworks (clocks and OPP),
please clarify why so we can figure out a better way forward.

[...]

Kind regards
Uffe


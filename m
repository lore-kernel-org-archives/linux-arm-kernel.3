Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1ADC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5rJuoLCWO7KVfDNBoBfeBkBYsbNKNweb2IqmkGw9Bg=; b=nWENZbpcI0Bb/5b5Ce+FHP3VQ5
	NqjO93dYvH6pFG+SGkj93NS1rbyWl0yss6JQi3gDNeh3cOZ6wfZawIcSG9S45ja/WPxCfLBvMsaHi
	fdFuNZPNzjfeqgokKzQ7PfqzsNgTcUEcvuEukn2b0Dc4ZCXybXLGPrg02tu08lSDUGR9enmO2VWKf
	NKGGuiBcg/SPOQbnKTx9o6C1lHC15LCiaxgutXtjgkptM6QEhVJP3K3bsjtTe20OZQohhcWprmJH9
	jqRK+EM01xlivTB/WLb+/gVOOT30lXnMnEPz1UVOYxo3nt6tTiMWQW6sOSOioQTCPq0apndbQJRxg
	Fe/kGH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqyl-00000000pvw-2NlT;
	Tue, 25 Aug 2026 13:14:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqyg-00000000puc-2MDo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 13:14:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PAvj7G1638903
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 13:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f5rJuoLCWO7KVfDNBoBfeBkBYsbNKNweb2IqmkGw9Bg=; b=pyu6VlIJDgoiFSrO
	uNnwDnUX4Lzccl9YZsw0xp9VrU2OJ29gP0L3sAbjy9OGmyp6eNEg8hkOw7JRdHn7
	iys6P229QtFBi18hf7B6LariH0HDFRCLekqVrp4BmXtaM98pkREZezaQqb82XMvM
	zXfE20rjgThbmRUnxwoXypC8ZaZyh/NJayKJblM+rxZuYC6dSW2LewzHtHtlgh2b
	TwtDivZAP5pOYt3S/IsJoRkxghCxwddUt35dKYU2BDUQeMh9/T6X8Prh2LtVBTul
	jyh6lpmb8yPClB7NOCPl/K8vyml4wNM2RsF2zSOwQvnmgP0IBaiAzvYS+RaAsioY
	TOe9SA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t1s42ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 13:14:09 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so6896388a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 06:14:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787663648; cv=none;
        d=google.com; s=arc-20260327;
        b=q6uRdj9XOHoCyzDJ3HOvHaT+PaIxYgwcuEcaKK2tFLPC/hSxCZb+N5yab30Urgp6Dg
         rJBZ8GJZP0azA4s6jRM75CoebyBGlpojN72Z922NpLNOaTmYlI40JC8aE55zfQonkc3H
         0caRCwovkibVSQWfpT941y/9zgykNzn1x6U0p+8T67z7jEPYseb8SIXDdzOONfkios6F
         XDYCR+D2mFB4ApHpCacpVH6nZG38F1VZNIo3cVSHyPvaOz2v0uIq8lpZoi12uGXuNqBL
         E6+KLVeftsJXV3tae84nJbYDRUVwxhc+9E5BRRTWacG60amUXTvxYU38K8ylc6ictCMU
         aSKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f5rJuoLCWO7KVfDNBoBfeBkBYsbNKNweb2IqmkGw9Bg=;
        fh=fDB/RWxWTdenzQZjXoDpjUWm3+I0ja4W6EF0QTrfEC8=;
        b=U9FIBALg1hUjjU+ePbQO+nWSoqmredKO9pOiQZUr6X56GDlZh7nz9CTGonaGXy1ZOr
         nc4o4UjPs5CpuBQLprBpiafawB4RTj5vB4WNxqCOUWEHz5ALsMOKreGB9nVjYIH6jHU+
         JUKO8rMxoQ80hqiSqPwFggvrwKZKV7i1sW2sZ0duQaFdK3oWE6suYW+I9k3ZLK0qMLAs
         k24JBQe50TeBWsuUsis9FrFHqRzLgGN27YwKuue50gP9ARXFNiuIP24Y3yXACDgde5nf
         3t63QSpmfPwLR7YLaFMKYd6LjP70YXU/NPiAjemogkFNdX2hpAulO57D38+ye87zmx/w
         W/Tw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787663648; x=1788268448; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f5rJuoLCWO7KVfDNBoBfeBkBYsbNKNweb2IqmkGw9Bg=;
        b=NuvUsJq8ZOT1e88SZ4YhvnwRyuMwMjY5++IkkIQVehsE5FMdax6ptAmjb+iY5IYPCC
         tKUbue9PFviQiq2V9k7zZUi1FHQ7u4ydyisM1yHrPPfo6GM4qUmkivWJfRIc352ZB9pJ
         4NZXbfnXtvNab/eCdz3o1/qYzfOSpvEOAbYLlwWhDmVZDeqpsQKRw+NPo5IwAPSr7exX
         DdgzfOGeX3WOcW1UplPgZEOanuqZfIOu5gPvfzNRi5Ez3drLWYtqNqK0JsetV6ColApF
         1HGH3/rsqvMtqU5FqKH+jKl+ihdsTAT/ScVzBhghAs9nQ6Tih3+rsIbzuLMuaj8YGQv9
         XhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787663648; x=1788268448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5rJuoLCWO7KVfDNBoBfeBkBYsbNKNweb2IqmkGw9Bg=;
        b=cEjHv3K7gW+uxFypHpvQREKSdr1WjU4UZ6mtQ9a6GleTR07TrrtHAUOwJvs5juqLaw
         vtrpfvB/d90HqLBv3pV+E4TiuVSNAhg0aPl/9wLVacGGEDXQuBkfmKwWMvkWZriBT+d6
         Udi5slkL9JQtoDwYcVVkPGBbv2oS4tMhLmA4O4ftgAnBMc4FcqiCQJoQlckoLJWa9bLd
         81denFU5g24hO74pMf5nLxcoTECz4+/fklYpXjgf8w4lwHkyPn49twkE/XgJLepPJSY+
         a1+r+/2u04X2zyQe6IIuABkV7F8xQb1HCSkVV1hKpBDv1uwGyzuqfQFBWTMCmOiGWu7B
         NyxA==
X-Forwarded-Encrypted: i=1; AHgh+RqnnhlSryheVaTsBWK1hVXgQOUGgg7pS132g7uw5qLm6onl0a3vUXhgInT179zh+vRTGhXCp0MqU4Ix8TKtfuky@lists.infradead.org
X-Gm-Message-State: AFuF++lcNOrwJDcPqGrPVXB6UZZCcG601+tPb3Gk8XOiawSWFxoijeUY
	Q5APzbFr39hYEVqe4DC+eYdsQmvqmaOW3KMrFiIa56ehDDI7ShhRMKpNWyTTlctEbqTyxnsDff2
	MHzEM9dv6e1UCXKJqR8NCD4OglZt0GI3NLneiD8JJV7Qe+qWRoxCmJs4ECJ8J5LKJkpV4DtwUKc
	Tm8W0SudN66si3rVFuRr/y3yB3YBZm2h5Fy3XMLGCOtrVL+gYX8Wfu
X-Gm-Gg: AR+sD10/9IWNmxiU/j13oVB3PWx+EWzo1xoZ4pFrNagMorl7Xm4VGpb5TdGouKeJkkf
	ownTDSc6zAPxtQQNBdmV8JyDrcALaUw+SKU9djRgrOZ6excNlS3+jJ01FCyd6mFRQTWwPLtwl5j
	JKEE0aqAq7cLxyl3TEyPpeVQFapxBP/n4Y3SDir0HdhIuTEKi1na5E1QtVgFI=
X-Received: by 2002:a17:90b:6cc:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-395c33d786amr67081334a91.2.1787663648404;
        Tue, 25 Aug 2026 06:14:08 -0700 (PDT)
X-Received: by 2002:a17:90b:6cc:b0:392:ca3b:370a with SMTP id
 98e67ed59e1d1-395c33d786amr67081169a91.2.1787663647756; Tue, 25 Aug 2026
 06:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
 <20260817160222.3313295-4-mayuresh.chitale@oss.qualcomm.com> <c30e91d3-514a-4fef-8b61-e1744f577d35@amd.com>
In-Reply-To: <c30e91d3-514a-4fef-8b61-e1744f577d35@amd.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 18:43:54 +0530
X-Gm-Features: AcwNN1XGeK3kKeeesL0CAGDbwc6gJUoKnhOVO6Mm-4cXkc72U05QOEit2B_T6As
Message-ID: <CAHuiULC-Z+pqKsMKMPX8emnN4tz9Div7_9c-QGZ9-L_Ef21dEg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] perf/riscv: Use Sspesa for precise sample attribution
To: Sandipan Das <sandipan.das@amd.com>
Cc: Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: CLjrpahWWw7KbjspteLHW0vipjkyylGw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDExMiBTYWx0ZWRfX3TBI17qhBQjR
 1affihCsHOwwGDmjUdjEW1/Pnbbc9PD20Ij7JMo5NdBJYyjYh19P3YqUb1cJLKCtbaiu5peHcDz
 aX3xqvi09X0Ty1Kp57Femt6qFnH/tw+Wf8KGpdIYYbwI81/zJsEjhBWsQZiDrqG1PvPbpdBErRQ
 J7bwzEbnZIkkvljS/uKSgx4gle4shf6VpQ0m/VqZzupqpNow2v82fvCQDpKRu9+LcQN6I2YIZua
 H/loYhbTkLju6t0ecVo6cEkFDkWewtjiIqgGtmdSqQ49EdUoibaQc0vXiBhbOY3ip+DTSRA7CZU
 JdGMMhC7mOFr9CKXHkRy94tleDqGscTuoHl0FpDx4BBM9yuoxHGjquHFzvBIThnDvheDpKIzAM0
 yEgJ6PkmVIvy/esK+P0RZEYT0FxeEB0LZ1+RWOG7mg3odeuwcMp+6IaIBcUNgBZ6oLPSVmi2Al6
 OEsi9o1R6N1UPVqcqFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDExMiBTYWx0ZWRfX4HYnaAAQM8pQ
 86ArH6oMVtcA2SdGeFlXgC4OretCWLjaYHZFsbjw3HsbilvodQawceTN0wgAgGJe1mWPBrviuXT
 K2o86J2khROfFnsKjEhd5JP4f1sPFn0=
X-Authority-Analysis: v=2.4 cv=L7ItheT8 c=1 sm=1 tr=0 ts=6a8d9521 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8
 a=8lNz-84GcgrwCALWT8sA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: CLjrpahWWw7KbjspteLHW0vipjkyylGw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_061410_730519_1A5CD20D 
X-CRM114-Status: GOOD (  31.77  )
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

On Thu, Aug 20, 2026 at 3:51=E2=80=AFPM Sandipan Das <sandipan.das@amd.com>=
 wrote:
>
> On 17-08-2026 21:32, Mayuresh Chitale wrote:
> > When the Sspesa (Precise Event Sample Attribution) extension is
> > available and a counter overflows, the hardware records a sample PC in
> > shpmspc register and the counter ID and additional implementation-defin=
ed
> > data in shpmsdata register.
> >
> > In the SBI PMU overflow handler, use shpmspc to report sample PC via
> > PERF_SAMPLE_IP for the counter that caused the overflow. Shpmsdata is
> > exported as raw data to userspace when events request PERF_SAMPLE_RAW
> > sample type and it assists in deriving the sample PC from shpmspc if
> > precise attribution is not supported for the event.
> >
> > If sspesa is not available or for counters that don't match
> > shpmsdata.CNTRID, fallback to epc for PERF_SAMPLE_IP.
> >
> > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > ---
> >  drivers/perf/riscv_pmu_sbi.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.=
c
> > index dfc886dee5ad..1b0b1cc612de 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -63,6 +63,8 @@ PMU_FORMAT_ATTR(firmware, "config:62-63");
> >
> >  static bool sbi_v2_available;
> >  static bool sbi_v3_available;
> > +static bool sspesa_available;
> > +
> >  static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
> >  #define sbi_pmu_snapshot_available() \
> >       static_branch_unlikely(&sbi_pmu_snapshot_available)
> > @@ -1051,6 +1053,11 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, =
void *dev)
> >       struct cpu_hw_events *cpu_hw_evt =3D dev;
> >       u64 start_clock =3D sched_clock();
> >       struct riscv_pmu_snapshot_data *sdata =3D cpu_hw_evt->snapshot_ad=
dr;
> > +     unsigned long sample_pc =3D 0;
> > +     unsigned long sample_data =3D 0;
> > +     int sample_cntrid =3D -1;
> > +     u64 raw_sample;
> > +     struct perf_raw_record raw =3D { 0 };
> >
> >       if (WARN_ON_ONCE(!cpu_hw_evt))
> >               return IRQ_NONE;
> > @@ -1088,6 +1095,16 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, =
void *dev)
> >               return IRQ_NONE;
> >
> >       regs =3D get_irq_regs();
> > +     /*
> > +      * Sspesa records the PC and metadata of the overflowing counter =
in
> > +      * hardware. The PC is precise only for events that support preci=
se
> > +      * attribution; otherwise it is best-effort.
> > +      */
> > +     if (sspesa_available) {
> > +             sample_pc =3D csr_read(CSR_SHPMSPC);
> > +             sample_data =3D csr_read(CSR_SHPMSDATA);
> > +             sample_cntrid =3D sample_data & SHPMSDATA_CNTRID;
> > +     }
> >
> >       for_each_set_bit(lidx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTE=
RS) {
> >               struct perf_event *event =3D cpu_hw_evt->events[lidx];
> > @@ -1123,6 +1140,15 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, =
void *dev)
> >               riscv_pmu_event_update(event);
> >               hw_evt->state |=3D PERF_HES_UPTODATE;
> >               perf_sample_data_init(&data, 0, hw_evt->last_period);
> > +             if (sspesa_available && hidx =3D=3D sample_cntrid) {
> > +                     data.ip =3D sample_pc;
>
> Does this need to be tied to event->attr.precise_ip?
I think there is no need to tie usage of sample_pc itself to
precise_ip as the sample_pc obtained from shpmspc is more precise than
epc. But yes, we need to tie the setting of PERF_RECORD_MISC_EXACT_IP
flag to precise_ip =3D=3D 3 and ssplcofi extension being available. I will
do it in v2.
>
> > +                     data.sample_flags |=3D PERF_SAMPLE_IP;
> > +
> > +                     raw_sample =3D sample_data;
> > +                     raw.frag.size =3D sizeof(raw_sample);
> > +                     raw.frag.data =3D &raw_sample;
> > +                     perf_sample_save_raw_data(&data, event, &raw);
> > +             }
> >               if (riscv_pmu_event_set_period(event)) {
> >                       /*
> >                        * Unlike other ISAs, RISC-V don't have to disabl=
e interrupts
> > @@ -1194,6 +1220,9 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *p=
mu, struct platform_device *pde
> >       struct cpu_hw_events __percpu *hw_events =3D pmu->hw_events;
> >       struct irq_domain *domain =3D NULL;
> >
> > +     if (riscv_isa_extension_available(NULL, SSPESA))
> > +             sspesa_available =3D true;
> > +
> >       if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
> >               riscv_pmu_irq_num =3D RV_IRQ_PMU;
> >               riscv_pmu_use_irq =3D true;
>


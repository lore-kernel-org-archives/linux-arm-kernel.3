Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8735CC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 11:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdP7j+PM85jv59LWW3oHScYRNQLnSJgIIbuicxOjPE0=; b=DbFt1zDl/VROWMuTySztPlg5DN
	moCVzf+5+YM8OWzZsUoxa/vVlk914eE+B6KQCXTNQxkfsNzHvxPd7PCIdESBacmK2+mTaOIoiIpei
	ulDCXRjsomV6yYw4Jas1q3EiDJZYpToV1p+QLiocKJI2Qf84d9TPQ9Ahzj15jGTjPwRInY03kCr5N
	u/A5mMbN+yq5+LowiyHJojPIcD4OUTaxSTcX1ur3QCIv56CrNSCA2oRH5+eo09+REIG+lV1QapfGb
	GuIqkxj4Px8Te9FEp8ut/g2BPlQ4YkZOI37ZAwwS2YAFWrnai+2wPCeBalXT7dI0ax0+yapBIVjtU
	13aP12yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZSD-00000003mqZ-3Raq;
	Wed, 05 Aug 2026 11:06:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZSA-00000003mq1-1vAe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 11:06:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758ddUE2669653
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Aug 2026 11:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PdP7j+PM85jv59LWW3oHScYRNQLnSJgIIbuicxOjPE0=; b=gueJ8mtjDJvuiB6O
	/U7VY+LAbY7ZHpCN5YLWu1iiqsEGaDlCZWbuCiYpTXmnuow1cRNVoR4x/PALveCF
	UjFVtqF+fUuzB6SAvWJH3IRx20zflxXvQBkoaMw2w7JqOeoT9tlmG0VGsGgPn0SA
	M96bMY2vX7EZndXnnefNMiyhM3+piOPC+mwl/YhcrZGPvOsYG6BYeljT3mW99/0x
	kVNAFSJw5bjdgvdbY/s2jWlGLwjh6H865EMEKzT3BlZvUe4P7SKWl7l0gkrgLYfd
	4JjgB3v09a3QRACvhEvZgwUoXae+VJX31No2kfISTbflrUrhbDRPX/gBW6Z/nwoF
	NaRFLg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3qc8v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 11:06:27 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9775c49866dso11605241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 04:06:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785927982; cv=none;
        d=google.com; s=arc-20260327;
        b=ipCaAoLtOaDplqrKzft+pyF5e+ACnyEzT5JtZ9Grtp74RnXD31phCbDkau5tKyFf45
         +0HgQVdlHkd0Gd35zO4MFnrAi/ic20j/pWl8v0fF6ZWd2mXdPWKjBFpRxzPHd5noTghK
         G1Vtvgnxumwqlz5/jjxfzKwaoF9CGFVHi8NUcgvf7UxhCgbUuEPNQIKhTB98D9WwHZoW
         8FZaon/pBtMGys39q0ez+hlBzkkEwrHNZVyuz9cASQ2V2TCX3lhkzwTmK8d9gH95+uIn
         7LLZDppeouHWwZtaczwwNYenj4uYi2y0/TvEFPrhc8GVWLBS/gS8eP/6jAcjKP+PkjRP
         Br4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PdP7j+PM85jv59LWW3oHScYRNQLnSJgIIbuicxOjPE0=;
        fh=bQeLUScymZyGYq9eyGt03gRmfJZkmM1zt9O5vZQT2nc=;
        b=ZQKBpkTHu9/LThqW9YTZ2DiELVAM/KRtidtwyAc/EW/9IDHil3fjIzkIXYQCvZm4eg
         sznActWxiJqvMdRXkHuK/s/EAyKvZBsVqcFZGAz3G3Wmnl5nGFKsDecLaOD8nuzBpHgo
         F6MTw78MfYzaUK+YnM/r4tFqZmleyad7AcgCDVVEJhQHCdTd4meUleq5e/NxflrS5DBg
         N1VbKhNk6eR+9erdHyZPXkRVjHrzbU+Lbq5/ITuCqODz/U4RikJVPlvjQwmPQWVGdnMl
         UX4RhAnkpzRCvMMGt2enRfw0rHLT+6NsFgcXwtye1S2/lVapR7xdrr2NhNR9cNoGb67q
         UcYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785927982; x=1786532782; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PdP7j+PM85jv59LWW3oHScYRNQLnSJgIIbuicxOjPE0=;
        b=e1L1SaN+sfO/GBTxR7pFZV1dvLRgEJdM1RBoVaivgt4qDmSYzrprYXwwaCt7Uw6mBM
         U6JGZAMYzYy9XK8nxZgO6jQc7QT7zVbY396oMsSslDGdYWm2ovzsSNjo4w5Zohev/+Hh
         PKshdHxZeoRLZTHNfzWnwT2A+zQL/3W6u0Ea/bkSqwYwBUg55nrxUGM3bUCwQYsf2m2g
         tg4I3QvYD43pkDmjXjWfrF7paaAKV77T7j8foi74JMejTdYpejekWumTCjTwhDRwTqWa
         lYEvakryM9PxHrnFUIjhWAN5mUgICmAq80hh1Mmjgi+kJ+3zopjbnKWV7Lj8ZGitynQB
         wqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785927982; x=1786532782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PdP7j+PM85jv59LWW3oHScYRNQLnSJgIIbuicxOjPE0=;
        b=a0MFLKrtZxmGILJMkpgHTyYyfQfHcnEA5LppI6DciR0lejsjzBBRoWVzq2i15s64p8
         vmnqwTqJ4tBVTxohwjLucIEVZPb1LJ9bErRX+ZhDX6lpFjZG5u06FyAv00Og9yOxTgMY
         f3LuW53ohqne6D0+pbGrZGanWuX4idnXmKLCuctTqR2zE6v/X5+Y4bkkGTPQ35NchL1k
         eSI4+H/zDGyOYPfsu91s0WYi845jaShQxLqpsKTYaUT+EYr4TiY1B4TW4y4dX2+FCJk3
         G+w1H4dRs+fjysjZuctij8O04gh48dKiXPlXye3kkBT+2vbGWN5uEE1zd/5QqfWs0d0v
         bh3g==
X-Forwarded-Encrypted: i=1; AHgh+Rq80XIVgeBEqFWQm+664FsTYO+iCcosFUxBri1XA3Nv0LU7ZEqs8Bt3Vm6aGcJJPl++l8f/Q3PqVt0h9F+LHbbp@lists.infradead.org
X-Gm-Message-State: AOJu0YwGUaFyVvRKrTGPTIwHYFrIHAvkv0dl7PesUzIyRRocnkUPCGX8
	CwfFPoSgLcStbs/k3bO5mri/pWfE+IJG6O+1rn6lYTD1f7Kg9r0ujTE/3fnqmDqYSu0N0QfGxu4
	GeDW/hVYq3l7GXQuv6/jNLE9tjlVjPW2Fslu4GW9xaYnYuj4yoZEzFZG0aRukKE5FgdF1h6VMMf
	6LSB3fV3m18n0K9OoPSerHZLfg874m9fO1AXmmE6q5lv7qsFvDrAFB
X-Gm-Gg: AR+sD12pUOqfhYCyRvio/J6hbrSCZS3qTVtb4iEwphISGhNf4CV3p9dji5nyqAdOOgd
	3uY/YkI9w8go3RTejQ04yOPMShODLMdj2AuRBIMxlP2KfwyW/RdmmAVZwro1b9r4N1ikVgU5kiL
	RjiyrHT6ewaymQZk3svaTolGtnv+CDfw8izO4pXvcrpDB5ZGAiOLaLRlChwA==
X-Received: by 2002:a05:6102:3ed6:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-760e79e969amr589182137.0.1785927981684;
        Wed, 05 Aug 2026 04:06:21 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed6:b0:738:9abd:9ebc with SMTP id
 ada2fe7eead31-760e79e969amr589163137.0.1785927981095; Wed, 05 Aug 2026
 04:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260802145618.1952804-1-cristian.marussi@arm.com>
 <CAPxK-6eoSguQXkQyhoKkxos89BL4Y5f43ntv8MAY7xoiNmMeYQ@mail.gmail.com> <2e1996c3-4525-4239-ad17-4056071c9407@kernel.org>
In-Reply-To: <2e1996c3-4525-4239-ad17-4056071c9407@kernel.org>
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 16:36:09 +0530
X-Gm-Features: AUfX_mxJmEDJMYBb9pAHnD9lC9sTDUryeBkmp_1xfADIX__hgUO83zL9-a4n4N8
Message-ID: <CAPxK-6f4mQYeWPxLvfg6cqYsPa2e5C6dCfCjurV74059gF8JSw@mail.gmail.com>
Subject: Re: [PATCH v7 00/23] Introduce SCMI Telemetry support
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
        linux-doc@vger.kernel.org, sudeep.holla@kernel.org,
        james.quinlan@broadcom.com, f.fainelli@gmail.com,
        vincent.guittot@linaro.org, etienne.carriere@st.com,
        peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com,
        jic23@kernel.org, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, souvik.chakravarty@arm.com, leitao@kernel.org,
        kas@kernel.org, puranjay@kernel.org, usama.arif@linux.dev,
        kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4OCBTYWx0ZWRfX3HI55TJLS/YT
 C2hR+NT9xtQXzBHjC6gWvT30U9V0r+6QW9wbhzvi1TPq3gaxh6+zCRO9+Hsys00kJAXLkT1I4SY
 uuP4Jsq5hygFHm+ba9j+2t0pNOdctHu9QeVS5XKZRvo6/zbU3zddKnrpIBQVm5eQ8w3ec4r7Wmg
 BwdA/0vik0ws5KEhpcNux9OksD1qH74Lmsbm6tEvTItwDCEqDCDtpWq3dobj+16yzH/uNnsvgbL
 TfO8C90UC7x/+wad3vt455S4uE7Kgs2US2ftNvGBmjn/NjriRoETFEzWuwTIbbqC5nysxAO4Zgz
 JOfQQcNLSU7535rZPy3qfisF64mKvM6RrlXBADG2LKZh5uczes0DCzoy+yxlfsoCPmKp+6bSGyr
 0dgxAGJxn13xYHqCqurwUJV245aSKXJSj7gQK61CBR/cbA6dZm2FXMfFEiGZPo26dOoSqfK9MJc
 CJRgbsvh7mUYuL58k/Q==
X-Proofpoint-GUID: 8-hxUsrAP8wW9aq4nGWey_p2PsN3pfC8
X-Authority-Analysis: v=2.4 cv=LsiiDHdc c=1 sm=1 tr=0 ts=6a731933 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8
 a=MWzHnyj4nXRH5IYb9WUA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 8-hxUsrAP8wW9aq4nGWey_p2PsN3pfC8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4OCBTYWx0ZWRfXztE5NPWkIso8
 F2iCm7UvGKYrDRMuiWmogVSrxwByV/JNM2aueKs0HUpPSV0O6PG0Aimv3O29Srhud9OeLC1PKmm
 nI6AGRIYvAMyQeQ3Lwd3GUPKgg1C0v0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_040630_637527_0D145D30 
X-CRM114-Status: GOOD (  43.55  )
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

David,

On Wed, Aug 5, 2026 at 11:44=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 8/5/26 07:21, Subrahmanya Lingappa wrote:
> > Cristian and David,
> >
> > On Sun, Aug 2, 2026 at 8:27=E2=80=AFPM Cristian Marussi
> > <cristian.marussi@arm.com> wrote:
> >>
> >> Hi all,
> >>
> >> [TLDR Summary]
> >>  [V7 highlights]
> >>  - V7 focus was on making the ABI complete feature-wise by adding:
> >>    + UUID enumerations
> >>    + BATCHED DE_CFG
> >>    + BATCH ops with per-DE status
> >>    + Generic EVENT Subscription with GENERATION_COUNTER support
> >>    + Better UAPI Doxygen docs
> >>    + Reserved space to grow scattered all-over
> >>  - V7 cleans up all the residual known sparse issues
> >>  - While aiming for ABI-completeness, V7 addressed also a few reported
> >>    general driver/protocol issues BUT the bulk of remanining Sashiko-V=
6
> >>    complains are still to be tackled
> >>
> >>  [V8 TODO (getting merge-able)]
> >>   - Tackle outstanding Sashiko issues
> >>   - [ABI]: more DOCS and examples
> >>
> >> The upcoming SCMI v4.0 specification [0] introduces a new SCMI protoco=
l
> >> dedicated to System Telemetry.
> >>
> >> In a nutshell, the SCMI Telemetry protocol allows an agent to discover=
 at
> >> runtime the set of Telemetry Data Events (DEs) available on a specific
> >> platform and provides the means to configure the set of DEs that a use=
r is
> >> interested into, while reading them back using the collection method t=
hat
> >> is deeemed more suitable for the usecase at hand. (...amongst the vari=
ous
> >> possible collection methods allowed by SCMI specification)
> >>
> >> Without delving into the gory details of the whole SCMI Telemetry prot=
ocol
> >> let's just say that the SCMI platform/server firmware advertises a num=
ber
> >> of Telemetry Data Events, each one identified by a 32bit unique ID, an=
d an
> >> SCMI agent/client, like Linux, can discover them and read back at will=
 the
> >> associated data value in a number of ways.
> >>
> >> Data collection is mainly intended to happen on demand via shared memo=
ry
> >> areas exposed by the platform firmware, discovered dynamically via SCM=
I
> >> Telemetry and accessed by Linux on-demand, but some DE can also be rep=
orted
> >> via SCMI Notifications asynchronous messages or via direct dedicated
> >> FastChannels (another kind of SCMI memory based access): all of this
> >> underlying mechanism is anyway hidden to the user since it is mediated=
 by
> >> the kernel driver which will return the proper data value when queried=
.
> >>
> >> Anyway, the set of well-known architected DE IDs defined by the spec i=
s
> >> limited to a dozen IDs, which means that the vast majority of DE IDs a=
re
> >> customizable per-platform: as a consequence, though, the same ID, say
> >> '0x1234', could represent completely different things on different sys=
tems.
> >>
> >> Precise definitions and semantic of such custom Data Event IDs are out=
 of
> >> the scope of the SCMI Telemetry specification and of this implementati=
on:
> >> they are supposed to be provided using some kind of JSON-like descript=
ion
> >> file that will have to be consumed by a userspace tool which would be
> >> finally in charge of making sense of the set of available DEs.
> >>
> >> IOW, in turn, this means that even though the DEs enumerated via SCMI =
come
> >> with some sort of topological and qualitative description provided by =
the
> >> protocol (like unit of measurements, name, topology info etc), kernel-=
wise
> >> we CANNOT be completely sure of "what is what" without being fed-back =
some
> >> sort of information about the DEs by the afore mentioned userspace too=
l.
> >>
> >> For these reasons, currently this series does NOT attempt to register =
any
> >> of these DEs with any of the usual in-kernel subsystems (like HWMON, I=
IO,
> >> PERF etc), simply because we cannot be sure which DE is suitable, or e=
ven
> >> desirable, for a given subsystem. This also means there are NO in-kern=
el
> >> users of these Telemetry data events as of now.
> >>
> >> So, while we do not exclude, for the future, to feed/register some of =
the
> >> discovered DEs to/with some of the above mentioned Kernel subsystems, =
as
> >> of now we have ONLY modeled a custom userspace API to make SCMI Teleme=
try
> >> available to userspace tools.
> >>
> >> With V5 we adopted a pure chardev/IOCTL ABI approach, refining the IOC=
TL
> >> based interface already present with the previous FS-based ABI.
> >>
> >> INTERFACES
> >>
> >> For each discovered SCMI Instance a character device named tlm_<N> is
> >> created under /dev/scmi/ subtree.
> >>
> >> The IOCTL interface described at 'include/uapi/linux/scmi.h' is made
> >> available to enumerate and configure Telemetry resources: Telemetry da=
ta
> >> can be collected using a few different IOCTls, depending on the requir=
ed
> >> granularity.
> >>
> >> Alternatively it is possible to obtain a list of the file descriptors
> >> referencing directly the underlying SCMI Telemetry SHMTI memory areas =
and
> >> implement in user space an SCMI Telemetry parser accessing directly th=
e
> >> SHMTI, while staying in compliance with the SCMI TDCF format.
> >>
> >> NOTE THAT from v3 onwards the firmware interface level NOW supports ON=
LY
> >> the latest SCMI v4.0 specification [0].
> >>
> >> Based on V7.2-rc4, tested on an emulated setup.
> >>
> >> This series is available also at [1].
> >>
> >> If you still reading...any feedback welcome :P
> >>
> >> Thanks,
> >> Cristian
> >>
> >> ---
> >> v6 --> v7
> >>  - [ABI] IOCTL EVENTS support: GENERATION COUNTER (stlm monitor)
> >>  - [ABI] expose DE tracking: UUID/SHMTI/OFFS
> >>  - [ABI] IOCTL BATCHED DE_CFG
> >>  - [ABI] added per-DE IOCTL BATCH status
> >>  - [ABI] new ABI feats flags
> >>  - [ABI] improved description in Doxygen docs
> >>  - [ABI] added reserved space to grow
> >>  - [STLM] added new ABI feats support (generation, UUIDs, location...)
> >>  - [SYS/TLM] fixed module_init error path
> >>  - [SYS/TLM] fixed interval DISCRETE flags reporting
> >>  - [SYS/TLM] check open FMODE before executing a config change
> >>  - [SYS/TLM] fixing DEs data cleanup on RESET
> >>  - [SYS/TLM] added _RAW helpers to handle non-MMIO TDCF-like accesses
> >>    (like Notification payload)
> >>  - [SYS/TLM] added UUID rescan logic at DE enable, when DE/UUID associ=
ation
> >>  - [TLM] reworked UUID internal handling (endianity) and use uuid_t ty=
pe
> >>  - [TLM] added generic Telemetry protocol support for events subscript=
ion
> >>    unknown
> >>  - residual sparse fixes
> >> v5 --> v6
> >>  - rebased on v7.2-rc4
> >>  - fixed a lot of Sashiko complains
> >>  - fixed ABI issues reported by review (Fayssal)
> >>  - added IOCTL TLM_RESET
> >>  - added ABI versioning
> >>  - added compat_ioctl support
> >>  - use a new IOCTL magic name
> >>  - better handling of UUID endianity
> >>  - reworked all bounds checks in UAPI implementation
> >>  - reject oversized SHMTI mmap request
> >>  - refined 'stlm' testing tool to be more interactive and to
> >>    exercise the full spectrum of IOCTLs ('stlm -h' is your manual
> >>    for now :P)
> >>  - fully reworked per-protocol notification handling
> >>  - dropped the last bit of human readable data attached to the
> >>    chardev .read
> >> v4 --> v5
> >>  - rebased on v7.2-rc1
> >>  - dropped FileSystem based driver
> >>  - introduced a new simple chardev SCMI driver using Telemetry
> >>  - reworked/reviewed the v4 IOCTLs based UAPI
> >>  - UAPI: better struct alignment and comments
> >>  - UAI: Removed flexible array members
> >>  - UAPI: make SCMI Telemetry protocol stack completely independent fro=
m
> >>          uapi defs
> >>  - UAPI: new ioctls support to enable RAW mmap direct access to SCMI S=
HMTI
> >>          areas from userspace
> >>  - added new ABI Documentation
> >>  - added new SCMI core facility to lookup the current SCMI instance ID
> >> v3 --> v4
> >>  - rebased on v7.1-rc7
> >>  - updatded doc to detail Concurrency model
> >>  - bail out on FW_BUG errors
> >>  - make all_des_enable/all_des_tstamp_enable entry readable
> >>  - refactored access to TDE values
> >>  - refactored common accessors for tlm_priv (FIX WARN on kfree)
> >>  - make all files by default world readable and user writable (if need=
ed)
> >>  - added uid/god/umask mount options (and docs)
> >>  - added generation counter to aid spotting config changes (and docs)
> >>  - added DebugFS configurable support to debug/dump SHMTI areas (and d=
ocs)
> >>  - hide FS entries when NOT supported (like des_simple_sample_read)
> >>  - fixed output format of des/<NNN>/value to -> <TS> <VALUE>
> >>  - renamed top-dir by_components to by-components
> >>  - add a .remove method to SCMI System Telemetry Driver
> >>  - use kzalloc_obj
> >> V2 --> V3
> >>  - rebased on v7.0-rc5
> >>  - ported the firmware interface to SCMI v4.0 BETA
> >>  - split the SCMI protocol layer in a lot of small patches
> >>  - completd filesystem and ABI documentation
> >>  - renamed components subtree to by_components
> >>  - fixed uninitialized var in scmi_telemetry_de_subdir_symlink
> >>  - renamd tstamp_exp to tstamp_rate
> >>  - swap logic in scmi_telemetry_initial_state_lookup
> >>  - use memcpy_from_le32 where required
> >>  - changed a dfew dev_err into Telemetry traces
> >>  - define and use new helper scmi_telemetry_de_unlink
> >>  - simplify a few assignments with ternary ops
> >>  - added a missing __mmust_check on the internal SCMI API
> >>  - reworked and clarified de_data_read returned errno:
> >>         ENODATA vs EINVAL vs ENODEV/ENOENT
> >>  - removed some risky/unneeded devres allocations
> >>  - various checkpatch fixes
> >>  - reworked and clarified usage of traces in Telemetry
> >>  - added the missing DT binding for protocol 0x1B
> >>  - split out unrelated change around notification from patch
> >>    adding support for protocol internal notifier
> >>  - more comments
> >>
> >> V1 --> V2
> >>  - rebased on v6.19-rc3
> >>  - harden TDCF shared memory areas accesses by using proper accessors
> >>  - reworked protocol resources lifecycle to allow lazy enumeration
> >>  - using NEW FS mount API
> >>  - reworked FS inode allocation to use a std kmem_cache
> >>  - fixed a few IOCTLs support routine to support lazy enumeration
> >>  - added (RFC) a new FS lazy mount option to support lazily population=
 of
> >>    some subtrees of the FS (des/ groups/ components/)
> >>  - reworked implementation of components/ alternative FS view to use
> >>    symlinks instead of hardlinks
> >>  - added a basic simple (RFC) testing tool to exercise UAPI ioctls int=
erface
> >>  - hardened Telmetry protocol and driver to support partial out-of-spe=
c FW
> >>    lacking some cmds (best effort)
> >>  - reworked probing races handling
> >>  - reviewed behaviour on unmount/unload
> >>  - added support for Boot_ON Telemetry by supporting SCMI Telemetry cm=
ds:
> >>    + DE_ENABLED_LIST
> >>    + CONFIG_GET
> >>  - added FS and ABI docs
> >>
> >> RFC --> V1
> >> ---
> >>  - moved from SysFS/chardev to a full fledged FS
> >>  - added support for SCMI Telemetry BLK timestamps
> >>
> >> [0]: https://developer.arm.com/documentation/den0056/f/?lang=3Den
> >> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git/lo=
g/?h=3Dscmi_telemetry_ng_V7
> >>
> >> Cristian Marussi (23):
> >>   firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
> >>   firmware: arm_scmi: Allow registration of unknown-size events/report=
s
> >>   firmware: arm_scmi: Introduce protocol instance notifiers
> >>   dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
> >>   include: trace: Add Telemetry trace events
> >>   firmware: arm_scmi: Add basic Telemetry support
> >>   firmware: arm_scmi: Add support to parse SHMTIs areas
> >>   firmware: arm_scmi: Add Telemetry configuration operations
> >>   firmware: arm_scmi: Add Telemetry DataEvent read capabilities
> >>   firmware: arm_scmi: Add support for Telemetry reset
> >>   firmware: arm_scmi: Add Telemetry notification support
> >>   firmware: arm_scmi: Add support for boot-on Telemetry
> >>   firmware: arm-scmi: Add telemetry generic event support
> >>   firmware: arm_scmi: Add Telemetry generation counter event
> >>   firmware: arm_scmi: Add common per-protocol debugfs support
> >>   firmware: arm_scmi: Add Telemetry debugfs SHMTI dump support
> >>   firmware: arm_scmi: Add Telemetry debugfs ABI documentation
> >>   firmware: arm_scmi: Expose per-instance identifier
> >>   uapi: Add ARM SCMI Telemetry definitions
> >>   firmware: arm_scmi: Add System Telemetry driver
> >>   docs: ioctl-number: Add SCMI Ioctls
> >>   [RFC] Documentation: Add SCMI System Telemetry documentation
> >>   [RFC] tools/scmi: Add SCMI Telemetry testing tool
> >>
> >>  Documentation/ABI/testing/debugfs-scmi        |   22 +
> >>  .../bindings/firmware/arm,scmi.yaml           |    8 +
> >>  Documentation/userspace-api/index.rst         |    1 +
> >>  .../userspace-api/ioctl/ioctl-number.rst      |    1 +
> >>  Documentation/userspace-api/stlm.rst          |  148 +
> >>  MAINTAINERS                                   |    1 +
> >>  drivers/firmware/arm_scmi/Kconfig             |   24 +
> >>  drivers/firmware/arm_scmi/Makefile            |    3 +-
> >>  drivers/firmware/arm_scmi/common.h            |   18 +
> >>  drivers/firmware/arm_scmi/driver.c            |  119 +-
> >>  drivers/firmware/arm_scmi/notify.c            |   38 +-
> >>  drivers/firmware/arm_scmi/notify.h            |    8 +-
> >>  drivers/firmware/arm_scmi/protocols.h         |   17 +
> >>  .../firmware/arm_scmi/scmi_system_telemetry.c | 1515 +++++++
> >>  drivers/firmware/arm_scmi/telemetry.c         | 3762 ++++++++++++++++=
+
> >>  include/linux/scmi_protocol.h                 |  261 +-
> >>  include/trace/events/scmi.h                   |   48 +-
> >>  include/uapi/linux/scmi.h                     |  517 +++
> >>  tools/testing/scmi/Makefile                   |   25 +
> >>  tools/testing/scmi/stlm.c                     | 1371 ++++++
> >>  20 files changed, 7877 insertions(+), 30 deletions(-)
> >>  create mode 100644 Documentation/userspace-api/stlm.rst
> >>  create mode 100644 drivers/firmware/arm_scmi/scmi_system_telemetry.c
> >>  create mode 100644 drivers/firmware/arm_scmi/telemetry.c
> >>  create mode 100644 include/uapi/linux/scmi.h
> >>  create mode 100644 tools/testing/scmi/Makefile
> >>  create mode 100644 tools/testing/scmi/stlm.c
> >>
> >> --
> >> 2.54.0
> >>
> >>
> >
> >   Just to close the loop on my earlier comment: the second telemetry pr=
ovider
> >   I  had in mind is now public, RISC-V RPMI Specifications Telemetry
> > service group:
> >
> >     https://github.com/riscv-non-isa/riscv-rpmi/pull/162
> >
> >   V7 has already moved the SCMI ABI in a better direction: explicit ABI
> >   features,  reserved growth space, UUID tracking, batched operations,
> > per-item status
> >   and a  generation event make the interface less brittle than the
> > version I first
> >   commented on.
> >
> >   So I am not asking to block SCMI Telemetry on a generic telemetry UAP=
I. That
> >   would still be premature. My remaining ask is smaller: please keep th=
e
> >   chardev-facing descriptor/group/config/sample/mmap handling cleanly
> >   separated  from SCMI-private storage and TDCF parsing.
>
> IIRC, this is not a ABI concern, right?
>
> Any kernel internal refactorings can be had later, once RPMI actually lan=
ds.
>

 Yes, fair point.

  The internal provider/backend split is not an ABI requirement by itself, =
and I
  agree that a real common internal layer can wait until there is a second =
Linux
  provider, such as RPMI, to model it against.

> --
> Cheers,
>
> David


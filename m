Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F241AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzolVecyU7xCDbiR1k1HPzw1C+jyDg91c7zVGsJFgCM=; b=sncA60zzOkPC32OpVnILr4bge1
	oAWnuVA00DqfToUkOLUHt21QX7dIrUeZB5SDR7StJ/qtGJFPXSABLP+ivhUY2rBGOZakOdx3QcPQ8
	zxwH0tlgQ5JrOKokYYOiTg9sXvNw3PxnGhw+lP1OdbprNsxkEASzM60BMLxyhA0ouip1EaSAeWuAx
	wta6cext0pWsJL1szAajdadhz5uGLdWmcRVX0kVgFLuaZ6EFAocyGe44WjIJIlHaPMxRahW2nzn5I
	09jJ+Zg8f7MnppksCu8zbcPcNm4msgy7tznlIsD7CU54Gp8Bq3ACfmhdgFUwQ6wV3QXFlX/nwLMY5
	BJsYFdIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzvU-0000000Eyyn-2Syf;
	Wed, 15 Jul 2026 13:45:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzvR-0000000Eyy7-1Pl9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:45:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FDIA113852639
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 13:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zzolVecyU7xCDbiR1k1HPzw1C+jyDg91c7zVGsJFgCM=; b=BRhhLUKSPjb7QTqU
	f2n/Mjl2g1+SfugWNXYVF8Ka2SqDjn17CF7RkNWKsR5tTK2pswCftD7/um4zCf1T
	g7W32GrhUEtyzgUtbu479q0LOeDUg50Il7qFe73l5cCNy1U/AdvYBzrTWFEYLC7j
	/2O7c6/1C9LYoiKVGKj5Kw2F9wv6iLNdigp4U74mLpHFJ6EKrL4QrtfLlIUjVxZT
	2SIhx+hgoLMLeCpqg8rUSo2ahrMH431EO7FnUVgRSIbQEMR/FOLjCNV26cWX9wV4
	STXZTE0+381nkLQ5EBgslKKMj4oirFZjiOkVnvqkmp7hOiFhn0pGu7qrtsv+/AyP
	o+Ahxg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feayfg3mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 13:45:24 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bf9f0ec129so332716e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 06:45:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784123124; cv=none;
        d=google.com; s=arc-20260327;
        b=oEX5vcHujMjmcNVjz82rgeP0sI1RXTZ/wxzice7aqlZj73TmavSQyfjTm15otILDfV
         sSKVb58yIhkteVXSjRLP+5v2rNdYyXojN6Tw1bYmtADsMt9o+wsQYbsBLecc3Q3jxpDN
         rX1C1QoKzxYEbf4w/GAIzkY6l+7ahUmMqwWBLzXjCE6sO+ypRVC5Gx2xp5iM3xvbEk/a
         B8vNHYkp0TOvKcFv+8a4hoDayFaApVfateubk2wM0isBYfJnnjOw0BKjPHl8diT/sUM5
         /BY8CWaUwuEt/csfMziE9jjEyb7MkCy04PQQ2T9h0xMAd7eTDRxPBxJsXF560EwKXntB
         TyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zzolVecyU7xCDbiR1k1HPzw1C+jyDg91c7zVGsJFgCM=;
        fh=s2Hlm2ZCjeXFGDyrgdjY95VGlbFg+m7HFavdQTcsLdk=;
        b=BICOB26eQhiOLVNlYwIKWkSmWyQvxuuaopu6LOyoZpezoh43JPg0lGvH0ck2MwjUe+
         fkZc2trzTjkYNoTr7387wYCynC9TKokMg5TKjcHsQC/BRTusAgL3y5gAwCIxgv5rwFte
         pnlLw9sUXh5IV4sNBxD8zZnYYEa94rtvfr0jjZY5EoWQAyiv9kN8pPkWTlc/rgq51KHi
         W+S0MoXje1/CouSY8/WgJtc3DlHJIb3Q9ZkS3cJ1mrhlOqHkvfcWWXIL53qB0KBF/jt3
         WPELrwOR8R59CT2FHcXFHM62wb1QCt9SKxapeazS0Yqe3+Im70RztDWgwWbHA3MI76jF
         FpPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784123124; x=1784727924; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zzolVecyU7xCDbiR1k1HPzw1C+jyDg91c7zVGsJFgCM=;
        b=NUkrtqsfoOBTpJpqRg6pcNZwWbcaOKfnaMHKpdADrubCcxmSTFz0Rd3V+sjEmlNi6H
         vAiLziVXfoPEWprPBXuJcLF8l4k8trnjMIWhE5ae8cNxgMeJxtPFZ7+H+rzdveyPWVb8
         +GKndseyy6ajiwRggKPc8D1RnDka9xIfERkw0ywj7nH/FXiePMTjRLdNGHf2icAPNiqg
         2qyNFrZw6T5H9gcTGDTV6aD3CVLMSd03RSfTN+AZJi4S85+ye3OxEGS395yQ3aMYlkZV
         SU+qPDJLI+B9HKrlx50UBEgham15GaTlVXZtVmW7QODnxqEE8Vf1XEhVGDHqD4cjJ6pP
         K8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784123124; x=1784727924;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zzolVecyU7xCDbiR1k1HPzw1C+jyDg91c7zVGsJFgCM=;
        b=NOW0FGSXjdyK/hBNYtMKh6Jafm54cBRa86zM8hFzle98hWHlhezCMALFGH4uS2iR9z
         7tcoKgHsJqt43I/ZNdKQBD0B4hgZLQY2UmlPW4lhWIVd9nxGGSWbGUd7GqOAFQ9YlbYo
         c/0sWJ/bZUqMc/l9Rk+V49rpsPz8bzHo0BSJqG4algaN39oiVJr8StIATTdSwxoU9QOi
         EjH6s/neX15Oc8mSC5VVbB0gx3tio4TDctv+0jhPyLQvuGzVjNl7Bj24PxXRqUJkPy0t
         XI6+iKAI1ufvXqDOGore1CdDcH3w8BzEHbQkWJRS1OCgfaI1Rmtjt0RdddAnQ5RtCDiY
         jJAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr34epZD9GlABdvCrS3+2PPAe1c2tsG5GWftQ5T/uGlqyDOs3g5/By3mMfV1+bjQkx+oyHu8vpHWRc7gzd/D7LR@lists.infradead.org
X-Gm-Message-State: AOJu0YydhV5GXd78kUN5SVnEUA64wcYrjRz6Qt2Su6+4i2tNnOPwLgPp
	vi9oGjdmi0HyB8XRbIx/S9J2ioPMUq20zg/3Ocp+tAAB5ArnoQtbaoz7fmZUgC2orsXEAkuQTuX
	I+h8WJhoMj20OUHWaOeEoEV1p6gboKOCFo6uMKD7TpKsnKFCA8GPtdw6eID27px9tis4DdbkBYM
	9jco+qHrAi6Lzj3pscbZSmFBtx4IxGgSOKcbcUEEalK/1UTyZerOHe
X-Gm-Gg: AfdE7cngHylRX3YeBwhZKMj5dlUDmQGgzZypw9Ib9kOkjBT85J/6gIxUuXlLbQ5hdfg
	DBn+So5XxE1FWGpoQEN6VqETMSK+MyXayh/1wTRobe2avZC34ZhBbuEjq3kj8lk7rPTbTme72EF
	G6mJdWxKEsQd+RHy7ZP9CxLwuOcgIkgzGl1QgkqQK2HsMBpz3huQGRnDrMaYIys84rtT3JAA==
X-Received: by 2002:a05:6122:630b:20b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5bfbed3cf39mr2838562e0c.0.1784123123161;
        Wed, 15 Jul 2026 06:45:23 -0700 (PDT)
X-Received: by 2002:a05:6122:630b:20b0:5bd:9cbc:93c6 with SMTP id
 71dfb90a1353d-5bfbed3cf39mr2838540e0c.0.1784123122615; Wed, 15 Jul 2026
 06:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260703123601.381275-1-cristian.marussi@arm.com>
 <20260707063137.3222972-1-subrahmanya.lingappa@oss.qualcomm.com> <alCuJsOgh1ioFHAL@pluto>
In-Reply-To: <alCuJsOgh1ioFHAL@pluto>
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:15:10 +0530
X-Gm-Features: AUfX_mwOsEl-1DJimYGFdHI_-VDYZRzTcceTkY7F0B8vlv1MlXAozQXMHqdl8zE
Message-ID: <CAPxK-6cE7QAnMxO843T_MhipsVed=q7M6yQG6q5mAknY+T91kw@mail.gmail.com>
Subject: Re: [PATCH v5 00/23] Introduce SCMI Telemetry support
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
        lukasz.luba@arm.com, philip.radford@arm.com, brauner@kernel.org,
        david@kernel.org, souvik.chakravarty@arm.com, leitao@kernel.org,
        kas@kernel.org, puranjay@kernel.org, usama.arif@linux.dev,
        kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: wiwt6R_fL-rEWZxu9sqNhHze4ENi3a-n
X-Authority-Analysis: v=2.4 cv=WoMb99fv c=1 sm=1 tr=0 ts=6a578ef4 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=WFKNzKktctN1nZ96czkA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX42TWdd/nQfoQ
 FtR9wxursoFYKroTnKMYlNoUihvZHLHtbpVf3SRT1mQX0JV7hhfNzpySZL6j8uvOqa6jOEkSe/7
 sNTF2UDn5zZO9p9MtVH2MnziULr/VnifXIr0c42pUSRG1cAZ3b/UgVpSkleLD0KdIHoeOol8b2s
 iibI9ZLw+zjgz/xkOjMzLpu526ydv4LRgKbqKnVdSqRTEWCjGdk+q5dxAgmZcdGrbsTU1fyikyS
 l2tpZPNVYE00MsNjlVuem5sD1aXlsUSj99x3vZYqXBX43QlaakGDr0rRQk4f3NaoJhGJO4m0JRx
 +65Jt8pQ+tx6FQwR7KiKFedQ16FFV7NqbTaSDUcgnOwTUaTh9jmJT0rrfPaPoyRDajY1vSAKuZp
 7PSdQi/H+jPdV0zj8+ZL5O8iQfYU6kCi+0Sod8Ue3ROZ6jaUTNjT4DaxPz74czWNhJHCV+TBU/D
 BZCooMyJGhHwH4990AA==
X-Proofpoint-ORIG-GUID: wiwt6R_fL-rEWZxu9sqNhHze4ENi3a-n
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfXxZbfpdeW4U5T
 bqtOj8YB66CICqGeL42ZoXEKFdeSt7a749InA+7IpQMpb9+jvmXn9palFixKmSnXFQLBP8BMryx
 6mBEJrqMoFpgNdZtVWP7ILsvmTYni/M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_064525_505686_27E8AAD1 
X-CRM114-Status: GOOD (  46.03  )
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

 Hi David, Cristian,

 Thanks, both. Fair points.

On Fri, Jul 10, 2026 at 2:02=E2=80=AFPM Cristian Marussi
<cristian.marussi@arm.com> wrote:
>
> On Tue, Jul 07, 2026 at 12:01:37PM +0530, Subrahmanya Lingappa wrote:
> > Hi Cristian,
>
> Hi,
>
> I will add a few considerations here aside the main points highlighed
> already by David in this thread.
>
> >
> > Thanks for posting this. I think the direction of not forcing these
> > Telemetry Data Events into hwmon/IIO/perf prematurely is the right one.
> > The cover letter explains the core problem well: most DE IDs are
> > platform-defined, and without external metadata the kernel cannot relia=
bly
> > know whether a DE is a thermal sensor, a performance counter, a power v=
alue,
> > or something entirely platform-specific.
> >
> > That said, I think the current layering is still too SCMI-shaped for th=
e
> > ABI it is trying to introduce.
> >
>
> well... "Introduce SCMI Telemetry" seems a pretty much telling $SUBJECT :=
P
>
> > The thing being exposed here is not only "SCMI Telemetry"; it is a more
> > general kernel concept of telemetry:
> >
> >   - enumerate provider-specific data/event descriptors
> >   - expose capabilities, units, data format and topology/grouping metad=
ata
> >   - configure collection rate and collection mode where supported
> >   - collect samples with timestamp/freshness/validity information
> >   - track generation/state changes
> >   - optionally expose provider-private raw backing storage for debuggin=
g
> >
> > SCMI is one provider of that model. It happens to transport the data th=
rough
> > SCMI v4.0 concepts such as DEs, groups, SHMTIs and TDCF. But another fi=
rmware
> > or control-plane specification could show up later with the same broad
> > telemetry model and a different wire format. Call it XXMI or YYMI: the
> > protocol mechanics would differ, but the kernel consumers should not ha=
ve to
> > learn a new in-kernel and userspace ABI for each one.
> >
>
> So, in the early episodes of this Telemetry 'saga' when it still was an
> RFC [1] in which I was exploring/experimenting/evaluating different appro=
aches
> I DID mention that one possible evolutions of whatever interface would ha=
ve been
> used (SysFS vs chardev vs FileSystem) could have been:
>
> "D. generalize enough one of the above choices to make it abstract enough
>    that other non-SCMI based telemetry can plug into some sort of geenric
>    Telemetry subsystem"
>
> ...BUT the reality check that immediately stopped this possibility onto
> his tracks for me was the fact that at that time, like now, there was/is
> ONLY the SCMI protocol acting as a possible Telemetry provider so that wo=
uld
> have meant:
>
>  1. limited real use case examples to use to build a common Telemetry abs=
traction
>     resulting most probably in a 'generic' common framework heavily
>     biased toward SCMI mechanisms...for the simple fact that only SCMI re=
ally
>     existed that provided such broad range of generic telemetry data....
>
>  2. sure rejection from upstream, having created a supposedly generic com=
mon
>     framework, sadly used by....just ONLY one user
>
> These concerns came on top of the basic main fact that, as David pointed =
out,
> a fully generic and common abstraction of Telemetry concepts is hard...
>
> ...it definitely seems easy at first by looking at some basic simple
> common ideas, but it quickly becomes very challenging to represent in a
> common way very speficic bits like, as an example, topology, grouping
> etc etc ...and again especially when you have ONLY one user of this new
> abstraction to look at for inspiration ...
>
> > The common ABI should therefore avoid treating the DE numeric namespace=
 or
> > the wire/storage format as the abstraction. The useful common contract =
is
> > closer to:
> >
> >   - what is being measured: component/type/instance/name;
> >   - how to interpret it: unit, exponent/rate unit, data width and signe=
dness;
> >   - how it behaves: instantaneous, accumulating, average, state/counter=
, etc.;
> >   - how it is controlled: individual event vs group-wide collection;
> >   - how fresh it is: timestamp, sequence/generation and validity/error =
flags.
> >
> > So I would strongly consider inserting a generic telemetry layer above =
SCMI,
> > with SCMI registering as a telemetry provider rather than owning the st=
able
> > userspace ABI directly.
> >
> > Roughly:
> >
> >   drivers/telemetry/
> >       provider registration
> >       descriptor/sample/config abstractions
> >       generation tracking and poll support
> >       common userspace ABI
> >
> >   drivers/firmware/arm_scmi/telemetry.c
> >       SCMI protocol implementation
> >       TDCF/SHMTI/notification parsing
> >       translation into generic telemetry descriptors/samples
> >
> >   optional provider-private raw/debug path
> >       SCMI SHMTI mmap or dumps, if kept, behind explicit privilege/debu=
g
> >       policy rather than as the baseline telemetry ABI
> >
> > With that shape, future in-kernel consumers could bind to generic telem=
etry
> > objects and capabilities instead of SCMI internals. Architected/well-kn=
own
> > DEs could later grow adapters into hwmon/IIO/perf where the semantics a=
re
> > clear, while platform-specific DEs remain available through the generic
> > telemetry interface plus userspace metadata.
> >
> > This would also help avoid making the SCMI protocol's internal resource
> > storage part of the ABI. Right now the public protocol header exposes
> > structures such as scmi_telemetry_res_info, scmi_telemetry_group and
>
> Well here you are mentioning the SCMI internal API as exposed by the SCMI
> core in include/linux/scmi_protocol.h and used by SCMI drivers to build
> on top of the common protocol layer...of course it is SCMI specific,
> always will be, even when/if a common Telemetry framework would exist.
>
> > scmi_telemetry_de, and the chardev indexes those objects directly. That=
 feels
> > too tightly coupled for something that may need more consumers later. I=
 would
> > prefer copy-out or iterator-style provider ops instead, for example:
> >
> >   info_get()
> >   de_count_get()
> >   de_info_get()
> >   group_info_get()
> >   intervals_get()
> >   collection_set()
> >   collection_get()
> >   sample_read()
> >   reset()
> >
> > where the backing arrays, xarrays, lazy enumeration, SHMTI mappings and=
 TDCF
> > parsing remain private to the SCMI provider.
>
> I could agree on this...IF any of this would have a chance to exist now
> with the current existing Telemetry providers...thing that seems not
> plausible for the reasons above....
>
> >
> > The sample side probably needs an explicit common result contract too. =
A
> > sample is not only an integer value: it may have optional timestamping,
> > provider data width, stale/not-yet-valid state, partial collection fail=
ures,
> > hardware-fault indications, and a sequence/generation value that lets
> > userspace detect races against reconfiguration or shared-memory updates=
. Those
> > details can still be backed by SCMI-specific status codes and TDCF pars=
ing
> > internally, but I think the stable ABI should expose them in provider-n=
eutral
> > terms.
>
> Yes some of these are theoretically possible, but NOT really in the only
> example we have so far that is SCMI....
>
> >
> > I would also be careful about freezing the raw SHMTI mmap part as a bas=
eline
> > ABI. It is useful for bring-up and high-performance tooling, but it exp=
oses
> > firmware-owned shared memory layout and TDCF parsing rules directly to
> > userspace. If this stays, I think it should be clearly separated as a
> > privileged/debug/raw provider facility, with a precise mmap contract:
> >
> >   - required mmap length
> >   - vm_pgoff semantics
> >   - page alignment
> >   - VMA flags
> >   - cache/coherency expectations
> >   - lifetime across reset/remove/reprobe
> >   - required capability, if any
>
> I would also prefer to expose only kernel mediated Telemetry data to
> avoid fragmentation (even within the same protocol when implemented by
> different vendors...), BUT RAW access I am afraid is inevitable to be
> able to write high-perf tools, and those will have necessarily to be
> protocol/backend specific...
>
> ...which leads straight to the other point raised by David...
>
> ...Is really a common Telemetry UAPI needed ?
>
> ...if anyway multiple protocols would dictate multiple custom tools
> probably not...
>
> > Even outside the raw mmap case, telemetry can be a sensitive high-rate =
view
> > of system behavior. The ABI should make access policy explicit: who can
> > enumerate, who can read, who can change collection state, and whether
> > production systems can restrict sampling granularity or intervals
> > independently of what firmware advertises.
> >
>
> Yes this has defintely to be documented better...but..
>
> ..this is something again very much protocol specific, that evidentiates
> once more that a common ABI to rule them all is not probably the way...
>
> ...in SCMI the platform firmware is the ultimate arbiter, it is in charge
> of any kind of policying...it can cope even with the most unreasonable
> asks coming from the agents, even come from root privileged users...
>
> ...simply because those requests will get denied OR silently ignored...
>
> ...in the case of SCMI Telemetry, as an example, it is up to the server e=
xpose
> to the Linux Agent ONLY what it deems to be safe enough to be shared with=
 normal
> world entities without the risk of enabling side channel attacks...
>
> IOW, in the SCMI world, in any protocol, the agents see and live in an
> illusion that is created and enforced by the SCMI server, if you are
> switching your point of view and start considering how to enforce policie=
s
> around SCMI resources at the agent level ("...only root will be able to d=
o
> that"), you are already doing it wrong...
>
> Can this view of the platform be absracted, Telemetry-wise, in a common
> interface across any other protocol and any other arch ?
>
> It seems to me, again, very unlikely...
>
> > For the stable telemetry ABI, I would start smaller: descriptor enumera=
tion,
> > sample reads with validity metadata, optional group-aware configuration=
, and a
> > generation counter/poll mechanism so userspace can detect reconfigurati=
on or
> > partial re-enumeration races.
> >
> > One other point related to this layering: configuration appears to be g=
lobal
> > to the SCMI instance. Any process opening /dev/scmi/tlm_N can change
> > collection mode, sampling interval, DE enablement and timestamp state f=
or
> > other users. That may be OK, but it should be an explicit policy decisi=
on.
>
> Based on the SCMI architecture and the SCMI implementation in Linux, the
> only boundary that you can use to identify a 'user' is am SCMI instance
> (i.e. one /dev/scmi/tlm_<N>) because that is what the server(s) on the ot=
her
> side can identify as a distinct agent and that it can fed with a well def=
ined
> set of resources at enumeration time...especially in the case of Telemetr=
y
> it seems dificult to be able to partition resources at the agent side...
>
> As it was with the defunct Filesyste approach, I would NOT in general
> enfore any policy on configuration...last config request will win PLUS
> a generation counter to spot unexpected reconfig happening in background.=
..
>
> If you are using 2 tools or daemons to configure telemetry on the same
> system in a conflicting way, it is NONE of kernel businness, you have a
> misconfigured platform..
>
> Last but NOT least, I think that maybe a Telemetry framework subsystem
> could be instead useful for future possible in-kernel users of Telemetry
> (you may have mentioned that too..) ... should someone decide to use this
> type of data in-kernel, it would certainly be useful to a have common
> in-kernel API to consume these data no matter which is the provider from
> which that data is collected...
>
> ...BUT, again, in this case we do NOT even have a single user as of now
> to model this intefrcae against, since we are currently NOT using SCMI
> Telemetry for that...so it is seems even more a remote/impossible thing
> to get something like this upstream for now...
>
> Thanks,
> Cristian
>
> [1]: https://lore.kernel.org/arm-scmi/20250620192813.2463367-1-cristian.m=
arussi@arm.com/
>

 I agree that asking this series to grow a generic telemetry subsystem now =
is
 too much. With only SCMI in-tree, it would be easy to create a "generic"
 interface that is really just SCMI with different names. I also agree that=
 raw
 SHMTI is not just a debug path if the expected users are high-rate tooling=
.

 So let me narrow the ask.

 I am not asking for `drivers/telemetry/` in v6. I am asking that the SCMI
 chardev/UAPI not be tied too closely to the current SCMI core storage layo=
ut.
 In particular, I think v6 should try to:

   - copy descriptor/config/sample data through fixed and extensible UAPI
     structs, not structs mirroring SCMI internal objects;
   - treat DE IDs, group IDs and SHMTI IDs as protocol identifiers, not as
     implicit indexes into kernel arrays;
   - keep the TDCF/SHMTI parsing and SCMI command handling behind small
     internal ops used by the chardev side;
   - document the config model explicitly: per SCMI instance, last writer w=
ins,
     generation changes tell userspace that state changed;
   - document the mmap contract: length, offsets, cache attributes, lifetim=
e,
     and reset/reconfiguration behaviour.

 That keeps the ABI explicitly SCMI-specific and does not make SHMTI second
 class. It just avoids baking too much of today's SCMI implementation shape=
 into
 the userspace contract.

 Cristian's point about policy being enforced by the SCMI server also makes
 sense to me. I am not suggesting Linux should second-guess that partitioni=
ng.
 Documenting the Linux-visible semantics is enough: what is shared per SCMI
 instance, what userspace may race with, and how generation/poll reports th=
at.

 So I would reduce my earlier suggestion to: no generic framework required =
now,
 but please keep a clean provider/backend boundary inside the driver and le=
ave
 some UAPI growth room. That should make a later common layer possible, if =
a
 second provider or an in-kernel user ever justifies it, without forcing th=
is
 series to solve that problem today.

 Thanks,
 Subrahmanya


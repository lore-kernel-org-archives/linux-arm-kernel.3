Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEB8CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 14:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkSambIUQitGRlTvVm9rbPHKE+ioSB6QhEypVQhx7ss=; b=Li4mTwvfnH9pjT
	jqdJxKhJyt1V5boqwb5w0uPhpOBpt6zCntjJplqf3Q3VuLQruQ3YYDr3qLufmOh+VThn6Mi3HscJc
	PcBOJnoKon0nTWmGNb8C7PXrFKyGJfYnF/7mEFzyEo7x6dH9y3cY91j4Tf4wGcp3ur0o1j5snW18T
	8vrMw+sby6FqUDLSrvzWqOYw28wcG8MNLfPQrvlkcWYIpY6JZSr6aVtC919qReOpHM6IJ8vKzZ4yv
	a60lkjEdVWCsltrrWlB5r254pVLiqEv82EDii5AjzO5/YyTVBt7ipIlrvkZhiQYyECohVlyvyXd9z
	Qr2gFO4YAX0AVfVtjlVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxiQ-00000005oXe-1ELA;
	Tue, 09 Jun 2026 14:46:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxiO-00000005oWX-0Uky
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 14:46:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClGBv2251529
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 14:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=BkSambIUQitGRlTvVm9rbPHKE+ioSB6QhEypVQhx7ss=; b=YU
	qcfUNUaOVUkovl/5AssMnAttWPY7SDezAdkO+w640KWrdDbDpxlMFLt8DDCQtOjc
	+GKx50SzLMy8zXgyM7r6SadFmanGTCCh7Y6CNvOHlCuk5QzVyVhgliKcnHKdVXmD
	LHJOQTbG1Jl9u1IVSLFyut3VMqBblidslvPIklCQxjOKdvhp+hQKHcPB1D48e31v
	xP0VHjZ6VJo8RfJSRmq929I3fyQ45t0Xb3iClFnOMwR0OPWnJ4pZGWf1y+awNqtD
	LPFHaxwjMu5LiQ2a/EO+zXdnCzNmY2kzen8bQG/C0g/roSiKTi0NDEoSqxzcFxPM
	AGOBDDAAltAUPagEOjNQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqghxa0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 14:46:03 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7e90f879daaso99997567b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 07:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781016363; cv=none;
        d=google.com; s=arc-20240605;
        b=AEwz9te4b6YhVwlbWEQRBD+I+6lkl/ETAnfPAirDCXfkr9opcWTGFW/UWLtlyYihUf
         nLboVvpx8Z6TeQSni/PNd765Zx5VSAE8/3cRaRX+GZMBUlsBYtzfPKIgnvxu/UDg/gEw
         7kfWVG+pBNVsYce4Ki39cuZ++H7lhiPW1xf2fpTrsejdhAGzgeA4nLk35Ylvgy41SzNM
         O8OIg7u47/+gFvaBQ19UR/f65ns5UBdaaof3H/5830WQ0Fw0Yy9XJD/eniHxxdusWXGJ
         0ORycAP4HvUIuhcIwZRh6bF3IQUyGjb52uxcuRiBEsogb5+yHxWGMJSVrAun1DVBAhs/
         FASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=BkSambIUQitGRlTvVm9rbPHKE+ioSB6QhEypVQhx7ss=;
        fh=Ef9ORcl8AzCD5t1/zWouLigqHZvqfklNJRYPzmR/o+4=;
        b=gBStxLPBZ4Yrm2tQmZ/QQ5OsxcpcCf4iVDQ9QIAkPc57ccPxctblyzEk43Wv+mAj+J
         f1eJUS/ySHVuiItu9FXZazvvqXmfiyOgxzWrt7y0MA2P5zAfdk2rmsY5IaM1tNEcks8D
         yJv+kMmO9KjEMrTNb6wHgVYt7qPRaUiXwGrDRb2Ytb8zz5YonOdvPVeEQOoADzKXx6rx
         QwFGiRivohuUMup/TuTBw9FMjZY/d1Dnvur785sYArXK8hnLOtUOkTrmJ6y4NG8x2dXR
         kiWd1PYzQRBxg9sZRfmcSPjLGll1EUUOSbYIH0D84R2+M7LJloRQY2+nWZtPvtfhTNlr
         YiVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781016363; x=1781621163; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BkSambIUQitGRlTvVm9rbPHKE+ioSB6QhEypVQhx7ss=;
        b=UT5iqQJdBjh2EvTu6iq9XUV220is7djhH0y5zRRPf/MncV9XdSDbbhdefoi6UizX7G
         zW+femH/nuqTUe4mh24jV3pvJztPJO/Kqu6Wb4e4+iqTw7+hKaMCsWkch/KJPP6TecAA
         PkUbbFJeE13sLd6BPCpEO5QtDiC1Qvf+mXR2hm7z+yq7ouuD+Rc76lhygGmxjFBHv9aN
         jwUtCIgjjlX9+//awDl83xYQE0Sb6Ka2FQS3XFZBtG3IdM6YTSEv/98bTA5E9frBXfwe
         yvDXMEhICEDGJR+R7M2AipFy2PNXeuS/KfWfQeRgOeNbb4+T3unvhMghBfhqaY0ZDsAN
         XN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016363; x=1781621163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BkSambIUQitGRlTvVm9rbPHKE+ioSB6QhEypVQhx7ss=;
        b=Z1daLIpqxBogX1q/3mm2SAQHbfq0icXOen9y/THzOweB9N+XsQbBYMbBi44lV4qiiG
         3DG1l9N82wazHsloz1GPoVoYWKjrSseDS1IUsujtsvw6bTRYZLPZrzniHNXDmtSoyJtV
         HtxrO2MOYZVHqfgTEH7U4lBc3hNPMjkCBqREfWkhMXM7O4o8DnlH1DqUsegjD3XkwfKf
         KVOJ9mTQ+ByBdk+Rh/QGCcVD4xK12Hn3g+mWpfF7PI+7CjyA5zR+45zPBntiqWWpHd6d
         FByhkGrYF00epY1cNSGYUEoLHEAX7+StJpWRIPajfvHsL4GFFo+7BxPF1eDxLy6df1PY
         SUdA==
X-Forwarded-Encrypted: i=1; AFNElJ8ye5gb3j4BoUz4gVDS+e4P0r/Vuz1XQAFiI6ElHAKxhje0ZTCn7Tg0AN2M5L3QM3GZyzwcYKS2j72iQjdLgP/5@lists.infradead.org
X-Gm-Message-State: AOJu0YxVsagLN+IQRI54UrCi5HExcidZKaZlRUflJrlI3DqgNAhg9X5i
	rT+QhBTMTVV9QLucqxiOnGr01FVozmU48IGvEHw0TSOuucWWEUDuEJTZ95pyjEwI5/VoMtVaK3G
	cezYMyMPq/MlhO2PD8nqSt7agYd/xR7FH+y9tYOGoiaZqpJrUiQfP0k4Jc/ymXfVUrz51aOrfvn
	bBmgMuf2O2gHnV2YhXdxLyyVjiJfyOxIAbjDoKnDYScnERr6rrSW8L
X-Gm-Gg: Acq92OEFzXGu0zUk681+5PrpN3NY1/s0u0AdnNksgTlehm5iXu0kFIL+QKuQN2Jhrv5
	UiNv934YbffHxnBx7l8WvrPFqTR5QWb80HYpZCAsMNtN2B/vsnIeeYxZTDMd0uMcI2T6uTu4A3a
	plpsLB8lUIeQ0loybAWWT/wsKJcFIt+9tE7W4useIbgoCWk54lr55ew88wU8awyig6Slr+inIq/
	ZuczHPk8xLQeOu5Ew==
X-Received: by 2002:a05:690c:600a:b0:7dd:35fb:a529 with SMTP id 00721157ae682-7ed0f826fb1mr175041197b3.25.1781016362730;
        Tue, 09 Jun 2026 07:46:02 -0700 (PDT)
X-Received: by 2002:a05:690c:600a:b0:7dd:35fb:a529 with SMTP id
 00721157ae682-7ed0f826fb1mr175040657b3.25.1781016362226; Tue, 09 Jun 2026
 07:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-1-23ffa16b6ebb@kernel.org>
 <CAB19ukFFwm3ehzkBFr+oXRjA7VK_4_=XHFSuqdEpbVqUz8Do4Q@mail.gmail.com> <aifahCtdj8GpHN/v@lpieralisi>
In-Reply-To: <aifahCtdj8GpHN/v@lpieralisi>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 20:15:51 +0530
X-Gm-Features: AVVi8Cd9pzTcVntwOkdct8eFjOpuS2Xxx1qo-G3imlUBB7gP99ylMuHrty8LTZg
Message-ID: <CAB19ukHAAHp5kmm+5KBDqtn969h3V4LBr2put9hJSWphPS8jmw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] ACPI: RISC-V: Fix riscv_acpi_irq_get_dep() loop termination
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Sunil V L <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Anup Patel <anup@brainfault.org>, Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MCBTYWx0ZWRfX96gkHi4datxQ
 +eaUQTDpxUGMbWjeUOhbmsnMY91L3aVeyOwpKuUmkvAwG/Ekenh6ofVjzFI4t09DZOprSkRZ8R3
 4TJDjnvS8NFFY3dGwZxvRK0VX8Yu22JpSBBlpbY///UATIgx/pwUdA0LA9jzUj4rMbRhHAPh+4F
 PCI1wMKnJGa5Ov8gYpZ8bsul7SOJya3nJR1JFvGrWS+wzNrXbECN2qUG4Ag5WCJ1VcAVt620BzH
 U+kMXE4EsAbP8on2Bv6AoG0pTn8dUq2lj1N1U0WL0ZTrPBt5pQkbWgtWy+n0HavYzowVbfL0/FG
 v1MrssPDlsq/v6K9qR4jlb/AqM79PJFjYKoiWtvzqAuBePDLSekz6lQ8LsmxXz7Qc1IPWRTR9I0
 GeTnDgAt6HCTDtrFrKMTRJT0TO8xjrSI6gqFB1Y+StJkgTTIvXYqjJsrKMqpLgTCnM4SNDj1GF4
 kT7fQOAoZL8Pp/UD4qw==
X-Proofpoint-ORIG-GUID: -3X9d6zThq7gaANNJKjdr7xQLT3fviMN
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a28272b cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=45POYx1-RFdywSfKWh4A:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: -3X9d6zThq7gaANNJKjdr7xQLT3fviMN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_074604_207526_AFA22042 
X-CRM114-Status: GOOD (  14.37  )
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
Reply-To: sunilvl@oss.qualcomm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jun 9, 2026 at 2:49=E2=80=AFPM Lorenzo Pieralisi <lpieralisi@kernel=
.org> wrote:
>
> On Mon, Jun 08, 2026 at 09:54:28PM +0530, Sunil V L wrote:
> > Hi Lorenzo,
> >
> > On Wed, Jun 3, 2026 at 1:51=E2=80=AFPM Lorenzo Pieralisi <lpieralisi@ke=
rnel.org> wrote:
> > >
[...]
> > Do these fixes need the Fixes tag?
>
> I can add a Fixes: tag but I wanted first some help testing them, it
> is code perusal that got me there.
>
Oh, yes. I tested these changes on the RISC-V virt platform.

So for RISC-V testing,

Tested-by: Sunil V L <sunilvl@oss.qualcomm.com>

> > Otherwise, LGTM.
> > Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
>
> Thanks,
> Lorenzo


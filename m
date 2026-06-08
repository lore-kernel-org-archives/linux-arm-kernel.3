Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C3BCD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dh0My5XPTw0EtAcYMuaP9DIqaOn+MAp7VRpz58CInTM=; b=F8lJSyOKgazwHt
	+WEDsbU2ddGc3GrRN9cRRKiv0z4nSiW9gHuKZtHviJqrLUiWeYAg8y8+PNzuM3vxCz+WByc2YiLo6
	srji682rrl+RwtWZL/MZ58WDRe4cpsJByrDcW5Bl5eLm5GYLvvQHVqvWbgkM13nHGTlGonRS8vkL+
	62mWm17RagVrJZk9WiVZ236nHJcdX5r//IumIwK82F104wdj5uyWhNwbpTcig7F+SQtehY+JJcLfH
	IJ0XXbv+Q0Fq48fj3p/NEKqirPgsQ80r6mGZ7yVBXFyJ1brouEPVjOGh2K74TMAy7q2xB+WKcuZeQ
	uiehcTF67hawkiqDggVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcsy-000000044qo-3qC7;
	Mon, 08 Jun 2026 16:31:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcsr-000000044ok-3pBV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:31:31 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFR0v4041643
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 16:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Dh0My5XPTw0EtAcYMuaP9DIqaOn+MAp7VRpz58CInTM=; b=bK
	UroUnhkz4pKQ36Eqx2OGDhGkz7J6Re/8ZFD82X0RehI7Y0MGj8NHovKB/97jYISn
	fudrob/coutlI9v+msh9ROiWhUMQ8PO/M+dKlF0civ+oQsu85Ade9En7qOvTf8ka
	Kb+aY7g3PrKtluAcX6wpYzIzOLTDqPDc9qgZKUlxWZEXfNJ2CU85gD/6FWG5IWUF
	bo0oN1oSSu5ihMosfyOpGFYaVVXxWPRbQDBfVYtWCirjdLKRLAFxMPbnEHWfJRm2
	GvSPIoVqBJKrLAJ6igEQPSCeJZarVZUJQbOkkhXfmbau/+2UV8zwUObFZ71lIRTA
	dKV2VrrDJz5GcxOhOv4g==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsv98v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 16:31:28 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66034c1b31cso6784985d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:31:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780936288; cv=none;
        d=google.com; s=arc-20240605;
        b=IJ4iZe2W2LT+vlm+eXQB63QZjeBaOEi99gLtWBabaPpCiK17V/iRdnXSwV1Ay8eCXh
         LpqvxcLMgMZJs5qCXTsbZR7MtF9eSj9DMJHltLajqKYdQaIkMJbRgn86HI2Pm6YVCJUQ
         RhU4FEAbef9C4tT+vdOC7qjPFTjDQAhMAeIPpRg+d+9FOCvB57AWij2eMpYZD9WAAHh8
         Ss5rOsrThVmRAt7l/HjNnry/ZySeltE+BXs/GS0viIyNUJoFnBe7/sngKDI/+XTFxcgH
         OM5++wY1YpjnE2TpG0Uv4j8a/OcR4HgaLfY9AgznwsBgqaTngJEAiRcCgSmgHC6ROjDA
         RsNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Dh0My5XPTw0EtAcYMuaP9DIqaOn+MAp7VRpz58CInTM=;
        fh=kuVfXCQAbqtQUMqB2KR4/oWDV+97egou8UaU8DOGUuc=;
        b=W36uMCgAHqtmsW1pg7Wwm/RbtELl2j096lfafi0vsOAib/W4IdX517ja58O8FZ75po
         QkfEOVxmoJub0gwTOiZL8gQD36IbhU9vTGqnf63TUUafhKqVHbr83p4AUGPDbQwM/LFH
         eNqwMK4i8OftOxx4RrzVYSUcdyjpGlZ0isvrb+hMcFmOi4O8I9qpzgPl2tBXFiKVh7r6
         N4LKk3ZVyV5CXfzSQApFHKFys9SJ1SaMTwlX1Qg0KS/T6DNxpJ9i6xlXFEMLXAuKXOlD
         eSGq6aYWDsieeBIWKLcLx+XpMnQVLwjfDkIp7RHqOKBw6GXytyGxYWNHKcmvzB5uIuT1
         6D0Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780936288; x=1781541088; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dh0My5XPTw0EtAcYMuaP9DIqaOn+MAp7VRpz58CInTM=;
        b=RNh8wffYiLFzInYqfT2l480o/OL79GGVHScamIQ6GgH3whWJuob5nipqnjBJRpV7TX
         oawc2Z6ylKLJySg2qrd1aiAZ/QLBRV5JD0xvmQBwchF4uyRpqr3YS3RLEw4Yt5piI/yA
         hYZuSoA1KAPI1+zVPm+TSc9wWdqFVkL6w4b3x1PVPRgzbYOBVey5FQj5inD1U5NvAEqt
         EshiE+0vlzZ3/hcJR6t/KJLsoL/SF2Zz64i1isdgdPSuhQgC9gx2VH/vhtrAbmzIIVnc
         KfVnS8BWwqQDuDzry2xFcijipV7/ADfnvwrij04tICwDVkdOfkl20UDX7WKOUe6LolKF
         xe+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780936288; x=1781541088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dh0My5XPTw0EtAcYMuaP9DIqaOn+MAp7VRpz58CInTM=;
        b=ZhjjeQzfD94a/LVoNWrk5iSks+QjpTGHrNcPUJHiH/uOudL8q0NrnQjS08Y7oagPRb
         yRoBsh/9h/etQcnLCpOh+WRQSq31ck3f0QnJ/vn2AdVuw5M09VyLULiJ81PhyoGFMRi2
         6tHHDIAbgomireyDFAab5qAR0M5pKGg7LRLmwOT4K0uOIMQIf+VWz9OMhJx9C1rel17K
         Yg30g28fPpFFk7HYTiDgLFjezuGcto2bpg5ZWHkvHAVYlKv8nf1E/oILAdgybIWAIttt
         fES9DMe9qoRc5BPXL1crWnCm3WMm8M3jiXAYbFTFWvw63/80I747K6epTi1kGjgjjk9i
         KnTw==
X-Forwarded-Encrypted: i=1; AFNElJ9wbh5ezecsuATeTaCk9ruuiuO57COUm5RtAh7qXR0QnZIEwJV3tQme44XtsVZwi2CdJ81J0aMtRvLwGkCqi/sT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8UAjWDuqSYiij/zpu8mWJ/hnBrke1wM2uf6IO/skUIYgL1rmh
	RwxO/IdxjOQQyQO+BHq5GjqCppsT77AXnSYn0B2C6Eah3hWRLpxiz7JMGLx6APC3dyW272+7ioM
	No7uqxUN+fPR/S+X0FtuagmE2dLsxXJk5vMotbXtHdZCrQXBoKW+/mUt98lr9ks/ebPFAWmMIcU
	LTAoJ+mGyYmFpN+D6aQPi4paVXo198QqLgldQlCEU5NohScUc3Fw18
X-Gm-Gg: Acq92OHQXTo0cD1ctjDTP4AyT74Y13AUMDFEQbWAgg0LA5fOb4zDixwkSl9Rnnvh6hb
	Gbw8fIQJZ95oLLkf8ULRThU6+vDjqmUF0G/FqlFjCH+o8Ca1otO+FrDwbOqaGgFVQ4sqoqt6fq8
	OSgCLtkV2fNXk2c8zCeW1Z+9X5dg5/MhAjpp56njoZgKiK4Tn9GWmbRlVgStGdn4y2vbRgFynXp
	oqECNxhgZIz9SbZqw==
X-Received: by 2002:a05:690e:1919:b0:65c:1011:8a8 with SMTP id 956f58d0204a3-66106f38d32mr13567116d50.34.1780936288331;
        Mon, 08 Jun 2026 09:31:28 -0700 (PDT)
X-Received: by 2002:a05:690e:1919:b0:65c:1011:8a8 with SMTP id
 956f58d0204a3-66106f38d32mr13567038d50.34.1780936287720; Mon, 08 Jun 2026
 09:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-2-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-2-23ffa16b6ebb@kernel.org>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 22:01:16 +0530
X-Gm-Features: AVVi8Ce85oHpnPDkl3loJMYesa9hqOwx4u4ydQ5fzIl78S7nrYXEW2Qks7w8mXs
Message-ID: <CAB19ukFVPnWhgvb9icFU44L5qre8ViNTEHg_uvK5232PnCEE5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] ACPI: RISC-V: Check acpi_get_handle() status in riscv_acpi_add_prt_dep()
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
X-Proofpoint-GUID: rgacse4g2dkwjStQB0jTdSGPLTACpVaj
X-Proofpoint-ORIG-GUID: rgacse4g2dkwjStQB0jTdSGPLTACpVaj
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a26ee60 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=bDdBU3oEAAAA:8 a=EUspDBNiAAAA:8
 a=S6Q6xKXrEcqShMHWKZgA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE1NyBTYWx0ZWRfX+VGKllylQqGB
 9M6xIlAVHphtXcYKbCdk/aSmHa2LkpAFc1ySPp4t8ZBAWr6OPfMn12k3qKw/GhWdScAdVurXPpl
 F1Ck6LSD2rtWjJDU0ztqpEBHn877xsTWcTEjEwpSmqMLfuDbCBhBCcG80IQ/dFEJd0nnmPPDc8y
 xIWFYvnALAiTU9/F3Rd03e52szXolwDQvRvx+EoNf0a+j3JqvIuolOAGThZ90g9YT60gjagj9ps
 vuKy0BCddcZ7P14nxs0i+fl3UCFC2GMt9zTFaMLPyV+C0U4g+sNK0ekSbRlZVcb9/PS1XpardjT
 Kwonr4/lUeKD197vXUTfaWyUPp0f1sM+83SO3kH4POMU+FDSfoAV0bqaJBrGOQBGV97GsI0wwQW
 9osTuHXUNPI4R5h4vYI/wnb7Me4oZDlbaqg6d6hapmv3TdZ/HgFsyP0+0epKz3ZrcDI6L50bqVG
 QGehuamfPhXa3CymeEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_093130_063000_CC3D1993 
X-CRM114-Status: GOOD (  19.49  )
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

On Wed, Jun 3, 2026 at 1:52=E2=80=AFPM Lorenzo Pieralisi <lpieralisi@kernel=
.org> wrote:
>
> In riscv_acpi_add_prt_dep(), the acpi_get_handle() call can fail which
> would leave link_handle uninitialized.
>
> Fix it by checking the acpi_get_handle() return status and skip the entry
> if it fails.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/acpi/riscv/irq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
> index cd83c3035cf6..75170151c614 100644
> --- a/drivers/acpi/riscv/irq.c
> +++ b/drivers/acpi/riscv/irq.c
> @@ -339,7 +339,9 @@ static u32 riscv_acpi_add_prt_dep(acpi_handle handle)
>         entry =3D buffer.pointer;
>         while (entry && (entry->length > 0)) {
>                 if (entry->source[0]) {
> -                       acpi_get_handle(handle, entry->source, &link_hand=
le);
> +                       status =3D acpi_get_handle(handle, entry->source,=
 &link_handle);
> +                       if (ACPI_FAILURE(status))
> +                               continue;
>                         dep_devices.count =3D 1;
>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>


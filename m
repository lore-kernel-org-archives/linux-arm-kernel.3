Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB47CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+auThQZxPAjxDc0fMSepBAYMkGW6rfzA+iCSa7438U=; b=xQeagu6uILi79D
	YZTnDzPIGMHCIuUyuMoYyXjEtBVMY5/jXfup7jhZp7qDz7SqZoS3mVayPerFL1w28WlwrD6V+GnIi
	H2KM2znxolK1wEI/oKkbEgH05E3MpVW3D2gTFDVaMeeH9CplvR819x3FTV7pOpRBb1S/aFQoEcZe1
	fswcREc3ZJDTKFs3yp0DAwMBUVy9Dq+iDCG0dcVuGNdBSgkrfkgowAV4HCsjvHp2NbqdboSYeW96N
	Y2fpXVGSSCtwhOP27yg/PDw+bDt5aucG5OyNoN/b6gUL/Uoqv+zKw23iCMcVe3UZmNt3lCW3oz7+8
	xzzdTN3CtgF/d8YW61QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWczd-000000045d5-3PVU;
	Mon, 08 Jun 2026 16:38:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWczb-000000045cT-3yfI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:38:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFRpg3592848
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 16:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=c+auThQZxPAjxDc0fMSepBAYMkGW6rfzA+iCSa7438U=; b=aL
	VN1rGk2GnCSWpr/C5mhI7V/5mo7au+DRCD5bCtE/56VkmF3zZDD5S4QGK7eSdi5N
	UDkPQvz/UwKEQ20ogLUtz1AcvotEMA2huV18YXdRP65okCDNEJ6s1EDD3/5TwpDE
	4uwuNiz1cEICsvSq5yq0VanLSarRqXHJ5Z/nihGen/hbOw+rv0BrlL6ic+AjCYVB
	sC3pDYPM5qOzS5R4T2Oa4Mft44f38yL7Ok/A+AK4478fvwXX47e5FexQBHRoHG9G
	JUvnodwGcFbbiUaiSjH374OIWgz7p5hfDSJLtjjr8OF4szDFHS7ga8B9VfPqNUN+
	Cbh3tK++gPAtQHfjYzqg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m1de0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 16:38:27 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7e86a896175so81697987b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780936707; cv=none;
        d=google.com; s=arc-20240605;
        b=V/yHr3E63hoUFPO7dtbQ94OnxzqNDEEDz1APls1VVfn3d9YJW6Jwth5ZNU4kkXoEtH
         jdkPkhta2Ar4pb3+i7wX0l3IaG4SeVbpqkhxSfksjKCHOV2jIz4F3gpPInEqYkaHg6+z
         I9FH3Q6KrAqisR9hElsUBgsHxwJasG03XU3huQ6KLDwW/yagxNMMWTgTayb18Sh8GFAg
         WMoqYpTai569v6oBZjPRHQnGBa/M2Ec2lQrOp0TWKgOPtJJFtcdKDPORa/+qt0lJubiW
         J5f6LAQZmTOPDRq+6XzgxBG7QcRAOc8hfRd1rTJsE9/LfQNRPivncf7yHvzudACSB9K0
         DUQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=c+auThQZxPAjxDc0fMSepBAYMkGW6rfzA+iCSa7438U=;
        fh=9QjHY6x/YaquynKMkbixj0rmvz0L3SFzCip1MJ349ws=;
        b=QIAnvKPJgDH7hQkE69A2dexjpG1BRH5v5ZmZ5t8cbFtQQTCaeKQMkVIHRjUt4fTUgl
         n5lzkyBcQdWCG+DC15j8C9IXTmDaXKSOBFLQ7m28uS5JTqMlja/j41hSDD4+/awOch1O
         /SZYdStS9f19YV12dGzZxt8EQZcMNlCzb7C2S/sMkUQejz20nWL7RhdiTQ4hPR41j44R
         Y80jnrqJ0Sdl/yT7X4bzdXt9IeJIIZtbRjmN3C+dJ+rB59w7kARbdc+AwQdtINZcZDCz
         nWMnfiAZmCgrK4LUAb3hx531dVYImqSf1XFiI5AHoe/WiaOrSaFwj3Gu6k5a0ajElvDd
         Tgvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780936707; x=1781541507; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c+auThQZxPAjxDc0fMSepBAYMkGW6rfzA+iCSa7438U=;
        b=Zenw7uPdviSMdaxRTw3ts2JRt5xTnocwaZytRD9KHTKcbTntvnA5K5I3krMW9icDiv
         n91p4Sh9cJ79WTjVEo/Oab3s9AsYVVTXGyRFQAaOJ8llMXMhFAA8M1RbrHEaq89ULelY
         7YV2UyaKq35WrHiD653eNWYrE4qJs7HOBHRmnf5LBDATnhUdc9vpHgaAqbBp2jjgLwR+
         M7wDihsMWGASlDeaPioqzj/iMOZIk6HmaEDlOuP698drPlmrg1GXR9Ga2QEA3p5ZWs56
         gUqTz8CvJIUBYTemThZOySN2cJJqMqfj2QiDj8qb97eZzvk5i/ghqtCeBna3lXHd5Sx9
         ymLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780936707; x=1781541507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c+auThQZxPAjxDc0fMSepBAYMkGW6rfzA+iCSa7438U=;
        b=JXrvLSHVL+ykKtK7KWHHtjbfoJx81GNi+jAwRNUUEagSKSmdJE4DBZDy0HT1bjwwA5
         CFrk8LU14WH/96v897G+z5kJdY+U1kmPaC8E2XN6R0nu3XlNhxCz0ykepXhImv4x0FrI
         p8slIbZMeY6FdjANg1qmBAS8ULuyeetVz9njGRhogwGLcqUVbUmeUYYxVC9Pqm7BipJ6
         A/wWhObNPxmQrovGi1epxYDF6em+55YjRMeQGvss2CM13/ytY0f0qZR+1IpULIg9rlE1
         xg6UQsYX8Z/LlEASQcyT+MWsTqXLJmn836jPIM4yQ5P5ui0eMlWs9mxsqJfterU2M0Gu
         2mvA==
X-Forwarded-Encrypted: i=1; AFNElJ/EZlKUG5slWH0tBd1nBKkifVHrUBx25vbX4S/ZS2GtZy27TmnA1/xK3nLT36NVEGrssVcu/6mLMGRKiXXY28Du@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy9CjDB5oqFkXZ2nVJa9fW2wVM6ojmgc+boQsq9LoUoxo9MLsp
	ZD7HWn21UxiMDVF3EHVNpZEPaQsoJctNywn33wzk/NYvD8zTaR7QsI7pwqJ68fSSggd1b47xcgn
	opQTLQffvWSDrFGxJI9gxEVCDP7Qq6Wtm1/5bDOlS4NYAbyGsMvuu1lWeDdPTQ62E0daegKyTrc
	N1aLwts8cGwq8Ztpvalr+N3vWVI3+5Osa0I9lR0LcImMy3jo/kUELr
X-Gm-Gg: Acq92OGlx2BOK6jekGxpQT9Av22p1zVxFPNZxFoqk+ZI9M22ZJUiJrZQyfVrL2CSsiw
	jonWk3DzCDESb4iDm5uaYE3Q0XrSKBsxfLSRNDckIGGtWSkYKViCJIWEYEibRKH8wJ5QguXytMo
	866v8yvCnaKJboC1Bqt+uLK6enLWLK/FduvGHHIWVGrhTw6z748YO8iWssAM1LilEIhOCiEZvQW
	JGsxfiEaaA7WsQPUQ==
X-Received: by 2002:a05:690c:e3d1:b0:79a:60f6:c5ed with SMTP id 00721157ae682-7ed0d3cbcc4mr155717547b3.6.1780936706597;
        Mon, 08 Jun 2026 09:38:26 -0700 (PDT)
X-Received: by 2002:a05:690c:e3d1:b0:79a:60f6:c5ed with SMTP id
 00721157ae682-7ed0d3cbcc4mr155716897b3.6.1780936706088; Mon, 08 Jun 2026
 09:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-4-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-4-23ffa16b6ebb@kernel.org>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 22:08:15 +0530
X-Gm-Features: AVVi8CdP_PRc1DJjUVOc0gMS_HHZf1oDGc6wp_gUILbiw5JbF5QWPmOsllQtoVM
Message-ID: <CAB19ukH5hx_kfpfcRiuPFrUmvFxMk3B08RNjcaxx3C6fDBS0dw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] ACPI: irq: Move RISC-V interrupt controllers
 autodep to ACPI IRQ code
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE1OSBTYWx0ZWRfX7hvfs/dS9IlU
 vIH8H3vcTe1O3JfTvvLSz7bieybEoNVqr0EwNkUumpnHj5FEQWve8dhA0JFDQuOxBUHnxaHFZU/
 x7RWpQE/1M5LIRX8rCLT3GEo8qrSUx3/W/9kPpOBQD2aFu6jB1cErJnKi0olINAS0TqOYmVlWzj
 NTRNQkTEjkze1R1B+sFtJmLcWAiFr58bkYp/mDNGIBLgVX2aCIxWqdc0qDRng3e3igDHZPZkK+4
 cXza5oz5oMTQhcvdauoL+F14uzsRLLYNDoJ9r1+ZX3vxjNM3fp7C0lFvQDG9UgXd+v1IHBh1k6/
 YmGPD9Ucr06WFxBvC2iNpa945ZXWTkRAhRIfegYOst16+oLlGtrvYExoOG1fK+J4EFVb1moX3Td
 ZNg5D8RD4Gd7rAcPXi9A5B71DfMUBZI0MKWNgT0K1jZ26dQACKnX+GUntO7qRU4J03Fb0Eduiih
 SfWVDYRBHPz1hoco1TQ==
X-Proofpoint-ORIG-GUID: SszKFEndChz5ZTifZpEMPCOWDsWYhyMK
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a26f003 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=W-_n0kkjAAAA:8 a=bDdBU3oEAAAA:8
 a=EUspDBNiAAAA:8 a=bDd8DhsF2Ke-o0a1jUUA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22 a=qeNa2pbTr82C0GpJEZFS:22 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-GUID: SszKFEndChz5ZTifZpEMPCOWDsWYhyMK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_093828_139531_435E7EBF 
X-CRM114-Status: GOOD (  18.21  )
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

On Wed, Jun 3, 2026 at 1:54=E2=80=AFPM Lorenzo Pieralisi <lpieralisi@kernel=
.org> wrote:
>
> RISC-V implements arch code to detect probe dependencies for devices and
> the interrupt controller the devices GSIs are routed to.
>
> The code itself is arch agnostic apart from an arch specific helper
> function required to retrieve the acpi_handle of the interrupt controller
> that manages the device GSI interrupt.
>
> In order to enable IRQ probe dependencies detection on other architecture=
s,
> move RISC-V IRQ probe dependency detection code to generic ACPI IRQ code.
>
> Allow interrupt controller drivers to register an arch specific function =
to
> determine the acpi_handle for a specific GSI number to use the mechanism =
if
> needed by the respective interrupt controller drivers.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Sunil V L <sunilvl@ventanamicro.com>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  arch/riscv/include/asm/acpi.h       |   1 +
>  drivers/acpi/irq.c                  | 172 ++++++++++++++++++++++++++++++=
+++++-
>  drivers/acpi/riscv/irq.c            | 156 +-----------------------------=
--
>  drivers/irqchip/irq-gic-v3.c        |   2 +-
>  drivers/irqchip/irq-gic-v5.c        |   2 +-
>  drivers/irqchip/irq-gic.c           |   2 +-
>  drivers/irqchip/irq-loongarch-cpu.c |   2 +-
>  drivers/irqchip/irq-riscv-intc.c    |   3 +-
>  include/linux/acpi.h                |   5 +-
>  9 files changed, 181 insertions(+), 164 deletions(-)
>
LGTM.

Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>


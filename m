Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A45CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omE+o90JVMH1c7abLG/VTyLnn33GZG5/r9bSbPT2L6M=; b=HYvtqFyO/swkgz
	kY9KAD9FC7F+mgcnUhSFQcAZS3L3wwI4oeoqDvAkde3ZZKcCQEQWRkNr6JCDtWNMKINMCR19vw7XB
	GJkWb/kvP5Zjdpc75foYZxi5J9kT7H77Dn9czCUnTb0kZEkOb9GGmjKjr+Rj4fBR2FltLh60y8JFW
	M6F/zJvGb3urY+m/oUTIom8msSQ9Q8p7e8FSktX8PfHoh0BDhIAfCBvbihTvwddxglIATYRekHkqd
	jHEsNEm/y1vlJijm+sY6gB88SGe4ADBVat3/y3dVM7L5T6oNBik5+mqfM3cVYHcrWLPm7KutKV+Ep
	JEuMW9THe++ECs2Z5NUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcmL-000000043ao-0ajq;
	Mon, 08 Jun 2026 16:24:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcmI-000000043Zy-2J7Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:24:43 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFUFW3592935
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 16:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=omE+o90JVMH1c7abLG/VTyLnn33GZG5/r9bSbPT2L6M=; b=CI
	oqh3I7IcyG/H02/RR9QY59roYBIBZCHhjF20nryzSkdGX9jFL1GYb5ZWrxtoNBNz
	P6gJKZcqLfYkRev1cXr/PJPRFcjxAED0USSsoam8+QonnPfDW1e4ruqcOe6Hw5/W
	7SPF7k0BTM+Hy2ZlbB/sekwRDyNPZCNjZpGEPJNr57AwW8djS4RrpTAQrPEZH0Xm
	NNgJUEvFgqCjNOYiuiJOet+bM7/RrUL+YoMQEi16G0mMaXUsRAtwntl3L1YRjoTh
	k30l132C1F26TWS6ladsXlcxx1wa2x8SEHioDW5H1JYYLQ4Fr0cHgZQg7Xj3nk/q
	Fcyn+p0Jc1Krn1Yq0K6A==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m1b8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 16:24:41 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6605859ed2eso6505521d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:24:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780935881; cv=none;
        d=google.com; s=arc-20240605;
        b=i1bttDJx08h/n+VSEdS14AkII+0WbXyKaP0G/8FtEeLRTCgG1aVQSiNwhn0LGOKyuG
         hLNNaFn2qhyYEvCV23Rr2jjoCZova6mZ3Qv539duXNgiHQJocNtgUYHswAqBxk83/i4A
         h2/BCuLnrKulQ17l/zNFe9BWxnMQ6XTzSKVs4MH07gu/3r6gCDtYYRrdVBbSkzfoPPVF
         t+kDvJYFyT0iky0oQ1HOXyPCuj84NlQDN158lW3BbUyt9DJph6ju10bk2GfsL59ULmo0
         n3t7X9hslF7Ej078QPlHn0FCXr6FqFGalj0Xa8FbJKBdW+zxBvWEl+A7j1cG7Ag2IiPl
         HBFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=omE+o90JVMH1c7abLG/VTyLnn33GZG5/r9bSbPT2L6M=;
        fh=/mmSuUKGNbSSgIrVOFI4fCxFQFgGmsB+Oi1hs6+BPPg=;
        b=lGi5RXrXb4zPeHk3rdiKIP1+ZzX7ypMJiiCRvomZP3czitMLbu3CB7lUMjzLPjAhdZ
         fbA28sI/MOZx+7573+JIWf+YGY3GfBB+4nF+BZAFJQ0pJKNbOk9CnryTaFPuG41UMQvI
         7YGkz1TkcYn5PJldyPrkJ737U7Rby5W1wq2ZY36CET5qu3v/eG6A0WRF9rAq4DzssIHU
         nOfAxkfBfj77GWPf4yJ/UOcYcSNvNa+saIwvLhfK61UWJ2LalRJlM9awraapBpZofwxR
         fDBZOPCyenOgahZ3HnNnrE0kb09Icm8Mw19/O9BA0Fgd6cEzF7YmiqrwBKRT8CLJtFrk
         A0/Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780935881; x=1781540681; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=omE+o90JVMH1c7abLG/VTyLnn33GZG5/r9bSbPT2L6M=;
        b=InWCZs6Ejfo+sFKb1z594HGNhy9P+pjkOsZFarmTqNKwhDhmDX0oEnl0vXJyFhllLA
         yS0DSbsmWhatUPkRpmdrzmq7QDCN8zKr/74o/szh7GwKwbRYgvx7yBJsRngObkkBnI3p
         es0C9CU6DNzHcPzHhXY4BUj8Mt+Lw9X423crdTWbj8bEmH9Hk+o9So7ryEeQgHHSm1Rj
         lcfuswQ8mbw3YwiRr4EP7AcMNd478mVdR3KiD4PzoQN401+GQBm0EqurrQlqRof2qWbd
         9FlOWgP47TbUgp+VwUOjIKsa4dayuf7Xo189fToMoyMceRyydUt0Th/sYgCaBCXa8tQh
         8tuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780935881; x=1781540681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=omE+o90JVMH1c7abLG/VTyLnn33GZG5/r9bSbPT2L6M=;
        b=RfDtb2/TNjZo55VCnXFV1hA5sBdzmVay5fC9Lt9BI/bh7fArkqFzW2dJX+fIUFxGzi
         XQQSpYYkABmVwVjNfb8aKu1wuRW6Hm6mQpsPAG5f2jschgqTPUdgNmy8rH6tARGehYc1
         cWsj8UjtxZhLiZik/Ku98icb/LMiOyuoChqrsqjcW5LX3KYsPLMbT57QDjyPDqnK5kqn
         oax1MMxelc9vHZsblCYuIG998+m875wMN7DN29/WIXlPyTMo4sOUTif5eQ8MJiJ61ltB
         ZlugAWNzsYxbC62h46zjzZnEAZMpVOd6c2YA4H5k936DEHupHLGqeW71UJgst894qSuq
         4sSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GV1ZzxyxBX+CEa8P6iP83rdjY+tq7saHVDlM4QUnW23OVFeAH4OLGoTlRmFd9BZOIPo++KaTO7bh54EsJIUD3@lists.infradead.org
X-Gm-Message-State: AOJu0YxZP7jpL6W4VdC6H294mUWqa1jIcfHE/BwZr0SY7rL4rYkNalQh
	P4DjQoMU0ntsgpeSo0axcj+4NUiOkZBHPpUqB2n/L7AVsm6po9GHNz/lCZY3DcGsvc3uCOgKr1V
	mjDbfKuccrfcn8ayyKP4Rn/fT7vLT6p2UXZsXwTE3+cps6xYe3qjfBh83Y7T514kSAVypIQeplW
	e3PLNqeyYEw1xl/5lmGybEZUSdggUVQ3EuSolc6FRydHNvyuccZk6c
X-Gm-Gg: Acq92OGqTtI7zv8dr7zhyEStUyUIEMW82DHGyAvU58Oj+ixF1EDu/qZmvSwWWWU51Rk
	NaDS4I6sX6lbYTpPC5U9KWB2GDM2xHiTwsv6cXEl0eR84/SBrxWk8Da4x8CbEp/sbKJwIGhYF3W
	+JuPR+4gTiLJqdAPUXBf78MiCHk9P8SBMe6PtX/gYsYQ5QJvStVkH1clfxyUYUIDITZQOgIWdpb
	7/ao+dUdEqbzwFGrg==
X-Received: by 2002:a53:c5c3:0:b0:65e:48cd:7fd2 with SMTP id 956f58d0204a3-66106f6a47bmr10491413d50.54.1780935880733;
        Mon, 08 Jun 2026 09:24:40 -0700 (PDT)
X-Received: by 2002:a53:c5c3:0:b0:65e:48cd:7fd2 with SMTP id
 956f58d0204a3-66106f6a47bmr10491371d50.54.1780935880148; Mon, 08 Jun 2026
 09:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-1-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-1-23ffa16b6ebb@kernel.org>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 21:54:28 +0530
X-Gm-Features: AVVi8Cd5IwkMkDgaeTWHmXts8_fu2m7CAyoGep37i45EZYnSM24rOUfn-o0eV7g
Message-ID: <CAB19ukFFwm3ehzkBFr+oXRjA7VK_4_=XHFSuqdEpbVqUz8Do4Q@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE1NSBTYWx0ZWRfX14eQSNqTsWB9
 DFem3RYvpTGpn+J5ugzC02jL7KrPe8wGegHEIP1s+lJlDDR1W9HP0NLzbWDmJah/sw+IjCFnKMR
 zspoPfYHx5YhIZ95TuVSGXMvcSzdylmX5g5wBQD6fpAejLSIYxXzgZjwf9PoyemDgxyJbEFvNKG
 PxtkfT9vRMPe1PnunGp/ErZFQvPLlTmwcA/yZa9yjZRAU3PKZ1X2/Gk7Q5TVxhy4zOR8hcSmnDn
 CquSTIWIZkFu7ORtLwRH/uiT/VZzZaIvBDeEYCJFgaNaGApJFTSWtNlyQt/NjIGofd5LehP/Iw7
 TLZcKQqM8TVY4AlS7WGYN77H6vaIBlLHsSoLhCEKgKh7JQaFnK+gP8eFOD9pstY6/oDlzBB3is/
 nP3b1hM8ZAYCcXtZWVfJwKxtC3yRobXGiPj9U896a5BoUpXH7GCfAT1P5cSd9YBcvSKUoP1q08P
 Egk5AgIoVEziVv8Muow==
X-Proofpoint-ORIG-GUID: 8WhSMyWUlRTQhTjihOj5oxD9YoY5xP4C
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a26ecc9 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=bDdBU3oEAAAA:8 a=EUspDBNiAAAA:8
 a=66Rqm3UGZClwUuHIDRgA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-GUID: 8WhSMyWUlRTQhTjihOj5oxD9YoY5xP4C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1011 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_092442_645918_B328FABF 
X-CRM114-Status: GOOD (  25.53  )
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

Hi Lorenzo,

On Wed, Jun 3, 2026 at 1:51=E2=80=AFPM Lorenzo Pieralisi <lpieralisi@kernel=
.org> wrote:
>
> In riscv_acpi_add_irq_dep() the main loop condition would currently stop
> the loop if an interrupt descriptor contains an interrupt for which the
> respective GSI handle is NULL, which is not correct because subsequent
> interrupts in the interrupt descriptor might still have a GSI dependency
> that must not be skipped.
>
> Rework riscv_acpi_add_irq_dep() and the riscv_acpi_irq_get_dep() call cha=
in
> to fix it - by not forcing the loop to stop in order to guarantee
> dependency detection for all the interrupt entries in the CRS descriptor.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/acpi/riscv/irq.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
> index 9b88d0993e88..cd83c3035cf6 100644
> --- a/drivers/acpi/riscv/irq.c
> +++ b/drivers/acpi/riscv/irq.c
> @@ -299,6 +299,7 @@ static acpi_status riscv_acpi_irq_get_parent(struct a=
cpi_resource *ares, void *c
>                         return AE_OK;
>
>                 ctx->handle =3D riscv_acpi_get_gsi_handle(eirq->interrupt=
s[ctx->index]);
> +               ctx->rc =3D 0;
>                 return AE_CTRL_TERMINATE;
>         }
>
> @@ -314,10 +315,8 @@ static int riscv_acpi_irq_get_dep(acpi_handle handle=
, unsigned int index, acpi_h
>
>         acpi_walk_resources(handle, METHOD_NAME__CRS, riscv_acpi_irq_get_=
parent, &ctx);
>         *gsi_handle =3D ctx.handle;
> -       if (*gsi_handle)
> -               return 1;
>
> -       return 0;
> +       return ctx.rc;
>  }
>
>  static u32 riscv_acpi_add_prt_dep(acpi_handle handle)
> @@ -381,8 +380,11 @@ static u32 riscv_acpi_add_irq_dep(acpi_handle handle=
)
>         int i;
>
>         for (i =3D 0;
> -            riscv_acpi_irq_get_dep(handle, i, &gsi_handle);
> +            !riscv_acpi_irq_get_dep(handle, i, &gsi_handle);
>              i++) {
> +               if (!gsi_handle)
> +                       continue;
> +
>                 dep_devices.count =3D 1;
>                 dep_devices.handles =3D kzalloc_objs(*dep_devices.handles=
, 1);
>                 if (!dep_devices.handles) {
>
Do these fixes need the Fixes tag?

Otherwise, LGTM.
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>

Thanks!
Sunil


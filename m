Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471FECD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DUE+ny+UnvWaJEVXkhAnSWXizCbQqgAqEbs9h0LudUU=; b=x28AQLbPePKoHa
	DLASKZvz5fX9ZNF1HZw3+EPcYGkOIqPeb/sXVglz7VKOEilJyYpf9gi0SdCVMVHRDuPYXvDAZjG3O
	bplRDQbQjvlIuyqbpr2jw0ClnLpKeKQM2LCLWZwG3A1bj8aF5z3odUKS4KHIDOKvA2dZ6pkiy8oH0
	dCG7HhDa1OrTmECMmlfn/pbRtSIGFas1GDmlNazqLd/5RTX9eD8Lx27v6mmyM6ZtvN1hxtEx/Lnl0
	VorQ8PgHnysRx1fC7ahdtv8/owsRooqotLZOtJb81ny64xyjkfvRzNMUai3hPPzy0LCQRffr3DjEC
	/tG+Wd+nTTFsF731VdyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcsC-000000044dp-2UCc;
	Mon, 08 Jun 2026 16:30:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcsA-000000044cb-0jRe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:30:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFVFw3588414
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 16:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=DUE+ny+UnvWaJEVXkhAnSWXizCbQqgAqEbs9h0LudUU=; b=Jc
	ShYuEjajO11QNx+P9XS8wV9QDiTTs4AcyuiWhZop6oA4R9vpZ/xuIk3VJ2UdMP+Q
	VlhjAXtHNd9pPr5psE0IzXfZYONSAiBszhF0CHHLiAssX93R/s/ov0pnNY+VxI9h
	cc/uAg63M5E/lbbbFSOLxpdvIjy9piS03SS9/QsQwhQ/chI/zRMAhd96k1KBqYYT
	DZIaBhu3e62xqVfo3MbNxxoS998MXMxlsuzkyWTTA2y2AltD+UyHqwqUYVFSbsQ/
	DU9NJKE+MdXMxcp0OsN+/eA3ASnZpuLWKbWz0gt/sUDQpCZpJ2e29vUlhcBDcq3r
	jno72HC2CrKW3VjfocPQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun41sfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 16:30:45 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-660d7828a5bso9150732d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780936245; cv=none;
        d=google.com; s=arc-20240605;
        b=UHrgi4Up9C1as2Lp2dD6vn67TAvqAMangFT7i+2BxFIOJaZN0SNpHJ3gUkZBatjzJy
         cisHXMscZ8herDoaNgwNIrhPCjv2AehEL8wj3e07EGaIrNVwz5PZ+supRmmU81009Y4B
         J+/evN9wrhGsB739u+9HaIkCRJiS0d4XoK+0n/dy199kSvIm8HYoqr+6XS29oMB2m40O
         uaQN9YaLxmYEEhUTumd3/rZYT0Mp9avqHMN1U8smEyRMbcBReuKehDx2epm4jLyOuRcd
         kVD4Gs/SfkRcdsjqJ7mhUCOuKunAT8NijCj23jGUkdXRPohcUWWIvyUu4SwfL5dOE3oN
         XSJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=DUE+ny+UnvWaJEVXkhAnSWXizCbQqgAqEbs9h0LudUU=;
        fh=LbiDx8RdB9+wZUUrWEsWof2LgrKlz7UX0/1Q2sUreA0=;
        b=LKjT5JfHaPPD0N383OYJOLxE8j9b4eVhlBZYuy+XxQQTcMss05Szc1lT9J1qRHXgZQ
         E3JZ0nDX1+vktfVgsWgsGVIXjVRT8HQVtcAgWRxVh0HVD7SQNaypf1Ur+XyOVoYoD1RQ
         zgyWTeW8Gb+huKw2BCwIA4yEWugFy2oWMIPdi1OJTcObJEWGYAHZG/iBv5w7QvYfOBR/
         gXfg+o+KeO23AzFRl+gojgL7Us9Lqb7tuzKqkxuVBeu5B2g58S85WJKpswRgIeaTdy2d
         fWhhGfkFsWXzjcVtGygDkG7qPfg49zsJ+AeiU0trVcibettBMjj8GKX9fStwo9gKO4LI
         4Vbg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780936245; x=1781541045; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DUE+ny+UnvWaJEVXkhAnSWXizCbQqgAqEbs9h0LudUU=;
        b=YZMVJgWaEfUW9N0akPp3nQ/MehgOnzC/74nAMa0mYH42dTqlqYvKRRV12vtscxdEjw
         xWqFxemTD9yZBBgQXLfwv+SPDsP9LemTbnEEthyFHS7NInjRiunWPLZEuN6Q00Jr266B
         siOpEoNIdxF4W3nlz1R1CpgvJlcn8LJc8xl3waLXK0kY8x5Wv4NxCcT2fzscx/EbOC13
         KOfL3TSwCZ6gbAm0fqggf2lmmPDx4BcFcDLGVqSEq/Atndc+rW6dRrG7rjww+weo0sAe
         2hrwrRHbEBJOycDx9WnzDqhFURfVWIHBcsegJYioP4bJMsBR5clj8b9vrIXUbRZz+vkr
         ZoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780936245; x=1781541045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DUE+ny+UnvWaJEVXkhAnSWXizCbQqgAqEbs9h0LudUU=;
        b=akxLxbxF3z+uHkLMCJtSEd/xX2N/7ZmuF90v6+8i8FSpxBAhbhIMH7M+PFLVgpmYnY
         Tnj6J76Ft6dQ21R5S+7UeJnvdGMjfH6dQ1pTIxnF3i0qA7TKL6lxN4BZI89px5X+/So8
         LE0DTG068e13CFD29XQ8vdapYT3CIMp1S2MyWMeC9nh17ozjiRdzAr9dTtiOsTCStoNj
         2yBpsbqDgxTrKcile6EaxQ4rUCN+FKwKmKss0TfwjuOhgzfZh0SkzDwxbyV5jwOdI5lk
         qh3o1H5TCdlhCxPXbTmX22eCjPkAsVbojdDqn9ajN5el0O7gXeIv9djNoP75eIibNAFX
         BCcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+bDzYWhgPt0QkuoMAJdte4V/qK/7TkLErmzfwnAGAjm+3In6GM6/DETM9P2Qtjk48dVJFDDdYJW3J6yt4X9eTn@lists.infradead.org
X-Gm-Message-State: AOJu0YziYtTN7AkvKjyPmq0Zx1OgIlnuS1vZTKJOUoF8u6oBxp65S3VY
	coXeRCb/VD46PXalVYtponIu0DUYoJSPVLTvU3USimMoBPYKT73TI4SFgFEV4BsQiJsukXxHSCx
	J+1g9lcC8AExm5jcCOc75ujWa4+IfVSUFSm3aF8UlHJgqCCv4xIGpUNUa7PM+5gHcDe4kKKxbqz
	3mpjbfHQwILYML56j4Bi0Vxtic/uopmKsn6S9fkMrHFQCvMFzMMwNy
X-Gm-Gg: Acq92OHyDF5C8bXi/MBY/PeHE+nwUH4K/4qa8Hpv9Ki1Xtay3JKUIDN7wtVYxy7lJAd
	cRm/4zRvkm1iJ7lbV744TJY3gfXaBF4yA3nFaqDIjYhpMgKm8BHME6FaZjYpCGa0EuAvw6PM3M+
	AYoJh7atC07IBevnBtMQnpyEZfpORoQsFEJsOoLsDD7vUSpGMxORPoNWQ1HfEOlZQoz3/78wg2Z
	6a+UA/Z1IlnorR84A==
X-Received: by 2002:a05:690e:138d:b0:660:529f:76c2 with SMTP id 956f58d0204a3-6610a62ba9dmr11112994d50.8.1780936244699;
        Mon, 08 Jun 2026 09:30:44 -0700 (PDT)
X-Received: by 2002:a05:690e:138d:b0:660:529f:76c2 with SMTP id
 956f58d0204a3-6610a62ba9dmr11112955d50.8.1780936244186; Mon, 08 Jun 2026
 09:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-3-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-3-23ffa16b6ebb@kernel.org>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 22:00:32 +0530
X-Gm-Features: AVVi8CcjdmtpKU9pycNL-hwxjKIaJHrcR5nC3cRzrIaKxh71BhOXsVMQNx-uaR8
Message-ID: <CAB19ukFw34et9YULib7i-xXPirrW-TVK96PH3KKR0Nb0iiwjNw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] ACPI: RISC-V: Fix riscv_acpi_add_prt_dep() loop handling
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE1NyBTYWx0ZWRfXz3ifvYJjMG3O
 iFvzE/PP/uF9VKC2M1ia+rWMTSynh21sDHdhBFferUVcHIR/bys3g+96uIaMusjnlv+x3PxZFX6
 aDBz1wz7QPn+T2dvBxVCrhrjUnu8anRkuUb+dGHzNY9cWIFqV+xFL9A0IuXGQ4Bt7lilXK0JAD+
 dQ1Pn7l8G+lNiM5R1AYljC1HHyHAYkzaubvJ0dUBKKUg321hV+nDRoct3jtLRRWfTxIDSKsSX0Y
 YPYgfA8gjkQRqSExFUdxXxwzE3JgkVDCfraNvb3zRmpkZpXj5r/Twdbdww7mbhmvNw3RgntdI0b
 gOwNwKjFJ9S3Sx4cAyfbLkzeUyuSk+gVxtRtw5GadiucNG5Tr6sLIaWq1/g1ZnkIzoyFXznOSw7
 OvIaQ+2Gz4Uh+13GOsYwdg5mQe9reIIZh812cZxY+q3GBgtrMb+NGV/wY8uywt7i6MSV48PDhze
 hx/JuWSvoWneCVatN0w==
X-Proofpoint-ORIG-GUID: oB5GKMeqQHZ-if7KNvM3-L9LBj8RmUVO
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a26ee35 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=bDdBU3oEAAAA:8 a=EUspDBNiAAAA:8
 a=_MyEUG9zEuNOLPre8u8A:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-GUID: oB5GKMeqQHZ-if7KNvM3-L9LBj8RmUVO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_093046_220795_C5673242 
X-CRM114-Status: GOOD (  24.28  )
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

On Wed, Jun 3, 2026 at 2:18=E2=80=AFPM Lorenzo Pieralisi <lpieralisi@kernel=
.org> wrote:
>
> The loop in riscv_acpi_add_prt_dep() includes error conditions that are
> handled in a dubious - if not outright wrong - way, by continuining the
> loop (which skips and misses the entry pointer update to point to the nex=
t
> entry).
>
> Rewrite the loop as a for loop (that handles the continuation correctly)
> and wrap the condition and update statements using helper functions to ma=
ke
> it cleaner.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/acpi/riscv/irq.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
> index 75170151c614..0cdec5dd575e 100644
> --- a/drivers/acpi/riscv/irq.c
> +++ b/drivers/acpi/riscv/irq.c
> @@ -319,6 +319,20 @@ static int riscv_acpi_irq_get_dep(acpi_handle handle=
, unsigned int index, acpi_h
>         return ctx.rc;
>  }
>
> +static bool acpi_prt_entry_valid(void *prt_entry)
> +{
> +       struct acpi_pci_routing_table *entry =3D prt_entry;
> +
> +       return entry && entry->length > 0;
> +}
> +
> +static void *acpi_prt_next_entry(void *prt_entry)
> +{
> +       struct acpi_pci_routing_table *entry =3D prt_entry;
> +
> +       return prt_entry + entry->length;
> +}
> +
>  static u32 riscv_acpi_add_prt_dep(acpi_handle handle)
>  {
>         struct acpi_buffer buffer =3D { ACPI_ALLOCATE_BUFFER, NULL };
> @@ -337,7 +351,7 @@ static u32 riscv_acpi_add_prt_dep(acpi_handle handle)
>         }
>
>         entry =3D buffer.pointer;
> -       while (entry && (entry->length > 0)) {
> +       for (; acpi_prt_entry_valid(entry); entry =3D acpi_prt_next_entry=
(entry)) {
>                 if (entry->source[0]) {
>                         status =3D acpi_get_handle(handle, entry->source,=
 &link_handle);
>                         if (ACPI_FAILURE(status))
> @@ -365,9 +379,6 @@ static u32 riscv_acpi_add_prt_dep(acpi_handle handle)
>                         dep_devices.handles[0] =3D gsi_handle;
>                         count +=3D acpi_scan_add_dep(handle, &dep_devices=
);
>                 }
> -
> -               entry =3D (struct acpi_pci_routing_table *)
> -                       ((unsigned long)entry + entry->length);
>         }
>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>


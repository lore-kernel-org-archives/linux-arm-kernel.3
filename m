Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D35D12663
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 08:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25JB0joO6/APWdWGU9npMYA29F9CUK1XLBMuinxiP4I=; b=Y71p94u0ctIZCOKpLLqYkRFBkP
	UcUlAilnqTSjcHuweI/98GAVPzrp9DWTlPvmfBJo/exk5uQyOiuEESTDdTZQ0aY3IJVuMaMa/Tf5/
	Y7HyI+CW/Js+X/AcOTK1r5g6oy7uM7Jgsh91UOeyuJr0ErZelxKzPkc8UaYa0HcU+l/XKRyy+4L/L
	+wqON82fgUJbJjPp0oJZZYeToO9UJqqjVLlqcejFmPJR0tnIPR7d8sSZjYKZtFJFMr/Eu/hjMXCJn
	FhZWWGG+TYH6kekII77rd0tSszXkL3ZgBn3f/FDQpVo9firX+FJNFn6Fk7JHodKqVlhxoEOgkY317
	xPbD9GSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8F6A-0000000GN2v-1oGY;
	Tue, 05 Nov 2024 08:39:38 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8EsL-0000000GKnk-22ha
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 08:25:23 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A56uQvx022315;
	Tue, 5 Nov 2024 09:25:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	25JB0joO6/APWdWGU9npMYA29F9CUK1XLBMuinxiP4I=; b=VkTiBz7FYMa5Tv0k
	J+YUoTY39W91PJZv+iyDXEEiisQF037iGaJ30A/fDNHsAdXrRunxyQhic9qSqfGS
	BCUJbeWwFQ+EgdqBIRtlfpGEEgcwRiHdRHWwVuMhvSBoxF/Y8YxzgVLmsXwuPiTO
	GhSo+OuSmVspehP/HsL1gIr080uRnIkrjeJExPWPQIBZ6GJnMf9nRMnogDLLAlwJ
	d0sXxtTiuAhevV7OMmuw03ewYTYlEwQLoAB39fiTLZlDYXp0IejQfysKNCxT6i1w
	K1uje9cgzoM40AkGdWlhnM5KDJD4yownykkP7Sz6O8dexHYomgJIZIZ+O9nkMGWh
	fdx1xw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42ncxbu10k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 09:25:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4380240052;
	Tue,  5 Nov 2024 09:24:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 787DF24B194;
	Tue,  5 Nov 2024 09:23:44 +0100 (CET)
Received: from [192.168.8.15] (10.48.87.33) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 09:23:44 +0100
Message-ID: <008a261f5407ab38bb025768624bdc6bd1869c84.camel@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH] irqchip/stm32mp-exti: Use
 of_property_present() for non-boolean properties
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Date: Tue, 5 Nov 2024 09:23:43 +0100
In-Reply-To: <20241104190836.278117-1-robh@kernel.org>
References: <20241104190836.278117-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.87.33]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_002521_850121_9E1C4092 
X-CRM114-Status: GOOD (  12.77  )
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

On Mon, 2024-11-04 at 13:08 -0600, Rob Herring (Arm) wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> =C2=A0drivers/irqchip/irq-stm32mp-exti.c | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-stm32mp-exti.c b/drivers/irqchip/irq-stm=
32mp-exti.c
> index 33e0cfdea654..cb83d6cc6113 100644
> --- a/drivers/irqchip/irq-stm32mp-exti.c
> +++ b/drivers/irqchip/irq-stm32mp-exti.c
> @@ -696,8 +696,7 @@ static int stm32mp_exti_probe(struct platform_device =
*pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (of_property_read_bool(np, =
"interrupts-extended"))
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0host_data->dt_has_irqs_desc =3D true;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0host_data->dt_has_irqs_desc =
=3D of_property_present(np, "interrupts-extended");
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}

Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>

Thanks,
Antonio


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E923CC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 18:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVo3B24OwlGB4MegvwJiCx+gPz1XAKK8W690GqvITAQ=; b=RF+ZyPYqZlhrBy92iMzTJntvwj
	eo+fr9H7RhExHp8tmnaViQ+xnroZHUL2Z4rDD3VonvJln8c5y8FhUCbqcwWyoHTMVK3h2rZtJsFRp
	kIE3o7VxksLZY0Y1UCOVa061UhGX2vloiT4rcqV161MEJBY1LOrecjNLA0pxyfVKKvOfDAXgfuqFD
	E9aiTyJ/0R6hb30BijKADcRzEwgWRfeGhmH6dM0NeGRdbT6W/00h/ml3VtbZqWzr49GK0c1H8rS7I
	Hk6DHTqdCxj1hKQy8vF9gAXE9Jc14Xkmzzpfc7EXLCOSRlkmjb7L12UKHqdl4pAhcX1mkO6jGuO/N
	gK4uEywA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPk7-0000000Ambm-44iq;
	Wed, 11 Jun 2025 18:00:08 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPLue-0000000A0yP-3NDa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 13:54:46 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BCFOAP014824;
	Wed, 11 Jun 2025 15:54:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	SVo3B24OwlGB4MegvwJiCx+gPz1XAKK8W690GqvITAQ=; b=a3CiH6h0cxGgTkgA
	Aqee/5M/6dNuYYLxJdIVA+T0Im2/E65K7ptBXpADH0V+zNyZa3b8Qpv3rxV67eGR
	mCO87tx4+jGIAHUiwJAeThs04F7Rk8GF35De9xoq1+ECrpydeANzzpD4pbY2b0IN
	mjcwVS6eDOPTQTwd/DPfLJjwkRQHtWepwPiX3iEUt+aWUcTdrDO/ePYyEHnHwtwi
	SIGHKSiRI8e2KB+VUWXYJhr67wWD47NYR7Nvd3a++wt9u0odcRes/VkTwpaU09ms
	H+YeJmq+CCRjU53+AKY4FQYwNQYjiCBDMMi4DCSWkNqSa0VLl8dETa6DU7j8Nkqj
	u3NJbA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474ajaa6d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 15:54:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CE8EE40048;
	Wed, 11 Jun 2025 15:52:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00A94B12446;
	Wed, 11 Jun 2025 15:51:46 +0200 (CEST)
Received: from [192.168.8.15] (10.252.18.240) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 15:51:44 +0200
Message-ID: <a5e25ab7c595936f93198c9ac0b2e048a83f5b57.camel@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH] irqchip: Use dev_fwnode()
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, <linux-kernel@vger.kernel.org>
CC: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, <imx@lists.linux.dev>,
        Fabio Estevam
	<festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Tero Kristo <kristo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Santosh Shilimkar
	<ssantosh@kernel.org>, <tglx@linutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>
Date: Wed, 11 Jun 2025 15:51:42 +0200
In-Reply-To: <20250611104348.192092-10-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
	 <20250611104348.192092-10-jirislaby@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.252.18.240]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_065445_361985_856041EB 
X-CRM114-Status: GOOD (  10.88  )
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

On Wed, 2025-06-11 at 12:43 +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
>=20
> So use the dev_fwnode() helper.
>=20
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
>=20
> ---
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Gregory Clement <gregory.clement@bootlin.com>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Santosh Shilimkar <ssantosh@kernel.org>
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
> =C2=A0drivers/irqchip/irq-imgpdc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/irqchip/irq-imx-irqsteer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-
> =C2=A0drivers/irqchip/irq-keystone.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> =C2=A0drivers/irqchip/irq-mvebu-pic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/irqchip/irq-pruss-intc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/irqchip/irq-renesas-intc-irqpin.c | 6 ++----
> =C2=A0drivers/irqchip/irq-renesas-irqc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-
> =C2=A0drivers/irqchip/irq-renesas-rza1.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 5 ++---
> =C2=A0drivers/irqchip/irq-renesas-rzg2l.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 5 ++---
> =C2=A0drivers/irqchip/irq-renesas-rzv2h.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2 +-
> =C2=A0drivers/irqchip/irq-stm32mp-exti.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 4 +---

For drivers/irqchip/irq-stm32mp-exti.c
Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>

Thanks
Antonio



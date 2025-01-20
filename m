Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58F6C02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 08:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPRD2KWoZvbHZFTPohaghCcVvZX1drMbrOqQgWvHJmg=; b=OwaYbnzPotoJpS2j5SL5vQdnOh
	mDnvYsRN3RCDL1rjml6nYDIEAEfcaL+ZAiUCdpAsiT5v8n9MAUqrnqh8tPvU6zzDK8jYY+4VHhi4l
	yytsLe23c+qEGmaEDjVstsYTWMx27mcbZE12VHYjz/JaNHLorFfYbcna4I1UQakJKQnRmb2MgWtuY
	w4RMpy4q5VGujPyYH5aFeA75TOBBsYbphu5lOZlbhs8rYvh9DY9jzaYUT62l9aNEIpgDnv1cAzEhn
	8n1ztv3RedK5dX5hGd16fjmHuIC9h7FjO4RdUI1XKidRP7d4wnJI6FzZNdnyKln7jZPEucDbJnkO7
	m/zUuurA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnI4-000000052XF-01k3;
	Mon, 20 Jan 2025 08:37:48 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnGi-000000052NU-1SR6;
	Mon, 20 Jan 2025 08:36:26 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K8VeAT027721;
	Mon, 20 Jan 2025 09:36:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	iPRD2KWoZvbHZFTPohaghCcVvZX1drMbrOqQgWvHJmg=; b=CXYXMxsVof+3Wz47
	pE44y6yoapWMYfryXmQmgwWCVrd1MV0ICGv6PCjjCMpIGQttUaApGosIU58zgpIy
	vfdnQJxX6cGKfRGAp3ZpqnpIE7lZsFFFXHdLnyFbraBYqqeX3+/5oAX1Pbbh1H/g
	Z1zTGqiGugZk7RQcr0gTqlv93umVokS7DlAb9sFO5hlHNEJSBXw0+ZY+mD6TTi8q
	wd2UcMwGP0xxMcy1k29Bv3kXT/8msT6uHT/J0WL9iuUCn+QdGxedMk/pXBcccG5m
	0McvNf2JQUoo1Ch89bbYfGv1cFMej52XR4TunA24staAgIpqHMkvR8bmpyyMAHax
	nVGU9g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 449jdf875u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 09:36:03 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1005640048;
	Mon, 20 Jan 2025 09:33:58 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 17DC127B404;
	Mon, 20 Jan 2025 09:32:10 +0100 (CET)
Received: from [192.168.8.15] (10.48.86.148) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 20 Jan
 2025 09:32:09 +0100
Message-ID: <98652dc2f29b172a9caafe55d04cb965768e2a66.camel@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v2 06/12] rtc: stm32: Use resource managed
 API to simplify code
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        "Rafael J. Wysocki"
	<rafael@kernel.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek
	<pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Dmitry
 Torokhov" <dmitry.torokhov@gmail.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire
 McNamara <daire.mcnamara@microchip.com>
CC: <linux-rtc@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
        <linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Date: Mon, 20 Jan 2025 09:32:07 +0100
In-Reply-To: <20250103-wake_irq-v2-6-e3aeff5e9966@nxp.com>
References: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com>
	 <20250103-wake_irq-v2-6-e3aeff5e9966@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.86.148]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-20_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_003624_848356_A7B1014E 
X-CRM114-Status: UNSURE (   6.88  )
X-CRM114-Notice: Please train this message.
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

On Fri, 2025-01-03 at 16:41 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Use devm_pm_set_wake_irq and devm_device_init_wakeup to cleanup the
> error handling code and 'driver.remove()' hook.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>

Thanks,
Antonio


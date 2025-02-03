Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADF1C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trAJpNigM/p/7CDqNVkhgXtOYUHb2njJXY7wSKnvEw8=; b=MthaElyp0qgDTtj6KBm2sL9LrJ
	qcmhem3QKQdGor41Eb97Ir8j6JeV6xvF0tlttaXsXLAm6/kQj+pRzhj9Vfj1jfHyeNtsaZKlh5P3i
	WJq35W2OWNpUv9kNEuSz04FvKgFMmNRo0sUPqv6myiLsHoUUCUgxQfLzBRJc6YwI49sMvZ8PZEvkS
	2MRlDo+lhTnNXWyQsy6oR1X8aWRgzn8g2/UPTyHVj4f2LDGYpaFdF1irjdV1vJJmCU3rybqUjSaEj
	yv/1LHPKqdJxogpMqQlbD4KpgW4nd5casYhj7xSw5c/m1DGK6H1sYdjnKSipGdc6MpvX2pSyZ2JCI
	m0luUq9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tevDZ-0000000FK5u-0F7w;
	Mon, 03 Feb 2025 12:06:21 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevCE-0000000FK0z-0mRQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 12:04:59 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513B5mKr027354;
	Mon, 3 Feb 2025 13:04:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	trAJpNigM/p/7CDqNVkhgXtOYUHb2njJXY7wSKnvEw8=; b=U2qqKZKUQh20Q7XV
	GYoP+i+o1iiEc6U8QGvRD0STaaCcMx36GXROeLAs0fvw2sKwlYbykZx13Vfm87dm
	/2JXHHrt7oExDJ6/Xw9kIBRvDllq+Z1Dbk9ncbX4KrM1ZhKYtNUT35I/LB7oUJXc
	pX54KOw5/dRfPyBlVtAeCvBzlXF0y82r/z5PTHdoXmIc66x0qUI/xOqaSej1V7Pq
	FzyzPtVXwCICnw8lvLRFFt1MxbiFxcQZq0XUJslTT0RfRL6RIcH6NwHr2qZx0xpf
	ITVP1K7m2rw9j0AoadaZORfS9L82W2DozDHtVlw39RnjMTXP7hEb+QFfxAjdCyj0
	Rc+oEw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44jn0fhx1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 13:04:50 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 378B440048;
	Mon,  3 Feb 2025 13:03:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE7BE263541;
	Mon,  3 Feb 2025 13:02:08 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Feb
 2025 13:02:08 +0100
Message-ID: <0fade761-2485-465b-9fb1-d0e4dabdb189@foss.st.com>
Date: Mon, 3 Feb 2025 13:02:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH stm32-next v3 0/2] ARM: dts: stm32: lxa-fairytux2: add
 gen{1,2} boards
To: Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <kernel@pengutronix.de>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_05,2025-01-31_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_040458_525789_6122945B 
X-CRM114-Status: GOOD (  14.64  )
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

Hi Marc

On 1/21/25 12:14, Marc Kleine-Budde wrote:
> Hello,
> 
> this series adds support for the Linux Automation GmbH FairyTux2
> boards generation 1 and 2.
> 
> The FairyTux2 is a small Linux device based on an Octavo Systems
> OSD32MP153c SiP, that occupies just two slots on a DIN rail.
> 
> regards,
> Marc
> 
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
> Changes in v3:
> - 2/2: fix use generic node names for external GPIO and USB Type-C controller (thanks Krzysztof)
> - 2/2: LEDs: replace label by color and function property (thanks Krzysztof)
> - 2/2: gen2: sort nodes of i2c1 by address (thanks Krzysztof)
> - Link to v2: https://patch.msgid.link/20250120-lxa-fairytux-v2-0-95f4a0eaa44d@pengutronix.de
> 
> Changes in v2:
> - 1/2: Added Krzysztof's Acked-by
> - 2/2: fix alignment for gpio-line-names (thanks Krzysztof)
> - 2/2: only use color:function for LED labels (thanks Krzysztof)
> - 2/2: use generic node names for external GPIO and USB Type-C controller
> - Link to v1: https://patch.msgid.link/20241210-lxa-fairytux-v1-0-9aea01cdb83e@pengutronix.de
> 
> ---
> Leonard Göhrs (2):
>        dt-bindings: arm: stm32: add compatible strings for Linux Automation GmbH LXA FairyTux 2
>        ARM: dts: stm32: lxa-fairytux2: add Linux Automation GmbH FairyTux 2
> 
>   .../devicetree/bindings/arm/stm32/stm32.yaml       |   2 +
>   arch/arm/boot/dts/st/Makefile                      |   2 +
>   .../boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dts | 103 ++++++
>   .../boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dts | 147 ++++++++
>   .../arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 397 +++++++++++++++++++++
>   5 files changed, 651 insertions(+)
> ---
> base-commit: b7ebfb84a09de6b44492974339654d8ffc5ad9e1
> change-id: 20241210-lxa-fairytux-e730979d3d3f
> 
> Best regards,

Series applied on stm32-next.

Thanks
Alex


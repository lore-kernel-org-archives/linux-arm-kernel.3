Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57B1C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9vFHnH+10VgpguGO7CSDoz8TQTajPJNBGdmVoWn0WM=; b=F1bgxoXf8RkK2uf/85QlLWjHkC
	rc8s6fhHtKFCNTJ3YOkHkfT9A/4SDGvLnZSmpZoHpgR9zM+O65n354VOrX0/UXNKi5RI3bQoTYhpP
	uZ6AwOX595wpSaVS4L0jB7Y5PMRlOZNjBsOsNMiOfYQ5VQmNSivzKMyMX2HGI1bSgovSAQd5vZaR6
	TvVItkLfremwbDXHd++D6IUM16ObkZ0AVwot/8oTVK42A2N13CtQExQaz3dzmBN2fZZoIy6tjywlN
	ptqX2JZO9zeUND9WGS4CxWdXG9EsyMlUVJ5Gi+177oE8DQqh+xS3QTct5So5mXGaHgwtfzGxxTny+
	DIJqt+qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeyB-0000000EHoh-2DaO;
	Fri, 04 Jul 2025 11:52:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcTY-0000000DtZl-2DAf
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 04 Jul 2025 09:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=o9vFHnH+10VgpguGO7CSDoz8TQTajPJNBGdmVoWn0WM=; b=Yl4W7ZjAC7htsR3cQdr4mcjHvW
	iAPDA9XD7l97BsuA1HjeYZrJca53YTKwTzWscKHRjML3dvWjBPYTxmdtnk73YzV8CfnEGhzB42tIV
	Dl6bUHSBM86hZ5jjH4XhfT0TpmuruHhQYLuh71QCjcrkFeTEFz7oDpU8YEsHUlCdZGQ4wdX8oJWxc
	9lQOoTYYM/QpzJzc/zk/TCF6MsVJXMIIIFvdXEN4wLVpBxgn2F930ajAZv1i6+Obj54YyQa+82u+7
	ED7G/hIkLWqb1hJzXWHnJnz9M21iGYkklDtUPiPKGSWGQG7hglXgOA6gRy+8ua0ErPoww8lyyqeYu
	oheeW0OA==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcTV-00000007tQT-2EDp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 09:12:55 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647Zsmm012108;
	Fri, 4 Jul 2025 11:12:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	o9vFHnH+10VgpguGO7CSDoz8TQTajPJNBGdmVoWn0WM=; b=aqQqbzM7yRmB9AiA
	xExSCXj2ZJY+0YRGwxXqL63PYmeEjiuE34qNGrmr0Ap9IQEZ+G47upZdb9+EiqNg
	eAhrP6gvxoretMVSCukaQqM8KXoGSTMbyI6NEEoWNjGqxmHxq7rIsMliK6TrOoD3
	P4CQhgxMaRmb15mh60ZSlAd/itqy9R/gWKIG4+KKM2IHMT8JR95FoLbTE1cRc/gs
	LCAh9ZDFUIgW0nI7Y+QLnZba/vR3dQL8ptwozFYIVqfnpmJopoWxwuH5cBCIiXAb
	EqoOwORtYh6Yx1+q0beeKVfLjMQ9+jlEuMhRd0j3cW/ierm+CuAaabIM20Ol2C01
	5QrfEA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jubp9329-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 11:12:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 87A7A4004F;
	Fri,  4 Jul 2025 11:11:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C28BA4D113;
	Fri,  4 Jul 2025 11:10:50 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 11:10:49 +0200
Message-ID: <7a56c778-0c46-49a4-8a83-ed7ec8355ef7@foss.st.com>
Date: Fri, 4 Jul 2025 11:10:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] Add STM32MP25 timers support: MFD, PWM, IIO and
 counter drivers
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, <lee@kernel.org>,
        <ukleinek@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <wbg@kernel.org>, <jic23@kernel.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>
References: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_101253_745699_C10D4829 
X-CRM114-Status: GOOD (  14.18  )
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

Hi Fabrie

On 1/10/25 10:19, Fabrice Gasnier wrote:
> This series adds STM32MP25 support on MFD PWM, IIO, counter timer drivers.
> This new timer variant is managed by using a new DT compatible string.
> It comes with a slightly updated register set, some new features and new
> interconnect signals inside the SoC. There is also a new instance (TIM20).
> Same feature list as on STM32MP1x is supported currently, except for PWM
> capture (not enabled, by DT).
> The device tree files add all instances in stm32mp251 dtsi. PWM, counter
> and trigger examples are provided for stm32mp257f-ev1 board.
> 
> Changes in V3
> ---
> - MFD updated since Lee's coments
> - IIO patch dropped since applied by Jonathan
> 
> Changes in V2
> ---
> - PMW driver updated to address Uwe's review comments
> - Collected Acked-by
> 
> Fabrice Gasnier (8):
>    dt-bindings: mfd: stm32-timers: add support for stm32mp25
>    mfd: stm32-timers: add support for stm32mp25
>    counter: stm32-timer-cnt: add support for stm32mp25
>    pwm: stm32: add support for stm32mp25
>    arm64: defconfig: enable STM32 timers drivers
>    arm64: dts: st: add timer nodes on stm32mp251
>    arm64: dts: st: add timer pins for stm32mp257f-ev1
>    arm64: dts: st: add timer nodes on stm32mp257f-ev1
> 
>   .../bindings/mfd/st,stm32-timers.yaml         |  18 +-
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |  61 ++
>   arch/arm64/boot/dts/st/stm32mp251.dtsi        | 524 ++++++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |  58 ++
>   arch/arm64/configs/defconfig                  |   4 +
>   drivers/counter/stm32-timer-cnt.c             |   7 +-
>   drivers/mfd/stm32-timers.c                    |  31 +-
>   drivers/pwm/pwm-stm32.c                       |  42 +-
>   include/linux/mfd/stm32-timers.h              |   9 +
>   9 files changed, 740 insertions(+), 14 deletions(-)
> 

Patches 5 to 8 applied on stm32-next.

Thanks
Alex


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB131E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 09:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVWhcdluQn/FeGJzOFzMGBVEMEf9xzbqzGk72elgCUI=; b=y9M6zBkjKS5aCFMIxEMbRkwQdW
	hkx3Ogm4tXh3mddE4+8Rb26Gc2rRE0rRvWcoueSiDClpgQSV+LY8MylGH9t0QgUzcQe1mSAqpoEsx
	de34z7XFACC1k6cZRnMDOu6tMov4Avwh/TK6d/DR9PuT78tiPKEWrhIf6XKcz9f6e2EGaNzbgUl8G
	sHnghdfcxFajfu13e62FQyAmPBASqy+W1egecXM89Fue1203KGotaFF/4wQ8mTTb76BrYFOCbcX3o
	URDE7dqlDu5myW+1oPVJdz+/S4c7DUwls8i5M2Wa3nvB2fJpnbkliT9/mtnxi/FY++mj1OpujPyU9
	8VAqCxdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIfH-0000000EL13-3qMD;
	Wed, 11 Dec 2024 09:05:51 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIeD-0000000EKpG-09bV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 09:04:47 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB8NwD6022707;
	Wed, 11 Dec 2024 10:04:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	JVWhcdluQn/FeGJzOFzMGBVEMEf9xzbqzGk72elgCUI=; b=b0A9E4AuMNTnvg0I
	wkXfLf5kOc1qMYjpI+7kMEvKiCLeWQ/tTfDobuCf8sJiWEzTcSvlIe4c6/Y6m60j
	+8H64t25TQsnAYMDPAhDFtdoUX+fYSW+8sEHjUyPZzQEqy8lsD/zN+dW4+n4RDN1
	yh0Gzt0r50ahgltqWcfUL93VHZNLuZ6j7nyCag/Ewn+gDA5qhow+UDvyDPsJB8Ei
	z/Pu78ZlxuZN8ZbUIJCm7EVUI+9j1y87d6ISz+lv0p0ulFgg0EfEn/O4WAUoDHB8
	IGv9C6nxkj6MqS1XlJZOPXlXS+mtsoEyPCsxMxH69uDpZjPh724dpIAGjrVGO+/I
	ra/fCA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43d0t5f4b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 10:04:37 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 93AC640074;
	Wed, 11 Dec 2024 10:03:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BDF5227FEF5;
	Wed, 11 Dec 2024 10:02:18 +0100 (CET)
Received: from [10.48.86.108] (10.48.86.108) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 11 Dec
 2024 10:02:17 +0100
Message-ID: <49ccec07-4d4c-4582-814b-d4a60adbbfe1@foss.st.com>
Date: Wed, 11 Dec 2024 10:02:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] watchdog: stm32_iwdg: Add pretimeout support
To: Marek Vasut <marex@denx.de>, <linux-watchdog@vger.kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Guenter Roeck
	<linux@roeck-us.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Wim Van
 Sebroeck <wim@linux-watchdog.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20240415134903.8084-1-marex@denx.de>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20240415134903.8084-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.108]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_010445_381115_8A4319A0 
X-CRM114-Status: GOOD (  21.23  )
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

On 4/15/24 15:48, Marek Vasut wrote:
> The STM32MP15xx IWDG adds registers which permit this IP to generate
> pretimeout interrupt. This interrupt can also be used to wake the CPU
> from suspend. Implement support for generating this interrupt and let
> userspace configure the pretimeout. In case the pretimeout is not
> configured by user, set pretimeout to 3/4 of the WDT timeout cycle.
> 
> Reviewed-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Tested-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-watchdog@vger.kernel.org
> ---
> V2: - Subtract the pretimeout value from timeout value before writing it
>        into the IWDG pretimeout register, because the watchdog counter
>        register is counting down, and the pretimeout interrupt triggers
>        when watchdog counter register matches the pretimeout register
>        content.
>      - Set default pretimeout to 3/4 of timeout .
> V3: - Use dev instead of pdev->dev
>      - Swap order of ret/return 0
>      - Split this from the DT changes, which are orthogonal
>      - Uh, this patch got stuck in upstreaming queue, sorry
> V4: - Update commit message to match V2 default pretimeout to 3/4
>      - Add RB/TB from Clément
> ---
>   drivers/watchdog/stm32_iwdg.c | 95 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 94 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index 5404e03876202..d700e0d49bb95 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
>  
>  [.....]
>  
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq <= 0)
> +		return 0;

Hi Marek,

After re-evaluating this patch, it seems it lacks of a dt-bindings 
update that tackles the 'interrupts' property you are adding.

That said, the interrupt line should not be mandatory for the driver to 
probe. For backward compatibility with existing DT, I recommend to use 
the 'platform_get_irq_optional()' API to not fail during the probe of 
the driver.

Best regards,

Clément


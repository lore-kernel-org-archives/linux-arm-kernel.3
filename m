Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F45C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 06:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKGs8pWqRz5fgySPRSKxsWNGQtApl7x88mhEfyirBMg=; b=WqaCc5QzpvjhiWQIp161uQUGps
	C+5XpYL3vvhg6+VuEOeFQybIIidpdCEWEhK8T32DEJxZTQ/fnm/dgxSa6B5tvvfHUDG4QKSJIYYh2
	DblZUA4UHDFCfCaLqET9grTmyTPc4e0g7sRzLKae8uBajBeORRa120Sj30WmhdpXOAXNtC7ysCQVw
	2H5vdPkGSa+8NjKmHQ4Xfu5yPVFKGGj5F6uOt7L9JudzTbbYfGwlY9eQe7DQDxDnhDE7jqk48kE+c
	hAmH6uIW/hKukyHw1iOsJZzoTF2uJiHu1tyKXIUflcGLNKiSWaSsv5N7MI8ti3e9T3vZvpJoLaa+6
	zxlNUiiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0z4-0000000BsC7-1Iho;
	Wed, 30 Apr 2025 06:31:54 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0x7-0000000BrwX-0WuO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 06:29:54 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLZhZ4026649;
	Wed, 30 Apr 2025 08:29:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	DKGs8pWqRz5fgySPRSKxsWNGQtApl7x88mhEfyirBMg=; b=R/ezM1GKkmn93rcW
	MUTPTqXaoWuIQ+tKQkB+bLfr314SkR3E5wJWFGIdOwexGCo0QYXvJaj/087D8ix1
	MdcW6985sCHesT8DrQdltTR08K4AEvw0A8wxrKKQutvt6p62Up+6Jr1RZ+W6zlQB
	yqXbdNraO9Z6TkEupEHC/ypr+W7dQqkZSECPXhvjc5A66JbgoNzXYY8hL4VjLYUi
	Okdn6fwB31sYFa8uQD2N3kyPOutDmdzLtw/81xWLLmM4VtC+4ztS6/ub2GLAPdY+
	ffJaL3XPMWU7RLfWh8y0dYSAwTlmGgOhctuqUH53Dp0F3d5VvR45cdmb4mWgQdNp
	Z1GJBg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tmscqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 08:29:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 191C640044;
	Wed, 30 Apr 2025 08:28:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 315E2A398DD;
	Wed, 30 Apr 2025 08:28:20 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 08:28:19 +0200
Message-ID: <9d95a3eb-f656-4037-8412-1967660b6430@foss.st.com>
Date: Wed, 30 Apr 2025 08:28:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ARM: dts: stm32: add vrefint calibration on stm32mp13
To: Olivier Moysan <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250403115954.1061528-1-olivier.moysan@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250403115954.1061528-1-olivier.moysan@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_01,2025-04-24_02,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_232953_649367_3E86B9E5 
X-CRM114-Status: UNSURE (   8.25  )
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

Hi Olivier

On 4/3/25 13:59, Olivier Moysan wrote:
> Add vrefint calibration data in STM32MP13 device tree to support
> STM32 ADC internal channel VREFINT.
> 
> Olivier Moysan (2):
>    ARM: dts: stm32: add vrefint calibration on stm32mp13
>    ARM: dts: stm32: add vrefint support to adc on stm32mp13
> 
>   arch/arm/boot/dts/st/stm32mp131.dtsi | 5 +++++
>   arch/arm/boot/dts/st/stm32mp133.dtsi | 2 ++
>   2 files changed, 7 insertions(+)
> 
> 
> base-commit: 65954899a157832f68536b488194cf698248a26e

Series applied on stm32-next.

thanks
Alex


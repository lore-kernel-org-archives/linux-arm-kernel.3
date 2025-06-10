Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA324C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 13:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtivjLTREzj3xhUyN5Ni31CViS5Q+PvnvLeG0iZlrcE=; b=glxbNUNQJOpw6czqNLcR9yXvzu
	OhyiLJey5WwAt6TLSTFAZGLHu06c816ctt8P5AW25QIJsNoYOprpR9rcmcC1DrnPas1y0hWfY3fjx
	7PsVZbGDLzNwbpoPkdfTjrO/xAQiT15Otf3yGm5mVajV2nUTVEVWWjn6NfrpeE8Qt1GV7YLY22Ayu
	LsO+1hF7hgofpOTVsXqba06NxMp3Uo7rYHvTnJZavNNipI97h6cqbeWX4cO8UoJXUOXZy23dqU3kj
	5y6DYEXxmKGsxLVbI7jLhwso732J/0WEDROLnYz59hBD1efaziHfCEgHcMV53ZbQjpBn4qt7exBOw
	VIoo/tJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyjl-00000006uEw-33M6;
	Tue, 10 Jun 2025 13:09:57 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOy0M-00000006l93-2d1E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:23:03 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLEIT013926;
	Tue, 10 Jun 2025 14:22:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	vtivjLTREzj3xhUyN5Ni31CViS5Q+PvnvLeG0iZlrcE=; b=sB2y45r3vLSNQ2D3
	Uvp21XuXqL78esQhQKZfXzybGiUPlzMD5WzROhXNXMhz5I2Qf6sA+3XtzhPR6yhA
	z8goGGaGkQfFtjmXGXrITS0+041glQb3O3RAHkD58LC4eqNMq4bPjj/V9bRwFoH0
	Oew+fMowKFeQ0HrorR+qQvpTuDI2ZqoHx3uNe14eopQ7fy/o5JjlOEA3njYbw8Du
	HQTCZLXPseBl7Upk4UihrQCFvMqq4vL+M/eTnYzp4d/sxCysSXNVI6GfdpjxMVwc
	VvtKTNsQVCO3Lo/tedoEj5C6QHjUPdt5wRzxrBEFflTbQF98Zr9vHHmVkQLz5bfH
	jqVooQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cahm2yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 14:22:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3F73440066;
	Tue, 10 Jun 2025 14:21:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD68CB2149E;
	Tue, 10 Jun 2025 14:20:28 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 14:20:28 +0200
Message-ID: <3a9e5a1b-41fd-4ddf-938a-bed98551a024@foss.st.com>
Date: Tue, 10 Jun 2025 14:20:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Introduce HDP support for STM32MP platforms
To: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
 <CACRpkdZ2NUfcn7O7tKSFDyAr8Hni3pvpTN6QpOz7N3J+EsFdLg@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CACRpkdZ2NUfcn7O7tKSFDyAr8Hni3pvpTN6QpOz7N3J+EsFdLg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_052302_937603_125A2768 
X-CRM114-Status: GOOD (  12.26  )
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

On 6/5/25 15:03, Linus Walleij wrote:
> On Wed, May 28, 2025 at 3:33 PM Clément Le Goffic
> <clement.legoffic@foss.st.com> wrote:
> 
>> Clément Le Goffic (9):
>>        gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
>>        dt-bindings: pinctrl: stm32: Introduce HDP
>>        pinctrl: stm32: Introduce HDP driver
>>        MAINTAINERS: add Clément Le Goffic as STM32 HDP maintainer
> 
> Can I apply the driver and bindings patches 1-4 separately
> from the rest of the series?

The MAINTAINERS file will need a fix in the future revision.
I'll wait Krzysztof answers before submitting a V5 with the fix.

Otherwise patch 1-3 can be merged, but I think you may need the 
MAINTAINERS file to merge the driver + bindings.

Clément

> 
>>        ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
>>        ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
>>        ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
>>        ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pinctrl node
>>        ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 board
> 
> Or does it need to be merged along with these?
> 
> Yours,
> Linus Walleij



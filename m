Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1129C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 16:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciBgB/a2M9sVi4sdzHlbrYxfyvZ/g7Jwnk3UWviHnV8=; b=4awVnxDYPwhJHRcfll0DAb49uV
	8Xf2aXfbxEbrMtGDR+CGyCiXvadz3okj3eC/1c4ZdxcY7d0ncXP7vkKvMwaUeyir8PfoYRNlPUGMQ
	DjiI8JCsBjK6Rxx4Aua2Yov0vjez12WNKGo702wJH5PRu3Tlx75ABCFU9X907bjgv46vOlvpYr8XM
	/ln8e5FDnZxA4TDjyM4ePvM+z7zprIDmKZVJh4nFz7dMx+c1TlneHelmh0UKUwahHuw/qGGvRsMJP
	ewNAPY703FunJw2tuoGvN84hfY6/0fkefvfw3RHjHCsm11IKNq7fsoJNScDIYNa46uxMUdZWzIMY2
	ubi3CeEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XqV-00000007oCd-3jFI;
	Wed, 09 Apr 2025 16:00:11 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XoH-00000007nec-1DU4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 15:57:54 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539D8iiA003194;
	Wed, 9 Apr 2025 17:57:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ciBgB/a2M9sVi4sdzHlbrYxfyvZ/g7Jwnk3UWviHnV8=; b=hSurYbEEBJuu1CAq
	stGgu8szSgpCQ2UKDGHSmM8CBXilyyF91vAlwc9PWSkxz+i/QNvNa61zMWSw5aIZ
	w9516O7NcptcMcNiLdRt/D8/qt6aGTDY1qxFBswF9XC737zJho7f8EkTMcyEj5bD
	K/tPBqHHpsG8PMc5cyLUbVCwft7pK499XNFuXUf2+StAyuCZrDTtA89kxBjBldw7
	sRzFUBxd1F2PzPj6cg+FT4Bj3Yj0u6f7IHIRcXE2A4mLpTx92Myygsh2+JOJPgjb
	FnKc1ZQYinD4oibRZ8f+iXPZqUl85QOnEa3K4+lw9zijhxUaFUEAC/GNS/QkThRs
	9jUOFw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw5gbyth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 17:57:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DD0FB40045;
	Wed,  9 Apr 2025 17:56:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 378189BAC1C;
	Wed,  9 Apr 2025 17:54:35 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 17:54:34 +0200
Message-ID: <9c9172b8-508c-4855-9299-aab72ac2fae6@foss.st.com>
Date: Wed, 9 Apr 2025 17:54:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] Add STM32MP25 SPI NOR support
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <christophe.kerello@foss.st.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
 <20250408-opal-pillbug-of-acumen-0fbb68@shite>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250408-opal-pillbug-of-acumen-0fbb68@shite>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_085753_632213_1AF50E4E 
X-CRM114-Status: GOOD (  18.73  )
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



On 4/8/25 08:38, Krzysztof Kozlowski wrote:
> On Mon, Apr 07, 2025 at 03:27:31PM GMT, Patrice Chotard wrote:
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>> Patrice Chotard (7):
>>       MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
>>       dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
>>       memory: Add STM32 Octo Memory Manager driver
>>       arm64: dts: st: Add OMM node on stm32mp251
>>       arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp25-pinctrl.dtsi
>>       arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board
>>       arm64: defconfig: Enable STM32 Octo Memory Manager and OcstoSPI driver
>>
>>  .../memory-controllers/st,stm32mp25-omm.yaml       | 226 ++++++++++
>>  MAINTAINERS                                        |   6 +
>>  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi      |  51 +++
>>  arch/arm64/boot/dts/st/stm32mp251.dtsi             |  54 +++
>>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  32 ++
>>  arch/arm64/configs/defconfig                       |   2 +
>>  drivers/memory/Kconfig                             |  17 +
>>  drivers/memory/Makefile                            |   1 +
>>  drivers/memory/stm32_omm.c                         | 474 +++++++++++++++++++++
>>  9 files changed, 863 insertions(+)
>> ---
>> base-commit: 88424abd55ab36c3565898a656589a0a25ecd92f
> 
> That's unknown commit.
> 
> b4 diff '20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com'
> Using cached copy of the lookup
> ---
> Analyzing 81 messages in the thread
> Preparing fake-am for v7: MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
> ERROR: Could not write fake-am tree
> ---
> Could not create fake-am range for lower series v7
> 
> I tried on latest next, on some March next, on latest mainline. It seems
> you use some weird base here, so anyway I won't be able to apply it.

It was based on next-20250317 plus the 2 ospi patches already merged 
by Mark Brown, that's why.

> 
> Please split the patchset per subsystem and send something based on
> maintainer tree (so for me my for-next branch), mainline (which is the
> same as for-next currently) or linux-next.... which would be the same as
> my for-next branch currently.

ok

Thanks
Patrice

> 
> Best regards,
> Krzysztof
> 


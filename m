Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81DEC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 08:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MKQXarGCwBm0S142kCJOF3CcZkaaOJ02owWJnuaHs8=; b=seaeLhgJc9oHUKFERreycW1kP7
	UGGeNqjaiA1EB4sHb2kWRiELwbchjbTRrRPNroKU70c9xJ4WB2I5/89VGjs04RtA07DegIF4YR6re
	ejeTD7Wk/+FsVSDpUOle3qKhSPBMRiJ8NkZRc5EfVFxTL7FhAmO+dFwq+7Ng1R2NX2t/S6dZpmt8K
	ti48SI29zL+r4OriF3ZMUcpMIBqnwzjnVIR2/pDICwy9j6cF5FU1UIoSoXx5tn52hm+hxfLX9FoWs
	EFeKtHeyYb7VYfhjY/6UVMwb2LsImiSOJF9uA2oLF0f2Mgmr2r+jvwSqqJ0gSfMhL2N8Rt20T0g/a
	oYYu5clQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVA7-00000004PqB-3isO;
	Wed, 23 Jul 2025 08:49:19 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUfv-00000004Lvc-0V4n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 08:18:08 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N86QWh016187;
	Wed, 23 Jul 2025 10:16:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	+MKQXarGCwBm0S142kCJOF3CcZkaaOJ02owWJnuaHs8=; b=7LyBg3mnPfT2VgiA
	fHngcWAXD8G0Wco2vdmSMTzSLd10TPCwYv18jwdscGMMgxKC+/s7uK3iYYZjQqpk
	0UPFaSNoKoB84PbHn2zJ0hlOV2MlmCC4cwJeJrFX127acHlfdiZXG1W1amLW7ZUp
	tqqROpCJnJOvmG08d1eYB030RFRoXyB82Zc8J7A2z0W5YtlRZs/6HsY5Viiz9xzm
	NsY8BwyljR/gDzhkN/dDY3QWXlNISV3Mjhr+oRwBpz2ZAZ0mea12oO0h6g4CMJGc
	Z5f7n+7AHjlbpa9HMHGevkbZAuY4hE1C9gwFuXOZNL6fjchG/Fa8PvezbB697Ltj
	327TEw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800sm35kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 10:16:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0333040052;
	Wed, 23 Jul 2025 10:15:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4550876DBF4;
	Wed, 23 Jul 2025 10:14:14 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 10:14:13 +0200
Message-ID: <608d03ef-1017-4f82-b7b0-a461c35b59a2@foss.st.com>
Date: Wed, 23 Jul 2025 10:14:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/19] dt-bindings: memory: factorise LPDDR channel
 binding into memory channel
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>,
        Le Goffic <legoffic.clement@gmail.com>,
        Julius Werner <jwerner@chromium.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-7-7b7a4f3dc8a0@foss.st.com>
 <20250723-zealous-turtle-of-perfection-e67aee@kuoka>
 <5ca3ba94-27b3-4cda-aba4-e2935acbe55c@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <5ca3ba94-27b3-4cda-aba4-e2935acbe55c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_011807_446286_77BEEE51 
X-CRM114-Status: GOOD (  12.94  )
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

Hi,

On 7/23/25 09:06, Krzysztof Kozlowski wrote:
> On 23/07/2025 08:57, Krzysztof Kozlowski wrote:
>> On Tue, Jul 22, 2025 at 04:03:24PM +0200, Clément Le Goffic wrote:
>>> LPDDR and DDR channels exist and share the same properties, they have a
>>> compatible, ranks, and an io-width.
>>
>> Maybe it is true for all types of SDRAM, like RDRAM and eDRAM, but I
> 
> 
> Although these were not JEDEC probably...

Hmm so no "sdram-channel" ?
I don't get your point here.

> 
>> don't think all memory types do.
>>
>> I think this should be renamed to sdram-channel.
> ... yet still JEDEC also has some standards for SRAM, EPROM, HBM and
> SGRAM (graphics), see:
> https://www.jedec.org/category/technology-focus-area/memory-configurations-jesd21-c

In a more generic point of view we can think compatible, density and io- 
width as common for all sort of memory no ?

> 
> Best regards,
> Krzysztof



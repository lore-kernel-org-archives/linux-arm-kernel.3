Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FE9C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 07:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPs0IDy2C8RbyiHKvygcSXpjPFxvYiEDTH1nW4mKVEI=; b=2SoapM6SJLnhSrHRD+INX7DSN4
	oogN0D2XhfGwdHlJEHcdGtFoapM7BdzRgeUAUtLEZ1n+0fNfBxMATGTPTL9CX2dd0eWGgloj+I/uE
	TSuT10JsO5DZiqGx+8kxB95H6LIIqOOO6xbwRoEtLEeovMvaF4dEKA0i6+YETxl0+0pXelQwtQ8I5
	RvIY6MVfcHMwsd4sSs/bBnuFN5x+yR+mAteTJnSMZO5wcohM5pKpU0sRwLSgoq7IdXFA1WBNExN+H
	lDkwEpZ3+oSGKgqIpiHOuBNdneAoRp0Ccj+dvQvZnUXiowYvf8SVMPOieXWOVEawDhPV0/cdzHaKu
	Wdj2E/Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueTu7-00000004FAT-0HLq;
	Wed, 23 Jul 2025 07:28:43 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueTqN-00000004EkC-2bon
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 07:24:54 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N7Lt6M024254;
	Wed, 23 Jul 2025 09:24:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	CPs0IDy2C8RbyiHKvygcSXpjPFxvYiEDTH1nW4mKVEI=; b=HcPpDs/RqqNEnyOk
	5RCeB6v128EWGD/ngG1JxcypFqNCxc18ZO0OUB+A1cwEZG3hSGrKmMoVeUs73VZb
	aksAstgDKVKCW90MYILB316mB8JYMB0+DlISSo+I2EEkr2fQupAfE7H722SwGO6A
	IfM4S5mNjG4yybMgfnrw3HkqLwt9fEVdjIHSc/IBaF2Cv+ervlDdg2D7BGV5DYxm
	Zxf5yFncpHhviCdLasEsOhB899EbZrORd2UW36ADw0ESPATsh7ippPW2g6U1KsUi
	mSMI5zsfv2ssxeO/iJE6iO7g6CBiMu0qO4FwlVyhTYnoYZttRGIIRk67viTfxkFI
	qb+/Rw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4802q2acb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 09:24:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 205A440052;
	Wed, 23 Jul 2025 09:23:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60781768AAF;
	Wed, 23 Jul 2025 09:21:50 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 09:21:49 +0200
Message-ID: <822bd852-2cbc-4a89-a077-d05a8327e149@foss.st.com>
Date: Wed, 23 Jul 2025 09:21:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/19] dt-bindings: memory: factorise LPDDR props into
 memory props
To: Julius Werner <jwerner@chromium.org>
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
        Krzysztof Kozlowski <krzk@kernel.org>,
        Le
 Goffic <legoffic.clement@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-5-7b7a4f3dc8a0@foss.st.com>
 <CAODwPW_fDPY78bmwvLmLkt1yWpVdG=VC8h2NSdWtoiEknajhNw@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CAODwPW_fDPY78bmwvLmLkt1yWpVdG=VC8h2NSdWtoiEknajhNw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_002452_158119_F4947983 
X-CRM114-Status: GOOD (  17.71  )
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

Hi Julius,

Thanks for the review.

On 7/22/25 23:57, Julius Werner wrote:
>>         Compatible strings can be either explicit vendor names and part numbers
>>         (e.g. elpida,ECB240ABACN), or generated strings of the form
>>         lpddrX-YY,ZZZZ where X is the LPDDR version, YY is the manufacturer ID
> 
> When you say "in case of LPDDR" below, you should also change this
> line to take other cases into account. Maybe the best way to write
> this would be something like:
> 
> ...or generated strings of a memory type dependent form. For LPDDR
> types, that form is lpddrX-YY,ZZZZ where X is [...same text...]. For
> DDR types, that form is ddrX-YY,ZZZZZ... where X is [...new definition
> for DDR types, based on what's available in SPD...].

Yes I agree and if there is no SPD I'll mention the datasheet of the 
memory chip.

> 
>>     revision-id:
>>       $ref: /schemas/types.yaml#/definitions/uint32-array
>>       description:
>> -      Revision IDs read from Mode Register 6 and 7. One byte per uint32 cell (i.e. <MR6 MR7>).
>> +      Revision IDs read from Mode Register 6 and 7 in case of LPDDR.
>> +      One byte per uint32 cell (i.e. <MR6 MR7>).
> 
> If this doesn't exist for DDR, then rather than "in case of LPDDR"
> this should probably say something like "LPDDR only"?

It exists in case of DDR, but it is either in the SPD if the memory is 
DIMM like or in the datasheet for soldered memory chip.

> 
>>     density:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       description:
>> -      Density in megabits of SDRAM chip. Decoded from Mode Register 8.
>> +      Density in megabits of SDRAM chip. Decoded from Mode Register 8 in case of
>> +      LPDDR.
> 
> Can you list here where in SPD density and I/O width are stored for
> the various DDR types?

I'll try to find the info and yes.

Best regards,
Clément


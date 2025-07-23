Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73252C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 07:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OF2g8HL4znRWs7yyAJKVV9g93H6bltIAkBEQRriY5ak=; b=ZphgXVtbNV+PheSSlL7JKBHXXC
	NPsHy85ysusey/oQWmxTpKjLI2GiA6P01PGiQUXbWL9LL3Pthsd23EnMjKVcN4I6KfXyU1XLgQGv8
	VdkyllX3jNrSJ3YqqN0gd3PAEszhssvSCDXQUiP+0+jfPUNyo+8OBDf6FMjn+iQAngk71dZA1R2Gr
	fiEb+0cJHE6KCo1cIuuSsEesZWTUzWRt83bdT/gVsNgzTJ2JdkOJn8UJPbTXDpvygEOdmC+X1qr4T
	TpRVAz4INsDdfhkDHdxXSY0oqqlbTYKpk7dTIpW4kVmsmX6al7JglnPpDX9BDZ/7xwPhgWZ20lrrT
	Y94znumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueU1K-00000004G6z-3Wi8;
	Wed, 23 Jul 2025 07:36:10 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueTyq-00000004Fpw-0yri
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 07:33:37 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N7Wjxn025289;
	Wed, 23 Jul 2025 09:33:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	OF2g8HL4znRWs7yyAJKVV9g93H6bltIAkBEQRriY5ak=; b=QE9mJsJW+BIaT3ge
	CfuDSWegwRTrkywKHn6W0YG93ypZfNqeS7e8ZayRMnzEGT7SYFbolmtM4E8MisWR
	aCwQ4JGQJpAMXkivdfGa/SE2XG0ni4nYyoTyPjA4ZmXcx7m86K+Vu5TCWrVbfL3n
	c1dx45BTqRtDAhn0fM6nLUDojXJodArYz66bwaY6LDEybVWhCXIKdej6Ib23lFr0
	kKfIFH80LJLqFFuOjo/MUtpCcAn+R5JgJFa+FkfylcX6IxoqLlpC8Uys6X9f8Pav
	uP5j+u3SvKrYBbic8FwMTCXT5HsdGCJjpeGB75nfCM8arIn5f9H1gNpeJd5BYw2C
	PnDKcA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800g8t6nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 09:33:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 249E640046;
	Wed, 23 Jul 2025 09:32:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14599768F12;
	Wed, 23 Jul 2025 09:30:48 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 09:30:47 +0200
Message-ID: <3e59d670-ee96-4ff2-a6c6-99d8a030e16c@foss.st.com>
Date: Wed, 23 Jul 2025 09:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/19] dt-bindings: memory: introduce DDR4
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
 <20250722-ddrperfm-upstream-v3-6-7b7a4f3dc8a0@foss.st.com>
 <CAODwPW_7aYdEzdUJ7b2nT4-zS9bu_hbNqjc7+_wSHbedXZXJ=Q@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CAODwPW_7aYdEzdUJ7b2nT4-zS9bu_hbNqjc7+_wSHbedXZXJ=Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_003336_534753_AA545CEC 
X-CRM114-Status: GOOD (  10.05  )
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

On 7/22/25 23:57, Julius Werner wrote:
>> +      - pattern: "^ddr4-[0-9a-f]{2},[0-9a-f]{4}$"
> 
> This pattern doesn't really make sense when DDR4 doesn't have the same
> manufacturer ID / revision ID format as LPDDR. You could either only
> leave the fallback constant for now, or define a new auto-generated
> format that matches what DDR4 SPD provides (which I believe, if I read
> Wikipedia right, is a two byte manufacturer ID and then an up to 20
> character ASCII part number string -- so it could be
> `^ddr4-[0-9a-f{2},[0-9A-Za-z]{1,20}$`).

Oh ok I didn't catch that it should be from the SPD.
I'll propose something.

Best regards,
Clément


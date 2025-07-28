Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C94C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 13:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLBhveJQnl8m3PppqLbOwkmepYRNmUTrNGuqfx0S5N0=; b=QMSnFDYZdbAOD5rEybz4xQpFHZ
	FuN0IEfck8VWESD2f6b8wcaX9olI1OOUSC97Qs36fAghVmnJmH2mn086YQJAAcP06nlYe7KwhQ4Go
	ZYId60lYMBT3M2Gs2bBtcBN6j1UTdJUet+ahEKpAQT7PXfl78VAzUJNXMEo4CE6ksa9nOAcPZcFUb
	5ZnHHueBuSFTi5sKf5P1Q/wApoqKmT1Ns+9K4OzXDD9EZZv3CYS8WDv9FmkaqpyeiH4YehyJ6p3Bk
	/EVDrIX64cLx5NlszcST52ggGt3oqnDPBeY8Q6AuSYyPsCGZNCLLGjZTvgJcw4Oj/EPDPYtAif+pB
	6hd790Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugNml-0000000EWJs-14ht;
	Mon, 28 Jul 2025 13:20:59 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugNi0-0000000EVZu-07D7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 13:16:05 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SCmIZY020685;
	Mon, 28 Jul 2025 15:15:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	kLBhveJQnl8m3PppqLbOwkmepYRNmUTrNGuqfx0S5N0=; b=BO0GX2YIvdvzkDS8
	ZgLPuGdA6WGl6NtJ6/xQvARzA7FDTBuGpl2k/0Qe88TTGB7pnIHxmoiSSisOV32g
	UPiaPFmPKvtiX3XhLTfQmiPWWhAf9mhUbsxt+Qr5vXr+/xmOe8AI+GP0Tf55h+zN
	AFsqv8MDszq5GkCQzzPwvL5oMkRwBOJCrayjtLqCoOJvpNLWhq4S434nD6ImKdRB
	72VdlL6sQWIW34oobe/U/QH4wcbMN4ZdhzkhC81oilbCnC/pNvViJ6nfNqbMdD1i
	EIeVOm26ibQEre65vm7otTMzzWKq1lvbLirBMolEWRX1Hn8E7BM9qTwCIDk13yj3
	LKIF2A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484pc28cgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jul 2025 15:15:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C3CB64005A;
	Mon, 28 Jul 2025 15:13:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BDC18768ABE;
	Mon, 28 Jul 2025 15:12:40 +0200 (CEST)
Received: from [10.252.23.100] (10.252.23.100) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 15:12:39 +0200
Message-ID: <a0c0e255-32c6-466d-a2ea-694a4f074de3@foss.st.com>
Date: Mon, 28 Jul 2025 15:12:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/19] perf: stm32: introduce DDRPERFM driver
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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
        Julius Werner <jwerner@chromium.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-12-7b7a4f3dc8a0@foss.st.com>
 <20250725115655.00002304@huawei.com> <20250725115908.000074d7@huawei.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250725115908.000074d7@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.23.100]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_061604_364045_5AC491EC 
X-CRM114-Status: UNSURE (   8.59  )
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

On 7/25/25 12:59, Jonathan Cameron wrote:
>>> +
>>> +	platform_set_drvdata(pdev, pmu);
>>> +	pmu->dev = &pdev->dev;
>>> +
>>> +	pmu->cfg = device_get_match_data(pmu->dev);
>>> +
>>> +	pmu->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>>> +	if (IS_ERR(pmu->membase))
>>> +		return PTR_ERR(pmu->membase);
>>> +
>>> +	if (of_property_present(pmu->dev->of_node, "access-controllers")) {
>>> +		ret = stm32_firewall_get_firewall(pmu->dev->of_node, &firewall, 1);
>>
>> Jiri is busy driving dev_fwnode() thorugh to get rid of all the directly references
>> to of_node.  Probably better to use that here from the start.
>>
> Need more coffee. Ignore this one, you still need an of_node here.
Ack

> 
>>
>>> +		if (ret)
>>> +			return dev_err_probe(pmu->dev, ret, "Failed to get firewall\n");
>>> +		ret = stm32_firewall_grant_access_by_id(&firewall, firewall.firewall_id);
>>> +		if (ret)
>>> +			return dev_err_probe(pmu->dev, ret, "Failed to grant access\n");
>>> +	}
>>> +



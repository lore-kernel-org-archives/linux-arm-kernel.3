Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22E2C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIInZnJPnYgqDjAZabB8sZdy0QwAFLIAtwz+MylnP7k=; b=OJhZLkR6ZETf7YyHtjr4OT+A8r
	dlnGI5Tsttxt0ydD+KtVMc/JLueYcGHp4/L+ht2YVqCHgR6CyubTT+spWVGHMJygCHnQhvV3sbnWH
	QKx6zyBFOFqIEISDWyS/+ElJABsuW56ekXHzUUtdw85FaFAVsZh+gmV+rNMf/T5FekDyt1pnv/Vi7
	dVQThcFvVH1zUVdn1fUrHdoH3+5k1Qn1EwUxADahTZM4Qicom7tmMc335I8HfZDWoIZAy0nPuN1WT
	D1NkA0k9Iyo1kGB7txLDAKcq8K1b7CwIJErOYeI8AGg2N3EDzpR/sIKFImcasIOLqogutzevsH7KU
	btLGejHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIThO-000000048jx-2Pzy;
	Fri, 23 May 2025 14:48:38 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISvj-0000000423F-43EC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:59:25 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCYpHj011934;
	Fri, 23 May 2025 15:58:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	AIInZnJPnYgqDjAZabB8sZdy0QwAFLIAtwz+MylnP7k=; b=YdPs9bR+Tlgi2y3r
	g7xawDkziYKq11SfV2bPECBW4CrNOUj/06DTajvSTFZ76zTzlvS5A3BCDmk9b7k3
	kxiBdGU9mDt5OQ72A13gjyVm9oaYd5A0u3Cn3moxid1cQbHbctdHxQJqOaPvqJHs
	HHqUX4slez11lBycBfy6HbV6LNTHtodEZyI0CknuZZELzx9NRiro5QC49qs2+IdW
	Tgag2pgcO/eYVVnEqWCy95FLiSjc8TxoO16eMdzz1FG4KV5em8/nO1xBUr2Oby2d
	OxVbpWtC0zuWwS7aA+0rT1DDOpbBQuCQq1WVQ0hGGrGZZGn/xeAPRs6X6EBTQIm2
	Oo6d1A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwffefwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 15:58:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C28D140049;
	Fri, 23 May 2025 15:57:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C9F0A73EFC;
	Fri, 23 May 2025 15:56:56 +0200 (CEST)
Received: from [10.252.20.86] (10.252.20.86) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 15:56:55 +0200
Message-ID: <27bf1d5a-dfe0-40d0-a962-63b80b0d29c5@foss.st.com>
Date: Fri, 23 May 2025 15:56:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] dt-bindings: stm32: cosmetic fixes for STM32MP25
 clock and reset bindings
To: Conor Dooley <conor@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250521-upstream_rcc_mp21-v3-0-cac9d8f63d20@foss.st.com>
 <20250521-upstream_rcc_mp21-v3-3-cac9d8f63d20@foss.st.com>
 <20250521-lapdog-important-eab513a1f0c0@spud>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20250521-lapdog-important-eab513a1f0c0@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.20.86]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_04,2025-05-22_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_065924_519505_2AC09E45 
X-CRM114-Status: UNSURE (   6.60  )
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


On 5/21/25 17:27, Conor Dooley wrote:
> On Wed, May 21, 2025 at 02:38:51PM +0200, Gabriel Fernandez wrote:
>> - drop minItems from access-controllers
>> - remove rcc label from example
>> - fixes typos
>> - remove double '::' from 'See also::'
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks Conor

Best regards

Gabriel



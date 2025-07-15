Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6223C83F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 09:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mr1pLyz9BvSAR5yjnoGZ7OEkVotMBP2RsFtH4ZIuR4Y=; b=wK0i7EEcYc4EA290pYk6+Tb3zH
	eoe/P6cFS+bKIw32W3wXeMRcrVx6qYH6TO3AW1yFGxF78/QjNbwrYH1ZeaoQ49MFEwwWBgwri4kAO
	epHYaDASWB64qasHwoM1e8hZF2EdhEAaOdQgMrxF58fdxmzMqlCqZ3j1V2XEs8DLQ9pJKCmaI0UNT
	xkG4nbOLne2X8iTQxAilpoY49QY7jjKjPjOhWIzFoE9ig91b1wRbyyv5KM4eaJCrwHfKZKVZq95xG
	Ms0P3VRlxAVmWJDJrACrsJNLFgNCUbwU8UAmGhaRUdwd2LSRjBTHP2V6yFwVA3Vxb1eP38PkZR8tO
	L8FyA8aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbwh-00000004fq6-3IJx;
	Tue, 15 Jul 2025 09:27:31 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbF6-00000004YgI-3FQa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 08:42:30 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8GPxQ012267;
	Tue, 15 Jul 2025 10:42:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Mr1pLyz9BvSAR5yjnoGZ7OEkVotMBP2RsFtH4ZIuR4Y=; b=frANLRL/vezuJ7nx
	79QOJfNg+ci9dQV7bhQZRltly51Ji+djlNm9feefndwEMHxSS/MTRwFlS9QEk2/S
	tgh6u5R+21UvSPexZZ3YiRvurVFs0EyJS5TSenfvPRNJ+IP4cUsjLIwlBIUVNIZK
	u2gsUnIfxE0NSHkgJY6fzw8Xz13cB2OTXl3XovGVdlg3I3w9BA+jolg9e9Pqb9dN
	J4IWgz0YA72zdYpO2g3XTzJB//awG26ubXFrhruQiZZt/aHu3Pg/BGxuIGqxchGr
	lCjn4sN1GFlYhBej+ruBwqZT+5iZgldLjZYOa7OpnWx1ysXDaZ8zF2lr2wv6qWRr
	O288iw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47ucu9c0wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 10:42:22 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5BED14004B;
	Tue, 15 Jul 2025 10:40:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55B52AE6FCB;
	Tue, 15 Jul 2025 10:40:15 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 10:40:14 +0200
Message-ID: <a1d1970c-da5d-4b4a-a69a-bf9da7a07be2@foss.st.com>
Date: Tue, 15 Jul 2025 10:40:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/16] dt-bindings: stm32: stm32mp25: add
 `access-controller-cell` property
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>,
        Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>,
        Le Goffic <legoffic.clement@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
 <20250711-ddrperfm-upstream-v2-2-cdece720348f@foss.st.com>
 <20250715031717.GA4144523-robh@kernel.org>
 <765eccdc-7d51-42c6-bcba-07813077fc1d@foss.st.com>
 <20250715-belligerent-savvy-marten-fbd1a5@krzk-bin>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20250715-belligerent-savvy-marten-fbd1a5@krzk-bin>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_014229_307726_54C77509 
X-CRM114-Status: GOOD (  14.45  )
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



On 7/15/25 10:19, Krzysztof Kozlowski wrote:
> On Tue, Jul 15, 2025 at 09:37:00AM +0200, Gatien CHEVALLIER wrote:
>> Hello Rob,
>>
>> On 7/15/25 05:17, Rob Herring wrote:
>>> On Fri, Jul 11, 2025 at 04:48:54PM +0200, Clément Le Goffic wrote:
>>>> RCC is able to check the availability of a clock.
>>>> Allow to query the RCC with a firewall ID.
>>>
>>> If it is tied to a clock, do we need another provider? We have the
>>> "protected clocks" thing, but that might be a bit different.
>>>
>>
>> I couldn't find any reference to "protected-clocks" outside of qcom
>> related code, is there a documentation? (Couldn't find it in
>> clocks.yaml).
> 
> Huh? protected-clocks is in clocks.yaml... It is there with an explanation.
> 
> Best regards,
> Krzysztof
> 

Ah, I was looking at Rob's repo, my bad.


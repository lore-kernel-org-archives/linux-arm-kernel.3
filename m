Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF267C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 09:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuHtnSKsW+7Ihg+kQpOB9bOtYG+LujduoGhpLuXqrxs=; b=j1IE6kibOs903XO+7GniQKw+6u
	ae0cvK+v9+lgo9I/7RvYAC12jvQ5qV7UMtLewyOdzv3ozR3soY5c27JlvCaHv9QrJ3QGmccgM+m4e
	hJ7m1IrkK0S5NQz4x4JwLJNmjZueckE8JPs+mYX/1edowRxKvBQLWlwQW8VjNEOrFlfQMo0GWSC2M
	pmjbmPOl9PBf5vON+b7K7Rf5PnhTI5AF0Fzh9NaQ21gdX3CH4EnY2piUr3ix+WDVCtiZHYJQxC4fn
	QcRkpXbhq4loe6dWm4bPZVMmbN9yq9f69egqah2FF/yAF0glCzy+8BdnLxN9GQciH8IMHZm2j6rR5
	GnOa7WVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfgK-0000000FIdg-38sd;
	Wed, 21 May 2025 09:24:12 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfXJ-0000000FH2x-2XRP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 09:14:54 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L3wVbU011053;
	Wed, 21 May 2025 11:14:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	KuHtnSKsW+7Ihg+kQpOB9bOtYG+LujduoGhpLuXqrxs=; b=KrJSRluAke1eFynF
	YsRSpn4AixLB3VnboO1r/4KySuJbz6jh6HF9bPuPTr5EV1/70xIUQgxGOKw/pMPS
	UiVo2ky357LFlpVw+LbDpowzzLAOxpBFxPkjDAmnF4B1KIa4hpkhmMZNe7L2ohZH
	8ooz1eucpgkw9UYlaARcJoHSIh28cPYjEQO2CJOU2nfF9Xl6U32qvtbPtT/yPZfv
	27NPa1QM8feQ4Hwm1ZCRNOIN+n8+hRBialGHh5DeNIaHEVGS/9nv480F+cbh5dXy
	MsD6/HIs1k6x3/vLAuWLkjnJ+/SPG+bAXbRzZc+bUgC8vypIHgig5knNR+9o5WE6
	HebIfw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfab5cx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 11:14:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id ECB1640054;
	Wed, 21 May 2025 11:13:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4F64BB2E19D;
	Wed, 21 May 2025 11:12:18 +0200 (CEST)
Received: from [10.252.1.130] (10.252.1.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 11:12:17 +0200
Message-ID: <3e855041-3eb2-48c8-88d7-0eb7b9948cc8@foss.st.com>
Date: Wed, 21 May 2025 11:12:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: stm32: add STM32MP21 clocks and reset
 bindings
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
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
References: <20250520-upstream_rcc_mp21-v2-0-3c776a6e5862@foss.st.com>
 <20250520-upstream_rcc_mp21-v2-1-3c776a6e5862@foss.st.com>
 <20250520-absence-sixtyfold-0fd9bb03a42d@spud>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20250520-absence-sixtyfold-0fd9bb03a42d@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.1.130]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_021453_934956_F352F809 
X-CRM114-Status: GOOD (  10.25  )
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


On 5/20/25 17:56, Conor Dooley wrote:
> On Tue, May 20, 2025 at 05:28:37PM +0200, Gabriel Fernandez wrote:
>> +
>> +  access-controllers:
>> +    description: phandle to the rifsc device to check access right.
>> +    items:
>> +      - description: phandle to access controller
>> +
>> +    minItems: 1
>> +    maxItems: 1
> That's just maxItems: 1, the minItems is redundant.
> ok
>
>> +    rcc: clock-controller@44200000 {
> Remove the label, there's no user.

ok

Many thanks for the review

Best regards,

Gabriel




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97443C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 14:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdmtswUaNr7oJjimezjiXJoD/ZylkFXiGJCOd1EELY0=; b=uk3EEidFxn9aZbfesy+9CrRa1+
	xSBS3Zpd5enFK8oTg+FRoWoJy/Gi0OrNMAvdJtW7K75pW40hpzYazY5JqBtevugKm/ObbfBoizutM
	j2eclqQRKD77UbNVUi3k1VuPSg7hpuEnyqFcG8zKjY/9IR5nlZ3McIKfV/NX+WZ90xznaoETC1EVe
	VdQ0YDrKjEtjogGVm5MWluCnRSC5AzR5JZjNSwVKHhKmJz15vVZyNhX6QgqQq+0uLTRZ+yAOXZPOS
	sPs1rO3IpUW/dvw30wp7UN2NeoATpV0isOON56of0oaI1JaBpp95JPWZ/08upkMRx1ZxoX1VR5Roe
	JzLtFNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uealY-00000005G4C-2Md1;
	Wed, 23 Jul 2025 14:48:20 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZs1-000000056kU-2ogb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 13:50:59 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NDEqHF005546;
	Wed, 23 Jul 2025 15:50:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	XdmtswUaNr7oJjimezjiXJoD/ZylkFXiGJCOd1EELY0=; b=uvEohgRVKt/NpkRA
	2i/LYLEavOHikPFmlWpRLubh47aTWuYUcAsWdGcrUlsIggOJk3nTEnTfSXiQ6Daq
	B397w3Fh+nhhWLrDXVVdDFbt458tDWAUTHZ58FMU+8tXuK4pSOpfQBtJqEgJCw6r
	513Jw9+03JgYy+PYBtQo1wGTKt68un91GsKESvT5TG0nYIw1d02PmjbMqrNvrS0x
	Ypa2hmlpQcecePuRJZIJcWv1afeUgNqHW2zrIfArB4cr+xbrUXqBBbkiJ2n56iQV
	Zy+D7YHaP3JFEzm4WfXxPTpOnFKUFmpjtC+6uIvZppe2H+Ti6lIA5vivoAgn0hVA
	vcadow==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 480mx4saep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 15:50:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 594BC4006F;
	Wed, 23 Jul 2025 15:49:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9763778896;
	Wed, 23 Jul 2025 15:49:08 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 15:49:07 +0200
Message-ID: <a9505893-c762-4cc9-b20e-4fccda7c1ac1@foss.st.com>
Date: Wed, 23 Jul 2025 15:49:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/20] dt-bindings: stm32: stm32mp25: add
 `access-controller-cell` property
To: Rob Herring <robh@kernel.org>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
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
References: <20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com>
 <20250723-ddrperfm-upstream-v4-2-1aa53ca319f4@foss.st.com>
 <20250723134148.GA2136293-robh@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250723134148.GA2136293-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-23_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_065058_002266_688AA831 
X-CRM114-Status: GOOD (  10.69  )
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

Hi Rob,

On 7/23/25 15:41, Rob Herring wrote:
> On Wed, Jul 23, 2025 at 03:05:46PM +0200, Clément Le Goffic wrote:
>> RCC is able to check the availability of a clock.
>> Allow to query the RCC with a firewall ID.
> 
> The subject is wrong. There is no such "access-controller-cell"
> property.

I found it here though:
Documentation/devicetree/bindings/access-controllers/access-controllers.yaml

And want to use it like here:
Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml:41

Oh I see I might need to add the #.

Best regards,
Clément


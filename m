Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF2DCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 15:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pR/cYTMw3jgl+YXiMt8OJ3yKr+qlutsK3voWnGrYc7M=; b=eidIgiFgeEiAb5qoBz5Ka29qjh
	rnqhWO9bHDSyF1nAPn0td7Eb0Fgc5IW8ZAuIeJLRGXvH/cObiE7pcqKQT+ZPpb2m+QK3B7c2oHzwL
	86VnyBjMcVsfISgth4DNUDQNgKAks+jjvO3gidRimQ+TdLlVhrKs3Rd0AGqS32950PziGY1TlXDxk
	PloQX1td9fugtFB1t4gX0mktfXlTHO3fOXtvP7V9lK6u1E2c6Zaz75p1He1CcJ5Nemxp4qugycQtI
	+BUK0m94Nw1GNTzAbzxstvWJUO1E+hjGAM1UkD0v3a43X9fJaQ7N+HbF1uP95X5Orf8OEgrj23ah3
	CRIcLDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utpOB-00000006uP4-406t;
	Wed, 03 Sep 2025 15:27:12 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmuk-00000006S8d-0qKA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:48:39 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583CHub7021895;
	Wed, 3 Sep 2025 14:48:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	pR/cYTMw3jgl+YXiMt8OJ3yKr+qlutsK3voWnGrYc7M=; b=GDUw3m80Tdt3GIPv
	3e7yfOHZMxy6xuwAfJxoGFaJVQx4jWE6yi+nojXsxJFTZe1pqz4CUNF6PpN/avDN
	m3AYpAlSjNuGJt1x5m5dZwZT5OcgWOOVfaGEUsOxaNtgo19etY6M+YxVEUr2tKKT
	KP96+dMgyO+6Ar+U405fJGFYAje9q3Xu8paz/EFQa8LVzWrY64BgfZ02GABhV/iO
	lpJStkAC9IFR1+zXSaN7Fx35r+bAW53rj/MfnFo7nBllDMTaJ89HG9Sf/5lUNisA
	cXcFDDhsVl49uMSPj+UDYCb1o1SMr1Rll/LHM4AjOJfyCDJf6/MaHvDRzVzCiTPi
	4XipYw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vav2psd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 14:48:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5FB3B4004A;
	Wed,  3 Sep 2025 14:47:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0437A2B4D47;
	Wed,  3 Sep 2025 14:46:25 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 14:46:24 +0200
Message-ID: <dca0faa3-2d87-4a93-bc67-7028a7846647@foss.st.com>
Date: Wed, 3 Sep 2025 14:46:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: st: enable ethernet1 controller on
 stm32mp257f-ev1
To: Andrew Lunn <andrew@lunn.ch>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250903-mp2_ethernet-v1-0-4105b0ad2344@foss.st.com>
 <20250903-mp2_ethernet-v1-3-4105b0ad2344@foss.st.com>
 <faa673a3-d68c-4b7f-a2b6-1f5bf40aabfb@lunn.ch>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <faa673a3-d68c-4b7f-a2b6-1f5bf40aabfb@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_054838_534464_20323167 
X-CRM114-Status: UNSURE (   7.01  )
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



On 9/3/25 14:24, Andrew Lunn wrote:
>> +		phy1_eth1: ethernet-phy@4 {
>> +			compatible = "ethernet-phy-id001c.c916";
>> +			reset-gpios =  <&gpioj 9 GPIO_ACTIVE_LOW>;
>> +			reset-assert-us = <10000>;
>> +			reset-deassert-us = <80000>;
>> +			reg = <4>;
> 
> The DT coding style would suggest reg comes after compatible.
> 
> 	Andrew

Hi Andrew,

Right, I will fix that for V2!

Best regards,
Gatien


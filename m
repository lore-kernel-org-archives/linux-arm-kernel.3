Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C0ECA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 17:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzHn34jeAFC+trUamzDM6dfK6EpwqtxxyQu4NkAXCys=; b=0dq0MVsXgSnIYzR1fKyA6Pw0C2
	O0h8RJn+8eSryVemoIYaUAXuCl0+28Bz8n7ove2dCNJf8qlRTRolKMoObEE+EXBqXHIKco8ZeCe0+
	Q0yxhK1Ly2/nKBv7fkUlrYtjgsZp6XWF6kYqs9qRV6kAXx6Q0PCY10uJFhiooG+MYXeLJwYzVfayp
	/gGI4HnK3eYRWrEPO5nihghcGjoBAv8VNk1Fk/9kaqSPYwPZpoKaX3Ua/HWef0z5JHPblGS0wOtXU
	KN56C8Zs8jJD0WExzukYT+qfdD2KfCZde8b9tIjQCYpKc25/MpfMDZhuy8QcG5nxVlO5Boi6S5VcI
	RokSek7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrAi-00000007B8X-3Ljw;
	Wed, 03 Sep 2025 17:21:24 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnf6-00000006cMD-1Vou
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:36:33 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DWqw3022718;
	Wed, 3 Sep 2025 15:36:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	bzHn34jeAFC+trUamzDM6dfK6EpwqtxxyQu4NkAXCys=; b=OswDVRc0fkrDCn+U
	jX9Y6JwB7sKv9I9GTRnblCrimf8bCCzaFC3f1b+uFYAEXx6/574guT5BrAlfqg1T
	PrWMo7cxoxMAkTaiYjUpKBkHTr3sfMklY/xnyHXWZyfGvPD5YTYsSuSyEZCRLqRw
	I5zHZ507T90b1NGGwQSvuo5slo6I7Q/q9a7UgHQS24fchqokjpK66XnlEmg7UyyL
	eG8m6eKen77x59fEljxL5h50lzGd+MZ2LXqtLAhaz5FekOi8b8KxAZZyyWPja/tD
	reaKyH3dlFCXRvxHAQYTHdLWJ0nq3v9hOXTHThTsGo1C/QUXCp66FCoIvJ9p/fuB
	NFd1tw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vav2q0p7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 15:36:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EA26D40049;
	Wed,  3 Sep 2025 15:35:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6162A2B4B41;
	Wed,  3 Sep 2025 15:34:53 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 15:34:52 +0200
Message-ID: <9cfa9cb4-bf7e-4d48-b0cc-0726784b7462@foss.st.com>
Date: Wed, 3 Sep 2025 15:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: st: enable ethernet1 controller on
 stm32mp257f-dk
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
 <20250903-mp2_ethernet-v1-2-4105b0ad2344@foss.st.com>
 <5c49e94a-9267-459a-ba6c-70f3763f1a7b@lunn.ch>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <5c49e94a-9267-459a-ba6c-70f3763f1a7b@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_063632_691971_9859C54A 
X-CRM114-Status: GOOD (  10.13  )
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



On 9/3/25 14:21, Andrew Lunn wrote:
>> +&ethernet1 {
>> +	pinctrl-0 = <&eth1_rgmii_pins_b>;
>> +	pinctrl-1 = <&eth1_rgmii_sleep_pins_b>;
>> +	pinctrl-names = "default", "sleep";
>> +	max-speed = <1000>;
> 
> RGMII naturally has a max-speed of 1G, so this line is pointless.
> 
> You only use max-speed when you need to restrict the system below what
> it would normally use, for example if the PCB is badly designed and
> the tracks don't support 1G, but can do 100Mbps
> 
> 	Andrew

Right, I'll simply remove these lines.

Gatien


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7A1C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 13:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFoE3HK0D28qwdUZStsXbkkPYfcQlaxFa0f8RDcbnCs=; b=hhSqQ2Ri4fz3Ugo4b9ZkSQPJ3y
	EwGuPSFinJc7pBCKLNyeuA2TEQiKNuv1W4eYo4EVe/Rsa9wkgahGkbkD2141n7Wv34IywibPndOU0
	u9ZcT9XsiH0zBsmAcgbbLIeiN0ocQtYJl32KfZJWxep0OviEtDUM9hmbJq1G8/F0U5iSgI3PkiACg
	ydkGiXs20CU83UwAJgl4RMkHAnNFy+DO2/KtgtL5tpnlxIQJnm/O8UxOJFm6TLkaFKH3Mlgo1xST6
	4e9PygtNIosg5YVYhTKGuUvFtp2S34gZfpnZuIB23Fmlp5mYZwZCF/WE+23/oKB1kHQmVNHl3tEy2
	+RL/nA7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJuT5-0000000Apzb-2x4d;
	Tue, 27 May 2025 13:35:47 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJuDv-0000000Annj-1FEs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 13:20:08 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAsMIT011814;
	Tue, 27 May 2025 15:19:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	BFoE3HK0D28qwdUZStsXbkkPYfcQlaxFa0f8RDcbnCs=; b=psqZ4Sn+GcELhcem
	mXF6fCpefDL4VWSOiNFZnJ1fhr7KtX4F1kZb416PE4LaACw3r9T5oZQx38jo71oM
	IK1Tzl6EcIiCFK4mLYWNU7IsDkzORs8xyRhr7tYBK389R4sAp9Fq6Yl0lLcDJl1P
	Pt6rartBtbNDZI9AE3Edvw8jyvxBhoTrQSIcttAX0pOHCi/DqJ9YzitHk2SYz1yH
	MJzaN/5+mO4KEfrKhQXbVjM9tcj3szqckscmusjVmWKQnJqU7ZpQSMnV5kLRRQc3
	Dkv/KL5B7ZsJz22yE8jHEwG/PCrJzeA4wFHO+4g9jZCqoh6P3b3lKmK4ZiHeMMzT
	EUk0yQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u3hk4ghh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 15:19:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EF61840055;
	Tue, 27 May 2025 15:18:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 45D52AE88C2;
	Tue, 27 May 2025 15:18:01 +0200 (CEST)
Received: from [10.48.86.139] (10.48.86.139) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 15:18:00 +0200
Message-ID: <ca047799-6ec2-4386-a3aa-068766ea24d1@foss.st.com>
Date: Tue, 27 May 2025 15:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] dt-bindings: arm: stm32: add STM32MP157F-DK2 board
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
        Conor Dooley
	<conor.dooley@microchip.com>
References: <20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com>
 <20250527-stm32mp157f-dk2-v1-4-8aef885a4928@foss.st.com>
 <79fac1e2-c90f-49b0-9f9c-357c994b27ad@kernel.org>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <79fac1e2-c90f-49b0-9f9c-357c994b27ad@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.139]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_062007_630071_8C3D283E 
X-CRM114-Status: UNSURE (   8.99  )
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



On 5/27/25 15:09, Krzysztof Kozlowski wrote:
> On 27/05/2025 15:03, Amelie Delaunay wrote:
>> From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
>>
>> Add the "st,stm32mp157f-dk2" compatible string to the STM32 SoC
>> bindings. The MP157F is functionally similar to the MP157C.
>>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> How did you get Ack on something which is v1? Cover letter does not
> explain any history here.

Hi,

Instead of using my own patch, since Himanshu sent the same earlier than 
me, I rerolled Himanshu's bindings patch from there 
https://lore.kernel.org/linux-arm-kernel/20250524100319.22521-3-himanshu.bhavani@siliconsignals.io/.
I should have mention that.

Regards,
Amelie

> 
> Best regards,
> Krzysztof


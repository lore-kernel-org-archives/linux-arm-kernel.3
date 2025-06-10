Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80154C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCL3m+BGQL1ykNkUPx8ukHa4dw+bT4XFblDrGhiUwp8=; b=rVhajJIS0tj5k4lqkGKa8pjWzb
	ECS7gXJb8XrzvQK8R3KPLL2cQbO/M+6iVpzaxnWEuD8aaRp0T0+d1ERMcChqfMgEgWUIGTLTh9VZT
	FXkT/TX/PPLjdj1Rz/Sbb6x/CKUM4xOhSJx00XyjDUSp/EOI1yTgQHExsWshpP1/YurTUKQjzlmuS
	U87R3JLpnoO/qfrwHV3hEAXvtZCFGGNSZWdv2VdL3YZCSk7NBwQT5j6VhJa46vWnNmxCXxwQ5bhSB
	2Op7c0t8jAFJ+QYPeeGsCz8CxhsK6S+ENnf7WTuiVGX8zkgRSNORSyAati6qMkeDPFpo1r+bGZZcy
	yqgS8NiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1ci-00000007RMb-27gC;
	Tue, 10 Jun 2025 16:14:52 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOz6x-00000006zBK-2wL0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:33:57 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLDDB012936;
	Tue, 10 Jun 2025 15:32:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	RCL3m+BGQL1ykNkUPx8ukHa4dw+bT4XFblDrGhiUwp8=; b=o+EB4CWtEwJNHNA9
	47yfz4pD6ymBIVNAWLkRok+DgsQK+ETE9yatSF56TkUXp7QWC9xcoRnEbM5oZzol
	FeICd0c9ZUAV/OaYvWb04+Hc2EMFNT6y/EpwYVs17+EfDSK5R0PoBKYxYal0x2LW
	biIWKpgGJ31RnbDqU335sMOajdTd0W3fa+r0EThHmxIuq4fD1oihi0GIUm8gOV4w
	nwNYupJp/Nnb2W+631HmNr4kJjExcBf4PGTd+aBZTCOOC8cAyf7yS08dL5ZWA5VI
	0Uc6UJeVeJhPmf9FfDLMHTsckifctfgc5tdR7LZT8Nvl0XfM4K2GYCWcE++zasF8
	T3sLqg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aumdg7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 15:32:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C7C7F40055;
	Tue, 10 Jun 2025 15:31:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C13BB5D859;
	Tue, 10 Jun 2025 15:30:09 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 15:30:08 +0200
Message-ID: <24110be7-2a42-4283-8ca6-1c9a2c96043b@foss.st.com>
Date: Tue, 10 Jun 2025 15:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] bus: stm32_firewall: Fix build warnings about
 export.h
To: Antonio Borneo <antonio.borneo@foss.st.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Andy Shevchenko <andy@kernel.org>,
        David
 Lechner <dlechner@baylibre.com>,
        Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>,
        Jonathan Cameron <jic23@kernel.org>, Lee Jones
	<lee@kernel.org>,
        <linux-iio@vger.kernel.org>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
	<nuno.sa@analog.com>,
        Olivier Moysan <olivier.moysan@foss.st.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
References: <20250610124855.269158-1-antonio.borneo@foss.st.com>
 <20250610124855.269158-2-antonio.borneo@foss.st.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20250610124855.269158-2-antonio.borneo@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_063356_031984_893A71C8 
X-CRM114-Status: GOOD (  11.98  )
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

Hello Antonio,

On 6/10/25 14:48, Antonio Borneo wrote:
> After commit a934a57a42f6 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1") and commit 7d95680d64ac ("scripts/misc-check:
> check unnecessary #include <linux/export.h> when W=1") we get the build
> warning with W=1:
> 
> drivers/bus/stm32_firewall.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> 
> Fix it.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>   drivers/bus/stm32_firewall.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
> index 2fc9761dadecf..3ff5b5b6add45 100644
> --- a/drivers/bus/stm32_firewall.c
> +++ b/drivers/bus/stm32_firewall.c
> @@ -8,6 +8,7 @@
>   #include <linux/bus/stm32_firewall_device.h>
>   #include <linux/device.h>
>   #include <linux/err.h>
> +#include <linux/export.h>
>   #include <linux/init.h>
>   #include <linux/io.h>
>   #include <linux/kernel.h>

Thank you,

Acked-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

BR,
Gatien


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26C0C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 16:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muAwRDtlWPqfC7Ckl/SfsaEnjrfKdJHs7mawv1lD9nw=; b=fWEev32J9zgEtEwchlM7F8g0lW
	grekfWVqKKIiNjQqLQL0Eu0M46gCz4co2c4BNbNvguXFGLlJo/JOlgcTxM2DQERPDferzN2roz1Jf
	z+47AUUviAp8iuyqE8ZaWzynVjtSLOPBnRxKhQJaaHHlqfkbFyHlJWf5YK+196mHmwIN0AVy5ILJ+
	IeYzMmXh2nxqdB8SRhYmgzQ+dpdrea7ibS9K2Mfkmcz0UtmT29mm0bgf8WroLWa+oDsvEUQynChNA
	m0U2rq1rc24FUKeDdJRoXmPRPtCUfQcDXCTDPVmosks3MUX2G7sYwRPsQWYxZemKNPL9udO/haKxF
	bsMvEBxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiz0u-0000000FbEi-1Ptp;
	Fri, 14 Feb 2025 16:58:04 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiyrj-0000000FZVE-2QBM;
	Fri, 14 Feb 2025 16:48:37 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ECjshJ029218;
	Fri, 14 Feb 2025 17:48:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	muAwRDtlWPqfC7Ckl/SfsaEnjrfKdJHs7mawv1lD9nw=; b=J464MCAJoWPrzPnd
	fRlHP0xSoZLl0JuJpDcUtJfkP1wD2LrmbaqZCZyZuhCCj6hzB49SPN75gv42S4CR
	yeJTMLhfp5JZk7V10TxdnBQ3ykrDjpRVjI6xyJBTDObS04jofzr+jyvDdV7RivNJ
	nLgYS0a7KFIdGsNB3qgDSMYyLibyNB2Ox310k+xL8kx+gL1U4PiUtYgauidb87pB
	gaa7Dr6K2I8pcGrqPqgUGCBh30X4lZ2gRxEQIINgSUmhlUSa4nNU5f0zad+5ys+a
	sxI3KbL45014YivfJAGV3AhhXGpxSkA6EzFUS85f9NAWGEi+dL9h/PndurEQwW0A
	heVDkA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44rrfxc9e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 17:48:24 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1BCFB40050;
	Fri, 14 Feb 2025 17:47:25 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E701B2F25A5;
	Fri, 14 Feb 2025 17:42:36 +0100 (CET)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Feb
 2025 17:42:35 +0100
Message-ID: <9c543c92-38c5-457e-8a58-910d10867049@foss.st.com>
Date: Fri, 14 Feb 2025 15:44:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Bruel <christian.bruel@foss.st.com>
Subject: Re: [PATCH] Fixes: 2de679ecd724 ("phy: stm32: work around
 constant-value overflow assertion")
To: Vinod Koul <vkoul@kernel.org>
CC: <kishon@kernel.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <arnd@arndb.de>,
        <fabrice.gasnier@foss.st.com>, <linux-phy@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250117140514.3614314-1-christian.bruel@foss.st.com>
 <Z688unKfcSeFE5X/@vaman>
Content-Language: en-US
In-Reply-To: <Z688unKfcSeFE5X/@vaman>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_07,2025-02-13_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_084836_122506_14DFEFE8 
X-CRM114-Status: UNSURE (   8.23  )
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


On 2/14/25 13:53, Vinod Koul wrote:
> On 17-01-25, 15:05, Christian Bruel wrote:
>> This patch replaces the workaround with fixes for two issues leading to
>> constant-value overflow assertion:
>>
>> - Guard against false positives with a WARN_ON check to make the compiler
>> happy: This should not happen because the offset range is checked against
>> the sorted imp_lookup_table values.
>>
>> - Guard against a true warning found for the max_vswing, as a given
>> vswing value can be 802000 or 803000 depending on the current impedance
> 
> Patch looks fine, the fixes line should go here and subject needs
> revision
> 

Hello Vinod,

This was addressed in the [v2,RESEND] that you applied :

https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250210103515.2598377-1-christian.bruel@foss.st.com/

you can drop this first version.

thanks !

Christian


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BCDD32D7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 09:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Cfl6mwKTgaiiqEteeXeyTmeKooLQUTHnluak0d1CIg=; b=ES88j+uwxO7T9JmdfOn3QneEtx
	pK7U9g9/k6J5ZGnAjyITu2+U9S7j6BUHJEfK+OurtgBakqcd2skBQjszfqP+H2psHF30kFz8cGbe6
	LkeG1Ffgpfl5tOjI409ld0PmYugaVMGlmfIvG9lSOOSBc6cxD+Xgl5S0hev7gSww2iN/N5Plql1uC
	5Ro1LhHGgZ4Tz5OakA5lSSUMxvq6JtupyPCf1TKvGGeA6swY260m1K7PtWolW5K4RZ76G/ImthkAj
	hElTsKMhWzC73iI3odvrwnl2iEuAhJyW4BT0dco/q3+jHqIPEdJwaBpqZy7iPmXjjm8VlJAOY5BIu
	95LtmcOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnSz-00000002v5y-0Xxm;
	Tue, 12 Nov 2024 09:45:45 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnRB-00000002ura-31UI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 09:43:55 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC82ftV031759;
	Tue, 12 Nov 2024 10:43:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	7Cfl6mwKTgaiiqEteeXeyTmeKooLQUTHnluak0d1CIg=; b=OhC+T+Vcu/72fiQ5
	MYlsLkqqvCCcEJnNHpbZhNCVoT4PCLKBSTVi9UE25xsoGAYBOuDsM5xOTdlupKbx
	6GO8xDfV4qrhW1CNtZk/bz3e40ZN7KKh6CQvPSdqDwvtB1/HNtUQg2SUifn9tauh
	KBDBx0ilYtuouqcmqMNpxuGF9NX+0zEcuDz3PMJ/AQpKpgDkzIwztEodauBUu0jZ
	n783w2JhWcieWTvQkse7LuAe/MvoNL6FlK3mI4WvYqdc7U8Er6VairG4h8CcdaUX
	UyvoLRsGcBVDmf54hz7UCts1sQHyoXeWuKg/4xIhHd5RHU8T2um7ECp8yOpxPIgu
	Q4peWg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42sx1kkh1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 10:43:44 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2B9A54008F;
	Tue, 12 Nov 2024 10:42:20 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF5302912BF;
	Tue, 12 Nov 2024 10:40:50 +0100 (CET)
Received: from [10.48.87.175] (10.48.87.175) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 12 Nov
 2024 10:40:50 +0100
Message-ID: <1179b3a6-e430-4d9a-8f86-470e8cbe5738@foss.st.com>
Date: Tue, 12 Nov 2024 10:40:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firewall: remove misplaced semicolon from
 stm32_firewall_get_firewall
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        guanjing
	<guanjing@cmss.chinamobile.com>, <mcoquelin.stm32@gmail.com>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241109055049.269163-1-guanjing@cmss.chinamobile.com>
 <cfb1caed-9402-4148-831d-57c50bdf6a27@foss.st.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <cfb1caed-9402-4148-831d-57c50bdf6a27@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.175]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_014354_086806_8D390B20 
X-CRM114-Status: GOOD (  13.37  )
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

On 11/12/24 10:25, Alexandre TORGUE wrote:
> Hi
> 
> On 11/9/24 06:50, guanjing wrote:
>> Remove misplaced colon in stm32_firewall_get_firewall()
>> which results in a syntax error when the code is compiled
>> without CONFIG_STM32_FIREWALL.
>>
>> Fixes: 5c9668cfc6d7 ("firewall: introduce stm32_firewall framework")
>> Signed-off-by: guanjing <guanjing@cmss.chinamobile.com>
>> ---
>>   include/linux/bus/stm32_firewall_device.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/linux/bus/stm32_firewall_device.h 
>> b/include/linux/bus/stm32_firewall_device.h
>> index 18e0a2fc3816..5178b72bc920 100644
>> --- a/include/linux/bus/stm32_firewall_device.h
>> +++ b/include/linux/bus/stm32_firewall_device.h
>> @@ -115,7 +115,7 @@ void stm32_firewall_release_access_by_id(struct 
>> stm32_firewall *firewall, u32 su
>>   #else /* CONFIG_STM32_FIREWALL */
>>   int stm32_firewall_get_firewall(struct device_node *np, struct 
>> stm32_firewall *firewall,
>> -                unsigned int nb_firewall);
>> +                unsigned int nb_firewall)
>>   {
>>       return -ENODEV;
>>   }
> 
> Acked-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> Thanks
> Alex

Hi, please use get_maintainers.pl script next time so that
adequate people are put in To/CC.
Nevertheless, thanks for the patch!

Reviewed-by: Gatien Chevallier <gatien.chevallier@foss.st.com>


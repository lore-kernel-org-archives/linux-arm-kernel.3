Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B986C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 12:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53zGgiW4pcj9jrOtnsn97k72zHjoUdMXek5BkNzfPj0=; b=v66yHabpUtu7Tl1Q/re5VkFZXf
	CKpBYHIFRJdgUYbayykAMNNBLgaVZ2z1VAazo1Ot4Z6eP59IvMXon0NIBQFkg65/th7HQgdSAFjpT
	M+xMYaSywFwCD6/5cf65psqZRpU32cmgvP2CE3NE6nppUCc8W6sXg1nmgf+89VUPKeBnnZI5J1F89
	j6pY+w/vyoCjatc2PqQO3cNhSIB+BBKJwcrT1xD5Dyygd4Fq3NSNglc2/ubKYH1STBimiT5ievnhy
	8SyUNrv8gvkEltj5tgUPGEX5S3lEY4SqKsUEfLe8KDArADXavKeqDEgdrN+wuYpg3SDzyFZeeRKcN
	Ul0Js8Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulS2G-00000007jQh-0G9A;
	Mon, 11 Aug 2025 12:53:56 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulRzb-00000007j1m-1APp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 12:51:15 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BCFoFq015667;
	Mon, 11 Aug 2025 14:51:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	53zGgiW4pcj9jrOtnsn97k72zHjoUdMXek5BkNzfPj0=; b=2wI3QkQih+ZdbeD8
	Nn1JouG6h2FjVti5TbXbXwzVtT1X07GrF3u0GJT+xhn2w9bVIvqVu1LPOnqXnaAa
	DhlmK7aO2zPgDg2mkVyz+CMtC112Hw9BZ4LoYUkFUZK350NSYaLsuxvp83p9B1YG
	6yTUwtghRDbAsDN0QmhVmExmdBBnY6OOh19pWzG78oXoRjDQBhbxi0vwrnHqDGqD
	OOvw5UT9a6wogG6nwg4p5GZx1GDTfO3RiqytUn06BWZl+wrzIxliRCFqQFH5qk42
	eOgyPA7PW5CvOZysBEZa0jMNHGl/3DKWegPmUpH30H4fUIou+M5YoXGuReaQkQZI
	yUTaVw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48dw7g61uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 14:51:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0DCFA40066;
	Mon, 11 Aug 2025 14:50:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3479F748475;
	Mon, 11 Aug 2025 14:49:46 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Aug
 2025 14:49:45 +0200
Message-ID: <a55774bf-1133-48c2-ad20-7a69f340bd78@foss.st.com>
Date: Mon, 11 Aug 2025 14:49:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] memory: stm32_omm: Fix req2ack update test
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Kerello <christophe.kerello@foss.st.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250807-upstream_omm_fix_req2ack_test_condition-v2-1-d7df4af2b48b@foss.st.com>
 <39c67e57-e4e6-46ba-bd61-46afc650381c@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <39c67e57-e4e6-46ba-bd61-46afc650381c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-11_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_055111_906876_8EBFCEC6 
X-CRM114-Status: UNSURE (   9.36  )
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



On 8/11/25 09:09, Krzysztof Kozlowski wrote:
> On 07/08/2025 09:34, Patrice Chotard wrote:
>> If "st,omm-req2ack-ns" property is found and its value is not 0,
>> the current test doesn't allow to compute and set req2ack value,
>> Fix this test.
>>
>> Fixes: 8181d061dcff ("memory: Add STM32 Octo Memory Manager driver")
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>> Changes in v2:
>> - Add more detail in commit message
>> - Remove "Cc: <stable@vger.kernel.org>" tag as the fixed patch is not part of a LTS.
> 
> Why LTS would matter? Which kernel is being fixed here?

Hi Krzysztof,

The fixed kernel is v6.16.

Thanks
Patrice

> 
> Best regards,
> Krzysztof


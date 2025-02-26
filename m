Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CB8C021BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 11:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jo/UvzfaVefTj5QmF17mHt05v9bWd2UKSSqwvyDmE90=; b=LjqWnpJSkggz9VwIsY0RPBQuek
	up4sYriq94lN0D1bnNb2KR/ufLMZJ5Qrxuao8SuzkU/5aDq5uGSLrzuts97win4L1GvmSe5gBjWai
	tZgJEHtQlRhslCyaiFDLkgzMXG8fPxNooGZhy+kdXxPA2H8ZmqgMyG+90K1pEiL9N/Q6ScfdWng8N
	R4NRS67dRG0UBReHN3j0a/ZZ92Ln6rCuF4iuFsIlzVpqfzHhrzqybdxf8vSImFrxEDndjAQ3f1SFQ
	3KE2YPaGjnuvQeW7FR6KPwMcWpm4EJWteSmveON0moQ2WguENaRV46QinXtjo1O8pwKqFsWWQyZo1
	BPvMjmog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFJo-00000003RAe-3JfS;
	Wed, 26 Feb 2025 11:11:12 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEuW-00000003LYw-1w6I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 10:45:05 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51QAisqA1525409
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 04:44:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740566694;
	bh=jo/UvzfaVefTj5QmF17mHt05v9bWd2UKSSqwvyDmE90=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DgwmjuI0Ej3hhm2PlZOGXrSLhaq4K4zanEVbUbgWhElgK0fZyzqlbyTC49ySsE9rY
	 ptWs86AY+0SQkS+yLYrVgRm378slc6VceFMXyhO29CqH2xyifLSIdCIt07uwFcvQju
	 k4YxXZ/8NUnJJfzgJKe+wQSRiU+LC0Lae4xWNCKs=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51QAishd024132
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Feb 2025 04:44:54 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 04:44:54 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 04:44:54 -0600
Received: from [172.24.18.117] (lt9560gk3.dhcp.ti.com [172.24.18.117])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51QAipZ4106894;
	Wed, 26 Feb 2025 04:44:51 -0600
Message-ID: <0d33dea6-c021-4f2a-bb3f-92efd6eebd18@ti.com>
Date: Wed, 26 Feb 2025 16:14:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH] arm64: defconfig: Enable HSR driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Arnd Bergmann
	<arnd@arndb.de>
CC: <quic_bjorande@quicinc.com>, <arnd@arndb.de>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <srk@ti.com>, "Anwar, Md Danish" <danishanwar@ti.com>,
        <catalin.marinas@arm.com>, <will@kernel.org>
References: <20240419060013.14909-1-r-gunasekaran@ti.com>
 <686f583d-6bf4-4486-b9e4-20c1e268eda6@ti.com>
 <d4954e5e-e51f-41c0-bca5-6e14b4640022@linaro.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <d4954e5e-e51f-41c0-bca5-6e14b4640022@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_024504_591227_8994ED06 
X-CRM114-Status: GOOD (  17.54  )
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



On 2/26/2025 1:35 PM, Krzysztof Kozlowski wrote:
> On 26/02/2025 07: 18, Malladi, Meghana wrote: > Hi all, > > Apologies in 
> case you are receiving this email for the second time. > Any reason why 
> this patch hasn't been merged yet. Other than re-basing > this to the 
> tip, anything
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
> updgnZav1ue7gKXOnHOpH5hg8gLmw9Osqsqh- 
> KTLRTnBEurV_VetrG7mzU898vB_5xFrYgbRkkuuFMBobM-uhFAmUgccRSk$>
> ZjQcmQRYFpfptBannerEnd
> 
> On 26/02/2025 07:18, Malladi, Meghana wrote:
>> Hi all,
>> 
>> Apologies in case you are receiving this email for the second time.
>> Any reason why this patch hasn't been merged yet. Other than re-basing 
>> this to the tip, anything else which needs to be addressed to get this 
>> merged?
> 
> I don't think you sent it to your platform maintainers, so no one would
> apply it. Usually people ignore emails they did not receive, although I
> am here an exception tracking missing-DT-patchwork things... :)
> 
> Best regards,
> Krzysztof
> 

Hello Arnd/Krzysztof,

Thank you for the replies :)
Was having ambiguity since this is not TI specific change. Wanted to 
confirm before re-posting. Will post v2 patch including TI platform 
maintainers.

Regards,
Meghana


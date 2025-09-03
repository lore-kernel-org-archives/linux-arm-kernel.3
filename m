Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051C7CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 17:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkV/DeaXa2eIU6w26hvqIdLHtMibXdPwaApwqqLdeuY=; b=qtedHCdHcxS8pjkArcgRQHJ/vD
	UXzeYT1xLPjvY1qJTw2KExcRxKGOJMu78YiRD3ZXbDOa/4omGIxK+CU9YeC6+mReHsqNe+/woXVye
	PMjMy4SB8YW6/9PPXeWTO+FQy4UMEhwT6ZOgCS2TRnylY+OS4BwGnjRkIQiheMCvkChQT34VjKPYe
	K8gIQ06qWEFcDVlrEB4OmUnHhQjqHXZVyYcSlEHJ7pZG7x/Mme3ldUHvEqQ90pjIwfbGAtGgULepG
	VlhEiCBKE+vxcKfzeQQG+zsRTOwFzY9uSRFX7j2Nl7lKu23xXgdpJVDJQnCKSYcjWVM323RcpxclA
	eTWDKPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utqxA-000000078NI-1aEI;
	Wed, 03 Sep 2025 17:07:24 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnQh-00000006ZZ9-1xCH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:21:40 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583D4th8003424;
	Wed, 3 Sep 2025 15:21:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	OkV/DeaXa2eIU6w26hvqIdLHtMibXdPwaApwqqLdeuY=; b=m6bXDn8VgVZgJnCr
	34JFmOEJIAaNaUVwkEeVxQIW9bR6uzN5c76vT1s8vnLJORKV+M9g1FFhvbbgqrJq
	JrI+I8nrIwHqabXed9I3RzAQ+m3PBLiE8z+gYvoL9Su8Iq0/UjxWPsVjO89a30hv
	SHXY2o6KR51g9QV9wjkHHbcH9f9m7BANHv/VLO9K41D3MEy9NUxsWeVDCKL3r9sp
	5LfSXj2Uu3qwLrXULX8kFA35vu5fDw/E2GDgxjAXlmrQvPW2s72YSwqFJquwvjA2
	CBnNmOgVH+GDasuSfg5ARyOB0AG93aUdPPvhZ1IRjGM1EQUz+qygK1125NqoaV1z
	SdU9CQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upe7gxae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 15:21:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 924634002D;
	Wed,  3 Sep 2025 15:20:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5F4E32B5120;
	Wed,  3 Sep 2025 15:20:29 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 15:20:28 +0200
Message-ID: <078fb552-c848-49ef-b917-14aec0e4b6aa@foss.st.com>
Date: Wed, 3 Sep 2025 15:20:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] docs: arm: stm32: fix typo "busses" -> "buses"
To: Akshaykumar Gunari <akshaygunari@gmail.com>, <corbet@lwn.net>,
        <mcoquelin.stm32@gmail.com>
CC: <linux-doc@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250807145119.2214-1-akshaygunari@gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250807145119.2214-1-akshaygunari@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_062139_772749_D525BACF 
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

Hi

On 8/7/25 16:51, Akshaykumar Gunari wrote:
> Fix the spelling of "busses" to the preferred form "buses" in STM32 ARM
> architecture documentation.
> 
> Signed-off-by: Akshaykumar Gunari <akshaygunari@gmail.com>
> ---
>   Documentation/arch/arm/stm32/stm32f746-overview.rst  | 2 +-
>   Documentation/arch/arm/stm32/stm32f769-overview.rst  | 2 +-
>   Documentation/arch/arm/stm32/stm32h743-overview.rst  | 2 +-
>   Documentation/arch/arm/stm32/stm32h750-overview.rst  | 2 +-
>   Documentation/arch/arm/stm32/stm32mp13-overview.rst  | 2 +-
>   Documentation/arch/arm/stm32/stm32mp151-overview.rst | 2 +-
>   6 files changed, 6 insertions(+), 6 deletions(-)
> 

Applied on stm32-next.

Thanks
Alex


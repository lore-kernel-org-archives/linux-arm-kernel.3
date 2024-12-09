Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F3AE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 09:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4raHiqxQoPVH+LXWyFUosGW/Q2xLlE6E0wYYvSLxcV8=; b=fKPKok7RA6UBKB4fiB4BDlQY0R
	f+TsUhCljtU4uDeDisbmQE7GV0t3wLyZUNHVYaxC8DmpONRxPgDfsC0S+WVWs1whOZbWO5pz7LMHU
	w/omF47uanpzr3ZRLdS2rDHL3kc1yqRIVmyoZ1FMw4klOrYejm7gAiKpAIKfPlR5pKZtEtp0jJ51z
	WNmBwm+KMsWGJ9P1tAnuGGiAGFEuLhrh+cECDWRuy2bcSDkTkuH8inF3JjJgV2Uhj7BlG8mIwLB29
	nfHmZzIunSfVYfn912habfbhbUy4w1C2yXz2NPQHoYQcSr3K1f8kRlam06aX3JWlfIxoGHIiJc+S8
	yYqM9sNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZeT-000000071mc-0fgr;
	Mon, 09 Dec 2024 09:02:01 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZdP-000000071Qr-3joK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:00:57 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B98VISn028237;
	Mon, 9 Dec 2024 10:00:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	4raHiqxQoPVH+LXWyFUosGW/Q2xLlE6E0wYYvSLxcV8=; b=YOj+ENX1/yu/azn+
	6f4/j18QK7hxDoTpOMaZeTzmhKvPgOhxJWfZTEinxb4/Iq0tBk2UzJAbMsDJI7ri
	S42H1yBbQOZmmhXCglpUjzdChmDv8XOs2UTiDQ7M7SwXRvzFyvzpTuugJRkMXo4D
	u7xCUKFKwoHJdBxfdPUogHgiEDsu3F6upLsENPXtH60KZkJC/Ct1vTBrClM7WEYP
	My56ygdlFcscpK5ATcFo/LDe3dVxvzGIJFJEIs4qT5rvXvKn9qvWYBZDOZuyuBIp
	cu6BTwu3YFBT33nroessU5wdkyfdLi8KRSf3oqMkIeYg51xw2Vcgr42NXJKSkzXG
	2YzWPg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ccnkxwrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 10:00:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F07CC40077;
	Mon,  9 Dec 2024 09:59:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 818D524D44F;
	Mon,  9 Dec 2024 09:58:59 +0100 (CET)
Received: from [10.48.87.198] (10.48.87.198) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 9 Dec
 2024 09:58:58 +0100
Message-ID: <18c36a0b-f647-4acd-bed2-d5a09b1694b7@foss.st.com>
Date: Mon, 9 Dec 2024 09:58:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: dma: st-stm32-dmamux: Add description for
 dma-cell values
To: Ken Sloat <ksloat@cornersoftsolutions.com>
CC: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <dmaengine@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20241206115018.1155149-1-ksloat@cornersoftsolutions.com>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20241206115018.1155149-1-ksloat@cornersoftsolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.198]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_010056_253824_38CAF223 
X-CRM114-Status: UNSURE (   9.53  )
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



On 12/6/24 12:50, Ken Sloat wrote:
> The dma-cell values for the stm32-dmamux are used to craft the DMA spec
> for the actual controller. These values are currently undocumented
> leaving the user to reverse engineer the driver in order to determine
> their meaning. Add a basic description, while avoiding duplicating
> information by pointing the user to the associated DMA docs that
> describe the fields in depth.
> 
> Signed-off-by: Ken Sloat<ksloat@cornersoftsolutions.com>

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>


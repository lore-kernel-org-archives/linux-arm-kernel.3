Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB82CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbG/DgXgau78CIkI3+MQbjX+sYb7ZYtoUXtP9IbZlwA=; b=cgrlAizCX5l+UsfZE3zRxT3RV4
	CKuqkfQpYf3Hg0Rc8ae6ChDvWjbieWsPV5Tq1q0x2KxNoBmAw3Yt1i2Yh/Dy3sd7DU9hAnLyoNOwH
	47H11N7ktOtAvX4Xfl9Ajv2mxTG3fhNMI806jw8nAayjqmgiiafkBujT7gM2C+Vv405jhQUvFYlcI
	mgL+uNJHm0PttlnmyfY+WErMzNm050zy+HXzNx9hGGTSexxUwmZAskzbS+wgXztGVLkeK26m2ESfV
	YVZcIG0UlroOEA5eL+W1mXjAJXlqwJAXp+mtC8ptGs/pnQci9icSZ5PmcQqMqnGiYo38dKWxlbZ1I
	/9yTv6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utk6s-00000005z9Y-3rpk;
	Wed, 03 Sep 2025 09:48:59 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utivt-00000005blY-12zn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:33:34 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5838RtY8015449;
	Wed, 3 Sep 2025 10:33:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	CbG/DgXgau78CIkI3+MQbjX+sYb7ZYtoUXtP9IbZlwA=; b=7quNYpbMIWXq5ZTh
	UGu5GfZUH8lRpdGGUowWnlLGHmly1s9B/zQ2/ZzuvzxWf7TiwTCJbgBGSqNeA6ss
	cF34z/PZVT/SPNX/kdyhGpPjmagnj+dD3mRaeOJskZS7sBu/6H9qo1Wz3CtNOlCq
	dHarfBeyrSzZZrKizqtq7au1TC4H4F+iq7lz/2cWSsDJPeBlnJdyTWCFL8j6wFKb
	sd8CiDkQzXlUCFpd3KMyufYtPVsTZssENKuAHDxIg20MvneLF5eB1Dr1mkT2g0/h
	lbfASz1oqbrsyMqQIKPOxSIMTU/FXEFlG2PfwOzOVG07Ztcy3Bm1vNxu+VLRREbR
	nuyIrw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upqkgg2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 10:33:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3F7FB4002D;
	Wed,  3 Sep 2025 10:32:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC4342BBC2D;
	Wed,  3 Sep 2025 10:31:19 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 10:31:19 +0200
Message-ID: <0dbcc59d-2797-4106-b247-9bd575c5de2c@foss.st.com>
Date: Wed, 3 Sep 2025 10:31:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: dts: stm32: Drop redundant status=okay
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Christoph Niedermaier" <cniedermaier@dh-electronics.com>,
        Marek Vasut
	<marex@denx.de>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <kernel@dh-electronics.com>
References: <20250818143730.244379-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250818143730.244379-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_013333_584287_6DB95F9E 
X-CRM114-Status: UNSURE (   8.53  )
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

On 8/18/25 16:37, Krzysztof Kozlowski wrote:
> Device nodes are enabled by default, so remove confusing or duplicated
> enabling of few nodes.  No practical impact, verified with dtx_diff.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm/boot/dts/st/stm32mp157c-dk2.dts          | 2 --
>   arch/arm/boot/dts/st/stm32mp157f-dk2.dts          | 2 --
>   arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi | 1 -
>   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi  | 3 ---
>   arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi   | 2 --
>   5 files changed, 10 deletions(-)
> 

Applied on stm32-next.

thanks
Alex


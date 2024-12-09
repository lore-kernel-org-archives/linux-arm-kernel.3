Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549D6E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 16:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zaqz0lhJMujS9j5Ch3cOtvcUwmJM6m8N0ZjnzaY3Af0=; b=zFylL6hf4KfCg3tmstPcY+P/Nq
	kHhOjIfk7aXcim7ogu7Jbo555rTr967HjAKb6uEDOn7WnS6dFaC+17XMtwQgvjTq/YipHtoSRFtEK
	SzVGhWZcsuplUVYfB0x85GFt80Ro7m3l68aXOGYA8XwxUJq32EdAcqp815gQYrfh1p6KQSB2b3Owr
	5F/1/jwfi8qQQamteBXVXC2LQbWWQf7Y7qqg9nrReYxSSrYZpC+8UYHvEqTVGBdsjiUIAeCP9RVAE
	f8d8baOrOr43GxlpI040EvJuRy/TB3bL5j/AOcX6VG0oshFcdvDmwbUSoTbNeIIC7/5CBz2S0q0AZ
	/roqzj0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgSz-00000008WXo-3WhR;
	Mon, 09 Dec 2024 16:18:37 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgRa-00000008WDp-4BAT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 16:17:12 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9B54vn012403;
	Mon, 9 Dec 2024 17:17:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Zaqz0lhJMujS9j5Ch3cOtvcUwmJM6m8N0ZjnzaY3Af0=; b=xr4n+JNikDGiVuk8
	R5baLlxHgD4CukoiD8zyKybdkZXIAjqWZhx0JpTL7PNQ0DQVtSVCy5Nrr7Vo0Yx3
	CBi+afzmczrMZmnmdx2chVDKFID8VHRAxAYs/a2wTZGw84pWPex4BalmqURmIOrn
	nxgvweLMQ9ggqvG/Xfn3jhn/HCeTD2gL4Yd+Ht0luEO3hng8xdTfSCv1xcH+EcTW
	7Q+e8CEJvWzfYGme0gb8wYeMs30uY0u4J2FbkSJwbl9vmJB6SZp5nufXM6r08hRS
	lMt2j3l77cFLQw9hXwjlJw2srbZRcPXFWyiXMNLQowqn0rluVF2CGXT1Hp0g6Ljc
	/b1evg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ccc8rrhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 17:17:05 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0A31840062;
	Mon,  9 Dec 2024 17:16:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1DC68294C05;
	Mon,  9 Dec 2024 17:15:22 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 9 Dec
 2024 17:15:21 +0100
Message-ID: <543e0df6-5719-41b7-a986-724f6fe6557d@foss.st.com>
Date: Mon, 9 Dec 2024 17:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: add sai support on stm32mp251
To: Olivier Moysan <olivier.moysan@foss.st.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241113092047.2359487-1-olivier.moysan@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241113092047.2359487-1-olivier.moysan@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_081711_317874_7E86027A 
X-CRM114-Status: GOOD (  11.67  )
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

Hi Olivier

On 11/13/24 10:20, Olivier Moysan wrote:
> Add SAI support to STM32MP25 SoC family.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 136 +++++++++++++++++++++++++
>   1 file changed, 136 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 6fe12e3bd7dd..e9db486b988a 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -484,6 +484,108 @@ spi5: spi@40280000 {
>   				status = "disabled";
>   			};


Applied on stm32-next.

Cheers!
Alex


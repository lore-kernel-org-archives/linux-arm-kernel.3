Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B578C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 09:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKkzym8iL3hbITcicEqfEneityvCYZo4YSktLirvyx4=; b=iG12YeMIoJ/pFXQ+lAY1BvGSF1
	dfYICKo90R+si5rwKnl5AaSLMcls5hLm5FQxHuBmof/bqYJDCyD+KbgGd/4D763PUxHi8D5ALGqHq
	y/ne2eqWpAVqZ4k/qj3w+I1JF6TZfsZLEIY0+Vi72lJTAHQKOGBCtQMAgQL4q73/wGt3tTpZtwsQQ
	dBwUR6AqPWw0w1Tor0rOJ8uTk2psBIx6HM9B35jqLixag1XhWA6kxzpqZvyjeJ6fa5mme/U6a/JOH
	MbqMbxEVX5fsUfcCGoUxegrsmjRjhG3nMBchtHA+X06YqDQJrUHl/rdol/MFSTkJd008oD9yCzwAo
	Rr28U09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKFq-0000000E6ys-0RDi;
	Mon, 28 Jul 2025 09:34:46 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugK9F-0000000E6F3-2Io3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 09:27:58 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S5AQBU005322;
	Mon, 28 Jul 2025 11:27:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	tKkzym8iL3hbITcicEqfEneityvCYZo4YSktLirvyx4=; b=Cz9thDgRAVogk5sj
	Ry6zrR/xEwoonnK8i5QMYJoMsLjKDOgzYPgfW/b755DX+Dxm7KHNXn5xgJ9EXSuV
	PLhEdScHf/zZcx+QxFtQbfBwVOT5ZMXey2/1jtvshN41d8M3C3xwCq9SjZMvpZn7
	dGlVyecB8tfw8/UMjzHeNvSVEkp5KBa2MkG1Un+P8zpZvhRjP696uDJWGbCKah+E
	HlJGCJkpHYW6mYplJ4Pxw27aHa6rDphkt2OB0PjBvZnIe5A3P5S9n7lcU+cjVPZO
	+qM5NxQMHWb1rL0OB2F7kGlF+rl58j1jvzqopRfWRhqOwXRs87MQQ5nnS4MsuEs6
	pghrkg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484m58y971-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jul 2025 11:27:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C73E24004F;
	Mon, 28 Jul 2025 11:26:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 426066F3FF7;
	Mon, 28 Jul 2025 11:26:13 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 11:26:12 +0200
Message-ID: <517de150-9fb1-4098-92a3-d5a24eea67a1@foss.st.com>
Date: Mon, 28 Jul 2025 11:26:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: arm: sti: drop B2120 board support
To: Raphael Gallais-Pou <rgallaispou@gmail.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20250714-sti-rework-v2-0-f4274920858b@gmail.com>
 <20250714-sti-rework-v2-3-f4274920858b@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250714-sti-rework-v2-3-f4274920858b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_022757_857846_CC901E96 
X-CRM114-Status: GOOD (  12.36  )
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



On 7/14/25 15:49, Raphael Gallais-Pou wrote:
> B2120 boards are internal boards which never were commercialised.
> 
> Remove them from bindings.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> 
> ---
> Changes in v2:
> - Added Krzysztof's acked-by
> - Put this patch last to get a bisectable series
> ---
>  Documentation/devicetree/bindings/arm/sti.yaml | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sti.yaml b/Documentation/devicetree/bindings/arm/sti.yaml
> index 842def3e3f2bce470763d3665c7603b9058b1e4e..177358895fe1c9f80f8c825142cf015d04286ce8 100644
> --- a/Documentation/devicetree/bindings/arm/sti.yaml
> +++ b/Documentation/devicetree/bindings/arm/sti.yaml
> @@ -14,12 +14,8 @@ properties:
>      const: '/'
>    compatible:
>      oneOf:
> -      - items:
> -          - const: st,stih407-b2120
> -          - const: st,stih407
>        - items:
>            - enum:
> -              - st,stih410-b2120
>                - st,stih410-b2260
>            - const: st,stih410
>        - items:
> 


Hi Raphael

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks


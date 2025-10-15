Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AA7CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 12:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OkkNCfu4YnFSj7smPfoU7koyJr+GcXCwTUxoqvzw+Q=; b=R0ynnXx0X+hIwfRw6MhLnqwKFB
	IZ/q6oTX0S7s4IwmBe3LaNgGgjHyllpSomzyrwCqkjvTbvq9QsfJeKQrxFy2rNLy9JhXTlq0GUDYB
	YClrrVWNHlDm9HmWyzI7Imi8L17Nf5YB7x+nzf19mOvzdNK2Eczq9H+KSV+hXG7f4VsUPRJan0d3O
	N38+tOMMadPImkHApSsYBHkAKRXSROlTkNQE8zQxWqgv0UK0o50vjMezwVVC/i5jjW41Fgp32NdGD
	xIJIo1lE8qHPmIW5vpNpS8VcmssqDtO5m3U8yP4iKYoXjsybUhdEWY7J/uTzKEKAgb5XgcRwqZKJd
	VskdCvrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90PJ-00000001WNV-14Vx;
	Wed, 15 Oct 2025 12:15:05 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90PG-00000001WMR-2RQP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 12:15:03 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59FCEs301313169;
	Wed, 15 Oct 2025 07:14:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760530494;
	bh=2OkkNCfu4YnFSj7smPfoU7koyJr+GcXCwTUxoqvzw+Q=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=mp/u9j+qM8SGyPJRAIYEryWwjOZQHt6KJB6YWdyGwKb3jPB6PWHrWT3SHrYFQNA24
	 sN2G2zAEgOS4ZMfMZJhmXr9dm38adp+cCLbC1qYS3cLHaaG4LA3+HVTfeoL5CtNZCT
	 qFUGsP559oVqrekDfEbDMjB4KUIHLu/PmJdcyblY=
Received: from DLEE212.ent.ti.com (dlee212.ent.ti.com [157.170.170.114])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59FCEs4E392056
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Oct 2025 07:14:54 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 07:14:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 07:14:53 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59FCEqFo1878736;
	Wed, 15 Oct 2025 07:14:53 -0500
Date: Wed, 15 Oct 2025 17:44:52 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Bryan Brattlof <bb@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Andrew
 Davis <afd@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony
 Lindgren <tony@atomide.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>,
        <linux-gpio@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 1/4] dt-bindings: arm: ti: Add binding for AM62L SoCs
Message-ID: <20251015121452.7cmsi4tceezroxsa@lcpd911>
References: <20250912-am62lx-v6-0-29d5a6c60512@ti.com>
 <20250912-am62lx-v6-1-29d5a6c60512@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250912-am62lx-v6-1-29d5a6c60512@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_051502_715499_C3E58AB2 
X-CRM114-Status: GOOD (  15.59  )
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

On Sep 12, 2025 at 10:40:40 -0500, Bryan Brattlof wrote:
> Add the binding for TI's AM62L family of devices.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
> Changes in v1:
>  - separated out devicetree bindings
> ---
>  Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> index e80c653fa4382acef964e182ecc4ae5445088936..d916c627eb619d16124772df5aacac9354126808 100644
> --- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> @@ -37,6 +37,12 @@ properties:
>            - const: phytec,am62a-phycore-som
>            - const: ti,am62a7
>  
> +      - description: K3 AM62L3 SoC and Boards
> +        items:
> +          - enum:
> +              - ti,am62l3-evm
> +          - const: ti,am62l3
> +
>        - description: K3 AM62P5 SoC and Boards

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated


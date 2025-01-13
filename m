Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C89E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 08:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSW8VsRMXbq3sSb57eaX0dEK1UpZGs9dyfJAciyuhos=; b=G8Lex2/Obwj7z9JNewNABxBNxz
	Q4oXN49TLYxynLajbtEP0nFTxOPTueTYrjcy0XwALgoue70WCbpX01CnBiQN53J/4rxhup6PISjRy
	qQLlEaGdepx5s8ntX8V0Qh33hsIoMFvIQZgJCfmy0tcLXADWZDOPNCf4DP3ge/XV+4tDS9EoBUDQF
	bqzRKJkmZ+n4+QzP2+hE5S+rNAlZ0LPE5URk6NBtBTwAFAzSp1L2OyrMkKH9UThJ7TEVOpAuLUaBO
	hZtdbRSKIpxuIlICo2dVQAQsIY9xsCvxBPDeEuX0c080kcJshBmiE9z0dyk1vmPYm3YcX+Zcdyt27
	HL9fZQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFRf-00000004JNC-2syf;
	Mon, 13 Jan 2025 08:05:11 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFQR-00000004JGz-0uxl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 08:03:56 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 50D83ZXR026475;
	Mon, 13 Jan 2025 02:03:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736755415;
	bh=qSW8VsRMXbq3sSb57eaX0dEK1UpZGs9dyfJAciyuhos=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=THf2oCBc+cWD9sEwWiOq1EUoUG8XfBSDFs/vyyq450/w+4ZLTXiJJacNZ+2oYF/t9
	 zGZhDIIlUj7wtZ+heIDz8YamomhQ18Wd6alisu5dxljAgRSA4lPfUIZhL+aTk9lZZ1
	 oa6MaYRMQsC49E+lsW4eYnOgAMqPSWHmMFWw9CJk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50D83Z2V045615;
	Mon, 13 Jan 2025 02:03:35 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Jan 2025 02:03:34 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 Jan 2025 02:03:34 -0600
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50D83T2u113090;
	Mon, 13 Jan 2025 02:03:29 -0600
Message-ID: <e08733fc-3dca-43e8-bcb6-c7d86c9f0982@ti.com>
Date: Mon, 13 Jan 2025 13:33:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/5] net: ti: icssg-prueth: Do not print physical
 memory addresses
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Roger Quadros
	<rogerq@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha
 Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team
	<kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <imx@lists.linux.dev>
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
 <20250112-syscon-phandle-args-net-v1-1-3423889935f7@linaro.org>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20250112-syscon-phandle-args-net-v1-1-3423889935f7@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_000355_393376_3F1E5DC2 
X-CRM114-Status: UNSURE (   4.98  )
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



On 12/01/25 7:02 pm, Krzysztof Kozlowski wrote:
> Debugging messages should not reveal anything about memory addresses.
> This also solves arm compile test warnings:
> 
>   drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c:1034:49: error:
>     format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Werror,-Wformat]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: MD Danish Anwar <danishanwar@ti.com>

-- 
Thanks and Regards,
Danish


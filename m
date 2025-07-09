Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908AAC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 04:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7aCkvXG+MKXaSJ9xOt5eq6LqiDFxhDDJkRJ+9+GQMMc=; b=vBAFNkb+Ruor8kMfc1MDe25/Nc
	gWFH/f10G4KNGcsdVyokh01hvNPv67T156W+j80IuoGPJw74UXOJ+H96hxXuHrWvnoXb2Db2CrE5n
	RuC9+9CqtapmcBNMWf2cBAjgnaeyqLGqh1keeleNMMJQB8lwlKHy5aOLc7/7ibBCU8wtX86kw/aZc
	I9fUPdZRNECRlHvt2DRcNpGR3LZgezsmJ5JlU0l34EbUkq/XWWb/5tp5a4pO8+kcNWTRStBZ4vZmW
	q2aD8G9J1mVSoFZqqokAxpy8eRyr1tD1mVPck1Scx8iV4Lsl4HEKUr5Ajd0ZQ7ZfjRa8qrp0IEQAQ
	mPA02vGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZMYN-00000007OsJ-3M0q;
	Wed, 09 Jul 2025 04:37:07 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZMSy-00000007OZX-3aZc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 04:31:35 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5694VTDj1097362;
	Tue, 8 Jul 2025 23:31:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752035489;
	bh=7aCkvXG+MKXaSJ9xOt5eq6LqiDFxhDDJkRJ+9+GQMMc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=j+k1uB0Ysvn6ghoyNS6FLYzyJH2szOhnMXzwGDbVwdHJPTXlbQtx0AWOyoxhTZ9IM
	 J1hF0KwB1rqlo4/0/nlpOgq3GrlYYLf3boVFEWp5TyYFj2y4pwxBQ4bDl+JQxnk1ID
	 3Q8GoEijTDYU/VCysbDhTXoWg/BZmr2CS7WTnqeg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5694VTcC2109600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 8 Jul 2025 23:31:29 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 8
 Jul 2025 23:31:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 8 Jul 2025 23:31:28 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5694VP9j3284330;
	Tue, 8 Jul 2025 23:31:26 -0500
Message-ID: <f2c47f1d-02ab-4a76-b232-0647be27d044@ti.com>
Date: Wed, 9 Jul 2025 10:01:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: ti: k3-am69-sk: Add bootph-all
 property to enable Ethernet boot
To: Chintan Vankar <c-vankar@ti.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero
 Kristo <kristo@kernel.org>,
        Nishanth Menon <nm@ti.com>
CC: <s-vadapalli@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250708084252.1028191-1-c-vankar@ti.com>
 <20250708084252.1028191-5-c-vankar@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250708084252.1028191-5-c-vankar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_213132_948546_04B9AE3B 
X-CRM114-Status: GOOD (  12.75  )
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



On 08/07/25 14:12, Chintan Vankar wrote:
> Ethernet boot requires CPSW nodes to be present starting from R5 SPL
> stage. Add bootph-all property to required nodes to enable Ethernet boot
> for SK-AM69.
> 
> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
> ---
> 
> This patch is introduced new from this version.
> 
>  arch/arm64/boot/dts/ti/k3-am69-sk.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
> index f28375629739..a1a16151015e 100644
> --- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
> @@ -568,6 +568,7 @@ J784S4_WKUP_IOPAD(0x008, PIN_OUTPUT, 0) /* (E38) MCU_RGMII1_TD3 */
>  			J784S4_WKUP_IOPAD(0x018, PIN_OUTPUT, 0) /* (E36) MCU_RGMII1_TXC */
>  			J784S4_WKUP_IOPAD(0x000, PIN_OUTPUT, 0) /* (C38) MCU_RGMII1_TX_CTL */
>  		>;
> +		booph-all;


Please test your patches!

>  	};

-- 
Regards
Vignesh
https://ti.com/opensource



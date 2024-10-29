Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E6ED13590
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 07:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxR+B3Hg3Gb0gdg16C27yAg0Ry6CDadPwjSk57BFkWw=; b=fR7BBGMcW/DgSNFzY+629wNuof
	oVedt3QiBH08oOuD0l8pYYifa33+1zgkktoKixkP3ZDfSBTVy+Rurlth4HAPeYOgKcApUk6JHpU77
	qzS3inUYV29oR8j1UiP6JVzwPanvRT1IUWQRhZjz6SycJgyCJFSzbNALVEDSxHzS8t1J91oSzydnI
	AlxT8dmTGZvmyr6eKZdYnON9AyDKkPQbqTUKMru/4OLpLYyqgKEBxR7UhjwWKxj1QhGSoGewKT2dZ
	zyAJCaGZhnZXvtRf1aISrvCR+/8mL30E4e1R5mIhRPm7YGzKwT4I6bU2YxkpT4Uva++Vu2stvI9PO
	94+nAKrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gFA-0000000DR0K-0jPc;
	Tue, 29 Oct 2024 07:02:20 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gBU-0000000DQGK-2iof
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 06:58:33 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49T6wKa5108154;
	Tue, 29 Oct 2024 01:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730185100;
	bh=fxR+B3Hg3Gb0gdg16C27yAg0Ry6CDadPwjSk57BFkWw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=HzEtz7I3gDix0Hl94uvWOjr/iowQ5ZjjV8jpnOuHUeIBQhjB+Yn7AAyiHMlY6NcY3
	 WLmXJU+wYlfHHxF4mtqtXxUxK5/J3ugLJbcIuY8iHcCzlVoW3inuBa8KRDWzXmvWR4
	 bL9+r/deUEiAV4wirx0hGP3hyC7vhFxmSIZUc3Ic=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49T6wKdC077826;
	Tue, 29 Oct 2024 01:58:20 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 01:58:20 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 01:58:20 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49T6wJ3A088096;
	Tue, 29 Oct 2024 01:58:19 -0500
Date: Tue, 29 Oct 2024 12:28:19 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
CC: Chandrasekar Ramakrishnan <rcsekar@samsung.com>,
        Marc Kleine-Budde
	<mkl@pengutronix.de>,
        Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, <linux-can@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Matthias Schiffer
	<matthias.schiffer@ew.tq-group.com>,
        Vishal Mahaveer <vishalm@ti.com>, Kevin
 Hilman <khilman@baylibre.com>,
        Simon Horman <horms@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 2/9] dt-bindings: can: m_can: Add vio-supply
Message-ID: <20241029065819.w6jc5nrputccuxjo@lcpd911>
References: <20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com>
 <20241028-topic-mcan-wakeup-source-v6-12-v5-2-33edc0aba629@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241028-topic-mcan-wakeup-source-v6-12-v5-2-33edc0aba629@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_235832_798449_30CF1B6A 
X-CRM114-Status: GOOD (  16.38  )
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

On Oct 28, 2024 at 18:38:08 +0100, Markus Schneider-Pargmann wrote:
> The m_can unit can be integrated in different ways. For AM62 the unit is
> integrated in different parts of the system (MCU or Main domain) and can
> be powered by different external power sources. For example on am62-lp-sk
> mcu_mcan0 and mcu_mcan1 are powered through VDDSHV_CANUART by an
> external regulator. To be able to describe these relationships, add a
> vio-supply property to this binding.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  Documentation/devicetree/bindings/net/can/bosch,m_can.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
> index 0c1f9fa7371897d45539ead49c9d290fb4966f30..aac2add319e240f4f561b755f41bf267b807ebcd 100644
> --- a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
> +++ b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
> @@ -140,6 +140,10 @@ properties:
>  
>    wakeup-source: true
>  
> +  vio-supply:
> +    description:
> +      Reference to the main power supply of the unit.
> +

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated


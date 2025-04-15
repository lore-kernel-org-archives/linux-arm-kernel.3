Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BB0C369B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 10:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CM1FfPxfT6qnGQR4NUV0eAkHxH46NNtG6XNVqSWakkc=; b=e/AfPPL/T8WvpXtgEtgpFO0Fz7
	HbsV6QSOfxBVOF4rXruoNnk9tvBP2OtMo/BgzA7ubpv9WkxzcwoP72dTdkM12YnhSXKNyilxbVFbK
	xYR8n9JXqK83NG8kOwbAukQ9z0y8x0DyeGh01y6gow6z5PJun/dWlY7Yi9ZoebimPDQPc5FzhqwhF
	QbfVAtjOzbSILzCooRZS/n/P1QyLAVp/tpvAjWTlmZNGzII0/3g9S3UfMcJlT8OFn5YfeuleJ10W4
	ZFpA1+n2l3OiIGATFqnWbtKcoT04ZMDGs4aV8IQcfJWJPVcJkpONOP4XrPkhTgy/BFT6jGN6DkJ71
	IGp4a35g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dn5-00000005O6Q-2kwG;
	Tue, 15 Apr 2025 10:45:19 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dep-00000005MCc-2agX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 10:36:49 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53FAaXB32330796
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 05:36:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744713394;
	bh=CM1FfPxfT6qnGQR4NUV0eAkHxH46NNtG6XNVqSWakkc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ons7m0hOXmjdWeM8ngfIhGEh25WQ/OKmnzeqD8KBWTVxgFA6gcDtM3AkeT+k5TfFa
	 rm40vZh6RA3UuZ2YVaFCkPVmtG3G+0Aeb6e2N9jqQB5EoK8DKCXkgwIiVc9v5dzOeQ
	 zpxFFM6SC3gQk4ObqM05Q5ERQP1VlvidXZnpqbv8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53FAaXrB008560
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Apr 2025 05:36:33 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 05:36:33 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 05:36:33 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53FAaWR6017032;
	Tue, 15 Apr 2025 05:36:32 -0500
Date: Tue, 15 Apr 2025 16:06:31 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray
	<dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Joe
 Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
        Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>,
        Roger Quadros <rogerq@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux@ew.tq-group.com>
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: ethernet-controller:
 update descriptions of RGMII modes
Message-ID: <6be3bdbe-e87e-4e83-9847-54e52984c645@ti.com>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_033647_871884_39171E6F 
X-CRM114-Status: GOOD (  25.90  )
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

On Tue, Apr 15, 2025 at 12:18:01PM +0200, Matthias Schiffer wrote:
> As discussed [1], the comments for the different rgmii(-*id) modes do not
> accurately describe what these values mean.
> 
> As the Device Tree is primarily supposed to describe the hardware and not
> its configuration, the different modes need to distinguish board designs

If the Ethernet-Controller (MAC) is integrated in an SoC (as is the case
with CPSW Ethernet Switch), and, given that "phy-mode" is a property
added within the device-tree node of the MAC, I fail to understand how
the device-tree can continue "describing" hardware for different board
designs using the same SoC (unchanged MAC HW).

How do we handle situations where a given MAC supports various
"phy-modes" in HW? Shouldn't "phy-modes" then be a "list" to technically
descibe the HW? Even if we set aside the "rgmii" variants that this
series is attempting to address, the CPSW MAC supports "sgmii", "qsgmii"
and "usxgmii/xfi" as well.

> (if a delay is built into the PCB using different trace lengths); whether
> a delay is added on the MAC or the PHY side when needed should not matter.
> 
> Unfortunately, implementation in MAC drivers is somewhat inconsistent
> where a delay is fixed or configurable on the MAC side. As a first step
> towards sorting this out, improve the documentation.
> 
> Link: https://lore.kernel.org/lkml/d25b1447-c28b-4998-b238-92672434dc28@lunn.ch/ [1]
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  .../bindings/net/ethernet-controller.yaml        | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> index 45819b2358002..2ddc1ce2439a6 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> @@ -74,19 +74,21 @@ properties:
>        - rev-rmii
>        - moca
>  
> -      # RX and TX delays are added by the MAC when required
> +      # RX and TX delays are part of the board design (through PCB traces). MAC
> +      # and PHY must not add delays.
>        - rgmii
>  
> -      # RGMII with internal RX and TX delays provided by the PHY,
> -      # the MAC should not add the RX or TX delays in this case
> +      # RGMII with internal RX and TX delays provided by the MAC or PHY. No
> +      # delays are included in the board design; this is the most common case
> +      # in modern designs.
>        - rgmii-id
>  
> -      # RGMII with internal RX delay provided by the PHY, the MAC
> -      # should not add an RX delay in this case
> +      # RGMII with internal RX delay provided by the MAC or PHY. TX delay is
> +      # part of the board design.
>        - rgmii-rxid
>  
> -      # RGMII with internal TX delay provided by the PHY, the MAC
> -      # should not add an TX delay in this case
> +      # RGMII with internal TX delay provided by the MAC or PHY. RX delay is
> +      # part of the board design.

Since all of the above is documented in "ethernet-controller.yaml" and
not "ethernet-phy.yaml", describing what the "MAC" should or shouldn't
do seems accurate, and modifying it to describe what the "PHY" should or
shouldn't do seems wrong.

>        - rgmii-txid
>        - rtbi
>        - smii

Regards,
Siddharth.


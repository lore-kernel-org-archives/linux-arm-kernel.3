Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F07606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sSvuf+33;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cQQUUwqu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XcnOgGjQGzD2jt2+DxGN1X1zcvzYzq6x9cioPsXKF5A=; b=sSvuf+33oPeKrOyv6HV0fQtrVk
	hcIn383eBS+L+lBT0aU0bWKnEgsVQVrbTYp1hxSFwDL8BXAAMNamKEukIZP8vRD6XKiywN4Z2ISS2
	re0ikCCkCoS81KSRZd568TAuNI36Y7LRVDqC+8VRq6Qc9N5QSmjKmKmu0HkGyr7BR5cCRoiRMl1YR
	iLNjHqLbiTUw3lC6ue0Kx1ybMO53VLx0fOSoQxSKg3sBbPtivqa/A343eSIWaHA7sh95yYDbDw9po
	6E2mCNnzwXAzNdQ+IGqlZCr8JdZb6BaS25k/VSyZ+IfKod+4bcpxsplMzDSMTyy4KParOcY1KAX+D
	V/FG1Mcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLCf-00000008gJC-0gbH;
	Thu, 29 Oct 2026 08:09:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLCc-00000008gId-1VLt;
	Thu, 29 Oct 2026 08:09:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A460600D1;
	Thu, 29 Oct 2026 08:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049331F01825;
	Thu, 29 Oct 2026 08:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793261377;
	bh=XcnOgGjQGzD2jt2+DxGN1X1zcvzYzq6x9cioPsXKF5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cQQUUwquaWBlsXDYoTLxTQ94mlF1ENpJUtdHRep3gjTCqt4CcYJmg0orM8Av1MiJn
	 lijwkBKZ7LYj7PTQlTnAP3Dv0g8kJMnSbSEZVygjKv9nKRvOVDZ/GEjQbuRl+Wyzt1
	 ZRoA+HU+wX9/MRRSER2kjftPWPbhc0iYqKcjG6ycMATi/mrmHId+n3uVqMJU04qMYB
	 Sb1rwbVtZUIn8OWeclPDIQd8Mi9whmlxnmfgYFwp3ic1VJHqb84SW2ip8N0JyV4jnW
	 g1JHXWYGRyDGGJk0i/RzvjG33Yx/2+N1YVFmQmXsQD/ScyocJ0lTlnZzHZ0On9PTmJ
	 vGmNnfGnH8yYQ==
Date: Thu, 29 Oct 2026 09:09:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, 
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
Subject: Re: [PATCH v3 2/6] dt-bindings: ata: sata-brcm: Describe the NSP IDM
 registers
Message-ID: <20261029-versed-automatic-orangutan-43cfde@quoll>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
 <20261026191618.3178830-3-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261026191618.3178830-3-florian.fainelli@broadcom.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 12:16:14PM -0700, Florian Fainelli wrote:
> Northstar Plus uses the SATA IDM block to enable the interface clock and
> deassert the core reset before accessing the controller registers.

And which compatible in the binding is "Northstar Plus"? I tried to map
them to arm/bcm/brcm,nsp.yaml but nothing is there, so it looks like you
are making changes without having actual compatible documented. In that
case this is not needed. Make changes WITH documenting new compatible.

> 
> Allow an optional third register region named "idm" for the NSP
> controller. Keep other compatibles limited to their existing two
> register regions and allow older NSP descriptions without the IDM.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  .../bindings/ata/brcm,sata-brcm.yaml          | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
> index fe7f091e744f..98529784b1fa 100644
> --- a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
> +++ b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
> @@ -15,6 +15,21 @@ maintainers:
>  
>  allOf:
>    - $ref: ahci-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: brcm,bcm-nsp-ahci
> +    then:
> +      properties:
> +        reg:
> +          description: AHCI, top control and optional IDM register regions
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 2
> +        reg-names:
> +          maxItems: 2

Please move entire allOf to the bottom, before "unevaluatedProperties"
line.

Best regards,
Krzysztof



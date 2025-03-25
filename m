Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE0EC36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 10:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Subject:
	In-Reply-To:Cc:To:From:Message-Id:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tODqhCRdwq1cXWRXmGhiNHHjhfHswwchnkKRsOhE6J0=; b=sshgh8q3EjNiCf77A8HKToGhfo
	2kmtETV/Pux+cg2DfhzGeAsc7KkiDEmkNMICSztaNuAazrRr5DyN2PG43X+xKl3gsNUuVhzksmNxb
	X7w87okRY123tIkfDBXU6SfKgF9njiGE3gGVBiUWJsQ9Oy26Keh1BVRIlb1QaReDD5CwoJ/9qNJF4
	3pPVXZsAW72fwUhkUZtvXbN5S9gdu7xhAlE7M7RQb/v2Wg0DOvaHwwQhnogXBig2IwUmyKuPOfXHh
	Nq+uPpLPgaIa+AUOMSc6NJl2IKzW/G1faGkMVLR1fLGvpI5MmxRiSu3I/7Zl2tWEXtkhn1OLECLTU
	IIdxS5pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1u4-00000005Vdi-0oXN;
	Tue, 25 Mar 2025 10:53:04 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.183])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1rU-00000005Upc-1S7X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 10:50:26 +0000
X-KPN-MessageId: 146499bc-0967-11f0-beb8-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.6])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 146499bc-0967-11f0-beb8-005056992ed3;
	Tue, 25 Mar 2025 11:51:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=tODqhCRdwq1cXWRXmGhiNHHjhfHswwchnkKRsOhE6J0=;
	b=Wc5JySZCXx1MoNhRPEol3otsbzxXiEBELwGp7X2PEUTfqxvTNxIPDD0sfLfyl0NeaUkIi7gzXy8FR
	 KnQTZuTfL96nU0c44qXfitXB/O1Mx9xSjgwecqJuqpY51zRsPY4QggzHfAuWUjehyRbHm994X8yCN9
	 zjiY6UzfMSIV7Tywf+AHZm2sg5/QULfmhVe6KegEJXm5SHT0UU9PHs0qB4ZJVfGHQ3R2Wvz1RHuc4+
	 jM9qUCZKzxc/XXG5M7RspIsCw+1H9AU0p83poYAV0sBKIiZjdGu17zjZ+Kacqb0MTyRPFs5nnVG0HC
	 ODy5JrZ1eOoVZy19zYJQ7ZqL6M2UHyQ==
X-KPN-MID: 33|X3ePmqrigeow21+0/RPmUN0r8S697D3GBHNH5gAjYHVFKlylKuLbV/4XqHXfbBN
 GYGKjtylp6D5XCh1zPvZARfdEblG5wmYxCvWkfqAaXEg=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|u5ACCmXoKrCtlfyO6JwQmRDfOR8RTr9QZHb3C3pFSCHXZmmCrngvMhskrSsADpq
 Hn53REoUx9NWcVO7nuoMzvQ==
X-Originating-IP: 80.61.163.207
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id f0fd1fad-0966-11f0-99e4-00505699772e;
	Tue, 25 Mar 2025 11:50:19 +0100 (CET)
Date: Tue, 25 Mar 2025 11:50:18 +0100
Message-Id: <87iknx75at.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net,
	marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com,
	lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org
In-Reply-To: <20250325102610.2073863-2-maz@kernel.org> (message from Marc
	Zyngier on Tue, 25 Mar 2025 10:25:58 +0000)
Subject: Re: [PATCH v2 01/13] dt-bindings: pci: apple,pcie: Add t6020 compatible string
References: <20250325102610.2073863-1-maz@kernel.org> <20250325102610.2073863-2-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_035024_802838_740580E0 
X-CRM114-Status: GOOD (  19.90  )
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

> From: Marc Zyngier <maz@kernel.org>
> Date: Tue, 25 Mar 2025 10:25:58 +0000

Hi Marc,

Sorry for not spotting this in the earlier versions, but:

> From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> 
> t6020 adds some register ranges compared to t8103, so requires
> a new compatible as well as the new PHY registers themselves.
> 
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> [maz: added PHY registers]
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  Documentation/devicetree/bindings/pci/apple,pcie.yaml | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/apple,pcie.yaml b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
> index c8775f9cb0713..77554899b9420 100644
> --- a/Documentation/devicetree/bindings/pci/apple,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
> @@ -17,6 +17,10 @@ description: |
>    implements its root ports.  But the ATU found on most DesignWare
>    PCIe host bridges is absent.
>  
> +  On systems derived from T602x, the PHY registers are in a region
> +  separate from the port registers. In that case, there is one PHY
> +  register range per port register range.
> +
>    All root ports share a single ECAM space, but separate GPIOs are
>    used to take the PCI devices on those ports out of reset.  Therefore
>    the standard "reset-gpios" and "max-link-speed" properties appear on
> @@ -35,11 +39,12 @@ properties:
>            - apple,t8103-pcie
>            - apple,t8112-pcie
>            - apple,t6000-pcie
> +          - apple,t6020-pcie
>        - const: apple,pcie

Since the T602x PCIe controller has a different register layout, it
isn't compatible with the others, so it should not include the
"apple,pcie" compatible.  The "downstream" device trees for
T602x-based devices do indeed not list "apple,pcie" as a compatible.
So I think this needs to be written as:

  compatible:
    oneOf:
      - items:
          - enum:
              - apple,t8103-pcie
              - apple,t8112-pcie
              - apple,t6000-pcie
          - const: apple,pcie
      - const: apple,t6020-pcie

>  
>    reg:
>      minItems: 3
> -    maxItems: 6
> +    maxItems: 10
>  
>    reg-names:
>      minItems: 3
> @@ -50,6 +55,10 @@ properties:
>        - const: port1
>        - const: port2
>        - const: port3
> +      - const: phy0
> +      - const: phy1
> +      - const: phy2
> +      - const: phy3
>  
>    ranges:
>      minItems: 2
> -- 
> 2.39.2
> 
> 
> 


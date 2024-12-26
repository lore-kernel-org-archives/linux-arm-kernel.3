Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2239E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 00:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5llZW6P5VgqZyIbwE1Z+fO4Sf3FHIOkUoaY/KJnbH0=; b=eLMdf/T0ilQkDrpUqVdewgprY8
	UAD08pJSEvjzJ8y8e8MjbeWZaMIhVIhvPvImmXiJRFHSs6MTT3WExQYofdbCZLEbqkeJ7r1cgxWvD
	Nuqub1WIyTC9u5IwQpFgLFtMfzBp5A6H2eaes1RLCur0spYhph0yyd8r1XwrN6gr/bwU5uvauU/Gn
	+N3puwUZD52WrQAnBwLEsfziAHua7Y3cpkfA+1doM+vEUOTToP2qavnMqNllPEXFH6YbxeWlOdPMS
	UXT2oH+CRDMvUxDf1XVnile/+qiN/WW5it07kfwhdn/+fEqMjiMQtVq3p4MZfmrgdlKGzDqLLm298
	9DKOHc6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQbwm-0000000EYec-14Yt;
	Thu, 26 Dec 2024 00:41:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQbvQ-0000000EYRs-40iB;
	Thu, 26 Dec 2024 00:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=u5llZW6P5VgqZyIbwE1Z+fO4Sf3FHIOkUoaY/KJnbH0=; b=Ae7hN19MSfO6dTUXPovA5cYOZq
	9MIc8rqO6cHgeSvlIMy30s9SAN+gxmLlLc+poD6UgHXt4SnDx3YDBZJgIlPHoqhsyK2H4bb+U4Ktq
	gWnZ+Vq2tCZkeSX+skuFExbd0WQPMPJfSHVND/k/bE4AEj+Kmu5kt7D1J71ThUmSO6zbyrcupkqec
	m1hzzJdjCQlJABCweRe5k41N3Wuo2jpm0SWMYlb/3qjq3V++j0h0+S3trnpYYLDkyJtgeHj/hWOIp
	kFD/Jrlfe1gEz0UjaeiiJFS3BplOJWiI7Jm2NCpMkogQYG7ICVfNwFfDv9OA85EEWJhNmQZmpUKvt
	zIP729Pg==;
Received: from i53875a54.versanet.de ([83.135.90.84] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tQbvI-0004PD-Ex; Thu, 26 Dec 2024 01:40:20 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Kever Yang <kever.yang@rock-chips.com>, Simon Xue <xxm@rock-chips.com>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 Krzysztof =?utf-8?B?V2lsY3p5xYRza2k=?= <kw@linux.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 01/17] dt-bindings: PCI: dwc: rockchip: Add rk3562 support
Date: Thu, 26 Dec 2024 01:40:19 +0100
Message-ID: <3522017.aeNJFYEL58@phil>
In-Reply-To: <20241224094920.3821861-2-kever.yang@rock-chips.com>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
 <20241224094920.3821861-2-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_164029_007272_93CB78FA 
X-CRM114-Status: GOOD (  14.57  )
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

Am Dienstag, 24. Dezember 2024, 10:49:04 CET schrieb Kever Yang:
> rk3562 is using the same controller as rk3568.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
> index 9a464731fa4a..dce6d68865c7 100644
> --- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
> @@ -26,6 +26,7 @@ properties:
>        - const: rockchip,rk3568-pcie
>        - items:
>            - enum:
> +              - rockchip,rk3562-pcie
>                - rockchip,rk3576-pcie
>                - rockchip,rk3588-pcie
>            - const: rockchip,rk3568-pcie
> 






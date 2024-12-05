Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD17EE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdsA3tpj1205+oRa1MPd5D6szg1T6A4Ap44HnR6cFe8=; b=WbYePQDWe1SgqlCxA3LRH/CUg6
	rx/ZOKpU+HO589VnHakrcNSt2rhsph0Xfcf2pT4qbNQlQT34yLdRBb6QoHnkBfuTyVWWjl5fXoT8c
	tTXfRiuTv026rxGEWhVFX5hGByi2ysTCSDqQ8sKu53NsqhUqBZTczODl2t6MiW0JZe+Vg5jm65QSU
	/qMW0DPj+cGDMf4TIFST9Y+ACWjCE5oRUL0MDNdfYlTQ1k7XP67FarFoDOo/1v6rsUc0N7yRnuGIU
	9ho4ddz5qW9Ol/8CQT/VIAe/zm7jUHTnG74cS+TbpLm8USTJHc88Gve3l4SJ23+oGv/JmMfs9Vm6A
	FdR/bNXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAHK-0000000Flf2-0BAc;
	Thu, 05 Dec 2024 11:44:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJA4F-0000000FjJB-1RGY;
	Thu, 05 Dec 2024 11:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bdsA3tpj1205+oRa1MPd5D6szg1T6A4Ap44HnR6cFe8=; b=YvjMYEIV2blJiDgrBxOgD4Jz3k
	zotERM0QMsg0WxDERATtIRFTnz6V/DSFyBCY62tXU7KnpVVcZRXYq2H1ZJ7xPk5koG5NAEhNpihrd
	AsS9tEoDCZ3SXywxaGVM1+E10xiGr6Nfv4lj+yQArNzHXEmpgLaCzafoaqb6gzpmx6xnxa23xL95S
	XXKEyK9UVkz2Xp3Ukc5/KMJbOz7Nf6Oi+AHr1PjMr/ELH5IC2OsVbD0mr4oJY2CtjTrlDC0+spCiz
	2RJR4yxBzTljLn5u2LlUc5iauommu0tIWMUCgIU7tnCnCEQ97/BcjA0G3LC/X8+pcp5mluFEqSJYd
	aju7IggA==;
Received: from i5e86190f.versanet.de ([94.134.25.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tJA44-0003Zj-Lv; Thu, 05 Dec 2024 12:30:36 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Kever Yang <kever.yang@rock-chips.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof =?utf-8?B?V2lsY3p5xYRza2k=?= <kw@linux.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 Simon Xue <xxm@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: PCI: dwc: rockchip: Add rk3576 support
Date: Thu, 05 Dec 2024 12:30:35 +0100
Message-ID: <49528886.MN2xkq1pzW@diego>
In-Reply-To: <20241205103623.878181-2-kever.yang@rock-chips.com>
References: <20241205103623.878181-1-kever.yang@rock-chips.com>
 <20241205103623.878181-2-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_033047_400317_274938ED 
X-CRM114-Status: GOOD (  14.85  )
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

Am Donnerstag, 5. Dezember 2024, 11:36:18 CET schrieb Kever Yang:
> rk3576 is using the same controller as rk3568.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
> 
>  Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
> index 550d8a684af3..5328ccad7130 100644
> --- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
> @@ -26,6 +26,7 @@ properties:
>        - const: rockchip,rk3568-pcie
>        - items:
>            - enum:
> +              - rockchip,rk3576-pcie
>                - rockchip,rk3588-pcie
>            - const: rockchip,rk3568-pcie
>  
> 





